function fitness=city_river(x,y)
emergency_data = [8 9 6 1 1 8 9;9 8 5 2 1 7 9;8 9 6 3 2 8 7; 4 2 1 1 2 5 9;5 1 2 4 4 9 8; 2 1 3 1 3 9 7; 3 4 1 2 1 3 8];
f = 0;
if x<=5
       for i=1:7
           for j=1:7
            if i<=5
               f=f+(sqrt((i-x).^2+(j-y).^2)).*emergency_data(j,i);
            end
            if i>5
                 f=f+((sqrt((i-5).^2+(j-5.5).^2))+(sqrt((5-x).^2+(5.5-y).^2))).*emergency_data(j,i);
            end
           end
       end
else
       for i=1:7
           for j=1:7
            if i<=5
                 f=f+((sqrt((i-5).^2+(j-5.5).^2))+(sqrt((5-x).^2+(5.5-y).^2))).*emergency_data(j,i);
            end
            if i>5
                  f=f+(sqrt((i-x).^2+(j-y).^2)).*emergency_data(j,i);
            end
           end
       end
end
fitness=1./f;
end