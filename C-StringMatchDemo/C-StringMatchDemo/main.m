//
//  main.m
//  C-StringMatchDemo
//
//  Created by vanke on 2020/3/21.
//  Copyright © 2020 com. All rights reserved.
//

#import <Foundation/Foundation.h>



void matchStr(void);
void logStr(char *str);
void matchStr2(void);
int kmpMarch(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        matchStr2();
        
        //KMP模式匹配
       int index = kmpMarch();
        printf("indx:%d", index);
    }
    return 0;
}

void matchStr2(void)
{
    char *str1 = "HelloWorldHelhw";

    char *str2 = "Helh";
           long int i = 0;
           long int j = 0;
          
           char *p, *q;
           p = str1;
           q = str2;
           
           //用来记录下标
           int index = 0;
           char str[10] = {"0"};
           while (i < strlen(str1) && j < strlen(str2)) {
               if( *(p+i) == *(q+j) ){

                   *(str + j) = *(q+j);
                   i++;
                   j++;
                   index++;
                   
               }else{
                   i = i -j + 1;
                   j = 0;
                   index++;
               }
           }
           
           if(strcmp(str, str2) == 0){
               printf("匹配成功! 下标:%d, %s\n", index, str);
           }else{
               printf("匹配失败\n");
           }
}

void matchStr(void)
{
    char *str1 = "HelloWorldHelhw";
           char *str2 = "Helh";
           
           long int i = 0;
           long int j = 0;
          
           char *p, *q;
           p = str1;
           q = str2;
           
           //用来记录下标
           int index = 0;
           char str[10] = {"0"};
           while (i < strlen(str1) && j < strlen(str2)) {
               if( *(p+i) == *(q+j) ){

                   *(str + j) = *(q+j);
                   i++;
                   j++;
                   index++;
                   
               }else{
                   i++;
                   j = 0;
                   index++;
               }
           }
           
           if(strcmp(str, str2) == 0){
               printf("匹配成功! 下标:%d, %s\n", index, str);
           }else{
               printf("匹配失败\n");
           }
}

//遍历字符串
void logStr(char *str)
{
    long int n = strlen(str);
    for(int i = 0; i < n; i++)
    {
        printf("%c\n", str[i]);
    }
}


#pragma mark - KMP模式匹配算法

int * getNext(char *str)
{
//    char *string = str;
//    unsigned long length = strlen(string);
    static int next[4] = {0};
    *(next) = -1;
    int j = 0;
    int k = -1;
    while (j < strlen(str)) {
        if(k == -1 || *(str + j) == *(str + k))
        {
            j++;
            k++;
            *(next+j) = k;
        }
        else
        {
            k = *(next + k);
        }

    }
    return next;
}


int kmpMarch(void)
{
    char *tStr1 = "ABACABADIJK";
    char *pStr2 = "ABAD";
    
    int *arr = getNext(pStr2);
    for(int i = 0; i < 4; i++)
    {
        printf("arr:%d\n", *(arr + i));
    }
    
    int i = 0; //主串位置
    int j = 0; //模式串位置
    
    unsigned long n = strlen(tStr1);
    unsigned long m = strlen(pStr2);
    while (i < n && abs(j) < m) {
        char temp1 =  *(tStr1 + i);
        char temp2 =  *(pStr2 + j);
        if(j == -1 || temp1 == temp2)
        {
            i++;
            j++;
        }
        else
        {
            j = *(arr + j);
        }
    }
    
    if(j == strlen(pStr2))
    {
        return i - j;
    }
    else
    {
        return -1;
    }
}

