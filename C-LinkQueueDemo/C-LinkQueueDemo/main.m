//
//  main.m
//  C-LinkQueueDemo
//
//  Created by Evan on 2020/3/19.
//  Copyright © 2020 Evan. All rights reserved.
//
//链队列
#import <Foundation/Foundation.h>

typedef int ElemType ;

typedef struct Node
{
    ElemType data;
    struct Node *next;
} QNode;

typedef struct link_queue
{
    QNode *rear;
    QNode *front;
} Link_Queue;

//初始化
Link_Queue *init_linkQueue(void);

//插入元素
void insert_CirQueue(Link_Queue *queue, ElemType data);

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
    }
    return 0;
}

//表头删除操作，表尾进行插入操作的单链表
Link_Queue *init_linkQueue(void)
{
    Link_Queue *queue;
    QNode *pNode;
    //开辟头结点
    pNode = (QNode *)malloc(sizeof(QNode));
    pNode->next = NULL;
    
    //开辟链队的指针结点
    queue  = (Link_Queue *)malloc(sizeof(Link_Queue));
    
    //指针的front和rear都指向p
    queue->front = queue->rear = pNode;
    return queue;
}

//链队列入队操作
void insert_CirQueue(Link_Queue *queue, ElemType value)
{
    QNode *node = (QNode *)malloc(sizeof(QNode));
    if(!node) return;
    
    node->data = value;
    node->next = NULL;
    
    //将新结点插入到队尾
    queue->rear->next = node;
    queue->rear = node;
}

//链队列出队操作
void delete_LinkQueue(Link_Queue *queue, ElemType *value)
{
    QNode *node;
    //队空
    if(queue->front == queue->rear) return;
    
    node = queue->front->next;
    *value = node->data;
    
    //修改队首指针
    queue->front->next = node->next;
    
//    node = queue->front->next;
    if(queue->rear == node){
        //表示只有一个结点
        queue->rear = queue->front;
    }
    free(node);
}

//链队列的清空
void destroy_linkQueue(Link_Queue *queue)
{
    while (queue->front != NULL) {
        
        queue->rear = queue->front->next;
        free(queue->front);
        queue->front = queue->rear;
    }
}
