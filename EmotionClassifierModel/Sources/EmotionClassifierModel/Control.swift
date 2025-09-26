//
//  Control.swift
//  Challenge08
//
//  Created by Lucas Vasconcellos Côrtes on 9/26/25.
//
import Foundation
import CoreML

public class Control{
    
    public init(){}
    
    public func useModel(input: String) -> String? {
        do{
            let config = MLModelConfiguration()
            let model = try TextClassifier(configuration: config)
            
            let emotion = try model.prediction(text: input) //Pega o resultado que o modelo ira retornar usando a frase inputada.
            
            switch emotion.label {
            case "0":
                return "Tristeza"
            case "1":
                return "Alegria"
            case "2":
                return "Amor"
            case "3":
                return "Raiva"
            case "4":
                return "Medo"
            case "5":
                return "Surpresa"
            default:
                return "Sentimento não reconhecido"
            }
            
        }
        catch{
            //Retorna nil caso ocorra erro no do
            print("Erro ao usar modelo: \(error.localizedDescription)")
            return nil
        }
    }
}
