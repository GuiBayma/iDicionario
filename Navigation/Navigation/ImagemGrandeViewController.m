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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *previous = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(previous:)];
    self.navigationItem.leftBarButtonItem=previous;
    
    alfabeto = [Alfabeto sharedInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
    self.title = _letra.letra;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    NSString *path = [[NSBundle mainBundle] pathForResource:_letra.imagemLetra ofType:@"png"];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    [imageView setCenter:self.view.center];
    
    [UIView animateWithDuration:1.0
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^(void) {
                         imageView.frame = CGRectMake(0, 0, 300, 300);
                         [imageView setCenter:self.view.center];
                     }completion:nil];
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao
     setTitle:_letra.palavraLetra
     forState:UIControlStateNormal];
    [botao sizeToFit];
    [botao setCenter:CGPointMake(imageView.center.x, imageView.center.y+180)];
    
    [self.view addSubview:botao];
    [self.view addSubview:imageView];
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

@end