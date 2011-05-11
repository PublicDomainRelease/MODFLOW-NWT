c
c     miunit      unit number for output
c     miout       switch for information message
c                  <  0 nothing printed
c                  = 0 print summary
c                  > 0 print at each iteration
c                         
c     minja       size of ja array
c     minjaf      size of jaf array
c     minsaf      size of af array for xmB
c                  note: size of af is ``minjaf'' for xmD and xmC
c     miliwrk     size of integer work array
c     milrwrk     size of real work array
c     miblkeq     number of black equations in preconditioning
c
      common /xmdinfo/ miunit, miout, minja, minjaf, minsaf,
     [                 miliwrk, milrwrk, miblkeq
      integer miunit, miout, minja, minjaf, minsaf,
     [        miliwrk, milrwrk, miblkeq
