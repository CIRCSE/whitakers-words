-- WORDS, a Latin dictionary, by Colonel William Whitaker (USAF, Retired)
--
-- Copyright William A. Whitaker (1936–2010)
--
-- This is a free program, which means it is proper to copy it and pass
-- it on to your friends. Consider it a developmental item for which
-- there is no charge. However, just for form, it is Copyrighted
-- (c). Permission is hereby freely given for any and all use of program
-- and data. You can sell it as your own, but at least tell me.
--
-- This version is distributed without obligation, but the developer
-- would appreciate comments and suggestions.
--
-- All parts of the WORDS system, source code and data files, are made freely
-- available to anyone who wishes to use them, for whatever purpose.

with Latin_Utils.Latin_File_Names; use Latin_Utils.Latin_File_Names;
with Latin_Utils.Preface;
package body Latin_Utils.Inflections_Package is

   ---------------------------------------------------------------------------

   function "<" (Left, Right : Decn_Record) return Boolean is
   begin
      if Left.Which < Right.Which  or else
        (Left.Which = Right.Which  and then
        Left.Var < Right.Var)
      then
         return True;
      else
         return False;
      end if;
   end "<";

   ---------------------------------------------------------------------------

   function "<" (Left, Right : Quality_Record) return Boolean is
   begin
      if Left.Pofs = Right.Pofs  then
         case Left.Pofs is
            when N =>
               if Left.N.Decl.Which < Right.N.Decl.Which  or else
                 (Left.N.Decl.Which = Right.N.Decl.Which  and then
                 Left.N.Decl.Var < Right.N.Decl.Var)  or else
                 (Left.N.Decl.Which = Right.N.Decl.Which  and then
                 Left.N.Decl.Var = Right.N.Decl.Var  and then
                 Left.N.Number < Right.N.Number) or else
                 (Left.N.Decl.Which = Right.N.Decl.Which  and then
                 Left.N.Decl.Var = Right.N.Decl.Var  and then
                 Left.N.Number = Right.N.Number and then
                 Left.N.Of_Case < Right.N.Of_Case) or else
                 (Left.N.Decl.Which = Right.N.Decl.Which  and then
                 Left.N.Decl.Var = Right.N.Decl.Var  and then
                 Left.N.Number = Right.N.Number and then
                 Left.N.Of_Case = Right.N.Of_Case and then
                 Left.N.Gender < Right.N.Gender)
               then
                  return True;
               end if;
            when Pron =>
               if Left.Pron.Decl.Which < Right.Pron.Decl.Which  or else
                 (Left.Pron.Decl.Which = Right.Pron.Decl.Which  and then
                 Left.Pron.Decl.Var < Right.Pron.Decl.Var)  or else
                 (Left.Pron.Decl.Which = Right.Pron.Decl.Which  and then
                 Left.Pron.Decl.Var = Right.Pron.Decl.Var  and then
                 Left.Pron.Number < Right.Pron.Number) or else
                 (Left.Pron.Decl.Which = Right.Pron.Decl.Which  and then
                 Left.Pron.Decl.Var = Right.Pron.Decl.Var  and then
                 Left.Pron.Number = Right.Pron.Number and then
                 Left.Pron.Of_Case < Right.Pron.Of_Case) or else
                 (Left.Pron.Decl.Which = Right.Pron.Decl.Which  and then
                 Left.Pron.Decl.Var = Right.Pron.Decl.Var  and then
                 Left.Pron.Number = Right.Pron.Number and then
                 Left.Pron.Of_Case = Right.Pron.Of_Case and then
                 Left.Pron.Gender < Right.Pron.Gender)
               then
                  return True;
               end if;
            when Pack =>
               if Left.Pack.Decl.Which < Right.Pack.Decl.Which  or else
                 (Left.Pack.Decl.Which = Right.Pack.Decl.Which  and then
                 Left.Pack.Decl.Var < Right.Pack.Decl.Var)  or else
                 (Left.Pack.Decl.Which = Right.Pack.Decl.Which  and then
                 Left.Pack.Decl.Var = Right.Pack.Decl.Var  and then
                 Left.Pack.Number < Right.Pack.Number) or else
                 (Left.Pack.Decl.Which = Right.Pack.Decl.Which  and then
                 Left.Pack.Decl.Var = Right.Pack.Decl.Var  and then
                 Left.Pack.Number = Right.Pack.Number and then
                 Left.Pack.Of_Case < Right.Pack.Of_Case) or else
                 (Left.Pack.Decl.Which = Right.Pack.Decl.Which  and then
                 Left.Pack.Decl.Var = Right.Pack.Decl.Var  and then
                 Left.Pack.Number = Right.Pack.Number and then
                 Left.Pack.Of_Case = Right.Pack.Of_Case and then
                 Left.Pack.Gender < Right.Pack.Gender)
               then
                  return True;
               end if;
            when Adj =>
               if Left.Adj.Decl.Which < Right.Adj.Decl.Which  or else
                 (Left.Adj.Decl.Which = Right.Adj.Decl.Which  and then
                 Left.Adj.Decl.Var < Right.Adj.Decl.Var)  or else
                 (Left.Adj.Decl.Which = Right.Adj.Decl.Which  and then
                 Left.Adj.Decl.Var = Right.Adj.Decl.Var  and then
                 Left.Adj.Number < Right.Adj.Number) or else
                 (Left.Adj.Decl.Which = Right.Adj.Decl.Which  and then
                 Left.Adj.Decl.Var = Right.Adj.Decl.Var  and then
                 Left.Adj.Number = Right.Adj.Number and then
                 Left.Adj.Of_Case < Right.Adj.Of_Case) or else
                 (Left.Adj.Decl.Which = Right.Adj.Decl.Which  and then
                 Left.Adj.Decl.Var = Right.Adj.Decl.Var  and then
                 Left.Adj.Number = Right.Adj.Number and then
                 Left.Adj.Of_Case = Right.Adj.Of_Case and then
                 Left.Adj.Gender < Right.Adj.Gender)  or else
                 (Left.Adj.Decl.Which = Right.Adj.Decl.Which  and then
                 Left.Adj.Decl.Var = Right.Adj.Decl.Var  and then
                 Left.Adj.Number = Right.Adj.Number and then
                 Left.Adj.Of_Case = Right.Adj.Of_Case and then
                 Left.Adj.Gender = Right.Adj.Gender  and then
                 Left.Adj.Comparison < Right.Adj.Comparison)
               then
                  return True;
               end if;
            when Adv =>
               return Left.Adv.Comparison < Right.Adv.Comparison;
            when V =>
               if (Left.V.Con.Which < Right.V.Con.Which)  or else
                 (Left.V.Con.Which = Right.V.Con.Which  and then
                 Left.V.Con.Var < Right.V.Con.Var)  or else
                 (Left.V.Con.Which = Right.V.Con.Which  and then
                 Left.V.Con.Var = Right.V.Con.Var  and then
                 Left.V.Number < Right.V.Number) or else
                 (Left.V.Con.Which = Right.V.Con.Which  and then
                    Left.V.Con.Var = Right.V.Con.Var  and then
                    Left.V.Number = Right.V.Number and then
                    Left.V.Tense_Voice_Mood.Tense <
                    Right.V.Tense_Voice_Mood.Tense) or else
                 (Left.V.Con.Which = Right.V.Con.Which  and then
                    Left.V.Con.Var = Right.V.Con.Var  and then
                    Left.V.Number = Right.V.Number and then
                    Left.V.Tense_Voice_Mood.Tense =
                    Right.V.Tense_Voice_Mood.Tense and then
                    Left.V.Tense_Voice_Mood.Voice <
                    Right.V.Tense_Voice_Mood.Voice) or else
                 (Left.V.Con.Which = Right.V.Con.Which  and then
                    Left.V.Con.Var = Right.V.Con.Var  and then
                    Left.V.Number = Right.V.Number and then
                    Left.V.Tense_Voice_Mood.Tense =
                    Right.V.Tense_Voice_Mood.Tense and then
                    Left.V.Tense_Voice_Mood.Voice =
                    Right.V.Tense_Voice_Mood.Voice and then
                    Left.V.Tense_Voice_Mood.Mood <
                    Right.V.Tense_Voice_Mood.Mood)  or else
                 (Left.V.Con.Which = Right.V.Con.Which and then
                    Left.V.Con.Var = Right.V.Con.Var and then
                    Left.V.Number = Right.V.Number and then
                    Left.V.Tense_Voice_Mood.Tense =
                    Right.V.Tense_Voice_Mood.Tense and then
                    Left.V.Tense_Voice_Mood.Voice =
                    Right.V.Tense_Voice_Mood.Voice and then
                    Left.V.Tense_Voice_Mood.Mood  =
                    Right.V.Tense_Voice_Mood.Mood  and then
                    Left.V.Person < Right.V.Person)
               then
                  return True;
               end if;
            when Vpar =>
               if Left.Vpar.Con.Which < Right.Vpar.Con.Which  or else
                 (Left.Vpar.Con.Which = Right.Vpar.Con.Which  and then
                 Left.Vpar.Con.Var < Right.Vpar.Con.Var)  or else
                 (Left.Vpar.Con.Which = Right.Vpar.Con.Which  and then
                 Left.Vpar.Con.Var = Right.Vpar.Con.Var  and then
                 Left.Vpar.Number < Right.Vpar.Number) or else
                 (Left.Vpar.Con.Which = Right.Vpar.Con.Which  and then
                 Left.Vpar.Con.Var = Right.Vpar.Con.Var  and then
                 Left.Vpar.Number = Right.Vpar.Number and then
                 Left.Vpar.Of_Case < Right.Vpar.Of_Case) or else
                 (Left.Vpar.Con.Which = Right.Vpar.Con.Which  and then
                 Left.Vpar.Con.Var = Right.Vpar.Con.Var  and then
                 Left.Vpar.Number = Right.Vpar.Number and then
                 Left.Vpar.Of_Case = Right.Vpar.Of_Case and then
                 Left.Vpar.Gender < Right.Vpar.Gender)
               then
                  return True;
               end if;
            when Supine =>
               if Left.Supine.Con.Which < Right.Supine.Con.Which  or else
                 (Left.Supine.Con.Which = Right.Supine.Con.Which  and then
                 Left.Supine.Con.Var < Right.Supine.Con.Var)  or else
                 (Left.Supine.Con.Which = Right.Supine.Con.Which  and then
                 Left.Supine.Con.Var = Right.Supine.Con.Var  and then
                 Left.Supine.Number < Right.Supine.Number) or else
                 (Left.Supine.Con.Which = Right.Supine.Con.Which  and then
                 Left.Supine.Con.Var = Right.Supine.Con.Var  and then
                 Left.Supine.Number = Right.Supine.Number and then
                 Left.Supine.Of_Case < Right.Supine.Of_Case) or else
                 (Left.Supine.Con.Which = Right.Supine.Con.Which  and then
                 Left.Supine.Con.Var = Right.Supine.Con.Var  and then
                 Left.Supine.Number = Right.Supine.Number and then
                 Left.Supine.Of_Case = Right.Supine.Of_Case and then
                 Left.Supine.Gender < Right.Supine.Gender)
               then
                  return True;
               end if;
            when Prep =>
               return Left.Prep.Of_Case < Right.Prep.Of_Case;
            when Conj =>
               null;
            when Interj =>
               null;
            when Num =>
               if Left.Num.Decl.Which < Right.Num.Decl.Which  or else
                 (Left.Num.Decl.Which = Right.Num.Decl.Which  and then
                 Left.Num.Decl.Var < Right.Num.Decl.Var)  or else
                 (Left.Num.Decl.Which = Right.Num.Decl.Which  and then
                 Left.Num.Decl.Var = Right.Num.Decl.Var  and then
                 Left.Num.Number < Right.Num.Number) or else
                 (Left.Num.Decl.Which = Right.Num.Decl.Which  and then
                 Left.Num.Decl.Var = Right.Num.Decl.Var  and then
                 Left.Num.Number = Right.Num.Number and then
                 Left.Num.Of_Case < Right.Num.Of_Case) or else
                 (Left.Num.Decl.Which = Right.Num.Decl.Which  and then
                 Left.Num.Decl.Var = Right.Num.Decl.Var  and then
                 Left.Num.Number = Right.Num.Number and then
                 Left.Num.Of_Case = Right.Num.Of_Case and then
                 Left.Num.Gender < Right.Num.Gender)  or else
                 (Left.Num.Decl.Which = Right.Num.Decl.Which  and then
                 Left.Num.Decl.Var = Right.Num.Decl.Var  and then
                 Left.Num.Number = Right.Num.Number and then
                 Left.Num.Of_Case = Right.Num.Of_Case and then
                 Left.Num.Gender = Right.Num.Gender  and then
                 Left.Num.Sort < Right.Num.Sort)
               then
                  return True;
               end if;
            when Tackon .. Suffix =>
               null;
            when X =>
               null;
         end case;
      else
         return Left.Pofs < Right.Pofs;
      end if;
      return False;
   exception
      when Constraint_Error  =>
         return Left.Pofs < Right.Pofs;
   end "<";

   overriding function "<="
     (Left, Right : Part_Of_Speech_Type)
     return Boolean is
   begin
      if Right = Left  or else
        (Left = Pack and Right = Pron)  or else
        Right = X
      then
         return True;
      else
         return False;
      end if;
   end "<=";

   function "<="
     (Left, Right : Decn_Record)
     return Boolean is
   begin
      if Right = Left  or else
        (Right = Decn_Record'(0, 0)  and Left.Which /= 9)  or else
        Right = Decn_Record'(Left.Which, 0)
      then
         return True;
      else
         return False;
      end if;
   end "<=";

   overriding function "<="
     (Left, Right : Gender_Type)
     return Boolean is
   begin
      if Right = Left  or else
        Right = X     or else
        (Right = C  and then (Left = M or Left = F))
      then
         return True;
      else
         return False;
      end if;
   end "<=";

   overriding function "<="
     (Left, Right : Case_Type)
     return Boolean is
   begin
      if Right = Left or else Right = X then
         return True;
      else
         return False;
      end if;
   end "<=";

   overriding function "<="
     (Left, Right : Number_Type)
     return Boolean is
   begin
      if Right = Left or else Right = X then
         return True;
      else
         return False;
      end if;
   end "<=";

   overriding function "<=" (Left, Right : Person_Type) return Boolean is
   begin
      if Right = Left or else Right = 0 then
         return True;
      else
         return False;
      end if;
   end "<=";

   overriding function "<=" (Left, Right : Comparison_Type) return Boolean is
   begin
      if Right = Left or else Right = X then
         return True;
      else
         return False;
      end if;
   end "<=";

   function "<=" (Left, Right : Tense_Voice_Mood_Record)  return Boolean is
   begin
      if (Right.Tense = Left.Tense or else Right.Tense = X) and then
         (Right.Voice = Left.Voice or else Right.Voice = X) and then
         (Right.Mood = Left.Mood or else Right.Mood = X)
      then
         return True;
      else
         return False;
      end if;
   end "<=";

   overriding function "<=" (Left, Right : Noun_Kind_Type)   return Boolean is
   begin
      if Right = Left or else Right = X then
         return True;
      else
         return False;
      end if;
   end "<=";

   overriding function "<="
     (Left, Right : Pronoun_Kind_Type)
     return Boolean is
   begin
      if Right = Left or else Right = X then
         return True;
      else
         return False;
      end if;
   end "<=";

   overriding function "<=" (Left, Right : Stem_Key_Type)   return Boolean is
   begin            --  Only works for 2 stem parts, not verbs
      if Right = Left or else Right = 0 then
         return True;
      else
         return False;
      end if;
   end "<=";

   overriding function "<=" (Left, Right : Age_Type) return Boolean is
   begin
      if Right = Left or else Right = X then
         return True;
      else
         return False;
      end if;
   end "<=";

   overriding function "<=" (Left, Right : Frequency_Type) return Boolean is
   begin
      if Right = Left or else Right = X then
         return True;
      else
         return False;
      end if;
   end "<=";

   package body Stem_Type_IO is separate;

   package body Decn_Record_IO is separate;

   package body Tense_Voice_Mood_Record_IO is separate;

   package body Noun_Record_IO is separate;

   package body Pronoun_Record_IO is separate;

   package body Propack_Record_IO is separate;

   package body Adjective_Record_IO is separate;

   package body Numeral_Record_IO is separate;

   package body Adverb_Record_IO is separate;

   package body Verb_Record_IO is separate;

   package body Vpar_Record_IO is separate;

   package body Supine_Record_IO is separate;

   package body Preposition_Record_IO is separate;

   package body Conjunction_Record_IO is separate;

   package body Interjection_Record_IO is separate;

   package body Tackon_Record_IO is separate;

   package body Prefix_Record_IO is separate;

   package body Suffix_Record_IO is separate;

   package body Quality_Record_Io is
      use Part_Of_Speech_Type_IO;
      use Noun_Record_IO;
      use Pronoun_Record_IO;
      use Propack_Record_IO;
      use Adjective_Record_IO;
      use Numeral_Record_IO;
      use Adverb_Record_IO;
      use Verb_Record_IO;
      use Vpar_Record_IO;
      use Supine_Record_IO;
      use Preposition_Record_IO;
      use Conjunction_Record_IO;
      use Interjection_Record_IO;
      use Tackon_Record_IO;
      use Prefix_Record_IO;
      use Suffix_Record_IO;
      Spacer : Character := ' ';

      Noun  : Noun_Record;
      Pronoun : Pronoun_Record;
      Propack : Propack_Record;
      Adjective : Adjective_Record;
      Adverb : Adverb_Record;
      Verb : Verb_Record;
      Vparticiple : Vpar_Record;
      Supin : Supine_Record;
      Preposition : Preposition_Record;
      Conjunction : Conjunction_Record;
      Interjection : Interjection_Record;
      Numeral : Numeral_Record;
      Tackn : Tackon_Record;
      Prefx : Prefix_Record;
      Suffx : Suffix_Record;

      procedure Get (F : in File_Type; P : out Quality_Record) is
         Ps : Part_Of_Speech_Type := X;
      begin
         Get (F, Ps);
         Get (F, Spacer);
         case Ps is
            when N =>
               Get (F, Noun);
               P := (N, Noun);
            when Pron =>
               Get (F, Pronoun);
               P := (Pron, Pronoun);
            when Pack =>
               Get (F, Propack);
               P := (Pack, Propack);
            when Adj =>
               Get (F, Adjective);
               P := (Adj, Adjective);
            when Num =>
               Get (F, Numeral);
               P := (Num, Numeral);
            when Adv =>
               Get (F, Adverb);
               P := (Adv, Adverb);
            when V =>
               Get (F, Verb);
               P := (V, Verb);
            when Vpar =>
               Get (F, Vparticiple);
               P := (Vpar, Vparticiple);
            when Supine =>
               Get (F, Supin);
               P := (Supine, Supin);
            when Prep =>
               Get (F, Preposition);
               P := (Prep, Preposition);
            when Conj =>
               Get (F, Conjunction);
               P := (Conj, Conjunction);
            when Interj =>
               Get (F, Interjection);
               P := (Interj, Interjection);
            when Tackon =>
               Get (F, Tackn);
               P := (Tackon, Tackn);
            when Prefix =>
               Get (F, Prefx);
               P := (Prefix, Prefx);
            when Suffix =>
               Get (F, Suffx);
               P := (Suffix, Suffx);
            when X =>
               P := (Pofs => X);
         end case;
         return;
      end Get;

      procedure Get (P : out Quality_Record) is
         Ps : Part_Of_Speech_Type := X;
      begin
         Get (Ps);
         Get (Spacer);
         case Ps is
            when N =>
               Get (Noun);
               P := (N, Noun);
            when Pron =>
               Get (Pronoun);
               P := (Pron, Pronoun);
            when Pack =>
               Get (Propack);
               P := (Pack, Propack);
            when Adj =>
               Get (Adjective);
               P := (Adj, Adjective);
            when Num =>
               Get (Numeral);
               P := (Num, Numeral);
            when Adv =>
               Get (Adverb);
               P := (Adv, Adverb);
            when V =>
               Get (Verb);
               P := (V, Verb);
            when Vpar =>
               Get (Vparticiple);
               P := (Vpar, Vparticiple);
            when Supine =>
               Get (Supin);
               P := (Supine, Supin);
            when Prep =>
               Get (Preposition);
               P := (Prep, Preposition);
            when Conj =>
               Get (Conjunction);
               P := (Conj, Conjunction);
            when Interj =>
               Get (Interjection);
               P := (Interj, Interjection);
            when Tackon =>
               Get (Tackn);
               P := (Tackon, Tackn);
            when Prefix =>
               Get (Prefx);
               P := (Prefix, Prefx);
            when Suffix =>
               Get (Suffx);
               P := (Suffix, Suffx);
            when X =>
               P := (Pofs => X);
         end case;
         return;
      end Get;

      procedure Put (F : in File_Type; P : in Quality_Record) is
         C : constant Positive := Positive (Col (F));
      begin
         Put (F, P.Pofs);
         Put (F, ' ');
         case P.Pofs is
            when N =>
               Put (F, P.N);
            when Pron =>
               Put (F, P.Pron);
            when Pack =>
               Put (F, P.Pack);
            when Adj =>
               Put (F, P.Adj);
            when Num =>
               Put (F, P.Num);
            when Adv =>
               Put (F, P.Adv);
            when V =>
               Put (F, P.V);
            when Vpar =>
               Put (F, P.Vpar);
            when Supine =>
               Put (F, P.Supine);
            when Prep =>
               Put (F, P.Prep);
            when Conj =>
               Put (F, P.Conj);
            when Interj =>
               Put (F, P.Interj);
            when Tackon =>
               Put (F, P.Tackon);
            when Prefix =>
               Put (F, P.Prefix);
            when Suffix =>
               Put (F, P.Suffix);
            when others =>
               null;
         end case;
         Put (F, String'((
           Integer (Col (F)) .. Quality_Record_Io.Default_Width + C - 1
           => ' ')));
         return;
      end Put;

      procedure Put (P : in Quality_Record) is
         C : constant Positive := Positive (Col);
      begin
         Put (P.Pofs);
         Put (' ');
         case P.Pofs is
            when N =>
               Put (P.N);
            when Pron =>
               Put (P.Pron);
            when Pack =>
               Put (P.Pack);
            when Adj =>
               Put (P.Adj);
            when Num =>
               Put (P.Num);
            when Adv =>
               Put (P.Adv);
            when V =>
               Put (P.V);
            when Vpar =>
               Put (P.Vpar);
            when Supine =>
               Put (P.Supine);
            when Prep =>
               Put (P.Prep);
            when Conj =>
               Put (P.Conj);
            when Interj =>
               Put (P.Interj);
            when Tackon =>
               Put (P.Tackon);
            when Prefix =>
               Put (P.Prefix);
            when Suffix =>
               Put (P.Suffix);
            when others =>
               null;
         end case;
         Put (String'((
           Integer (Col) .. Quality_Record_Io.Default_Width + C - 1 => ' ')));
         return;
      end Put;

      procedure Get
        (S : in String;
         P : out Quality_Record;
         Last : out Integer)
      is
         L : Integer := S'First - 1;
         Ps : Part_Of_Speech_Type := X;
      begin
         Get (S, Ps, L);
         Last := L;         --  In case it is not set later
         case Ps is
            when N =>
               Get (S (L + 1 .. S'Last), Noun, Last);
               P := (N, Noun);
            when Pron =>
               Get (S (L + 1 .. S'Last), Pronoun, Last);
               P := (Pron, Pronoun);
            when Pack =>
               Get (S (L + 1 .. S'Last), Propack, Last);
               P := (Pack, Propack);
            when Adj =>
               Get (S (L + 1 .. S'Last), Adjective, Last);
               P := (Adj, Adjective);
            when Num =>
               Get (S (L + 1 .. S'Last), Numeral, Last);
               P := (Num, Numeral);
            when Adv =>
               Get (S (L + 1 .. S'Last), Adverb, Last);
               P := (Adv, Adverb);
            when V =>
               Get (S (L + 1 .. S'Last), Verb, Last);
               P := (V, Verb);
            when Vpar =>
               Get (S (L + 1 .. S'Last), Vparticiple, Last);
               P := (Vpar, Vparticiple);
            when Supine =>
               Get (S (L + 1 .. S'Last), Supin, Last);
               P := (Supine, Supin);
            when Prep =>
               Get (S (L + 1 .. S'Last), Preposition, Last);
               P := (Prep, Preposition);
            when Conj =>
               Get (S (L + 1 .. S'Last), Conjunction, Last);
               P := (Conj, Conjunction);
            when Interj =>
               Get (S (L + 1 .. S'Last), Interjection, Last);
               P := (Interj, Interjection);
            when Tackon =>
               Get (S (L + 1 .. S'Last), Tackn, Last);
               P := (Tackon, Tackn);
            when Prefix =>
               Get (S (L + 1 .. S'Last), Prefx, Last);
               P := (Prefix, Prefx);
            when Suffix =>
               Get (S (L + 1 .. S'Last), Suffx, Last);
               P := (Suffix, Suffx);
            when X =>
               P := (Pofs => X);
         end case;
         return;
      end Get;

      procedure Put (S : out String; P : in Quality_Record) is
         --  Note that this does not Put with a uniform width
         --  which would require a constant QUALITY_RECORD_IO.DEFAULT_WIDTH
         --  Rather we Put to minimal size with NOUN_RECORD_IO.DEFAULT_WIDTH,
         --  PRONOUN_RECORD_IO,DEFAULT_WIDTH, . ..
         L : Integer := S'First - 1;
         M : Integer := 0;
      begin
         M := L + Part_Of_Speech_Type_IO.Default_Width;
         Put (S (L + 1 .. M), P.Pofs);
         L := M + 1;
         S (L) :=  ' ';
         case P.Pofs is
            when N =>
               M := L + Noun_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.N);
            when Pron =>
               M := L + Pronoun_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Pron);
            when Pack =>
               M := L + Propack_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Pack);
            when Adj =>
               M := L + Adjective_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Adj);
            when Num =>
               M := L + Numeral_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Num);
            when Adv =>
               M := L + Adverb_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Adv);
            when V =>
               M := L + Verb_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.V);
            when Vpar =>
               M := L + Vpar_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Vpar);
            when Supine =>
               M := L + Supine_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Supine);
            when Prep =>
               M := L + Preposition_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Prep);
            when Conj =>
               M := L + Conjunction_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Conj);
            when Interj =>
               M := L + Interjection_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Interj);
            when Tackon =>
               M := L + Tackon_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Tackon);
            when Prefix =>
               M := L + Prefix_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Prefix);
            when Suffix =>
               M := L + Suffix_Record_IO.Default_Width;
               Put (S (L + 1 .. M), P.Suffix);
            when others =>
               null;
         end case;
         S (M + 1 .. S'Last) := (others => ' ');
      end Put;

   end Quality_Record_Io;

   package body Ending_Record_Io is
      use Integer_IO;
      Spacer : Character := ' ';

      Sf : Ending := (others => ' ');
      Blanks : constant Ending := (others => ' ');
      N : Ending_Size_Type := 0;

      procedure Get (F : in File_Type; X : out Ending_Record) is
      begin
         Sf := Blanks;
         Get (F, N);
         if N = 0  then
            X := Null_Ending_Record;
         else
            Get (F, Spacer);             --  Note this means exactly one blank
            Get (F, Sf (1 .. N));
            X := (N, Sf);
         end if;
      end Get;

      procedure Get (X : out Ending_Record) is
      begin
         Sf := Blanks;
         Get (N);
         if N = 0  then
            X := Null_Ending_Record;
         else
            Get (Spacer);
            Get (Sf (1 .. N));
            X := (N, Sf);
         end if;
      end Get;

      procedure Put (F : in File_Type; X : in Ending_Record) is
      begin
         Put (F, X.Size, 1);
         Put (F, ' ');
         Put (F, X.Suf (1 .. X.Size) & Blanks (X.Size + 1 .. Max_Ending_Size));
      end Put;

      procedure Put (X : in Ending_Record) is
      begin
         Put (X.Size, 1);
         Put (' ');
         Put (X.Suf (1 .. X.Size) & Blanks (X.Size + 1 .. Max_Ending_Size));
      end Put;

      procedure Get
        (S : in String;
         X : out Ending_Record;
         Last : out Integer)
      is
         L : Integer := S'First - 1;
      begin
         Sf := Blanks;
         Get (S (L + 1 .. S'Last), N, L);
         if N = 0  then
            X := Null_Ending_Record;
            Last := L;
         else
            L := L + 1;
            --if S (L+N - 1) = ' '  or else
            --   S (L+N + 1) /= ' '  then
            --if
            --   S (L+N + 1) /= ' '  then
            -- TEXT_IO.PUT_LINE ("ERROR in INFLECTION =>" & S);
            --else
            Sf := S (L + 1 .. L + N) & Blanks (N + 1 .. Max_Ending_Size);
            Last := L + N;
            X := (N, Sf (1 .. N) & Blanks (N + 1 .. Max_Ending_Size));
            --end if;
         end if;
      exception
         when others =>
            Ada.Text_IO.Put_Line ("ENDING ERROR " & S);
            raise;
      end Get;

      procedure Put (S : out String; X : in Ending_Record) is
         L : Integer := S'First - 1;
         M : Integer := 0;
      begin
         M := L + 2;
         Put (S (L + 1 .. M), X.Size);
         M := M  + 1;
         S (M) := ' ';
         if X.Size > 0  then
            L := M;
            M := L + X.Size;
            S (L + 1 .. M) := X.Suf (1 .. X.Size);
         end if;
         --  Being very careful here, first to fill out to the MAX_ENDING_SIZE
         L := M;
         M := L + Max_Ending_Size - X.Size;
         S (L + 1 .. M) := (others => ' ');
         --  Then to fill out the rest of the out String, if any
         S (M + 1 .. S'Last) := (others => ' ');
      end Put;

   end Ending_Record_Io;

   package body Inflection_Record_IO is
      use Quality_Record_Io;
      use Stem_Key_Type_IO;
      use Ending_Record_Io;
      use Age_Type_IO;
      use Frequency_Type_IO;
      Spacer : Character := ' ';

      Pe : Inflection_Record;

      procedure Get (F : in File_Type; P : out Inflection_Record) is
      begin
         Get (F, P.Qual);
         Get (F, Spacer);
         Get (F, P.Key);
         Get (F, Spacer);
         Get (F, P.Ending);
         Get (F, Spacer);
         Get (F, P.Age);
         Get (F, Spacer);
         Get (F, P.Freq);
      end Get;

      procedure Get (P : out Inflection_Record) is
      begin
         Get (P.Qual);
         Get (Spacer);
         Get (P.Key);
         Get (Spacer);
         Get (P.Ending);
         Get (Spacer);
         Get (P.Age);
         Get (Spacer);
         Get (P.Freq);
      end Get;

      procedure Put (F : in File_Type; P : in Inflection_Record) is
      begin
         Put (F, P.Qual);
         Put (F, ' ');
         Put (F, P.Key, 1);
         Put (F, ' ');
         Put (F, P.Ending);
         Put (F, ' ');
         Put (F, P.Age);
         Put (F, ' ');
         Put (F, P.Freq);
      end Put;

      procedure Put (P : in Inflection_Record) is
      begin
         Put (P.Qual);
         Put (' ');
         Put (P.Key, 1);
         Put (' ');
         Put (P.Ending);
         Put (' ');
         Put (P.Age);
         Put (' ');
         Put (P.Freq);
      end Put;

      procedure Get
        (S    : in String;
         P    : out Inflection_Record;
         Last : out Integer)
      is
         L : Integer := S'First - 1;
      begin
         Last := 0;
         P := Pe;
         Get (S (L + 1 .. S'Last), P.Qual, L);
         L := L + 1;
         Get (S (L + 1 .. S'Last), P.Key, L);
         L := L + 1;
         Get (S (L + 1 .. S'Last), P.Ending, L);
         L := L + 1;
         Get (S (L + 1 .. S'Last), P.Age, L);
         L := L + 1;
         Get (S (L + 1 .. S'Last), P.Freq, Last);
      end Get;

      procedure Put (S : out String; P : in Inflection_Record) is
         L : Integer := S'First - 1;
         M : Integer := 0;
      begin
         M := L + Quality_Record_Io.Default_Width;
         Put (S (L + 1 .. M), P.Qual);
         L := M + 1;
         S (L) :=  ' ';
         M := L + 1;
         Put (S (L + 1 .. M), P.Key);
         L := M + 1;
         S (L) :=  ' ';
         M := L + Ending_Record_Io.Default_Width;
         Put (S (L + 1 .. M), P.Ending);
         L := M + 1;
         S (L) :=  ' ';
         M := L + 1;
         Put (S (L + 1 .. M), P.Age);
         L := M + 1;
         S (L) :=  ' ';
         M := L + 1;
         Put (S (L + 1 .. M), P.Freq);
         S (M + 1 .. S'Last) := (others => ' ');
      end Put;

   end Inflection_Record_IO;

   procedure Establish_Inflections_Section  is
      --  Loads the inflection array from the file prepared in
      --  FILE_INFLECTIONS_SECTION
      --  If N = 0 (an artifical flag for the section for blank
      --  inflections = 5)
      --  computes the LELL .. LELF indices for use in WORD
      use Inflection_Record_IO;
      use Lel_Section_Io;

      procedure Load_Lel_Indexes is
         --  Load arrays from file
         I  : Integer := 0;
         --IR : INFLECTION_RECORD;
         N, Xn : Integer := 0;
         Ch, Xch : Character := ' ';
         Inflections_Sections_File : Lel_Section_Io.File_Type;

         -- FIXME: this algebraic type and its values are obviously misnomers
         type Paradigm is (P1, P2, P3, P4);

         function Section_Count (P : Paradigm) return Integer
         is
         begin
            case P is
               when P1 => return 1;
               when P2 => return 2;
               when P3 => return 3;
               when P4 => return 4;
            end case;
         end Section_Count;

         procedure Read_Inflections (P : Paradigm)
         is
            Count : constant Integer := Section_Count (P);
         begin
            Lel_Section_Io.Read (Inflections_Sections_File,
              Lel,
              Lel_Section_Io.Positive_Count (Count));

            I := 1;

            N := Lel (I).Ending.Size;

            Ch := Lel (I).Ending.Suf (N);

            Xn := N;
            Xch := Ch;
            Lelf (N, Ch) := I;

            C1_Loop :
            loop
               N1_Loop :
               loop
                  case P is
                     when P1 | P2 | P3 =>
                        exit C1_Loop when Lel (I) = Null_Inflection_Record;
                     when P4 =>
                        exit C1_Loop when  Lel (I).Qual.Pofs = Pron  and then
                          (Lel (I).Qual.Pron.Decl.Which = 1  or
                          Lel (I).Qual.Pron.Decl.Which = 2);
                  end case;

                  N := Lel (I).Ending.Size;

                  Ch := Lel (I).Ending.Suf (N);

                  case P is
                     when P1 | P4 =>
                        null;
                     when P2 =>
                        exit N1_Loop when Ch > 'r';
                     when P3 =>
                        exit N1_Loop when Ch > 's';
                  end case;

                  if Ch /= Xch  then
                     Lell (Xn, Xch) := I - 1;
                     Lelf (N, Ch) := I;
                     Lell (N, Ch) := 0;
                     Xch := Ch;
                     Xn := N;
                  elsif N /= Xn  then
                     Lell (Xn, Ch) := I - 1;
                     Lelf (N, Ch) := I;
                     Lell (N, Ch) := 0;
                     Xn := N;
                     exit N1_Loop;
                  end if;

                  I := I + 1;

               end loop N1_Loop;

            end loop C1_Loop;

            Lell (Xn, Xch) := I - 1;

         end Read_Inflections;

      begin
         Open (Inflections_Sections_File, In_File, Inflections_Sections_Name);
         Number_Of_Inflections := 0;

         Lel_Section_Io.Read (Inflections_Sections_File,
           Lel,
           Lel_Section_Io.Positive_Count (5));

         I := 1;
         Belf (0, ' ') := I;
         Bell (0, ' ') := 0;
         loop
            exit when Lel (I) = Null_Inflection_Record;
            Bel (I) := Lel (I);

            Bell (0, ' ') := I;
            I := I + 1;
         end loop;

         -- FIXME: deduplicat the ten lines below, and the following block
         Number_Of_Inflections := Number_Of_Inflections + I - 1;

         Read_Inflections (P1);
         Number_Of_Inflections := Number_Of_Inflections + I - 1;

         Read_Inflections (P2);
         Number_Of_Inflections := Number_Of_Inflections + I - 1;

         Read_Inflections (P3);
         Number_Of_Inflections := Number_Of_Inflections + I - 1;

         Read_Inflections (P4);

         begin

            N := Lel (I).Ending.Size;

            Ch := Lel (I).Ending.Suf (N);

            Xn := N;
            Xch := Ch;
            Pelf (N,  Ch) := I;
            Pell (N,  Ch) := 0;

            C_P_Loop :
            loop
               N_P_Loop :
               loop
                  exit C_P_Loop when Lel (I) = Null_Inflection_Record;

                  N := Lel (I).Ending.Size;

                  Ch := Lel (I).Ending.Suf (N);

                  if Ch /= Xch  then
                     Pell (Xn, Xch) := I - 1;
                     Pelf (N, Ch) := I;
                     Pell (N, Ch) := 0;
                     Xch := Ch;
                     Xn := N;
                  elsif N /= Xn  then
                     Pell (Xn, Ch) := I - 1;
                     Pelf (N, Ch) := I;
                     Pell (N, Ch) := 0;
                     Xn  := N;
                     exit N_P_Loop;
                  end if;

                  I := I + 1;
               end loop N_P_Loop;
            end loop C_P_Loop;
         exception
            when Constraint_Error => null;
         end;

         Pell (Xn, Xch) := I - 1;
         Number_Of_Inflections := Number_Of_Inflections + I - 1;
         Close (Inflections_Sections_File);
      end Load_Lel_Indexes;

   begin
      Preface.Put ("INFLECTION_ARRAY being loaded");
      Preface.Set_Col (33);
      Preface.Put ("--  ");
      Load_Lel_Indexes;                    --  Makes indexes from array
      Preface.Put (Number_Of_Inflections, 6);
      Preface.Put (" entries");
      Preface.Set_Col (55); Preface.Put_Line ("--  Loaded correctly");
   exception
      when Ada.Text_IO.Name_Error  =>
         New_Line;
         Put_Line ("There is no " & Inflections_Sections_Name & " file.");
         Put_Line ("The program cannot work without one.");
         Put_Line ("Make sure you are in the"
           & " subdirectory containing the files");
         Put_Line ("for inflections, dictionary, addons and uniques.");
         raise Give_Up;
   end Establish_Inflections_Section;

begin
   --  initialization of body of INFLECTIONS_PACKAGE
   --TEXT_IO.PUT_LINE ("Initializing INFLECTIONS_PACKAGE");

   Part_Of_Speech_Type_IO.Default_Width := Part_Of_Speech_Type'Width;
   Gender_Type_IO.Default_Width := Gender_Type'Width;
   Case_Type_IO.Default_Width := Case_Type'Width;
   Number_Type_IO.Default_Width := Number_Type'Width;
   Person_Type_IO.Default_Width := 1;
   Comparison_Type_IO.Default_Width := Comparison_Type'Width;
   Tense_Type_IO.Default_Width := Tense_Type'Width;
   Voice_Type_IO.Default_Width := Voice_Type'Width;
   Mood_Type_IO.Default_Width := Mood_Type'Width;
   Noun_Kind_Type_IO.Default_Width := Noun_Kind_Type'Width;
   Pronoun_Kind_Type_IO.Default_Width := Pronoun_Kind_Type'Width;
   Verb_Kind_Type_IO.Default_Width := Verb_Kind_Type'Width;
   Numeral_Sort_Type_IO.Default_Width := Numeral_Sort_Type'Width;
   Age_Type_IO.Default_Width := Age_Type'Width;
   Frequency_Type_IO.Default_Width := Frequency_Type'Width;

   Decn_Record_IO.Default_Width :=
     1 + 1 +   --WHICH_TYPE_IO_DEFAULT_WIDTH + 1 +
     1;        --VARIANT_TYPE_IO_DEFAULT_WIDTH;
   Tense_Voice_Mood_Record_IO.Default_Width :=
     Tense_Type_IO.Default_Width + 1 +
     Voice_Type_IO.Default_Width + 1 +
     Mood_Type_IO.Default_Width;

   Noun_Record_IO.Default_Width :=
     Decn_Record_IO.Default_Width + 1 +
     Case_Type_IO.Default_Width + 1 +
     Number_Type_IO.Default_Width + 1 +
     Gender_Type_IO.Default_Width;

   Pronoun_Record_IO.Default_Width :=
     Decn_Record_IO.Default_Width + 1 +
     Case_Type_IO.Default_Width + 1 +
     Number_Type_IO.Default_Width + 1 +
     Gender_Type_IO.Default_Width;

   Propack_Record_IO.Default_Width :=
     Decn_Record_IO.Default_Width + 1 +
     Case_Type_IO.Default_Width + 1 +
     Number_Type_IO.Default_Width + 1 +
     Gender_Type_IO.Default_Width;

   Adjective_Record_IO.Default_Width :=
     Decn_Record_IO.Default_Width + 1 +
     Case_Type_IO.Default_Width + 1 +
     Number_Type_IO.Default_Width + 1 +
     Gender_Type_IO.Default_Width + 1 +
     Comparison_Type_IO.Default_Width;

   Adverb_Record_IO.Default_Width :=
     Comparison_Type_IO.Default_Width;

   Verb_Record_IO.Default_Width :=
     Decn_Record_IO.Default_Width + 1 +
     Tense_Voice_Mood_Record_IO.Default_Width + 1 +
     Person_Type_IO.Default_Width + 1 +
     Number_Type_IO.Default_Width;

   Vpar_Record_IO.Default_Width :=
     Decn_Record_IO.Default_Width + 1 +
     Case_Type_IO.Default_Width + 1 +
     Number_Type_IO.Default_Width + 1 +
     Gender_Type_IO.Default_Width + 1 +
     Tense_Voice_Mood_Record_IO.Default_Width;

   Supine_Record_IO.Default_Width :=
     Decn_Record_IO.Default_Width + 1 +
     Case_Type_IO.Default_Width + 1 +
     Number_Type_IO.Default_Width + 1 +
     Gender_Type_IO.Default_Width;

   Preposition_Record_IO.Default_Width := Case_Type_IO.Default_Width;

   Conjunction_Record_IO.Default_Width := 0;

   Interjection_Record_IO.Default_Width := 0;

   Numeral_Record_IO.Default_Width :=
     Decn_Record_IO.Default_Width + 1 +
     Case_Type_IO.Default_Width + 1 +
     Number_Type_IO.Default_Width + 1 +
     Gender_Type_IO.Default_Width + 1 +
     Numeral_Sort_Type_IO.Default_Width;

   Tackon_Record_IO.Default_Width := 0;

   Prefix_Record_IO.Default_Width := 0;

   Suffix_Record_IO.Default_Width := 0;

   Quality_Record_Io.Default_Width := Part_Of_Speech_Type_IO.Default_Width + 1 +
     Vpar_Record_IO.Default_Width; --  Largest

   Ending_Record_Io.Default_Width := 3 + 1 +
     Max_Ending_Size;

   Inflection_Record_IO.Default_Width := Quality_Record_Io.Default_Width + 1 +
     1  + 1 +
     Ending_Record_Io.Default_Width + 1 +
     Age_Type_IO.Default_Width + 1 +
     Frequency_Type_IO.Default_Width;

end Latin_Utils.Inflections_Package;