% Facebook and graph partitioning

%% Simple graph

%% Small graph
AdjMatrix = [0 1 1 0 0 0 0 0 0;
             1 0 1 1 0 0 0 0 0;
             1 1 0 1 0 0 0 0 0;
             0 1 1 0 1 0 0 0 0;
             0 0 0 1 0 1 1 0 0;
             0 0 0 0 1 0 1 1 0;
             0 0 0 0 1 1 0 1 1;
             0 0 0 0 0 1 1 0 1;
             0 0 0 0 0 0 1 1 0];

RowSums = sum(AdjMatrix, 2);

% Tao ma tran duong cheo
DiagMatrix = diag(RowSums);

% Tinh matran Laplace
LaplaceGraph = DiagMatrix - AdjMatrix;

test_vector = ones(9, 1);

result = LaplaceGraph * test_vector;

% Tim gia tri rieng va vector rieng cua Laplace
[V, D] = eig(LaplaceGraph);

% Sort
[d, ind] = sort(diag(D));
D = D(ind, ind);
V = V(:, ind);

smallest = d(2);

% Task 6: vector rieng cua v
V2 = V(:, 2);

if V2(1) < 0
    V2 = -V2;
end

% Task 7: Seperate the elements on to Pos and Neg
pos = [];
neg = [];

for j = 1:length(V2)
    if V2(j) > 0
        pos = [pos, j];
    else
        neg = [neg, j];
    end
end


%% Load the data
clear;
load('social.mat','Social');
spy(Social);

%Task9

%% Laplacian
DiagSocial = sum(Social, 2);

DiagMatrixSocial = diag(DiagSocial);

LaplaceSocial = DiagMatrixSocial - Social;

%Task10
%% Spectral decomposition
[V, D] = eig(LaplaceSocial);

[d, ind] = sort(diag(D));
D = D(ind, ind);
V = V(:, ind);

V2 = V(:, 2);

if V2(1) < 0
    V2 = -V2;
end

%% Clusteer in two groups
pos = [];
neg = [];
for j = 1:length(V2)
    if V2(j) > 0
        pos = [pos, j];
    else
        neg = [neg, j];
    end
end

order = [pos, neg];

[m, n] = size(Social);
iden = eye(m, m);

P = zeros(m, m);
for j = 1:m
    for k = 1:m
        P(j, k) = iden(order(j), k);
    end
end

SocialOrdered = P * Social * P';

%Task13
spy(SocialOrdered);


%% Cluster in 4 groups

V3 = V(:, 3);


if V3(1) < 0
    V3 = -V3;
end 

pp=[];
pn=[];
np=[];
nn=[];

for j=1:m
    if (V2(j)>0)
        if (V3(j)>0)
            pp=[pp,j];
        else
            pn=[pn,j];
        end
    else
        if (V3(j)>0)
            np=[np,j];
        else
            nn=[nn,j];
        end
    end
end

order=[pp,pn,np,nn];

iden=eye(m,m);

for j=1:351
    for k=1:351
        P(j,k)=iden(order(j),k);
    end
end

SocialOrdered=P*Social*P';

figure;
spy(SocialOrdered)

%% Second order of Fiedler

SocialPos=Social(pos,pos);
SocialNeg=Social(neg,neg);

rowsumpos=sum(SocialPos,2);

DiagSocialPos=diag(rowsumpos);

LaplaceSocialPos=DiagSocialPos-SocialPos;

[VPos,DPos]=eig(LaplaceSocialPos);

V2Pos=VPos(:,2);

%Task15

if V2Pos(1) < 0
    V2Pos = -V2Pos;
end


[mpos,npos]=size(V2Pos);

posp=[];
posn=[];

for j=1:mpos
    if (V2Pos(j)>0)
        posp=[posp,pos(j)];
    else
        posn=[posn,pos(j)];
    end
end


rowsumneg=sum(SocialNeg,2);

DiagSocialNeg=diag(rowsumneg);

LaplaceSocialNeg=DiagSocialNeg-SocialNeg;

[VNeg,DNeg]=eig(LaplaceSocialNeg);

V2Neg=VNeg(:,2);

[mneg,nneg]=size(V2Neg);

if V2Neg(1) < 0
    V2Neg = -V2Neg;
end

negp=[];
negn=[];

for j=1:mneg
    if (V2Neg(j)>0)
        negp=[negp,neg(j)];
    else
        negn=[negn,neg(j)];
    end
end



ordergen=[posp,posn,negp,negn];

iden=eye(m,m);

for j=1:351
    for k=1:351
        P(j,k)=iden(ordergen(j),k);
    end
end

SocialOrderedGen = P*Social*P';
figure;
spy(SocialOrderedGen)





