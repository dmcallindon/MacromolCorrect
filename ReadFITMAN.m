function [k, TE, T, np, scalefactor, header] = ReadFITMAN(filename)

% This function reads the data from the given file into an array
% Input: 
%		filename
% Output:
% k is the data in complex numbers
% Author: David McAllindon


% open file and log error if file can't be opened
fid = fopen(filename, 'r');
if fid== -1
   error('Error opening file');
   
else  % file can be opened
   % file is read as lines (fgetl) because full file read functions are inadequate for these files
% First 12 lines are header
header=cell(12);
lines=fgetl(fid);
    np = sscanf(lines,'%d')/2
    header(1)=cellstr(lines);
lines=fgetl(fid);
    header(2)=cellstr(lines);
lines=fgetl(fid);
    T=sscanf(lines, '%f')
    header(3)=cellstr(lines);
lines=fgetl(fid);
    header(4)=cellstr(lines);
lines=fgetl(fid);
    header(5)=cellstr(lines);
lines=fgetl(fid);
    header(6)=cellstr(lines);
lines=fgetl(fid);
    header(7)=cellstr(lines);
lines = fgetl(fid)
	A = sscanf(lines, '%21c %d %4s');
    scalefactor = A(22)
    header(8)=cellstr(lines);
lines = fgetl(fid);
	A  = sscanf(lines, '%3c %f %4s');
    TE = A(4)
    header(9)=cellstr(lines);
lines=fgetl(fid);
    header(10)=cellstr(lines);
lines=fgetl(fid);
    header(11)=cellstr(lines);
lines=fgetl(fid);
    header(12)=cellstr(lines);

% Begin loop
% Get line
% If the line is eof or empty, then end the read
% Else if the line is a number, then store it in a temporary array
B=[];
while 1
	lines = fgetl(fid);
	if ~isstr(lines), break, end
	if isempty(lines), break, end	
	A = sscanf(lines, '%f');
    A = A*10^scalefactor;
    B = [B A];
end    %While
%data is in alternating format - odds are real and evens are imag
% cmplx is a function that converts the temporary array into a complex
% numbers array
sizeB=size(B)
if sizeB(2)>2048
    B = B(1, 1:2048);
    sizeB=size(B)
end
C = reshape(B, [2 np]);
size(C)
if mod(size(C,2), 2) == 0
    k=complex(C)';
else
    error('data doesnt have an even number of elements');
    k=0;
end
end  %if fid ~= -1
fclose(fid);

return
