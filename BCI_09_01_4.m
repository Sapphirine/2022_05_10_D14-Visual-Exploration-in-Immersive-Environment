%This file is for question sepearte right hand and left hand condition of
%run 4
load Run4.mat
load classrun4.mat % This data file contains real cue direction

y1 = y(1,1,:);
y2 = y(2,1,:);
y3 = y(3,1,:);
y4 = y(4,1,:);
y5 = y(5,1,:);
y6 = y(6,1,:);
y7 = y(7,1,:);
y8 = y(8,1,:);
y9 = y(9,1,:);
y10 = y(10,1,:);
y11 = y(11,1,:);
y12 = y(12,1,:);
y13 = y(13,1,:);
y14 = y(14,1,:);
y15 = y(15,1,:);
y16 = y(16,1,:);
y17 = y(17,1,:);
y18 = y(18,1,:);



for i = 1:length(y1)
    Ch1(i) = y1(i);
    Ch2(i) = y2(i);
    Ch3(i) = y3(i);
    Ch4(i) = y4(i);
    Ch5(i) = y5(i);
    Ch6(i) = y6(i);
    Ch7(i) = y7(i);
    Ch8(i) = y8(i);
    Ch9(i) = y9(i);
    Ch10(i) = y10(i);
    Ch11(i) = y11(i);
    Ch12(i) = y12(i);
    Ch13(i) = y13(i);
    Ch14(i) = y14(i);
    Ch15(i) = y15(i);
    Ch16(i) = y16(i);
    Ch17(i) = y17(i);
    Ch18(i) = y18(i);
end

run1= zeros(18,length(Ch1));
run1(1,:)=Ch1;
run1(2,:)=Ch2;
run1(3,:)=Ch3;
run1(4,:)=Ch4;
run1(5,:)=Ch5;
run1(6,:)=Ch6;
run1(7,:)=Ch7;
run1(8,:)=Ch8;
run1(9,:)=Ch9;
run1(10,:)=Ch10;
run1(11,:)=Ch11;
run1(12,:)=Ch12;
run1(13,:)=Ch13;
run1(14,:)=Ch14;
run1(15,:)=Ch15;
run1(16,:)=Ch16;
run1(17,:)=Ch17;
run1(18,:)=Ch18;

Index = find (diff (Ch18) > 0 );
Index=Index+1;

left_1=0;
left_2=0;
left_3=0;
left_4=0;
left_5=0;
left_6=0;
left_7=0;
left_8=0;
left_9=0;
left_10=0;
left_11=0;
left_12=0;
left_13=0;
left_14=0;
left_15=0;
left_16=0;



right_1=0;
right_2=0;
right_3=0;
right_4=0;
right_5=0;
right_6=0;
right_7=0;
right_8=0;
right_9=0;
right_10=0;
right_11=0;
right_12=0;
right_13=0;
right_14=0;
right_15=0;
right_16=0;

a=640;
d = 1536;
for i =1:40

    if z4(1,i)==1
        left_1 = [left_1,Ch2(Index(i)+a:Index(i)+d)];
        left_2 = [left_2,Ch3(Index(i)+a:Index(i)+d)];
        left_3 = [left_3,Ch4(Index(i)+a:Index(i)+d)];
        left_4 = [left_4,Ch5(Index(i)+a:Index(i)+d)];
        left_5 = [left_5,Ch6(Index(i)+a:Index(i)+d)];
        left_6 = [left_6,Ch7(Index(i)+a:Index(i)+d)];
        left_7 = [left_7,Ch8(Index(i)+a:Index(i)+d)];
        left_8 = [left_8,Ch9(Index(i)+a:Index(i)+d)];
        left_9 = [left_9,Ch10(Index(i)+a:Index(i)+d)];
        left_10 = [left_10,Ch11(Index(i)+a:Index(i)+d)];
        left_11 = [left_11,Ch12(Index(i)+a:Index(i)+d)];
        left_12 = [left_12,Ch13(Index(i)+a:Index(i)+d)];
        left_13 = [left_13,Ch14(Index(i)+a:Index(i)+d)];
        left_14 = [left_14,Ch15(Index(i)+a:Index(i)+d)];
        left_15 = [left_15,Ch16(Index(i)+a:Index(i)+d)];
        left_16 = [left_16,Ch17(Index(i)+a:Index(i)+d)];
      
      
        

    elseif z4(2,i)==1
        right_1 =[right_1,Ch2(Index(i)+a:Index(i)+d)];
        right_2 =[right_2,Ch3(Index(i)+a:Index(i)+d)];
        right_3 =[right_3,Ch4(Index(i)+a:Index(i)+d)];
        right_4 =[right_4,Ch5(Index(i)+a:Index(i)+d)];
        right_5 =[right_5,Ch6(Index(i)+a:Index(i)+d)];
        right_6 =[right_6,Ch7(Index(i)+a:Index(i)+d)];
        right_7 =[right_7,Ch8(Index(i)+a:Index(i)+d)];
        right_8 =[right_8,Ch9(Index(i)+a:Index(i)+d)];
        right_9 =[right_9,Ch10(Index(i)+a:Index(i)+d)];
        right_10 =[right_10,Ch11(Index(i)+a:Index(i)+d)];
        right_11 =[right_11,Ch12(Index(i)+a:Index(i)+d)];
        right_12 =[right_12,Ch13(Index(i)+a:Index(i)+d)];
        right_13 =[right_13,Ch14(Index(i)+a:Index(i)+d)];
        right_14 =[right_14,Ch15(Index(i)+a:Index(i)+d)];
        right_15 =[right_15,Ch16(Index(i)+a:Index(i)+d)];
        right_16 =[right_16,Ch17(Index(i)+a:Index(i)+d)];
    end

end

dd=20*(d-a);

Left=zeros(16,dd-1);
Right=zeros(16,dd);



Left(1,:)=left_1(2:dd);
Left(2,:)=left_2(2:dd);
Left(3,:)=left_3(2:dd);
Left(4,:)=left_4(2:dd);
Left(5,:)=left_5(2:dd);
Left(6,:)=left_6(2:dd);
Left(7,:)=left_7(2:dd);
Left(8,:)=left_8(2:dd);
Left(9,:)=left_9(2:dd);
Left(10,:)=left_10(2:dd);
Left(11,:)=left_11(2:dd);
Left(12,:)=left_12(2:dd);
Left(13,:)=left_13(2:dd);
Left(14,:)=left_14(2:dd);
Left(15,:)=left_15(2:dd);
Left(16,:)=left_16(2:dd);

Left_run4=Left;
d1=dd+1;
Right(1,:)=right_1(2:d1);
Right(2,:)=right_2(2:d1);
Right(3,:)=right_3(2:d1);
Right(4,:)=right_4(2:d1);
Right(5,:)=right_5(2:d1);
Right(6,:)=right_6(2:d1);
Right(7,:)=right_7(2:d1);
Right(8,:)=right_8(2:d1);
Right(9,:)=right_9(2:d1);
Right(10,:)=right_10(2:d1);
Right(11,:)=right_11(2:d1);
Right(12,:)=right_12(2:d1);
Right(13,:)=right_13(2:d1);
Right(14,:)=right_14(2:d1);
Right(15,:)=right_15(2:d1);
Right(16,:)=right_16(2:d1);

Right_run4=Right;

save Left_run4.mat Left_run4
save Right_run4.mat Right_run4

