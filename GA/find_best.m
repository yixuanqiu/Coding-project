function fit_value = find_best(x,y) %set fitness fucntion
emergency_rate = [8 9 6 1 1 8 9;9 8 5 2 1 7 9;8 9 6 3 2 8 7; 4 2 1 1 2 5 9;5 1 2 4 4 9 8; 2 1 3 1 3 9 7; 3 4 1 2 1 3 8];%emergency rate
f=0;
for i=1:7
    for j=1:7
        f = f + emergency_rate(i,j)*(sqrt((i-x).^2+(j-y).^2)); %fitness function
    end
end
fit_value = 1./f;
end