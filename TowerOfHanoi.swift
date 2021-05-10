/*
This program gets number of disks as input,
use recursion to solve the Tower of Hanoi and show the text of solution.
author  Jay Lee
version 1.0
since   2020-05-10
*/

enum InvalidInputError : Error {
  case invalidInput
}

// This function uses recursion to solve the Tower of Hanoi.
func Hanoi(ndisks: Int, startPeg: Int, endPeg: Int) {
  if (ndisks == 1) {
    print("Move disk 1 from peg \(startPeg) to peg \(endPeg)")
  } else {
    Hanoi(ndisks: ndisks - 1, startPeg: startPeg, endPeg: 6 - startPeg - endPeg)
    print("Move disk \(ndisks) from peg \(startPeg) to peg \(endPeg)")
    Hanoi(ndisks: ndisks - 1, startPeg: 6 - startPeg - endPeg, endPeg: endPeg)
  }
}

print("Towers of Hanoi program\n")
do {
  print("How many disks would you like in your tower (1->): ", terminator:"")
  guard let numberOfDisks = Int(readLine()!) else {
    throw InvalidInputError.invalidInput
  }
  Hanoi(ndisks: numberOfDisks, startPeg: 1, endPeg: 3)
} catch {
  print("ERROR: Invalid Input")
}
print("\nDone.")
