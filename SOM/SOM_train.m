 %load data
 [r1,r2,r3]=Bank_data();
 Bank_data_2 = [r1;r2;r3];
 %Bank_data_5=[Bank_data_2((1:100),(2:6))];
 Bank_data_3 = [Bank_data_2(:,(2:6))]';

   % normalise the input data
      for n=1:5
          input_nor_bank(n,:)=((Bank_data_3(n,:)-min(Bank_data_3(n,:)))/(max(Bank_data_3(n,:))-min(Bank_data_3(n,:))))
      end
      Bank_data_4 = input_nor_bank((1:5),(1:100));


 x = Bank_data_4;
 %trian
 net = selforgmap([2 2]);
 net.trainParam.epochs = 10000;
 net.trainParam.lr = 0.1;
 net = train(net,x);
 y = net(x);
 figure;
 plotsomnd(net)
 hold on;
 N=net.layers.positions;
 p=cell2mat(N(1));
 for i=1:length(p)
     text(p(1,i)-0.12,p(2,i),num2str(i),'Color','white','FontSize',12);
 end
%  classes = vec2ind(y);
% load ('network.mat','net')
%       classes = net(Bank_data_4);
%       classes_test_1 = vec2ind(classes);
      %classes_test_2=[classes_test_1]';
%test
test_data = input_nor_bank((1:5),(101:110));
test_data_net = net(test_data);

classes_test = vec2ind(test_data_net);



