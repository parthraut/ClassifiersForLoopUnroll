// #include <iostream>
// #include <fstream>
// #include <cmath>
using namespace std;

int main()
{
    // ifstream fin("init.txt");
    double thrust = 35, v_e = 4, m_total = 3000, m_payload = 250, v_final = 0, dt = 0.001;
    // fin >> thrust;
    // fin >> v_e;
    // fin >> m_total;
    // fin >> m_payload;
    // fin.close();

    // Solve rocket equation to use as a check
    // double check = -v_e*log(m_payload/m_total);

    // Iterates through Euler equations to solve for v_final
    for (int i = 0; m_total > m_payload; i++)
    {
        v_final += (thrust / m_total) * dt;
        m_total -= (thrust / v_e) * dt;
    }

    // cout.precision(3);
    // cout << v_final << endl;
    // cout << check << endl;
    return 0;
}