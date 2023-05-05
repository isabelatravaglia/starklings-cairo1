// move_semantics2.cairo
// Make me compile without changing line 16 or moving line 13!
// Execute `starklings hint move_semantics2` or use the `hint` watch subcommand for a hint.

use array::ArrayTrait;
use debug::PrintTrait;
use clone::Clone; // Option 3
use array::ArrayTCloneImpl; // Option 3


fn main() {

    // Option 1
    // let mut arr0 = ArrayTrait::new();
    // let mut arr0_new = ArrayTrait::new();
    // let mut arr1 = fill_array(arr0_new);


    // Option 2
    // let mut arr0 = ArrayTrait::new();
    // let mut arr1 = fill_array(ref arr0);

    // Option 3
    let mut arr0 = ArrayTrait::new();
    let arr0_snapshot = @arr0;
    let mut arr1 = fill_array(arr0_snapshot);


    // Do not change the following line!
    arr0.print();
}

// Option 1
// fn fill_array(arr: Array<felt252>) -> Array<felt252> {
//     let mut arr = arr;

//     arr.append(22);
//     arr.append(44);
//     arr.append(66);

//     arr
// }

// Option 2
// fn fill_array(ref arr: Array<felt252>) {

//     arr.append(22);
//     arr.append(44);
//     arr.append(66);

// }

// Option 3
fn fill_array(arr: @Array<felt252>) -> Array<felt252> {

    let mut arr_clone = arr.clone();

    arr_clone.append(22);
    arr_clone.append(44);
    arr_clone.append(66);

    arr_clone

}