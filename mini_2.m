% LDA Classification in CSP-Projected Space

load Right_run1.mat
load Right_run2.mat
load Right_run3.mat
load Right_run4.mat

load Left_run1.mat
load Left_run2.mat
load Left_run3.mat
load Left_run4.mat

load W1.mat

right_total= [Right_run1 Right_run2 Right_run3 Right_run4];
left_total= [Left_run1 Left_run2 Left_run3 Left_run4];

Left_proj = transpose(W1)*left_total;
Right_proj = transpose(W1)*right_total;

% Calculate the standard deviation for classfication use
for i = 1:80
    for j = 1:16
      std_left_before(j,i) = std(left_total(j,(i-1)*447+1:i*447));
      std_right_before(j,i) = std(right_total(j,(i-1)*447+1:i*447));
    end
end

for i = 1:80
    for j = 1:6
      std_left(j,i) = std(Left_proj(j,(i-1)*447+1:i*447));
      std_right(j,i) = std(Right_proj(j,(i-1)*447+1:i*447));
    end
end

%%%%%%%%%%%%%% This section is for 90% training data calculation %%%%%%%%%%
% Train data and test data

bottom = 8;
top = 72;

%Rand =72;
%left_train = std_left(:,1:top);
%right_train = std_right(:,1:top);
%training = [left_train right_train];

%left_sample = std_left(:,Rand+1:end);
%right_sample = std_right(:,Rand+1:end);
%sample = [left_sample right_sample];

%class1_train = ones(1,length(left_train));     
%class2_train = zeros(1,length(right_train));   
%group = [class1_train class2_train];

%class1_sample_data = -1*ones(1,length(left_sample));  
%class2_sample_data = zeros(1,length(right_sample));   
%sample_ID = [class1_sample_data class2_sample_data];
%sample_ID = sample_ID';

% classify the data 
%class = classify(sample',training',group','Linear');
%score = abs(class + sample_ID);
%Len = length(score);
%Percen = 100*(Len-sum(score))/Len


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Repeat 10 Times %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
percent_train =0;
for i = 1:10
    
    Rand = round((top-bottom).*rand(1,1) + bottom);
    percent_train=[Rand/80];
   
    % Train data
    left_train = std_left(:,1:Rand);
    right_train = std_right(:,1:Rand);
    training = [left_train right_train];

    left_sample = std_left(:,Rand+1:end);
    right_sample = std_right(:,Rand+1:end);
    sample = [left_sample right_sample];

    class1_train = ones(1,length(left_train));     
    class2_train = zeros(1,length(right_train));   
    group = [class1_train class2_train];

    class1_sample_data = -1*ones(1,length(left_sample));  
    class2_sample_data = zeros(1,length(right_sample));   
    sample_ID = [class1_sample_data class2_sample_data];
    sample_ID = sample_ID';

    % classify the data 
    class = classify(sample',training',group','Linear');

    score = abs(class + sample_ID);
    Len = length(score);
    Percen(i) = 100*(Len-sum(score))/Len;
end

std_err = std(Percen)/sqrt(10);

figure(2)
plot(1:10,Percen,'-*');
xlabel('trial number');
ylabel('Accuracy (%)');







