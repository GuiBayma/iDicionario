//
//  BuscaViewController.m
//  Navigation
//
//  Created by Guilherme Bayma on 3/19/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "BuscaViewController.h"
#import "Alfabeto.h"
#import "DetailViewController.h"

@implementation BuscaViewController {
    Alfabeto *alfabeto;
    UITextField *textfield;
    UIImageView *imagem;
    UILabel *menssagem;
}

/*
 * Esta view exibe uma imagem e uma caia de texto para procurar alguma palavra contida no vetor da classe
 * Alfabeto. Caso a palavra esteja no vetor, é criada uma view para exibi-la. Caso contrário inicia-se uma
 * animaçao e é exibida uma label informando que a palavra nao foi encontrada.
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    alfabeto = [Alfabeto sharedInstance];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.center.y-50, self.view.bounds.size.width, 44)];
    [toolBar setBackgroundColor:[UIColor blackColor]];
    textfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*0.9, 27)];
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    textfield.placeholder = @"           Busque uma palavra";
    textfield.autocorrectionType = UITextAutocorrectionTypeNo;
    textfield.keyboardType = UIKeyboardTypeDefault;
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    UIBarButtonItem *textBar = [[UIBarButtonItem alloc] initWithCustomView:textfield];
    [toolBar setItems:@[textBar]];
    
    imagem = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x-50, self.view.center.y-200, 100, 100)];
    imagem.image=[UIImage imageNamed:@"notebook-104.png"];
    
    menssagem = [[UILabel alloc] init];
    menssagem.text = @"Palavra não encontrada!";
    [menssagem sizeToFit];
    menssagem.center = CGPointMake(self.view.center.x, self.view.center.y-80);
    menssagem.alpha = 0;
    
    textfield.delegate = self;
    [self.view addSubview:toolBar];
    [self.view addSubview:imagem];
    [self.view addSubview:menssagem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) pesquisar {
    if (![textfield.text isEqualToString:@""]) {
        Letra *letra = [alfabeto buscaPalavra:textfield.text];
        if (letra != nil) {
            [self encontrou:letra];
        }
        else {
            [self naoEncontrou];
        }
    }
}

-(void) encontrou:(Letra*)letra {
    DetailViewController *dvc = [[DetailViewController alloc] init];
    dvc.letra = letra;
    textfield.text = @"";
    [self.navigationController pushViewController:dvc animated:YES];
}

-(void) naoEncontrou {
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         imagem.frame = CGRectMake(self.view.center.x-150, self.view.center.y-200, 100, 100);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2
                                               delay:0
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              imagem.frame = CGRectMake(self.view.center.x+50, self.view.center.y-200, 100, 100);
                                          } completion:^(BOOL finished) {
                                              [UIView animateWithDuration:0.2
                                                                    delay:0
                                                                  options:UIViewAnimationOptionCurveEaseIn
                                                               animations:^{
                                                                   imagem.frame = CGRectMake(self.view.center.x-100, self.view.center.y-200, 100, 100);
                                                               } completion:^(BOOL finished) {
                                                                   [UIView animateWithDuration:0.2
                                                                                         delay:0
                                                                                       options:UIViewAnimationOptionCurveEaseIn
                                                                                    animations:^{
                                                                                        imagem.frame = CGRectMake(self.view.center.x-50, self.view.center.y-200, 100, 100);
                                                                                    } completion:nil
                                                                    ];
                                                               }];
                                          }];
                     }];
    
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         menssagem.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5
                                               delay:1.2
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              menssagem.alpha = 0;
                                          } completion:nil];
                     }];
    
    textfield.text = @"";
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textfield resignFirstResponder];
    [self pesquisar];
    return NO;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [textfield resignFirstResponder];
}

@end
