#' Filon quadrature for sine weights
#'
#' Estimates the integral of of f(x)sin(mx) over a, b, for a given `func` f(x).
#'
#' @param func The function f(x) over which to integrate.
#' @param a The lower limit of integration.
#' @param b The upper limit of integration.
#' @param num_points The number of datapoints at which the function is evaluated, including the endpoints. Must be an odd integer greater than 1.
#' @param sin_coeff The coefficient of the sine function in the integrand; `m` in 'sin(mx)'
#' @return The estimation of the integral of f(x)sin(mx) over a, b.
#' @export
filon_fun_sin <- function(func, a, b, num_points, sin_coeff){
    linspace <- unlist(seq(from = a, to = b, length.out = num_points))
    mesh <- unlist(lapply(linspace, func))
    return(filon_tab_sin(mesh, a, b, sin_coeff))
}

#' Filon quadrature for cosine weights
#'
#' Estimates the integral of of f(x)cos(mx) over a, b, for a given `func` f(x).
#'
#' @param func The function f(x) over which to integrate.
#' @param a The lower limit of integration.
#' @param b The upper limit of integration.
#' @param num_points The number of datapoints at which the function is evaluated, including the endpoints. Must be an odd integer greater than 1.
#' @param sin_coeff The coefficient of the cosine function in the integrand; `m` in 'cos(mx)'
#' @return The estimation of the integral of f(x)cos(mx) over a, b.
#' @export
filon_fun_cos <- function(func, a, b, num_points, cos_coeff){
    linspace <- seq(from = a, to = b, length.out = num_points)
    mesh <- unlist(lapply(linspace, func))
    return(filon_tab_cos(mesh, a, b, cos_coeff))
}

#' Filon quadrature for unit circle weights
#'
#' Estimates the integral of of f(x)exp(imx) over a, b, for a given `func` f(x).
#'
#' @param func The function f(x) over which to integrate.
#' @param a The lower limit of integration.
#' @param b The upper limit of integration.
#' @param num_points The number of datapoints at which the function is evaluated, including the endpoints. Must be an odd integer greater than 1.
#' @param exp_coeff The coefficient of the exponential function in the integrand; `m` in 'exp(imx)'
#' @return The estimation of the integral of f(x)exp(imx) over a, b.
#' @export
filon_fun_iexp <- function(func, a, b, num_points, exp_coeff){
    linspace <- unlist(seq(from = a, to = b, length.out = num_points))
    mesh <- unlist(lapply(linspace, func))
    return(complex(real = filon_tab_cos(mesh, a, b, exp_coeff), imaginary = filon_tab_sin(mesh, a, b, exp_coeff)))
}
