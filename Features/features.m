clc;
clear;
close all;
srcFiles = dir('D:\Users\harsha\Desktop\all\*.jpg'); 
disp('Features ');

nof=1;
TopRow={'Image Name','entropy','Mean','standard deviation','variance','Energy','skewness','kurtosis','glcm contrast','glcm correlation','glcm energy','glcm homogeneity','GLCM ASM Haralicks feature 1','Haralicks Feature 2','Haralicks Feature 3','Haralicks Feature 4','Haralicks Feature 5','Haralicks Feature 6','Haralicks Feature 7','Haralicks Feature 8','Haralicks Feature 9','Haralicks Feature 10','contrast','GM1','GM2','GM3','GM4','GM5','GM6','GM7','GM8','GM9','GM10','centriod x coordinate','centriod y coordinate','CM 1','CM 2','CM 3','CM 4','CM 5','CM 6','CM 7','CM 8','CM 9','CM 10','SIM 1','SIM 2','SIM 3','SIM 4','SIM 5','SIM 6','SIM 7','RIM 1','RIM 2','RIM 3','RIM 4';};
a=['Hello','s','asa';];
writeStatus = xlswrite('data.xls', TopRow, 'allp','A1');
disp('excel');
disp(writeStatus);
disp('**');
noimages=length(srcFiles);
%X=zeros(noimages,56);
X=zeros(noimages,56);
entrpy= zeros(noimages,1);
energy= zeros(noimages,1);
homo= zeros(noimages,1);
kurtosis= zeros(noimages,1);
meanval= zeros(noimages,1);
skewness= zeros(noimages,1);
stdeviation= zeros(noimages,1);
variance= zeros(noimages,1);
contrast=zeros(noimages,1);
circularity=zeros(noimages,1);
glcm_contrast=zeros(noimages,1);
glcm_corelation=zeros(noimages,1);
glcm_energy=zeros(noimages,1);
glcm_homogenity=zeros(noimages,1);
glcm_ASM=zeros(noimages,1);
glcm_entropy=zeros(noimages,1);

m00=zeros(noimages,1);
m01=zeros(noimages,1);
m10=zeros(noimages,1);
m11=zeros(noimages,1);
m20=zeros(noimages,1);
m02=zeros(noimages,1);
m21=zeros(noimages,1);
m12=zeros(noimages,1);
m30=zeros(noimages,1);
m03=zeros(noimages,1);

rm_c_x=zeros(noimages,1); % raw moment centroid ka x coordinate
rm_c_y=zeros(noimages,1); % raw moment centroid ka y coordinate

u00=zeros(noimages,1);
u01=zeros(noimages,1);
u10=zeros(noimages,1);
u11=zeros(noimages,1);
u20=zeros(noimages,1);
u02=zeros(noimages,1);
u21=zeros(noimages,1);
u12=zeros(noimages,1);
u30=zeros(noimages,1);
u03=zeros(noimages,1);

n11=zeros(noimages,1);
n20=zeros(noimages,1);
n02=zeros(noimages,1);
n21=zeros(noimages,1);
n12=zeros(noimages,1);
n30=zeros(noimages,1);
n03=zeros(noimages,1);

rm1=zeros(noimages,1);
rm2=zeros(noimages,1);
rm3=zeros(noimages,1);
rm4=zeros(noimages,1);
rm5=zeros(noimages,1);
rm6=zeros(noimages,1);
rm7=zeros(noimages,1);
rm8=zeros(noimages,1);

%haralicks
hf2=zeros(noimages,1);
hf3=zeros(noimages,1);
hf4=zeros(noimages,1);
hf5=zeros(noimages,1);
hf6=zeros(noimages,1);
hf7=zeros(noimages,1);
hf8=zeros(noimages,1);
hf11=zeros(noimages,1);
hf10=zeros(noimages,1);

direcmag=zeros(noimages,1);
direcangle=zeros(noimages,1);

rownum=2;
h=fspecial('gaussian',5,1.4);
%disp('gaussian');
for i = 1 : length(srcFiles)
    disp(i);
    
    srt='A';
    strrow=int2str(rownum);
    rowf=strcat(srt,strrow);
    disp('Row to print');
    disp(rowf);
    filename = strcat('D:\Users\harsha\Desktop\all\',srcFiles(i).name);
    I = imread(filename);
    I=rgb2gray(I);
    
    number=1;
    newImage=imfilter(I,h,'replicate');
      % figure, imshow(I);title('Original');
  % figure, imshow(newImage);title('After Preprocessing');
    %I=GAUSSIAN2D(I,1.4);
    %figure, imshow(I);
    disp('image features');
    entrpy(i)=ENTROPY(newImage);
    disp('Feature Number');
    disp(number);
    %X(i,number)=entrpy(i);
     X(i,number)=entrpy(i);
    number=number+1;
    disp('entropy');
    disp(entrpy(i));
    disp('Feature Number');
    disp(number);
    number=number+1;
    %mean
    meanval(i)=mean2(newImage);
    disp('Mean');
    disp(meanval(i));
    X(i,number)=meanval(i);
    
    disp('Feature Number');
    disp(number);
    number=number+1;
    %standard deviation
    stdeviation(i)= std2(newImage);
    disp('standard deviation');
    disp(stdeviation(i));
     X(i,number)=stdeviation(i);
    disp('Feature Number');
    disp(number);
    number=number+1;
    %variance
    variance(i)=double(stdeviation(i)^2);
    disp('variance');
    X(i,number)=variance(i);
    disp(variance(i));
    disp('Feature Number');
    disp(number);
    number=number+1;
    %energy
    [r c]=size(newImage);
    sum=0;sumsk=0;sumkr=0;
    for a=1:r
        for b=1:c
            
            t=newImage(a,b);
            t=double(t*t);
            sum=double(sum+t);
            %disp(sum);
            
            
            %start skewness
            sumsk=double(sumsk+double((newImage(a,b)-meanval(i))^3));
            %end skewness
            
            %start kurtosis
            sumkr=double(sumkr+double((newImage(a,b)-meanval(i))^4));
            %end kurtosis
            
        end
    end
    energy(i)=double(sum/(r*c));
    disp('Energy');
    X(i,number)=energy(i);
    disp(energy(i));
    
    temp1=double(variance(i)^2);
    %disp('temp1');
    %disp(temp1);
    sumsk=double(sumsk/(r*c*variance(i)));
    skewness(i)=sumsk;
    disp('Feature Number');
    disp(number);
    number=number+1;
    disp('skewness');
    disp(skewness(i));
    X(i,number)=skewness(i);
    
    sumkr=double(sumkr/(r*c*temp1));
    kurtosis(i)=double(sumkr);
    disp('Feature Number');
    disp(number);
    number=number+1;
   %kurtosis(i)=double(sumkr)-3;
    disp('kurtosis');
    disp(kurtosis(i));
    X(i,number)=kurtosis(i);
  % kh=graycoprops(graycomatrix(newImage), 'Contrast');
  % glcm_contrast(i)=kh;
   %disp('kl');
    %disp(kh);
    %GLCM features
    glcm_contrast(i) = struct2array(graycoprops(graycomatrix(newImage), 'Contrast'));
    glcm_corelation(i) = struct2array(graycoprops(graycomatrix(newImage), 'Correlation'));
    glcm_energy(i) =struct2array( graycoprops(graycomatrix(newImage), 'Energy'));
    glcm_homogenity(i) =struct2array( graycoprops(graycomatrix(newImage), 'Homogeneity'));
    disp('Feature Number');
    disp(number);
    number=number+1;
    disp('glcm contrast');
    disp(glcm_contrast(i));
    X(i,number)=glcm_contrast(i);
    disp('Feature Number');
    disp(number);
    number=number+1;
    disp('Feature Number');
    disp(number);
    number=number+1;
    disp('glcm correlation');
    disp(glcm_corelation(i));
     X(i,number)=glcm_corelation(i);
    disp('Feature Number');
    disp(number);
    number=number+1;
    disp('glcm energy');
    disp(glcm_energy(i));
    X(i,number)=glcm_energy(i);
    disp('Feature Number');
    disp(number);
    number=number+1;
    disp('glcm homogeneity');
    disp(glcm_homogenity(i));
    X(i,number)=glcm_homogenity(i);
    
   P=graycomatrix(newImage);
    [row,col]=size(P);
    disp('size');
   % disp(row);
  %disp(col);
    COM=zeros(row,col);
    for a=1:row
        for b=1:col
            COM(a,b)=double(P(a,b)/(row*col));
        end
        
    end
    px=zeros(row,1);
    py=zeros(row,1);
    mux=0;
    muy=0;
    v=2*row;
    
    pxy=zeros(v);
    px_y=zeros(row);
    sigmax=0;
    sigmay=0;
    Hx=0;
    Hy=0;
    for a=1:row
        for b=1:row
        px(a)=double(px(a)+COM(a,b));
        py(b)=double(py(b)+COM(a,b));
        t=abs(a-b);
        px_y(t+1)= px_y(t+1)+COM(a,b);
        end
    end
   for a=1:row
       mux=mux+(a*px(a));
        muy=muy+(a*py(a));
   end
   for a=1:row
       sigmax=double(sigmax+(px(a)*(a-mux)^2));
       sigmay=double(sigmay+(py(a)*(a-muy)^2));
       Hx=double(Hx+ (-px(a)*log(px(a))));
        Hy=double(Hy+ (-py(a)*log(py(a))));
   end
   for a=1:row
       for b=1:col
           
       pxy(a+b)=pxy(a+b)+COM(a,b);
       end
   end
    sigmax=double(sigmax^0.5);
    sigmay=double(sigmay^0.5);
    
    %disp('Testing GLCM');
    %disp(P);
   % [row,col]=size(P);
    sum_asm=0;
    sum_entropy=0;
    t=0;
    for a =1:row
        for b=1:col
            t=t+COM(a,b);
        end
        
    end
    muglcm=t/(row*col);
    
   % muglcm=mean(COM);
    disp('mean');
    disp(muglcm);
    %haralicks  f1 and f9
    for a=1:row
        for b=1:col
            sum_asm=double(COM(a,b)^2)+sum_asm;
            sum_entropy=double(-(COM(a,b)*log(COM(a,b))));
            % Angular second moment calculation 
        end
        
    end
    glcm_ASM(i)=sum_asm;
    glcm_entropy(i)=sum_entropy;
    disp('Feature Number'); disp(number); number=number+1;
    disp('GLCM ASM Haralicks feature 1');
    disp(glcm_ASM(i));
     X(i,number)=glcm_ASM(i);
    disp('Feature Number');
    disp(number);
    number=number+1;
    disp('GLCM ENTROPY Haralicks feature 9');
      if glcm_entropy(i)<0
           glcm_entropy(i)=-glcm_entropy(i);
       end
    disp(glcm_entropy(i));
    X(i,number)=glcm_entropy(i);
    temp=0;
     for a=1:row
        for b=1:col
            temp=double(temp+COM(a,b));
          hf2(i)=double(hf2(i)+ ((a-1)^2 *(temp))); 
          t=double(((a-mux)*(b-muy)*COM(a,b))/(sigmax*sigmay));
          hf3(i)=double(hf3(i)+t);
          temp1=double(((a-muglcm)^2)*COM(a,b));
          hf4(i)=hf4(i)+temp1;
          hf5(i)=double(hf5(i)+((1/(1+(a-b)^2))*COM(a,b)));
          
        end
     end
     for k=2:v
         hf6(i)=hf6(i)+double(k*pxy(k));
         hf7(i)=hf7(i)+double(((k-hf6(i))^2)*pxy(k));
         hf8(i)=hf8(i)-double((log(pxy(k)))*pxy(k));
     end
     t=0;
     for k=1:row
         for l=1:row
             t=t+ l*px_y(l);
         end
         hf10(i)=hf10(i)+double(((k-t)^2)*px_y(k));
        % hf11(i)=hf11(i)-double((log(px_y(k)))*px_y(k));
     end
     disp('Feature Number');
    disp(number);
    number=number+1;
   disp('Haralicks Feature 2');
   if hf2(i)<0
       hf2(i)=-hf2(i);
   end
       
       
   disp(hf2(i));
   X(i,number)=hf2(i);
   disp('Feature Number');
    disp(number);
    number=number+1;
   disp('Haralicks Feature 3');
   if hf3(i)<0
       hf3(i)=-hf3(i);
   end
   disp(hf3(i));
    X(i,number)=hf3(i);
    if hf4(i)<0
       hf4(i)=-hf4(i);
   end
   disp('Feature Number');
    disp(number);
    number=number+1;
   disp('Haralicks Feature 4');
   disp(hf4(i));
    X(i,number)=hf4(i);
   disp('Feature Number');
    disp(number);
    number=number+1;
    if hf5(i)<0
       hf5(i)=-hf5(i);
   end
   disp('Haralicks Feature 5');
   disp(hf5(i));
    X(i,number)=hf5(i);
   disp('Feature Number');
    disp(number);
    number=number+1;
    if hf6(i)<0
       hf6(i)=-hf6(i);
   end
    disp('Haralicks Feature 6');
   disp(hf6(i));
   X(i,number)=hf6(i);
   disp('Feature Number');
    disp(number);
    number=number+1;
    if hf7(i)<0
       hf7(i)=-hf7(i);
   end
   disp('Haralicks Feature 7');
   disp(hf7(i));
   X(i,number)=hf7(i);
   disp('Feature Number');
    disp(number);
    number=number+1;
    if hf8(i)<0
       hf8(i)=-hf8(i);
   end
    disp('Haralicks Feature 8');
   disp(hf8(i));
   X(i,number)=hf8(i);
   disp('Feature Number');
    disp(number);
    number=number+1;
    if hf10(i)<0
       hf10(i)=-hf10(i);
   end
   disp('Haralicks Feature 10');
   disp(hf10(i));
   X(i,number)=hf10(i);
    %disp('Haralicks Feature 11');
   %disp(hf11(i));
   % normal contrast
   mu=0;
   for a=1:r
       for b=1:c
          mu=mu+double((newImage(a,b)-meanval(i))^4);  %fourth moment   
       end
   end
    
   alpha4=double(mu/(variance(i)^2));
   alpha4=double(alpha4^.25);
   contrast(i)=stdeviation(i)/alpha4;
   disp('Feature Number');
    disp(number);
    number=number+1;
    if contrast(i)<0
      contrast(i)=-contrast(i);
   end
   disp('normal contrast');
   disp(contrast(i));
   X(i,number)=contrast(i);
   
   %SHAPE FEATUES
   %circularity
   bw=zeros(r,c);
   for a=1:r
       for b=1:c
           if (newImage(a,b)>127)
               bw(a,b)=255;
           end
               
       end    
   end
   
   %stats=struct2array(regionprops(bw,'perimeter','area'));
   %pm=stats.Perimeter;
   %are=stats.Area;
   %pm=double(pr.Perimeter);
   %disp('Peri');
   %disp(pm);
  % ar=struct2array(regionprops(bw,'area'));
   %are=ar.Area;
   %circularity(i)=double((4*pi*are)/(pm^2));
   %disp('circularity');
   %disp(circularity(i));
   
   
   
   %Directionality of image
   %[Gmag,Gdir] = imgradient(newImage);
  % disp('GMag');
  % disp(Gmag);
   
   
   
   
   
      
   %GEOMETRIC MOMENTS
     %image properties derieved via raw moments include area ,centroid..
     
     % moment of order 0 
     
       p=0;q=0;sum=0;  
       for a=1:r
           for b=1:c
              sum=double(sum+double((a^p)*(b^q)*newImage(a,b))); 
           end
       end
       m00(i)=sum;
       disp('Feature Number'); disp(number); number=number+1;
       disp('GM 1');
         if m00(i)<0
           m00(i)=-m00(i);
         end
       disp(m00(i));
       X(i,number)=m00(i);
       % moment of order 1
     
       p=0;q=1;sum=0;
       for a=1:r
           for b=1:c
              sum=double(sum+double((a^p)*(b^q)*newImage(a,b))); 
           end
       end
       m01(i)=sum;
       disp('Feature Number'); disp(number); number=number+1;
       disp('GM 2');
        if m01(i)<0
           m01(i)=-m01(i);
         end
       disp(m01(i));
        X(i,number)=m01(i);
       % moment of order 1
     
       p=1;q=0;sum=0;
       for a=1:r
           for b=1:c
              sum=double(sum+double((a^p)*(b^q)*newImage(a,b))); 
           end
       end
       m10(i)=sum;
       disp('Feature Number'); disp(number); number=number+1;
       disp('GM 3');
        if m10(i)<0
           m10(i)=-m10(i);
         end
       disp(m10(i));
        X(i,number)=m10(i);
       % moment of order 2
     
       p=1;q=1;sum=0;
       for a=1:r
           for b=1:c
              sum=double(sum+double((a^p)*(b^q)*newImage(a,b))); 
           end
       end
       m11(i)=sum;
       disp('Feature Number'); disp(number); number=number+1;
       disp('GM 4');
        if m11(i)<0
           m11(i)=-m11(i);
         end
       disp(m11(i));
        X(i,number)=m11(i);
       % moment of order 2
     
       p=2;q=0;sum=0;
       for a=1:r
           for b=1:c
              sum=double(sum+double((a^p)*(b^q)*newImage(a,b))); 
           end
       end
       m20(i)=sum;
       disp('Feature Number'); disp(number); number=number+1;
       disp('GM 5');
        if m20(i)<0
           m20(i)=-m20(i);
         end
       disp(m20(i));
       X(i,number)=m20(i);
       % moment of order 2
     
       p=0;q=2;sum=0;
       for a=1:r
           for b=1:c
              sum=double(sum+double((a^p)*(b^q)*newImage(a,b))); 
           end
       end
       m02(i)=sum;
       disp('Feature Number'); disp(number); number=number+1;
       disp('GM 6');
        if m02(i)<0
           m02(i)=-m02(i);
         end
       disp(m02(i));
       X(i,number)=m02(i);
       % moment of order 3
     
       p=2;q=1;sum=0;
       for a=1:r
           for b=1:c
              sum=double(sum+double((a^p)*(b^q)*newImage(a,b))); 
           end
       end
       m21(i)=sum;
       disp('Feature Number'); disp(number); number=number+1;
       disp('GM 7');
        if m21(i)<0
           m21(i)=-m21(i);
         end
       disp(m21(i));
       X(i,number)=m21(i);
       % moment of order 3
     
       p=1;q=2;sum=0;
       for a=1:r
           for b=1:c
              sum=double(sum+double((a^p)*(b^q)*newImage(a,b))); 
           end
       end
       m12(i)=sum;
       disp('Feature Number'); disp(number); number=number+1;
       disp('GM 8');
        if m12(i)<0
           m12(i)=-m12(i);
         end
       disp(m12(i));
        X(i,number)=m12(i);
       % moment of order 3
     
       p=3;q=0;sum=0;
       for a=1:r
           for b=1:c
              sum=double(sum+double((a^p)*(b^q)*newImage(a,b))); 
           end
       end
       m30(i)=sum;
       disp('Feature Number'); disp(number); number=number+1;
       disp('GM 9');
        if m30(i)<0
           m30(i)=-m30(i);
         end
       disp(m30(i));
       X(i,number)=m30(i);
       % moment of order 3
     
       p=0;q=3;sum=0;
       for a=1:r
           for b=1:c
              sum=double(sum+double((a^p)*(b^q)*newImage(a,b))); 
           end
       end
       m03(i)=sum;
       disp('Feature Number'); disp(number); number=number+1;
       disp('GM 10');
        if m03(i)<0
           m03(i)=-m03(i);
         end
       disp(m03(i));
        X(i,number)=m03(i);
       % raw moment centroid x coordinate
       rm_c_x(i)= double(m10(i)/m00(i));
       disp('Feature Number'); disp(number); number=number+1;
       disp('centriod x coordinate');
       disp(rm_c_x(i));
        X(i,number)=rm_c_x(i);
       % raw moment centroid y coordinate
       rm_c_y(i)= double(m01(i)/m00(i));
       disp('centroid y coordinate');
       disp(rm_c_y(i));
        X(i,number)=rm_c_y(i);
     %CENTRAL MOMENTS : THESE ARE TRANSLATIONAL INVARIANT
       
       
       u00(i)=m00(i);  disp('Feature Number'); disp(number); number=number+1;  disp('CM 1'); disp(u00(i)); X(i,number)=u00(i);
       u01(i)=0;   disp('Feature Number'); disp(number); number=number+1;   disp('CM 2'); disp(u01(i)); X(i,number)=u01(i);
       u10(i)=0;    disp('Feature Number'); disp(number); number=number+1;  disp('CM 3'); disp(u10(i)); X(i,number)=u10(i);
       u11(i)=double(m11(i)-double(rm_c_x(i)*m01(i)));  disp('Feature Number'); disp(number); number=number+1;  disp('CM 4'); 
       if u11(i)<0
           u11(i)=-u11(i);
       end
       disp(u11(i)); 
       X(i,number)=u11(i);
       u20(i)=double(m20(i)-double(rm_c_x(i)*m10(i)));  disp('Feature Number'); disp(number); number=number+1;   disp('CM 5'); 
       if u20(i)<0
           u20(i)=-u20(i);
       end
       disp(u20(i)); X(i,number)=u20(i);
       u02(i)=double(m02(i)-double(rm_c_y(i)*m01(i)));  disp('Feature Number'); disp(number); number=number+1;  disp('CM 6'); 
       if u02(i)<0
           u02(i)=-u02(i);
       end
       disp(u02(i)); X(i,number)=u02(i);
       u21(i)=double(m21(i)-double(2*rm_c_x(i)*m11(i))-double(rm_c_y(i)*m20(i))+double(2*rm_c_x(i)*rm_c_x(i)*m01(i))); disp('Feature Number'); disp(number); number=number+1; disp('CM 7'); disp(u21(i)); X(i,number)=u21(i);
       u12(i)=double(m12(i)-double(2*rm_c_y(i)*m11(i))-double(rm_c_x(i)*m02(i))+double(2*rm_c_y(i)*rm_c_y(i)*m10(i))); disp('Feature Number'); disp(number); number=number+1; disp('CM 8'); disp(u12(i)); X(i,number)=u12(i);
       u30(i)=double(m30(i)-double(3*rm_c_x(i)*m20(i))+double(2*rm_c_x(i)*rm_c_x(i)*m10(i))); disp('Feature Number'); disp(number); number=number+1;  disp('CM 9'); disp(u30(i)); X(i,number)=u30(i);
       u03(i)=double(m03(i)-double(3*rm_c_y(i)*m02(i))+double(2*rm_c_y(i)*rm_c_y(i)*m01(i))); disp('Feature Number'); disp(number); number=number+1;  disp('CM 10'); disp(u03(i)); X(i,number)=u03(i);
       
    %SCALE INVARIANT MOMENTS
       
       p=1;q=1;sum=0;
       sum=(p+q)/2;
       sum=sum+1;
       n11(i)=double(u11(i)/(u00(i)^sum));
       disp('Feature Number'); disp(number); number=number+1;
       disp('SIM 1'); 
       if n11(i)<0
           n11(i)=-n11(i);
       end
       
       disp(n11(i));
        X(i,number)=n11(i);
       p=2;q=0;sum=0;
       sum=(p+q)/2;
       sum=sum+1;
       n20(i)=double(u20(i)/(u00(i)^sum));
       disp('Feature Number'); disp(number); number=number+1;
       disp('SIM 2'); 
       if n20(i)<0
           n20(i)=-n20(i);
       end
       disp(n20(i));
       X(i,number)=n20(i);
       p=0;q=2;sum=0;
       sum=(p+q)/2;
       sum=sum+1;
       n02(i)=double(u02(i)/(u00(i)^sum));
       disp('Feature Number'); disp(number); number=number+1;
       disp('SIM 3'); 
         if n02(i)<0
           n02(i)=-n02(i);
         end
       disp(n02(i));
       X(i,number)=n02(i);
       p=2;q=1;sum=0;
       sum=(p+q)/2;
       sum=sum+1;
       n21(i)=double(u21(i)/(u00(i)^sum));
       disp('Feature Number'); disp(number); number=number+1;
       disp('SIM 4'); disp(n21(i));
       X(i,number)=n21(i);
       p=1;q=2;sum=0;
       sum=(p+q)/2;
       sum=sum+1;
       n12(i)=double(u12(i)/(u00(i)^sum));
       disp('Feature Number'); disp(number); number=number+1;
       disp('SIM 5'); disp(n12(i));
       X(i,number)=n12(i);
       
       p=3;q=0;sum=0;
       sum=(p+q)/2;
       sum=sum+1;
       n30(i)=double(u30(i)/(u00(i)^sum));
       disp('Feature Number'); disp(number); number=number+1;
       disp('SIM 6'); disp(n30(i));
       X(i,number)=n30(i);
       p=0;q=3;sum=0;
       sum=(p+q)/2;
       sum=sum+1;
       n03(i)=double(u03(i)/(u00(i)^sum));
       disp('Feature Number'); disp(number); number=number+1;
       disp('SIM 7'); disp(n03(i));
       X(i,number)=n03(i);
     %ROTATION INVARIANT MOMENTS
       
        
       rm1(i)=n20(i)+n02(i); disp('Feature Number'); disp(number); number=number+1; disp('RIM 1'); 
         if rm1(i)<0
           rm1(i)=-rm1(i);
       end
       disp(rm1(i));X(i,number)=rm1(i);
       rm2(i)=double((n20(i)-n02(i))^2)+double(4*(n11(i)^2)); disp('Feature Number'); disp(number); number=number+1; disp('RIM 2'); disp(rm2(i));X(i,number)=rm2(i);
       rm3(i)=double((n30(i)-3*n12(i))^2)+double((3*n21(i)-n03(i))^2); disp('RIM 3'); disp('Feature Number'); disp(number); number=number+1; disp(rm3(i));X(i,number)=rm3(i);
       rm4(i)=double((n30(i)+n12(i))^2)+double((n21(i)+n03(i))^2); disp('Feature Number'); disp(number); number=number+1;disp('RIM 4'); disp(rm4(i));X(i,number)=rm4(i);
       
       
       NextRow={filename,entrpy(i),meanval(i),stdeviation(i),variance(i),energy(i),skewness(i),kurtosis(i),glcm_contrast(i),glcm_corelation(i),glcm_energy(i),glcm_homogenity(i),glcm_ASM(i),hf2(i),hf3(i),hf4(i),hf5(i),hf6(i),hf7(i),hf8(i),glcm_entropy(i),hf10(i),contrast(i),m00(i),m01(i),m10(i),m11(i),m20(i),m02(i),m21(i),m12(i),m30(i),m03(i),rm_c_x(i),rm_c_y(i),u00(i),u01(i),u10(i),u11(i),u20(i),u02(i),u21(i),u12(i),u30(i),u03(i),n11(i),n20(i),n02(i),n21(i),n12(i),n30(i),n03(i),rm1(i),rm2(i),rm3(i),rm4(i);};
       writeStatus = xlswrite('data.xls', NextRow, 'allp',rowf);
       rownum=rownum+1;
       %rownum=char(rownum);
       %disp(rowf);
       
       
       
     
       
       
       
   
       
    
   
    
    
end % end file directory
%[eigenvectors, projected_data, eigenvalues] = princomp(X);
%[foo, feature_idx] = sort(eigenvalues, 'descend');
%selected_projected_data = projected(:, feature_idx(1:10));
%[residuals,reconstructed] = pcares(X,10);
%[rows cols]=size(residuals);
%disp('rows');
%
%disp(rows);
%disp('cols');
%disp(cols);
%disp(reduced);
%disp(reconstructed)
%disp(' Reduced FEATURES');
%disp(selected_projected_data);




