        FUNCTION GMRE(X)
        IMPLICIT DOUBLE PRECISION (A-H,O-Z)
        SAVE   
        Z=X
        IF(X.GT.3.0D0) GO TO 10
        Z=X+3.D0
10      GMRE=0.5D0*DLOG(2.D0*3.14159265D0/Z)+Z*DLOG(Z)-Z+DLOG(1.D0
     1        +1.D0/12.D0/Z+1.D0/288.D0/Z**2-139.D0/51840.D0/Z**3
     1        -571.D0/2488320.D0/Z**4)
        IF(Z.EQ.X) GO TO 20
        GMRE=GMRE-DLOG(Z-1.D0)-DLOG(Z-2.D0)-DLOG(Z-3.D0)
20      CONTINUE
        RETURN
        END
