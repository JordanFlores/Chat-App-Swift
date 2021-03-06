//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        //TODO: Log in the user
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                let alert = UIAlertController(title: "Log In Fail", message: "Please try again", preferredStyle: .alert)
                let button = UIAlertAction(title: "Okay", style: .default, handler: { (dismiss) in
                    self.dismiss(animated: true, completion: nil)
                })
                alert.addAction(button)
                self.present(alert, animated: true, completion: nil)
                SVProgressHUD.dismiss()
                print(error!)
            }
            else {
                SVProgressHUD.dismiss()
                print("Log in successful!")
                
                // Because you are inside a closure to have to specify keyword self at the start
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
            
        }
        
        
    }
    


    
}  
