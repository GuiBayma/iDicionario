//
//  DicionarioViewController.m
//  Navigation
//
//  Created by Guilherme Bayma on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "DicionarioViewController.h"


@implementation DicionarioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _letra.letra;
    if (![_letra.letra isEqualToString:@"Z"]) {
        UIBarButtonItem *next = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
        self.navigationItem.rightBarButtonItem=next;
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    imageView.image = _letra.imagemLetra;
    [imageView setCenter:self.view.center];
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao
     setTitle:_letra.palavraLetra
     forState:UIControlStateNormal];
    [botao sizeToFit];
    [botao setCenter:CGPointMake(imageView.center.x, imageView.center.y+180)];
    //botao.center = self.view.center;
    
    [self.view addSubview:botao];
    [self.view addSubview:imageView];
    
    _alfabeto = [Alfabeto sharedInstance];
}


-(void)next:(id)sender {
    DicionarioViewController *proximo = [[DicionarioViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    proximo.letra = [_alfabeto proximaLetra];
    [self.navigationController pushViewController:proximo
                                         animated:YES];
}

@end
