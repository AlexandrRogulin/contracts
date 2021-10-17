/*
2.1. Написать смарт-контракт и задеплоить его локально. Суть контракта:
контракт должен хранить произведение чисел. Изначально инициализирован единицей.
Bметь функцию "умножить".  Функция очевидно должна умножать сохраненное число 
на переданный в нее параметр. Дополнительным моментом является то, что функция 
должна умножать только на числа от 1 до 10 включительно. 
В противном случае прерывать выполнение. Используем require
*/


pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

// This is class that describes you smart contract.
contract homework_02 {
    // Contract can have an instance variables.
    // In this example instance variable `timestamp` is used to store the time of `constructor` or `touch`
    // function call
    // State variable storing the sum of arguments that were passed to function 'add',
	uint public sum = 1;

	constructor() public {
		// check that contract's public key is set
		require(tvm.pubkey() != 0, 101);
		// Check that message has signature (msg.pubkey() is not zero) and message is signed with the owner's private key
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
	}

	// Modifier that allows to accept some external messages
	modifier checkOwnerAndAccept {
		// Check that message was signed with contracts key.
		require(msg.pubkey() == tvm.pubkey(), 102);
		tvm.accept();
		_;
	}

	// Function that adds its argument to the state variable.
	function add(uint value) public checkOwnerAndAccept {
		require(value > 0 && value < 11, 101, "Числа должны быть от 1 до 10 включительно" );
		sum *= value;
	}
}
