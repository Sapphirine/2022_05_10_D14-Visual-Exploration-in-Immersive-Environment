% Code for Applying Common Spatial Pattern Filters(1)

load Right_run1.mat
load Right_run2.mat
load Right_run3.mat
load Right_run4.mat

load Left_run1.mat
load Left_run2.mat
load Left_run3.mat
load Left_run4.mat

Right_class= [Right_run1 Right_run2 Right_run3 Right_run4];
Left_class= [Left_run1 Left_run2 Left_run3 Left_run4];
Right_class=transpose(Right_class);
Left_class=transpose(Left_class);

l1 = fix(length(Right_class(:,1))/(40*4)); % length of each trial for right hand condition 
l2 = fix(length(Left_class(:,1))/(40*4)); % length of each trial for left hand condition 

a = cov(Right_class(1:447,1:16));

right_no_filter_sum =0;
left_no_filter_sum = 0;
for i =1:40*4
    right_no_filter = Right_class((i-1)*l2+1:i*l2,1:16);
    right_no_filter_sum=right_no_filter+right_no_filter_sum;

    left_no_filter = Left_class((i-1)*l2+1:i*l2,1:16);
    left_no_filter_sum=left_no_filter+left_no_filter_sum;
end 
right_no_filter_avg=right_no_filter_sum/(40*4);
left_no_filter_avg=left_no_filter_sum/(40*4);

right_no_filter_sum_allCh=0;
left_no_filter_sum_allCh=0;
for i =1:16
    right_allCh=right_no_filter_avg(1:447,i);
    right_no_filter_sum_allCh=right_allCh+right_no_filter_sum_allCh;

    left_allCh=left_no_filter_avg(1:447,i);
    left_no_filter_sum_allCh=left_allCh+left_no_filter_sum_allCh;
end 

right_no_filter_perCh=right_no_filter_sum_allCh/16;
left_no_filter_perCh=left_no_filter_sum_allCh/16;

for i = 1:40*4
    cov1((i-1)*16+1:i*16,1:16) = cov(Right_class((i-1)*l2+1:i*l2,1:16));
    cov2((i-1)*16+1:i*16,1:16) = cov(Left_class((i-1)*l2+1:i*l2,1:16));
end


cov1_sum=0;
cov2_sum=0;
for i = 1:40*4
    c1 = cov1((i-1)*16+1:i*16,1:16);
    c2 = cov2((i-1)*16+1:i*16,1:16);
  
    cov1_sum = cov1_sum+c1;
    cov2_sum = cov2_sum+c2;
end

S1 = cov1_sum/(40*4);
S2 = cov2_sum/(40*4);

[V,D,W]= eig(S1,S2);

% find the CSP projection 
W1 = W(1:16,11:16);

projection_sum=0;
projection_sum_l=0;
for i = 1:40*4
    % calculate for right hand
    p1= transpose(W1)*transpose(Right_class((i-1)*l2+1:i*l2,1:16));
    projectino_sum =p1+projection_sum;

    %Calculate for left hand
    p2= transpose(W1)*transpose(Left_class((i-1)*l2+1:i*l2,1:16));
    projectino_sum_l =p2+projection_sum_l;
end


projection_per_trial =projectino_sum/(40*4);
projection_per_trial_l =projectino_sum_l/(40*4);

projection_average =(projection_per_trial(1,:)+projection_per_trial(2,:)...
    +projection_per_trial(3,:)+projection_per_trial(4,:)...
    +projection_per_trial(5,:)+projection_per_trial(6,:))/6;


projection_average_l =(projection_per_trial_l(1,:)+projection_per_trial_l(2,:)...
    +projection_per_trial_l(3,:)+projection_per_trial_l(4,:)...
    +projection_per_trial_l(5,:)+projection_per_trial_l(6,:))/6;

figure(1);
subplot(711);
plot(projection_average,'r')
hold on 
plot(projection_average_l,'b')
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Right & Left Hand Condition at Average Projected Dimensions ')

subplot(712);
plot(projection_per_trial(1,:),'r')
hold on 
plot(projection_per_trial_l(1,:),'b')
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Right & Left Hand Condition at Projected Dimension 1')

subplot(713);
plot(projection_per_trial(2,:),'r')
hold on 
plot(projection_per_trial_l(2,:),'b')
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Right & Left Hand Condition at Projected Dimension 2')

subplot(714);
plot(projection_per_trial(3,:),'r')
hold on 
plot(projection_per_trial_l(3,:),'b')
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Right & Left  Hand Condition at Projected Dimension 3')

subplot(715);
plot(projection_per_trial(4,:),'r')
hold on 
plot(projection_per_trial_l(4,:),'b')
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Right & Left Hand Condition at Projected Dimension 4')

subplot(716);
plot(projection_per_trial(5,:),'r')
hold on 
plot(projection_per_trial_l(5,:),'b')
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Right & Left Hand Condition at Projected Dimension 5')

subplot(717);
plot(projection_per_trial(6,:),'r')
hold on 
plot(projection_per_trial_l(6,:),'b')
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Right & Left Hand Condition at Projected Dimension 6')

figure(2)
subplot(711);
plot(projection_average_l)
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Left Hand Condition at Average Projected Dimensioins')

subplot(712);
plot(projection_per_trial_l(1,:))
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Left Hand Condition at Projected Dimension 1')

subplot(713);
plot(projection_per_trial_l(2,:))
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Left Hand Condition at Projected Dimension 2')

subplot(714);
plot(projection_per_trial_l(3,:))
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Left Hand Condition at Projected Dimension 3')

subplot(715);
plot(projection_per_trial_l(4,:))
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Left Hand Condition at Projected Dimension 4')

subplot(716);
plot(projection_per_trial_l(5,:))
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Left Hand Condition at Projected Dimension 5')

subplot(717);
plot(projection_per_trial_l(6,:))
xlabel('Time')
ylabel('Amplitude')
title('Projectin for Left Hand Condition at Projected Dimension 6')

figure(3);
subplot(211)
plot(right_no_filter_perCh,'r');
hold on 
plot(left_no_filter_perCh,'b');
xlabel('Time');
ylabel('Amplitude');
title('Separability of The Two Classes Before CSP Filtering')


subplot(212)
plot(projection_average,'r');
hold on 
plot(projection_average_l,'b');
xlabel('Time');
ylabel('Amplitude');
title('Separability of The Two Classes After CSP Filtering')

% Display Scalp for projected dimension 4
for i =1:6
    erp_1 = zeros(1,16); 

    erp_1(:,1) = W1(1,i);
    erp_1(:,2) = W1(2,i);
    erp_1(:,3) = W1(3,i);
    erp_1(:,4) = W1(4,i);
    erp_1(:,5) = W1(5,i);
    erp_1(:,6) = W1(6,i);
    erp_1(:,7) = W1(7,i);
    erp_1(:,8) = W1(8,i);
    erp_1(:,9) = W1(9,i);
    erp_1(:,10) = W1(10,i);
    erp_1(:,11) = W1(11,i);
    erp_1(:,12) = W1(12,i);
    erp_1(:,13) = W1(13,i);
    erp_1(:,14) = W1(14,i);
    erp_1(:,15) = W1(15,i);
    erp_1(:,16) = W1(16,i);

    figure(3+i)
    topoplot(erp_1,'CSP.locs');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
std_r=zeros(40*4,1);
std_l=zeros(40*4,1);
for i = 1:40*4
    % calculate for right hand
    p1= transpose(W1)*transpose(Right_class((i-1)*l2+1:i*l2,1:16));
    p1_sum=(p1(1,:)+p1(2,:)+p1(3,:)+p1(4,:)+p1(5,:)+p1(6,:))/6;
    std_r(i)=std(p1_sum);

    %Calculate for left hand
    p2= transpose(W1)*transpose(Left_class((i-1)*l2+1:i*l2,1:16));
    p2_sum=(p2(1,:)+p2(2,:)+p2(3,:)+p2(4,:)+p2(5,:)+p2(6,:))/6;
    std_l(i)=std(p2_sum);
   
end
figure(10)
plot(std_r,'r');
hold on; 
plot(std_l,'b');
ylim([-0.1 2.5]);
xlabel('trial');
ylabel('standard deivation');
title('The Standard Deviation for Each Trial for Left Hand and Right Hand Condition');

save W1.mat W1