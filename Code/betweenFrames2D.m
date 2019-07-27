function [F, J_f_f1, J_f_f2] = betweenFrames2D(F1, F2)

% - - - - - - - - - - - - - Frame 1: - - - - - - - - - - - - -
% - T1 -> Position X and Y
% - th1 -> Orientation
T1 = F1(1:2);
th1 = F1(3);
R1 = [cos(th1) -sin(th1) ; sin(th1) cos(th1)];

% - - - - - - - - - - - - - Frame 2: - - - - - - - - - - - - -
% - T1 -> Position X and Y
% - th1 -> Orientation
T2 = F2(1:2);
th2 = F2(3);
R2 = [cos(th2) -sin(th2) ; sin(th2) cos(th2) ];

T = R1' * (T2 - T1);
th = th2 - th1;

F = [T; th];

x1 = T1(1);
y1 = T1(2);
x2 = T2(1);
y2 = T2(2);

J_f_f1 = [...
    [ -cos(th1), -sin(th1), sin(th1)*(x1 - x2) - cos(th1)*(y1 - y2)]
    [  sin(th1), -cos(th1), cos(th1)*(x1 - x2) + sin(th1)*(y1 - y2)]
    [         0,         0,                                      -1]
]; 
 
J_f_f2 = [...
    [  cos(th1), sin(th1), 0]
    [ -sin(th1), cos(th1), 0]
    [         0,        0, 1]
];

end
