        FUNCTION FNJET(X)
        COMMON/HPARNT/HIPR1(100),IHPR2(50),HINT1(100),IHNT2(50)
        COMMON/NJET/N,ipcrs
        SAVE   
        OMG1=OMG0(X)*HINT1(11)/HIPR1(31)
        C0=EXP(N*ALOG(OMG1)-SGMIN(N+1))
        IF(N.EQ.0) C0=1.0-EXP(-2.0*OMG0(X)*HIPR1(30)/HIPR1(31)/2.0)
        FNJET=C0*EXP(-OMG1)
        RETURN
        END
