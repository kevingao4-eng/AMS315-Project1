# Load required libraries
library(mice)
library(knitr)
library(remotes)
library(alr3)

### --------------------
### Part A
### --------------------

PartA_IV <- read.csv("Project1_PartA_Data/785838_IV.csv", header = TRUE)
PartA_DV <- read.csv("Project1_PartA_Data/785838_DV.csv", header = TRUE)

PartA <- merge(PartA_IV, PartA_DV, by = "ID", all = TRUE)
str(PartA)

any(is.na(PartA[,2]))
any(is.na(PartA[,3]))

PartA_incomplete <- PartA
md.pattern(PartA_incomplete[, c("ID", "IV", "DV")])

PartA_imp <- PartA[!is.na(PartA$IV) | !is.na(PartA$DV), ]
imp <- mice(PartA_imp, method = "norm.boot", printFlag = FALSE)
PartA_complete <- complete(imp)

md.pattern(PartA_complete)

M <- lm(DV ~ IV, data = PartA_complete)
summary(M)

kable(anova(M), caption = "ANOVA Table")

plot(PartA_complete$DV ~ PartA_complete$IV,
     main = "Scatter: DV ~ IV",
     xlab = "IV",
     ylab = "DV",
     pch = 20)

abline(M, col = "red", lty = 3, lwd = 2)
legend("topleft", legend = "Estimated Regression Line",
       lty = 3, lwd = 2, col = "red")

confint(M, level = 0.95)
confint(M, level = 0.99)

### --------------------
### Part B
### --------------------

data <- read.csv("Project1_PartB_Data/785838_partB.csv", header = TRUE)
str(data)

plot(data$x, data$y, pch = 19, main = "Scatter: y ~ x")

M0 <- lm(y ~ x, data = data)
plot(fitted(M0), resid(M0), pch = 19,
     main = "Residuals vs Fitted")
abline(h = 0)

data_trans <- data.frame(
  xtrans = data$x,
  ytrans = data$y^(-2/3)
)

groups <- cut(
  data_trans$xtrans,
  breaks = quantile(data_trans$xtrans, probs = seq(0, 1, by = 0.1)),
  include.lowest = TRUE
)

table(groups)

x <- ave(data_trans$xtrans, groups)
data_bin <- data.frame(x = x, y = data_trans$ytrans)

fit_b <- lm(y ~ x, data = data_bin)

anova(
  lm(ytrans ~ xtrans, data = data_trans),
  lm(ytrans ~ as.factor(groups), data = data_trans)
)

summary(fit_b)$r.squared
pureErrorAnova(fit_b)