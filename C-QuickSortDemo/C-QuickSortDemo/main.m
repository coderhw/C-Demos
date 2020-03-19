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

int partition(int arr[], int low, int high)
{
    int base = arr[low];
    while (low < high) {
       
        while (low < high && arr[high] >= base) {
            high--;
        }
        swap(arr, low, high);
        
        while (low < high && arr[low] <= base) {
            low++;
        }
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
       
        int arr[6] = {10, 1, 8 ,7 ,6 ,5};
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



