      SUBROUTINE PYINKI(CHFRAM,CHBEAM,CHTARG,WIN)   
      COMMON/LUJETS/N,K(9000,5),P(9000,5),V(9000,5)
      SAVE /LUJETS/ 
      COMMON/LUDAT1/MSTU(200),PARU(200),MSTJ(200),PARJ(200) 
      SAVE /LUDAT1/ 
      COMMON/PYSUBS/MSEL,MSUB(200),KFIN(2,-40:40),CKIN(200) 
      SAVE /PYSUBS/ 
      COMMON/PYPARS/MSTP(200),PARP(200),MSTI(200),PARI(200) 
      SAVE /PYPARS/ 
      COMMON/PYINT1/MINT(400),VINT(400) 
      SAVE /PYINT1/ 
      CHARACTER CHFRAM*8,CHBEAM*8,CHTARG*8,CHCOM(3)*8,CHALP(2)*26,  
     &CHIDNT(3)*8,CHTEMP*8,CHCDE(18)*8,CHINIT*76    
      DIMENSION LEN(3),KCDE(18) 
      DATA CHALP/'abcdefghijklmnopqrstuvwxyz',  
     &'ABCDEFGHIJKLMNOPQRSTUVWXYZ'/ 
      DATA CHCDE/'e-      ','e+      ','nue     ','nue~    ',   
     &'mu-     ','mu+     ','numu    ','numu~   ','tau-    ',   
     &'tau+    ','nutau   ','nutau~  ','pi+     ','pi-     ',   
     &'n       ','n~      ','p       ','p~      '/  
      DATA KCDE/11,-11,12,-12,13,-13,14,-14,15,-15,16,-16,  
     &211,-211,2112,-2112,2212,-2212/   
      CHCOM(1)=CHFRAM   
      CHCOM(2)=CHBEAM   
      CHCOM(3)=CHTARG   
      DO 120 I=1,3  
      LEN(I)=8  
      DO 100 LL=8,1,-1  
      IF(LEN(I).EQ.LL.AND.CHCOM(I)(LL:LL).EQ.' ') LEN(I)=LL-1   
      DO 100 LA=1,26    
  100 IF(CHCOM(I)(LL:LL).EQ.CHALP(2)(LA:LA)) CHCOM(I)(LL:LL)=   
     &CHALP(1)(LA:LA)   
      CHIDNT(I)=CHCOM(I)    
      DO 110 LL=1,6 
      IF(CHIDNT(I)(LL:LL+2).EQ.'bar') THEN  
        CHTEMP=CHIDNT(I)    
        CHIDNT(I)=CHTEMP(1:LL-1)//'~'//CHTEMP(LL+3:8)//'  ' 
      ENDIF 
  110 CONTINUE  
      DO 120 LL=1,8 
      IF(CHIDNT(I)(LL:LL).EQ.'_') THEN  
        CHTEMP=CHIDNT(I)    
        CHIDNT(I)=CHTEMP(1:LL-1)//CHTEMP(LL+1:8)//' '   
      ENDIF 
  120 CONTINUE  
      N=2   
      DO 140 I=1,2  
      K(I,2)=0  
      DO 130 J=1,18 
  130 IF(CHIDNT(I+1).EQ.CHCDE(J)) K(I,2)=KCDE(J)    
      P(I,5)=ULMASS(K(I,2)) 
      MINT(40+I)=1  
      IF(IABS(K(I,2)).GT.100) MINT(40+I)=2  
      DO 140 J=1,5  
  140 V(I,J)=0. 
      IF(K(1,2).EQ.0) WRITE(MSTU(11),1000) CHBEAM(1:LEN(2)) 
      IF(K(2,2).EQ.0) WRITE(MSTU(11),1100) CHTARG(1:LEN(3)) 
      IF(K(1,2).EQ.0.OR.K(2,2).EQ.0) STOP   
      DO 150 J=6,10 
  150 VINT(J)=0.    
      CHINIT=' '    
      IF(CHCOM(1)(1:2).EQ.'cm') THEN    
        IF(CHCOM(2)(1:1).NE.'e') THEN   
          LOFFS=(34-(LEN(2)+LEN(3)))/2  
          CHINIT(LOFFS+1:76)='PYTHIA will be initialized for a '//  
     &    CHCOM(2)(1:LEN(2))//'-'//CHCOM(3)(1:LEN(3))//' collider'//' ' 
        ELSE    
          LOFFS=(33-(LEN(2)+LEN(3)))/2  
          CHINIT(LOFFS+1:76)='PYTHIA will be initialized for an '// 
     &    CHCOM(2)(1:LEN(2))//'-'//CHCOM(3)(1:LEN(3))//' collider'//' ' 
        ENDIF   
        S=WIN**2    
        P(1,1)=0.   
        P(1,2)=0.   
        P(2,1)=0.   
        P(2,2)=0.   
        P(1,3)=SQRT(((S-P(1,5)**2-P(2,5)**2)**2-(2.*P(1,5)*P(2,5))**2)/ 
     &  (4.*S)) 
        P(2,3)=-P(1,3)  
        P(1,4)=SQRT(P(1,3)**2+P(1,5)**2)    
        P(2,4)=SQRT(P(2,3)**2+P(2,5)**2)    
      ELSEIF(CHCOM(1)(1:3).EQ.'fix') THEN   
        LOFFS=(29-(LEN(2)+LEN(3)))/2    
        CHINIT(LOFFS+1:76)='PYTHIA will be initialized for '//  
     &  CHCOM(2)(1:LEN(2))//' on '//CHCOM(3)(1:LEN(3))//    
     &  ' fixed target'//' '    
        P(1,1)=0.   
        P(1,2)=0.   
        P(2,1)=0.   
        P(2,2)=0.   
        P(1,3)=WIN  
        P(1,4)=SQRT(P(1,3)**2+P(1,5)**2)    
        P(2,3)=0.   
        P(2,4)=P(2,5)   
        S=P(1,5)**2+P(2,5)**2+2.*P(2,4)*P(1,4)  
        VINT(10)=P(1,3)/(P(1,4)+P(2,4)) 
        CALL LUROBO(0.,0.,0.,0.,-VINT(10))  
      ELSEIF(CHCOM(1)(1:3).EQ.'use') THEN   
        LOFFS=(13-(LEN(1)+LEN(2)))/2    
        CHINIT(LOFFS+1:76)='PYTHIA will be initialized for '//  
     &  CHCOM(2)(1:LEN(2))//' on '//CHCOM(3)(1:LEN(3))//    
     &  'user-specified configuration'//' ' 
        P(1,4)=SQRT(P(1,1)**2+P(1,2)**2+P(1,3)**2+P(1,5)**2)    
        P(2,4)=SQRT(P(2,1)**2+P(2,2)**2+P(2,3)**2+P(2,5)**2)    
        DO 160 J=1,3    
  160   VINT(7+J)=sngl((DBLE(P(1,J))+DBLE(P(2,J)))
     &          /DBLE(P(1,4)+P(2,4)))
        CALL LUROBO(0.,0.,-VINT(8),-VINT(9),-VINT(10))  
        VINT(7)=ULANGL(P(1,1),P(1,2))   
        CALL LUROBO(0.,-VINT(7),0.,0.,0.)   
        VINT(6)=ULANGL(P(1,3),P(1,1))   
        CALL LUROBO(-VINT(6),0.,0.,0.,0.)   
        S=P(1,5)**2+P(2,5)**2+2.*(P(1,4)*P(2,4)-P(1,3)*P(2,3))  
      ELSE  
        WRITE(MSTU(11),1800) CHFRAM(1:LEN(1))   
        STOP    
      ENDIF 
      IF(S.LT.PARP(2)**2) THEN  
        WRITE(MSTU(11),1900) SQRT(S)    
        STOP    
      ENDIF 
      MINT(11)=K(1,2)   
      MINT(12)=K(2,2)   
      MINT(43)=2*MINT(41)+MINT(42)-2    
      VINT(1)=SQRT(S)   
      VINT(2)=S 
      VINT(3)=P(1,5)    
      VINT(4)=P(2,5)    
      VINT(5)=P(1,3)    
      IF(MSTP(82).LE.1) VINT(149)=4.*PARP(81)**2/S  
      IF(MSTP(82).GE.2) VINT(149)=4.*PARP(82)**2/S  
 1000 FORMAT(1X,'Error: unrecognized beam particle ''',A,'''.'/ 
     &1X,'Execution stopped!')  
 1100 FORMAT(1X,'Error: unrecognized target particle ''',A,'''.'/   
     &1X,'Execution stopped!')  
 1800 FORMAT(1X,'Error: unrecognized coordinate frame ''',A,'''.'/  
     &1X,'Execution stopped!')  
 1900 FORMAT(1X,'Error: too low CM energy,',F8.3,' GeV for event ', 
     &'generation.'/1X,'Execution stopped!')    
      RETURN    
      END   
