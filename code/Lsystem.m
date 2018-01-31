% LSystem.m: Calls two subfunctions to 1) expand the 2) draw the figure
% function [status,DrawFractalFigure] = Lsystem(delta, axiom, nReps, rules,lenF,lenB)
%
% INPUTS:
% delta == default angle for rotation
% axiom == axiom/ start of fractal
% nReps == number of iterations for expanding the axiom
% rules == rules for expansion
% lenF == lenght of line segment drawn when F is encountered
% lenB == length of line segment drawn when B is encountered
%
%
% OUTPUTS:
% status == 0 for failure, 1 for sucess 
% DrawFractalFigure == returns the figure, incase it needs to be saved or
% used somewhere else
%
% sample test call: Lsystem(90, 'B', 3, rules,1,1)

% original code at http://courses.cit.cornell.edu/bionb441/LSystem/index.html
% modified by Ali Javed and Josh Minot Jan-29-2018
% Class Project1 CS302 - Modeling Complex Systems

%%
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






