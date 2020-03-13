//
//  main.m
//  C-Demos
//
//  Created by Evan on 2020/3/12.
//  Copyright © 2020 Evan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int ElemType;
typedef double  ElemType1;


//定义一个节点
typedef struct Node
{
    ElemType data;       //这里默认的是int型，如需其他类型可修改
    struct Node *next;   //指向Node型变量的指针
} LNode;





LNode *create_linkList_head(void);
void printLNode(LNode *node);
LNode *create_linkList_tail(void);
void changeNodeValue(LNode *L, int n);
void deleteNode(LNode *L, int n);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
                
//        int num1;
//        scanf("%i",&num1);
//        printf("%d\n", num1);
        
        //创建一个单链表 从头部插入
//        LNode *node = create_linkList_head();
//        printLNode(node);
        
        //创建一个单链表 从尾部插入
        LNode *node1 = create_linkList_tail();
//        printLNode(node1);
        
        //修改某个结点的值
//        changeNodeValue(node1, 2);
//        printLNode(node1);

        //删除某个结点的值
        
        deleteNode(node1, 2);
        printLNode(node1);

    }
    return 0;
}

//创建一个单链表 动态分配空间   从头节点插入
//先让P指向头节点的后驱，然后让头节点指向P
LNode *create_linkList_head(void)
{
    int data;
    LNode *head, *node, *end;
    head = (LNode *)malloc(sizeof(LNode));
    end = head;
    
    for(int i = 0; i < 2; i++){
        data = i * 2;
        node = (LNode *)malloc(sizeof(LNode));
        node->data = data;
        
        node->next = head->next; //指向第一个结点
        head->next = node;
        
        if(i == 1){
            end = node;
            end->next = NULL;
        }
    }
    return head;
}

//创建一个单链表 动态分配空间   从头节点插入
//先让P指向头节点的后驱，然后让头节点指向P
LNode *create_linkList_tail(void)
{
    
    int data;
    LNode *head, *node, *end;
    head = end = (LNode *)malloc(sizeof(LNode)); //头结点和尾结点一样，空链表
    
    for(int i = 0; i < 10; i++){
        
        data = i * 2;
        node = (LNode *)malloc(sizeof(LNode));
        node->data = data;
        
        //把最后一个节点的指针域的地址 给 新节点的指针域
        node->next = end->next;
        //把新的尾节点的地址 给 原来的尾结点
        end->next = node;
        
        //end往后移
        end = node;
    }
    
    end->next = NULL; //结束创建
    return head;
}

//修改链表的值
void changeNodeValue(LNode *L, int n)
{
    LNode *node = L;
    int i = 0;
    while (node != NULL && i < n) {
        node = node ->next;
        i++;
    }
    
    if(node != NULL){
        puts("请输入要修改的值");
        scanf("%d", &node->data);
        puts("修改成功");

    }else{
        puts("节点不存在");
    }
}

//删除链表中的值 删除第N个结点
void deleteNode(LNode *L, int n){
    
    LNode *node = L;
    LNode *p = L;
    
    int i = 0;
    while (node != NULL && i < n) {
        p = node;
        node = node->next;
        i++;
    }
    
    if(node != NULL){
        //删除操作
        p->next = node->next;
        free(node);
    }else{
        puts("节点不存在");
    }
}




//打印链表
void printLNode(LNode *L)
{
    LNode *p = L;
    while (p != NULL && p->next != NULL) {

        p = p->next;
        printf("data:%d\n", p->data);

    }
}
