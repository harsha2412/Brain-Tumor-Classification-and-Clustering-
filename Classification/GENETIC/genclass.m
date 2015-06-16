psize=50;
noi=3;
num_of_gen=100;
macc=zeros(num_of_gen,1);

d=5;
D=47;
nos=20;
notr=80;
fitPop=zeros(num_of_gen,D);
itr=1;
classification=zeros(nos,noi);
rn=rand(1);
%e=size(rn);
% training  cell rows in excel 51 to 90 notr values
disp('**********************FEATURE SELECTION*************************************');
Group=[
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
3;
3;
3;
3;
3;
3;
1;
3;
2;
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
%sample whole thing
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
1
];
fr=[5;
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

training=zeros(notr,D);
sample=zeros(nos,D);
%disp(rn);
pr=double(d/D);
%disp(pr);
population=zeros(psize,D);
%READ DATA c2 to AW30
filename = 'final.xlsx';
sheet='dataset';
DMat=xlsread(filename,sheet,'C2:AW90');
%disp(DMat);
tx=89-notr;
for i=1:notr
    for j=1:D
        training(i,j)=DMat(i+tx,j);
    end
end

for i=1:nos
    for j=1:D
        sample(i,j)=DMat(i,j);
    end
end

%[r c]=size(DMat);
%disp(r);
%disp(c);
%create initial population
nof=zeros(psize,1);

for i=1:psize
    
    for g=1:D
        o=rand(1);
       
        %^disp(o);
        if o<pr
        population(i,g)=1;
        nof(i)=nof(i)+1;
        end
    end
    %disp(nof(i));
end
%disp(population);
%check accuracy for each member
l=1;
k=1;
accuracy=zeros(psize,1);
rank=zeros(psize,1);
Rank=zeros(psize,1);
for i=1:psize
    %rcnt=0;
    %disp('Member no.');
    %disp(i);
    %disp('nof');
    %disp(nof(i));
 tr=zeros(notr,nof(i));
 smp=zeros(nos,nof(i));
 
 for g=1:D
      if population(i,g)==1
         % disp('g=')
         % disp(g);
         for j=1:notr
           tr(j,l)=training(j,g);
         end
        
        for j=1:nos
          smp(j,l)=sample(j,g);
        end
        l=l+1;
       end
          
 end
  l=1;
  k=1;
 
%disp(tr);
%disp(smp);
clas=knnclassify(smp,tr,Group);
%disp(clas);
for f=1:nos
    if clas(f)==Ans(f)
        accuracy(i)=accuracy(i)+1;
    end
end
accuracy(i)=double(accuracy(i)/nos);
disp('generation 1')
disp(accuracy(i));
%check accuracy for each i
end % End i for 
    %sorting initial population
  m=max(accuracy);
  
  disp('after gen 1 max= ')
  disp(m);
  generations=1;
while generations<num_of_gen, 
     tpopulation=zeros(psize,D); 
 [sortedValues,sortIndex] = sort(accuracy(:),'descend');
 num_of_selections=15;
 % find the indices of the top n elements 
 maxIndex = sortIndex(1:num_of_selections); 
 % disp(maxIndex);
%disp(accuracy);

accuracy=zeros(psize,1);
%generate new population
% 30 crossovers 5 mutations 15 elite selection
escnt=0;
r=1;
%elite selection

for i=1:num_of_selections
  for g=1:D
      tpopulation(i,g)=population(maxIndex(i),g);
       
  end
end
next=num_of_selections+1;
% cross over elements
num_of_crossovers=30;
%disp('cross over elemects');
co= randi(psize,num_of_crossovers,1);
%disp(co);

num_of_mutations=5;
% co site
%disp('cross over site');
cos=randi([2 psize-1],1,1);
%disp(cos);
% Mutation elements
%disp('mutation elemects');
mu=randi(psize,num_of_mutations,1);
%disp(mu);
% mutation site 
%disp('mutation site');
mus=randi([1 D],1,1);
%disp(mus);
%add mutated elements
for i=1:num_of_mutations
   % disp('mutate');
   % disp(mu(i));
    for g=1:D
        tpopulation(next,g)=population(mu(i),g);
      
            if population(mu(i),mus)==1
                tpopulation(next,mus)=0;
            end
           if population(mu(i),mus)==0
                tpopulation(next,mus)=1;
           end
        
    end
    next=next+1;
end
%disp('next= ');
%disp(next);
% add crossover elements
for i = 1:2:num_of_crossovers
    j=i+1;
    second=next+1;
    for g=1:D
        if g<cos
            tpopulation(next,g)=population(co(i),g);
            tpopulation(second,g)=population(co(j),g);
        end
        if g>=cos
            tpopulation(next,g)=population(co(j),g);
            tpopulation(second,g)=population(co(i),g);
        end
       
        
    end
    next=next+2;
   % disp(i);
end

%disp(tpopulation);
%reinitialise nof
nof=zeros(psize,1);
for i=1:psize
    
    for g=1:D
       
        if tpopulation(i,g)==1; 
        nof(i)=nof(i)+1;
        end
    end
    %disp(nof(i));
end
for i=1:psize
    %rcnt=0;
   % disp('Member no.');
   % disp(i);
    %disp('nof');
    %disp(nof(i));
 tr=zeros(notr,nof(i));
 smp=zeros(nos,nof(i));
 
 for g=1:D
      if tpopulation(i,g)==1
         % disp('g=')
         % disp(g);
         for j=1:notr
           tr(j,l)=training(j,g);
         end
        
        for j=1:nos
          smp(j,l)=sample(j,g);
        end
        l=l+1;
       end
          
 end
  l=1;
  k=1;
 
%disp(tr);
%disp('mid result');
clas=knnclassify(smp,tr,Group);
%disp(clas);
for f=1:nos
    if clas(f)==Ans(f)
        accuracy(i)=accuracy(i)+1;
    end
end
accuracy(i)=double(accuracy(i)/nos);
disp('acc for gen');
disp(accuracy(i));
%check accuracy for each i
end % End i for
%disp('next iteration');
%disp(accuracy);
for i=1:psize
   % disp('for each geneartion');
   % disp(i);
   % disp(accuracy(i));
   % disp(tpopulation(i,:));
    for j=1:D
        population(i,g)=tpopulation(i,g);
    end
end
 m=max(accuracy);
 ind=0;
 for i=1:psize
     if accuracy(i)==m
         ind=i;
         break;
      end
 end
 
% disp('ind of member in generation no')
 %disp(generations);
% disp(ind);
 %ind=find(accuracy==(max(max(accuracy))));
 macc(generations)=m;
% disp('Generation Number');
% disp(generations);
 disp('max accuracy in this gen');
 disp(m);
 for g=1:D
     fitPop(generations,g)=tpopulation(ind,g);

 end
 %disp('member');
% disp(fitPop(generations,:));
% disp('checking accuracy for this member');
 %for g=1:D
  %    if fitPop(generations,g)==1
         % disp('g=')
         % disp(g);
        % for j=1:notr
        %   tr(j,l)=training(j,g);
         %end
        
       % for j=1:nos
        %  smp(j,l)=sample(j,g);
        %end
       % l=l+1;
      % end
          
 %end
 % l=1;
  %cclas=knnclassify(smp,tr,Group);
  %acc=0;
 %for f=1:nos
   % if cclas(f)==Ans(f)
    %    acc=acc+1;
   % end
 %end
%acc=acc/nos;
%disp(acc);

generations=generations+1;
end % end while
maxAcc=macc(1);
for i=1:generations
  if maxAcc<macc(i)
      maxAcc=macc(i);
      
  end
end
ind=0;
%maxAcc=max(macc);
for i=1:generations
if macc(i)==maxAcc
 ind=i;
 break;
end
end

disp('Max ACC :-');
disp(maxAcc);
%ind=find(macc==(max(max(macc))));
disp('Max found in generation number')
disp(ind);
cnt=0;

for g=1:D
    if fitPop(ind,g)==1
        cnt=cnt+1;
    end
end
%disp('Number Of Features to be selected');
%disp(cnt);

fs=zeros(1,cnt+1);
fs(1)=maxAcc;
l=2;
for g=1:D
    if fitPop(ind,g)==1
       fs(l)=g;
       l=l+1;
    end
end
disp('select');
disp('first value is accuracy');
disp(fs);
writeStatus = xlswrite('data.xls', fs, 'selectfeatures','A11');
%disp(writeStatus);

%%classification using the selected features
% create training set 
fsample=zeros(nos,cnt);
ftr=zeros(notr,cnt);




%h=cnt+1;
c=1;
%disp('Selected Member');
%disp(fitPop(ind,:));
for g=1:D
      if fitPop(ind,g)==1
         % disp('g=')
         % disp(g);
         for j=1:notr
           ftr(j,c)=training(j,g);
         end
        
        for j=1:nos
          fsample(j,c)=sample(j,g);
        end
        c=c+1;
       end
          
 end

%disp('tr');
%for i=1:notr
 %   for j=1:cnt
       % disp('fs');
      % disp(fs(1,j+1));
  %    ftr(i,j)=training(i,fs(1,j+1));
     % disp(ftr(i,j))
     %disp(c);
    % c=c+1;
   % end
%end
%for i=1:nos
 %   for j=1:cnt
        %disp('fs');
       % disp(fs(j+1),1);
  %    fsample(i,j)=sample(i,fs(1,j+1));
      %disp(fsample(i,j))
     %disp(c);
    % c=c+1;
   % end
%end
%for i=1:notr
%disp(i);
  %for j=1:cnt
    %  t=fs(j+1,1);
   %   disp(t);
  %    ftr(i,j)=training(i,t);
 % end    
        
%end
fclas=knnclassify(fsample,ftr,Group);
disp('result *****');
disp(fclas);
faccuracy=0;
for f=1:nos
    if fclas(f)==Ans(f)
        faccuracy=faccuracy+1;
    end
end
faccuracy=double(faccuracy/nos)*100;
disp(faccuracy);
%for f=1:nos
%classification(f,itr)=fclas(f);
%end
%itr=itr+1;
%end % end iteration while
%disp('classification');
%disp(classification);
%disp('*****%%%%%%####@!@!@!@!@!@');
%vote=mode(classification,2);
%disp('After Voting')
%disp(vote);
%fiaccuracy=0;
%for f=1:nos
%    if vote(f)==Ans(f)
   %     fiaccuracy=fiaccuracy+1;
   % end
%end
%disp('Final Accuracy');
%faccuracy=double(fiaccuracy/nos)*100;
%disp(fiaccuracy);

%srcFiles = dir('D:\Users\harsha\Desktop\all\*.jpg');
%noimages=length(srcFiles);
%nclass=knncla
%for i = 1 : nos
  % filename = strcat('D:\Users\harsha\Desktop\all\',srcFiles(i).name);
  % I = imread(filename);
  % I=rgb2gray(I);
 %   title='class';
  %  if fclas(i)==1
    %    title='metastasis';
    %end
    % if fclas(i)==2
     %   title='Intra Ventricular Malignant Mass';
     %end
     %if fclas(i)==3
      %  title='glioma';
     %end
     %if fclas(i)==4
     %   title='GBM';
   %  end
    % if fclas(f)==5
      %  title='Central neuro Cytoma';
    %end
  %  figure('Name',title),imshow(I);
%end