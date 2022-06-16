// find a year is leap or not

Integer year = 2200;

if(Math.mod(year, 4) ==0){
    if(Math.mod(year, 100) == 0){
        if(Math.mod(year, 400) ==0){
            System.debug('Leap year');
        }else{
            System.debug('Not a leap year');
        }
    }else{
        System.debug('Leap year');
    }
}
else{
    System.debug('Not a leap year');
}
