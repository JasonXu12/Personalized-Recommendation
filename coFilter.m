X_norm=X_train;  %X_norm��X_train�Ĺ�һ������X_norm��ÿһ��������ģΪ1
X_predict=zeros(10000,10000);%X_predict������Ԥ�����
for i = 1:10000
    X_norm(i,:)=X_norm(i,:)/norm(X_norm(i,:)); %����������2������X_trainÿ�й�һ�����õ�X_norm
end
con_X_train=X_norm*X_norm'; %����һ��֮���X_norm���������ת�ã��õ�Э�������con_X_train���þ����ijԪ�ش����û�i���û�j�����ƶ�
Sparse_X=X_train;
Sparse_X(Sparse_X~=0)=1; %Sparse_X��X_train��ָʾ������ijԪ��Ϊ1�����û�i��j������
score=0;

for i = 1:10000
    for j = 1:10000
        if(X_test(i,j)~=0) 
            score=con_X_train(i,:)*X_train(:,j)/(con_X_train(i,:)*Sparse_X(:,j));% ֻ����ѵ�����жԵ�Ӱj�����۵��û�
            X_predict(i,j)=score;
        end
    end
end

RMSE=norm(X_predict-X_test,'fro')/sqrt(1719466);% ͨ��X_predict��X_test֮���fro�����õ�RMSE

            
