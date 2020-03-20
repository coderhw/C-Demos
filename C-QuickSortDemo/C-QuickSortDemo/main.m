//
//  main.m
//  C-QuickSortDemo
//
//  Created by vanke on 2020/3/19.
//  Copyright © 2020 com. All rights reserved.
//

#import <Foundation/Foundation.h>

void swap (int arr[], int low, int high)
{
    if(low == high) return;
    printf("swap low:%d -- high:%d\n", low, high);
    int temp;
    temp = arr[low];
    arr[low] = arr[high];
    arr[high] = temp;
}


//快速排序思路: 挖坑+分治
/*
 * 从后往前遍历并且与base基准数进行比较， 如果比基准数大则位置不变，小的话则两者交换位置
 * 从前往后遍历并且与基准数进行比较，如果小于基准数则位置不变，大于的话则与基准数交换位置
 *
 * 最后就是 不断将数字与基准数进行比较，大的在基准数右边，小的在基准数左边。 递归
 */
int partition(int arr[], int low, int high)
{
    int base = arr[low];
    while (low < high) {
       
        while (low < high && arr[high] >= base) {
            high--;
        }
        
        //将小于基准数的值与基准数交换位置，保证基准数的左边的数都小于基准数
        swap(arr, low, high);
        
        while (low < high && arr[low] <= base) {
            low++;
        }
        
        //将大于基准数的值与基准数交换位置，保证基准数的右边的数都大于基准数
        swap(arr, low, high);
    }
    return low;
}

void quickSort(int arr[], int low, int high)
{
    if(low < high)
    {
        int base = partition(arr, low, high);
        quickSort(arr, low, base-1);
        quickSort(arr, base+1, high);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        int arr[6] = {7, 6, 8 ,9 ,2 ,4};
        int i = 0;
        quickSort(arr, 0, 5);
        
        printf("排序后\n");
        for (i = 0; i < 6; i++) {
            printf("%d ", arr[i]);
            
        }
        printf("\n");
    }
    return 0;
}



