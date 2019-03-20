screens=Screen('Screens');
screenNumber=max(screens);
[win, rect] = Screen('OpenWindow', screenNumber, 0); %[0 0 1600 900]);

screen_dims = [1600, 900];
home_position = screen_dims/2;


keyIsDown = 0;
text_drawn = 0;
while ~keyIsDown
    [ keyIsDown, keyTime, keyCode ] = KbCheck;  
    if ~text_drawn
        Screen('DrawText', win, 'test', home_position(1), home_position(2), [255 255 255]);
        Screen('Flip', win)
        text_drawn = 1;
    end
    pause(.017);
end

sca