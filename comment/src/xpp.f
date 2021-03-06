      real function Xpp(srt)
*  This function contains the experimental total n-p cross sections           *
*  srt    = DSQRT(s) in GeV                                                   *
*  xsec   = production cross section in mb                                    *
*  earray = EXPerimental table with proton energies in MeV                    *
*  xarray = EXPerimental table with cross sections in mb (curve to guide eye) *
*  WITH A CUTOFF AT 55MB                                                      *
******************************************
c      real*4   xarray(14), earray(14)
      real   xarray(14), earray(14)
      SAVE   
      data earray /20.,30.,40.,60.,80.,100.,
     &170.,250.,310.,
     &350.,460.,560.,660.,800./
      data xarray /150.,90.,80.6,48.0,36.6,
     &31.6,25.9,24.0,23.1,
     &24.0,28.3,33.6,41.5,47/
       pmass=0.9383 
* 1.Calculate E_kin(lab) [MeV] from srt [GeV]
*   Formula used:   DSQRT(s) = 2 m DSQRT(E_kin/(2m) + 1)
      ekin = 2000.*pmass*((srt/(2.*pmass))**2 - 1.)
      if (ekin .lt. earray(1)) then
        xpp = xarray(1)
       IF(XPP.GT.55)XPP=55
        return
      end if
       IF(EKIN.GT.EARRAY(14))THEN
       XPP=XARRAY(14)
       RETURN
       ENDIF
*
*
* 2.Interpolate double logarithmically to find sigma(srt)
*
      do 1001 ie = 1,14
        if (earray(ie) .eq. ekin) then
          xPP= xarray(ie)
       if(xpp.gt.55)xpp=55.
          return
       endif
        if (earray(ie) .gt. ekin) then
          ymin = alog(xarray(ie-1))
          ymax = alog(xarray(ie))
          xmin = alog(earray(ie-1))
          xmax = alog(earray(ie))
          XPP = exp(ymin + (alog(ekin)-xmin)
     &          *(ymax-ymin)/(xmax-xmin) )
       IF(XPP.GT.55)XPP=55.
       go to 50
        end if
 1001 continue
50       continue
        return
        END
******************************************
