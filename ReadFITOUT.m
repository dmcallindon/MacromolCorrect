function [P, nP, ref_freq, Units, header] = ReadFITOUT(filename)

% This function reads the output data from the given file into an array
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
% First 15 lines are header
Units=cell(15);
lines=fgetl(fid);
    header(1)=cellstr(lines);
lines=fgetl(fid);
    header(2)=cellstr(lines);
lines=fgetl(fid);
    header(3)=cellstr(lines);
lines=fgetl(fid);
    A = sscanf(lines, '%12c %d');
    nP=A(13)
    header(4)=cellstr(lines);
lines=fgetl(fid);
    A = sscanf(lines, '%16c');
    Units=A(14)
    header(5)=cellstr(lines)
lines=fgetl(fid);
    header(6)=cellstr(lines);
    A = sscanf(lines, '%19c %f');
    ref_freq=A(20)
lines=fgetl(fid);
    header(7)=cellstr(lines);
lines = fgetl(fid);
    header(8)=cellstr(lines);
lines = fgetl(fid);
    header(9)=cellstr(lines);
lines=fgetl(fid);
    header(10)=cellstr(lines);
lines=fgetl(fid);
    header(11)=cellstr(lines);
lines=fgetl(fid);
    header(12)=cellstr(lines);
lines=fgetl(fid);
    header(13)=cellstr(lines);
lines=fgetl(fid);
    header(14)=cellstr(lines);
lines=fgetl(fid);
    header(15)=cellstr(lines);
    
    
% Begin loop
% Get line
% If the line is eof or empty, then end the read
% Else if the line is a number, then store it in a temporary array
B=[];
while 1
	lines = fgetl(fid);
	if ~isstr(lines), break, end
	if isempty(lines), break, end	
	A = sscanf(lines, '%d %f %f %f %f %f %f');
    if (Units == 'P')
        A(2) = A(2)*ref_freq/1e6;
    end

    B = [B A];
end    %While

if size(B) ~= nP
    error('data doesnt have correct number of elements. See nP');  
end
end  %if fid ~= -1
fclose(fid);
P=B;
return
