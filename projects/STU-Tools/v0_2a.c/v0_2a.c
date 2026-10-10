//-定义 int score[10];
//-用 for 循环读入，不许写 10 遍 scanf
//- 读入后再用一个 for 循环打印出来
//- 读的时候顺手提示一句"请输入第 X 个成绩"
#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<stdlib.h>
int main()
{
	int score[10];
	for (int i =0;i<10;i++) {
		printf("请输入第%d个成绩\n", i+1);
		scanf("%d", &score[i]);
	}
	for(int u =0;u<10;u++){
		printf("第%d个成绩是：%d\n", u+1, score[u]);
	}
	system("pause");
	return 0;
}