public class practiceClass3 {
	public static void MemberQuery ()
    	{  //HW1 1. write not in and in queries
            
            // Get all accounts where the Industry = energy is in the given list
        list < Account> acclist = [SELECT Id, Name, Industry FROM Account Where Industry In ('energy')];
             //for loop to show in a sequence:
             for (integer i=0; i< acclist.size (); i++)
            {system.debug ( acclist.get (i)); }
            //for loop to show in a sequence:
            
            // Get all accounts where the Industry= energy is NOT in the given list
        list < Account> acclist1 = [SELECT Id, Name, Industry FROM Account Where Industry NOT In ('energy')];
            //for loop to show in a sequence:
             for (integer i=0; i< acclist1.size (); i++)
            {system.debug ( acclist1.get (i)); }
            //for loop to show in a sequence:
        }
    
            public static void usingStringFunc () {
            //HW2 use some string functions, substring, split
            String s = 'simran kaur';
		    system.debug ('normal string given: ' + s);
            //capitalize()
            system.debug ('using capitalise function: '+ s.capitalize());
            //toUpperCase()
            system.debug ('using upper case function: '+ s.toUpperCase());
            //abbreviate(maxWidth) fixed Length Textbox 5 Rishipal Singh -> Rishi
			// abbreviate(3) Ris..
           system.debug ('Using Abbreviate Function: '+ s.abbreviate(5));
            //using center (size, padding string) function
           system.debug ('Using center (size) Function: '+ s.center(16, '*'));
           system.debug ('Using center (size) Function: '+ s.center(15, '*'));
            // center(size)
           system.debug ('Using center (size) Function: '+ s.center(22, '~'));
               system.debug(' Checking if the string is empty:' + string.isempty(s));
                // reverse if the string is not empty 
                if (s != null && s != '') 
                { string converteds = s.reverse(); 
                  System.debug(''+ converteds);   
                } 
                else {
                      system.debug('string is empty');
                     }

                // substring(startIndex, endIndex)
              system.debug ('Show substring from i to a in the string :---' + s.substring (1,5));
                //split
                list <string > s1 = s.splitByCharacterType();
				System.debug(s1);
    	}
    	public static void prepareAndTable () {
            // HW 3. && || if in apex, prepare a table ; CREATING TRUE AND FALSE COMBINATIONS
            List<Boolean> values = new List<Boolean>{true, false};

        System.debug('A\t|\tB\t|\tA && B');
        System.debug('--------------------------');

        for (Boolean A : values) 
        {
            for (Boolean B : values)
            {
                Boolean result = A && B;
                System.debug(A + '\t|\t' + B + '\t|\t' + result);            
        	}
        }
        }   
            public static void prepareORTable () 
            {
				List<Boolean> values = new List<Boolean>{true, false};   
                     System.debug('A\t|\tB\t|\tA || B');
        System.debug('--------------------------');
                for (Boolean A : values) 
        {
            for (Boolean B : values)
            {
                Boolean result = A ||  B;
                System.debug(A + '\t|\t' + B + '\t|\t' + result);            
        	}
        }
     }
            
           //H.W 4 same soql using dynamic i.e databse.query and normal one... difference between them
            public static void soqlTypePractice () 
            {
                //static SOQL NOT IN and IN queries:
                List <string> IndustryList = new List <string> {'energy'};
                    // Query all accounts where Industry is energy
              List <Account> Acclist = [SELECT Id, Name, Industry FROM Account WHERE Industry IN : IndustryList];
                system.debug ('having Energy as industry; = ' + Acclist);
               /* either do : List <Account> Acclist = [SELECT Id, Name, Industry FROM Account WHERE Industry IN : IndustryList];
                system.debug (Acclist);
			or do :
				system.debug ([SELECT Id, Name, Industry FROM Account WHERE Industry IN : IndustryList]);
				same result */
                
                List <Account> AcclisS = [SELECT Id, Name, Industry FROM Account WHERE Industry NOT IN : IndustryList];
                system.debug ('having Energy not as industry; = ' + AcclisS);
                // use of bind variable in static SOQL: and Compiled at compile-time
                
                //dynamic SOQL NOT IN and IN queries:
                //Query is built as a string at runtime Then executed using Database.query()
               String UI = 'Bhavya from Apex';
                String str = 'SELECT Id, Name FROM Account WHERE Name = ';
                str = str + '\'' + UI + '\'';  
                List<Account> acclist1 = Database.query(str); 
                system.debug ('Accounts having Name as Bhavya from Apex:' + acclist1);
            }
}