/*
E: ��ƻ��
��Ŀ����
�� M ��ͬ����ƻ������ N ��ͬ��������������е����ӿ��Ų��ţ��ʹ��ж����ֲ�ͬ�ķַ���
ע�⣺5��1��1 �� 1��5��1 ��ͬһ�ַַ�����˳���޹ء�
��������:
��������������ݡ�

ÿ�����ݰ������������� m��n��1��m, n��20����

�������:
��Ӧÿ�����ݣ����һ������k����ʾ��k�ֲ�ͬ�ķַ���

���룺
7 3

�����
8
*/

#include <iostream> 
using namespace std;


int putapples(int m, int n)  
{
	if (m == 0 || n == 1)  
		return 1;      
	if (n>m)
		return putapples(m, m);
	else
		return putapples(m, n - 1) + putapples(m - n, n);
}

int main_E()
{
	int m, n;
	while (cin >> m >> n)
	{
		if (n <= 0 || m < 0)
		{
			cout << -1 << endl;
		}
		else
		{
			cout << putapples(m, n) << endl;
		}

	}
	return 0;
}