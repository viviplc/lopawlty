//
//  CheckOutResumeViewController.swift
//  Lopawlty
//
//  Created by Viviana Leyva on 12/1/21.
//

/*
 This class is the controller for the checkout view which calculates the taxes and fees. It integrates with firebase to store the result to the sale that was created in the previous view.
 **/

import UIKit
import Foundation
import Firebase

class CheckOutResumeViewController: UIViewController {
    
    @IBOutlet weak var LblTotalItems: UILabel!
    @IBOutlet weak var LblSubTotal: UILabel!
    @IBOutlet weak var LblShipping: UILabel!
    @IBOutlet weak var LblPriceNoTax: UILabel!
    @IBOutlet weak var LblGstHst: UILabel!
    @IBOutlet weak var LblPstRst: UILabel!
    @IBOutlet weak var LblGrandTotal: UILabel!
    @IBOutlet weak var BtnContinue: UIButton!
    
    var totalItems = 0
    var subTotal = 0.0
    var saleId = ""
    var shipping = 5.2

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnContinue.layer.cornerRadius = 15

        LblTotalItems.text = "\(totalItems)"
        LblSubTotal.text = "$ \(String(format: "%.2f", subTotal))"
        LblShipping.text = "$ \(shipping)"
        
        let priceNoTax = calculatePriceNotaxes()
        LblPriceNoTax.text = "$ \(String(format: "%.2f", priceNoTax))"
       
        let gsthst = calculateTaxGstHst(priceNoTax: priceNoTax)
        LblGstHst.text = "$ \(String(format: "%.2f", gsthst))"
        
        let pstrst = calculateTaxPstRst(priceNoTax: priceNoTax)
        LblPstRst.text = "$ \(String(format: "%.2f", pstrst))"
        
        let grandTotal = calculateGrandTotal(noTax: priceNoTax, gst: gsthst, pst: pstrst)
        LblGrandTotal.text = "$ \(String(format: "%.2f", grandTotal))"
    }
    
    //method to calculate the total without taxes
    func calculatePriceNotaxes() -> Double {
        var totalNoTax = 0.0
        totalNoTax = subTotal + shipping
        return totalNoTax
    }
    
    //method to calculate the total with gst tax
    func calculateTaxGstHst(priceNoTax : Double) -> Double{
        var totalGstHst = 0.0
        totalGstHst = priceNoTax * 0.08
        return totalGstHst
    }

    //method to calculate total with rst tax
    func calculateTaxPstRst(priceNoTax : Double) -> Double{
        var totalPstRst = 0.0
        totalPstRst = priceNoTax * 0.05
        return totalPstRst
    }
    
    //method to calculate total with both types of taxes
    func calculateGrandTotal(noTax: Double, gst : Double, pst: Double) -> Double{
        var total = 0.0
        total = noTax + gst + pst
        return total
    }
    
    @IBAction func btnContinueClicked(_ sender: Any) {
        //checkoutToDelivery
        let newPayment = createPayment()
        let db = Firestore.firestore()
        let firebaseNewPaymentDict = newPayment.firebaseDictionary;
        db.collection("Sales").document(saleId).setData( ["payment" : firebaseNewPaymentDict], merge: true){ err in
            if let err = err {
                print("error adding payment: \(err)")
            } else {
                print("updated payment of sale")
                self.performSegue(withIdentifier: "checkoutToDelivery", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.destination is DeliveryInfoViewController {
                let resume = segue.destination as? DeliveryInfoViewController
                resume?.saleId = self.saleId
            }
        }
    
    //method that creates a new payment object using data created in class
    func createPayment() -> Payment {
        let taxes = calculateTaxGstHst(priceNoTax : subTotal) + calculateTaxPstRst(priceNoTax: subTotal)
        let totalCost = taxes + subTotal
        let newPayment = Payment(subTotal: subTotal, taxes: taxes, totalCost: totalCost)
        return newPayment
    }
    
}
