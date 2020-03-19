//
//  main.m
//  C-StackDemo
//
//  Created by Evan on 2020/3/17.
//  Copyright © 2020 Evan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define STACK_SIZE 100 //栈初始大小
#define STACKINCREMENT 10 //储存空间分配增量



typedef int ElemType;
typedef struct sqstack
{
    ElemType *bottom;
    ElemType *top;
    int stackSize;
} SqStack;

void seqStack_init(SqStack *stack, int stack_size);
bool seqStack_full(SqStack *stack);
bool seqStack_empty(SqStack *stack);
void seqStack_push(SqStack *stack, int length, ElemType e);
ElemType seqStack_pop(SqStack *stack);
void seqStack_destroy(SqStack *stack);

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        int i = 0;
//        int num = 0;
//        int value = 0;
        
        //在栈中为结构体分配空间
//        SqStack stack;
//        SqStack *p_stack = &stack;
        
    }
    return 0;
}

//init stack
/*
 * stack:指向结构体指针 stack_size:栈初始大小
 */
void seqStack_init(SqStack *stack, int stack_size)
{
    stack->bottom = (ElemType *)malloc(stack_size * sizeof(ElemType));
    if(stack->bottom == NULL) {
        printf("动态分配内存错误");
        exit(-1);
    };
    stack->top = stack->bottom;
    stack->stackSize = stack_size;
}


/*
* stack:指向结构体指针 stack_size:栈初始大小
* 返回值:1为满， 0为非满
*/
bool seqStack_full(SqStack *stack)
{
    return stack->top - stack->bottom >= stack->stackSize;
}

/*
* stack:指向结构体指针 stack_size:栈初始大小
* 返回值:1为空， 0为非空
*/
bool seqStack_empty(SqStack *stack)
{
    return stack->top <= stack->bottom;
}

/*
 * 压栈
 * stack:为指向结构体指针
 * length为将要压栈的数据个数
 * value:为将要压栈的数值
 */
void seqStack_push(SqStack *stack, int length, ElemType value)
{
    ElemType *tmp = stack->bottom;
    if(seqStack_full(stack)){
        printf("栈已满，系统将为其增加空间！\n");
        stack->bottom = (ElemType *)realloc(stack->bottom,  length*sizeof(ElemType));
        
        if(!stack->bottom){
            free(tmp);
            return;
        }
        
        stack->stackSize += length;
    }
    *stack->top = value;
    stack->top++;
    return;
}

/*
 * 出栈
 * stack:指向结构体指针
 * value:出栈数据
 */
ElemType seqStack_pop(SqStack *stack){
    
    ElemType value = 0;
    if(seqStack_empty(stack))
    {
        printf("栈已空\n");
        exit(-1);
    }
    
//    value = *(stack->top--);
    stack->top--;
    value = *stack->top;
    return value;
}

void seqStack_destroy(SqStack *stack)
{
    free(stack->bottom);
    free(stack);
    stack->stackSize = 0;
    stack->bottom = NULL;
    stack->top = NULL;
    stack = NULL;
}
