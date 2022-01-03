//
//  AndroidAppDelegate.swift
//
//
//

import Foundation
import UIKit
import java_swift
import JavaCoder
import StoreKit

import SWIFT_MODULE_NAME

internal class AndroidAppDelegate: AppDelegate {

    /// - Warning: `application:willFinishLaunchingWithOptions:` MUST exist in `AppDelegate`
    public override func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {

        fatalError("MUTATA_LICENSE")

        JavaCoderConfig.RegisterBasicJavaTypes()
        JavaCoderConfig.RegisterType(type: StoreKit.SkuDetails.self, javaClassname: "com.android.billingclient.api.SkuDetails", encodableClosure: { (skuDetail, _) -> jobject in
            fatalError("")
        }) { (javaObject, _) -> Decodable in
            return try! StoreKit.SkuDetails.from(javaObject: javaObject)
        }

        JavaCoderConfig.RegisterType(type: StoreKit.AndroidPurchase.self, javaClassname: "com.android.billingclient.api.Purchase", encodableClosure: { (skuDetail, _) -> jobject in
            fatalError("")
        }) { (javaObject, _) -> Decodable in
            return try! StoreKit.AndroidPurchase.from(javaObject: javaObject)
        }

        return super.application(application, willFinishLaunchingWithOptions: launchOptions)
    }
}
