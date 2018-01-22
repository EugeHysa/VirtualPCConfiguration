package Exceptions;


public class InvalidListOfArguments extends Exception {

    
    public InvalidListOfArguments() {
        
        super("One or more arguments are missing.");
    }

    
        public String toString () {
        return getMessage();
    }
    
        
        /*public static void main(String[] args) {
        
            try{
                throw new InvalidListOfArguments();
            }
            catch(InvalidListOfArguments il)
            {
                System.err.println(il.toString());
            }
    }
    */
}
