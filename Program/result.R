library(ggplot2)

#1 number worker testse
test1 <- function(){
  result.df1 <<- onevar.df("test1.csv")
  xplot(result.df1)
}

#2 worker probability test (mv)(normal)
test2 <- function(){
  result.df2 <<- onevar.df("test2.csv")
  xplot(result.df2)
}

test2.1 <- function(){
  result.df2.1 <<- onevar.df("test2.1.csv")
  xplot(result.df2.1)
}

#3 worker probability test (em)(normal)
test3 <- function(){
  result.df3 <<- onevar.df("test3.csv")
  result.df3 <<- enlarge(result.df3)
  
  xplot(result.df3)
}

enlarge <- function(df){
  row <- nrow(df)
  for(i in 1:(row - 1)){
    start <- df[i,1]
    end <- df[i+1,1] 
    
    size <- (end-start)
    value <- seq(df[i,2], df[i+1,2], length.out = size + 1)
    
    for(ii in 2:size){
      df <- rbind(df, c(start + ii - 1,value[ii]))
    }
  }
  df <- df[with(df, order(df[,1])), ]
  df
}

#4 worker probability test (mv)(random)
test4 <- function(){
  result.df4 <<- onevar.df("test4.csv")
  xplot(result.df4)
}

#5 worker probability test (mv)(soft)(normal)
test5 <- function(){
  #result.df5 <<- twovar.df("test5.csv")
  result.df5 <<- twovar2.df("test5.csv","test5plus.csv")
  temp <- result.df5
  result.df5[temp$cut.workers.per.round == 0,"cut.workers.per.round"] <<- "0%"
  result.df5[temp$cut.workers.per.round > 0 
                                   & temp$cut.workers.per.round <= 25,"cut.workers.per.round"] <<- "1-25%"
  result.df5[temp$cut.workers.per.round > 25 
             & temp$cut.workers.per.round <= 50,"cut.workers.per.round"] <<- "25-50%"
  
  result.df5 <<- aggregate(correctness ~ .,data = result.df5, mean)
  result.df5$cut.workers.per.round <- factor(result.df5$cut.workers.per.round)
  
  plot <- x2plot(result.df5)
  plot + ggtitle("Performance of Majority Voting with Soft Penalty")
}

test5soft <- function(){
  result.df5soft <<- onevar.df("test5soft.csv")
  
  result.df5soft <<- aggregate(correctness ~ .,data = result.df5soft, mean)
  
  plot <- xplot(result.df5soft)
  plot + ggtitle("Performance of Majority Voting with Soft Penalty")
}

test5hard <- function(){
  result.df5hard <<- onevar.df("test5hard.csv")

  result.df5hard <<- aggregate(correctness ~ .,data = result.df5hard, mean)
  
  plot <- xplot(result.df5hard)
  plot + ggtitle("Performance of Majority Voting with Hard Penalty")
}

test6soft <- function(){
  result.df6soft <<- onevar.df("test6soft.csv")
  
  result.df6soft <<- aggregate(correctness ~ .,data = result.df6soft, mean)
  
  plot <- xplot(result.df6soft)
  plot + ggtitle("Performance of Majority Voting with Soft Penalty")
}

test6hard <- function(){
  result.df6hard <<- onevar.df("test6hard.csv")
  
  result.df6hard <<- aggregate(correctness ~ .,data = result.df6hard, mean)
  
  plot <- xplot(result.df6hard)
  plot + ggtitle("Performance of Majority Voting with Soft Penalty")
}



#6 worker probability test (em)(soft)(normal)
test6 <- function(){
  result.df6 <<- twovar.df("test6.csv")
  #result.df6 <<- twovar2.df("test6.csv","test6plus.csv")
  temp <- result.df6

  result.df6[temp$cut.workers.per.round == 0,"cut.workers.per.round"] <<- "0%"
  result.df6[temp$cut.workers.per.round > 0 
             & temp$cut.workers.per.round <= 25,"cut.workers.per.round"] <<- "1-25%"
  result.df6[temp$cut.workers.per.round > 25 
             & temp$cut.workers.per.round <= 50,"cut.workers.per.round"] <<- "25-50%"
  
  result.df6 <<- aggregate(correctness ~ .,data = result.df6, mean)
  result.df6$cut.workers.per.round <- factor(result.df6$cut.workers.per.round)
  
  plot <- x2plot(result.df6)
  plot + ggtitle("Performance of EM Algorithm with Soft Penalty")
}

#7 mv adversaries type 3
test7 <- function(){
  result.df7 <<- twovar.df("test7.csv")
  result.df7$workers.probability <- factor(result.df7$workers.probability)
  
  x2plot(result.df7) + ggtitle("Performance of Majority Voting with Adversaries Type 3")
}

#8 mv adversaries type 2
test8 <- function(){
  result.df8 <<- twovar.df("test8.csv")
  result.df8$workers.probability <- factor(result.df8$workers.probability)
  
  x2plot(result.df8) + ggtitle("Performance of Majority Voting with Adversaries Type 2")
}

#9 mv adversaries type 1 normal
test9 <- function(){
  result.df9 <<- twovar.df("test9.csv")
  result.df9$workers.probability <- factor(result.df9$workers.probability)

  x2plot(result.df9) + ggtitle("Performance of Majority Voting with Adversaries Type 1")
}

#9 mv adversaries type 1 random
test9.1 <- function(){
  result.df9.1 <<- twovar.df("test9.1.csv")
  result.df9.1$workers.probability <- factor(result.df9.1$workers.probability)
  
  x2plot(result.df9.1) + ggtitle("Performance of Majority Voting with Adversaries Type 1")
}

#10 em adversaries type 3
test10 <- function(){
  result.df10 <<- twovar.df("test10.csv")
  result.df10$workers.probability <- factor(result.df10$workers.probability)
  
  x2plot(result.df10)
}

#11 em adversaries type 2
test11 <- function(){
  result.df11 <<- twovar.df("test11.csv")
  result.df11$workers.probability <- factor(result.df11$workers.probability)
  
  x2plot(result.df11)
}

#12 em adversaries type 1
test12 <- function(){
  result.df12 <<- twovar.df("test12.csv")
  result.df12$workers.probability <- factor(result.df12$workers.probability)
  
  x2plot(result.df12)
}

#13 mv adversaries type 3 soft
test13 <- function(){
  result.df13 <<- threevar.df("test13.csv")
  
  temp <- result.df13
  result.df13[temp$cut.workers.per.round == 0 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "0%, worker-prob 50%"
  result.df13[temp$cut.workers.per.round == 0 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "0%, worker-prob 100%"
  result.df13[temp$cut.workers.per.round == 25 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "25%, worker-prob 50%"
  result.df13[temp$cut.workers.per.round == 25 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "25%, worker-prob 100%"
  result.df13[temp$cut.workers.per.round == 50 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "50%, worker-prob 50%"
  result.df13[temp$cut.workers.per.round == 50 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "50%, worker-prob 100%"
  
  result.df13 <<- result.df13[,c(3,2,4)]
  result.df13 <<- aggregate(correctness ~ .,data = result.df13, mean)
  
  result.df13$cut.workers.per.round <- factor(result.df13$cut.workers.per.round)
  
  plot <- x2plot(result.df13) + ggtitle("Performance of Majority Voting with Soft Penalty and Adversaries Type 3")
  
  plot + scale_colour_manual(values = c("#f9007c", "#ffa2d0", "#0ca3ff", "#86d1ff", "#00d00e", "#82ff8a")) 
}

#14 mv adversaries type 2 soft
test14 <- function(){
  result.df14 <<- threevar.df("test14.csv")
  
  temp <- result.df14
  result.df14[temp$cut.workers.per.round == 0 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "0%, worker-prob 50"
  result.df14[temp$cut.workers.per.round == 0 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "0%, worker-prob 100"
  result.df14[temp$cut.workers.per.round == 25 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "25%, worker-prob 50"
  result.df14[temp$cut.workers.per.round == 25 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "25%, worker-prob 100"
  result.df14[temp$cut.workers.per.round == 50 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "50%, worker-prob 50"
  result.df14[temp$cut.workers.per.round == 50 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "50%, worker-prob 100"
  
  result.df14 <<- result.df14[,c(3,2,4)]
  result.df14 <<- aggregate(correctness ~ .,data = result.df14, mean)
  
  result.df14$cut.workers.per.round <- factor(result.df14$cut.workers.per.round)
  
  plot <- x2plot(result.df14) + ggtitle("Performance of Majority Voting with Soft Penalty and Adversaries Type 2")
  
  
  plot + scale_colour_manual(values = c("#f9007c", "#ffa2d0", "#0ca3ff", "#86d1ff", "#00d00e", "#82ff8a")) 
}

#15 mv adversaries type 2 soft
test15 <- function(){
  result.df15 <<- threevar.df("test15.csv")
  
  temp <- result.df15
  result.df15[temp$cut.workers.per.round == 0 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "0%, worker-prob 50"
  result.df15[temp$cut.workers.per.round == 0 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "0%, worker-prob 100"
  result.df15[temp$cut.workers.per.round == 25 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "25%, worker-prob 50"
  result.df15[temp$cut.workers.per.round == 25 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "25%, worker-prob 100"
  result.df15[temp$cut.workers.per.round == 50 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "50%, worker-prob 50"
  result.df15[temp$cut.workers.per.round == 50 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "50%, worker-prob 100"
  
  result.df15 <<- result.df15[,c(3,2,4)]
  result.df15 <<- aggregate(correctness ~ .,data = result.df15, mean)
  
  result.df15$cut.workers.per.round <- factor(result.df15$cut.workers.per.round)
  
  plot <- x2plot(result.df15) + ggtitle("Performance of Majority Voting with Soft Penalty and Adversaries Type 1")
  
  plot + scale_colour_manual(values = c("#f9007c", "#ffa2d0", "#0ca3ff", "#86d1ff", "#00d00e", "#82ff8a")) 
}

#16 em adversaries type 3 soft
test16 <- function(){
  result.df16 <<- threevar.df("test16.csv")
  
  temp <- result.df16
  result.df16[temp$cut.workers.per.round == 0 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "0%, worker-prob 50"
  result.df16[temp$cut.workers.per.round == 0 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "0%, worker-prob 100"
  result.df16[temp$cut.workers.per.round == 25 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "25%, worker-prob 50"
  result.df16[temp$cut.workers.per.round == 25 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "25%, worker-prob 100"
  result.df16[temp$cut.workers.per.round == 50 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "50%, worker-prob 50"
  result.df16[temp$cut.workers.per.round == 50 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "50%, worker-prob 100"
  
  result.df16 <<- result.df16[,c(3,2,4)]
  result.df16 <<- aggregate(correctness ~ .,data = result.df16, mean)
  
  result.df16$cut.workers.per.round <- factor(result.df16$cut.workers.per.round)
  
  plot <- x2plot(result.df16) + ggtitle("Performance of EM Algorithm with Soft Penalty and Adversaries Type 3")
  
  plot + scale_colour_manual(values = c("#f9007c", "#ffa2d0", "#0ca3ff", "#86d1ff", "#00d00e", "#82ff8a")) 
}

#17 em adversaries type 3 soft
test17 <- function(){
  result.df17 <<- threevar.df("test17.csv")
  
  temp <- result.df17
  result.df17[temp$cut.workers.per.round == 0 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "0%, worker-prob 50"
  result.df17[temp$cut.workers.per.round == 0 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "0%, worker-prob 100"
  result.df17[temp$cut.workers.per.round == 25 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "25%, worker-prob 50"
  result.df17[temp$cut.workers.per.round == 25 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "25%, worker-prob 100"
  result.df17[temp$cut.workers.per.round == 50 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "50%, worker-prob 50"
  result.df17[temp$cut.workers.per.round == 50 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "50%, worker-prob 100"
  
  result.df17 <<- result.df17[,c(3,2,4)]
  result.df17 <<- aggregate(correctness ~ .,data = result.df17, mean)
  
  result.df17$cut.workers.per.round <- factor(result.df17$cut.workers.per.round)
  
  plot <- x2plot(result.df17)+ ggtitle("Performance of EM Algorithm with Soft Penalty and Adversaries Type 2")
  
  plot + scale_colour_manual(values = c("#f9007c", "#ffa2d0", "#0ca3ff", "#86d1ff", "#00d00e", "#82ff8a")) 
}

#18 em adversaries type 3 soft
test18 <- function(){
  result.df18 <<- threevar.df("test18.csv")
  
  temp <- result.df18
  result.df18[temp$cut.workers.per.round == 0 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "0%, worker-prob 50"
  result.df18[temp$cut.workers.per.round == 0 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "0%, worker-prob 100"
  result.df18[temp$cut.workers.per.round == 25 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "25%, worker-prob 50"
  result.df18[temp$cut.workers.per.round == 25 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "25%, worker-prob 100"
  result.df18[temp$cut.workers.per.round == 50 & temp$workers.probability == 50
              ,"cut.workers.per.round"] <<- "50%, worker-prob 50"
  result.df18[temp$cut.workers.per.round == 50 & temp$workers.probability == 100
              ,"cut.workers.per.round"] <<- "50%, worker-prob 100"
  
  result.df18 <<- result.df18[,c(3,2,4)]
  result.df18 <<- aggregate(correctness ~ .,data = result.df18, mean)
  
  result.df18$cut.workers.per.round <- factor(result.df18$cut.workers.per.round)
  
  plot <- x2plot(result.df18)+ ggtitle("Performance of EM Algorithm with Soft Penalty and Adversaries Type 1
                                       ")
  
  
  plot + scale_colour_manual(values = c("#f9007c", "#ffa2d0", "#0ca3ff", "#86d1ff", "#00d00e", "#82ff8a")) 
}

#s1 MV vs EM normal (no penalty)
s1 <- function(){
  plot <- nlineplot(list(result.df2, result.df3),list("MV","EM"),"Data.Fusion")
  plot + ggtitle("Performance between Majority Voting and EM Algorithm with Normal Workers")
}

s1diff <- function(){
  result <- rep(0,100)
  result[30:70] <- result.df3[,2] - result.df2[30:70,2]
  qplot(x = 1:100, y = result, geom = "blank") + geom_point(colour = "grey") + 
    geom_smooth(se = FALSE, span = 0.2, size = 1.2, colour = "#061954") + 
   theme_bw() + xlab("Workers Probability") + ylab("Different Correctness") +
    ggtitle("Different Correctness of EM Algorithm and Majority Voting")
}

#s2 MV vs EM type 3 (no penalty)
s2 <- function(){
  plot <- nlineplot(list(result.df7[result.df7$workers.probability == 50,],
                 result.df7[result.df7$workers.probability == 100,],
                 result.df10[result.df10$workers.probability == 50,],
                 result.df10[result.df10$workers.probability == 100,]),
                 list("MV worker-prob 50%","MV worker-prob 100%","EM worker-prob 50%","EM worker-prob 100%"),"Data.Fusion")
  plot + scale_colour_manual(values = c("#f9007c", "#ffa2d0", "#0ca3ff", "#86d1ff")) +
     ggtitle("Performance between Majority Voting and EM Algorithm with Adversaries Type 3")
}

s2diff <- function(){
  result <- rep(0,100)
  result <- result.df7[102:202,3] - result.df10[12:22,3]
  qplot(x = 1:100, y = result, geom = "blank") + geom_point(colour = "grey") + 
    geom_smooth(se = FALSE, span = 0.2, size = 1.2, colour = "#061954") + 
    theme_bw() + xlab("Workers Probability") + ylab("Different Correctness") +
    ggtitle("Different Correctness of EM Algorithm and Majority Voting")
}

#s3 MV vs EM type 2 (no penalty)
s3 <- function(){
  plot <- nlineplot(list(result.df8[result.df8$workers.probability == 50,],
                 result.df8[result.df8$workers.probability == 100,],
                 result.df11[result.df11$workers.probability == 50,],
                 result.df11[result.df11$workers.probability == 100,]),
            list("MV worker-prob 50","MV worker-prob 100","EM worker-prob 50","EM worker-prob 100"),"Data.Fusion")
  plot + scale_colour_manual(values = c("#f9007c", "#ffa2d0", "#0ca3ff", "#86d1ff")) +
    ggtitle("Performance between Majority Voting and EM Algorithm with Adversaries Type 2") 
}

#s4 MV vs EM type 1 (no penalty)
s4 <- function(){
  plot <- nlineplot(list(result.df9.1[result.df9.1$workers.probability == 50,],
                 result.df9.1[result.df9.1$workers.probability == 100,],
                 result.df12[result.df12$workers.probability == 50,],
                 result.df12[result.df12$workers.probability == 100,]),
                 list("MV worker-prob 50","MV worker-prob 100","EM worker-prob 50","EM worker-prob 100"),"Data.Fusion")
  
  
  plot + scale_colour_manual(values = c("#f9007c", "#ffa2d0", "#0ca3ff", "#86d1ff"))  +
    ggtitle("Performance between Majority Voting and EM Algorithm with Adversaries Type 1")  
}

#ss1 MV vs vs MV Soft vs MV Hard normal (no penalty)
ss1 <- function(){
  plot <- nlineplot(list(result.df2, result.df5hard, result.df5soft),list("MV","MV Hard","MV Soft"),"Data.Fusion")
  plot + ggtitle("Performance between Majority Voting and Hard Soft with Normal Workers")
}

ss1diff <- function(){
  df <- data.frame()
  
  result <- rep(0,100)
  result <- result.df2[,2] - result.df5soft[,2]
  df <- rbind(df,setNames(data.frame(0:100, result, rep("MV Soft",101)),names(df)) )
  
  result <- rep(0,100)
  result <- result.df2[,2] - result.df5hard[,2]
  df <- rbind(df,setNames(data.frame(0:100, result, rep("MV Hard",101)),names(df)) )
  
  result <- rep(0,100)
  result <- result.df2[,2] - result.df6soft[,2]
  df <- rbind(df,setNames(data.frame(0:100, result, rep("EM Soft",101)),names(df)) )
  
  result <- rep(0,100)
  result <- result.df2[,2] - result.df6hard[,2]
  df <- rbind(df,setNames(data.frame(0:100, result, rep("EM Hard",101)),names(df)) )
  
  colnames(df) <- c("worker.prob","correctness","set")
  
  
  ggplot(data = df, aes(x = df[,1], y = df[,2], colour = set)) + geom_point(size = 0.3) + 
    stat_smooth(se = FALSE, span = 0.3, size = 1.2, aes(fill = set)) + 
    theme_bw() + xlab("Workers Probability") + ylab("Different Correctness") +
    ggtitle("Different Correctness of Majority Voting with Reputation Algorithm")
}

onevar.df <- function(file){
  df <- read.csv(paste("test",file,sep = "/"), skip = 6)
  df <- df[, c(2,length(df))]
  colnames(df)[2] <- "correctness" 
  
  df <- aggregate(correctness ~ .,data = df, mean)
  df 
}

twovar.df <- function(file){
  df <- read.csv(paste("test",file,sep = "/"), skip = 6)
  df <- df[, c(2:3,length(df))]
  colnames(df)[3] <- "correctness" 
  df <- aggregate(correctness ~ .,data = df, mean)
  
  df 
}

twovar2.df <- function(file,file2){
  df <- read.csv(paste("test",file,sep = "/"), skip = 6)
  df <- rbind(df,  df <- read.csv(paste("test",file2,sep = "/"), skip = 6))
  df <- df[, c(2:3,length(df))]
  colnames(df)[3] <- "correctness" 
  df <- aggregate(correctness ~ .,data = df, mean)
  
  df 
}

threevar.df <- function(file){
  df <- read.csv(paste("test",file,sep = "/"), skip = 6)
  df <- df[, c(2:4,length(df))]
  colnames(df)[4] <- "correctness" 
  df <- aggregate(correctness ~ .,data = df, mean)
  
  df 
}

xplot <- function(df){
  ggplot(data = df, aes_string(x = colnames(df)[1], y = "correctness")) +
    geom_line(size=1.2) + ggtitle("Average Correctness Plot") + ylim(0,100)
}

x2plot <- function(df){
  ggplot(data = df, aes_string(x = colnames(df)[1], y = "correctness",
                                group = colnames(df)[2], colour= colnames(df)[2])) + 
    geom_line(size=1.2) + ylim(0,100)
}

nlineplot <- function(list.df,list.name,legend.name = "set", title = "Plot"){
  df <- do.call(rbind, list.df)
  
  temp <- c()
  for(i in 1:length(list.df)){
    temp <- c(temp, rep(list.name[[i]], nrow(list.df[[i]])))
  }
  
  df[,legend.name] <- temp

  ggplot(data = df, aes_string(x = colnames(df)[1], y = "correctness",group = legend.name, color = legend.name)) + 
    geom_line(size=1.2) +
    ggtitle(title) + ylim(0,100)
}

diffchange <- function(df){
  diff <- aggregate(correctness ~ cut.workers.per.round ,data = df, mean)
  diff$change <- round(diff$correctness - diff$correctness[1], 5)
  
  View(diff)
}

diffchange1 <- function(df){
  diff <- aggregate(correctness ~ cut.workers.per.round ,data = df, mean)
  diff <- diff[c(1,3,5),]
  diff$change <- round(diff$correctness - diff$correctness[1], 5)
  
  View(diff)
}

diffchange2 <- function(df){
  diff <- aggregate(correctness ~ cut.workers.per.round ,data = df, mean)
  diff <- diff[c(2,4,6),]
  diff$change <- round(diff$correctness - diff$correctness[1], 5)
  
  View(diff)
}

cutcheck <- function(){
  cut <- onevar.df("newcut0.csv")
  ggplot(cut, aes(x = cut[,1], y = cut[,2])) + geom_smooth(se = FALSE, colour="black") + 
    theme_bw() + xlab("Percent of cut workers") + ylab("Correctness") +
    geom_abline(intercept = cut[1,2], slope = 0, colour = "green", size = 1.2) +
    scale_x_discrete(breaks = 1:20) + ggtitle("Correctness by Percent of Cut Workers")
}

cut1check <- function(){
  cut <- onevar.df("newcut1.csv")
  ggplot(cut, aes(x = cut[,1], y = cut[,2])) + geom_smooth(se = FALSE, colour="black") + 
    theme_bw() + xlab("Percent of cut workers") + ylab("Correctness") +
    geom_abline(intercept = cut[1,2], slope = 0, colour = "green", size = 1.2) +
    scale_x_discrete(breaks = 1:20) + ggtitle("Correctness by Percent of Cut Workers")
}