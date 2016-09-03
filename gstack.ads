GENERIC
   Max : Integer; --size of stack
   TYPE Item IS PRIVATE; --type of stack
   PACKAGE Gstack IS
      PROCEDURE Push(X : IN Item);
      PROCEDURE Pop(X : OUT Item);
      FUNCTION Empty RETURN Boolean;
      FUNCTION Full RETURN Boolean;
      FUNCTION Getmax RETURN Integer;
   END Gstack;

