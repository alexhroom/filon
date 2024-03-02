use extendr_api::prelude::*;
use extendr_api::Error;
use num_complex::Complex;
extern crate filon as filon_rs;

/// estimates the integral of a function multiplied by sin(mx)
/// over the interval a, b.
/// @param ftab The function to be integrated, tabulated over a mesh.
/// @param a The lower limit of integration.
/// @param b The upper limit of integration.
/// @param sin_coeff The coefficient of sin; 'm' in sin(mx)
/// @export
#[extendr(use_try_from = true)]
fn filon_tab_sin(ftab: Vec<f64>, a: f64, b: f64, sin_coeff: f64) -> Result<f64> {
    let ftab_cplx: Vec<Complex<f64>> = ftab.iter().map(|x: &f64| Complex::from(x)).collect();
    match filon_rs::filon_tab_sin(ftab_cplx, a, b, sin_coeff) {
        Ok(result) => Ok(result.re),
        Err(error) => Err(Error::from(error.to_string()))
    }
}

/// estimates the integral of a function multiplied by cos(mx)
/// over the interval a, b.
/// @param ftab The function to be integrated, tabulated over a mesh.
/// @param a The lower limit of integration.
/// @param b The upper limit of integration.
/// @param cos_coeff The coefficient of cos; 'm' in cos(mx)
/// @export
#[extendr(use_try_from = true)]
fn filon_tab_cos(ftab: Vec<f64>, a: f64, b: f64, cos_coeff: f64) -> Result<f64> {
    let ftab_cplx: Vec<Complex<f64>> = ftab.iter().map(|x: &f64| Complex::from(x)).collect();
    match filon_rs::filon_tab_cos(ftab_cplx, a, b, cos_coeff) {
        Ok(result) => Ok(result.re),
        Err(error) => Err(Error::from(error.to_string()))
    }
}

// Macro to generate exports.
// This ensures exported functions are registered with R.
// See corresponding C code in `entrypoint.c`.
extendr_module! {
    mod rfilon;
    fn filon_tab_sin;
    fn filon_tab_cos;
}
