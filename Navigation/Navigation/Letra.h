//
//  Letra.h
//  Navigation
//
//  Created by Guilherme Bayma on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Letra : NSObject

@property NSString *letra;
@property UIImage *imagemLetra;
@property NSString *palavraLetra;
- (instancetype)initWithLetra:(NSString *)letra andImagem:(UIImage *)imagem andPalavra:(NSString *)palavra;

@end
