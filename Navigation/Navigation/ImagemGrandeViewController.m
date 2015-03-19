//
//  ImagemGrandeViewController.m
//  Navigation
//
//  Created by Guilherme Bayma on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "ImagemGrandeViewController.h"
#import <Realm/Realm.h>

@implementation ImagemGrandeViewController {
    Alfabeto *alfabeto;
    UIImageView *imageView;
    UITextField *textfield;
    UILabel *palavra;
    BOOL moveu;
    CGPoint coordenadaInicialImagem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 65, self.view.bounds.size.width, 44)];
    [toolBar setBackgroundColor:[UIColor blackColor]];
    textfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*0.77, 27)];
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    textfield.placeholder = @"Mude a palavra!";
    textfield.autocorrectionType = UITextAutocorrectionTypeNo;
    textfield.keyboardType = UIKeyboardTypeDefault;
    textfield.returnKeyType = UIReturnKeyDone;
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;

    UIBarButtonItem *textBar = [[UIBarButtonItem alloc] initWithCustomView:textfield];
    UIBarButtonItem *mudarFoto = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(alterarFoto)];
    [toolBar setItems:@[textBar, mudarFoto]];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *previous = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(previous:)];
    self.navigationItem.leftBarButtonItem=previous;
    
    textfield.delegate = self;
    alfabeto = [Alfabeto sharedInstance];
    [self.view addSubview:toolBar];
    
    moveu = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationItem.title = _letra.letra;
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    //NSString *path = [[NSBundle mainBundle] pathForResource:_letra.imagemLetra ofType:@"png"];
    imageView.image = [UIImage imageWithContentsOfFile:_letra.imagemLetra];
    [imageView setCenter:self.view.center];
    imageView.userInteractionEnabled = YES;
    
    [UIView animateWithDuration:0.8
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^(void) {
                         imageView.frame = CGRectMake(0, 0, 150, 150);
                         [imageView setCenter:self.view.center];
                     }completion:nil];
    
    palavra = [[UILabel alloc] init];
    palavra.text = _letra.palavraLetra;
    palavra.font = [UIFont systemFontOfSize:25];
    [palavra sizeToFit];
    [palavra setCenter:CGPointMake(imageView.center.x, imageView.center.y+180)];
    
    [self.view addSubview:palavra];
    [self.view addSubview:imageView];
}

-(void) viewWillDisappear:(BOOL)animated {
    imageView.image = nil;
}

-(void)next:(id)sender {
    ImagemGrandeViewController *igvc = [[ImagemGrandeViewController alloc] init];
    igvc.letra = [alfabeto proximaLetra];
    NSMutableArray *views = [self.navigationController.viewControllers mutableCopy];
    if ([views count] > 1) {
        [views removeObjectAtIndex:0];
        [self.navigationController setViewControllers:(NSArray *)views];
    }
    [self.navigationController pushViewController:igvc animated:NO];
    
//    Código que resolve tudo:
//    [self.navigationController setViewControllers:@[igvc]];
}

-(void)previous:(id)sender {
    ImagemGrandeViewController *igvc = [[ImagemGrandeViewController alloc] init];
    igvc.letra = [alfabeto letraAnterior];
    [self.navigationController setViewControllers:@[igvc,self]];
    [self.navigationController popViewControllerAnimated:NO];
}

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

- (void) alterarFoto {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}

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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [textfield resignFirstResponder];
    UITouch *toque = [touches anyObject];
    coordenadaInicialImagem = imageView.center;
    if ([toque view] == imageView) {
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^(void) {
                             imageView.frame = CGRectMake(0, 0, 300, 300);
                             [imageView setCenter:self.view.center];
                         }completion:nil];
        [self.view setBackgroundColor:[UIColor grayColor]];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    moveu = YES;
    UITouch *toque = [touches anyObject];
    if ([toque view] == imageView) {
        CGPoint coordenadaToque = [toque locationInView:self.view];
        [UIView animateWithDuration:0
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^(void) {
                             imageView.frame = CGRectMake(0, 0, 150, 150);
                             [imageView setCenter:coordenadaToque];
                         }completion:nil];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *toque = [touches anyObject];
    if ([toque view] == imageView) {
        if (moveu) {
            CGPoint coordenadaToque = [toque locationInView:self.view];
            [UIView animateWithDuration:0.2
                                  delay:0
                                options:UIViewAnimationOptionCurveLinear
                             animations:^(void) {
                                 imageView.frame = CGRectMake(0, 0, 150, 150);
                                 [imageView setCenter:coordenadaToque];
                             }completion:nil];
        }
        else {
            [UIView animateWithDuration:0.2
                                  delay:0
                                options:UIViewAnimationOptionCurveLinear
                             animations:^(void) {
                                 imageView.frame = CGRectMake(0, 0, 150, 150);
                                 [imageView setCenter:coordenadaInicialImagem];
                             }completion:nil];
        }
        [self.view setBackgroundColor:[UIColor whiteColor]];
        moveu = NO;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self mudarNome];
    return NO;
}

@end