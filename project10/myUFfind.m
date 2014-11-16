function x = myUFfind(x)
    global parents
    if ( parents(x) ~= x) 
        parents(x) = myUFfind(parents(x));
    end
    x = parents(x);
end