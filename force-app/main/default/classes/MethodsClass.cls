public class MethodsClass {
    public String cardType;
    private Date cardExpiration;
    
    public MethodsClass() {
        cardType = 'DEFAULT CARD';
        cardExpiration = System.today();
        System.debug('Welcome home from defaulyt constructor !!');
        System.debug('Your card details are : ' + cardType );
        System.debug('Your card details are : ' + cardExpiration );
    }
    public MethodsClass(String str) {
        cardType = 'CARD ' + str;
        cardExpiration = System.today();
        System.debug('Welcome home from parameterised constructor !!' +str);
        System.debug('Your card details are : ' + cardType );
        System.debug('Your card details are : ' + cardExpiration );
    }
    
    public void displayCardDetails()
    {
        System.debug('Welcome to the Home Bank !! ');
        System.debug('Your card details are : ' + cardType );
        System.debug('Your card details are : ' + cardExpiration );
    }
    
    public String addressCheck(String city, String state)
    {
        System.debug('Welcome to the Home Bank !! ');
        System.debug('Your address details are : ' + city + ' : ' + state);
        
        stateCheck(state);
        
        return 'SUCCESS';
    }
    
    public String stateCheck( String state)
    {
        return 'STATE_VALIDATED';
    }
    
}