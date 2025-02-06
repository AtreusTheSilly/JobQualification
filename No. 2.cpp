#include <iostream>
#include <list>

int ascendingMax(std::list<int>::const_iterator begin, std::list<int>::const_iterator end)
{
	// ���������� ��� �������� �����
	int tempMax = 1;
	// ���������� ��� �������� ������������ �����
	int finMax = 1;

	// �������� �������� begin � ��� �� ������� ��� �� ���� ������� �����
	auto previous = begin++;

	while (begin != end)
	{
		if (*previous < *begin)
		{
			tempMax++;
		}
		else
		{
			finMax = (tempMax > finMax) ?
								tempMax :
								finMax;
			tempMax = 1;
		}

		previous++;
		begin++;
	}

	return (tempMax > finMax) ?
					  tempMax :
					  finMax;
}

int main()
{
	setlocale(LC_ALL, "Russian");

	std::list<int> const m1 = { 7,8,9,4,5,6,1,2,3,4 };
	std::list<int> const m2 = { -3,-2,-1,0,0,1,2,3,4,5 };

	std::cout << "��������� ��� 'm1': " << ascendingMax(m1.begin(), m1.end()) << std::endl;
	std::cout << "��������� ��� 'm2': " << ascendingMax(m2.begin(), m2.end()) << std::endl;
}