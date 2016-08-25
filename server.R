
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#


q_map<-function(r=1,x_o=runif(1,0,1),N=100,burn_in=0, plot_cob=F, ...)
{
  if(plot_cob==T) par(mfrow=c(1,2),mar=c(4,4,1,2),lwd=2) else par(mfrow=c(1,1),mar=c(4,4,1,2),lwd=2)
  ############# Trace #############
  x<-array(dim=N)
  x[1]<-x_o
  for(i in 2:N)
    x[i]<-r*x[i-1]*(1-x[i-1])
  
  plot(x[(burn_in+1):N],type='l',xlab='t',ylab='x',...)
  #################################
  
  ##########  Quadradic Map ########
  x<-seq(from=0,to=1,length.out=100)
  x_np1<-array(dim=100)
  for(i in 1:length(x))
    x_np1[i]<-r*x[i]*(1-x[i])
  
  if(plot_cob==T){
  
  plot(x,x_np1,type='l',xlab=expression(x[t]),ylab=expression(x[t+1]))
  abline(0,1) 

  start=x_o
  vert=FALSE
  lines(x=c(start,start),y=c(0,r*start*(1-start)) )
  for(i in 1:(2*N))
  {
    if(vert)
    {
      lines(x=c(start,start),y=c(start,r*start*(1-start)) )
      vert=FALSE
    }
    else
    {
      lines(x=c(start,
                r*start*(1-start)),
            y=c(r*start*(1-start),
                r*start*(1-start)) )
      vert=TRUE
      start=r*start*(1-start)
    }
  }
  }
  #################################
}


library(shiny)

shinyServer(function(input, output) {

  output$tsplot <- renderPlot({

    q_map(r=input$growth_rate,x_o=input$start_x, plot_cob=F)
    
    
    
    
    
  })

})
