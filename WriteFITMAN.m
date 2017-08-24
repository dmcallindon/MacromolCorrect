function success = WriteFITMAN(filename, header, k, scalefactor)

% This function reads the data from the given file into an array
% Input: 
%		filename
% Output:
% k is the data in complex numbers
% Author: David McAllindon

success=0;
% open file and log error if file can't be opened
fid = fopen(filename, 'w');
if fid== -1
   error('Error opening file');
   success=0
else  % file can be opened
   % file is read as lines (fgetl) because full file read functions are inadequate for these files
% First 12 lines are header
fprintf(fid, '%s \n', header{1,1});
fprintf(fid, '%s \n', header{2,1});
fprintf(fid, '%s \n', header{3,1});
fprintf(fid, '%s \n', header{4,1});
fprintf(fid, '%s \n', header{5,1});
fprintf(fid, '%s \n', header{6,1});
fprintf(fid, '%s \n', header{7,1});
fprintf(fid, '%s \n', header{8,1});
fprintf(fid, '%s \n', header{9,1});
fprintf(fid, '%s \n', header{10,1});
fprintf(fid, '%s \n', header{11,1});
fprintf(fid, '%s \n', header{12,1});
k=k';
np=size(k)
for i=1:1:np
    fprintf(fid, '%s \n', num2str(real(k(i))/10^scalefactor));
    fprintf(fid, '%s \n', num2str((-1)*imag(k(i))/10^scalefactor));
end
fclose(fid);
success=1;
end

return
