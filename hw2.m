train_data=load('netflix_train.txt');  %导入训练集数据
test_data=load('netflix_test.txt'); %导入测试集数据
id_data=load('users.txt');  %导入用户编号数据
X_train=zeros(10000,10000);  %训练矩阵
X_test=zeros(10000,10000);  %测试矩阵

for i=1:6897746
    user_ID=find(id_data==train_data(i,1));   %首先对训练集合数据对每一个用户，找到其ID在users.txt中对应的位置
    X_train(user_ID,train_data(i,2))=train_data(i,3);  %编写训练矩阵
end

for i=1:1719466
    user_ID=find(id_data==test_data(i,1)); %对测试集合数据对每一个用户，找到其ID在users.txt中对应的位置
    X_test(user_ID,test_data(i,2))=test_data(i,3); %编写测试矩阵
end