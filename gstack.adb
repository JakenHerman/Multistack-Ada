PACKAGE BODY Gstack IS
   S : ARRAY(1..Max) OF Item;
   Top : Integer RANGE 0..Max;

   PROCEDURE Push(X : IN Item) IS BEGIN
      Top := Top + 1; S(Top) := X;
   END Push;

   PROCEDURE Pop(X : OUT Item) IS BEGIN
      if Empty then
         x := S(Top);
      else
         X := S(Top); Top := Top - 1;
      end if;
   END Pop;

   FUNCTION Empty RETURN Boolean IS BEGIN
      IF Top = 0 THEN
         RETURN True;
      END IF;

      RETURN False;
   END Empty;

   FUNCTION Full RETURN Boolean IS BEGIN
      IF Top /= Max THEN
         RETURN False;
      END IF;

      RETURN True;
   END Full;

   FUNCTION Getmax RETURN Integer IS BEGIN
      RETURN Max;
   END Getmax;

BEGIN
   Top := 0; --initialize empty stack
END Gstack;

