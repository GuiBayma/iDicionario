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
                       [[Letra alloc] initWithLetra:@"B" andImagem:[UIImage imageNamed:@"bola.png"] andPalavra:@"Bola"],
                       [[Letra alloc] initWithLetra:@"C" andImagem:[UIImage imageNamed:@"casa.png"] andPalavra:@"Casa"],
                       [[Letra alloc] initWithLetra:@"D" andImagem:[UIImage imageNamed:@"dado.png"] andPalavra:@"Dado"],
                       [[Letra alloc] initWithLetra:@"E" andImagem:[UIImage imageNamed:@"elefante.png"] andPalavra:@"Elefante"],
                       [[Letra alloc] initWithLetra:@"F" andImagem:[UIImage imageNamed:@"flor.png"] andPalavra:@"Flor"],
                       [[Letra alloc] initWithLetra:@"G" andImagem:[UIImage imageNamed:@"galinha.png"] andPalavra:@"Galinha"],
                       [[Letra alloc] initWithLetra:@"H" andImagem:[UIImage imageNamed:@"hipopotamo.png"] andPalavra:@"Hipopótamo"],
                       [[Letra alloc] initWithLetra:@"I" andImagem:[UIImage imageNamed:@"indio.png"] andPalavra:@"Índio"],
                       [[Letra alloc] initWithLetra:@"J" andImagem:[UIImage imageNamed:@"jacare.png"] andPalavra:@"Jacaré"],
                       [[Letra alloc] initWithLetra:@"K" andImagem:[UIImage imageNamed:@"kiwi.png"] andPalavra:@"Kiwi"],
                       [[Letra alloc] initWithLetra:@"L" andImagem:[UIImage imageNamed:@"lampada.png"] andPalavra:@"Lâmpada"],
                       [[Letra alloc] initWithLetra:@"M" andImagem:[UIImage imageNamed:@"maca.png"] andPalavra:@"Maça"],
                       [[Letra alloc] initWithLetra:@"N" andImagem:[UIImage imageNamed:@"ninho.png"] andPalavra:@"Ninho"],
                       [[Letra alloc] initWithLetra:@"O" andImagem:[UIImage imageNamed:@"oculos.png"] andPalavra:@"Óculos"],
                       [[Letra alloc] initWithLetra:@"P" andImagem:[UIImage imageNamed:@"palhaco.png"] andPalavra:@"Palhaço"],
                       [[Letra alloc] initWithLetra:@"Q" andImagem:[UIImage imageNamed:@"queijo.png"] andPalavra:@"Queijo"],
                       [[Letra alloc] initWithLetra:@"R" andImagem:[UIImage imageNamed:@"relogio.png"] andPalavra:@"Relógio"],
                       [[Letra alloc] initWithLetra:@"S" andImagem:[UIImage imageNamed:@"sapo.png"] andPalavra:@"Sapo"],
                       [[Letra alloc] initWithLetra:@"T" andImagem:[UIImage imageNamed:@"tartaruga.png"] andPalavra:@"Tartaruga"],
                       [[Letra alloc] initWithLetra:@"U" andImagem:[UIImage imageNamed:@"urso.png"] andPalavra:@"Urso"],
                       [[Letra alloc] initWithLetra:@"V" andImagem:[UIImage imageNamed:@"vaca.png"] andPalavra:@"Vaca"],
                       [[Letra alloc] initWithLetra:@"W" andImagem:[UIImage imageNamed:@"windsurf.png"] andPalavra:@"Windsurf"],
                       [[Letra alloc] initWithLetra:@"X" andImagem:[UIImage imageNamed:@"xadrez.png"] andPalavra:@"Xadrez"],
                       [[Letra alloc] initWithLetra:@"Y" andImagem:[UIImage imageNamed:@"yoga.png"] andPalavra:@"Yoga"],
                       [[Letra alloc] initWithLetra:@"Z" andImagem:[UIImage imageNamed:@"zebra.png"] andPalavra:@"Zebra"],
                       nil
                       ];
        _indice = 0;
        
    }
    return self;
}

-(Letra *)proximaLetra {
    Letra *proxima = [_abecedario objectAtIndex:_indice];
    _indice++;
    return proxima;
}

@end
