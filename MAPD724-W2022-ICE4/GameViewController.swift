import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager {
 
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var LivesLabel: UILabel!
    
    var currentScene: SKScene?
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let view = self.view as! SKView?
        {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene")
            {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
        }
        
        // Initialize the Lives and Score
        CollisionManager.gameViewController = self
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel() -> Void
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel() -> Void
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func SetScene(sceneName: String) -> Void
    {
        if let view = self.view as! SKView?
        {
            //load the skscene
            currentScene = SKScene(fileNamed: sceneName)
            
            if let scene = SKScene(fileNamed: sceneName)
            {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
        }
    }
    
    func PresentStartScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
    }
    
    func PresentEndScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        SetScene(sceneName: "EndScene")
    }
    
}
