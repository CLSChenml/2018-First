function [restspace,loadorder]=IniOrder(chrom,box,cargo) % chrom ��װ���˳��box ���������ݣ�cargo �ǻ�����������
sizecate=size(chrom,2); % �����������
numbox=1; % ʹ�����Ӽ���
restspace=[numbox 0 0 0 box(1:3) ]; % ����ʣ��ռ��ʼ��
i=1; % �����������
k=1; % �������
while i<=sizecate % ���ֻ���
sizecargo=cargo(chrom(i),6); % ĳ�ֻ������
j=1;
while j<=sizecargo
tempj=j;
[temp index]=sort(restspace(:,4)); restspace=restspace(index,:);
% restspace ��һ��Ϊ��ţ�2~4 Ϊʣ��ռ����ʼ�㣬5~7 Ϊʣ��ռ������ĳ���
numspace=size(restspace,1); % ʣ��ռ�ĸ���
for m=1:numspace
if cargo(1)<=restspace(m,5) % �Դ�����������������ж�
if cargo(2)<=restspace(m,6)
if cargo(3)<=restspace(m,7)
% load order ��һ��Ϊ��ţ��ڶ���Ϊ�ڼ�����3~5Ϊ������ʼ�㣬6~8Ϊ����ĳߴ����
loadorder(k,:)=[restspace(m,1) chrom(i) restspace(m,2:4) cargo(chrom(i),1:3) ];% �������
% if find(loadorder(k,3:5)==loadorder(:,3:5)
% pause();
% end
k=k+1; % �ܻ���װ�ؼ�����1
j=j+1; % ĳ�����װ�ؼ�1
tempspace(1,:)=[restspace(m,1) restspace(m,2) restspace(m,3)+cargo(2) restspace(m,4) restspace(m,5) restspace(m,6)-cargo(2) restspace(m,7)]; % �������ҿռ�
tempspace(2,:)=[restspace(m,1) restspace(m,2)+cargo(1) restspace(m,3) restspace(m,4) restspace(m,5)-cargo(1) cargo(2) restspace(m,7)]; % ��������ռ�
tempspace(3,:)=[restspace(m,1) restspace(m,2) restspace(m,3) restspace(m,4)+cargo(3) cargo(1) cargo(2) restspace(m,7)-cargo(3)]; % �����Ͽռ�
% restspace(m,:)=[]; % �޳�ԭ�ռ�
restspace(m,:)=[];
restspace=[restspace; tempspace]; % ʣ��ռ�
break %���� for m=1:numspace ѭ����
end
end
end
if m==numspace&&j==tempj % ���û�к��ʵ����ӣ�����һ���µ�����
 numbox=numbox+1;
restspace=[restspace;numbox 0 0 0 box(1:3) ];
end
end
end
i=i+1;
end
end




