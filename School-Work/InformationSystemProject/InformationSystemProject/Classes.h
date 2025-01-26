#include <iostream>
#include <cstdlib>
using namespace std;
class Employee
{
public:
	Employee() //Default constructor if nothing is given
	{
		firstName = "N/A";
		lastName = "N/A";
		userName = "N/A";
		securityQ = "N/A";
		securityA = "N/A";
		payroll = 0.0;
	}

	Employee(const string& name, string fN, string lN, string uN, string sQ, string sA, double money) : name(name) //Constructor that names the object appropriately when creating new employees
	{
		firstName = fN;
		lastName = lN;
		userName = uN;
		securityQ = sQ;
		securityA = sA;
		payroll = money;
	}

	~Employee() //Destructor to an object class
	{
	}

	Employee(string fN, string lN, string uN, string sQ, string sA, double money) //Once parameters are given
	{
		firstName = fN;
		lastName = lN;
		userName = uN;
		securityQ = sQ;
		securityA = sA;
		payroll = money;
	}

	string getFirstName()
	{
		return firstName;
	}

	string getLastName()
	{
		return lastName;
	}

	string getUserName()
	{
		return userName;
	}

	string getSecurityQ()
	{
		return securityQ;
	}

	string getSecurityA()
	{
		return securityA;
	}

	double getPayroll()
	{
		return payroll;
	}

	double getGross()
	{
		return (getPayroll() * 12.0); //Annual wage
	}

	void modifyPayroll(double payroll)
	{
		this->payroll = payroll;
	}

	void setFederalRedox(double federal_redox)
	{
		this->federal_redox = federal_redox;
	}

	double getFederalRedox()
	{
		return federal_redox;
	}

	void setNetPay(double net_pay)
	{
		this->net_pay = net_pay;
	}

	void federalReduction()

	{

		

		/*This section calculates the pay based on tax bracket.

		This calculation is only for the federal tax.*/

		

		double deducted_pay;

		bool bracket_one, bracket_two, bracket_three, bracket_four, bracket_five;

		int category{};

		bracket_one = (getGross() <= 55867.0);

		bracket_two = (getGross() <= 111733.0) && (getGross() > 55867.0);

		bracket_three = (getGross() <= 173205.0) && (getGross() > 111733.0);

		bracket_four = (getGross() <= 246752.0) && (getGross() > 173205.0);

		bracket_five = (getGross() > 246752.0);

		// If else statements assigns an integer value to each switch statement

		if (bracket_one == true)

			category = 1;

		else if (bracket_two == true)

			category = 2;

		else if (bracket_three == true)

			category = 3;

		else if (bracket_four == true)

			category = 4;

		else if (bracket_five == true)

			category = 5;

		double first_temp, second_temp, third_temp, fourth_temp, fifth_temp;

		// After passing a tax bracket the deduction calculation remains constant

		first_temp = 55867.0 * 0.85;

		second_temp = 55867.0 * 0.7995;

		third_temp = 61472.0 * 0.740;

		fourth_temp = 73547.0 * 0.71;

		switch (category)

		{

		case 1:

		{

			/*

			Case 1 calculates net pay for people earning 55,867

			or less. */


			setFederalRedox(getGross() - (getGross() * 0.15));
			break;

		}

		case 2:

		{

			

			/*Case 2 calculates net pay for people earning between

			111,733 dollars and 55,867 dollars.*/

			

			second_temp = (getGross() - 55867.0) * 0.7995;

			setFederalRedox(first_temp + second_temp);

			break;

		}

		case 3:

		{

			

			/*Case 3 calculates net pay for people earning between

			173,205 dollars and 111,733 dollars.*/

		

			third_temp = (getGross() - 111733.0) * 0.74;

			setFederalRedox(first_temp + second_temp + third_temp);

			break;

		}

		case 4:

		{

			

			/*Case 4 calculates net pay for people earning between

			246,752 dollars and 173,205 dollars.*/

			

			fourth_temp = (getGross() - 173205.0) * 0.71;

			setFederalRedox(first_temp + second_temp + third_temp + fourth_temp);

			break;

		}

		case 5:

		{

			

			/*Case 5 calculates net pay for people earning an amount

			greater than 246,752 dollars.*/

			

			fifth_temp = ((getGross() - 246752.0) - (getGross() * 0.15));

			setFederalRedox(first_temp + second_temp + third_temp + fourth_temp + fifth_temp);

			break;

		}

		default:

		{

			cout << "There is an error in the federal taxes section" << endl;

			break;

		}

		};

	}

	double provincialReductionBC()
	{

		

		/*This section calculates the pay based on tax bracket.

		This calculation is only for the British Columbia provincial tax*/

		

		// Federal tax calculation function is invoked

		federalReduction();

		

		/*Tax bracket conditions are defined as bools.They should not be modified

		If a tax brackets come around, then the customer can buy the new product.*/

		

		double deducted_pay;

		bool bracket_one, bracket_two, bracket_three, bracket_four, bracket_five, bracket_six, bracket_seven;

		int category{};

		bracket_one = (getGross() <= 47937.0);

		bracket_two = (getGross() <= 95875.0) && (getGross() > 47937.0);

		bracket_three = (getGross() <= 110076.0) && (getGross() > 95875.0);

		bracket_four = (getGross() <= 133664.0) && (getGross() > 110076.0);

		bracket_five = (getGross() <= 181232.0) && (getGross() > 133664.0);

		bracket_six = (getGross() <= 252752.0) && (getGross() > 181232.0);

		bracket_seven = (getGross() > 252752.0);

		double first_temp, second_temp, third_temp, fourth_temp, fifth_temp, sixth_temp, seventh_temp;

		// If else statement assigns an integer value to each switch statement

		if (bracket_one == true)

			category = 1;

		else if (bracket_two == true)

			category = 2;

		else if (bracket_three == true)

			category = 3;

		else if (bracket_four == true)

			category = 4;

		else if (bracket_five == true)

			category = 5;

		else if (bracket_six == true)

			category = 6;

		else if (bracket_seven == true)

			category = 7;

		// After passing a tax bracket the calculation becomes constant

		first_temp = 47937.0 * 0.9494;

		second_temp = 47938.0 * 0.923;

		third_temp = 14201.0 * 0.895;

		fourth_temp = 73547.0 * 0.8771;

		fifth_temp = 71520.0 * 0.853;

		sixth_temp = 71520.0 * 0.795;

		switch (category)

		{

		case 1:

		{

			

			/*Case 1 calculates net pay for people earning 47, 937

			or less.*/

			

			setNetPay(getFederalRedox() * 0.9494);

			break;

		}

		case 2:

		{

			

			/*Case 2 calculates net pay for people earning between

			95,875 dollars and 110,076 dollars.*/

			

			second_temp = (getFederalRedox() - 47937.0) * 0.923;

			setNetPay(first_temp + second_temp);

			break;

		}

		case 3:

		{

			

			/*Case 3 calculates net pay for people earning between

			110,076 dollars and 133,664 dollars.*/

			

			third_temp = (getFederalRedox() - 95875.0) * 0.895;

			setNetPay(first_temp + second_temp + third_temp);

			break;

		}

		case 4:

		{

			

			/*Case 4 calculates net pay for people earning between

			133,664 dollars and 181,232 dollars.*/

			

			fourth_temp = (getFederalRedox() - 110076.0) * 0.8771;

			setNetPay(first_temp + second_temp + third_temp + fourth_temp);

			break;

		}

		case 5:

		{

			

			/*Case 5 calculates net pay for people earning an amount

			between 181,232 and 252,752 dollars*/

			

			fifth_temp = (getFederalRedox() - 133664.0) * 0.853;

			setNetPay(first_temp + second_temp + third_temp + fourth_temp + fifth_temp);

			break;

		}

		case 6:

		{

			

			/*Case 6 calculates net pay for people earning an amount greater

			than 252,752 dollars.*/

			

			sixth_temp = (getFederalRedox() - 181232.0 - (getFederalRedox() * 0.832));

			setNetPay(first_temp + second_temp + third_temp + fourth_temp + fifth_temp + sixth_temp);

			break;

		}

		case 7:

		{



			/*Case 7 calculates net pay for people earning an amount greater

			than 252,752 dollars.*/



			seventh_temp = (getFederalRedox() - 252752.0 - (getFederalRedox() * 0.795));

			setNetPay(first_temp + second_temp + third_temp + fourth_temp + fifth_temp + sixth_temp + seventh_temp);

			break;

		}

		default:

		{

			cout << "There is something wrong with the provincial taxes";

			break;

		}

		}
		return net_pay;
	}


	
private:
	string name;
	string firstName;
	string lastName;
	string userName;
	string securityQ;
	string securityA;
	double payroll;
	double federal_redox;
	double net_pay;
};