# Swift App “CRM Aplication Dashboard”

## Project tasks
Implement the prototype interactions and animation from a design in [Figma](https://www.figma.com/file/GSuWs8R4I8zBxOaLAE0LdOWn/Dashboard1-Design-Concept?node-id=0%3A1) using Xcode.

![prot](https://github.com/salokpi/CRM_Analitycs_Dashboard/blob/master/Screenshots/Screenshot%202022-01-26%20at%2015.16.11.png?raw=true)

## My target from this project
In this project I have to consolidate in practice the acquired knowledge on working with:
- creating visual interfaces in Xcode (InterfaceBuilder and Swift),
- creation of arbitrary graphic objects (SAHapeLayer)
- object animation (CABasicAnimation)
- CollectionView,
- TableView

## Progress Reports
The task was completed

![my gif Report](https://github.com/salokpi/CRM_Analitycs_Dashboard/blob/master/Screenshots/Screen%20Recording%202022-01-26%20at%2018.12.10.gif?raw=true)

I decided to add ___PickerView___ so that the user could choose the data (month or period of years) that is displayed in TableView and CollectionView. 

My Two-Component PickerView provides protection against incorrect choice of range. When the user selects a row in the left component, the right component starts with the value of the right row. Similar behavior implemented in the left component.

For easy closing of PickerView I decided to place it in AllertController.

The ___notifications button___ can display the number of notifications.
When you press the button in the form of a person, the number increases. When you press the notification button, the number decreases. The notification button cannot display a number greater than 9. Also implemented, the function increases the number of notifications at random times, but provided that the number does not exceed 9.

## Startup instructions
1. download the project in any way
2. Locate and open the file with name CRM_Analitycs_Dashboard.xcodeproj 
