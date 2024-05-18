# filon
Implementation of Filon quadrature in Rust.

The Filon quadrature is a quadrature for highly oscillatory
integrals, such as $\int_a^b f(x) sin(mx)$ or $\int_a^b f(x) cos(mx)$.

See also a Python frontend for this code in [pyfilon](https://github.com/alexhroom/pyfilon)


This code ports [John Burkardt's implementation of Filon quadrature](https://people.math.sc.edu/Burkardt/cpp_src/filon/filon.html),
based on Chase and Fosdick's algorithm in the ACM, [available on Netlib as TOMS 353](https://netlib.org/toms/index.html).
