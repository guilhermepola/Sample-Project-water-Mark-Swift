//
//  ViewController.swift
//  MarcaDagua
//
//  Created by Quaddro Admin on 18/06/15.
//  Copyright (c) 2015 Quaddro Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageViewFoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tirarFoto(sender: UIButton) {
 
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    


    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        
        var imagemComMarca = adicionarMarcaDagua(image)
        imageViewFoto.image = imagemComMarca
        UIImageWriteToSavedPhotosAlbum(imagemComMarca, nil, nil, nil)
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
 
    
    func adicionarMarcaDagua(imagemPrincial: UIImage) -> UIImage{
    
        var imagemMarcaDagua = UIImage(named: "waterMark.jpg")
        
        UIGraphicsBeginImageContext(imagemPrincial.size)
        imagemPrincial.drawInRect(CGRect(x: 0, y: 0, width: imagemPrincial.size.width, height: imagemPrincial.size.height))
        imagemMarcaDagua?.drawInRect(CGRect(x: imagemPrincial.size.width - imagemMarcaDagua!.size.width, y: imagemPrincial.size.height - imagemMarcaDagua!.size.height, width: imagemMarcaDagua!.size.width, height: imagemMarcaDagua!.size.height))
        
        let resultadoImagens = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resultadoImagens
    
        
        
    }
    

    @IBAction func longPressImage(sender: UILongPressGestureRecognizer) {
        
        let activityViewController = UIActivityViewController(activityItems: [self.imageViewFoto.image!], applicationActivities: nil)
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
    }
    
}

