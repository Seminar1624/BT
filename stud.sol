// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {

    // -----------------------------
    //  STRUCTURE
    // -----------------------------
    struct Student {
        string name;
        uint256 rollno;
        string className;
    }

    // -----------------------------
    //  ARRAY OF STRUCTS
    // -----------------------------
    Student[] public students;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // -----------------------------
    //  ADD STUDENT
    // -----------------------------
    function addStudent(string memory name, uint256 rollno, string memory className) public {
        students.push(Student(name, rollno, className));
    }

    // -----------------------------
    //  GET STUDENT BY INDEX
    // -----------------------------
    function getStudent(uint256 index) public view returns (string memory, uint256, string memory) {
        require(index < students.length, "Invalid index");
        Student memory s = students[index];
        return (s.name, s.rollno, s.className);
    }

    // -----------------------------
    //  GET TOTAL STUDENTS
    // -----------------------------
    function getTotalStudents() public view returns (uint256) {
        return students.length;
    }

    // -----------------------------
    //  FALLBACK FUNCTION
    // -----------------------------
    // This function will be called when someone sends Ether to the contract
    // or calls a function that doesn’t exist.
    fallback() external payable {
        // Automatically adds a default student when fallback is triggered
        students.push(Student("Unknown", 0, "NA"));
    }

    // Receive Ether (optional)
    receive() external payable {}
}
