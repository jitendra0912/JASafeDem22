//
//  GraphHelper.swift
//  JASafeDemoV
//
//  Created by Varun Shukla on 21/11/22.
//

import Foundation
import Highcharts

enum graphType: String {
    case spline
    case column
    case area
}

class GraphHelper {
    
   static var helper  = GraphHelper()
    private init(){}
   
    
    func plotGraph(graphType type:graphType, xAxis:[String], yAxis:[String], series: [Double], toolTipName: String)->HIOptions {
        let hioptions = HIOptions()
        let chart = HIChart()
        chart.backgroundColor = HIColor(linearGradient: ["x1": 0, "y1": 0, "x2": 0, "y2": 1], stops: [[0, "rgba(255, 255, 255, 1)"], [1, "rgba(255, 255, 255, 1)"]])
        chart.borderRadius = 6
        chart.type = type.rawValue
        hioptions.chart = chart
        
//        let navigation = HINavigation()
//        navigation.buttonOptions = HIButtonOptions()
//        navigation.buttonOptions.theme = HITheme()
//        navigation.buttonOptions.theme.fill = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.0)
//        hioptions.navigation = navigation
//
//        let plotOptions = HIPlotOptions()
//        plotOptions.spline = HISpline()
//        plotOptions.spline.fillColor = HIColor(linearGradient: ["x1": 0, "y1": 0, "x2": 0, "y2": 150], stops: [[0, "rgba(255,255,255, 0.75)"], [1, "rgba(255,255,255, 0.02)"]])
//        hioptions.plotOptions = plotOptions
//
        let credits = HICredits()
        credits.enabled = false
        hioptions.credits = credits
        
        
        let title = HITitle()
        title.text = "AirTemp"
        title.align = "left"
        title.style = HICSSObject()
        title.style.fontFamily = "Arial"
        title.style.fontSize = "14px"
        title.style.color = "rgba(0, 0, 0, 0.6)"
        title.y = 16
        hioptions.title = title
        
        let subtitle = HISubtitle()
        subtitle.text = ""
        if !subtitle.text.isEmpty {
            subtitle.text = subtitle.text + " total"
        }
        subtitle.align = "left"
        subtitle.style = HICSSObject()
        subtitle.style.fontFamily = "Arial"
        subtitle.style.fontSize = "10px"
        subtitle.style.color = "rgba(255, 255, 255, 0.6)"
        subtitle.y = 28
        hioptions.subtitle = subtitle
        
        let tooltip = HITooltip()
        tooltip.headerFormat = ""
        hioptions.tooltip = tooltip
        
        let xaxis = HIXAxis()
        xaxis.tickColor = HIColor(rgba: 255, green: 255, blue: 255, alpha: 0.0)
        xaxis.lineColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.3)
        xaxis.labels = HILabels()
        xaxis.labels.style = HICSSObject()
        xaxis.labels.style.color = "rgb(0, 0, 0)"
        xaxis.labels.style.textOutline = "10px Arial"
    //    xaxis.labels.step = step
        xaxis.categories = xAxis
        hioptions.xAxis = [xaxis]
        
        
        let yaxis = HIYAxis()
        yaxis.lineColor = HIColor(rgba: 0, green: 0, blue: 0, alpha: 0.3)
        yaxis.lineWidth = 1
        yaxis.gridLineWidth = 1
        yaxis.labels = HILabels()
        yaxis.labels.style = HICSSObject()
        yaxis.labels.style.color = "rgb(0, 0, 0)"
        yaxis.labels.style.textOutline = "50px Arial"
        yaxis.labels.x = -5
        yaxis.title = HITitle()
        yaxis.title.text = "Temperature"
        //yaxis.categories = yAxis
        hioptions.yAxis = [yaxis]
        
        let spline = HISpline()
        spline.tooltip = HITooltip()
        spline.tooltip.headerFormat = ""
        spline.tooltip.valueSuffix = "°C"
        spline.showInLegend = false
        spline.data = series
        spline.name = toolTipName
        hioptions.series = [spline]

        return hioptions
        
    }
    
}
