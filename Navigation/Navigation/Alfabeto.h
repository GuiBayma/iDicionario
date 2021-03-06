//
//  Alfabeto.h
//  Navigation
//
//  Created by Guilherme Bayma on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Letra.h"

@interface Alfabeto : NSObject

@property NSMutableArray *abecedario;
@property NSInteger indice;
+(instancetype)sharedInstance;
-(Letra *) proximaLetra;
-(Letra *) letraAnterior;
-(void) alterarLetra: (Letra *)letra;
-(Letra *) buscaPalavra:(NSString *)palavra;

@end
