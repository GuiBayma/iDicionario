//
//  ImagemGrandeViewController.m
//  Navigation
//
//  Created by Guilherme Bayma on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "ImagemGrandeViewController.h"

@implementation ImagemGrandeViewController {
    Alfabeto *alfabeto;
    UIImageView *imageView;
    UITextField *textfield;
    UILabel *palavra;
    CGPoint coordenadaInicialImagem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Criando uma toolbar em baixo da Navigation
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 65, self.view.bounds.size.width, 44)];
    [toolBar setBackgroundColor:[UIColor blackColor]];
    
    //Criando uma caixa de texto
    textfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*0.77, 27)];
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    textfield.placeholder = @"Mude a palavra!";
    textfield.autocorrectionType = UITextAutocorrectionTypeNo;
    textfield.keyboardType = UIKeyboardTypeDefault;
    textfield.returnKeyType = UIReturnKeyDone;
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;

    //transformando a caixa de texto em um BarButtonItem
    UIBarButtonItem *textBar = [[UIBarButtonItem alloc] initWithCustomView:textfield];
    
    //Criando um botao de camera para selecionar uma foto
    UIBarButtonItem *mudarFoto = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(alterarFoto)];
    
    //colocando a caixa de texto e o botao da camera dentro da toolbar
    [toolBar setItems:@[textBar, mudarFoto]];
    
    //Criando botoes de avancar e retroceder as views no Navigation
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *previous = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(previous:)];
    self.navigationItem.leftBarButtonItem=previous;
    
    //Setando o delegate da caixa de texto como a view exibida
    textfield.delegate = self;
    
    //Iniciando/recuperando a instancia de Alfabeto
    alfabeto = [Alfabeto sharedInstance];
    
    //Adicionando a tool bar na view
    [self.view addSubview:toolBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
    //Titulo da view
    self.navigationItem.title = _letra.letra;
    
    //Criando uma ImageView e habilitando gestos em sua imagem
    imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageWithContentsOfFile:_letra.imagemLetra];
    [imageView setCenter:self.view.center];
    imageView.userInteractionEnabled = YES;
    UIPinchGestureRecognizer *pgr = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pgr.delegate = self;
    [imageView addGestureRecognizer:pgr];
    
    //Adicionando animaçao a imagem
    [UIView animateWithDuration:0.8
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^(void) {
                         imageView.frame = CGRectMake(0, 0, 150, 150);
                         [imageView setCenter:self.view.center];
                     }completion:nil];
    
    //Criando uma Label
    palavra = [[UILabel alloc] init];
    palavra.text = _letra.palavraLetra;
    palavra.font = [UIFont systemFontOfSize:25];
    [palavra sizeToFit];
    [palavra setCenter:CGPointMake(imageView.center.x, imageView.center.y+180)];
    
    //Adicionando a imageView e a Label na view
    [self.view addSubview:palavra];
    [self.view addSubview:imageView];
}

//Para que a proxima imagem nao sobreponha a anterior
-(void) viewWillDisappear:(BOOL)animated {
    imageView.image = nil;
}

//Metodo para exibir a proxima letra
-(void)next:(id)sender {
    ImagemGrandeViewController *igvc = [[ImagemGrandeViewController alloc] init];
    igvc.letra = [alfabeto proximaLetra];
    NSMutableArray *views = [self.navigationController.viewControllers mutableCopy];
    if ([views count] > 1) {
        [views removeObjectAtIndex:0];
        [self.navigationController setViewControllers:(NSArray *)views];
    }
    [self.navigationController pushViewController:igvc animated:NO];
    
//    Código que "resolveria" tudo:
//    [self.navigationController setViewControllers:@[igvc]];
}

//Metodo para exibir a letra anterior
-(void)previous:(id)sender {
    ImagemGrandeViewController *igvc = [[ImagemGrandeViewController alloc] init];
    igvc.letra = [alfabeto letraAnterior];
    [self.navigationController setViewControllers:@[igvc,self]];
    [self.navigationController popViewControllerAnimated:NO];
}

//Detecta o pressionamento da tecla "retorno" na caixa de texto
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self mudarNome];
    return NO;
}

//Muda o texto da Label ao apertar "retorno" na caixa de texto
-(void) mudarNome {
    if (![textfield.text  isEqual: @""]) {
        palavra.text = textfield.text;
        _letra.palavraLetra = textfield.text;
        [alfabeto alterarLetra:_letra];
        textfield.text = @"";
        [palavra sizeToFit];
        [palavra setCenter:CGPointMake(imageView.center.x, imageView.center.y+180)];
    }
    [textfield resignFirstResponder];
}

//Metodo que apresenta o ImagePicker, para selecionar uma foto
- (void) alterarFoto {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}

//Ao selecionar uma foto no ImagePicker, este metodo exibe a foto escolhida
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *imagemSelecionada = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    NSString *fileName = [NSString stringWithFormat:@"%ld.jpg", (long)alfabeto.indice];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths firstObject] stringByAppendingPathComponent:fileName];
    
    //[UIImagePNGRepresentation(imagemSelecionada) writeToFile:filePath atomically:YES];
    [UIImageJPEGRepresentation((imagemSelecionada), 10.0) writeToFile:filePath atomically:YES];
    
    _letra.imagemLetra = filePath;
    [alfabeto alterarLetra:_letra];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//Tratamento do gesto pinça na imagem exibida
- (void)pinch:(UIPinchGestureRecognizer *)gesture {
    gesture.view.transform = CGAffineTransformScale(gesture.view.transform, gesture.scale, gesture.scale);
    gesture.scale = 1;
}

//Esconde o teclado da caixa de texto
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [textfield resignFirstResponder];
}

//Muda a posiçao da imagem ao arrastar o dedo sobre ela
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *toque = [touches anyObject];
    if ([toque view] == imageView) {
        CGPoint coordenadaToque = [toque locationInView:self.view];
        [UIView animateWithDuration:0.1
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^(void) {
                             //imageView.frame = CGRectMake(0, 0, 150, 150);
                             [imageView setCenter:coordenadaToque];
                         }completion:nil];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
}

@end