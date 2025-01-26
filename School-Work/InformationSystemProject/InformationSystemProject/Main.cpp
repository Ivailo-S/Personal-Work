#include <iostream>
#include <iomanip>
#include <algorithm>
#include <chrono>
#include <thread>
#include <vector>
#include <fstream>
#include <string>
#include <bitset>
#include <conio.h>
#include "Classes.h"
using namespace std;

vector<Employee> readEmployees()
{
	Employee employee1("James", "Cameron", "JCameron", "Where did you grow up?", "Canada", 8995.95); //Pre-defined employees for demonstration purposes
	Employee employee2("Howard", "Ross", "HRoss", "Name your favourite TV show: ", "Friends", 6995.95);
	Employee employee3("Philip", "Kindred", "PKindred", "What is your mother's maiden name?", "Joyce", 7495.45);
	vector<Employee> numEmployees{ employee1, employee2, employee3 }; //Dumps the defined employees into a simple vector
	return numEmployees;
}

void loadingScreen() //Makes a cool ASCII art of our bootleg ScotiaBank Logo
{
	for (int i = 0; i < 3; i++)
	{
		std::system("cls"); //Resets the screen every loop
		cout << endl << "     .=@@@@@@@@@@@@@@@@@@@@@@@@@@@.     " << endl;
		cout << "       .+@@@@@@@@@@@@@@@@@@@@@@@@@.     " << endl;
		cout << "         .*@@@%%**==**%@@@@@@@@@@@.     " << endl;
		cout << "               .=*%@@%*=.+@@@@@@@@.     " << endl;
		cout << "             .%@@@@@@@@@@%::#@@@@@.     " << endl;
		cout << "            =@@@@@@@@@@@@@@+  +@@@.     " << endl;
		cout << "           :@@@@@@@@@@@@@@@@:   =#.     " << endl;
		cout << "           :@@@@@@@@@@@@@@@@:   =#.     " << endl;
		cout << "            =@@@@@@@@@@@@@@+  +@@@.     " << endl;
		cout << "             .%@@@@@@@@@@%::#@@@@@.     " << endl;
		cout << "               .=*%@@%*=.+@@@@@@@@.     " << endl;
		cout << "         .*@@@%%**==**%@@@@@@@@@@@.     " << endl;
		cout << "       .+@@@@@@@@@@@@@@@@@@@@@@@@@.     " << endl;
		cout << "     .=@@@@@@@@@@@@@@@@@@@@@@@@@@@.     " << endl << endl;
		cout << "    -------------------------------- " << endl;
		cout << "    ScotiaScam Inc. Employee Manager " << endl;
		cout << "    -------------------------------- " << endl;
		cout << "                Loading";
		for (int j = 0; j < 3; j++)
		{
			this_thread::sleep_for(chrono::seconds(1));
			cout << ".";
		}
		this_thread::sleep_for(chrono::seconds(1));
	}
	return; //Runs the password screen once finished this loop
}

string TextToBinaryString(const string& words) //Simple Binary Translator
{
	string binaryString = "";
	for (char _char : words) {
		binaryString += bitset<8>(_char).to_string(); //Convienent function that just changes each character to an 8-bit binary format
	}
	return binaryString;
}

void passwordRecovery(string user, string Q, string A, string password) //Asks the user a security question, and if they get it correct present the current password in the 'server'
{
	std::system("cls"); //Note: For some reason the 'using namespace std' line doesn't apply (sometimes) when calling system functions
	cout << "--------------------------------------" << endl;
	cout << "    ScotiaScam Password Recovery:" << endl;
	cout << "--------------------------------------" << endl;
	cout << "Here is your defined security question " << user << ":" << endl;
	string question = Q; //Security question taken straight from the user
	string answer = A; //Answer that the user must input to return the current password
	string input; //User input
	int screwUps = 0; // How long the system will be locked out if you keep mucking it up
	while (true)
	{
		cout << question << " ";
		cin.ignore(); //Stops any unnecessary overflow
		getline(cin, input); //Is able to accept a full line as an answer too
		if (input == answer) //If accepted, show the concurrent password and return
		{
			cout << "Answer accepted." << endl;
			cout << "Current server password is " << password << endl;
			this_thread::sleep_for(chrono::seconds(5));
			return;
		}
		else
		{
			cout << "Incorrect answer." << endl;
			screwUps++;
			if (screwUps == 3) //Forces the user to return back to the password screen without any given password
			{
				cout << "Max incorrect answers reached. Returning to the password screen..." << endl;
				this_thread::sleep_for(chrono::seconds(5));
				return;
			}
			cout << "Number of attempts remaining: " << (3 - screwUps) << endl;
		}
	}
}

void Password(vector<Employee>& employees)
{
	int numAttempts = 3; // How many times you can muck up the password
	int screwUps = 0; // How long the system will be locked out if you keep mucking it up
	vector<string> userID; //Assigns where the usernames are
	vector<string> userQ; //Recollects each user's security question
	vector<string> userA; //And security answer as well
	for (int i = 0; i < employees.size(); i++)
	{
		userID.push_back(employees[i].getUserName());
		userQ.push_back(employees[i].getSecurityQ());
		userA.push_back(employees[i].getSecurityA());

	}
	string correctPassword; //The current password accepted by the system
	ifstream inputFile("c:\\Users\\ivail\\Documents\\TRU Documents\\server.bin", ios::binary); //Accesses the .bin binary file to be used as a more secure password
	//Note: MAKE SURE THE FILE LOCATION IS DIFFERENT FOR YOUR SYSTEM!!!
	if (inputFile.is_open()) {
		//Figure out the filesize
		inputFile.seekg(0, ios::end);
		streampos fileSize = inputFile.tellg();
		inputFile.seekg(0, ios::beg);

		//Reads the binary data into a buffer
		string buffer(fileSize, ' ');
		inputFile.read(&buffer[0], fileSize);

		//Now convert the binary data to the password
		string readableString;
		for (size_t i = 0; i < buffer.size(); i += 8) {
			bitset<8> byte(buffer.substr(i, 8));
			readableString += static_cast<char>(byte.to_ulong());
		}
		correctPassword = readableString; //Sets the correct password as the translated binary data
		inputFile.close();
	}
	else
	{
		cout << "Error: Unable to access password server. Please verify that the input file location is correct and that such a file even exists there. Program has defaulted to an unsecure built-in password." << endl;
		correctPassword = "Password"; //If the server cannot be accessed
	}
	while (true)
	{
		std::system("cls");
		cout << "--------------------------------" << endl;
		cout << "   ScotiaScam Secure Screen:" << endl;
		cout << "--------------------------------" << endl;
		string password;
		string ID;
		bool correctID = false; //To make sure if it is the ID that's wrong, or the password if need be
		cout << "User ID: ", cin >> ID;
		cin.clear();
		for (int i = 0; i < employees.size(); i++)
		{
			if (ID == userID[i])
			{
				std::system("cls");
				correctID = true;
				cout << "--------------------------------" << endl;
				cout << "   ScotiaScam Secure Screen:" << endl;
				cout << "--------------------------------" << endl;
				cout << "User ID: " << ID << endl;
				cout << "Password: ", cin >> password;
				cin.clear();
				if (password != correctPassword) //If incorrect
				{
					bool recovery = false; //Exists as a way to make sure the userID doesn't count as an 'incorrect password'
					if (password == "recover" || password == "Recover" || password == "RECOVER") //Just to cover every variation to 'recover'
					{
						passwordRecovery(userID[i], userQ[i], userA[i], correctPassword); //Gets the name, question, answer, and the server password respectively
						recovery = true;
					}

					if (recovery == true) //Skips the screw up incrementor
					{
					}
					else
					{
						numAttempts--; //Deincrements the attempts every time you muck up
						cout << "Incorrect Password entered." << endl;
						cout << "Number of attempts remaining: " << numAttempts << endl;
						if (numAttempts == 0) //If you really boned yourself
						{
							screwUps++; //Starts the screw up incrementer
							cout << "System is now locked out for " << (5 * screwUps) << " minutes. If it is incorrect again, another 5 minutes will be added." << endl;
							this_thread::sleep_for(chrono::minutes(5 * screwUps)); //Forces the program to do nothing until this is over
							numAttempts++; //Gives the user one more chance once this time is over.
						}
						this_thread::sleep_for(chrono::seconds(4)); //Small delay
						cout << "Forgot your password? Type in 'recover' in the password field, and you can recover the password using a special security question." << endl;
						this_thread::sleep_for(chrono::seconds(5)); //Another small delay
					}
					cin.clear();
				}
				else
				{
					return; //Leave the program entirely

				}
			}

		}

		if (correctID == false)
		{
			numAttempts--; //Deincrements the attempts every time you muck up
			cout << "Incorrect User ID entered." << endl;
			cout << "Number of attempts remaining: " << numAttempts << endl;
			if (numAttempts == 0)
			{
				screwUps++; //Starts the screw up incrementer
				cout << "System is now locked out for " << (5 * screwUps) << " minutes. If it is incorrect again, another 5 minutes will be added." << endl;
				this_thread::sleep_for(chrono::minutes(5 * screwUps)); //Forces the program to do nothing until this is over
				numAttempts++; //Gives the user one more chance once this time is over.
			}
			this_thread::sleep_for(chrono::seconds(4)); //Small delay
		}
	}
}

void PasswordChanger() //Does exactly what's on the tin
{
	string oldPassword;
	string input;
	int screwUps = 0; // The number of attempts you can mess up the password verificator before it dumps you back to the main menu
	ifstream inputFile("c:\\Users\\ivail\\Documents\\TRU Documents\\server.bin", ios::binary); //Accesses the .bin binary file to be used as a more secure password
	//Note: MAKE SURE THE FILE LOCATION IS DIFFERENT FOR YOUR SYSTEM!!!
	if (inputFile.is_open()) { //If a prior file does exist, prompt the user to type it in beforehand before making a new one
		//Figure out the filesize
		inputFile.seekg(0, ios::end);
		streampos fileSize = inputFile.tellg();
		inputFile.seekg(0, ios::beg);

		//Reads the binary data into a buffer
		string buffer(fileSize, ' ');
		inputFile.read(&buffer[0], fileSize);

		//Now convert the binary data to the password
		string readableString;
		for (size_t i = 0; i < buffer.size(); i += 8) {
			bitset<8> byte(buffer.substr(i, 8));
			readableString += static_cast<char>(byte.to_ulong());
		}
		oldPassword = readableString; //Sets the correct password as the translated binary data
		inputFile.close();
		while (true) //Exists solely to just loop the incorrect password system
		{
			std::system("cls"); //Wipe the last screen
			cout << "----------------------------------" << endl;
			cout << "   ScotiaScam Password Changer" << endl;
			cout << "----------------------------------" << endl;
			cout << "To verify; please type in the old password prior: ", cin >> input;
			if (input == oldPassword)
			{
				string password;
				cout << "Password accepted." << endl;
				cout << "Now please enter the new password you wish to overwrite the prior one: ", cin >> password;
				string binaryData = TextToBinaryString(password); //Converts into binary via an external function
				ofstream outputFile("c:\\Users\\ivail\\Documents\\TRU Documents\\server.bin", ios::binary); //And now just write the encrypted binary data to the 'company server' as in whatever address you have
				outputFile.write(binaryData.c_str(), binaryData.size());
				outputFile.close();
				cout << "Password has been saved to the company server." << endl;
				this_thread::sleep_for(chrono::seconds(3)); //Small delay
				return;
			}
			else
			{
				cout << "Incorrect password." << endl;
				screwUps++;
				cout << "Number of attempts remaining: " << (3 - screwUps) << endl;
				if (screwUps == 3)
				{
					cout << "Returning to the main menu...";
					this_thread::sleep_for(chrono::seconds(3)); //Small delay
					return;
				}
				this_thread::sleep_for(chrono::seconds(3)); //Small delay
			}
		}
	}
	else //Else, just let the user create a brand new password right out of the gate
	{
		string password;
		std::system("cls"); //Wipe the last screen
		cout << "----------------------------------" << endl;
		cout << "   ScotiaScam Password Changer" << endl;
		cout << "----------------------------------" << endl;
		cout << "Please type in a new password for the program: ", cin >> password;
		string binaryData = TextToBinaryString(password); //Converts into binary via an external function
		ofstream outputFile("c:\\Users\\ivail\\Documents\\TRU Documents\\server.bin", ios::binary); //And now just write the encrypted binary data to the 'company server' as in whatever address you have
		outputFile.write(binaryData.c_str(), binaryData.size());
		outputFile.close();
		cout << "Password has been saved to the company server." << endl;
		this_thread::sleep_for(chrono::seconds(3)); //Small delay
		return;
	}
}

void Employees(vector<Employee>& employees) //Function: Displays each employee on the database and each of their payrolls
{
	std::system("cls"); //Clear the last screen
	cout << "------------------------------------" << endl;
	cout << "         Current Employees" << endl;
	cout << "------------------------------------" << endl;
	for (int i = 0; i < employees.size(); i++)
	{
		cout << "Employee #" << (i + 1) << endl;
		cout << "Name: " << employees[i].getFirstName() << " " << employees[i].getLastName() << endl;
		cout << "Current Monthly Income: $" << fixed << setprecision(2) << employees[i].getPayroll() << endl;
		cout << "Gross Annual Income: $" << fixed << setprecision(2) << employees[i].getPayroll() * 12 << endl;
		cout << "Tax Deduction (Provincial & Federal): $" << fixed << setprecision(2) << (employees[i].getPayroll() * 12) - employees[i].provincialReductionBC() << endl;
		cout << "Net Salary: $" << fixed << setprecision(2) << employees[i].provincialReductionBC() << endl << endl; //Double space the end of the employee itinerary
	}
	cout << "Press any key to return to the main menu..." << endl;
	_getch(); //Acts as a function that pauses the console until the user does anything
	return;
}

void Payroll(vector<Employee> &employees) //Function: Modifies any particular employee's payroll
{
	int input; //Simple selector
	double wage; //New wage
	while (true)
	{
		std::system("cls"); //Clear the last screen
		cout << "------------------------------------" << endl;
		cout << "         Payroll Modifier" << endl;
		cout << "------------------------------------" << endl;
		cout << "Please select an employee to change their monthly wage numerically:" << endl;
		for (int i = 0; i < employees.size(); i++)
		{
			cout << (i + 1) << ") ";
			cout << employees[i].getFirstName() << " " << employees[i].getLastName() << endl;
		}
		cout << "Input: ", cin >> input;
		cin.clear();
		if (input <= 0 || input > employees.size()) //If the user inputted zero or below, or above the current employee numbers
		{
			cout << "Invalid Input. Please try again." << endl;
			this_thread::sleep_for(chrono::seconds(3));
		}
		else
		{
			try //For exceptions
			{
				cout << "Set the wage for " << employees[input - 1].getFirstName() << " " << employees[input - 1].getLastName() << ": ", cin >> wage;
				if (wage < 0) //If the user set a negative value
				{
					throw invalid_argument("Error: Negative Wage");
				}
				cin.clear();
				employees[input - 1].modifyPayroll(wage); //Sets the new wage
				cout << "New wage has been set accordingly." << endl;
				this_thread::sleep_for(chrono::seconds(3));
				return; //Returns to the main menu
			}
			catch (invalid_argument ex)
			{
				cout << ex.what() << endl;
				cout << "Wage cannot be set below 0." << endl;
				this_thread::sleep_for(chrono::seconds(4));
			}
		}
	}
}

void EmployeeManager(vector<Employee>& employees) //Function: Lets you insert or remove additional employee classes
{
	int input; //Numerical Selection
	string confirmation; //Character Selection
	string fN; //First Name Input
	string lN; //Last Name Input
	string uN; //Generated Username organized as the first letter of the first name, followed by their full last name
	string sQ; //Security Question Input
	string sA; //Security Answer Input
	double wage; //Monthly Salary Input
	while (true)
	{
		std::system("cls"); //Clear the last screen
		cout << "----------------------------------" << endl;
		cout << "      Employee Wizard - Menu" << endl;
		cout << "----------------------------------" << endl;
		cout << "Select one of the options below numerically:" << endl;
		cout << "1) Add new employees" << endl;
		cout << "2) Remove pre-existing employees" << endl;
		cout << "Input: ", cin >> input;
		if (input == 1) //Add a new employee class
		{
			std::system("cls"); //Clear the last screen
			cout << "--------------------------------------" << endl;
			cout << "   Employee Wizard - User Creation" << endl;
			cout << "--------------------------------------" << endl;
			cout << "First Name: ", cin >> fN;
			cin.clear();
			cout << "Last Name: ", cin >> lN;
			cin.clear();
			cin.ignore(); // To make sure that the next line doesn't skip for no reason
			uN = fN[0] + lN; //Auto Username Generator
			for (int i = 0; i < employees.size(); i++)
			{
				if (employees[i].getUserName() == uN)
				{
					uN += to_string(1);
				}
			}
			cout << "Generated User Name: " << uN << endl;
			cout << "Create a Personalized Security Question: "; 
			getline(cin, sQ);
			cin.clear();
			cout << "Now create it's answer: "; 
			getline(cin, sA);
			cin.clear();
			cout << "Lastly, input the employee's monthly wage: $", cin >> wage;
			cin.clear();
			string newEmployee = "employee" + to_string(employees.size() + 1); //Just assigns a generated class name
			Employee emp(newEmployee, fN, lN, uN, sQ, sA, wage); //Initial object constructor for the newly defined class
			employees.push_back(emp); //Inserts the new class into our vector
			cout << "Employee has now been added to the system." << endl;
			this_thread::sleep_for(chrono::seconds(3));
			return; //Goes back to the main menu accordingly
		}
		else if (input == 2) //Remove an employee class
		{
			std::system("cls"); //Clear the last screen
			cout << "-------------------------------------" << endl;
			cout << "   Employee Wizard - User Removal" << endl;
			cout << "-------------------------------------" << endl;
			cout << "Please select an employee to remove from the system:" << endl;
			for (int i = 0; i < employees.size(); i++)
			{
				cout << (i + 1) << ") ";
				cout << employees[i].getFirstName() << " " << employees[i].getLastName() << endl;
			}
			cout << "Input: ", cin >> input;
			cin.clear();
			if (input <= 0 || input > employees.size()) //If the user inputted zero or below, or above the current employee numbers
			{
				cout << "Invalid Input. Please try again." << endl;
				this_thread::sleep_for(chrono::seconds(3));
			}
			else
			{
				cout << "Are you sure you want to remove this user from the system? This action is not recoverable and will completely wipe them entirely." << endl;
				cout << "(Y/N): ", cin >> confirmation;
				if (confirmation == "Y" || confirmation == "y")
				{
					cin.clear();
					employees.erase(employees.begin() + input - 1); //Gets rid of the employee from existence
					cout << "User has been removed." << endl;
					this_thread::sleep_for(chrono::seconds(3));
					return; //Returns to the main menu
				}
				else //Returns to the beginning of the employee creation/deletion screen
				{
					cout << "Action cancelled." << endl;
					this_thread::sleep_for(chrono::seconds(3));
				}
			}
		}
		else
		{
			cout << "Invalid Input. Please try again." << endl;
			this_thread::sleep_for(chrono::seconds(3));
		}
	}

}

void MainMenu(vector<Employee>& employees) //Function: Lets the user select from a series of options
{
	int input;
	while(true) //Loops forever until the user inputs a valid input, or they want to quit the program altogether
	{
		std::system("cls"); //Clear the last screen
		cout << "------------------------------------------" << endl;
		cout << "   ScotiaScam Employee Payroll Program" << endl;
		cout << "------------------------------------------" << endl;
		cout << "Select one of the options below:" << endl;
		cout << "1. View Employees & Payrolls" << endl;
		cout << "2. Modify Payrolls for Employees" << endl;
		cout << "3. Add/Remove Employees" << endl;
		cout << "4. Change Program Password" << endl; 
		cout << "5. End Program" << endl;
		cout << "Make your input numerically here (1 to 5): ", cin >> input;
		switch (input)
		{
		case 1:
		{
			Employees(employees);
			break;
		}
		case 2:
		{
			Payroll(employees);
			break;
		}
		case 3:
		{
			EmployeeManager(employees);
			break;
		}
		case 4:
		{
			PasswordChanger();
			break;
		}
		case 5:
		{
			cout << "------------------------------------------------------------------" << endl;
			cout << "   Thank you for using the ScotiaScam Employee Payroll Program." << endl;
			cout << "                         Have a great day!" << endl;
			cout << "------------------------------------------------------------------" << endl;
			this_thread::sleep_for(chrono::seconds(5)); //Waits a bit, then should return to the password screen accordingly
			std::system("cls");
			return;
		}
		default: //Basically if it isn't defined here, it will just go to this
		{
			cout << "Invalid input detected." << endl;
			this_thread::sleep_for(chrono::seconds(3)); //Small delay
			break;
		}
		}
	}
}

int main()
{
	vector<Employee> numEmployees = readEmployees(); //Finds all the employees on the system
	loadingScreen(); //Runs a cool loading screen
	while (true) //Will only indefinitely run between the password client and the main menu
	{
		Password(numEmployees); //First runs the password client
		MainMenu(numEmployees); //If succesful, continue straight to the initial menu
	}
	return 0;
}