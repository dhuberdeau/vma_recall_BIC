screens=Screen('Screens');
screenNumber=max(screens);
[win, rect] = Screen('OpenWindow', screenNumber, 0); %[0 0 1600 900]);

screen_dims = [1600, 900];
home_position = screen_dims/2;
TEX_SIZE = [600, 400];

im_list = cell(1,5);
for i_im = 1:length(im_list)
    im_list{i_im} = imread(['instructions_pic_', num2str(i_im), '.png']);
end

for i_im = 1:length(im_list)
    keyIsDown = 0;
    text_drawn = 0;
    while ~keyIsDown
        [ keyIsDown, keyTime, keyCode ] = KbCheck;  
        if ~text_drawn
        %         Screen('DrawText', win, 'test', home_position(1), home_position(2), [255 255 255]);
            temp_tx = Screen('MakeTexture', win, im_list{i_im});
            tx_size_ = size(im_list{i_im});
            tx_dims = [0; 0; tx_size_(2); tx_size_(1)];
            Screen('DrawTexture', win, temp_tx, tx_dims,...
                [home_position(1) - TEX_SIZE(1), home_position(2) - TEX_SIZE(2),...
                home_position(1) + TEX_SIZE(1), home_position(2) + TEX_SIZE(2)]);
            
            Screen('Flip', win)
%             pause(10)
            text_drawn = 1;
        end
        pause(.1);
    end
end

sca

retention_experiment_practice;