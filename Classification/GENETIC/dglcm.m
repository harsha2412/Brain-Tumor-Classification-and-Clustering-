psize=20;
num_of_gen=500;
macc=zeros(num_of_gen,1);

d=1;
D=4;
fitPop=zeros(num_of_gen,D);
rn=rand(1);
%e=size(rn);
% training  cell rows in excel 51 to 90 40 values
disp('**********************FEATURE SELECTION*************************************');
Group=[3;
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
1;

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
training=zeros(40,D);
sample=zeros(89,D);
%disp(rn);
pr=double(d/D);
%disp(pr);
population=zeros(psize,D);
%READ DATA c2 to AW30
filename = 'glcm.xlsx';
%sheet='colordata';
DMat=xlsread(filename,'B2:E90');
%disp(DMat);
for i=1:40
    for j=1:D
        training(i,j)=DMat(i+49,j);
    end
end

for i=1:89
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
 tr=zeros(40,nof(i));
 smp=zeros(89,nof(i));
 
 for g=1:D
      if population(i,g)==1
         % disp('g=')
         % disp(g);
         for j=1:40
           tr(j,l)=training(j,g);
         end
        
        for j=1:89
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
for f=1:89
    if clas(f)==Ans(f)
        accuracy(i)=accuracy(i)+1;
    end
end
accuracy(i)=double(accuracy(i)/89);
%check accuracy for each i
end % End i for 
    %sorting initial population
  m=max(accuracy);
  
  
  generations=1;
while m<0.92 && generations<num_of_gen, 
     tpopulation=zeros(psize,D); 
 [sortedValues,sortIndex] = sort(accuracy(:),'descend');
 num_of_selections=8;
 % find the indices of the top n elements 
 maxIndex = sortIndex(1:num_of_selections); 
 % disp(maxIndex);
%disp(accuracy);

accuracy=zeros(psize,1);
%generate new population
% 10 crossovers 4 mutations 6 elite selection
escnt=0;
r=1;
%eite selection

for i=1:num_of_selections
  for g=1:D
      tpopulation(i,g)=population(maxIndex(i),g);
       
  end
end
next=num_of_selections+1;
% cross over elements
num_of_crossovers=10;
%disp('cross over elemects');
co= randi(psize,num_of_crossovers,1);
%disp(co);

num_of_mutations=2;
% co site
%disp('cross over site');
cos=randi([2 D-1],1,1);
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
 tr=zeros(40,nof(i));
 smp=zeros(89,nof(i));
 
 for g=1:D
      if tpopulation(i,g)==1
         % disp('g=')
         % disp(g);
         for j=1:40
           tr(j,l)=training(j,g);
         end
        
        for j=1:89
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
for f=1:89
    if clas(f)==Ans(f)
        accuracy(i)=accuracy(i)+1;
    end
end
accuracy(i)=double(accuracy(i)/89);
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
        % for j=1:40
        %   tr(j,l)=training(j,g);
         %end
        
       % for j=1:89
        %  smp(j,l)=sample(j,g);
        %end
       % l=l+1;
      % end
          
 %end
 % l=1;
  %cclas=knnclassify(smp,tr,Group);
  %acc=0;
 %for f=1:89
   % if cclas(f)==Ans(f)
    %    acc=acc+1;
   % end
 %end
%acc=acc/89;
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
disp('Number Of Features to be selected');
disp(cnt);

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
writeStatus = xlswrite('final.xls', fs, 'glcmfeatures','A1');
disp(writeStatus);