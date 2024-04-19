clc
clear all
close all

df = readtable("/MATLAB Drive/alzheimer.csv"); 

% "Converted" etiketine sahip örnekleri filtreleme
df = df(~strcmp(df.Group, 'Converted'), :);

cinsiyet_values = df.M_F;

% Cinsiyet verisindeki M ve F olan cinsiyet verilerini 0 ve 1 ile değiştirme
cinsiyet_values(strcmp(cinsiyet_values, 'M')) = {'0'};
cinsiyet_values(strcmp(cinsiyet_values, 'F')) = {'1'};
cinsiyet_values = str2double(cinsiyet_values);

alzheimer_values=df.Group;

alzheimer_values(strcmp(alzheimer_values, 'Nondemented')) = {'0'};
alzheimer_values(strcmp(alzheimer_values, 'Demented')) = {'1'};
alzheimer_values=str2double(alzheimer_values);

% Girdi verilerini ve alzheimer verilerini birleştirme
X = [cinsiyet_values, double(df.Age), double(df.EDUC), double(df.SES), double(df.MMSE), double(df.CDR), double(df.eTIV), double(df.nWBV), double(df.ASF)];

 
% Çıktı verilerini değişkene atama
y = alzheimer_values; 

% Girdi verilerini normalize etme
X=normalize(X);


rng(42); 
indices = randperm(size(X, 1));
split_point = round(0.7 * size(X, 1));
X_train = X(indices(1:split_point), :);
X_test = X(indices(split_point+1:end), :);
y_train = y(indices(1:split_point));
y_test = y(indices(split_point+1:end));

% Eğitim verilerinin özellikler arasındaki korelasyonunu hesapla
corr_matrix = corr(X_train);

% Korelasyon matrisini görselleştir
figure;
imagesc(corr_matrix);
colorbar;
title('Korelasyon Matrisi');

%ogrenilecek olan verilerin min ve max değerlerini bulma 
m1=min(X_train)';
m2=max(X_train)';
%max ve min değerlere gore sınırları belirleme
range = [m1 m2]; 

net = newff(range,[10 22 1],{ 'tansig','tansig','tansig'}, 'trainlm' );
net.trainparam.show = 25;
net.trainparam.epochs = 50;
net.trainparam.goal = 1e-20;
net = train(net,X_train',y_train'); 

% view(net); 
y = net(X_train'); 
perf_1= perform(net,y,y_train)

plotconfusion(y_train',y)
title("train Data")

%% test data
res_test = net(X_test'); 
perf_2= perform(net,res_test,y_test)

figure

plotconfusion(y_test',res_test)
title("test Data")