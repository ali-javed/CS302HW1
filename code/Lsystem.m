%Created By Ali Javed and Josh
%Class Project1 CS302 - Modeling Complex Systems
%Date Jan-26-2018
%ali.javed@uvm.edu
%jminot@uvm.edu

%this is the main script that call required functions

function [status,DrawFractalFigure] = Lsystem(delta, axiom, nReps, rules,lenF,lenB)
%%
%initilize status to 0 and get number of rules
status = 0;
nRules = length(rules);


%%
%Expand the axiom
expanded_axiom = Iterate(rules, axiom, nReps, nRules);

if length(expanded_axiom)<1
    disp("Axiom did not expand properly..")
else
    fprintf("Axiom expanded to %s\n",expanded_axiom);
end


%%
%plot L-system
[DrawFractalFigure,DrawFractalstatus] = DrawFractal(lenF,lenB, delta, expanded_axiom);

if DrawFractalstatus == 0
    disp("Draw fractal did not return sucessfully.. please check")
else
    disp("Fractal drawn..")
end

%%
%return a sucessful status and return figure
status = 1;


end






