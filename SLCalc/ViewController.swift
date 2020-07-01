import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let parties: [Party] = [Party(name: "Høyre", votes: 6100), Party(name: "Venstre", votes: 5000), Party(name: "Sosialistisk Venstreparti", votes: 8400)]
        
        //var parties: [Party] = []
        
        //calculateElection(seatsToAllocate: 10, partiesArray: parties)

    }


    @IBOutlet weak var newPartyName: UITextField!
    @IBOutlet weak var newPartyVotes: UITextField!
    
    @IBAction func newPartyAddButton(_ sender: Any) {
        let name = newPartyName.text!
        let votes: Int? = Int(newPartyVotes.text!)
        
        let newParty: Party = Party(name: name, votes: votes!)
        parties.append(newParty)
    }
    
    @IBOutlet weak var partiesTable: UITableView!
    
}

var parties: [Party] = []
