# Dashboard Packages
library(shiny)
library(bslib)

# Data Analysis Packages
library(dplyr)

# Mapping Packages
library(sf)
library(leaflet)

source("psrc_theme_light.R")
source("psrc_theme_dark.R")
source("functions.R")

# Inputs ------------------------------------------------------------------
psrc_mission <- "Our mission is to advance solutions to achieve a thriving, racially equitable, and sustainable central Puget Sound region through leadership, visionary planning, and collaboration."

# Input Data --------------------------------------------------------------
psrc_activity_summary <- readRDS("data/psrc_activity_summary_point.rds")
route_1a <- readRDS("data/route_1a.rds")
route_1b <- readRDS("data/route_1b.rds")
route_1c <- readRDS("data/route_1c.rds")
route_1d <- readRDS("data/route_1d.rds")
route_2a <- readRDS("data/route_2a.rds")
route_2b <- readRDS("data/route_2b.rds")
route_2c <- readRDS("data/route_2c.rds")
route_2d <- readRDS("data/route_2d.rds")
route_3a <- readRDS("data/route_3a.rds")
route_3b <- readRDS("data/route_3b.rds")
route_3c <- readRDS("data/route_3c.rds")
route_3d <- readRDS("data/route_3d.rds")
route_3e <- readRDS("data/route_3e.rds")
route_3f <- readRDS("data/route_3f.rds")
route_4a <- readRDS("data/route_4a.rds")
route_4b <- readRDS("data/route_4b.rds")
route_4c <- readRDS("data/route_4c.rds")
route_4d <- readRDS("data/route_4d.rds")
route_4e <- readRDS("data/route_4e.rds")
route_4f <- readRDS("data/route_4f.rds")
route_4g <- readRDS("data/route_4g.rds")
route_4h <- readRDS("data/route_4h.rds")
route_4i <- readRDS("data/route_4i.rds")
route_4j <- readRDS("data/route_4j.rds")
route_4k <- readRDS("data/route_4k.rds")
route_4l <- readRDS("data/route_4l.rds")
route_4m <- readRDS("data/route_4m.rds")
route_4n <- readRDS("data/route_4n.rds")
route_4o <- readRDS("data/route_4o.rds")
route_4p <- readRDS("data/route_4p.rds")
milestones <- readRDS("data/milestones.rds")
