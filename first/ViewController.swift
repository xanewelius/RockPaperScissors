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
        
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ready")
        return imageView
    }()
    
    private lazy var buttonRock: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.setImage(UIImage(named: "rock"), for: .normal)
        button.center = view.center
        //button.setTitle("Rock", for: .normal)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonPaper: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setImage(UIImage(named: "paper"), for: .normal)
        //button.setTitle("Paper", for: .normal)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonShear: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.setImage(UIImage(named: "shear"), for: .normal)
        //button.setTitle("Shear", for: .normal)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        return button
    }()
    
    
    private let labelInfo: UILabel = {
        let label = UILabel()
        label.text = "Press icon to start"
        label.textAlignment = .center
        return label
    }()
    
    private let labelCountOfWin: UILabel = {
        let label = UILabel()
        label.text = "Win: 0"
        label.textAlignment = .center
        return label
    }()
    
    private let labelCountOfDraw: UILabel = {
        let label = UILabel()
        label.text = "Draw: 0"
        label.textAlignment = .center
        return label
    }()
    
    private let labelCountOfLose: UILabel = {
        let label = UILabel()
        label.text = "Lose: 0"
        label.textAlignment = .center
        return label
    }()
}

private extension ViewController {
    @objc func btnTapped(sender: UIButton) {
        let btnsendtag:UIButton = sender
        
        let randomInt = Int.random(in: 0...2)
        imageView.image = icon[randomInt]
        
        if btnsendtag.tag == 0 {
            labelInfo.text = "rock"
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
        }
        
        if btnsendtag.tag == 1 {
            labelInfo.text = "paper"
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
        }
        
        if btnsendtag.tag == 2 {
            labelInfo.text = "shear"
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
        view.addSubview(imageView)
        view.addSubview(labelCountOfWin)
        view.addSubview(labelCountOfDraw)
        view.addSubview(labelCountOfLose)

        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        buttonRock.translatesAutoresizingMaskIntoConstraints = false
        buttonPaper.translatesAutoresizingMaskIntoConstraints = false
        buttonShear.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelCountOfWin.translatesAutoresizingMaskIntoConstraints = false
        labelCountOfDraw.translatesAutoresizingMaskIntoConstraints = false
        labelCountOfLose.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelInfo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            labelInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: labelInfo.bottomAnchor, constant: 25),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonRock.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            
            buttonPaper.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            buttonPaper.leftAnchor.constraint(equalTo: buttonRock.leftAnchor, constant: 100),
            buttonPaper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonShear.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            buttonShear.leftAnchor.constraint(equalTo: buttonPaper.leftAnchor, constant: 100),
            
            labelCountOfWin.topAnchor.constraint(equalTo: buttonPaper.bottomAnchor, constant: 50),
            labelCountOfWin.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelCountOfDraw.topAnchor.constraint(equalTo: buttonPaper.bottomAnchor, constant: 50),
            labelCountOfDraw.rightAnchor.constraint(equalTo: labelCountOfWin.rightAnchor, constant: 100),
            
            labelCountOfLose.topAnchor.constraint(equalTo: buttonPaper.bottomAnchor, constant: 50),
            labelCountOfLose.rightAnchor.constraint(equalTo: labelCountOfWin.rightAnchor, constant: -100),

        ])
    }
}
