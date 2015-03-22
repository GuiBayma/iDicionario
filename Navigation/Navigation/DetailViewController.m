//
//  DetailViewController.m
//  Navigation
//
//  Created by Guilherme Bayma on 3/19/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

/*
 * Esta view exibe a palavra pesquisada, com sua imagem e letra
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _letra.letra;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.image = [UIImage imageWithContentsOfFile:_letra.imagemLetra];
    [imageView setCenter:self.view.center];
    
    UILabel *palavra = [[UILabel alloc] init];
    palavra.text = _letra.palavraLetra;
    palavra.font = [UIFont systemFontOfSize:25];
    [palavra sizeToFit];
    [palavra setCenter:CGPointMake(imageView.center.x, imageView.center.y+150)];
    
    [self.view addSubview:imageView];
    [self.view addSubview:palavra];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
