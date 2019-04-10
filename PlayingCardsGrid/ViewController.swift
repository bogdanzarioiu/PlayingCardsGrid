//
//  ViewController.swift
//  PlayingCardsGrid
//
//  Created by Zarioiu Bogdan on 4/8/19.
//  Copyright © 2019 Zarioiu Bogdan. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var cardsButton: UIButton!
    var magicButton: UIButton!
    var playingCardNode1: SCNNode!
    var playingCardNode2: SCNNode!
    var playingCardNode3: SCNNode!
    var playingCardNode4: SCNNode!
    var playingCardNode5: SCNNode!
    var playingCardNode6: SCNNode!
    var queenNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true
        addingCardsButton()
        addMagicButton()
        addingTapGesture()
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
        sceneView.autoenablesDefaultLighting = true
       
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    
    func addingCardsButton() {
        cardsButton = UIButton()
        cardsButton.setTitle("Add cards", for: .normal)
        cardsButton.setTitleColor(.black, for: .normal)
        cardsButton.titleLabel?.font = UIFont(name: "Verdana", size: 24)
        //cardsButton.backgroundColor = .lightGray
        sceneView.addSubview(cardsButton)
        cardsButton.translatesAutoresizingMaskIntoConstraints = false
        cardsButton.leftAnchor.constraint(equalTo: sceneView.leftAnchor, constant: 20).isActive = true
        cardsButton.bottomAnchor.constraint(equalTo: sceneView.bottomAnchor, constant: -50).isActive = true
        cardsButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        cardsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cardsButton.addTarget(self, action: #selector(addingCards), for: .touchUpInside)
        
        
    }
    
    
    @objc func addingCards() {
        playingCardNode1 = SCNNode(geometry: SCNPlane(width: 0.63, height: 0.88))
        playingCardNode1.position = SCNVector3(x: 0, y: 0, z: -2)
        playingCardNode1.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "jokercard2")
        
        //let rotation = SCNAction.rotateBy(x: 0, y: 0, z: CGFloat.pi * 2, duration: 3)
        //playingCardNode1.runAction(rotation)
        sceneView.scene.rootNode.addChildNode(playingCardNode1)
        
        playingCardNode2 = SCNNode(geometry: SCNPlane(width: 0.63, height: 0.88))
        playingCardNode2.position = SCNVector3(x: 0.8, y: 0, z: -2)
        playingCardNode2.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "jokercard2")
        //playingCardNode2.runAction(rotation)
        sceneView.scene.rootNode.addChildNode(playingCardNode2)
        
        playingCardNode3 = SCNNode(geometry: SCNPlane(width: 0.63, height: 0.88))
        playingCardNode3.position = SCNVector3(x: 1.6, y: 0, z: -2)
        playingCardNode3.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "jokercard2")
        //playingCardNode3.runAction(rotation)
        sceneView.scene.rootNode.addChildNode(playingCardNode3)
        
        playingCardNode4 = SCNNode(geometry: SCNPlane(width: 0.63, height: 0.88))
        playingCardNode4.position = SCNVector3(x: 0, y: -1, z: -2)
        playingCardNode4.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "jokercard2")
        sceneView.scene.rootNode.addChildNode(playingCardNode4)
        
        playingCardNode5 = SCNNode(geometry: SCNPlane(width: 0.63, height: 0.88))
        playingCardNode5.position = SCNVector3(x: 0.8, y: -1, z: -2)
        playingCardNode5.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "jokercard2")
        sceneView.scene.rootNode.addChildNode(playingCardNode5)
        
        playingCardNode6 = SCNNode(geometry: SCNPlane(width: 0.63, height: 0.88))
        playingCardNode6.position = SCNVector3(x: 1.6, y: -1, z: -2)
        playingCardNode6.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "jokercard2")
        sceneView.scene.rootNode.addChildNode(playingCardNode6)
        
        
    }
    
    func addMagicButton() {
        magicButton = UIButton()
        magicButton.setTitle("Make magic", for: .normal)
        //magicButton.backgroundColor = .lightGray
        magicButton.setTitleColor(.black, for: .normal)
        magicButton.titleLabel?.font = UIFont(name: "Verdana", size: 24)
        sceneView.addSubview(magicButton)
        magicButton.translatesAutoresizingMaskIntoConstraints = false
        magicButton.bottomAnchor.constraint(equalTo: sceneView.bottomAnchor, constant: -50).isActive = true
        magicButton.rightAnchor.constraint(equalTo: sceneView.rightAnchor, constant: -20).isActive = true
        magicButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        magicButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        magicButton.addTarget(self, action: #selector(makeMagic), for: .touchUpInside)
        
    }
 
    @objc func makeMagic() {
        queenNode = SCNNode(geometry: SCNPlane(width: 0.63, height: 0.88))
        queenNode.position = SCNVector3(x: 0, y: 0, z: -2)
        queenNode.geometry?.firstMaterial!.diffuse.contents = UIImage(named: "queenOfHearts")
        queenNode.opacity = 0
        sceneView.scene.rootNode.addChildNode(queenNode)

        SCNTransaction.begin()
        SCNTransaction.animationDuration = 2
        queenNode.opacity = 1
        playingCardNode1.opacity = 0
        SCNTransaction.commit()
     
    }
    
    func addingTapGesture() {
        let tap = UITapGestureRecognizer()
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        tap.addTarget(self, action: #selector(sceneTapped))
        sceneView.gestureRecognizers = [tap]
        
    }
    
    @objc func sceneTapped(recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(location, options: nil)
        if hitResults.count > 0 {
            let result = hitResults[0]
            let node = result.node
            node.removeFromParentNode()
            createCardSphere()
            
        
        }
        
    }
    
    func createCardSphere() {
        for node in sceneView.scene.rootNode.childNodes {
            let cardSphereNode = SCNNode(geometry: SCNSphere(radius: 0.25))
            cardSphereNode.position = node.position
            cardSphereNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "jokercard2")
            sceneView.scene.rootNode.addChildNode(cardSphereNode)
        }
        
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
