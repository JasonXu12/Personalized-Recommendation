train_data=load('netflix_train.txt');  %����ѵ��������
test_data=load('netflix_test.txt'); %������Լ�����
id_data=load('users.txt');  %�����û��������
X_train=zeros(10000,10000);  %ѵ������
X_test=zeros(10000,10000);  %���Ծ���

for i=1:6897746
    user_ID=find(id_data==train_data(i,1));   %���ȶ�ѵ���������ݶ�ÿһ���û����ҵ���ID��users.txt�ж�Ӧ��λ��
    X_train(user_ID,train_data(i,2))=train_data(i,3);  %��дѵ������
end

for i=1:1719466
    user_ID=find(id_data==test_data(i,1)); %�Բ��Լ������ݶ�ÿһ���û����ҵ���ID��users.txt�ж�Ӧ��λ��
    X_test(user_ID,test_data(i,2))=test_data(i,3); %��д���Ծ���
end