library(shiny)
library(readr)

# 資料可以隨意擺放，但一樣要在 ShinyApp 資料夾內
df <- readr::read_csv(file = "data/iris.csv", col_types = "ddddc")

ui <- fluidPage(
    # 連結 css, javascript 等，檔案需要放在 www 資料夾內
    tags$head(
        tags$link(
            href = "css/style.css",
            type = "text/css",
            rel = "stylesheet"
        )
    ),
    tags$h1("Crunchy cat Luna"),
    # 網站上顯示的圖片，文件等也要放在 www 資料夾
    tags$figure(
        tags$img(id = "luna", src = "images/crunchy_cat_luna.png", alt = "cute crunchy cat luna"),
        tags$figcaption("cute crunchy cat luna")
    ),
    tags$h2("data frame showcase"),
    dataTableOutput(outputId = "output_df"),
    tags$a(
        "Github Repo",
        href = "https://github.com/exkuretrol/minimal-shinyapps-io-deployment",
        target = "_blank"
    )
)

server <- function(input, output) 
{
    output$output_df <- renderDataTable({ df })
}

shinyApp(ui = ui, server = server, options = list(display.mode = "showcase"))
