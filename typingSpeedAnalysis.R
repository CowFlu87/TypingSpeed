library(tidyverse)
library(data.table)
library(ggtext)
library(showtext)

# Adding a fancy font!
font_add_google("Special Elite", "Special Elite")
showtext_auto()
 
# Setting the colors into variables
color_lines <- "grey77"
color_text <- "#262626"
color_mechanical <- "#E6781E"
color_membrane <- "#1693A7"

# Loading the data
typing_speed_data <- fread("data/typingSpeed.csv", sep=',')


# Styling the plot
theme_update(panel.background      = element_rect(fill  = "white",
                                                  color = "white"),
             plot.title            = element_text(size   = 24,
                                                  color  = color_text,
                                                  family = "Special Elite"),
             plot.subtitle         = element_markdown(size   = 15,
                                                      color  = color_text,
                                                      family = "Special Elite"),
             plot.caption          = element_text(size   = 10,
                                                  family = "Special Elite"),
             plot.caption.position = "plot",
             plot.title.position   = "plot",
             axis.title            = element_text(size   = 15,
                                                  color  = color_text,
                                                  family = "Special Elite"),
             axis.text             = element_text(size   = 15,
                                                  color  = color_text,
                                                  family = "Special Elite"),
             
             axis.line             = element_line(size  = 1,
                                                  color = color_lines),
             axis.ticks            = element_line(color = color_text),
             axis.ticks.length     = unit(8, "pt"),
             legend.title          = element_text(size   = 16,
                                                  color  = color_text,
                                                  family = "Special Elite"),
             legend.text           = element_text(size   = 14,
                                                  color  = color_text,
                                                  family = "Special Elite"),
             legend.key            = element_blank(),
             legend.position       = "right"
             )

# Plotting!
typing_speed_data %>% 
  ggplot(aes(x    = WPM, 
             y    = ACCURACY,
             fill = TYPE))+
  geom_point(size   = 8,
             color  = color_text,
             shape  = 21,
             alpha  = .9,
             stroke = 1.9)+
  scale_y_continuous(labels = function(x)format(paste0(x,'%'),
                                                big.mark     = '.',
                                                decimal.mark = ',',
                                                scientific   = FALSE))+
  scale_color_manual(values = c(color_text, color_text))+
  scale_fill_manual(values = c(color_mechanical, color_membrane),
                    labels = c('Mechanical', 'Membrane'))+
  coord_equal()+
  labs(title    = 'Performance of my fingers',
       subtitle = 'The smoothness of the mechanical keyboard made me press wrong keys<br>
       more often, resulting in more distractions and then in lower WPM. Only with the<br>
       membrane one I was able to be equal or higher of 100 WPM trice.',
       caption  = 'Data taken by:\nhttps://10fastfingers.com/typing-test/italian',
       fill     = 'Type of\nkeyboard')
  
