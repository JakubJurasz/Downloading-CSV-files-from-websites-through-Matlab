% Data Download From Website CSV + mouse control

% This specyfic exampe is intended to download electricity demand data from
% the following website:
% https://demanda.ree.es/visiona/baleares/formentera5m/tablas/ the user is
% asked to specify for which days of the year he wished to download the
% data

% Getting control over the mouse
import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;

% Dynamic naming of the URL addresses
formatOut = 'yyyy-mm-dd';
A = datetime(2022,01,01);   % Starting day

% Dates vector
AA{1} = datestr(A,formatOut);
for i=1:364
    AA{i+1} = datestr(A+i,formatOut);
end

% Accessing website in a loop 
for i = 1:5   
% Creating new URL and opening website    
URL_New = append('https://demanda.ree.es/visiona/baleares/formentera5m/tablas/', AA{i}, '/1');
web(URL_New)

pause(5)  % few second to load the page

% moving mouse pointer to a specified location where CSV download is
% possible: 1760, 780 inputs should be user defined
hroot=groot;
set(hroot,'PointerLocation',[1760,780]);

% pressing and releasing the right mouse button to download the CSV
mouse.mousePress(InputEvent.BUTTON1_MASK);
mouse.mouseRelease(InputEvent.BUTTON1_MASK);

pause(5)  % Downloading the CSV

% moving mouse pointer to close (x) the web browser: 1900, 1200 inputs
% should be user defined
set(hroot,'PointerLocation',[1900,1200])

% pressing and releasing the right mouse button to close the web browser
mouse.mousePress(InputEvent.BUTTON1_MASK);
mouse.mouseRelease(InputEvent.BUTTON1_MASK);

end
