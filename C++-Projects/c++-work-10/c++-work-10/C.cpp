/*
C: ����A+B
��Ŀ����
��������������25λ�Ļ���������A��B������A+B����Ҫע����ǣ��ڻ����ϣ��������ǵ�һ���Ƶģ���nλ�Ľ��ƾ��ǵ�n�����������磺�����ϵ�10������2���ڻ����ϼ�Ϊ��1,0������Ϊ���Ǹ�λ����2���Ƶģ������ϵ�10������38���ڻ����ϼ�Ϊ��1,1,1,0������Ϊ���Ǹ�λ����2���Ƶģ�ʮλ����3���Ƶģ���λ����5���Ƶģ�ǧλ����7���Ƶġ���
��������:
��������������ɲ���������ÿ����������ռһ�У�������������������A��B������������������λ���ö��ŷָ���A��B֮����һ���ո�������A��BΪ0ʱ�����������Ӧ�Ľ����Ҫ�����

�������:
��ÿ�������������1�У������Ǳ�ʾ����A+B��ֵ��

����
1,0 2,1
4,2,0 1,2,0
1 10,6,4,2,1
0 0

���
1,0,1
1,1,1,0
1,0,0,0,0,0
*/

#include <stdio.h>
#include <math.h>
#include <string.h>

int prime(int x)
{
	int flag = 1;
	for (int i = 2; i <= sqrt(x); i++)
	{
		if (x % i == 0)
		{
			flag = 0;
			break;
		}
	}
	return flag;
}
int main_C()
{
	int p[30], top = 0, len1, len2, num1[30], num2[30], ans[30];
	char str1[1000], str2[1000];
	for (int i = 2; top < 25; i++)
	{
		if (prime(i))
		{
			p[top++] = i;
		}
	}
	while (~scanf("%s%s", str1, str2))
	{
		if (strcmp(str1, "0") == 0 || strcmp(str2, "0") == 0)
			break;
		memset(num1, 0, sizeof(num1));
		memset(num2, 0, sizeof(num2));
		memset(ans, 0, sizeof(ans));
		top = 0;
		int k = 1, cnt;
		len1 = strlen(str1);
		len2 = strlen(str2);
		for (int i = len1 - 1; i >= 0; i--)
		{
			if (str1[i] == ',')
			{
				top++;
				k = 1;
				continue;
			}
			num1[top] += (str1[i] - '0') * k;
			k = k * 10;
		}
		cnt = top + 1;
		top = 0;
		k = 1;
		for (int i = len2 - 1; i >= 0; i--)
		{
			if (str2[i] == ',')
			{
				top++;
				k = 1;
				continue;
			}
			num2[top] += (str2[i] - '0') * k;
			k = k * 10;
		}
		if (top + 1 > cnt)
			cnt = top + 1;
		for (int i = 0; i < cnt; i++)
		{
			ans[i] += num1[i] + num2[i];
			while (ans[i] >= p[i] && p[i] != 0)
			{
				ans[i + 1] += ans[i] / p[i];
				ans[i] %= p[i];
			}
			k = i + 1;
		}
		if (ans[k])
			printf("%d,", ans[k]);
		for (int i = cnt - 1; i > 0; i--)
			printf("%d,", ans[i]);
		printf("%d\n", ans[0]);
	}
}