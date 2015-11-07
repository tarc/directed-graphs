adjacent( a , a ).
adjacent( a , b ).
adjacent( b , c ).
adjacent( c , d ).
adjacent( d , e ).
adjacent( e , b ).
adjacent( d , a ).

allowed( V1 , V2 , BL ) :-
  \+ V1 = V2 ,
  \+ memberchk( V1 , BL ) ,
  \+ memberchk( V2 , BL ).

% path( Origin , Destiny , Visited , Path ).
% ==
% There's a `path` (a list of nodes) from `origin` to `destiny` which does not
% contain any vertice from the `visited` set.

path( Origin , Destiny , Visited , [ Origin , Destiny ] ) :-

  adjacent( Origin , Destiny ) ,

  allowed( Origin , Destiny , Visited ).


path( Origin , Destiny , Visited , [ Origin | Path ] ) :-

  adjacent( Origin , Inter ) ,

  allowed( Origin , Inter , Visited ) ,

  path( Inter , Destiny , [ Origin | Visited ] , Path ).
