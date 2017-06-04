import java.util.*;

%%


%class tester
%unicode
%line
%standalone

%{
Main m = new Main();
List<String> words = new ArrayList<String>();
List<String> line = new ArrayList<String>();
boolean PR = false;
public void program(boolean x){
         this.PR=x;

   }
   public void identifier(String x, int y) {
      
   if(PR == false){
   if(words.isEmpty()== true){
   words.add(x);
   line.add(x + " " +Integer.toString(y+1));
   }
   else { boolean t = true;
   for(int i = 0; i < words.size(); i++){
   if(x.equals(words.get(i)))
   t = false;
                           }
   if(t== true){ words.add(x);
              line.add(x + " " + Integer.toString(y+1));}                      

   }}
   else this.PR = false;


   }
   public void BinaryOP(String x){
   
    switch (x) {
            case ".AND.":
           m.sym(LexicalUnit.AND,x);
            
                     break;
            case ".OR.":
            m.sym(LexicalUnit.OR,x);
            
                     break;
            case ".EQ.": 
            m.sym(LexicalUnit.EQUAL_COMPARE,x);
            
                     break;
            case ".GE.":
            m.sym(LexicalUnit.GREATER_EQUAL,x);
            
                     break;
            case ".GT.":
            m.sym(LexicalUnit.GREATER,x);
            
                     break;
            case ".Le.":
            m.sym(LexicalUnit.SMALLER_EQUAL,x);
            
                     break;
            case ".LT.":
            m.sym(LexicalUnit.SMALLER,x);
            
                     break;
            case ".NE.":
            m.sym(LexicalUnit.DIFFERENT,x);
            
                     break;
            
        }}
    public void last(){
         System.out.println("Identifiers");
         Collections.sort(line);
     if(words != null){
    for(int i = 0; i< words.size(); i++){
      System.out.println(line.get(i));
         }
                              }
     else System.out.print("No Varnames");
      }

%}
%eof{
last();
%eof}

EndOfLine       = ("\r"?"\n")+
AlphaUpperCase	= [A-Z]
AlphaLowerCase	= [a-z]
Alpha			= {AlphaUpperCase}|{AlphaLowerCase}
IF   			= (if)|(IF)	
ENDIF			= (ENDIF)|(endif)
Plus			= "\+"
Integer         = [Ii][Nn][Tt][Ee][Gg][Ee][Rr]
AlphaNumeric	= {Alpha}|{Numeric}
Minus			= "\-"
Divide    		= "\/"
Multiply		= "\*"
Comma			= ","
Program         = (PROGRAM)|(program) 
Space			= "\t" | " "
BinaryOp        = "\."{Alpha}*"\."
Numeric			= ([1-9][0-9]*)|0
Identifier		= {Alpha}{AlphaNumeric}*
DO				= {Space}[Dd][Oo]
else			= (ELSE)|(else)
then		    = [Tt][Hh][Ee][Nn]
END 			= [Ee][Nn][Dd]
ENDDO           = (ENDDO)|(enddo)
Read			= (([R]|[r])([E]|[e])([A]|[a])([D]|[d]))[*]
Print			= (([P]|[p])([R]|[r])([I]|[i])([N]|[n])([T]|[t]))[*]
Comment         = [cC\*Dd\!].*{EndOfLine}

%%
^{DO}		   {m.sym(LexicalUnit.DO,yytext());}
{Space}        {}
{IF}	       {m.sym(LexicalUnit.IF,yytext());}
{ENDIF}		   {m.sym(LexicalUnit.ENDIF,yytext());}
^{Program}     {program(true);
				m.sym(LexicalUnit.PROGRAM,yytext());}

{then}		   {m.sym(LexicalUnit.THEN,yytext());}
{else}		   {m.sym(LexicalUnit.ELSE,yytext());}
{Read}         {m.sym(LexicalUnit.READ,yytext());}
{EndOfLine}    {m.sym(LexicalUnit.ENDLINE," ");}
{Integer}	   {m.sym(LexicalUnit.INTEGER,yytext());}
{Print}        {m.sym(LexicalUnit.NUMBER,yytext());}
"("			   {m.sym(LexicalUnit.LEFT_PARENTHESIS,yytext());}
")"			   {m.sym(LexicalUnit.RIGHT_PARENTHESIS,yytext());}
{BinaryOp}     {BinaryOP(yytext());}
{Numeric} 	   {m.sym(LexicalUnit.NUMBER,yytext());}
{END}		   {m.sym(LexicalUnit.END,yytext());}
{ENDDO}		   {m.sym(LexicalUnit.ENDDO,yytext());}

{Comma}        {m.sym(LexicalUnit.COMMA,yytext());}
"="			   {m.sym(LexicalUnit.EQUAL,yytext());}					
{Multiply}     {m.sym(LexicalUnit.TIMES,yytext());}
{Plus}		   {m.sym(LexicalUnit.PLUS,yytext());}
{Minus}		   {m.sym(LexicalUnit.MINUS,yytext());}
{Divide}	   {m.sym(LexicalUnit.DIVIDE,yytext());}
{Identifier} {identifier(yytext(),yyline);
				m.sym(LexicalUnit.VARNAME,yytext());}
^{Comment}      {}