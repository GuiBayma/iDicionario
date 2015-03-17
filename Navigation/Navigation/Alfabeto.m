//
//  Alfabeto.m
//  Navigation
//
//  Created by Guilherme Bayma on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Alfabeto.h"

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
        
        _abecedario = [[NSArray alloc] initWithObjects:
                       [[Letra alloc] initWithLetra:@"A" andImagem:@"arvore" andPalavra:@"Árvore"],
                       [[Letra alloc] initWithLetra:@"B" andImagem:@"bola" andPalavra:@"Bola"],
                       [[Letra alloc] initWithLetra:@"C" andImagem:@"casa" andPalavra:@"Casa"],
                       [[Letra alloc] initWithLetra:@"D" andImagem:@"dado" andPalavra:@"Dado"],
                       [[Letra alloc] initWithLetra:@"E" andImagem:@"elefante" andPalavra:@"Elefante"],
                       [[Letra alloc] initWithLetra:@"F" andImagem:@"flor" andPalavra:@"Flor"],
                       [[Letra alloc] initWithLetra:@"G" andImagem:@"galinha" andPalavra:@"Galinha"],
                       [[Letra alloc] initWithLetra:@"H" andImagem:@"hipopotamo" andPalavra:@"Hipopótamo"],
                       [[Letra alloc] initWithLetra:@"I" andImagem:@"indio" andPalavra:@"Índio"],
                       [[Letra alloc] initWithLetra:@"J" andImagem:@"jacare" andPalavra:@"Jacaré"],
                       [[Letra alloc] initWithLetra:@"K" andImagem:@"kiwi" andPalavra:@"Kiwi"],
                       [[Letra alloc] initWithLetra:@"L" andImagem:@"lampada" andPalavra:@"Lâmpada"],
                       [[Letra alloc] initWithLetra:@"M" andImagem:@"maca" andPalavra:@"Maça"],
                       [[Letra alloc] initWithLetra:@"N" andImagem:@"ninho" andPalavra:@"Ninho"],
                       [[Letra alloc] initWithLetra:@"O" andImagem:@"oculos" andPalavra:@"Óculos"],
                       [[Letra alloc] initWithLetra:@"P" andImagem:@"palhaco" andPalavra:@"Palhaço"],
                       [[Letra alloc] initWithLetra:@"Q" andImagem:@"queijo" andPalavra:@"Queijo"],
                       [[Letra alloc] initWithLetra:@"R" andImagem:@"relogio" andPalavra:@"Relógio"],
                       [[Letra alloc] initWithLetra:@"S" andImagem:@"sapo" andPalavra:@"Sapo"],
                       [[Letra alloc] initWithLetra:@"T" andImagem:@"tartaruga" andPalavra:@"Tartaruga"],
                       [[Letra alloc] initWithLetra:@"U" andImagem:@"urso" andPalavra:@"Urso"],
                       [[Letra alloc] initWithLetra:@"V" andImagem:@"vaca" andPalavra:@"Vaca"],
                       [[Letra alloc] initWithLetra:@"W" andImagem:@"windsurf" andPalavra:@"Windsurf"],
                       [[Letra alloc] initWithLetra:@"X" andImagem:@"xadrez" andPalavra:@"Xadrez"],
                       [[Letra alloc] initWithLetra:@"Y" andImagem:@"yoga" andPalavra:@"Yoga"],
                       [[Letra alloc] initWithLetra:@"Z" andImagem:@"zebra" andPalavra:@"Zebra"],
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

@end
