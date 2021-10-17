/**
3.2. "Список задач"
Структура (см лекцию по типам данных)
- название дела
- время добавления (см helloWorld)
- флаг выполненности дела (bool)
Структуру размещаем в сопоставление int8 => struct (см лекцию по типам данных)
должны быть доступны опции:
- добавить задачу (должен в сопоставление заполняться последовательный целочисленный ключ)
- получить количество открытых задач (возвращает число)
- получить список задач
- получить описание задачи по ключу
- удалить задачу по ключу
- отметить задачу как выполненную по ключу
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

// This is class that describes you smart contract.
contract ToDoList {
    uint32 public timestamp;

    struct Task {
        uint id;
        string name;
        uint date;
        bool done;
    }

    Task[] tasks;

    // Создать задачу
    function createTask(string _name) public {
        tasks.push(Task(tasks.length, _name, now, false));
    }

    // Получить количество открытых задач
    function getTasksCountNotDone (uint) public {
        uint public count = 0;
        for (uint i = 0; i < Tasks.length-1; i++) {
            if (tasks.done == false) {
                count++;
            }
        }
        return count;
    }

    // Получить список задач
    function getTasks() public constant returns(Task) {
        return tasks;
    } 

    // Получить описание задачи по ключу
    function getTask(uint id) public constant 
        returns(uint, string, uint, bool) {
            return(id, tasks[id].date, tasks[id].name, tasks[id].done);
        }

    // удалить задачу по ключу
    function deleteTask (uint id) public {
        delete Tasks[id];
    }

    // Отметить задачу как выполненную по ключу
    function TaskDone(uint id) public {
        Task.done = true;
    }

    // constructor() public {
    //     require(tvm.pubkey() != 0, 101);
    //     require(msg.pubkey() == tvm.pubkey(), 102);

    //     tvm.accept();

    //     timestamp = now;
    // }

    
}
