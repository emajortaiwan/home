create_lessonTemplate <- function(){
  lessonTemplate <- vector("list",6)
  names(lessonTemplate) <-
    c("topic","description","date","downloadUrl","videoUrl","onlineUrl")
  lessonTemplate
}

writeLines(
  jsonlite::toJSON(list()),
  con="./course_info/courseList.json"
)

add_lesson <- function(newlesson, toFile="./course_info/courseList.json"){
  if(!file.exists("./course_info/courseList.json")){
    writeLines(
      jsonlite::toJSON(list()),
      con="./course_info/courseList.json"
    )
  }
  courseList ={ # obtain course list
    jsonlite::fromJSON(
      readLines(toFile),
      simplifyDataFrame = F
    )
  }
  newlessonComplete = { # create new lesson
    lessonTemplate <- vector("list",6)
    names(lessonTemplate) <-
      c("topic","description","date","downloadUrl","videoUrl","onlineUrl")
    newlessonComplete <- lessonTemplate
    newlessonComplete[names(newlesson)] <- newlesson
    newlessonComplete
  }
  updateCourseList ={ # update course list
    length(courseList) -> tot
    courseList[[tot+1]] <- newlessonComplete
    jsonlite::toJSON(courseList, auto_unbox = T) -> jsonOut
    writeLines(jsonOut,con=toFile)
    courseList
  }

}



# example -----------------------------------------------------------------

lesson1 <-
  list(
    topic="flexdashboard",
    description="",
    date=lubridate::today(),
    downloadUrl="https://www.dropbox.com/s/g468k1v9qeoj1uf/homeworkexhibition.zip?dl=1",
    videoUrl="https://vimeo.com/showcase/7098473/video/451916458",
    onlineUrl="https://hackmd.io/@fnik77ehTXKTYsEGmxLihA/B11UEyEXv"
  )

lesson2 <-
  list(
    topic="Knit and Twist: How to Inject Your JS in Rmd Properly",
    date=lubridate::today()
  )

add_lesson(lesson1)
add_lesson(lesson2)
