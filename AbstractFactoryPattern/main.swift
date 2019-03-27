//
//  main.swift
//  AbstractFactoryPattern
//
//  Created by zyl on 2019/3/27.
//  Copyright © 2019 zyl. All rights reserved.
//

import Foundation

// 1、为形状创建一个接口。
@objc protocol Shape {
    func draw()
}

// 2、创建实现接口的实体类。
class Rectangle: Shape {
    func draw() {
        print("Inside Rectangle::draw() method.")
    }
}

class Square: Shape {
    func draw() {
        print("Inside Square::draaw() method.")
    }
}

class Circle: Shape {
    func draw() {
        print("Inside Circle::draw() method.")
    }
}
// 3、为颜色创建一个接口。
@objc protocol Color {
    func fill()
}
// 4、创建实现接口的实体类。
class Red: Color {
    func fill() {
        print("Inside Red::fill() method.")
    }
}

class Green: Color {
    func fill() {
        print("Inside Green::fill() method.")
    }
}

class Blue: Color {
    func fill() {
        print("Inside Blue::fill() method.")
    }
}

// 5、为 Color 和 Shape 对象创建抽象类来获取工厂。
@objc protocol AbstractFactory {
    @objc optional func getColor(color:String) -> Color?
    @objc optional func getShape(shape:String) -> Shape?
}
// 6、创建扩展了 AbstractFactory 的工厂类，基于给定的信息生成实体类的对象。
class ShapeFactory: AbstractFactory {
    
    func getShape(shape: String) -> Shape? {
        if shape.isEmpty {
            return nil
        }
        if shape == "CIRCLE" {
            return Circle.init()
        } else if shape == "RECTANGLE" {
            return Rectangle.init()
        } else if shape == "SQUARE" {
            return Square.init()
        } else {
            return nil
        }
    }
}

class ColorFactory: AbstractFactory {
    func getColor(color: String) -> Color? {
        if color.isEmpty {
            return nil
        }
        if color == "RED" {
            return Red.init()
        } else if color == "GREEN" {
            return Green.init()
        } else if color == "BLUE" {
            return Blue.init()
        } else {
            return nil
        }
    }
}

// 7、创建一个工厂创造器/生成器类，通过传递形状或颜色信息来获取工厂。
class FactoryProducer: NSObject {
    class func getFactory(choice: String) -> AbstractFactory? {
        if choice == "SHAPE" {
            return ShapeFactory.init()
        } else if choice == "COLOR" {
            return ColorFactory.init()
        }
        return nil
    }
}

// 8、使用 FactoryProducer 来获取 AbstractFactory，通过传递类型信息来获取实体类的对象。

// 获取形状工厂
let shapeFactory = FactoryProducer.getFactory(choice: "SHAPE")!
// 获取形状为 Circle 的对象
let shape1 = shapeFactory.getShape!(shape: "CIRCLE")!
// 调用 Circle 的 draw 方法
shape1.draw()
// 获取形状为 Rectangle 的对象
let shape2 = shapeFactory.getShape!(shape: "RECTANGLE")!
// 调用 Rectangle 的 draw 方法
shape2.draw()
// 获取形状为 Square 的对象
let shape3 = shapeFactory.getShape!(shape: "SQUARE")!
// 调用 Square 的 draw 方法
shape3.draw()

// 获取颜色工厂
let colorFactory = FactoryProducer.getFactory(choice: "COLOR")!
// 获取颜色为 Red 的对象
let color1 = colorFactory.getColor!(color: "RED")!
// 调用 Red 的 fill 方法
color1.fill()
// 获取颜色为 Green 的对象
let color2 = colorFactory.getColor!(color: "GREEN")!
// 调用 Green 的 fill 方法
color2.fill()
// 获取颜色为 blue 的对象
let color3 = colorFactory.getColor!(color: "BLUE")!
// 调用 blue 的 fill 方法
color3.fill()

