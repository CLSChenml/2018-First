clc;
clear;
close all;
tic
Box=[2.33 1.78 2.197 5000];
Cargo=[0.94 0.68 0.39 0.249288 270.5 6;0.81 1.02 0.6 0.495720 896 2;0.81 1.02 0.70 0.578340 868 4;0.73 0.69 0.80 0.40296 240 2;1.20 0.72 0.72 0.622080 280 10;1.10 0.84 0.26 0.24024 80 1;0.80 0.74 0.72 0.426240 180 1;1.60 1.07 0.75 1.28400 774 12;1.19 1.11 1.08 1.426572 960 11;1.19 1.11 0.9 1.18810 800 10;1.40 1.16 1.20 1.948800 420 8;0.82 0.37 0.18 0.54612 40 5];
order=[6,3,11,7,8,5,1,2,4,9,10,12;];
cmax=300; % 所使用的箱子数参数
save Box Box
save Cargo Cargo
toc
tic
T=100; % 初始温度
Tend=1e-3; % 终止温度
L=5; % 各温度下的迭代次数（链长）
q=0.8; % 降温速率
G=100;

Pc=0.9; % 交叉概率
Pm=0.05; % 变异概率
popsize=20;
retain=10;
GGAP=0.9; % 代沟

load Box
load Cargo
N=size(Cargo,1); % 待装箱类别数
for i=1:popsize
chrom(i,:)=randperm(N); % 随机产生一个装箱顺序
end
for i=1:popsize
tempchrom=chrom(i,:);
[RestSpace,LoadOrder]=IniOrder(tempchrom,Box,Cargo);
fitness(i)=FitFun(cmax,RestSpace,LoadOrder,Box,tempchrom,order);
end
fitness=fitness';
Time=ceil(double(solve(['1000*(0.8)^x=',num2str(Tend)]))); %solve('1000*(0.8)^x=1e-3') 这样也可以
count=0; %迭代计数
Obj=[]; %目标值矩阵初始化
track=[]; %每代的最优路线矩阵初始化
bestchrom=[];
while T>Tend
count=count+1; % 更新迭代次数
temp=[];
[temp index]=sort(fitness,'descend');
chrom=chrom(index,:);
chromone=chrom(1:retain,:);
fitnessone=temp(1:retain,:);
chromtwo=chrom(retain+1:end,:);
SelCh=Recombin(chromtwo,Pc);
SelCh=Mutate(SelCh,Pm);
tempchrom=[];
for i=1:size(SelCh,1)
tempchrom=SelCh(i,:);
[RestSpace,LoadOrder]=IniOrder(tempchrom,Box,Cargo);
fitnesstwo(i,:)=FitFun(cmax,RestSpace,LoadOrder,Box,tempchrom,order);
end

for k=1:L
for j=1:(popsize-retain)
newchrom(j,:)=randperm(N);
end
tempchrom=[];
for i=1:(popsize-retain)
tempchrom=newchrom(i,:);
[RestSpace,LoadOrder]=IniOrder(tempchrom,Box,Cargo);
newfitness(i,:)=FitFun(cmax,RestSpace,LoadOrder,Box,tempchrom,order);
end
newfitness=G-newfitness;
for i=1:(popsize-retain)
if newfitness(i,:)<fitnesstwo
SelCh(i,:)=newchrom(i,:);
fitnesstwo(i,:)=G-newfitness(i,:);
elseif exp(-(newfitness(i,:)-fitnesstwo(i,:))/T)
SelCh(i,:)=newchrom(i,:);
fitnesstwo(i,:)=G-newfitness(i,:);
% else % 则原种群和解不变，即不接受模拟退火准则
end
end
end
fitness=[fitnessone; fitnesstwo];
chrom=[chromone;SelCh];
% temp=[];index=[];
% [temp index]=sort(fitness,'descend');
% chrom=chrom(index,:);

track(count,:)=max(fitness);
num=find(fitness==max(fitness));
bestchrom(count,:)=chrom(num(1),:);
T=q*T; % 降温
fprintf(1,'总迭代 60 次，当前为：%d\n', count) % 输出当前迭代次数
end
figure
plot(track)
xlabel('迭代次数')
ylabel('目标函数值')
title('优化过程')
disp(['最大值：',num2str(max(track))]);
[RestSpace,bestLoadOrder]=IniOrder(bestchrom(end,:),Box,Cargo);
bestLoadOrder





