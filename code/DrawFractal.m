% DrawFractal.m: Draw an already expanded L-system string using Turtle Graphics
% function status = DrawFractal(lenF,lenB, delta,Eaxiom)
%
% INPUTS:
% lenF == length of segment to draw for F
% lenB == length of segment to draw for B
% delta == The angle at which the turtule turns on a + (for any number that
% preceeds + angle is multiplied by that number)
% Eaxiom = The expanded axiom\factral that needs to be drawn

%
% OUTPUTS:
% status == 1 for sucess and 0 for failure
% direct output of 2D plot to screen, of str interpreted with Turtle Graphics
%
% sample test call: DrawFractal(1,1, 27.5,Eaxiom)
% original code at http://courses.cit.cornell.edu/bionb441/LSystem/index.html
% modified by Ali Javed and Josh Minot Jan-29-2018
% Class Project1 CS302 - Modeling Complex Systems


%%

function status = DrawFractal(lenF,lenB, delta,Eaxiom)

%set status to 0 as default indicating failure
status = 0;


%pre allocate stack rows
stackRows(100000) = struct('xT',0,'yT',0,'aT',0)

%Init the turtle
stackRow.xT = 0;
stackRow.yT = 0;
stackRow.aT = 0;
da = deg2rad(delta)

%init the turtle stack
stkPtr = 1;

%use the same figure
hold on

for i=1:length(Eaxiom)
    cmdT = Eaxiom(i);
    switch cmdT
    case 'F'
        stackRow = drawPath(stackRow, [.3 .3 0],lenF);
        
     
    case 'B'
        stackRow = drawPath(stackRow, 'g',lenB);
      
    case '+' %right hand turns
        
        turns = extractNumber(Eaxiom,i);
        rads = da*turns;
        stackRow.aT = stackRow.aT + rads;
        
 
        
    case '-' %left hand turns
        turns = extractNumber(Eaxiom,i);
        rads = da*turns;
        stackRow.aT = stackRow.aT - rads;
    case '[' %push the stack
        
        stackRows(stkPtr) = stackRow;
        stkPtr = stkPtr +1 ;
    case ']' %pop the stack
        stkPtr = stkPtr -1 ;
        stackRow = stackRows(stkPtr);
        
        otherwise %any unhandled case
        disp('error')
        return
    end
end

axis equal
figure(gcf)

%save the figure with title here

%set status to 1 as sucessful
status = 1;

end
%%

%This function draws a path given a stackRow object length of segment and
%color
%INPUTS
%stackRow Object
%stackRow.xT == x-axis;
%stackRow.yT = y-axis;
%stackRow.aT = angle;

%colorVal == the color of line segmant drawn
%len == length of line segmant drawn

%OUTPUT
%direct output of 2D plot to screen of line segment drawn.

%sample call drawPath(stackRow, 'g',1)

function [stackRow] = drawPath(stackRow, colorVal,len)

    newxT = stackRow.xT + len*cos(stackRow.aT);
    newyT = stackRow.yT + len*sin(stackRow.aT);
    line([stackRow.yT newyT], [stackRow.xT newxT],'color',colorVal, 'linewidth',2);
    stackRow.xT = newxT;
    stackRow.yT = newyT;
    
end


%%
%This function extracts a number given a string and an index before which
%to extract the number. The index should have a number in th epreceeding
%index

%INPUTS 
%Eaxiom == any factral string for example 'FF32+B'
%i == index, has to be index of + or -.

%sample call extractNumber('FF32+B,5)

function turns = extractNumber(Eaxiom,i)
        mul = 1;
        k =i-1;
        temp_num = 0;
        turns = 0;
        if i ~= 1
            while (((Eaxiom(k)-'0')<10) & ((Eaxiom(k)-'0')>-1))
                temp_num = str2num(Eaxiom(k));
                temp_num = temp_num*mul;
                turns = turns +temp_num;
                k = k -1;
                mul = mul*10;
            end
        end
        %make more elegant
        if turns == 0
            turns = 1;
        end

end

