module calc::calc{
    use std::signer;
   // use std::string;
    use std::error;
    // use aptos_framework::account;
    // use aptos_framework::event;

    struct Sum has key,drop{
        value : u64,
    }
    struct Sub has key,drop{
        value: u64,
    }
    struct Multi has key,drop{
        value: u64,
    }
    struct Div has key, drop{
        value: u64,
    }
    const ENO_MESSAGE:u64= 0;

    #[view]
    public fun get_addition(account: address): u64 acquires Sum{
        assert!(exists<Sum>(account),error::not_found(ENO_MESSAGE));
        *&borrow_global<Sum>(account).value
    }

    #[view]
    public fun get_subtraction(account: address): u64 acquires Sub{
        assert!(exists<Sub>(account),error::not_found(ENO_MESSAGE));
        *&borrow_global<Sub>(account).value
    }
    #[view]
    public fun get_multiplication(account: address): u64 acquires Multi{
        assert!(exists<Multi>(account),error::not_found(ENO_MESSAGE));
        *&borrow_global<Multi>(account).value
    }
    #[view]
    public fun get_division(account: address): u64 acquires Div{
        assert!(exists<Div>(account),error::not_found(ENO_MESSAGE));
        *&borrow_global<Div>(account).value
    }
    
    public entry fun set_addition(account: signer, num1 : u64, num2: u64){
        let acc_addr = signer::address_of(&account);
        let sum = num1 + num2;
        if(!exists<Sum>(acc_addr)){
            move_to<Sum>(&account,Sum{value:sum})
        }
    }

    public entry fun set_subtraction(account: signer, num1 : u64, num2: u64){
        let acc_addr = signer::address_of(&account);
        let sub = num1 - num2;
        if(!exists<Sub>(acc_addr)){
            move_to<Sub>(&account,Sub{value:sub})
        }
    }

    public entry fun set_multiplication(account: signer, num1 : u64, num2: u64){
        let acc_addr = signer::address_of(&account);
        let multi = num1 * num2;
        if(!exists<Multi>(acc_addr)){
            move_to<Multi>(&account,Multi{value:multi})
        }
    }

    public entry fun set_division(account: signer, num1 : u64, num2: u64){
        let acc_addr = signer::address_of(&account);
        let div = num1 / num2;
        if(!exists<Div>(acc_addr)){
            move_to<Div>(&account,Div{value:div})
        }
    }

    #[test(account = @0x1)]
    public fun set_add(account: signer) acquires Sum{
        let addr = signer::address_of(&account);
        set_addition(account,3,2);
        assert!(get_addition(addr)==5, ENO_MESSAGE);
    }
    #[test(account = @0x1)]
    public fun set_sub(account: signer) acquires Sub{
        let addr = signer::address_of(&account);
        set_subtraction(account,3,2);
        assert!(get_subtraction(addr)==1, ENO_MESSAGE);
    }
    #[test(account = @0x1)]
    public fun set_multi(account: signer) acquires Multi{
        let addr = signer::address_of(&account);
        set_multiplication(account,3,2);
        assert!(get_multiplication(addr)==6, ENO_MESSAGE);
    }
    #[test(account = @0x1)]
    public fun set_div(account: signer) acquires Div{
        let addr = signer::address_of(&account);
        set_division(account,4,2);
        assert!(get_division(addr)==2, ENO_MESSAGE);
    }
}