//
//  ViewController.swift
//  first
//
//  Created by Max Kuzmin on 23.02.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private var icon = [
        UIImage(named: "rock"),
        UIImage(named: "paper"),
        UIImage(named: "shear")
    ]
    
    private var countOfWin = 0
    private var countOfDraw = 0
    private var countOfLose = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private var opponentChoice: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ready")
        return imageView
    }()
    
    private lazy var buttonRock: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 0
        button.setImage(UIImage(named: "rock"), for: .normal)
        button.center = view.center
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonPaper: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 1
        button.setImage(UIImage(named: "paper"), for: .normal)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonShear: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 2
        button.setImage(UIImage(named: "shear"), for: .normal)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()
    
    private let labelInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Press icon to start"
        label.textAlignment = .center
        return label
    }()
    
    private let labelCountOfWin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Win: 0"
        label.textAlignment = .center
        return label
    }()
    
    private let labelCountOfDraw: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Draw: 0"
        label.textAlignment = .center
        return label
    }()
    
    private let labelCountOfLose: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lose: 0"
        label.textAlignment = .center
        return label
    }()
}

private extension ViewController {
    @objc func btnTapped(sender: UIButton) {
        let btnSendTag:UIButton = sender
        
        let randomInt = Int.random(in: 0 ..< icon.count)
        opponentChoice.image = icon[randomInt]
        
        switch btnSendTag.tag {
        case 0:
            if randomInt == 2 {
                labelInfo.text = "rock and shear == win"
                countOfWin += 1
            } else if randomInt == 1{
                labelInfo.text = "rock and paper == lose"
                countOfLose += 1
            } else {
                labelInfo.text = "rock and rock == draw"
                countOfDraw += 1
            }
        case 1:
            if randomInt == 1 {
                labelInfo.text = "paper and paper == draw"
                countOfDraw += 1
            } else if randomInt == 0{
                labelInfo.text = "paper and rock == win"
                countOfWin += 1
            } else {
                labelInfo.text = "paper and shear == lose"
                countOfLose += 1
            }
        default:
            if randomInt == 2 {
                labelInfo.text = "shear and shear == draw"
                countOfDraw += 1
            } else if randomInt == 0{
                labelInfo.text = "shear and rock == lose"
                countOfLose += 1
            } else {
                labelInfo.text = "shear and paper == win"
                countOfWin += 1
            }
        }
        setLabel()
    }
    
    func setLabel() {
        labelCountOfWin.text = "Win: \(countOfWin)"
        labelCountOfDraw.text = "Draw: \(countOfDraw)"
        labelCountOfLose.text = "Lose: \(countOfLose)"
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(labelInfo)
        view.addSubview(buttonRock)
        view.addSubview(buttonPaper)
        view.addSubview(buttonShear)
        view.addSubview(opponentChoice)
        view.addSubview(labelCountOfWin)
        view.addSubview(labelCountOfDraw)
        view.addSubview(labelCountOfLose)
        
        NSLayoutConstraint.activate([
            labelInfo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            labelInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            opponentChoice.topAnchor.constraint(equalTo: labelInfo.bottomAnchor, constant: 25),
            opponentChoice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonPaper.topAnchor.constraint(equalTo: opponentChoice.bottomAnchor, constant: 50),
            buttonPaper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonRock.topAnchor.constraint(equalTo: opponentChoice.bottomAnchor, constant: 50),
            buttonRock.trailingAnchor.constraint(equalTo: buttonPaper.leadingAnchor, constant: -50),
                        
            buttonShear.topAnchor.constraint(equalTo: opponentChoice.bottomAnchor, constant: 50),
            buttonShear.leadingAnchor.constraint(equalTo: buttonPaper.trailingAnchor, constant: 50),
            
            labelCountOfWin.topAnchor.constraint(equalTo: buttonPaper.bottomAnchor, constant: 50),
            labelCountOfWin.centerXAnchor.constraint(equalTo: buttonPaper.centerXAnchor),
            
            labelCountOfLose.topAnchor.constraint(equalTo: buttonPaper.bottomAnchor, constant: 50),
            labelCountOfLose.centerXAnchor.constraint(equalTo: buttonRock.centerXAnchor),
            
            labelCountOfDraw.topAnchor.constraint(equalTo: buttonPaper.bottomAnchor, constant: 50),
            labelCountOfDraw.centerXAnchor.constraint(equalTo: buttonShear.centerXAnchor),

        ])
    }
}
