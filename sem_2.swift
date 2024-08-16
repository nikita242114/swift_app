// Блок 1. 
// ### AppDelegate.swift:

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}
```

// ### SceneDelegate.swift:

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController(rootViewController: ViewController())
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
```

// ### ViewController.swift:

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Привет, мир!"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// Блок 2

class NextViewController: UIViewController {

    var isYellowBackground = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        let colors: [UIColor] = [.red, .gray, .yellow, .blue, .black, .purple]
        for (index, color) in colors.enumerated() {
            let rect = UIView(frame: CGRect(x: index < 3 ? 20 : view.frame.width - 70, y: 100 + CGFloat(index % 3) * 50, width: 50, height: 30))
            rect.backgroundColor = color
            view.addSubview(rect)
        }
        
        let changeTextColorButton = UIButton(frame: CGRect(x: 20, y: 250, width: 150, height: 40))
        changeTextColorButton.setTitle("Изменить цвет текста", for: .normal)
        changeTextColorButton.setTitleColor(.black, for: .normal)
        changeTextColorButton.addTarget(self, action: #selector(changeButtonTextColor), for: .touchUpInside)
        view.addSubview(changeTextColorButton)
        
        let changeBackgroundColorButton = UIButton(frame: CGRect(x: 20, y: 300, width: 200, height: 40))
        changeBackgroundColorButton.setTitle("Изменить цвет экрана", for: .normal)
        changeBackgroundColorButton.setTitleColor(.black, for: .normal)
        changeBackgroundColorButton.addTarget(self, action: #selector(changeBackgroundColor), for: .touchUpInside)
        view.addSubview(changeBackgroundColorButton)
    }
    
    @objc func changeButtonTextColor(_ sender: UIButton) {
        sender.setTitleColor(.green, for: .normal)
    }
    
    @objc func changeBackgroundColor(_ sender: UIButton) {
        if isYellowBackground {
            view.backgroundColor = .yellow
        } else {
            view.backgroundColor = .white
        }
        isYellowBackground = !isYellowBackground
    }
}

// Д.З.

// ### Проект 1 (без использования сторибордов):

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let logoView = UIView(frame: CGRect(x: 20, y: 100, width: 200, height: 100))
        logoView.backgroundColor = .blue
        view.addSubview(logoView)
        
        let authView = UIView(frame: CGRect(x: 20, y: 220, width: 200, height: 40))
        authView.backgroundColor = .gray
        view.addSubview(authView)
        
        let loginView = UIView(frame: CGRect(x: 20, y: 280, width: 200, height: 40))
        loginView.backgroundColor = .yellow
        view.addSubview(loginView)
        
        let passwordView = UIView(frame: CGRect(x: 20, y: 340, width: 200, height: 40))
        passwordView.backgroundColor = .green
        view.addSubview(passwordView)
        
        let loginButton = UIButton(frame: CGRect(x: 20, y: 400, width: 200, height: 40))
        loginButton.backgroundColor = .red
        loginButton.setTitle("Войти", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    @objc func loginButtonTapped() {
        print("Button tapped")
    }
}
```

// ### Проект 2 (с использованием сторибордов):

ViewController.swift:

class ViewController: UIViewController {

    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var authView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoView.backgroundColor = .blue
        authView.backgroundColor = .gray
        loginView.backgroundColor = .yellow
        passwordView.backgroundColor = .green
        loginButton.backgroundColor = .red
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print("Button tapped")
    }
}