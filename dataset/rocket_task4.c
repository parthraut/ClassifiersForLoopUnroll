// #include <iostream>
// #include <fstream>
// #include <cmath>

double max_dist(double thrust, double v_e, double m_total, double m_payload)
{
    double v_final = 0.00000001, v_initial = 0.00000001, dt = 0.001, g, h_max = 0;
    double r_earth = 6356, c = 0.5, rho, a = 3.1415926 * pow(3.3, 2);
    // double v_escape;

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
        // v_escape = sqrt(2 * g * (h_max + r_earth));
        if (v_final > 0 && v_initial > v_final)
        {
            return 1;
        }
    }
    return h_max;
}

int main()
{
    // ifstream fin("init_opt.txt");
    double thrust = 35, v_e = 4, m_total = 0, m_payload = 500, v_final = 0.00000001, dt = 0.001, g, h_max = 2000;
    // fin >> thrust;
    // fin >> v_e;
    // fin >> m_payload;
    // fin.close();

    double x, ans;
    double range[2] = {0, 5000};
    x = 0.5 * (range[0] + range[1]);
    ans = max_dist(thrust, v_e, x, m_payload);
    while (ans < 0.998 * h_max || ans > 1.002 * h_max)
    {
        x = 0.5 * (range[0] + range[1]);
        ans = max_dist(thrust, v_e, x, m_payload);
        if (ans > h_max)
        {
            range[1] = x;
        }
        else
        {
            range[0] = x;
        }
        if (ans < 0 && x > 0.998 * range[1])
        {
            // cout << "Rocket too heavy" << endl;
            return 1;
        }
    }
    // cout.precision(3);
    // cout << x - m_payload << endl;
    return 0;
}