% CSI4106 Assignment 4
% Question 1, part 3 - How to get from one place to another in terms of mode of transportation 
% last part below as well 


%Knowledge base
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

travel(Start,Dest):- move(Start, Dest).
travel(Start,Dest):- move(Start, Inbtwn), 
                         travel(Inbtwn, Dest).

move(Start,Dest,byCar):- byCar(Start,Dest).
move(Start,Dest, byTrain):- byTrain(Start,Dest).
move(Start,Dest, byPlane):- byPlane(Start,Dest).  % Comment out for train and car only

path(Start,Dest):- travel(Start,Dest).

travel(Start,Dest,path(Start,Dest,Mode)):- move(Start,Dest,Mode).
travel(Start,Dest,path(Start,Inbtwn,Mode,Route)):- move(Start,Inbtwn,Mode),
    travel(Inbtwn,Dest,Route).

% use travel(valmont,singapore,X).

% Last part of Question 1:

% to experiment with only using car and train for travel, assuming that we cannot reach
% the destinations byPlane (they become useless in the knowledge base) and we are using the combination of car and train
% we can comment out line 22-23, since there would not be any method to go by byPlane
% used travel(valmont,paris,X). and got 2 solutions using car and train only
