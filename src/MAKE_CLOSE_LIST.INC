
      INTERFACE 

      SUBROUTINE MAKE_CLOSE_LIST(NUMREF,LIMITRANGE,
     &                           REFDIR,EXPDIR,
     &                           RANGECOS, CKMIRROR, 
     &                           LCGPOINTER, IEND, IRTFLG)

      INTEGER, INTENT(IN)    :: NUMREF 
      LOGICAL, INTENT(IN)    :: LIMITRANGE
      REAL,    INTENT(IN)    :: REFDIR(3,NUMREF), EXPDIR(3)
      REAL,    INTENT(IN)    :: RANGECOS
      LOGICAL, INTENT(IN)    :: CKMIRROR
      INTEGER, POINTER       :: LCGPOINTER(:)
      INTEGER, INTENT(OUT)   :: IEND, IRTFLG

      !TYPE INTEGER_POINTER
      !   REAL,  POINTER     :: IPT(:)
      !END TYPE INTEGER_POINTER
      !TYPE(INTEGER_POINTER) :: LCGPOINTER(NUMREF)

      END SUBROUTINE MAKE_CLOSE_LIST

      END INTERFACE 
       











