numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(-X) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(X-Y) :- numeral(X), numeral(Y).

add2(X,s(0+Y),Z) :- add2(X,s(Y),Z).
add2(-(X),Y,Z) :- minus(X,T),add2(T,Y,Z).
add2(X,-(Y),Z) :- minus(Y,T),add2(X,T,Z).
add2(-(X),-(Y),Z) :- minus(X,T),minus(Y,W),add2(T,W,Z).

add2(X+Q,Y,Z) :- add2(X,Q,T),add2(T,Y,Z).
add2(X,Y+Q,Z) :- add2(Y,Q,T),add2(X,T,Z).
add2(X+Q,Y+W,Z) :- add2(X,Q,T),add2(Y,W,Y),add2(T,Y,Z).

add2(X-Q,Y,Z) :- subtract(X,Q,T),add2(T,Y,Z).
add2(X,Y-Q,Z) :- subtract(Y,Q,T),add2(X,T,Z).
add2(X-Q,Y-W,Z) :- subtract(X,Q,T),subtract(Y,W,Y),add2(T,Y,Z).

add2(p(s(X)),Y,Z) :- add2(X,Y,Z).
add2(X,p(s(Y)),Z) :- add2(X,Y,Z).
add2(p(s(X)),p(s(Y)),Z) :- add2(X,Y,Z).
add2(s(p(X)),Y,Z) :- add2(X,Y,Z).
add2(X,s(p(Y)),Z) :- add2(X,Y,Z).
add2(s(p(X)),s(p(Y)),Z) :- add2(X,Y,Z).

add2(0,X,X).
add2(X,0,X).

add2(s(X),p(Y),Z) :- add2(X,Y,Z).
add2(p(X),s(Y),Z) :- add2(X,Y,Z).
add2(s(X),Y,s(Z)) :- add2(X,Y,Z).
add2(p(X),Y,p(Z)) :- add2(X,Y,Z).

minus(0,0).
minus(s(0),p(0)).
minus(p(0),s(0)).

minus(X+Y,Z) :- add2(X,Y,T),minus(T,Z).
minus(X-Y,Z) :- subtract(X,Y,T),minus(T,Z).

minus(p(s(X)),Z) :- add2(X,0,T),minus(T,Z).
minus(s(p(X)),Z) :- add2(X,0,T),minus(T,Z).
minus(s(X),p(Z)) :- add2(X,0,T),minus(T,Z).
minus(p(X),s(Z)) :- add2(X,0,T),minus(T,Z).

subtract(-(X),Y,Z) :- minus(X,T),minus(Y,W),add2(T,W,Z).
subtract(X,-(Y),Z) :- minus(Y,T),minus(T,W),add2(X,W,Z).
subtract(-(X),-(Y),Z) :- minus(X,T),minus(Y,W),minus(W,V),add2(T,V,Z).
subtract(X,Y,Z) :- minus(Y,T),add2(X,T,Z).
