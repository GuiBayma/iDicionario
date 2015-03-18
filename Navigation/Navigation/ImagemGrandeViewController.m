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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, 44)];
    [toolBar setBackgroundColor:[UIColor blackColor]];
    textfield.delegate = self;
    textfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width*0.70, 27)];
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    textfield.placeholder = @"Mude a palavra!";
    textfield.autocorrectionType = UITextAutocorrectionTypeNo;
    textfield.keyboardType = UIKeyboardTypeDefault;
    textfield.returnKeyType = UIReturnKeyDone;
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

    UIBarButtonItem *textBar = [[UIBarButtonItem alloc] initWithCustomView:textfield];
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(mudarNome)];
    [toolBar setItems:@[textBar, bbi]];
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *previous = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(previous:)];
    self.navigationItem.leftBarButtonItem=previous;
    
    textfield.delegate = self;
    alfabeto = [Alfabeto sharedInstance];
    [self.view addSubview:toolBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.tabBarItem.title = @"Navegaçāo";
    self.navigationItem.title = _letra.letra;
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
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
    
    palavra = [[UILabel alloc] init];
    palavra.text = _letra.palavraLetra;
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
    palavra.text = textfield.text;
    [palavra sizeToFit];
    [palavra setCenter:CGPointMake(imageView.center.x, imageView.center.y+180)];
    [textfield resignFirstResponder];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [textfield resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self mudarNome];
    return NO;
}

@end