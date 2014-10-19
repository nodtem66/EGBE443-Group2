%%
% type 1: Add Value
% type 2: Multiply
%%
function newData = setContrast(pic,value,type)

if type==1  % Add contrast
    newData = pic+value;
elseif type==2  % Multiple contrast
    newData = pic*value;
else
    fprintf('Error');
end
