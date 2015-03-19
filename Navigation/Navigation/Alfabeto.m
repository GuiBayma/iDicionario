//
//  Alfabeto.m
//  Navigation
//
//  Created by Guilherme Bayma on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Alfabeto.h"
#import <Realm/Realm.h>

@implementation Alfabeto

static Alfabeto *Singleton = nil;
static bool isFirstAccess = NO;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        Singleton = [[super allocWithZone:NULL] init];
    });
    
    return Singleton;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"arvore" ofType:@"png"];
        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"bola" ofType:@"png"];
        NSString *path2 = [[NSBundle mainBundle] pathForResource:@"casa" ofType:@"png"];
        NSString *path3 = [[NSBundle mainBundle] pathForResource:@"dado" ofType:@"png"];
        NSString *path4 = [[NSBundle mainBundle] pathForResource:@"elefante" ofType:@"png"];
        NSString *path5 = [[NSBundle mainBundle] pathForResource:@"flor" ofType:@"png"];
        NSString *path6 = [[NSBundle mainBundle] pathForResource:@"galinha" ofType:@"png"];
        NSString *path7 = [[NSBundle mainBundle] pathForResource:@"hipopotamo" ofType:@"png"];
        NSString *path8 = [[NSBundle mainBundle] pathForResource:@"indio" ofType:@"png"];
        NSString *path9 = [[NSBundle mainBundle] pathForResource:@"jacare" ofType:@"png"];
        NSString *path10 = [[NSBundle mainBundle] pathForResource:@"kiwi" ofType:@"png"];
        NSString *path11= [[NSBundle mainBundle] pathForResource:@"lampada" ofType:@"png"];
        NSString *path12 = [[NSBundle mainBundle] pathForResource:@"maca" ofType:@"png"];
        NSString *path13 = [[NSBundle mainBundle] pathForResource:@"ninho" ofType:@"png"];
        NSString *path14 = [[NSBundle mainBundle] pathForResource:@"oculos" ofType:@"png"];
        NSString *path15 = [[NSBundle mainBundle] pathForResource:@"palhaco" ofType:@"png"];
        NSString *path16 = [[NSBundle mainBundle] pathForResource:@"queijo" ofType:@"png"];
        NSString *path17 = [[NSBundle mainBundle] pathForResource:@"relogio" ofType:@"png"];
        NSString *path18 = [[NSBundle mainBundle] pathForResource:@"sapo" ofType:@"png"];
        NSString *path19 = [[NSBundle mainBundle] pathForResource:@"tartaruga" ofType:@"png"];
        NSString *path20 = [[NSBundle mainBundle] pathForResource:@"urso" ofType:@"png"];
        NSString *path21 = [[NSBundle mainBundle] pathForResource:@"vaca" ofType:@"png"];
        NSString *path22 = [[NSBundle mainBundle] pathForResource:@"windsurf" ofType:@"png"];
        NSString *path23 = [[NSBundle mainBundle] pathForResource:@"xadrez" ofType:@"png"];
        NSString *path24 = [[NSBundle mainBundle] pathForResource:@"yoga" ofType:@"png"];
        NSString *path25 = [[NSBundle mainBundle] pathForResource:@"zebra" ofType:@"png"];
        
        _abecedario = [[NSMutableArray alloc] initWithObjects:
                       [[Letra alloc] initWithLetra:@"A" andImagem:path andPalavra:@"Árvore"],
                       [[Letra alloc] initWithLetra:@"B" andImagem:path1 andPalavra:@"Bola"],
                       [[Letra alloc] initWithLetra:@"C" andImagem:path2 andPalavra:@"Casa"],
                       [[Letra alloc] initWithLetra:@"D" andImagem:path3 andPalavra:@"Dado"],
                       [[Letra alloc] initWithLetra:@"E" andImagem:path4 andPalavra:@"Elefante"],
                       [[Letra alloc] initWithLetra:@"F" andImagem:path5 andPalavra:@"Flor"],
                       [[Letra alloc] initWithLetra:@"G" andImagem:path6 andPalavra:@"Galinha"],
                       [[Letra alloc] initWithLetra:@"H" andImagem:path7 andPalavra:@"Hipopótamo"],
                       [[Letra alloc] initWithLetra:@"I" andImagem:path8 andPalavra:@"Índio"],
                       [[Letra alloc] initWithLetra:@"J" andImagem:path9 andPalavra:@"Jacaré"],
                       [[Letra alloc] initWithLetra:@"K" andImagem:path10 andPalavra:@"Kiwi"],
                       [[Letra alloc] initWithLetra:@"L" andImagem:path11 andPalavra:@"Lâmpada"],
                       [[Letra alloc] initWithLetra:@"M" andImagem:path12 andPalavra:@"Maça"],
                       [[Letra alloc] initWithLetra:@"N" andImagem:path13 andPalavra:@"Ninho"],
                       [[Letra alloc] initWithLetra:@"O" andImagem:path14 andPalavra:@"Óculos"],
                       [[Letra alloc] initWithLetra:@"P" andImagem:path15 andPalavra:@"Palhaço"],
                       [[Letra alloc] initWithLetra:@"Q" andImagem:path16 andPalavra:@"Queijo"],
                       [[Letra alloc] initWithLetra:@"R" andImagem:path17 andPalavra:@"Relógio"],
                       [[Letra alloc] initWithLetra:@"S" andImagem:path18 andPalavra:@"Sapo"],
                       [[Letra alloc] initWithLetra:@"T" andImagem:path19 andPalavra:@"Tartaruga"],
                       [[Letra alloc] initWithLetra:@"U" andImagem:path20 andPalavra:@"Urso"],
                       [[Letra alloc] initWithLetra:@"V" andImagem:path21 andPalavra:@"Vaca"],
                       [[Letra alloc] initWithLetra:@"W" andImagem:path22 andPalavra:@"Windsurf"],
                       [[Letra alloc] initWithLetra:@"X" andImagem:path23 andPalavra:@"Xadrez"],
                       [[Letra alloc] initWithLetra:@"Y" andImagem:path24 andPalavra:@"Yoga"],
                       [[Letra alloc] initWithLetra:@"Z" andImagem:path25 andPalavra:@"Zebra"],
                       nil
                       ];
        _indice = 0;
        
    }
    return self;
}

-(Letra *)proximaLetra {
    _indice=(_indice+1)%26;
    Letra *proxima = [_abecedario objectAtIndex:_indice];
    return proxima;
}

-(Letra *)letraAnterior {
    _indice = (_indice+25)%26;
    Letra *anterior = [_abecedario objectAtIndex:_indice];
    return anterior;
}

-(void)alterarLetra:(Letra *)letra {
    [_abecedario replaceObjectAtIndex:_indice withObject:letra];
}

@end
