function [B1,B2,B5,M,b]=get_superpixel_initial_mv1(E)

% 输入：边缘图像
% 输出：

%% 生成0-1区域, second method
[m,n]=size(E);
%
A1=get_lable_top(E);%列生成二值0-1区域
%
E2=rot90(E);
A2=get_lable_top(E2);
A2=rot90(A2,-1);%列生成二值0-1区域
%

%% 从0-1转化为区域
B1=assign_label_mv1(A1,E);%将列图的二值转化为区域
B2=assign_label_mv1(rot90(A2,1),rot90(E,1));
B2=rot90(B2,-1);

% [B4,B5,M]=get_combine_h_v_m(B1,B2);
[B4,B5,M,b,n1,n2]=get_combine_h_v_m(B1,B2);
