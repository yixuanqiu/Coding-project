%set parameters
nind=40;     % Size of a chromosome population
nvar=2;     % Number of variables
ngenes=4;  % Number of genes in a chromosome: each variable is represented by (ngenes/2) genes
Pc=0.9;     % Crossover probability
Pm=0.001;   % Mutation probability
xymin=1;   % Possible minimum values of parameters "x" and "y"
xymax=7;    % Possible maximum values of parameters "x" and "y"
ngener=100; % Number of generations


chrom=round(rand(nind,ngenes));   %generate a population of chromosome

xy=zeros(nind,nvar);   % initialize old Gene
lvar=ngenes/nvar;
%set the range of the x,y
if length(xymin)==1
    xymin=xymin*ones(1,nvar);
end
if length(xymax)==1
    xymax=xymax*ones(1,nvar);
end
% Decode. Convert the binary of vector of chromosome to decimal.
for i=1:nvar 
   xy(:,i)=chrom(:,1+lvar*(i-1):lvar*i)*[2.^(lvar-1:-1:0)]';
   xy(:,i)=xymin(i)+(xymax(i)-xymin(i))*(xy(:,i)+1)./(2^lvar+1);
end


% Calculation of the chromosome fitness
ObjFun = 'city_river(x,y)';
ObjV=evalObjFun(ObjFun,xy(:,1),xy(:,2));
best(1)=max(ObjV);
ave(1)=mean(ObjV);


%drawing the 3-D image,contour lin and current locations of the chromosomes on the surface of the "peak" function
[x,y]=meshgrid(xymin(1):1:xymax(1),xymin(2):1:xymax(2));
z=evalObjFun(ObjFun,x,y);

mesh(x,y,z)
axis auto;
contour(x,y,z,20)

scatter3(xy(:,1),xy(:,2),ObjV,40,'r','filled')
plot(xy(:,1),xy(:,2),'.','markersize',23)
xlabel('Parameter "x"');
ylabel('Parameter "y"');
zlabel('Chromosome fitness');



for i=1:ngener
   % Fitness evaluation
   fitness=ObjV;
   if min(ObjV)<0
      fitness=fitness-min(ObjV);
   end
   
   % Roulette wheel selection
   numsel=round(nind*(1-0.2));  % The number of chromosomes to be selected for reproduction
   cumfit=repmat(cumsum(fitness),1,numsel);
   chance=repmat(rand(1,numsel),nind,1)*cumfit(nind,1);
   [selind,n]=find(chance < cumfit & chance >= [zeros(1,numsel);cumfit(1:nind-1,:)]);
   newchrom=chrom(selind,:);

   % Crossover 
   points=round(rand(floor(numsel/2),1).*(ngenes-2))+1;
   points=points.*(rand(floor(numsel/2),1)<Pc);   
   for n=1:length(points)
      if points(n)
         newchrom(2*n-1:2*n,:)=[newchrom(2*n-1:2*n,1:points(n)),...
               flipud(newchrom(2*n-1:2*n,points(n)+1:ngenes))];
      end
   end
   
   % Mutation
   mut=find(rand(numsel,ngenes)<Pm);
   newchrom(mut)=round(rand(length(mut),1));
   
   % Fitness calculation
   newxy=zeros(numsel,nvar);
	for ind=1:nvar
   	newxy(:,ind)=newchrom(:,1+lvar*(ind-1):lvar*ind)*[2.^(lvar-1:-1:0)]';
   	newxy(:,ind)=xymin(ind)+(xymax(ind)-xymin(ind))*(newxy(:,ind)+1)./(2^lvar+1);
   end

	newObjV=evalObjFun(ObjFun,newxy(:,1),newxy(:,2));

   % Creating a new population of chromosomes
   if nind-numsel, % Preserving a part of the parent chromosome population
      [ans,Index]=sort(fitness);
      chrom=[chrom(Index(numsel+1:nind),:);newchrom];
      xy=[xy(Index(numsel+1:nind),:);newxy];
      ObjV=[ObjV(Index(numsel+1:nind));newObjV];      
   else % Replacing the entire parent chromosome population with a new one
      chrom=newchrom;
      xy=newxy;
      ObjV=newObjV;
   end
   
   % Plotting current locations of the chromosomes on the surface of the "peak" function
   mesh(x,y,z)
   axis auto
   hold;
   contour(x,y,z,20)

   scatter3(xy(:,1),xy(:,2),ObjV,40,'r','filled')
   plot(xy(:,1),xy(:,2),'.','markersize',23)
   xlabel('Parameter "x"');
   ylabel('Parameter "y"');
   zlabel('Chromosome fitness');
	hold;

	best(1+i)=max(ObjV);
	ave(1+i)=mean(ObjV);
end

best_point = mode(newxy);

figure('name','Performance graph');
plot(0:ngener,best,0:ngener,ave);
legend('Best','Average');
xlabel('Number of generations');
xlabel('Generations');
ylabel('Fitness');

function fitness=city_river(x,y)
emergency_data = [8 9 6 1 1 8 9;9 8 5 2 1 7 9;8 9 6 3 2 8 7; 4 2 1 1 2 5 9;5 1 2 4 4 9 8; 2 1 3 1 3 9 7; 3 4 1 2 1 3 8];
f = 0;
if x<=5
       for i=1:7
           for j=1:7
            if i<=5
               f=f+(sqrt((i-x).^2+(j-y).^2)).*emergency_data(i,j);
            end
            if i>5
                 f=f+((sqrt((i-5).^2+(j-5.5).^2))+(sqrt((5-x).^2+(5.5-y).^2))).*emergency_data(i,j);
            end
           end
       end
else
       for i=1:7
           for j=1:7
            if i<=5
                 f=f+((sqrt((i-5).^2+(j-5.5).^2))+(sqrt((5-x).^2+(5.5-y).^2))).*emergency_data(i,j);
            end
            if j>5
                  f=f+(sqrt((i-x).^2+(j-y).^2)).*emergency_data(i,j);
            end
           end
       end
end
fitness=1./f;
end