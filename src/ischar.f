
C++*********************************************************************
C
C $$ ISCHAR.FOR -- CREATED AUG 89 al
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
C
C  $$ ISCHAR(TCHAR)
C
C     PURPOSE:   DETERMINES IF TCHAR IS A LETTER (A...Z)
C
C--*******************************************************************

      LOGICAL FUNCTION ISCHAR(TCHAR)

      CHARACTER TCHAR  

      IF ((TCHAR .GE. 'A' .AND. TCHAR .LE. 'Z')
     &    .OR.
     &     (TCHAR .GE. 'a' .AND. TCHAR .LE. 'z')) THEN
        ISCHAR = .TRUE.
      ELSE
        ISCHAR = .FALSE.
      ENDIF

      END

