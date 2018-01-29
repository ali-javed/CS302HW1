%Created By Ali Javed
%Class Project1 CS302 - Modeling Complex Systems
%Date Jan-26-2018
%ali.javed@uvm.edu
%jminot@uvm.edu

%This function read the rule file in specied format from data directory
%INPUT 
%factral
%lenBth of the base line segments corresponding to the symbols F and B as
%lenF and lenB

%OUTPUT
%plot that draws the factral



function status = DrawFractal(lenF,lenB, delta,Eaxiom)

% Now draw the string as turtle graphics
%Upper case (e.g. F or G) causes a line to be drawn in the current direction of the turtle
%Lower case causes a move with no draw
%angle +operator means turn left; -operator means turn right

%set status to 0
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

hold on

for i=1:length(Eaxiom)
    cmdT = Eaxiom(i);
    switch cmdT
    case 'F'
        stackRow = drawPath(stackRow, [.3 .3 0],lenF);
       
        
     
    case 'B'
        stackRow = drawPath(stackRow, 'g',lenB);
      
    case '+'
        
        turns = extractNumber(Eaxiom,i);
        %clarify on this 
        rads = da*turns;
        stackRow.aT = stackRow.aT + rads;
        
 
        
    case '-'
        turns = extractNumber(Eaxiom,i);
        rads = da*turns;
        stackRow.aT = stackRow.aT - rads;
    case '[' %push the stack
        
        stackRows(stkPtr) = stackRow;
        stkPtr = stkPtr +1 ;
    case ']' %pop the stack
        stkPtr = stkPtr -1 ;
        stackRow = stackRows(stkPtr);
        
    otherwise
        disp('error')
        return
    end
end

axis equal
figure(gcf)

%set status to 1 as sucessful
status = 1;

end

function [stackRow] = drawPath(stackRow, colorVal,len)

    newxT = stackRow.xT + len*cos(stackRow.aT);
    newyT = stackRow.yT + len*sin(stackRow.aT);
    line([stackRow.yT newyT], [stackRow.xT newxT],'color',colorVal, 'linewidth',2);
    stackRow.xT = newxT;
    stackRow.yT = newyT;
    
end



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
