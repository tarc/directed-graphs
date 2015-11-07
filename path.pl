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
% There's a `Path` (a list of non repeating nodes containing at least two
% nodes) from `Origin` to `Destiny` which does not contain any node from the
% `Visited` set.
path( Origin , Destiny , Visited , [ Origin , Destiny ] ) :-

  adjacent( Origin , Destiny ) ,

  allowed( Origin , Destiny , Visited ).


path( Origin , Destiny , Visited , [ Origin | Path ] ) :-

  adjacent( Origin , Inter ) ,

  allowed( Origin , Inter , Visited ) ,

  % Find some Path not passing by the Origin or the aready Visited nodes:
  path( Inter , Destiny , [ Origin | Visited ] , Path ).
