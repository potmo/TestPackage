import UIKit
import SharedFramework

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("start: \(Bundle.main.classNamed("TestFramework.FrameworkClass"))")
        
        if let bundlePath = Bundle.main.path(forResource: "TestFramework", ofType: "framework"),
            let bundle = Bundle(path: bundlePath) {
            
            
            print("load: \(bundle.isLoaded) \(bundle.load()) \(bundle.isLoaded)")
            print("class: \(bundle.classNamed("TestFramework.FrameworkClass"))")
            print("pclass: \(bundle.principalClass)")
            print("pinst: \(bundle.classNamed("TestFramework.FrameworkClass"))")
                   
            print("bundle id \(bundle.bundleIdentifier)")
            
            if let principal = bundle.principalClass as? SharedProtocol.Type {
                let a: SharedProtocol = principal.init()
                a.run()
            }
            
            if let a = UIImage(named: "wow2", in: bundle, compatibleWith: nil) {
                let img = UIImageView(image: a)
                self.view.addSubview(img)
            }else {
                print("no image")
            }
            
        } else {
            print("not found")
        }
  
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

