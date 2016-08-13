//
//  FontBitmap.h
//  Operating_Systems 2.0
//
//  Created by apple on 16/8/7.
//  Copyright © 2016年 null. All rights reserved.
//

#ifndef FontBitmap_h
#define FontBitmap_h

#include <stdio.h>
//ASC16 has 4096 char

const int CHAR_NUMBER = 4096;

const int BITMAP_NUMBER = 128;

unsigned char fontAsc[CHAR_NUMBER];

int bitmap[BITMAP_NUMBER];

int* bitmapDate(char, char*);


#endif /* FontBitmap_h */
