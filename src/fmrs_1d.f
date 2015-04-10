C++*********************************************************************
C
C $$ FMRS_1D.FOR
C
C **********************************************************************
C=*                                                                    *
C=* This file is part of:   SPIDER - Modular Image Processing System.  *
C=* SPIDER System Authors:  Joachim Frank & ArDean Leith               *
C=* Copyright 1985-2010  Health Research Inc.,                         *
C=* Riverview Center, 150 Broadway, Suite 560, Menands, NY 12204.      *
C=* Email: spider@wadsworth.org                                        *
C=*                                                                    *
C=* SPIDER is free software; you can redistribute it and/or            *
C=* modify it under the terms of the GNU General Public License as     *
C=* published by the Free Software Foundation; either version 2 of the *
C=* License, or (at your option) any later version.                    *
C=*                                                                    *
C=* SPIDER is distributed in the hope that it will be useful,          *
C=* but WITHOUT ANY WARRANTY; without even the implied warranty of     *
C=* merchantability or fitness for a particular purpose.  See the GNU  *
C=* General Public License for more details.                           *
C=* You should have received a copy of the GNU General Public License  *
C=* along with this program. If not, see <http://www.gnu.org/licenses> *
C=*                                                                    *
C **********************************************************************
C  1D double precision mixed radix FFT.
C INPUT:  X(N) - real array
C OUTPUT: N even  X(N+2)
C   Order of elements:
C  R(0),0.0, R(1), I(1), R(2), I(2), ....., R(N/2-1), I(N/2-1), R(N/2),0.0
C
C         N odd  X(N+1)
C  R(0),0.0, R(1), I(1), R(2), I(2), ....., R(N/2-1), I(N/2-1), R(N/2),I(N/2-1)
C 
C INV: +1 forward FFT
C      -1 inverse FFT
C on output INV=0 indicates error
C
C
C IMAGE_PROCESSING_ROUTINE
C
C        1         2         3         4         5         6         7
C23456789012345678901234567890123456789012345678901234567890123456789012
C--*********************************************************************
C
C $$ FMRS_1D.FOR
C

        SUBROUTINE  FMRS_1D(X,N,INV)
        PARAMETER (LBUF=5000)
        DOUBLE PRECISION  X(*),WORK(LBUF),QT

#ifdef SP_LIBFFT
        IF(N+15.GT.LBUF)  THEN
           INV=0
C INSUFFICIENT BUFFER, INCREASE LBUF AND COMPILE SPIDER
           CALL  ERRT(6,'FMRS_1D',NE)
           RETURN
        ENDIF

        CALL  DZFFT1DUI(N,WORK)
        LDA=1
        IF(INV.GT.0)  THEN
           CALL  DZFFT1DU(INV,N,X,LDA,WORK)
        ELSE
           CALL  ZDFFT1DU(INV,N,X,LDA,WORK)
           QT=1.0D0/FLOAT(N)
           CALL  DSCAL1D(N,QT,X,LDA)
        ENDIF
#else
        IF(INV.LT.0)  THEN
           IP=-LOG2(N)
C  GET OLD FORMAT
           X(2)=X(N+1)
        ELSE
           IP=LOG2(N)
        ENDIF
        CALL  FFTR_D(X,IP)
        IF(INV.GT.0)  THEN
           X(N+1)=X(2)
           X(2)=0.0
           X(N+2)=0.0
        ENDIF
#endif
        END
