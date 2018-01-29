%Created By Ali Javed and Josh
%Class Project1 CS302 - Modeling Complex Systems
%Date Jan-26-2018
%ali.javed@uvm.edu
%jminot@uvm.edu
%INPUT 
%rules in format rule.before rule.after
%axiom
%depth to iterate to as nReps
%total number of rules present as nRules
%returns the expanded axiom



function expanded_axiom = Iterate(rule, axiom, nReps, nRules)
expanded_axiom = axiom
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