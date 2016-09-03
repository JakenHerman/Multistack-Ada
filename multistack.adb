WITH Ada.Text_Io; USE Ada.Text_Io;
WITH Gstack;
PROCEDURE multistack IS
   PACKAGE Iio IS NEW Ada.Text_Io.Integer_Io(Integer); USE Iio;
   TYPE Month_Name IS (January, February, March, April, May, June, July, August,
                       September, October, November, December);

   Type StackType IS (Int, Str, Char, Day);

   Type Operation is (insert, i, push, quit, q, stop, pop, delete, rm, d, start);
   subtype pushops is Operation range insert..push;
   subtype quitops is Operation range quit..stop;
   subtype popops is Operation range pop..d;


   package month_io is new Ada.Text_IO.Enumeration_IO(Month_Name); use month_io;
   package stack_io is new Ada.Text_IO.Enumeration_IO(StackType); use stack_io;
   package op_io is new Ada.Text_IO.Enumeration_IO(Operation); use op_io;

   TYPE Date IS RECORD
      Month : Month_Name;
      Day : Integer RANGE 1..31;
      Year : Integer RANGE 1400..2020;
   END RECORD;

   PACKAGE Get_User_Specs IS
        function makestack return StackType;
    end get_user_specs;

     PACKAGE BODY Get_User_Specs IS
        Opcode : Operation := Start;

        function makestack return StackType is
           S_Type : StackType;
           IntPop : Integer;
           User_Day: Date;
        begin
            put("What is the stack type?"); new_line;
            get(s_type);
            if s_type = Int then
                declare
                 PACKAGE User_Stack IS NEW Gstack(100, Integer);
                 USE User_Stack;
              BEGIN
                 WHILE Opcode NOT IN Quitops LOOP
                    Put("What op? "); New_Line; Get(Opcode);
                    IF Opcode IN Pushops THEN
                        if user_stack.full then
                            put("stack full"); new_line;
                        else
                            User_Stack.Push(1);
                        end if;
                    ELSIF Opcode IN Popops THEN
                        if user_Stack.empty then
                            put("stack empty"); new_line;
                        else
                            User_Stack.Pop(IntPop); Put(IntPop); New_Line;
                        end if;
                    end if;
                 END LOOP;
              END;
            elsif s_type = Day then
                 declare
                 PACKAGE User_Stack IS NEW Gstack(100, Date);
                 USE User_Stack;
              BEGIN
                 WHILE Opcode NOT IN Quitops LOOP
                    Put("What op? "); New_Line; Get(Opcode);
                    IF Opcode IN Pushops THEN
                        if user_stack.full then
                            put("stack full");
                        else
                            User_Day.Month := January;
                            User_Day.Day := 1;
                            User_Day.Year := 2009;
                            User_Stack.Push(User_Day);
                        end if;
                    ELSIF Opcode IN Popops THEN
                        if user_stack.empty then
                            put("stack empty");
                        else
                            User_Stack.Pop(User_Day); Put(User_Day.Month);
                            put(User_day.Day); put(user_day.year); New_Line;
                        end if;
                    end if;
                 END LOOP; 
              END;
            else
                declare
                package user_stack is new gstack(100, Integer);
                begin null; end;
            end if;

            return s_type;
        end makestack;
    begin
        null;
    end get_user_specs;
   user_stack_type : StackType := get_user_specs.makestack;
BEGIN
   NULL;
END Multistack;


