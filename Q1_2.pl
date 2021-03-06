% CSI4106 Assignment 4
% Question 1, part 2 - How to exactly get from one place to another (which cities to go through)

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

move(Start,Dest):- byCar(Start,Dest).
move(Start,Dest):- byTrain(Start,Dest).
move(Start,Dest):- byPlane(Start,Dest).

path(Start,Dest):- travel(Start,Dest).

travel(Start,Dest,path(Start,Dest)):- move(Start,Dest).
travel(Start,Dest,path(Start,Inbtwn,Route)):- move(Start,Inbtwn),
    travel(Inbtwn,Dest,Route).


% use query: travel(valmont,frankfurt,X).
       
