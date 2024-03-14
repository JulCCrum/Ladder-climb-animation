%% Julian Crummedyo %%
%%% Midterm Exam %%%

% Number 1: MATLAB Animation

figure; % Set up the figure
axis([0 2 0 10]); % Sizing the figure
hold on;

for i = 0:1:9 % Drawing the ladder
    line([1, 1.1], [i, i], 'Color', 'black'); % Setting up lines
end
line([1, 1], [0, 10], 'Color', 'black'); % Left side of ladder
line([1.1, 1.1], [0, 10], 'Color', 'black'); % Right side of ladder

text(0.5, 9, "One step at a time and eventually you're at the top.", 'FontSize', 9, 'HorizontalAlignment', 'center'); % Add the motivational quote

theta = linspace(0, 2*pi, 50); % Define the angle range for the circle
head_radius = 0.03; % Head radius
ball_radius = 0.02; % Ball radius

head_center = [1.05, 1]; % Center of the head
ball_center = [1, 0.9]; % Center of the ball

head = patch('XData', head_center(1) + head_radius*cos(theta), 'YData', head_center(2) + head_radius*sin(theta), 'FaceColor', 'blue'); % Creating the patch for the head
ball = patch('XData', ball_center(1) + ball_radius*cos(theta), 'YData', ball_center(2) + ball_radius*sin(theta), 'FaceColor', 'green'); % Creating the patch for the ball

body = line([1.05, 1.05], [1, 0.7], 'Color', 'blue'); % Creating the body for the stick figure
arms = line([1, 1.1], [0.9, 0.9], 'Color', 'blue'); % Creating the arms for the stick figure
leg1 = line([1.05, 1.03], [0.7, 0.5], 'Color', 'blue'); % Creating one leg for the stick figure
leg2 = line([1.05, 1.07], [0.7, 0.5], 'Color', 'blue'); % Creating another leg for the stick figure

mov = VideoWriter('climbing_animation.avi'); % Setting up the VideoWriter object
open(mov);

for step = 1:150 % Animating the head
    new_head_y = head_center(2) + step * 0.1 + 0.05 * sin(step); % Calculating the new position for the head
    set(head, 'YData', new_head_y + head_radius*sin(theta)); % Updating the position for the head

    new_ball_y = ball_center(2) + step * 0.1 + 0.05 * sin(step); % Calculating the new position for the ball
    set(ball, 'YData', new_ball_y + ball_radius*sin(theta)); % Updating the position for the ball

    set(body, 'YData', [new_head_y - 0.03, new_head_y - 0.33]); % Updating the position for the body
    set(arms, 'YData', [new_head_y - 0.15, new_head_y - 0.15]); % Updating the position for the arms
    set(leg1, 'YData', [new_head_y - 0.33, new_head_y - 0.53]); % Updating the position for the leg 1
    set(leg2, 'YData', [new_head_y - 0.33, new_head_y - 0.53]); % Updating the position for the leg 2
    
    frame = getframe(gcf); % Capturing the frame
    writeVideo(mov, frame); % Capturing the frame

    pause(0.05); % Pausing to control the speed of the animation
end

close(mov);