% CSI4106 Assignment 4
% Question 1, part 1 - query whether possible to travel from one place to another


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
