/*
B: ��С����Ӿ���
��Ŀ����
һ��N*M�ľ����ҳ��������������Ԫ�صĺͲ�С��K�������С���Ӿ��󣨾�����Ԫ�ظ���Ϊ���������
��������:
ÿ��������һ������������N,M<=100����ʾ�����С����һ������K
������N�У�ÿ��M��������ʾ����ÿ��Ԫ�ص�ֵ

�������:
�����С�����ֵ����������������ĺͶ�С��K��ֱ�����-1��

����
4 4 10
1 2 3 4
5 6 7 8
9 10 11 12
13 14 15 16

���
1
*/
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <cstring>
#define min(a,b) ((a)>(b)?(b):(a))
#define max(a,b) ((a)<(b)?(b):(a))
int a[101][101];
int main_B()
{
	int n, m, k, i, j, p, q,size1, size2, sum, res; bool flag;
	while (scanf("%d %d %d", &n, &m, &k) != EOF)
	{
		memset(a, 0, sizeof(a)); flag = false; res = 100000;
		for (i = 1; i <= n; i++)
			for (j = 1; j <= m; j++)
				scanf("%d", &a[i][j]);
		for (size1 = 1; size1 <= n; size1++)
		{
			for (size2 = 1; size2 <= m; size2++)
			{
				for (i = 1; i <= n - size1 + 1; i++)
				{
					for (j = 1; j <= m - size2 + 1; j++)
					{
						sum = 0;
						for (p = 0; p<size1; p++)
							for (q = 0; q<size2; q++)
								sum += a[i + p][j + q];
						if (sum >= k) { flag = true; if (res>size1*size2) res = size1*size2; }			
					}
				
				}
			}
		}
		if (flag) printf("%d\n", res);
		else printf("-1\n");

	}

	return 0;
}