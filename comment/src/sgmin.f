        FUNCTION SGMIN(N)
        SAVE   
        GA=0.
        IF(N.LE.2) GO TO 20
        DO 10 I=1,N-1
        Z=I
        GA=GA+ALOG(Z)
10      CONTINUE
20      SGMIN=GA
        RETURN
        END
C
C
C
