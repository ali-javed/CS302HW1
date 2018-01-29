

%%
%house keeping
clear all
close all
clc

%%
%TASK 1
%Weed-1 Fractal
%Declare parameters
Delta = 25
nReps = 3
Axiom = 'F'

lenF = 1
lenB = 1


%Rules
rules(1).before = 'F'
rules(1).after = 'F[-F]F[+F]F'
%end Rules


%call LSystem

[status,fig] = Lsystem(Delta, Axiom, nReps, rules, lenF, lenB);

%check for sucess status
if status ==1
    disp("LSystem Weed Fractal - 1 Sucessful... exiting");
else
    disp("LSystem Weed Fractal - 1 did not work as expected... exiting");

end

%save the figure with title here
savefig(fig,'../figures/Weed-1 Fractal by Ali Javed and Josh Minot.fig','compact')


%%
%TASK 2
%house keeping
clear all
figure



%Declare parameters
Delta = 5
nReps = 3
Axiom = 'F18-F18-F18-F'

lenF = 1
lenB = 1


%Rules
rules(1).before = 'F'
rules(1).after = 'F17-F34+F17-F'
%end Rules


%call LSystem

[status,fig] = Lsystem(Delta, Axiom, nReps, rules, lenF, lenB);

%check for sucess status
if status ==1
    disp("LSystem Square-Spikes Sucessful... exiting");
else
    disp("LSystem Square-Spikes did not work as expected... exiting");

end

%save the figure with title here
savefig(fig,'../figures/Square-Spikes Fractal by Ali Javed and Josh Minot.fig','compact')


%%
%TASK 3
%Find something from the real world...




