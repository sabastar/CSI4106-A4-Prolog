% CSI4106 Assignment 4
% Question 2 (all parts)


% knowledge representation of connected nodes
connected(1,2).
connected(2,14).
connected(14,4).
connected(4,5).
connected(4,9).
connected(5,7).
connected(7,8).
connected(8,13).
connected(13,6).
connected(9,10).
connected(10,3).
connected(3,12).
connected(12,11).
connected(11,5).

path(Start,Dest):- connected(Start,Dest).

path(Start,Dest):- connected(Start,Inbtwn),
    path(Inbtwn,Dest).
% use path(2,3) to see if we can get from node 2 to 3

% use travel(1,X). to see which nodes are reachable when you start from 1 (repeat for more nodes to appear)
travel(Start,path(Start,Dest)):- path(Start,Dest).

travel(Start,path(Start,Inbtwn,Route)):- path(Start,Inbtwn),
    travel(Inbtwn,Route).

% use travel(X,9). to see which nodes have some path to 9 (repeat for more nodes to appear)
travel(path(Start,Dest), Dest):- path(Start,Dest).

travel(path(Start,Inbtwn,Route)):- path(Start,Inbtwn),
    travel(Inbtwn,Route).
  
