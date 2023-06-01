

import UIKit


class Cell: UICollectionViewCell{
    @IBOutlet weak var img: UIImageView!
}

class Header:UICollectionViewCell{
    @IBOutlet weak var headerLabel: UILabel!
}


class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    private var resuseIdentifier = "Cell"
    private var resuseHeaderIdentifier = "HeaderId"
    
    var dict = [IndexPath: UIColor]()
    
    var selectedIndex = [IndexPath]()
    
    var colorsArr:[UIColor]! = [ UIColor.red,
                                UIColor.black,
                                UIColor.green,
                                UIColor.blue,
                                UIColor.yellow,
                                UIColor.orange,
                                UIColor.systemPink,
                                UIColor.magenta ]
    
    
    let ShapeArr : [UIImage] = [
        UIImage(systemName: "circle.fill")!,
        UIImage(systemName: "square.fill")!,
        UIImage(systemName: "triangle.fill")!,
        UIImage(systemName: "rectangle.fill")!,
        UIImage(systemName: "capsule.fill")!,
        UIImage(systemName: "diamond.fill")!
    ]
    
    let BallsArr: [UIImage] = [  UIImage(systemName: "cricket.ball.fill")!,
                                 UIImage(systemName: "volleyball.fill")!,
                                 UIImage(systemName: "football.fill")!,
                                 UIImage(systemName: "soccerball")!,
                                 UIImage(systemName: "tennisball.fill")!,
                                 UIImage(systemName: "basketball.fill")!]
    
    
//    lazy var imgDict  = [1:ShapeArr, 2:BallsArr]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        selectedIndex.removeAll()
        
        
        let nib = UINib(nibName: "Cell", bundle: Bundle(identifier: "something.collectionViewDemo"))
    
        let headerNib = UINib(nibName: "Header", bundle: Bundle(identifier: "something.collectionViewDemo"))
        
        self.collectionView.register(nib, forCellWithReuseIdentifier: resuseIdentifier )
        
        self.collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"HeaderId" )
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return ShapeArr.count
        }
        
        return BallsArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath) as? Cell else{
            return UICollectionViewCell()
        }
        
        
        // for color
//        if !selectedIndex.contains(indexPath) {
//            cell.contentView.backgroundColor = nil
//        }else {
//            cell.contentView.backgroundColor = colorsArr.randomElement()
//        }
        
        if !dict.keys.contains(indexPath){
            cell.contentView.backgroundColor = nil
        }else{
            cell.contentView.backgroundColor = dict[indexPath]
        }
        
        
        // shapes
        if indexPath.section == 0{
            cell.img.image = ShapeArr[indexPath.row]
            
            return cell
        }else{
            cell.img.image = BallsArr[indexPath.row]
            
            return cell
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
//        if let cell = collectionView.cellForItem(at: indexPath){
         
//            if selectedIndex.contains(indexPath) {
//
//                selectedIndex.removeAll(where: {$0 == indexPath})
//
//            }else {
//
//                selectedIndex.append(indexPath)
//
//                print(selectedIndex)
//            }
        
        if dict.keys.contains(indexPath){
            dict.removeValue(forKey: indexPath)
        }else {
            var color = colorsArr.randomElement()
            dict.updateValue(color!, forKey: indexPath)
        }
        
        print(dict)
//        if !selectedIndex.contains(indexPath) {
//            cell.contentView.backgroundColor = nil
//        }else {
//            cell.contentView.backgroundColor = colorsArr.randomElement()
//        }

        collectionView.reloadData()

        
//        collectionView.reloadItems(at: [indexPath])
//        collectionView.reloadItems(at: selectedIndex)
        
//        print(indexPath)
    }
    



    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard kind  == UICollectionView.elementKindSectionHeader else{
            return UICollectionReusableView()
        }

        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:  resuseHeaderIdentifier , for: indexPath) as? Header else{

            return UICollectionReusableView()
        }

        if indexPath.section == 0 {
            header.headerLabel.text = "Shapes "

            return header
        }else{
            header.headerLabel.text = "Balls "

            return header
        }
        

            
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 60)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 150)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

//    override func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
//        printContent(indexPath)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
//    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath)
//        cell.tintColor = UIColor.black
//
//        let image = UIImage(named: "soccerball")?.withRenderingMode(.alwaysTemplate)
//        let imageView = UIImageView(image: image)
//        imageView.tintColor = .systemPink
//
//
//
//
//    }
    
//    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//
//        if let cell = collectionView.cellForItem(at: indexPath){
//            if cell.contentView.backgroundColor == .black {
//                cell.contentView.backgroundColor = .white
//            } else {
//                cell.contentView.backgroundColor = nil
//            }
//
//        }
//    }
    
//    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        <#code#>
//    }
}
 
