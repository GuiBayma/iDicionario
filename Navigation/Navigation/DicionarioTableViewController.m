//
//  DicionarioTableViewController.m
//  Navigation
//
//  Created by Guilherme Bayma on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "DicionarioTableViewController.h"


@implementation DicionarioTableViewController {
    Alfabeto *alfabeto;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    alfabeto = [Alfabeto sharedInstance];
    self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0, 49.0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [alfabeto.abecedario count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"celulaPadrao"];
    Letra *letra = [alfabeto.abecedario objectAtIndex:indexPath.row];
    
    cell.textLabel.text = letra.letra;
    cell.detailTextLabel.text = letra.palavraLetra;
    NSString *path = [[NSBundle mainBundle] pathForResource:letra.imagemLetra ofType:@"png"];
    [cell.imageView setImage:[UIImage imageWithContentsOfFile:path]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

@end
