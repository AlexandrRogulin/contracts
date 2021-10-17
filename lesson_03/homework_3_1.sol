/* 3.1. "Очередь в магазине"
Хранилище данных - массив строк (Где строки имена людей, которые встают в очередь).
Должны быть доступны опции:
встать в очередь (переданное имя встает в конец очереди - в конец массива)
вызвать следующего (первый из очереди уходит - нулевой элемент массива пропадает)*/

pragma solidity 0.4.0;

contract helloWorld {
    string[] persons = ["Bob", "Kevin", "Mary", "Leo"];
    // Количество элементов массива
    function getPersonCount() constant returns (uint) {
        return persons.length;
    }
    // Добавить в конец списка
    function addPerson(string s) {
        persons.push(s);
    }
    // Посмотреть последний элемент списка
    function getLastPerson() constant returns (string) {
        return persons[persons.length-1];
    }
    // Посмотреть первый элемент списка
    function getFirstPerson() constant returns (string) {
        return persons[0];
    }
    
    // Удалит первый элемент из списка и переместить на 1 всех людей в очереди
    function deleteFirstPerson () constant returns (string) {
        delete persons[0];
        for( uint i = 0; i < persons.length-1; i++) {
            persons[i] = persons[i + 1];
        }
        return persons[0];
    }
    
}
