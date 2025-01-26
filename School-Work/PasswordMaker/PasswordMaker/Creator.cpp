#include <iostream>
using namespace std;

double federalReduction(double gross_income) {

	double first_temp = 55867.0 * 0.85; //Alvaro's fixed rates for the higher tax brackets
	double second_temp = 55867.0 * 0.7995;
	double third_temp = 61472.0 * 0.740;
	double fourth_temp = 73547.0 * 0.71;
	double federal_redox;

	if (gross_income <= 55867.00) //First tax bracket
	{
		federal_redox = gross_income * 0.85;
	}

	else if (gross_income <= 111733.0 && gross_income > 55867.0) //Second tax bracket
	{
		federal_redox = first_temp + (gross_income - 55867.0) * 0.7995;
	}

	else if (gross_income <= 173205.0 && gross_income > 111733.0) //Third tax bracket
	{
		federal_redox = first_temp + second_temp + (gross_income - 111733.0) * 0.740;
	}

	else if (gross_income <= 246752.0 && gross_income > 173205.0) //Fourth tax bracket
	{
		federal_redox = first_temp + second_temp + third_temp + (gross_income - 173205.0) * 0.710;
	}

	else if (gross_income > 246752.0) //Highest tax bracket
	{
		federal_redox = first_temp + second_temp + third_temp + fourth_temp + (gross_income - 246752.0) * 0.670;
	}

	else //If the program doesn't detect any sort of income 
	{
		cout << "Error: Income not found" << endl;
		federal_redox = 0;
    }

    return federal_redox;
}

double provincialReductionBC(double gross_income) {
	double federal_redox = federalReduction(gross_income);

	// Define the income thresholds for each provincial tax bracket
	double bracket1_bc = 47937.0;
	double bracket2_bc = 95875.0;
	double bracket3_bc = 110076.0;
	double bracket4_bc = 133664.0;
	double bracket5_bc = 181232.0;
	double bracket6_bc = 252752.0;

	// Calculate the provincial net pay based on income and federal tax reduction
	double net_pay_bc;
	if (gross_income <= bracket1_bc) {
		net_pay_bc = federal_redox * 0.9494;
	}
	else if (gross_income <= bracket2_bc) {
		net_pay_bc = (federal_redox - bracket1_bc) * 0.923 + bracket1_bc * 0.9494;
	}
	else if (gross_income <= bracket3_bc) {
		net_pay_bc = (federal_redox - bracket2_bc) * 0.895 + bracket1_bc * 0.9494 + bracket2_bc * 0.923;
	}
	else if (gross_income <= bracket4_bc) {
		net_pay_bc = (federal_redox - bracket3_bc) * 0.8771 + bracket1_bc * 0.9494 + bracket2_bc * 0.923 + bracket3_bc * 0.895;
	}
	else if (gross_income <= bracket5_bc) {
		net_pay_bc = (federal_redox - bracket4_bc) * 0.853 + bracket1_bc * 0.9494 + bracket2_bc * 0.923 + bracket3_bc * 0.895 + bracket4_bc * 0.8771;
	}
	else {
		net_pay_bc = (federal_redox - bracket5_bc) * 0.832 + bracket1_bc * 0.9494 + bracket2_bc * 0.923 + bracket3_bc * 0.895 + bracket4_bc * 0.8771 + bracket5_bc * 0.853;
	}

	return net_pay_bc/4;
}

int main() 
{
    double gross_pay = 500000;
    double federal_tax_reduction = federalReduction(gross_pay);
    std::cout << "Federal tax reduction for an annual gross pay of " << gross_pay << " is " << federal_tax_reduction << std::endl;
	double total_tax_reduction = provincialReductionBC(gross_pay);
	std::cout << "Total tax reduction for an annual gross pay of " << gross_pay << " is " << total_tax_reduction << std::endl;

    return 0;
}