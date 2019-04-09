function fitness=FitFun(cmax,restspace,loadorder,box,chrom,order)
[temp index]=sort(restspace(:,1));
restspace=restspace(index,:); %��һ��Ϊ��ţ�2~4 Ϊʣ��ռ����ʼ�㣬5~7 Ϊʣ��ռ������ĳ���
m=max(restspace(:,1)); %���ٸ�����
restvolume=zeros(m,1); %ÿ��������ʣ��ռ�
for i=1:m
tempspace=restspace(find(restspace(:,1)==1),:);
num=size(tempspace,1); %�� i �������л���ĸ���
for j=1:num
for j=1:num
temp=0; 
temp=tempspace(j,5)*tempspace(j,6)*tempspace(j,7); %�����
restvolume(i)=restvolume(i)+temp; %ÿ������ʣ��ռ���ܺ�
end
utilization(i)=restvolume(i)/(box(1)*box(2)*box(3));
end
temp=0;
for i=1:size(order,2)
temp=temp+exp(-(chrom(i)-order(i))^2);
end
fitness=cmax/m+sum(utilization.^2)*temp; %��Ӧ��,ʹ��Ӧ��ֵ���
end
