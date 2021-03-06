        real function piNsg0(srt)
      SAVE   
* cross section in mb for PI- + P -> P + K0 + K-
c     Mn + 2* Mk
        srt0 = 0.938 + 2.*0.498
        if(srt.lt.srt0) then
           piNsg0 = 0.0
           return
        endif
        ratio = srt0**2/srt**2
        piNsg0=1.121*(1.-ratio)**1.86*ratio**2
        return
        end
