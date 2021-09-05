%load data
raw_data = load('iris.dat')/10;
% set up input data and targets
bitA = zeros(150,1);
bitB = zeros(150,1);
bitC = zeros(150,1);
dataset = [raw_data bitA bitB bitC];
 for i=1:150
     if dataset(i,5) == 0.1
        dataset(i,8)=1;
     end
if dataset(i,5) == 0.2
        dataset(i,7)=1;
end
if dataset(i,5) == 0.3
        dataset(i,6)=1;
end
 end
 
 %  randomly data
 dataset_randomised = dataset(randperm(150),:);

 % pick input data and output data up
 input_data=(dataset_randomised(:,1:4))';
 target_data=(dataset_randomised(:,6:8))';
 target_training =(dataset_randomised(1:100,6:8))';
 target_testing=(dataset_randomised(101:150,6:8))';
% normalize the input data
     for n=1:4
         input_data_normalised(n,:)=((input_data(n,:)-min(input_data(n,:)))/(max(input_data(n,:))-min(input_data(n,:))))
     end

training_set = input_data_normalised(1:4,1:100);
testing_set = input_data_normalised(1:4,101:150);
