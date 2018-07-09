

# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Retrieve the log from swirl's state
getLog <- function(){
  getState()$log
}



notify <- function() {
  e <- get("e", parent.frame())
  if(e$val == "No") return(TRUE)
  
  good <- FALSE
  while(!good) {
    # Get info
    name <- readline_clean("Qual é o seu nome completo? ")
    address <- readline_clean("Qual é o endereço de email da pessoa que você gostaria de notificar? ")
    
    # Repeat back to them
    message("\nTá tudo direitinho?\n")
    message("Seu nome: ", name, "\n", "Enviar para: ", address)
    
    yn <- select.list(c("Sim", "Não"), graphics = FALSE)
    if(yn == "Sim") good <- TRUE
  }
  
  # Get course and lesson names
  course_name <- attr(e$les, "course_name")
  lesson_name <- attr(e$les, "lesson_name")
  
  subject <- paste(name, "recém completou", course_name, "-", lesson_name)
  body = ""
  
  # Send email
  swirl:::email(address, subject, body)
  
  hrule()
  message("Tentei criar um novo email com as seguintes informações:\n")
  message("Para: ", address)
  message("Assunto: ", subject)
  message("Body: <empty>")
  
  message("\nSe não funcionou, você pode enviar o mesmo email manualmente.")
  hrule()
  
  # Return TRUE to satisfy swirl and return to course menu
  TRUE
}

readline_clean <- function(prompt = "") {
  wrapped <- strwrap(prompt, width = getOption("width") - 2)
  mes <- stringr::str_c("| ", wrapped, collapse = "\n")
  message(mes)
  readline()
}

hrule <- function() {
  message("\n", paste0(rep("#", getOption("width") - 2), collapse = ""), "\n")
}


# Retrieve the log from swirl's state
getLog <- function(){
  getState()$log
}

submit_log <- function(){
  library(googlesheets)
  suppressMessages(library(dplyr))
  # Please edit the link below
  answer<-gs_key("1bkrQ8_-2kbR4-Hrk5t0nWOeX1tzC6Nayxkmk_jfVL0Q")
  
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

    answer<- answer %>%
        gs_add_row(input=data.frame(Sys.time(),encoded_log))
        bye()
    
}
