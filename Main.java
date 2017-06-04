import java.io.*;
import java.util.*;

public class Main {
List<String> words = new ArrayList<String>();
List<String> line = new ArrayList<String>();
boolean PR = false;
	public static void main(String[] args) throws FileNotFoundException, IOException {
			BufferedReader br = new BufferedReader(new FileReader(args[1]));

			tester t = new tester(br);
			t.yylex();

			
 			
 			
 	}
 	public void sym(LexicalUnit a, String b){
 		Symbol s = new Symbol(a,b);
 		System.out.println(s.toString());
 	}
	
	}
       	 
        
    
