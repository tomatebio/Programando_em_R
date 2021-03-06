 # Returns TRUE if the user has calculated a value equal to that calculated by the given expression.
 calculates_same_value <- function(expr){
   e <- get("e", parent.frame())
   # Calculate what the user should have done.
   eSnap <- cleanEnv(e$snapshot)
   val <- eval(parse(text=expr), eSnap)
   passed <- isTRUE(all.equal(val, e$val))
   if(!passed)e$delta <- list()
   return(passed)
 }


 submit_log <- function(){
      yn <- select.list(c("Sim","Não"), graphics=FALSE)
      if(yn=="Não") {
         cat("Não será enviado")
         return(TRUE)  }

   cat("Preparando o envio ...\n")
   library(googlesheets4)
   suppressMessages(library(dplyr))

   # Do not edit the code below

   p <- function(x, p, f, l = length(x)){if(l < p){x <- c(x, rep(f, p - l))};x}

   temp <- tempfile()
   log_ <- getLog()
   nrow_ <- max(unlist(lapply(log_, length)))
   log_tbl <- data.frame(user = rep(log_$user, nrow_),
                         course_name = rep(log_$course_name, nrow_),
                         lesson_name = rep(log_$lesson_name, nrow_),
                         question_number = p(log_$question_number, nrow_, NA),
                         correct = p(log_$correct, nrow_, NA),
                         attempt = p(log_$attempt, nrow_, NA),
                         skipped = p(log_$skipped, nrow_, NA),
                         datetime = p(log_$datetime, nrow_, NA),
                         stringsAsFactors = FALSE)
   write.csv(log_tbl, file = temp, row.names = FALSE)
   encoded_log <- base64encode(temp)
     #browseURL(paste0(pre_fill_link, encoded_log))


   #  answer
   input<-data.frame(Sys.time(),encoded_log)
   sheet_append(input, ss=chave, sheet = "Respostas")
    return(TRUE)

 }
