      FUNCTION IARFLV(IPDG)
      common/input1/ MASSPR,MASSTA,ISEED,IAVOID,DT
cc      SAVE /input1/
      COMMON/RNDF77/NSEED
cc      SAVE /RNDF77/
      SAVE   
c.....anti-Delta-
      IF (IPDG .EQ. -1114) THEN
         IARFLV = -6
         RETURN
      END IF
c.....anti-Delta0
      IF (IPDG .EQ. -2114) THEN
         IARFLV = -7
         RETURN
      END IF
c.....anti-Delta+
      IF (IPDG .EQ. -2214) THEN
         IARFLV = -8
         RETURN
      END IF
c.....anti-Delta++
      IF (IPDG .EQ. -2224) THEN
         IARFLV = -9
         RETURN
      END IF
cbzdbg2/23/99
c.....anti-proton
      IF (IPDG .EQ. -2212) THEN
         IARFLV = -1
         RETURN
      END IF
c.....anti-neutron
      IF (IPDG .EQ. -2112) THEN
         IARFLV = -2
         RETURN
      END IF
cbzdbg2/23/99end
c.....eta
      IF (IPDG .EQ. 221) THEN
         IARFLV = 0
         RETURN
      END IF
c.....proton
      IF (IPDG .EQ. 2212) THEN
         IARFLV = 1
         RETURN
      END IF
c.....neutron
      IF (IPDG .EQ. 2112) THEN
         IARFLV = 2
         RETURN
      END IF
c.....pi-
      IF (IPDG .EQ. -211) THEN
         IARFLV = 3
         RETURN
      END IF
c.....pi0
      IF (IPDG .EQ. 111) THEN
         IARFLV = 4
         RETURN
      END IF
c.....pi+
      IF (IPDG .EQ. 211) THEN
         IARFLV = 5
         RETURN
      END IF
c.....Delta-
      IF (IPDG .EQ. 1114) THEN
         IARFLV = 6
         RETURN
      END IF
c.....Delta0
      IF (IPDG .EQ. 2114) THEN
         IARFLV = 7
         RETURN
      END IF
c.....Delta+
      IF (IPDG .EQ. 2214) THEN
         IARFLV = 8
         RETURN
      END IF
c.....Delta++
      IF (IPDG .EQ. 2224) THEN
         IARFLV = 9
         RETURN
      END IF
c.....Lambda
      IF (IPDG .EQ. 3122) THEN
         IARFLV = 14
         RETURN
      END IF
c.....Lambda-bar
      IF (IPDG .EQ. -3122) THEN
         IARFLV = -14
         RETURN
      END IF
c.....Sigma-
      IF (IPDG .EQ. 3112) THEN
         IARFLV = 15
         RETURN
      END IF
c.....Sigma-bar
      IF (IPDG .EQ. -3112) THEN
         IARFLV = -15
         RETURN
      END IF 
c.....Sigma0
      IF (IPDG .EQ. 3212) THEN
         IARFLV = 16
         RETURN
      END IF
c.....Sigma0-bar
      IF (IPDG .EQ. -3212) THEN
         IARFLV = -16
         RETURN
      END IF 
c.....Sigma+
      IF (IPDG .EQ. 3222) THEN
         IARFLV = 17
         RETURN
      END IF
c.....Sigma+ -bar
      IF (IPDG .EQ. -3222) THEN
         IARFLV = -17
         RETURN
      END IF 
c.....K-
      IF (IPDG .EQ. -321) THEN
         IARFLV = 21
         RETURN
      END IF
c.....K+
      IF (IPDG .EQ. 321) THEN
         IARFLV = 23
         RETURN
      END IF
c.....temporary entry for K0
      IF (IPDG .EQ. 311) THEN
         IARFLV = 23
         RETURN
      END IF
c.....temporary entry for K0bar
      IF (IPDG .EQ. -311) THEN
         IARFLV = 21
         RETURN
      END IF
c.....temporary entry for K0S and K0L
      IF (IPDG .EQ. 310 .OR. IPDG .EQ. 130) THEN
         R = RANART(NSEED)
         IF (R .GT. 0.5) THEN
            IARFLV = 23
         ELSE
            IARFLV = 21
         END IF
         RETURN
      END IF
c.....rho-
      IF (IPDG .EQ. -213) THEN
         IARFLV = 25
         RETURN
      END IF
c.....rho0
      IF (IPDG .EQ. 113) THEN
         IARFLV = 26
         RETURN
      END IF
c.....rho+
      IF (IPDG .EQ. 213) THEN
         IARFLV = 27
         RETURN
      END IF
c.....omega
      IF (IPDG .EQ. 223) THEN
         IARFLV = 28
         RETURN
      END IF
c.....phi
      IF (IPDG .EQ. 333) THEN
         IARFLV = 29
         RETURN
      END IF
c.....K*+
      IF (IPDG .EQ. 323) THEN
         IARFLV = 30
         RETURN
      END IF
c.....K*-
      IF (IPDG .EQ. -323) THEN
         IARFLV = -30
         RETURN
      END IF
c.....temporary entry for K*0
      IF (IPDG .EQ. 313) THEN
         IARFLV = 30
         RETURN
      END IF
c.....temporary entry for K*0bar
      IF (IPDG .EQ. -313) THEN
         IARFLV = -30
         RETURN
      END IF
c...... eta-prime
      IF (IPDG .EQ. 331) THEN
         IARFLV = 31
         RETURN
      END IF
c...... a1
c     IF (IPDG .EQ. 777) THEN
c        IARFLV = 32
c        RETURN
c     END IF
c... cascade-
      IF (IPDG .EQ. 3312) THEN
         IARFLV = 40
         RETURN
      END IF
c... cascade+ (bar)
      IF (IPDG .EQ. -3312) THEN
         IARFLV = -40
         RETURN
      END IF
c... cascade0
      IF (IPDG .EQ. 3322) THEN
         IARFLV = 41
         RETURN
      END IF
c... cascade0 -bar
      IF (IPDG .EQ. -3322) THEN
         IARFLV = -41
         RETURN
      END IF
c... Omega-
      IF (IPDG .EQ. 3334) THEN
         IARFLV = 45
         RETURN
      END IF 
c... Omega+ (bar)
      IF (IPDG .EQ. -3334) THEN
         IARFLV = -45
         RETURN
      END IF
c... Di-Omega
      IF (IPDG .EQ. 6666) THEN
         IARFLV = 44
         RETURN
      END IF
c sp06/05/01 end    
clin-3/2009 keep the same ID numbers in case there are initial deuterons:
      IF (IPDG .EQ. 42 .or. IPDG .EQ. -42) THEN
         IARFLV = IPDG
         RETURN
      END IF
c.....other
      IARFLV = IPDG + 10000
      RETURN
      END
c-----------------------------------------------------------------------
c.....function to convert ART flavor code into PDG flavor code.
