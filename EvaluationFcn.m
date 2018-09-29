function [ Accuarcy] = EvaluationFcn( C_hat,outer_mat)
%EVALUATIONFCN ָ�����
%   ���Ƚ�������Ϊ�Խ���Ϊ�㣬�����TPR��׼ȷ�ʣ�
SIZE = size(outer_mat,1);
[m,n]= size(outer_mat);
epsi = 0.1;                                     %��ֵ

adjRecon = reshape(C_hat,m * n,1);          %�ع����󻻳�������ʽ
adjReal  = reshape(outer_mat,m * n,1);      %��ʵ���󻻳�������ʽ

for i = 1:size(adjRecon)
    if ( abs(adjRecon(i)-1 ) <= epsi)
        adjRecon(i) = 1;
    elseif ( abs(adjRecon(i)-0 ) <= epsi)
            adjRecon(i) = 0;
    end
end

% ����Accuarcy
acc = 0;
tp = 0;
for i = 1:size(adjReal)
    if (adjReal(i) == adjRecon(i))
        acc = acc +1;
    end
end
tp  = size(adjReal,1);
Accuarcy = acc/tp;

% for i = 1:size(C_hat,1)
%     for j = 1:size(C_hat,1)
%         x(i,j) = j/100 -0.5;
%     end
% end
% x1 = reshape(x,SIZE*SIZE,1);
% % y1 = reshape(adjRecon,SIZE*SIZE,1);
% scatter(x1,adjRecon);

end