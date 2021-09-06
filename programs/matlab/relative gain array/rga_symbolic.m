clear all;
close all;
clc;


syms s

tf1= ((12.8)/ (16.7* s+ 1))* exp(-s);
tf2= ((-18.9)/ (21* s+ 1))* exp(-3*s);
tf3= ((6.6)/ (10.9* s+ 1))* exp(-7*s);
tf4= ((-19.4)/ (14.4* s+ 1))* exp(-3*s);

% tf1= tf([12.8],[16.7 1], 'InputDelay',1);
% tf2= tf([-18.9],[21 1], 'InputDelay',3);
% tf3= tf([6.6],[10.9 1], 'InputDelay',7);
% tf4= tf([19.4],[14.4 1], 'InputDelay',3);

mft= [tf1 tf2;
    tf3 tf4]


%Static Gain Generation
 %w/ Final value property
 
static_g= @(tfx) limit(tfx, s, 0);

k1= static_g(tf1)
k2= static_g(tf2)
k3= static_g(tf3)
k4= static_g(tf4)

%Static Gains Matrix

k= double([k1 k2; 
    k3 k4])

%Relative Gains Matrix

rk= k.*((inv(k))') %or rk= K.*(transpose(inv(k))) for other intepretation supports 
