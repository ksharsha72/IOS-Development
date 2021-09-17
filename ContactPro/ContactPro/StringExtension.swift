//
//  StringExtension.swift
//  ContactPro
//
//  Created by Sriharsha on 18/08/21.
//

import Foundation

extension String
{
    func removeSpaces() -> String
    {
        return self.replacingOccurrences(of: " ", with: "")
    }
}
