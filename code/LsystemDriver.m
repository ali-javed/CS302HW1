%%FOR TESTING AND PLAYING ONLY. 
%We have to submit LsystemDriverA for part A of this assignment. 

%%
%house keeping
clear all
close all
clc

%%

%Declare parameters
Delta = 18
nReps = 3
Axiom = 'F'

lenF = 1
lenB = 0.5


%Rules
%rules(1).before = 'B'
%rules(1).after = 'F[-B]+B'

rules(1).before = 'F'
rules(1).after = '[2-B]4-BFB[+3B]'
%end Rules


%call LSystem

status = Lsystem(Delta, Axiom, nReps, rules, lenF, lenB);

%check for sucess status
if status ==1
    disp("LSystem Sucessful... exiting");
else
    disp("LSystem did not work as expected... exiting");

end



