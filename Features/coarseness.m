clc;
clear;
close all;
srcFiles = dir('D:\Users\harsha\Desktop\ivm\*.jpg'); 
noimages=length(srcFiles);
coarse=zeros(noimages,1);
h=fspecial('gaussian',5,1.4);
%disp('gaussian');
RN=2;
rownum=2;

TopRow={'name','coarseness'};
writeStatus = xlswrite('d.xls', TopRow, 'l','A1');
for i = 1 : length(srcFiles)
    disp(i);
    filename = strcat('D:\Users\harsha\Desktop\ivm\',srcFiles(i).name);
    I = imread(filename);
     newImage=imfilter(I,h,'replicate');
     [r c]=size(newImage);
     k0=zeros(r,c);
    k1=zeros(r,c);
    k2=zeros(r,c);
    k3=zeros(r,c);
    k4=zeros(r,c);
    k5=zeros(r,c);
     srt='A';
    strrow=int2str(rownum);
    rowf=strcat(srt,strrow);
    for a=1:r
        for b=1:c
            k0(a,b)=newImage(a,b);
            
       end
    end
    
    disp('k1');
    for a=1:r-1
        for b=1:c-1
           k1(a,b)=mean([newImage(a,b),newImage(a+1,b),newImage(a,b+1),newImage(a+1,b+1)]);
        end  
    end
    
   disp('k2');
 
    for a=1:r-3
        for b=1:c-3
          k2(a,b)=mean([newImage(a,b),newImage(a+1,b),newImage(a+2,b),newImage(a+3,b),newImage(a,b+1),newImage(a+1,b+1),newImage(a+2,b+1),newImage(a+3,b+1),newImage(a,b+2),newImage(a+1,b+2),newImage(a+2,b+2),newImage(a+3,b+2),newImage(a,b+3),newImage(a+1,b+3),newImage(a+2,b+3),newImage(a+3,b+3)]);
        end     
    end
    disp('k3');
    for a=1:r-7
        for b=1:c-7
            k3(a,b)=mean([newImage(a,b),newImage(a+1,b),newImage(a+2,b),newImage(a+3,b),newImage(a+4,b),newImage(a+5,b),newImage(a+6,b),newImage(a+7,b),newImage(a,b+1),newImage(a+1,b+1),newImage(a+2,b+1),newImage(a+3,b+1),newImage(a+4,b+1),newImage(a+5,b+1),newImage(a+6,b+1),newImage(a+7,b+1),newImage(a,b+2),newImage(a+1,b+2),newImage(a+2,b+2),newImage(a+3,b+2),newImage(a+4,b+2),newImage(a+5,b+2),newImage(a+6,b+2),newImage(a+7,b+2),newImage(a,b+3),newImage(a+1,b+3),newImage(a+2,b+3),newImage(a+3,b+3),newImage(a+4,b+3),newImage(a+5,b+3),newImage(a+6,b+3),newImage(a+7,b+3),newImage(a,b+4),newImage(a+1,b+4),newImage(a+2,b+4),newImage(a+3,b+4),newImage(a+4,b+4),newImage(a+5,b+4),newImage(a+6,b+4),newImage(a+7,b+4),newImage(a,b+5),newImage(a+1,b+5),newImage(a+2,b+5),newImage(a+3,b+5),newImage(a+4,b+5),newImage(a+5,b+5),newImage(a+6,b+5),newImage(a+7,b+5),newImage(a,b+6),newImage(a+1,b+6),newImage(a+2,b+6),newImage(a+3,b+6),newImage(a+4,b+6),newImage(a+5,b+6),newImage(a+6,b+6),newImage(a+7,b+6),newImage(a,b+7),newImage(a+1,b+7),newImage(a+2,b+7),newImage(a+3,b+7),newImage(a+4,b+7),newImage(a+5,b+7),newImage(a+6,b+7),newImage(a+7,b+7)]);
        end     
    end
    disp('k4');
     for a=1:r-15
        for b=1:c-15
            k4(a,b)=mean([newImage(a,b),newImage(a+1,b),newImage(a+2,b),newImage(a+3,b),newImage(a+4,b),newImage(a+5,b),newImage(a+6,b),newImage(a+7,b),newImage(a+8,b),newImage(a+9,b),newImage(a+10,b),newImage(a+11,b),newImage(a+12,b),newImage(a+13,b),newImage(a+14,b),newImage(a+15,b),newImage(a,b+1),newImage(a+1,b+1),newImage(a+2,b+1),newImage(a+3,b+1),newImage(a+4,b+1),newImage(a+5,b+1),newImage(a+6,b+1),newImage(a+7,b+1),newImage(a+8,b+1),newImage(a+9,b+1),newImage(a+10,b+1),newImage(a+11,b+1),newImage(a+12,b+1),newImage(a+13,b+1),newImage(a+14,b),newImage(a+15,b+1),newImage(a,b+2),newImage(a+1,b+2),newImage(a+2,b+2),newImage(a+3,b+2),newImage(a+4,b+2),newImage(a+5,b+2),newImage(a+6,b+2),newImage(a+7,b+2),newImage(a+8,b+2),newImage(a+9,b+2),newImage(a+10,b+2),newImage(a+11,b+2),newImage(a+12,b+2),newImage(a+13,b+2),newImage(a+14,b+2),newImage(a+15,b+2),newImage(a,b+3),newImage(a+1,b+3),newImage(a+2,b+3),newImage(a+3,b+3),newImage(a+4,b+3),newImage(a+5,b+3),newImage(a+6,b+3),newImage(a+7,b+3),newImage(a+8,b+3),newImage(a+9,b+3),newImage(a+10,b+3),newImage(a+11,b+3),newImage(a+12,b+3),newImage(a+13,b+3),newImage(a+14,b+3),newImage(a+15,b+3),newImage(a,b+4),newImage(a+1,b+4),newImage(a+2,b+4),newImage(a+3,b+4),newImage(a+4,b+4),newImage(a+5,b+4),newImage(a+6,b+4),newImage(a+7,b+4),newImage(a+8,b+4),newImage(a+9,b+4),newImage(a+10,b+4),newImage(a+11,b+4),newImage(a+12,b+4),newImage(a+13,b+4),newImage(a+14,b+4),newImage(a+15,b+4),newImage(a,b+5),newImage(a+1,b+5),newImage(a+2,b+5),newImage(a+3,b+5),newImage(a+4,b+5),newImage(a+5,b+5),newImage(a+6,b+5),newImage(a+7,b+5),newImage(a+8,b+5),newImage(a+9,b+5),newImage(a+10,b+5),newImage(a+11,b+5),newImage(a+12,b+5),newImage(a+13,b+5),newImage(a+14,b+5),newImage(a+15,b+5),newImage(a,b+6),newImage(a+1,b+6),newImage(a+2,b+6),newImage(a+3,b+6),newImage(a+4,b+6),newImage(a+5,b+6),newImage(a+6,b+6),newImage(a+7,b+6),newImage(a+8,b+6),newImage(a+9,b+6),newImage(a+10,b+6),newImage(a+11,b+6),newImage(a+12,b+6),newImage(a+13,b+6),newImage(a+14,b+6),newImage(a+15,b+6), newImage(a,b+7),newImage(a+1,b+7),newImage(a+2,b+7),newImage(a+3,b+7),newImage(a+4,b+7),newImage(a+5,b+7),newImage(a+6,b+7),newImage(a+7,b+7),newImage(a+8,b+7),newImage(a+9,b+7),newImage(a+10,b+7),newImage(a+11,b+7),newImage(a+12,b+7),newImage(a+13,b+7),newImage(a+14,b+7),newImage(a+15,b+7),newImage(a,b+7),newImage(a+1,b+7),newImage(a+2,b+7),newImage(a+3,b+7),newImage(a+4,b+7),newImage(a+5,b+7),newImage(a+6,b+7),newImage(a+7,b+7),newImage(a+8,b+7),newImage(a+9,b+7),newImage(a+10,b+7),newImage(a+11,b+7),newImage(a+12,b+7),newImage(a+13,b+7),newImage(a+14,b+7),newImage(a+15,b+7), newImage(a,b+8),newImage(a+1,b+8),newImage(a+2,b+8),newImage(a+3,b+8),newImage(a+4,b+8),newImage(a+5,b+8),newImage(a+6,b+8),newImage(a+7,b+8),newImage(a+8,b+8),newImage(a+9,b+8),newImage(a+10,b+8),newImage(a+11,b+8),newImage(a+12,b+8),newImage(a+13,b+8),newImage(a+14,b+8),newImage(a+15,b+8),newImage(a,b+9),newImage(a+1,b+9),newImage(a+2,b+9),newImage(a+3,b+9),newImage(a+4,b+9),newImage(a+5,b+9),newImage(a+6,b+9),newImage(a+7,b+9),newImage(a+8,b+9),newImage(a+9,b+9),newImage(a+10,b+9),newImage(a+11,b+9),newImage(a+12,b+9),newImage(a+13,b+9),newImage(a+14,b+9),newImage(a+15,b+9),newImage(a,b+10),newImage(a+1,b+10),newImage(a+2,b+10),newImage(a+3,b+10),newImage(a+4,b+10),newImage(a+5,b+10),newImage(a+6,b+10),newImage(a+7,b+10),newImage(a+8,b+10),newImage(a+9,b+10),newImage(a+10,b+10),newImage(a+11,b+10),newImage(a+12,b+10),newImage(a+13,b+10),newImage(a+14,b+10),newImage(a+15,b+10),newImage(a,b+11),newImage(a+1,b+11),newImage(a+2,b+11),newImage(a+3,b+11),newImage(a+4,b+11),newImage(a+5,b+11),newImage(a+6,b+11),newImage(a+7,b+11),newImage(a+8,b+11),newImage(a+9,b+11),newImage(a+10,b+11),newImage(a+11,b+11),newImage(a+12,b+11),newImage(a+13,b+11),newImage(a+14,b+11),newImage(a+15,b+11),newImage(a,b+12),newImage(a+1,b+12),newImage(a+2,b+12),newImage(a+3,b+12),newImage(a+4,b+12),newImage(a+5,b+12),newImage(a+6,b+12),newImage(a+7,b+12),newImage(a+8,b+12),newImage(a+9,b+12),newImage(a+10,b+12),newImage(a+11,b+12),newImage(a+12,b+12),newImage(a+13,b+12),newImage(a+14,b+12),newImage(a+15,b+12),newImage(a,b+13),newImage(a+1,b+13),newImage(a+2,b+13),newImage(a+3,b+13),newImage(a+4,b+13),newImage(a+5,b+13),newImage(a+6,b+13),newImage(a+7,b+13),newImage(a+8,b+13),newImage(a+9,b+13),newImage(a+10,b+13),newImage(a+11,b+13),newImage(a+12,b+13),newImage(a+13,b+13),newImage(a+14,b+13),newImage(a+15,b+13),newImage(a,b+14),newImage(a+1,b+14),newImage(a+2,b+14),newImage(a+3,b+14),newImage(a+4,b+14),newImage(a+5,b+14),newImage(a+6,b+14),newImage(a+7,b+14),newImage(a+8,b+14),newImage(a+9,b+14),newImage(a+10,b+14),newImage(a+11,b+14),newImage(a+12,b+14),newImage(a+13,b+14),newImage(a+14,b+14),newImage(a+15,b+14),newImage(a,b+15),newImage(a+1,b+15),newImage(a+2,b+15),newImage(a+3,b+15),newImage(a+4,b+15),newImage(a+5,b+15),newImage(a+6,b+15),newImage(a+7,b+15),newImage(a+8,b+15),newImage(a+9,b+15),newImage(a+10,b+15),newImage(a+11,b+15),newImage(a+12,b+15),newImage(a+13,b+15),newImage(a+14,b+15),newImage(a+15,b+15)]);
        end     
     end
    disp('k5');
      for a=1:r-31
        for b=1:c-31
            k5(a,b)=mean([newImage(a,b),newImage(a+1,b),newImage(a+2,b),newImage(a+3,b),newImage(a+4,b),newImage(a+5,b),newImage(a+6,b),newImage(a+7,b),newImage(a+8,b),newImage(a+9,b),newImage(a+10,b),newImage(a+11,b),newImage(a+12,b),newImage(a+13,b),newImage(a+14,b),newImage(a+15,b),newImage(a+16,b),newImage(a+17,b),newImage(a+18,b),newImage(a+19,b),newImage(a+20,b),newImage(a+21,b),newImage(a+22,b),newImage(a+23,b),newImage(a+24,b),newImage(a+25,b),newImage(a+26,b),newImage(a+27,b),newImage(a+28,b),newImage(a+29,b),newImage(a+30,b),newImage(a+31,b),            newImage(a,b+1),newImage(a+1,b+1),newImage(a+2,b+1),newImage(a+3,b+1),newImage(a+4,b+1),newImage(a+5,b+1),newImage(a+6,b+1),newImage(a+7,b+1),newImage(a+8,b+1),newImage(a+9,b+1),newImage(a+10,b+1),newImage(a+11,b+1),newImage(a+12,b+1),newImage(a+13,b+1),newImage(a+14,b+1),newImage(a+15,b+1),newImage(a+16,b+1),newImage(a+17,b+1),newImage(a+18,b+1),newImage(a+19,b+1),newImage(a+20,b+1),newImage(a+21,b+1),newImage(a+22,b+1),newImage(a+23,b+1),newImage(a+24,b+1),newImage(a+25,b+1),newImage(a+26,b+1),newImage(a+27,b+1),newImage(a+28,b+1),newImage(a+29,b+1),newImage(a+30,b+1),newImage(a+31,b+1),            newImage(a,b+2),newImage(a+1,b+2),newImage(a+2,b+2),newImage(a+3,b+2),newImage(a+4,b+2),newImage(a+5,b+2),newImage(a+6,b+2),newImage(a+7,b+2),newImage(a+8,b+2),newImage(a+9,b+2),newImage(a+10,b+2),newImage(a+11,b+2),newImage(a+12,b+2),newImage(a+13,b+2),newImage(a+14,b+2),newImage(a+15,b+2),newImage(a+16,b+2),newImage(a+17,b+2),newImage(a+18,b+2),newImage(a+19,b+2),newImage(a+20,b+2),newImage(a+21,b+2),newImage(a+22,b+2),newImage(a+23,b+2),newImage(a+24,b+2),newImage(a+25,b+2),newImage(a+26,b+2),newImage(a+27,b+2),newImage(a+28,b+2),newImage(a+29,b+2),newImage(a+30,b+2),newImage(a+31,b+2),            newImage(a,b+3),newImage(a+1,b+3),newImage(a+2,b+3),newImage(a+3,b+3),newImage(a+4,b+3),newImage(a+5,b+3),newImage(a+6,b+3),newImage(a+7,b+3),newImage(a+8,b+3),newImage(a+9,b+3),newImage(a+10,b+3),newImage(a+11,b+3),newImage(a+12,b+3),newImage(a+13,b+3),newImage(a+14,b+3),newImage(a+15,b+3),newImage(a+16,b+3),newImage(a+17,b+3),newImage(a+18,b+3),newImage(a+19,b+3),newImage(a+20,b+3),newImage(a+21,b+3),newImage(a+22,b+3),newImage(a+23,b+3),newImage(a+24,b+3),newImage(a+25,b+3),newImage(a+26,b+3),newImage(a+27,b+3),newImage(a+28,b+3),newImage(a+29,b+3),newImage(a+30,b+3),newImage(a+31,b+3),            newImage(a,b+4),newImage(a+1,b+4),newImage(a+2,b+4),newImage(a+3,b+4),newImage(a+4,b+4),newImage(a+5,b+4),newImage(a+6,b+4),newImage(a+7,b+4),newImage(a+8,b+4),newImage(a+9,b+4),newImage(a+10,b+4),newImage(a+11,b+4),newImage(a+12,b+4),newImage(a+13,b+4),newImage(a+14,b+4),newImage(a+15,b+4),newImage(a+16,b+4),newImage(a+17,b+4),newImage(a+18,b+4),newImage(a+19,b+4),newImage(a+20,b+4),newImage(a+21,b+4),newImage(a+22,b+4),newImage(a+23,b+4),newImage(a+24,b+4),newImage(a+25,b+4),newImage(a+26,b+4),newImage(a+27,b+4),newImage(a+28,b+4),newImage(a+29,b+4),newImage(a+30,b+4),newImage(a+31,b+4),            newImage(a,b+5),newImage(a+1,b+5),newImage(a+2,b+5),newImage(a+3,b+5),newImage(a+4,b+5),newImage(a+5,b+5),newImage(a+6,b+5),newImage(a+7,b+5),newImage(a+8,b+5),newImage(a+9,b+5),newImage(a+10,b+5),newImage(a+11,b+5),newImage(a+12,b+5),newImage(a+13,b+5),newImage(a+14,b+5),newImage(a+15,b+5),newImage(a+16,b+5),newImage(a+17,b+5),newImage(a+18,b+5),newImage(a+19,b+5),newImage(a+20,b+5),newImage(a+21,b+5),newImage(a+22,b+5),newImage(a+23,b+5),newImage(a+24,b+5),newImage(a+25,b+5),newImage(a+26,b+5),newImage(a+27,b+5),newImage(a+28,b+5),newImage(a+29,b+5),newImage(a+30,b+5),newImage(a+31,b+5),         newImage(a,b+6),newImage(a+1,b+6),newImage(a+2,b+6),newImage(a+3,b+6),newImage(a+4,b+6),newImage(a+5,b+6),newImage(a+6,b+6),newImage(a+7,b+6),newImage(a+8,b+6),newImage(a+9,b+6),newImage(a+10,b+6),newImage(a+11,b+6),newImage(a+12,b+6),newImage(a+13,b+6),newImage(a+14,b+6),newImage(a+15,b+6),newImage(a+16,b+6),newImage(a+17,b+6),newImage(a+18,b+6),newImage(a+19,b+6),newImage(a+20,b+6),newImage(a+21,b+6),newImage(a+22,b+6),newImage(a+23,b+6),newImage(a+24,b+6),newImage(a+25,b+6),newImage(a+26,b+6),newImage(a+27,b+6),newImage(a+28,b+6),newImage(a+29,b+6),newImage(a+30,b+6),newImage(a+31,b+6),newImage(a,b+7),newImage(a+1,b+7),newImage(a+2,b+7),newImage(a+3,b+7),newImage(a+4,b+7),newImage(a+5,b+7),newImage(a+6,b+7),newImage(a+7,b+7),newImage(a+8,b+7),newImage(a+9,b+7),newImage(a+10,b+7),newImage(a+11,b+7),newImage(a+12,b+7),newImage(a+13,b+7),newImage(a+14,b+7),newImage(a+15,b+7),newImage(a+16,b+7),newImage(a+17,b+7),newImage(a+18,b+7),newImage(a+19,b+7),newImage(a+20,b+7),newImage(a+21,b+7),newImage(a+22,b+7),newImage(a+23,b+7),newImage(a+24,b+7),newImage(a+25,b+7),newImage(a+26,b+7),newImage(a+27,b+7),newImage(a+28,b+7),newImage(a+29,b+7),newImage(a+30,b+7),newImage(a+31,b+7),newImage(a,b+8),newImage(a+1,b+8),newImage(a+2,b+8),newImage(a+3,b+8),newImage(a+4,b+8),newImage(a+5,b+8),newImage(a+6,b+8),newImage(a+7,b+8),newImage(a+8,b+8),newImage(a+9,b+8),newImage(a+10,b+8),newImage(a+11,b+8),newImage(a+12,b+8),newImage(a+13,b+8),newImage(a+14,b+8),newImage(a+15,b+8),newImage(a+16,b+8),newImage(a+17,b+8),newImage(a+18,b+8),newImage(a+19,b+8),newImage(a+20,b+8),newImage(a+21,b+8),newImage(a+22,b+8),newImage(a+23,b+8),newImage(a+24,b+8),newImage(a+25,b+8),newImage(a+26,b+8),newImage(a+27,b+8),newImage(a+28,b+8),newImage(a+29,b+8),newImage(a+30,b+8),newImage(a+31,b+8),newImage(a,b+9),newImage(a+1,b+9),newImage(a+2,b+9),newImage(a+3,b+9),newImage(a+4,b+9),newImage(a+5,b+9),newImage(a+6,b+9),newImage(a+7,b+9),newImage(a+8,b+9),newImage(a+9,b+9),newImage(a+10,b+9),newImage(a+11,b+9),newImage(a+12,b+9),newImage(a+13,b+9),newImage(a+14,b+9),newImage(a+15,b+9),newImage(a+16,b+9),newImage(a+17,b+9),newImage(a+18,b+9),newImage(a+19,b+9),newImage(a+20,b+9),newImage(a+21,b+9),newImage(a+22,b+9),newImage(a+23,b+9),newImage(a+24,b+9),newImage(a+25,b+9),newImage(a+26,b+9),newImage(a+27,b+9),newImage(a+28,b+9),newImage(a+29,b+9),newImage(a+30,b+9),newImage(a+31,b+9),newImage(a,b+10),newImage(a+1,b+10),newImage(a+2,b+10),newImage(a+3,b+10),newImage(a+4,b+10),newImage(a+5,b+10),newImage(a+6,b+10),newImage(a+7,b+10),newImage(a+8,b+10),newImage(a+9,b+10),newImage(a+10,b+10),newImage(a+11,b+10),newImage(a+12,b+10),newImage(a+13,b+10),newImage(a+14,b+10),newImage(a+15,b+10),newImage(a+16,b+10),newImage(a+17,b+10),newImage(a+18,b+10),newImage(a+19,b+10),newImage(a+20,b+10),newImage(a+21,b+10),newImage(a+22,b+10),newImage(a+23,b+10),newImage(a+24,b+10),newImage(a+25,b+10),newImage(a+26,b+10),newImage(a+27,b+10),newImage(a+28,b+10),newImage(a+29,b+10),newImage(a+30,b+10),newImage(a+31,b+10),newImage(a,b+11),newImage(a+1,b+11),newImage(a+2,b+11),newImage(a+3,b+11),newImage(a+4,b+11),newImage(a+5,b+11),newImage(a+6,b+11),newImage(a+7,b+11),newImage(a+8,b+11),newImage(a+9,b+11),newImage(a+10,b+11),newImage(a+11,b+11),newImage(a+12,b+11),newImage(a+13,b+11),newImage(a+14,b+11),newImage(a+15,b+11),newImage(a+16,b+11),newImage(a+17,b+11),newImage(a+18,b+11),newImage(a+19,b+11),newImage(a+20,b+11),newImage(a+21,b+11),newImage(a+22,b+11),newImage(a+23,b+11),newImage(a+24,b+11),newImage(a+25,b+11),newImage(a+26,b+11),newImage(a+27,b+11),newImage(a+28,b+11),newImage(a+29,b+11),newImage(a+30,b+11),newImage(a+31,b+11),newImage(a,b+12),newImage(a+1,b+12),newImage(a+2,b+12),newImage(a+3,b+12),newImage(a+4,b+12),newImage(a+5,b+12),newImage(a+6,b+12),newImage(a+7,b+12),newImage(a+8,b+12),newImage(a+9,b+12),newImage(a+10,b+12),newImage(a+11,b+12),newImage(a+12,b+12),newImage(a+13,b+12),newImage(a+14,b+12),newImage(a+15,b+12),newImage(a+16,b+12),newImage(a+17,b+12),newImage(a+18,b+12),newImage(a+19,b+12),newImage(a+20,b+12),newImage(a+21,b+12),newImage(a+22,b+12),newImage(a+23,b+12),newImage(a+24,b+12),newImage(a+25,b+12),newImage(a+26,b+12),newImage(a+27,b+12),newImage(a+28,b+12),newImage(a+29,b+12),newImage(a+30,b+12),newImage(a+31,b+12),newImage(a,b+13),newImage(a+1,b+13),newImage(a+2,b+13),newImage(a+3,b+13),newImage(a+4,b+13),newImage(a+5,b+13),newImage(a+6,b+13),newImage(a+7,b+13),newImage(a+8,b+13),newImage(a+9,b+13),newImage(a+10,b+13),newImage(a+11,b+13),newImage(a+12,b+13),newImage(a+13,b+13),newImage(a+14,b+13),newImage(a+15,b+13),newImage(a+16,b+13),newImage(a+17,b+13),newImage(a+18,b+13),newImage(a+19,b+13),newImage(a+20,b+13),newImage(a+21,b+13),newImage(a+22,b+13),newImage(a+23,b+13),newImage(a+24,b+13),newImage(a+25,b+13),newImage(a+26,b+13),newImage(a+27,b+13),newImage(a+28,b+13),newImage(a+29,b+13),newImage(a+30,b+13),newImage(a+31,b+13),newImage(a,b+14),newImage(a+1,b+14),newImage(a+2,b+14),newImage(a+3,b+14),newImage(a+4,b+14),newImage(a+5,b+14),newImage(a+6,b+14),newImage(a+7,b+14),newImage(a+8,b+14),newImage(a+9,b+14),newImage(a+10,b+14),newImage(a+11,b+14),newImage(a+12,b+14),newImage(a+13,b+14),newImage(a+14,b+14),newImage(a+15,b+14),newImage(a+16,b+14),newImage(a+17,b+14),newImage(a+18,b+14),newImage(a+19,b+14),newImage(a+20,b+14),newImage(a+21,b+14),newImage(a+22,b+14),newImage(a+23,b+14),newImage(a+24,b+14),newImage(a+25,b+14),newImage(a+26,b+14),newImage(a+27,b+14),newImage(a+28,b+14),newImage(a+29,b+14),newImage(a+30,b+14),newImage(a+31,b+14),newImage(a,b+15),newImage(a+1,b+15),newImage(a+2,b+15),newImage(a+3,b+15),newImage(a+4,b+15),newImage(a+5,b+15),newImage(a+6,b+15),newImage(a+7,b+15),newImage(a+8,b+15),newImage(a+9,b+15),newImage(a+10,b+15),newImage(a+11,b+15),newImage(a+12,b+15),newImage(a+13,b+15),newImage(a+14,b+15),newImage(a+15,b+15),newImage(a+16,b+15),newImage(a+17,b+15),newImage(a+18,b+15),newImage(a+19,b+15),newImage(a+20,b+15),newImage(a+21,b+15),newImage(a+22,b+15),newImage(a+23,b+15),newImage(a+24,b+15),newImage(a+25,b+15),newImage(a+26,b+15),newImage(a+27,b+15),newImage(a+28,b+15),newImage(a+29,b+15),newImage(a+30,b+15),newImage(a+31,b+15),newImage(a,b+16),newImage(a+1,b+16),newImage(a+2,b+16),newImage(a+3,b+16),newImage(a+4,b+16),newImage(a+5,b+16),newImage(a+6,b+16),newImage(a+7,b+16),newImage(a+8,b+16),newImage(a+9,b+16),newImage(a+10,b+16),newImage(a+11,b+16),newImage(a+12,b+16),newImage(a+13,b+16),newImage(a+14,b+16),newImage(a+15,b+16),newImage(a+16,b+16),newImage(a+17,b+16),newImage(a+18,b+16),newImage(a+19,b+16),newImage(a+20,b+16),newImage(a+21,b+16),newImage(a+22,b+16),newImage(a+23,b+16),newImage(a+24,b+16),newImage(a+25,b+16),newImage(a+26,b+16),newImage(a+27,b+16),newImage(a+28,b+16),newImage(a+29,b+16),newImage(a+30,b+16),newImage(a+31,b+16),newImage(a,b+17),newImage(a+1,b+17),newImage(a+2,b+17),newImage(a+3,b+17),newImage(a+4,b+17),newImage(a+5,b+17),newImage(a+6,b+17),newImage(a+7,b+17),newImage(a+8,b+17),newImage(a+9,b+17),newImage(a+10,b+17),newImage(a+11,b+17),newImage(a+12,b+17),newImage(a+13,b+17),newImage(a+14,b+17),newImage(a+15,b+17),newImage(a+16,b+17),newImage(a+17,b+17),newImage(a+18,b+17),newImage(a+19,b+17),newImage(a+20,b+17),newImage(a+21,b+17),newImage(a+22,b+17),newImage(a+23,b+17),newImage(a+24,b+17),newImage(a+25,b+17),newImage(a+26,b+17),newImage(a+27,b+17),newImage(a+28,b+17),newImage(a+29,b+17),newImage(a+30,b+17),newImage(a+31,b+17),newImage(a,b+18),newImage(a+1,b+18),newImage(a+2,b+18),newImage(a+3,b+18),newImage(a+4,b+18),newImage(a+5,b+18),newImage(a+6,b+18),newImage(a+7,b+18),newImage(a+8,b+18),newImage(a+9,b+18),newImage(a+10,b+18),newImage(a+11,b+18),newImage(a+12,b+18),newImage(a+13,b+18),newImage(a+14,b+18),newImage(a+15,b+18),newImage(a+16,b+18),newImage(a+17,b+18),newImage(a+18,b+18),newImage(a+19,b+18),newImage(a+20,b+18),newImage(a+21,b+18),newImage(a+22,b+18),newImage(a+23,b+18),newImage(a+24,b+18),newImage(a+25,b+18),newImage(a+26,b+18),newImage(a+27,b+18),newImage(a+28,b+18),newImage(a+29,b+18),newImage(a+30,b+18),newImage(a+31,b+18),newImage(a,b+19),newImage(a+1,b+19),newImage(a+2,b+19),newImage(a+3,b+19),newImage(a+4,b+19),newImage(a+5,b+19),newImage(a+6,b+19),newImage(a+7,b+19),newImage(a+8,b+19),newImage(a+9,b+19),newImage(a+10,b+19),newImage(a+11,b+19),newImage(a+12,b+19),newImage(a+13,b+19),newImage(a+14,b+19),newImage(a+15,b+19),newImage(a+16,b+19),newImage(a+17,b+19),newImage(a+18,b+19),newImage(a+19,b+19),newImage(a+20,b+19),newImage(a+21,b+19),newImage(a+22,b+19),newImage(a+23,b+19),newImage(a+24,b+19),newImage(a+25,b+19),newImage(a+26,b+19),newImage(a+27,b+19),newImage(a+28,b+19),newImage(a+29,b+19),newImage(a+30,b+19),newImage(a+31,b+19),newImage(a,b+20),newImage(a+1,b+20),newImage(a+2,b+20),newImage(a+3,b+20),newImage(a+4,b+20),newImage(a+5,b+20),newImage(a+6,b+20),newImage(a+7,b+20),newImage(a+8,b+20),newImage(a+9,b+20),newImage(a+10,b+20),newImage(a+11,b+20),newImage(a+12,b+20),newImage(a+13,b+20),newImage(a+14,b+20),newImage(a+15,b+20),newImage(a+16,b+20),newImage(a+17,b+20),newImage(a+18,b+20),newImage(a+19,b+20),newImage(a+20,b+20),newImage(a+21,b+20),newImage(a+22,b+20),newImage(a+23,b+20),newImage(a+24,b+20),newImage(a+25,b+20),newImage(a+26,b+20),newImage(a+27,b+20),newImage(a+28,b+20),newImage(a+29,b+20),newImage(a+30,b+20),newImage(a+31,b+20),newImage(a,b+21),newImage(a+1,b+21),newImage(a+2,b+21),newImage(a+3,b+21),newImage(a+4,b+21),newImage(a+5,b+21),newImage(a+6,b+21),newImage(a+7,b+21),newImage(a+8,b+21),newImage(a+9,b+21),newImage(a+10,b+21),newImage(a+11,b+21),newImage(a+12,b+21),newImage(a+13,b+21),newImage(a+14,b+21),newImage(a+15,b+21),newImage(a+16,b+21),newImage(a+17,b+21),newImage(a+18,b+21),newImage(a+19,b+21),newImage(a+20,b+21),newImage(a+21,b+21),newImage(a+22,b+21),newImage(a+23,b+21),newImage(a+24,b+21),newImage(a+25,b+21),newImage(a+26,b+21),newImage(a+27,b+21),newImage(a+28,b+21),newImage(a+29,b+21),newImage(a+30,b+21),newImage(a+31,b+21),newImage(a,b+22),newImage(a+1,b+22),newImage(a+2,b+22),newImage(a+3,b+22),newImage(a+4,b+22),newImage(a+5,b+22),newImage(a+6,b+22),newImage(a+7,b+22),newImage(a+8,b+22),newImage(a+9,b+22),newImage(a+10,b+22),newImage(a+11,b+22),newImage(a+12,b+22),newImage(a+13,b+22),newImage(a+14,b+22),newImage(a+15,b+22),newImage(a+16,b+22),newImage(a+17,b+22),newImage(a+18,b+22),newImage(a+19,b+22),newImage(a+20,b+22),newImage(a+21,b+22),newImage(a+22,b+22),newImage(a+23,b+22),newImage(a+24,b+22),newImage(a+25,b+22),newImage(a+26,b+22),newImage(a+27,b+22),newImage(a+28,b+22),newImage(a+29,b+22),newImage(a+30,b+22),newImage(a+31,b+22),newImage(a,b+23),newImage(a+1,b+23),newImage(a+2,b+23),newImage(a+3,b+23),newImage(a+4,b+23),newImage(a+5,b+23),newImage(a+6,b+23),newImage(a+7,b+23),newImage(a+8,b+23),newImage(a+9,b+23),newImage(a+10,b+23),newImage(a+11,b+23),newImage(a+12,b+23),newImage(a+13,b+23),newImage(a+14,b+23),newImage(a+15,b+23),newImage(a+16,b+23),newImage(a+17,b+23),newImage(a+18,b+23),newImage(a+19,b+23),newImage(a+20,b+23),newImage(a+21,b+23),newImage(a+22,b+23),newImage(a+23,b+23),newImage(a+24,b+23),newImage(a+25,b+23),newImage(a+26,b+23),newImage(a+27,b+23),newImage(a+28,b+23),newImage(a+29,b+23),newImage(a+30,b+23),newImage(a+31,b+23),newImage(a,b+24),newImage(a+1,b+24),newImage(a+2,b+24),newImage(a+3,b+24),newImage(a+4,b+24),newImage(a+5,b+24),newImage(a+6,b+24),newImage(a+7,b+24),newImage(a+8,b+24),newImage(a+9,b+24),newImage(a+10,b+24),newImage(a+11,b+24),newImage(a+12,b+24),newImage(a+13,b+24),newImage(a+14,b+24),newImage(a+15,b+24),newImage(a+16,b+24),newImage(a+17,b+24),newImage(a+18,b+24),newImage(a+19,b+24),newImage(a+20,b+24),newImage(a+21,b+24),newImage(a+22,b+24),newImage(a+23,b+24),newImage(a+24,b+24),newImage(a+25,b+24),newImage(a+26,b+24),newImage(a+27,b+24),newImage(a+28,b+24),newImage(a+29,b+24),newImage(a+30,b+24),newImage(a+31,b+24),newImage(a,b+25),newImage(a+1,b+25),newImage(a+2,b+25),newImage(a+3,b+25),newImage(a+4,b+25),newImage(a+5,b+25),newImage(a+6,b+25),newImage(a+7,b+25),newImage(a+8,b+25),newImage(a+9,b+25),newImage(a+10,b+25),newImage(a+11,b+25),newImage(a+12,b+25),newImage(a+13,b+25),newImage(a+14,b+25),newImage(a+15,b+25),newImage(a+16,b+25),newImage(a+17,b+25),newImage(a+18,b+25),newImage(a+19,b+25),newImage(a+20,b+25),newImage(a+21,b+25),newImage(a+22,b+25),newImage(a+23,b+25),newImage(a+24,b+25),newImage(a+25,b+25),newImage(a+26,b+25),newImage(a+27,b+25),newImage(a+28,b+25),newImage(a+29,b+25),newImage(a+30,b+25),newImage(a+31,b+25),newImage(a,b+26),newImage(a+1,b+26),newImage(a+2,b+26),newImage(a+3,b+26),newImage(a+4,b+26),newImage(a+5,b+26),newImage(a+6,b+26),newImage(a+7,b+26),newImage(a+8,b+26),newImage(a+9,b+26),newImage(a+10,b+26),newImage(a+11,b+26),newImage(a+12,b+26),newImage(a+13,b+26),newImage(a+14,b+26),newImage(a+15,b+26),newImage(a+16,b+26),newImage(a+17,b+26),newImage(a+18,b+26),newImage(a+19,b+26),newImage(a+20,b+26),newImage(a+21,b+26),newImage(a+22,b+26),newImage(a+23,b+26),newImage(a+24,b+26),newImage(a+25,b+26),newImage(a+26,b+26),newImage(a+27,b+26),newImage(a+28,b+26),newImage(a+29,b+26),newImage(a+30,b+26),newImage(a+31,b+26),newImage(a,b+27),newImage(a+1,b+27),newImage(a+2,b+27),newImage(a+3,b+27),newImage(a+4,b+27),newImage(a+5,b+27),newImage(a+6,b+27),newImage(a+7,b+27),newImage(a+8,b+27),newImage(a+9,b+27),newImage(a+10,b+27),newImage(a+11,b+27),newImage(a+12,b+27),newImage(a+13,b+27),newImage(a+14,b+27),newImage(a+15,b+27),newImage(a+16,b+27),newImage(a+17,b+27),newImage(a+18,b+27),newImage(a+19,b+27),newImage(a+20,b+27),newImage(a+21,b+27),newImage(a+22,b+27),newImage(a+23,b+27),newImage(a+24,b+27),newImage(a+25,b+27),newImage(a+26,b+27),newImage(a+27,b+27),newImage(a+28,b+27),newImage(a+29,b+27),newImage(a+30,b+27),newImage(a+31,b+27),newImage(a,b+28),newImage(a+1,b+28),newImage(a+2,b+28),newImage(a+3,b+28),newImage(a+4,b+28),newImage(a+5,b+28),newImage(a+6,b+28),newImage(a+7,b+28),newImage(a+8,b+28),newImage(a+9,b+28),newImage(a+10,b+28),newImage(a+11,b+28),newImage(a+12,b+28),newImage(a+13,b+28),newImage(a+14,b+28),newImage(a+15,b+28),newImage(a+16,b+28),newImage(a+17,b+28),newImage(a+18,b+28),newImage(a+19,b+28),newImage(a+20,b+28),newImage(a+21,b+28),newImage(a+22,b+28),newImage(a+23,b+28),newImage(a+24,b+28),newImage(a+25,b+28),newImage(a+26,b+28),newImage(a+27,b+28),newImage(a+28,b+28),newImage(a+29,b+28),newImage(a+30,b+28),newImage(a+31,b+28),newImage(a,b+29),newImage(a+1,b+29),newImage(a+2,b+29),newImage(a+3,b+29),newImage(a+4,b+29),newImage(a+5,b+29),newImage(a+6,b+29),newImage(a+7,b+29),newImage(a+8,b+29),newImage(a+9,b+29),newImage(a+10,b+29),newImage(a+11,b+29),newImage(a+12,b+29),newImage(a+13,b+29),newImage(a+14,b+29),newImage(a+15,b+29),newImage(a+16,b+29),newImage(a+17,b+29),newImage(a+18,b+29),newImage(a+19,b+29),newImage(a+20,b+29),newImage(a+21,b+29),newImage(a+22,b+29),newImage(a+23,b+29),newImage(a+24,b+29),newImage(a+25,b+29),newImage(a+26,b+29),newImage(a+27,b+29),newImage(a+28,b+29),newImage(a+29,b+29),newImage(a+30,b+29),newImage(a+31,b+29),newImage(a,b+30),newImage(a+1,b+30),newImage(a+2,b+30),newImage(a+3,b+30),newImage(a+4,b+30),newImage(a+5,b+30),newImage(a+6,b+30),newImage(a+7,b+30),newImage(a+8,b+30),newImage(a+9,b+30),newImage(a+10,b+30),newImage(a+11,b+30),newImage(a+12,b+30),newImage(a+13,b+30),newImage(a+14,b+30),newImage(a+15,b+30),newImage(a+16,b+30),newImage(a+17,b+30),newImage(a+18,b+30),newImage(a+19,b+30),newImage(a+20,b+30),newImage(a+21,b+30),newImage(a+22,b+30),newImage(a+23,b+30),newImage(a+24,b+30),newImage(a+25,b+30),newImage(a+26,b+30),newImage(a+27,b+30),newImage(a+28,b+30),newImage(a+29,b+30),newImage(a+30,b+30),newImage(a+31,b+30),newImage(a,b+31),newImage(a+1,b+31),newImage(a+2,b+31),newImage(a+3,b+31),newImage(a+4,b+31),newImage(a+5,b+31),newImage(a+6,b+31),newImage(a+7,b+31),newImage(a+8,b+31),newImage(a+9,b+31),newImage(a+10,b+31),newImage(a+11,b+31),newImage(a+12,b+31),newImage(a+13,b+31),newImage(a+14,b+31),newImage(a+15,b+31),newImage(a+16,b+31),newImage(a+17,b+31),newImage(a+18,b+31),newImage(a+19,b+31),newImage(a+20,b+31),newImage(a+21,b+31),newImage(a+22,b+31),newImage(a+23,b+31),newImage(a+24,b+31),newImage(a+25,b+31),newImage(a+26,b+31),newImage(a+27,b+31),newImage(a+28,b+31),newImage(a+29,b+31),newImage(a+30,b+31),newImage(a+31,b+31)]);
        end     
      end
     Soptimal=zeros(r,c); 
   e0=zeros(r,c);
   e1=zeros(r,c);
   e2=zeros(r,c);
   e3=zeros(r,c);
   e4=zeros(r,c);
   e5=zeros(r,c);
   a=1;
   b=1;
     e0(1,1)=abs(k0(a,b)-k0(a+1,b));
             % Soptimal(a,b)=1;
              if  e0(1,1)<abs(k0(a,b)-k0(a,b+1))
                   e0(1,1)=abs(k0(a,b)-k0(a,b+1));
                %   Soptimal(a,b)=1;
              end
              e1(1,1)=abs(k1(a,b)-k1(a,b+2));
              if e1(1,1)<abs(k1(a,b)-k1(a+2,b))
                  e1(1,1)=abs(k1(a,b)-k1(a+2,b));
                  % Soptimal(a,b)=2;
              end
              e2(1,1)=abs(k2(a,b)-k2(a,b+4));
              if e2(1,1)<abs(k2(a,b)-k2(a+4,b))
                  e2(1,1)=abs(k2(a,b)-k2(a+4,b));
                   %Soptimal(a,b)=4;
              end
               e3(1,1)=abs(k3(a,b)-k3(a,b+8));
                if e3(1,1)<abs(k3(a,b)-k3(a+8,b))
                  e3(1,1)=abs(k3(a,b)-k3(a+8,b));
                   %Soptimal(a,b)=4;
                end
              e4(1,1)=abs(k4(a,b)-k4(a,b+16));
                if e4(1,1)<abs(k4(a,b)-k4(a+16,b))
                  e4(1,1)=abs(k4(a,b)-k4(a+16,b));
                   %Soptimal(a,b)=4;
                end
     e5(1,1)=abs(k5(a,b)-k5(a,b+32));
                if e5(1,1)<abs(k5(a,b)-k5(a+32,b))
                  e5(1,1)=abs(k5(a,b)-k5(a+32,b));
                   %Soptimal(a,b)=4;
                end
                
                a=1;
                b=c;
                
    e0(1,c)=abs(k0(a,b)-k0(a+1,b));
             % Soptimal(a,b)=1;
              if  e0(1,c)<abs(k0(a,b)-k0(a,b-1))
                   e0(1,c)=abs(k0(a,b)-k0(a,b-1));
                %   Soptimal(a,b)=1;
              end
              e1(1,c)=abs(k1(a,b)-k1(a+2,b));
              if e1(1,c)<abs(k1(a,b)-k1(a,b-2))
                  e1(1,c)=abs(k1(a,b)-k1(a,b-2));
                  % Soptimal(a,b)=2;
              end
              e2(1,c)=abs(k2(a,b)-k2(a+4,b));
              if e2(1,c)<abs(k2(a,b)-k2(a,b-4))
                  e2(1,c)=abs(k2(a,b)-k2(a,b-4));
                   %Soptimal(a,b)=4;
              end
               e3(1,c)=abs(k3(a,b)-k3(a,b-8));
                if e3(1,c)<abs(k3(a,b)-k3(a+8,b))
                  e3(1,c)=abs(k3(a,b)-k3(a+8,b));
                   %Soptimal(a,b)=4;
                end
              e4(1,c)=abs(k4(a,b)-k4(a,b-16));
                if e4(1,c)<abs(k4(a,b)-k4(a+16,b))
                  e4(1,c)=abs(k4(a,b)-k4(a+16,b));
                   %Soptimal(a,b)=4;
                end
     e5(1,c)=abs(k5(a,b)-k5(a,b-32));
                if e5(1,c)<abs(k5(a,b)-k5(a+32,b))
                  e5(1,c)=abs(k5(a,b)-k5(a+32,b));
                   %Soptimal(a,b)=4;
                end
                
                a=r ;b=1;
                
    e0(r,1)=abs(k0(a,b)-k0(a,b+1));
             % Soptimal(a,b)=1;
              if  e0(r,1)<abs(k0(a,b)-k0(a-1,b))
                   e0(r,1)=abs(k0(a,b)-k0(a-1,b));
                %   Soptimal(a,b)=1;
              end
              e1(r,1)=abs(k1(a,b)-k1(a-2,b));
              if e1(r,1)<abs(k1(a,b)-k1(a,b+2))
                  e1(r,1)=abs(k1(a,b)-k1(a,b+2));
                  % Soptimal(a,b)=2;
              end
              e2(r,1)=abs(k2(a,b)-k2(a-4,b));
              if e2(r,1)<abs(k2(a,b)-k2(a,b+4))
                  e2(r,1)=abs(k2(a,b)-k2(a,b+4));
                   %Soptimal(a,b)=4;
              end
               e3(r,1)=abs(k3(a,b)-k3(a,b+8));
                if e3(r,1)<abs(k3(a,b)-k3(a-8,b))
                  e3(r,1)=abs(k3(a,b)-k3(a-8,b));
                   %Soptimal(a,b)=4;
                end
              e4(r,1)=abs(k4(a,b)-k4(a,b+16));
                if e4(r,1)<abs(k4(a,b)-k4(a-16,b))
                  e4(r,1)=abs(k4(a,b)-k4(a-16,b));
                   %Soptimal(a,b)=4;
                end
     e5(r,1)=abs(k5(a,b)-k5(a,b+32));
                if e5(r,1)<abs(k5(a,b)-k5(a-32,b))
                  e5(r,1)=abs(k5(a,b)-k5(a-32,b));
                   %Soptimal(a,b)=4;
                end 
                
                
                a=r ; b=c;
                
                
                e0(r,c)=abs(k0(a,b)-k0(a,b-1));
             % Soptimal(a,b)=1;
              if  e0(1,1)<abs(k0(a,b)-k0(a-1,b))
                   e0(1,1)=abs(k0(a,b)-k0(a-1,b));
                %   Soptimal(a,b)=1;
              end
              e1(r,c)=abs(k1(a,b)-k1(a-2,b));
              if e1(1,1)<abs(k1(a,b)-k1(a,b-2))
                  e1(1,1)=abs(k1(a,b)-k1(a,b-2));
                  % Soptimal(a,b)=2;
              end
              e2(r,c)=abs(k2(a,b)-k2(a-4,b));
              if e2(r,c)<abs(k2(a,b)-k2(a,b-4))
                  e2(r,c)=abs(k2(a,b)-k2(a,b-4));
                   %Soptimal(a,b)=4;
              end
               e3(r,c)=abs(k3(a,b)-k3(a,b-8));
                if e3(r,c)<abs(k3(a,b)-k3(a-8,b))
                  e3(r,c)=abs(k3(a,b)-k3(a-8,b));
                   %Soptimal(a,b)=4;
                end
              e4(r,c)=abs(k4(a,b)-k4(a,b-16));
                if e4(r,c)<abs(k4(a,b)-k4(a-16,b))
                  e4(r,c)=abs(k4(a,b)-k4(a-16,b));
                   %Soptimal(a,b)=4;
                end
     e5(r,c)=abs(k5(a,b)-k5(a,b-32));
                if e5(r,c)<abs(k5(a,b)-k5(a-32,b))
                  e5(r,c)=abs(k5(a,b)-k5(a-32,b));
                   %Soptimal(a,b)=4;
                end 
                
                % e0 1st row/ last row /
                for b=2:c-1
                    e0(1,b)=abs(k0(1,b)-k0(1,b+1));
                    if e0(1,b)<abs(k0(1,b)-k0(1,b-1))
                        e0(1,b)=abs(k0(1,b)-k0(1,b-1));
                    end
                      if e0(1,b)<abs(k0(1,b)-k0(2,b))
                        e0(1,b)=abs(k0(1,b)-k0(2,b));
                      end
                      
                      e0(r,b)=abs(k0(r,b)-k0(r,b+1));
                    if e0(r,b)<abs(k0(r,b)-k0(r,b-1))
                        e0(r,b)=abs(k0(r,b)-k0(r,b-1));
                    end
                      if e0(r,b)<abs(k0(r,b)-k0(r-1,b))
                        e0(r,b)=abs(k0(r,b)-k0(r-1,b));
                      end
                    
                end
                % e0 1st col/ last col /
                for a=2:r-1
                    e0(a,1)=abs(k0(a,1)-k0(a-1,b));
                    if e0(a,1)<abs(k0(a,1)-k0(a,b+1))
                        e0(a,1)=abs(k0(a,1)-k0(a,b+1));
                    end
                      if e0(a,1)<abs(k0(a,1)-k0(a+1,b))
                        e0(a,1)=abs(k0(a,1)-k0(a+1,b));
                      end
                      
                      e0(a,c)=abs(k0(a,c)-k0(a,c-1));
                    if e0(a,c)<abs(k0(a,c)-k0(a+1,c))
                        e0(a,c)=abs(k0(a,c)-k0(a+1,c));
                    end
                      if e0(a,c)<abs(k0(a,c)-k0(a-1,c))
                        e0(a,c)=abs(k0(a,c)-k0(a-1,c));
                      end
                    
                end
                % e0 rest
                for a=2:r-1
                    for b=2:c-1
                        %if 
                        e0(a,b)=abs(k0(a,b)-k0(a+1,b));
                        if  e0(a,b)<abs(k0(a,b)-k0(a-1,b))
                             e0(a,b)=abs(k0(a,b)-k0(a-1,b));
                        end
                       
                        if  e0(a,b)<abs(k0(a,b)-k0(a,b+1))
                             e0(a,b)=abs(k0(a,b)-k0(a,b+1));
                        end
                        if  e0(a,b)<abs(k0(a,b)-k0(a,b-1))
                             e0(a,b)=abs(k0(a,b)-k0(a,b-1));
                        end
                        
                    end
                    
                end
              %e0 complete  
                
            % e2
            for a=3:r-2
                for b=3:c-2
                   e1(a,b)=abs(k1(a,b)-k1(a+2,b));
                        if  e1(a,b)<abs(k1(a,b)-k1(a-2,b))
                             e1(a,b)=abs(k1(a,b)-k1(a-2,b));
                        end
                        
                        if  e1(a,b)<abs(k1(a,b)-k1(a,b+2))
                             e1(a,b)=abs(k1(a,b)-k1(a,b+2));
                        end
                        if  e1(a,b)<abs(k1(a,b)-k1(a,b-2))
                             e1(a,b)=abs(k1(a,b)-k1(a,b-2));
                        end
                        
                end
                
            end
             for a=5:r-4
                for b=5:c-4
                   e2(a,b)=abs(k2(a,b)-k2(a+4,b));
                        if  e2(a,b)<abs(k2(a,b)-k2(a-4,b))
                             e2(a,b)=abs(k2(a,b)-k2(a-4,b));
                        end
                        
                        if  e2(a,b)<abs(k2(a,b)-k2(a,b+4))
                             e2(a,b)=abs(k2(a,b)-k2(a,b+4));
                        end
                        if  e2(a,b)<abs(k2(a,b)-k2(a,b-4))
                             e2(a,b)=abs(k2(a,b)-k2(a,b-4));
                        end
                        
                end
                
             end
            
             for a=9:r-8
                for b=9:c-8
                   e3(a,b)=abs(k3(a,b)-k3(a+8,b));
                        if  e3(a,b)<abs(k3(a,b)-k3(a-8,b))
                             e3(a,b)=abs(k3(a,b)-k3(a-8,b));
                        end
                        
                        if  e3(a,b)<abs(k3(a,b)-k3(a,b+8))
                             e3(a,b)=abs(k3(a,b)-k3(a,b+8));
                        end
                        if  e3(a,b)<abs(k3(a,b)-k3(a,b-8))
                             e3(a,b)=abs(k3(a,b)-k3(a,b-8));
                        end
                        
                end
                
             end
            
              for a=17:r-16
                for b=17:c-16
                   e4(a,b)=abs(k4(a,b)-k4(a+16,b));
                        if  e4(a,b)<abs(k4(a,b)-k4(a-16,b))
                             e4(a,b)=abs(k4(a,b)-k4(a-16,b));
                        end
                        
                        if  e4(a,b)<abs(k4(a,b)-k4(a,b+16))
                             e4(a,b)=abs(k4(a,b)-k4(a,b+16));
                        end
                        if  e4(a,b)<abs(k4(a,b)-k4(a,b-16))
                             e4(a,b)=abs(k4(a,b)-k4(a,b-16));
                        end
                        
                end
                
             end
              for a=33:r-32
                for b=33:c-32
                   e5(a,b)=abs(k5(a,b)-k5(a+32,b));
                        if  e5(a,b)<abs(k5(a,b)-k5(a-32,b))
                             e5(a,b)=abs(k5(a,b)-k5(a-32,b));
                        end
                        
                        if  e5(a,b)<abs(k5(a,b)-k5(a,b+32))
                             e5(a,b)=abs(k5(a,b)-k5(a,b+32));
                        end
                        if  e5(a,b)<abs(k5(a,b)-k5(a,b-32))
                             e5(a,b)=abs(k5(a,b)-k5(a,b-32));
                        end
                        
                end
                
             end 
             sum=0;   
            for a=1:r
                for b=1:c
                    temp=e0(a,b);
                    Soptimal(a,b)=1;
                    if temp<e1(a,b)
                        temp=e1(a,b);
                        Soptimal(a,b)=2;
                    end
                    if temp<e2(a,b)
                        temp=e2(a,b);
                        Soptimal(a,b)=4;
                    end
                    if temp<e3(a,b)
                        temp=e3(a,b);
                        Soptimal(a,b)=8;
                    end
                    if temp<e4(a,b)
                        temp=e4(a,b);
                        Soptimal(a,b)=16;
                    end
                    if temp<e5(a,b)
                        temp=e5(a,b);
                        Soptimal(a,b)=32;
                    end
                    sum=sum+Soptimal(a,b);
                end
                
            end
            coarse(i)=double(sum/(r*c));
            disp(filename);
            disp(coarse(i));
            
            NextRow={filename,coarse(i)};
            writeStatus = xlswrite('d.xls', NextRow, 'l',rowf);
       rownum=rownum+1;
end
