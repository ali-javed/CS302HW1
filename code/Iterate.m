% DrawFractal.m: expand and axiom using a rule set and number of iterations
% function expanded_axiom = Iterate(rule, axiom, nReps, nRules)
%
% INPUTS:
% rule == array of rules. e.g. rule(1).before and rule(1).after
% axiom == starting point of factral
% nReps == Number of times to repeat
% nRules == number of rules
%
%
% OUTPUTS:
% expanded_axiom == the expanded factral
% sample test call: DrawFractal(rule,'B', 3,length(rules))

% original code at http://courses.cit.cornell.edu/bionb441/LSystem/index.html
% modified by Ali Javed and Josh Minot Jan-29-2018
% Class Project1 CS302 - Modeling Complex Systems

%%

function expanded_axiom = Iterate(rule, axiom, nReps, nRules)
expanded_axiom = axiom;
for i=1:nReps
    
    %one character/cell, with indexes the same as original axiom string
    EaxiomINcells = cellstr(expanded_axiom');
    for j=1:nRules
        %the indexes of each 'before' string
        hit = strfind(expanded_axiom, rule(j).before);
        if (length(hit)>=1)
            for k=hit
                EaxiomINcells{k} = rule(j).after;
            end
        end
    end
    %now convert individual cells back to a string
 
    expanded_axiom = [EaxiomINcells{:}];
    
end

end