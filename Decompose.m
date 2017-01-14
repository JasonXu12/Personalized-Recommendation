k=50;
r=0.001;
a=0.0001;
U=0.01*rand(10000,k);
V=0.01*rand(10000,k);
X=X_train;
A=X_train;
A(A~=0)=1; 
B=X_test;
B(B~=0)=1; 


J=(norm(A.*(X-(U*V')),'fro')^2)/2+r*(norm(U,'fro')^2)+r*(norm(V,'fro')^2);
J=J/(10^7);
Jo=J+1;
sprintf('J值为:%d ',J)
steps=1;

while(Jo-J>0.0005 && steps<100 )
        Jo=J;
        
        J_U=(A.*(U*V'-X))*V+2*r*U;
        J_V=(A.*(U*V'-X))'*U+2*r*V;
        
        U=U-a*J_U;
        V=V-a*J_V;
        
        J=(norm(A.*(X-U*V'),'fro')^2)/2+r*(norm(U,'fro')^2)+r*(norm(V,'fro')^2);
        J=J/(10^7);
        %sprintf('J值为:%d ',J)
        RMSE=norm(B.*(U*V')-X_test,'fro')/sqrt(1719466); 
        %srintf('RMSE值为:%d ',RMSE)
        x(steps)=J;
        y(steps)=RMSE;
        steps=steps+1;
        
end

        plot(x,y,'o','MarkerFaceColor','k')
        title('目标函数J和指标RMSE关系曲线','FontName','Times New Roman','FontWeight','Bold','FontSize',16) 
        xlabel('目标函数J','FontName','Times New Roman','FontSize',14) 
        ylabel('RMSE','FontName','Times New Roman','FontSize',14,'Rotation',0) 
        hold on;
        
        
        