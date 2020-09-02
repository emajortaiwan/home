newlesson <- emajorDV::create_lessonTemplate()
newlesson$topic <- "在Rmd knit的html插入Javascript"
newlesson$description <- "過去我們在Chrome裡對Rmd的html output進行javascript的測試，然而有時在Chrome可以成功的效果，等到加入Rmd的after_body設定時效果卻出不來。emajorDV的webService模組可以解決這問題。"
newlesson$date <- "2020-09-01"
newlesson$onlineUrl <- "https://hackmd.io/@fnik77ehTXKTYsEGmxLihA/B1L9P8smv/edit"
newlesson$downloadUrl <- list(
  list(link="https://www.dropbox.com/s/lh2jdvv5623yn8p/storyboard.zip?dl=1",
  zip=T)
)
library(emajorDV)
add_lesson(newlesson)
