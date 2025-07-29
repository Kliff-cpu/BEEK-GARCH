jse_close_prices <- read.csv("~/Risk_Assignment/jse_close_prices.csv")
View(jse_close_prices)
returns_matrix <- as.matrix(jse_close_prices[ , -1])
log_returns <- diff(log(returns_matrix))
log_returns <- na.omit(log_returns)
View(log_returns)


library(zoo)
library(MTS)
library(xts)
 
log_returns = scale(log_returns)
View(log_returns)
x = BEKK11(coredata(log_returns))
summary(x)

n_assets <- ncol(log_returns)
T_obs <- nrow(log_returns)

Ht_array <- array(x$Sigma.t, dim = c(n_assets, n_assets, T_obs))

dim(Ht_array)

var_agl <- Ht_array[1, 1, ]
var_bid <- Ht_array[2, 2, ]
var_cpi <- Ht_array[3, 3, ]

time_index <- index(log_returns)
# exclude first row due to lag

par(mfrow = c(1, 3))

plot(time_index, var_agl, type = 'l', col = 'blue', ylab = 'Conditional Variance', main = 'Conditional Variance: AGL.JO')
plot(time_index, var_bid, type = 'l', col = 'orange', ylab = 'Conditional Variance', main = 'Conditional Variance: BID.JO')
plot(time_index, var_cpi, type = 'l', col = 'darkgreen', ylab = 'Conditional Variance', main = 'Conditional Variance: CPI.JO')
#par(mfrow = c(1, 3))
cov_agl_bid <- Ht_array[1, 2, ]
plot(time_index, cov_agl_bid, type = 'l', col = 'purple', main = 'Cov: AGL & BID')

cov_agl_cpi <- Ht_array[1, 3, ]
plot(time_index, cov_agl_cpi, type = 'l', col = 'red', main = 'Cov: AGL & CPI')

cov_bid_cpi <- Ht_array[2, 3, ]
plot(time_index, cov_bid_cpi, type = 'l', col = 'brown', main = 'Cov: BID & CPI')


w <- matrix(c(1/3, 1/3, 1/3), ncol = 1)

T <- dim(Ht_array)[3]

portfolio_var <- numeric(T)

for (t in 1:T) {
  Ht <- Ht_array[, , t]
  portfolio_var[t] <- t(w) %*% Ht %*% w
}

# Convert to volatility
portfolio_vol <- sqrt(portfolio_var)
portfolio_vol <- sqrt(pmax(portfolio_var, 0))

# Create matching time index
time_index <- index(log_returns)  # Remove first date due to BEKK lag
par(mfrow = c(1, 1))
# Plot
plot(time_index, portfolio_vol, type = "l", col = "darkgreen",
     main = "Portfolio Conditional Volatility",
     ylab = "Volatility", xlab = "Time")

