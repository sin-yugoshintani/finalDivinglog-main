//
//  ImageViewRow.swift
//  test
//
//  Created by 菊地英治 on 2022/06/30.
//

import Foundation
import UIKit
import Eureka

public class ImageViewCell: Cell<UIImage>, CellType{
    @IBOutlet var commentImageView : UIImageView!

}

public final class ImageViewRow: Row<ImageViewCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
       
        cellProvider = CellProvider<ImageViewCell>(nibName: "ImageViewRow")
    }
}
