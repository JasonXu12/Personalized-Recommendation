X_norm=X_train;  %X_norm是X_train的归一话矩阵，X_norm中每一行向量的模为1
X_predict=zeros(10000,10000);%X_predict是最后的预测矩阵
for i = 1:10000
    X_norm(i,:)=X_norm(i,:)/norm(X_norm(i,:)); %采用向量的2范数对X_train每行归一化，得到X_norm
end
con_X_train=X_norm*X_norm'; %将归一化之后的X_norm矩阵乘以其转置，得到协方差矩阵con_X_train，该矩阵的ij元素代表用户i与用户j的相似度
Sparse_X=X_train;
Sparse_X(Sparse_X~=0)=1; %Sparse_X是X_train的指示矩阵，其ij元素为1代表用户i对j有评价
score=0;

for i = 1:10000
    for j = 1:10000
        if(X_test(i,j)~=0) 
            score=con_X_train(i,:)*X_train(:,j)/(con_X_train(i,:)*Sparse_X(:,j));% 只考虑训练集中对电影j有评价的用户
            X_predict(i,j)=score;
        end
    end
end

RMSE=norm(X_predict-X_test,'fro')/sqrt(1719466);% 通过X_predict与X_test之差的fro范数得到RMSE

            
