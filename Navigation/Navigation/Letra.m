//
//  Letra.m
//  Navigation
//
//  Created by Guilherme Bayma on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Letra.h"

@implementation Letra

-(instancetype)initWithLetra:(NSString *)letra andImagem:(UIImage *)imagem andPalavra:(NSString *)palavra {
    self = [super init];
    if (self) {
        _letra = letra;
        _imagemLetra = imagem;
        _palavraLetra = palavra;
    }
    return self;
}

@end
