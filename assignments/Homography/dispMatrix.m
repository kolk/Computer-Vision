temp =    [   -0.9954   -0.0957   -0.0001
    0.0957   -0.9954   -0.0000
   -0.0001   -0.0000    1.0000
];

for j = 1:3
    str = '';
for i = 1:3
    str = [str ' ' num2str(temp(j,i)) ' & '];

end

disp([str(1:end-2) '\\']);
end