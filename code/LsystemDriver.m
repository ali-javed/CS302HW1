

%%
%house keeping
clear all
close all
clc

%%

%Declare parameters
Delta = 27.5
nReps = 3
Axiom = 'B'

lenF = 1
lenB = 1


%Rules
rules(1).before = 'B'
rules(1).after = 'F[-B]+B'

rules(2).before = 'F'
rules(2).after = 'FF'
%end Rules


%call LSystem

status = Lsystem(Delta, Axiom, nReps, rules, lenF, lenB);

%check for sucess status
if status ==1
    disp("LSystem Sucessful... exiting");
else
    disp("LSystem did not work as expected... exiting");

end



