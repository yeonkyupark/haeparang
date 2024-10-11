library(shiny)
library(DT)
library(dplyr)

table_course <- tibble::tribble(
                  ~지역,                  ~코스명,      ~길이,       ~시간,  ~난이도,
              "부산 남구",            "해파랑길 1코스", "16.9km", "6시간 30분",  "보통",
            "부산 해운대구",            "해파랑길 2코스",   "14km",     "5시간",  "쉬움",
             "부산 기장군",            "해파랑길 3코스", "16.7km",     "6시간",  "보통",
             "울산 울주군",            "해파랑길 4코스", "19.6km", "7시간 30분",  "보통",
             "울산 울주군",            "해파랑길 5코스", "17.7km",     "6시간",  "쉬움",
              "울산 남구",            "해파랑길 6코스", "15.7km", "6시간 30분", "어려움",
              "울산 남구",            "해파랑길 7코스", "17.3km",     "6시간",  "쉬움",
              "울산 북구",            "해파랑길 8코스", "12.4km", "4시간 30분",  "보통",
              "울산 동구",            "해파랑길 9코스",   "19km",     "7시간",  "보통",
             "경북 경주시",           "해파랑길 10코스",   "13km", "4시간 30분",  "보통",
             "경북 경주시",           "해파랑길 11코스", "17.2km", "6시간 30분",  "보통",
             "경북 경주시",           "해파랑길 12코스", "13.3km",     "5시간",  "보통",
             "경북 포항시",           "해파랑길 13코스", "19.9km", "6시간 30분",  "쉬움",
             "경북 포항시",           "해파랑길 14코스", "14.2km", "4시간 30분",  "쉬움",
             "경북 포항시",           "해파랑길 15코스",   "13km",     "5시간",  "보통",
             "경북 포항시",           "해파랑길 16코스",   "19km", "6시간 30분",  "보통",
             "경북 포항시",           "해파랑길 17코스", "18.3km", "6시간 30분",  "보통",
             "경북 포항시",           "해파랑길 18코스", "18.9km", "6시간 30분",  "쉬움",
             "경북 영덕군", "해파랑길 19코스 영덕 블루로드 D", "15.7km",     "6시간",  "쉬움",
             "경북 영덕군", "해파랑길 20코스 영덕 블루로드 A", "10.6km",     "4시간",  "보통",
             "경북 영덕군", "해파랑길 21코스 영덕 블루로드 B", "12.7km",     "5시간",  "보통",
             "경북 영덕군", "해파랑길 22코스 영덕 블루로드 C", "16.1km", "6시간 30분", "어려움",
             "경북 영덕군",           "해파랑길 23코스", "11.6km",     "4시간",  "쉬움",
             "경북 울진군",           "해파랑길 24코스", "18.4km", "6시간 30분",  "보통",
             "경북 울진군",           "해파랑길 25코스", "23.3km", "8시간 30분",  "보통",
             "경북 울진군",           "해파랑길 26코스", "12.7km",     "5시간",  "쉬움",
             "경북 울진군",           "해파랑길 27코스", "11.5km",     "4시간",  "보통",
             "경북 울진군",           "해파랑길 28코스", "10.9km", "4시간 30분",  "보통",
             "강원 삼척시",           "해파랑길 29코스", "18.3km", "7시간 30분",  "보통",
             "강원 삼척시",           "해파랑길 30코스",  "7.1km", "2시간 30분",  "보통",
             "강원 삼척시",           "해파랑길 31코스",  "9.5km", "3시간 30분",  "쉬움",
             "강원 삼척시",           "해파랑길 32코스", "21.9km",     "8시간",  "보통",
             "강원 동해시",           "해파랑길 33코스", "13.6km", "4시간 30분",  "쉬움",
             "강원 동해시",           "해파랑길 34코스", "14.1km",     "5시간",  "쉬움",
             "강원 강릉시",  "해파랑길 35코스 바우길 09구간",  "9.7km", "3시간 30분",  "보통",
             "강원 강릉시",  "해파랑길 36코스 바우길 08구간",  "8.8km", "5시간 30분", "어려움",
             "강원 강릉시",  "해파랑길 37코스 바우길 07구간", "15.8km", "5시간 30분",  "보통",
             "강원 강릉시",  "해파랑길 38코스 바우길 06구간",   "18km", "6시간 30분",  "보통",
             "강원 강릉시",  "해파랑길 39코스 바우길 05구간", "15.8km", "5시간 30분",  "쉬움",
             "강원 강릉시",  "해파랑길 40코스 바우길 12구간", "12.3km", "4시간 30분",  "쉬움",
             "강원 양양군",           "해파랑길 41코스", "12.4km",     "4시간",  "쉬움",
             "강원 양양군",           "해파랑길 42코스",  "9.7km",     "4시간",  "보통",
             "강원 양양군",           "해파랑길 43코스",  "9.3km", "3시간 30분",  "쉬움",
             "강원 양양군",           "해파랑길 44코스", "13.3km", "4시간 30분",  "쉬움",
             "강원 속초시",           "해파랑길 45코스", "17.6km",     "6시간",  "쉬움",
             "강원 고성군",           "해파랑길 46코스", "14.7km",     "5시간",  "쉬움",
             "강원 고성군",           "해파랑길 47코스",  "9.7km", "3시간 30분",  "쉬움",
             "강원 고성군",           "해파랑길 48코스", "13.6km", "4시간 30분",  "쉬움",
             "강원 고성군",           "해파랑길 49코스", "12.3km", "4시간 30분",  "보통",
             "강원 고성군",           "해파랑길 50코스", "10.7km",     "4시간",  "보통"
            )

# Define UI for application that draws a histogram
ui <- fluidPage(
  tags$head(
    tags$style(HTML("
            code {
                display:block;
                padding:9.5px;
                margin:0 0 10px;
                margin-top:10px;
                font-size:13px;
                line-height:20px;
                word-break:break-all;
                word-wrap:break-word;
                white-space:pre-wrap;
                background-color:#F5F5F5;
                border:1px solid rgba(0,0,0,0.15);
                border-radius:4px; 
                color:rgb(0,0,255);
                font-family:monospace;
            }"))),
    # Application title
    titlePanel("해파랑길 코스간 거리"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("from_course", "시작 코스", choices = 1:50, selected = 1),
            selectInput("to_course",   "종료 코스", choices = 50, selected = 50),
            textOutput("text_dist_time")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           code("출처: https://www.durunubi.kr/haeparang-introduction.do"),
           DTOutput("table_course")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(session, input, output) {
  
  observeEvent(input$from_course,{
    if(as.numeric(input$from_course) < as.numeric(input$to_course) ) {
      updateSelectInput(session, "to_course", 
                      choices = as.numeric(input$from_course):as.numeric(input$to_course), 
                      selected = as.numeric(input$to_course))
    } else {
      updateSelectInput(session, "to_course", 
                        choices = as.numeric(input$from_course):50, 
                        selected = 50)
    }
  })
  
  output$table_course <- renderDataTable(
    table_course %>% 
      mutate(
        no = row_number(),
        dist = as.numeric(gsub("km", "", 길이)),
        time = as.numeric(gsub(" 30분", ".5", gsub("시간", "", 시간)))) %>% 
      filter(no >= as.integer(input$from_course) & no <= as.integer(input$to_course)) %>% 
      select(지역:난이도),
    rownames = FALSE
  )
  
  output$text_dist_time <- renderText({
    table_summary <- table_course %>% 
      mutate(
        no = row_number(),
        dist = as.numeric(gsub("km", "", 길이)),
        time = as.numeric(gsub(" 30분", ".5", gsub("시간", "", 시간)))) %>% 
      filter(no >= as.integer(input$from_course) & no <= as.integer(input$to_course)) %>% 
      summarise(dist = sum(dist), time = sum(time))
    paste("총 거리", table_summary$dist, "(예상시간:", table_summary$time, "시간)")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
