module calc::calc{
    //use std::signer;
   // use std::string;
    // use std::error;
    // use aptos_framework::account;
    // use aptos_framework::event;

    const ENO_MESSAGE:u64= 0;
    const EARITHMATIC_ERROR:u64 = 1;

    #[view]
    public fun get_addition(n1:u64,n2:u64): u64{
        let sum = n1+n2;
        sum
    }

    #[view]
    public fun get_subtraction(n1:u64,n2:u64): u64{
        assert!(n1>n2,EARITHMATIC_ERROR);
        let sub = n1-n2;
        sub
    }
    #[view]
    public fun get_multiplication(n1:u64,n2:u64): u64 {
        let multi = n1*n2;
        multi
    }
    #[view]
    public fun get_division(n1:u64,n2:u64): u64{
        assert!(n2!=0,EARITHMATIC_ERROR);
        let div = n1/n2;
        div
    }

    #[test(account = @0x1)]
    public fun test_add(){
        assert!(get_addition(3,2)==5, ENO_MESSAGE);
    }
    #[test]
    public fun test_sub(){
        assert!(get_subtraction(4,3)==1, ENO_MESSAGE);
    }
    #[test]
    public fun test_multi(){
        assert!(get_multiplication(3,2)==6, ENO_MESSAGE);
    }
    #[test]
    public fun test_div(){
        assert!(get_division(4,2)==2, ENO_MESSAGE);
    }
}