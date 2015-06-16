clc;
clear;
close all;
notr=80;
nos=9;
D=47;
training=zeros(notr,D);
sample=zeros(nos,D);
filename = 'final.xlsx';
sheet='dataset';
DMat=xlsread(filename,sheet,'C2:AW90');
%disp(DMat);


filename = 'final.xlsx';
sheet='result';
features=xlsread(filename,sheet,'A6:A11');
disp('features');
disp(features);
[num,kl]=size(features);
disp(num);
%mixture=randperm(89);
%choose 1 to 80 for training and 81 to 89 for sampling 
%disp(mixture);

%disp('size of sample');
%disp(l);
%disp('Sample index');
%disp(smpindex);
Ans=[3;
1;
3;
1;
3;
1;
3;
1;
3;
1;
3;
1;
3;
1;
3;
1;
3;
1;
3;
1;
5;
4;
3;
2;
1;
3;
1;
3;
3;
3;
3;
3;
3;
3;
3;
3;
5;
3;
2;
1;
3;
3;
3;
3;
3;
3;
3;
3;
3;
3;
5;
4;
3;
2;
1;
3;
3;
3;
3;
3;
3;
3;
3;
3;
3;
5;
4;
3;
2;
1;
3;
3;
5;
4;
3;
2;
1;
5;
3;
2;
1;
5;
4;
3;
1;
3;
1;
3;
1

];
acc=zeros(5,1);
tr=zeros(notr,num);
smp=zeros(nos,num);
gr=zeros(notr,1);
an=zeros(nos,1);
for m=1:5
  mixture=randperm(89);
  %training
  l=1;
  for f=1:num
           y=features(f,1);
         %  disp(y);
  for i=1:notr
      r=mixture(i);
     
    %  disp(r);
       %disp(Dmat(r,y));
      tr(i,f)=DMat(r,y);
      gr(i)=Ans(r);
  end
  
  for j=1:nos
      r=mixture(notr+j);
      smp(j,f)=DMat(r,y);
      an(j)=Ans(r);
  end
  
  end %end features
    %disp(tr);
  
   class=knnclassify(smp,tr,gr);
   for f=1:nos
       if class(f)==an(f)
           acc(m)=acc(m)+1;
       end
   end
  acc(m)=(acc(m)/nos)*100;
   disp('accuracy out of 9');
    disp(acc(m));
    
end %%end fold
fiacc=mean(acc);
disp('final ans');
disp(fiacc);

%for f=1:num
 %   y=features(f,1);
%for i=1:notr
 %   tr(i,f)=training(i,y);
%end
%for j=1:nos
 %     smp(j,f)=sample(j,y);
%end
%end
%clas=knnclassify(smp,tr,Group);
%accuracy=0;
%for f=1:nos
 %   if clas(f)==Ans(f)
  %      accuracy=accuracy+1;
  %  end
%end
%accuracy=double(accuracy/nos)*100;
%disp('accuracy =');
%disp(accuracy);