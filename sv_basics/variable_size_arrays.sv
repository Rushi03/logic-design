module variable_size_arrays();

// Variable size arrays used in test benches; not sythesizable
int dynamicArray[];                  // Create items out of nothing
int queue[$];                        // Container for storing items
int associativeArray[*];             // Hash map, key - value pairs

int result;
int queueResult[$];

initial
    begin
        dynamicArray = new[2];
        dynamicArray[0] = 12;
        dynamicArray[1] = 24;
        $display("Dynamic array values: %0p", dynamicArray);
        dynamicArray = new[3];              // erases the previous dynamic array
        $display("New dynamic array: %0p", dynamicArray);
        dynamicArray[0] = 3;
        dynamicArray[1] = 2;
        dynamicArray[2] = 4;
        $display("Dynamic array values: %0p", dynamicArray);
        dynamicArray = new[5] (dynamicArray);
        $display("New dynamic array with old values retained: %0p", dynamicArray); 
        dynamicArray.delete();              // deletes the dynamic array, cannot delete a specific element at a specific index

        queue.push_back(12);                // starts from index 0
        $display("Queue value after first push back: %0p", queue);
        queue.push_back(36);
        queue.push_front(40);               // pushes to front (index 0)
        $display("Queue values after push front: %0p", queue);
        queue.insert(2, 72);                // insert index, element
        $display("Queue after insertion at index 2: %0p", queue);
        result = queue.pop_front();         // pops index 0 element
        $display("Queue pop front value: %0d", result);
        result = queue.pop_back();          // pops last index element
        $display("Queue pop back value: %0d", result);
        queue.delete(0);                    // delete element at specified index
        $display("Queue values after deletion: %0p", queue);
        queue.delete();                     // delete all elemtns

        associativeArray[10] = 11;
        associativeArray[100] = 101;
        associativeArray[1000] = 1001;
        $display("Associative array values: %0p", associativeArray);
        // only 3 elements created not 1000
        associativeArray.delete(1000);      // delete element at specified index
        $display("Associative array values after deletion: %0p", associativeArray);
        associativeArray.delete();          // delete all elements

        // Examples of built-in functions for arrays
        queue = '{2, 2, 3, 4, 5, 6, 7, 7};
        result = queue.size();
        $display("Array size: %0d", result);
        result = queue.sum();
        $display("Array sum: %0d", result);
        queueResult = queue.min();
        $display("Array min value: %0p", queueResult);
        queueResult = queue.max();
        $display("Array max value: %0p", queueResult);
        queueResult = queue.unique();
        $display("Array unique elements: %0p", queueResult);
    end

endmodule