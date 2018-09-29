%% Generate the evolutionary game data
% Input: Adjacent Matrx--Adj
% Output: Evolutionary game data--Stra and Unity
% Stra--Data of strategies, Stra(i,j)-the strategy of agent i in step j
% Unity--Data of fitness, Unity(i,j)-the fitness of agent i in step j

function [Stra,Unity] = Game_withnoise(Adj,b,amp)
N = size(Adj,1);% NΪ����ڵ���Ŀ

Stra=[];
stra=(rand(N,1)>0.5)*1;% ���Գ�ʼ�ֲ����ȸ��ʵ�ѡ��������߷Ǻ�������Ϊ
Unity=[];% ��Ӧ��
for T=1:4*N
    for i=1:N
        player1=i;%��Ⱥ��ѡ��һ������i
        stra_player1=stra(player1);%�õ�����i�Ĳ���
        score1=0;
        Neig=[];
        for j=1:N
            if Adj(player1,j)==1
                Neig=[Neig,j];%��¼����player1���ھ�
                player2=j;%�õ�������ھӼ������
                stra_player2=stra(player2);
                score1=score1+Payoff_noise(stra_player1,stra_player2,b,amp);%�õ�����player1������  
            end            
        end
        unity(i)=score1;%����������������
    end
    Unity=[Unity,unity'];%��i��Ϊiʱ�����и��������
    
    Stra=[Stra,stra];
    for i=1:N        
        player1=i;%��Ⱥ��ѡ��һ������i
        stra_player1=stra(player1);%�õ�����i�Ĳ���
        Neig=[];
        for j=1:N
            if Adj(player1,j)==1
                Neig=[Neig,j];%��¼����player1���ھ�            
            end            
        end
        Neig_Size=size(Neig,2);%��������Ķ�
        Neig_rand0=randi(Neig_Size);
        Neig_rand=Neig( Neig_rand0);%���ѡ��һ���ھ�         
        player11=Neig_rand;
        Neig1=[];
        for j=1:N
            if Adj(player11,j)==1
                Neig1=[Neig1,j];%��¼����player11���ھ�            
            end            
        end   
        Neig_Size1=size(Neig1,2);%�ھӵĶ�
        stra_neig=stra(Neig_rand);%�õ�����Ĳ���
        if stra_neig~=stra_player1
            score1=unity(player1);
            score2=unity(Neig_rand);        
            dscore=score2-score1;
            fermi=dscore/b/max(Neig_Size,Neig_Size1);
            
            if(fermi>rand(1)) 
                stra_player1=stra_neig;
            end
            stra(i)=stra_player1;
        end    
    end
    
end
%% ���ϵõ��˸���ʱ�̣����и���Ĳ��Ծ���Stra���������Unity
end




