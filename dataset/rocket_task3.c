// #include <iostream>
// #include <fstream>
// #include <cmath>
using namespace std;

int main()
{
    // ifstream fin("init.txt");
    double thrust = 30, v_e = 4.5, m_total = 2000, m_payload = 100, v_final = 0.00000001, dt = 0.001, g, h_max = 0;
    double r_earth = 6356, c = 0.5, rho, a = 3.14159 * pow(3.3, 2);
    // fin >> thrust;
    // fin >> v_e;
    // fin >> m_total;
    // fin >> m_payload;
    // fin.close();
    double v_escape;

    for (int i = 0; v_final > 0; i++)
    {
        g = (3.962e5) / pow((h_max + r_earth), 2);
        rho = 1.225 * exp(-h_max / 9);
        if (m_total < m_payload)
        {
            v_final -= (g + ((1 / (2 * m_total)) * rho * c * a * pow(v_final, 2))) * dt;
        }
        else
        {
            v_final += ((thrust / m_total) - g - ((1 / (2 * m_total)) * rho * c * a * pow(v_final, 2))) * dt;
        }
        h_max += v_final * dt;
        m_total -= (thrust / v_e) * dt;
        v_escape = sqrt(2 * g * (h_max + r_earth));
        if (v_final > v_escape)
        {
            // cout << "Escape velocity reached" << endl;
            return 1;
        }
    }

    // cout.precision(3);
    // cout << h_max << endl;
    return 0;
}