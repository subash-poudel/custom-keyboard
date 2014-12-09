//
//  KeyboardViewController.swift
//  SeattleKeyBoard
//
//  Created by Kigan on 11/20/14.
//  Copyright (c) 2014 Subash. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet weak var q: UIButton!
    @IBOutlet weak var w: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var r: UIButton!
    @IBOutlet weak var t: UIButton!
    @IBOutlet weak var y: UIButton!
    @IBOutlet weak var u: UIButton!
    @IBOutlet weak var i: UIButton!
    @IBOutlet weak var o: UIButton!
    @IBOutlet weak var p: UIButton!
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var s: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var h: UIButton!
    @IBOutlet weak var j: UIButton!
    @IBOutlet weak var k: UIButton!
    @IBOutlet weak var l: UIButton!
    @IBOutlet weak var z: UIButton!
    @IBOutlet weak var x: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var v: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var n: UIButton!
    @IBOutlet weak var m: UIButton!
    
    @IBOutlet weak var shift: UIButton!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var space: UIButton!
    @IBOutlet weak var returnKey: UIButton!
    
    @IBOutlet weak var predictButton: UIButton!
    var currentlyPressedButton : UIButton!
    var capitalKeyBoard = 1
    
//    var superScriptArray = ["1" ,"2" ,"3" ,"4" ,"5" ,"6" ,"7" ,"8" ,"9" ,"0"
//                            ,"@" ,"#" ,"$" ,"*" ,"-" ,"+" ,"=" ,"(" ,")"
//                            ,"_" ,"$" ,"\"" ,"'" ,":" ,";" ,"/"]
//    //@IBOutlet var nextKeyboardButton: UIButton!

    @IBAction func spacePressed(sender: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText(" ")
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    @IBAction func buttonClicked(sender: UIButton) {
        let buttonValue = sender.titleLabel!.text
        (textDocumentProxy as UIKeyInput).insertText(buttonValue!)
        NSLog(buttonValue!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //load subview
        let nib = UINib(nibName: "KeyBoardView", bundle:nil)
        let objects = nib.instantiateWithOwner(self, options:nil);
        view = objects[0] as UIView
        addSuperScripts()
        addLongPressGestures()
        self.predictButton.hidden = true
        //longPressInitilizer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    @IBAction func switchKeyBoard(sender: UIButton) {
        sender.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
    }
    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        //self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
   
    @IBAction func deleteText(sender: UIButton) {
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }
    
    @IBAction func shiftKeyPressed(sender: UIButton) {
        ++capitalKeyBoard
        if capitalKeyBoard % 2 == 0 {
            changeTextToSmall()
        }else{
            changeTextToBig()
        }
        
    }
    
    func addLabelToButton(view : UIView, value : String){
        let testFrame : CGRect = CGRectMake(15,0,15,15)
        
        let testView : UILabel = UILabel(frame: testFrame)
        testView.text = value
        //testView.font = UIFont(name: "System Bold 15.0", size: 6)
        testView.font = UIFont(name: "Helvetica", size: 14)
        testView.textColor = UIColor(red: 0.44, green: 0.63, blue: 0.81, alpha: 1.0)
        testView.tag = 1
        //testView.backgroundColor = UIColor(red: 0.89, green: 0.44, blue: 0.16, alpha: 1.0)
        //        testView.alpha=0.5
        view.addSubview(testView)
    }
    func changeTextToSmall(){
        self.q.setTitle("q", forState: UIControlState.Normal)
        self.w.setTitle("w", forState: UIControlState.Normal)
        self.e.setTitle("e", forState: UIControlState.Normal)
        self.r.setTitle("r", forState: UIControlState.Normal)
        self.t.setTitle("t", forState: UIControlState.Normal)
        self.y.setTitle("y", forState: UIControlState.Normal)
        self.u.setTitle("u", forState: UIControlState.Normal)
        self.i.setTitle("i", forState: UIControlState.Normal)
        self.o.setTitle("o", forState: UIControlState.Normal)
        self.p.setTitle("p", forState: UIControlState.Normal)
        self.a.setTitle("a", forState: UIControlState.Normal)
        self.s.setTitle("s", forState: UIControlState.Normal)
        self.d.setTitle("d", forState: UIControlState.Normal)
        self.f.setTitle("f", forState: UIControlState.Normal)
        self.g.setTitle("g", forState: UIControlState.Normal)
        self.h.setTitle("h", forState: UIControlState.Normal)
        self.j.setTitle("j", forState: UIControlState.Normal)
        self.k.setTitle("k", forState: UIControlState.Normal)
        self.l.setTitle("l", forState: UIControlState.Normal)
        self.z.setTitle("z", forState: UIControlState.Normal)
        self.x.setTitle("x", forState: UIControlState.Normal)
        self.c.setTitle("c", forState: UIControlState.Normal)
        self.v.setTitle("v", forState: UIControlState.Normal)
        self.b.setTitle("b", forState: UIControlState.Normal)
        self.n.setTitle("n", forState: UIControlState.Normal)
        self.m.setTitle("m", forState: UIControlState.Normal)
        
        self.delete.setTitle("del", forState: UIControlState.Normal)
        self.shift.setTitle("sft", forState: UIControlState.Normal)
        self.space.setTitle("space", forState: UIControlState.Normal)
        self.returnKey.setTitle("return", forState: UIControlState.Normal)
        
    }
    func changeTextToBig(){
        self.q.setTitle("Q", forState: UIControlState.Normal)
        self.w.setTitle("W", forState: UIControlState.Normal)
        self.e.setTitle("E", forState: UIControlState.Normal)
        self.r.setTitle("R", forState: UIControlState.Normal)
        self.t.setTitle("T", forState: UIControlState.Normal)
        self.y.setTitle("Y", forState: UIControlState.Normal)
        self.u.setTitle("U", forState: UIControlState.Normal)
        self.i.setTitle("I", forState: UIControlState.Normal)
        self.o.setTitle("O", forState: UIControlState.Normal)
        self.p.setTitle("P", forState: UIControlState.Normal)
        self.a.setTitle("A", forState: UIControlState.Normal)
        self.s.setTitle("S", forState: UIControlState.Normal)
        self.d.setTitle("D", forState: UIControlState.Normal)
        self.f.setTitle("F", forState: UIControlState.Normal)
        self.g.setTitle("G", forState: UIControlState.Normal)
        self.h.setTitle("H", forState: UIControlState.Normal)
        self.j.setTitle("J", forState: UIControlState.Normal)
        self.k.setTitle("K", forState: UIControlState.Normal)
        self.l.setTitle("L", forState: UIControlState.Normal)
        self.z.setTitle("Z", forState: UIControlState.Normal)
        self.x.setTitle("X", forState: UIControlState.Normal)
        self.c.setTitle("C", forState: UIControlState.Normal)
        self.v.setTitle("V", forState: UIControlState.Normal)
        self.b.setTitle("B", forState: UIControlState.Normal)
        self.n.setTitle("N", forState: UIControlState.Normal)
        self.m.setTitle("M", forState: UIControlState.Normal)
        
        self.delete.setTitle("DEL", forState: UIControlState.Normal)
        self.shift.setTitle("SFT", forState: UIControlState.Normal)
        self.space.setTitle("SPACE", forState: UIControlState.Normal)
        self.returnKey.setTitle("RETURN", forState: UIControlState.Normal)
    }

   
    func addSuperScripts() {
        addLabelToButton(self.q ,value: "1")
        addLabelToButton(self.w ,value: "2")
        addLabelToButton(self.e ,value: "3")
        addLabelToButton(self.r ,value: "4")
        addLabelToButton(self.t ,value: "5")
        addLabelToButton(self.y ,value: "6")
        addLabelToButton(self.u ,value: "7")
        addLabelToButton(self.i ,value: "8")
        addLabelToButton(self.o ,value: "9")
        addLabelToButton(self.p ,value: "0")
        addLabelToButton(self.a ,value: "@")
        addLabelToButton(self.s ,value: "#")
        addLabelToButton(self.d ,value: "&")
        addLabelToButton(self.f ,value: "*")
        addLabelToButton(self.g ,value: "-")
        addLabelToButton(self.h ,value: "+")
        addLabelToButton(self.j ,value: "=")
        addLabelToButton(self.k ,value: "(")
        addLabelToButton(self.l ,value: ")")
        addLabelToButton(self.z ,value: "_")
        addLabelToButton(self.x ,value: "$")
        addLabelToButton(self.c ,value: "\"")
        addLabelToButton(self.v ,value: "'")
        addLabelToButton(self.b ,value: ":")
        addLabelToButton(self.n ,value: ";")
        addLabelToButton(self.m ,value: "/")
        
    }
    
    @IBAction func returnPressed(sender: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText("\n")
    }
    
    func longPressAction(event : UILongPressGestureRecognizer){
        //(textDocumentProxy as UIKeyInput).insertText("1")
        let views  = event.view!.subviews
        var labelString : String = ""
        for view in views {
            if let textField = view as? UILabel {
                if textField.tag == 1 {
                    labelString = textField.text!
                }
            }
        }
        let location : CGPoint = event.locationInView(event.view);
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText(labelString)
        }
    }
    func longPressInitilizer() {
        var lpgr = UILongPressGestureRecognizer(target: self, action: Selector("longPressAction:"))
        lpgr.minimumPressDuration = 0.6;
        self.q.addGestureRecognizer(lpgr)
        
    }
    
       
    func timerTask(timer : NSTimer){
        let myDict = timer.userInfo as NSDictionary
        let button : UIButton = ( myDict.objectForKey("button") ) as UIButton
        
        let views  = button.subviews
        
        var labelString : String = ""
        for view in views {
            if let textField = view as? UILabel {
                if textField.tag == 1 {
                    labelString = textField.text!
                    (textDocumentProxy as UIKeyInput).insertText(labelString)
                }
                
            }
        }
        //let labelString = pressedButton.titleLabel?.text
        
        
//        if (pressedButton.state == UIGestureRecognizerState.Began){
//            (textDocumentProxy as UIKeyInput).insertText(labelString)
//        }
    }
    
    func addLongPressGestures() {
        // for a
        let longPressA = UILongPressGestureRecognizer(target: self, action: Selector("longPressA:"));
        longPressA.minimumPressDuration = 0.8
        self.a.addGestureRecognizer(longPressA)
        // for b
        let longPressB = UILongPressGestureRecognizer(target: self, action: Selector("longPressB:"));
        longPressB.minimumPressDuration = 0.8
        self.b.addGestureRecognizer(longPressB)
        // for c
        let longPressC = UILongPressGestureRecognizer(target: self, action: Selector("longPressC:"));
        longPressC.minimumPressDuration = 0.8
        self.c.addGestureRecognizer(longPressC)
        // for d
        let longPressD = UILongPressGestureRecognizer(target: self, action: Selector("longPressD:"));
        longPressD.minimumPressDuration = 0.8
        self.d.addGestureRecognizer(longPressD)
        // for e
        let longPressE = UILongPressGestureRecognizer(target: self, action: Selector("longPressE:"));
        longPressE.minimumPressDuration = 0.8
        self.e.addGestureRecognizer(longPressE)
        // for f
        let longPressF = UILongPressGestureRecognizer(target: self, action: Selector("longPressF:"));
        longPressF.minimumPressDuration = 0.8
        self.f.addGestureRecognizer(longPressF)
        // for g
        let longPressG = UILongPressGestureRecognizer(target: self, action: Selector("longPressG:"));
        longPressG.minimumPressDuration = 0.8
        self.g.addGestureRecognizer(longPressG)
        // for h
        let longPressH = UILongPressGestureRecognizer(target: self, action: Selector("longPressH:"));
        longPressH.minimumPressDuration = 0.8
        self.h.addGestureRecognizer(longPressH)
        // for i
        let longPressI = UILongPressGestureRecognizer(target: self, action: Selector("longPressI:"));
        longPressI.minimumPressDuration = 0.8
        self.i.addGestureRecognizer(longPressI)
        // for j
        let longPressJ = UILongPressGestureRecognizer(target: self, action: Selector("longPressJ:"));
        longPressJ.minimumPressDuration = 0.8
        self.j.addGestureRecognizer(longPressJ)
        // for k
        let longPressK = UILongPressGestureRecognizer(target: self, action: Selector("longPressK:"));
        longPressK.minimumPressDuration = 0.8
        self.k.addGestureRecognizer(longPressK)
        // for L
        let longPressL = UILongPressGestureRecognizer(target: self, action: Selector("longPressL:"));
        longPressL.minimumPressDuration = 0.8
        self.l.addGestureRecognizer(longPressL)
        // for m
        let longPressM = UILongPressGestureRecognizer(target: self, action: Selector("longPressM:"));
        longPressM.minimumPressDuration = 0.8
        self.m.addGestureRecognizer(longPressM)
        // for n
        let longPressN = UILongPressGestureRecognizer(target: self, action: Selector("longPressN:"));
        longPressN.minimumPressDuration = 0.8
        self.n.addGestureRecognizer(longPressN)
        // for o
        let longPressO = UILongPressGestureRecognizer(target: self, action: Selector("longPressO:"));
        longPressO.minimumPressDuration = 0.8
        self.o.addGestureRecognizer(longPressO)
        // for P
        let longPressP = UILongPressGestureRecognizer(target: self, action: Selector("longPressP:"));
        longPressP.minimumPressDuration = 0.8
        self.p.addGestureRecognizer(longPressP)
        // for Q
        let longPressQ = UILongPressGestureRecognizer(target: self, action: Selector("longPressQ:"));
        longPressQ.minimumPressDuration = 0.8
        self.q.addGestureRecognizer(longPressQ)
        // for R
        let longPressR = UILongPressGestureRecognizer(target: self, action: Selector("longPressR:"));
        longPressR.minimumPressDuration = 0.8
        self.r.addGestureRecognizer(longPressR)
        // for S
        let longPressS = UILongPressGestureRecognizer(target: self, action: Selector("longPressS:"));
        longPressS.minimumPressDuration = 0.8
        self.s.addGestureRecognizer(longPressS)
        // for T
        let longPressT = UILongPressGestureRecognizer(target: self, action: Selector("longPressT:"));
        longPressT.minimumPressDuration = 0.8
        self.t.addGestureRecognizer(longPressT)
        // for U
        let longPressU = UILongPressGestureRecognizer(target: self, action: Selector("longPressU:"));
        longPressU.minimumPressDuration = 0.8
        self.u.addGestureRecognizer(longPressU)
        // for V
        let longPressV = UILongPressGestureRecognizer(target: self, action: Selector("longPressV:"));
        longPressV.minimumPressDuration = 0.8
        self.v.addGestureRecognizer(longPressV)
        // for W
        let longPressW = UILongPressGestureRecognizer(target: self, action: Selector("longPressW:"));
        longPressW.minimumPressDuration = 0.8
        self.w.addGestureRecognizer(longPressW)
        // for X
        let longPressX = UILongPressGestureRecognizer(target: self, action: Selector("longPressX:"));
        longPressX.minimumPressDuration = 0.8
        self.x.addGestureRecognizer(longPressX)
        // for Y
        let longPressY = UILongPressGestureRecognizer(target: self, action: Selector("longPressY:"));
        longPressY.minimumPressDuration = 0.8
        self.y.addGestureRecognizer(longPressY)
        // for Z
        let longPressZ = UILongPressGestureRecognizer(target: self, action: Selector("longPressZ:"));
        longPressZ.minimumPressDuration = 0.8
        self.z.addGestureRecognizer(longPressZ)
        
        
        
        
    }
    // all are long press functions
    func longPressA(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("@")
        }
    }
    
    func longPressB(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText(":")
        }
    }
    
    func longPressC(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("\"")
        }
    }
    
    func longPressD(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("&")
        }
    }
    
    func longPressE(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("3")
        }
    }
    
    func longPressF(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("*")
        }
    }
    
    func longPressG(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("-")
        }
    }
    
    func longPressH(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("+")
        }
    }
    
    func longPressI(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("8")
        }
    }
    
    func longPressJ(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("=")
        }
    }
    
    func longPressK(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("(")
        }
    }
    
    func longPressL(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText(")")
        }
    }
    
    func longPressM(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("/")
        }
    }
    
    func longPressN(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText(";")
        }
    }
    
    func longPressO(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("9")
        }
    }
    
    func longPressP(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("0")
        }
    }
    
    func longPressQ(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("1")
        }
    }
    
    func longPressR(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("4")
        }
    }
    
    func longPressS(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("#")
        }
    }
    
    func longPressT(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("5")
        }
    }
    
    func longPressU(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("7")
        }
    }
    
    func longPressV(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("'")
        }
    }
    
    func longPressW(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("2")
        }
    }
    
    func longPressX(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("$")
        }
    }
    
    func longPressY(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("6")
        }
    }
    
    func longPressZ(event : UILongPressGestureRecognizer){
        if (event.state == UIGestureRecognizerState.Began){
            (textDocumentProxy as UIKeyInput).insertText("_")
        }
    }

}
