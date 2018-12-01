//
//  ViewController.swift
//  Jogo_da_Velha_IOS
//
//  Created by pos on 30/11/2018.
//  Copyright © 2018 pos. All rights reserved.
//
//  Desenvolvido por:
//      André Cremonezi - andrecremonezi7@gmail.com
//      Ednilson Rossi  - ednilson.rossi@aluno.ifsp.edu.br

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn1x1: UIButton!
    @IBOutlet weak var btn1x2: UIButton!
    @IBOutlet weak var btn1x3: UIButton!
    @IBOutlet weak var btn2x1: UIButton!
    @IBOutlet weak var btn2x2: UIButton!
    @IBOutlet weak var btn2x3: UIButton!
    @IBOutlet weak var btn3x1: UIButton!
    @IBOutlet weak var btn3x2: UIButton!
    @IBOutlet weak var btn3x3: UIButton!
    
    var ehEx:Bool = true;
    var estado = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    let x = 1;
    let o = 2;
    var jogadas:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mudarImagem(button : UIButton){
        var image : UIImage!;
        if ehEx {
            image = UIImage(named: "ex") as UIImage?
            ehEx = false;
        }else{
            image = UIImage(named: "oh") as UIImage?
            ehEx = true;
        }
        button.setImage(image, for: .normal);
        button.isUserInteractionEnabled = false;
        ganhador();
    }
    
    func setaVetor(posicao : Int){
        if ehEx {
            estado[posicao] = x;
        }else{
            estado[posicao] = o;
        }
        jogadas = jogadas + 1;
    }
    
    func ganhador(){
        if(jogadas < 9){
            if(estado[0] == estado[1] && estado[0] == estado[2] && estado[0] != 0){
                avisa(ganhador: estado[0]);
                //reiniciar();
            }else{
                if(estado[3] == estado[4] && estado[3] == estado[5] && estado[3] != 0){
                    avisa(ganhador: estado[3]);
                }else{
                    if(estado[6] == estado[7] && estado[6] == estado[8] && estado[6] != 0){
                        avisa(ganhador: estado[6]);
                    }else{
                        if(estado[0] == estado[3] && estado[0] == estado[6] && estado[0] != 0){
                            avisa(ganhador: estado[0]);
                        }else{
                            if(estado[1] == estado[4] && estado[1] == estado[7] && estado[1] != 0){
                                avisa(ganhador: estado[1]);
                            }else{
                                if(estado[2] == estado[5] && estado[2] == estado[8] && estado[2] != 0){
                                    avisa(ganhador: estado[2]);
                                }else{
                                    if(estado[0] == estado[4] && estado[0] == estado[8] && estado[0] != 0){
                                        avisa(ganhador: estado[0]);
                                    }else{
                                        if(estado[2] == estado[4] && estado[2] == estado[6] && estado[2] != 0){
                                            avisa(ganhador: estado[2]);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }else{
            let alertControler = UIAlertController(title: "Jogo da velha IFSP", message: "Deu Velha!!!", preferredStyle: UIAlertControllerStyle.alert);
            
            //let alerta = UIAlertAction(title: "Jogar novamente", style: UIAlertActionStyle.default, handler: nil);
            
            alertControler.addAction(UIAlertAction(title: "Jogar novamente", style: UIAlertActionStyle.default, handler: {(action) in self.reiniciar()}))
            
            self.present(alertControler, animated: true);
        }
    }
    
    func avisa(ganhador : Int){
        var text : String;
        if(ganhador == x){
            text = "O jogador 1 (X) venceu a partida";
        }else{
            text = "O jogador 2 (O) venceu a partida";
        }
        let alertControler = UIAlertController(title: "Jogo da velha IFSP", message: text, preferredStyle: UIAlertControllerStyle.alert);
        
        //let alerta = UIAlertAction(title: "Jogar novamente", style: UIAlertActionStyle.default, handler: nil);
        
        alertControler.addAction(UIAlertAction(title: "Jogar novamente", style: UIAlertActionStyle.default, handler: {(action) in self.reiniciar()}))
    
        self.present(alertControler, animated: true);
        
    }
    
    @IBAction func actBtn1x1(_ sender: UIButton) {
        setaVetor(posicao: 0);
        mudarImagem(button: self.btn1x1);
    }
    
    @IBAction func actBtn1x2(_ sender: UIButton) {
        setaVetor(posicao: 1);
        mudarImagem(button: self.btn1x2);
        
    }
    
    @IBAction func actBtn1x3(_ sender: UIButton) {
        setaVetor(posicao: 2);
        mudarImagem(button: self.btn1x3);
        
    }
    
    @IBAction func actBtn2x1(_ sender: UIButton) {
        setaVetor(posicao: 3);
        mudarImagem(button: self.btn2x1);
        
    }
    
    @IBAction func actBtn2x2(_ sender: UIButton) {
        setaVetor(posicao: 4);
        mudarImagem(button: self.btn2x2);
        
    }
    
    @IBAction func actBtn2x3(_ sender: UIButton) {
        setaVetor(posicao: 5);
        mudarImagem(button: self.btn2x3);
        
    }
    
    @IBAction func actBtn3x1(_ sender: UIButton) {
        setaVetor(posicao: 6);
        mudarImagem(button: self.btn3x1);
        
    }
    
    @IBAction func actBtn3x2(_ sender: UIButton) {
        setaVetor(posicao: 7);
        mudarImagem(button: self.btn3x2);
        
    }
    
    @IBAction func actBtn3x3(_ sender: UIButton) {
        setaVetor(posicao: 8);
        mudarImagem(button: self.btn3x3);
        
    }
    
    @IBAction func actBtnReiniciar(_ sender: UIButton) {
        reiniciar();
    }
    
    func reiniciar(){
        ehEx = true;
        estado = [0, 0, 0, 0, 0, 0, 0, 0, 0];
        jogadas = 0;
        btn1x1.setImage(nil, for: .normal)
        btn1x2.setImage(nil, for: .normal)
        btn1x3.setImage(nil, for: .normal)
        btn2x1.setImage(nil, for: .normal)
        btn2x2.setImage(nil, for: .normal)
        btn2x3.setImage(nil, for: .normal)
        btn3x1.setImage(nil, for: .normal)
        btn3x2.setImage(nil, for: .normal)
        btn3x3.setImage(nil, for: .normal)
        btn1x1.isUserInteractionEnabled = true;
        btn1x2.isUserInteractionEnabled = true;
        btn1x3.isUserInteractionEnabled = true;
        btn2x1.isUserInteractionEnabled = true;
        btn2x2.isUserInteractionEnabled = true;
        btn2x3.isUserInteractionEnabled = true;
        btn3x1.isUserInteractionEnabled = true;
        btn3x2.isUserInteractionEnabled = true;
        btn3x3.isUserInteractionEnabled = true;
        
    }
    
}

