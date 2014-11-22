function myUFunion(x, y)
    global parents
    global ranks
    
    xRoot = myUFfind(x);
    yRoot = myUFfind(y);
    if xRoot == yRoot
        return
    end
    
    if ranks(xRoot) < ranks(yRoot)
        parents(xRoot) = yRoot;
    elseif ranks(xRoot) > ranks(yRoot)
        parents(yRoot) = xRoot;
    else
        parents(yRoot) = xRoot;
        ranks(xRoot) = ranks(xRoot) + 1;
    end
end