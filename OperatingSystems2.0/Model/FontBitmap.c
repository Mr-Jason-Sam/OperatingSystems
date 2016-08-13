//
//  FontBitmap.c
//  Operating_Systems 2.0
//
//  Created by apple on 16/8/7.
//  Copyright © 2016年 null. All rights reserved.
//

#include "FontBitmap.h"

//find font store
int loadAsc(char* filePath)
{
    FILE *fp;
    
    
    fp = fopen(filePath, "rb");
    if (fp == NULL)
    {
        printf ("read ASC16 file failed!");
        return 0;
    }
    
    fread(fontAsc, 1, 4096, fp);
    fclose(fp);
    
    
    return 1;
}

//match char and bitmap
int* bitmapDate(char character, char* path)
{
    loadAsc(path);
    unsigned char *location = fontAsc + (int)character * 16;
    
    for (int row = 0; row < 16; row++)
    {
        unsigned char testBit = 128;
        for (int column = 0; column < 8; column++)
        {
            if (*location & testBit)
                bitmap[row*8+column] = 1;
            else
                bitmap[row*8+column] = 0;
            
            testBit >>= 1;
        }
        
        location++;
    }
    
    return bitmap;
}

