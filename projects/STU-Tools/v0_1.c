#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
int main()
{
    int n;
    do {
        printf("*****welcome!*****\n");
        printf("请输入一个数字：\n");
        scanf("%d", &n);
        switch (n)
        {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
            printf("功能未开放！\n");
            break;
        case 0:
            printf("退出程序！\n");
            break;
        default:
            printf("只能输入 0~9 哦！\n");  
            break;
        }
    } while (n!=0);
    
    return 0;
}