//
//  MapViewControlDemoViewController.swift
//  BMKSwiftDemo
//
//  Created by wzy on 15/11/5.
//  Copyright © 2015年 baidu. All rights reserved.
//

import UIKit

class MapViewControlDemoViewController: UIViewController, BMKMapViewDelegate, UITextFieldDelegate  {
    
    @IBOutlet weak var _mapView: BMKMapView!
    @IBOutlet weak var zoomField: UITextField!
    @IBOutlet weak var rotateField: UITextField!
    @IBOutlet weak var overlookField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var showImageView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置导航栏右边按钮
        let customRightBarButtonItem = UIBarButtonItem(title: "截图", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("snapshotAction"))
        self.navigationItem.rightBarButtonItem = customRightBarButtonItem
        
        showImageView.hidden = true
        
        zoomField.delegate = self
        rotateField.delegate = self
        overlookField.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        _mapView.viewWillAppear()
        _mapView.delegate = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        _mapView.viewWillDisappear()
        _mapView.delegate = nil
    }
    
    // MARK: - IBAction

    @IBAction func zoomAction(sender: AnyObject) {
        if let zoom = Float(zoomField.text!) {
            _mapView.zoomLevel = zoom
        }
    }
    
    @IBAction func rotateAction(sender: UIButton) {
        if let rotation = Int32(rotateField.text!) {
            _mapView.rotation = rotation
        }
    }
    
    @IBAction func overlookAction(sender: UIButton) {
        if let overlook = Int32(overlookField.text!) {
            _mapView.overlooking = overlook
        }
    }
    
    @IBAction func closeImageViewAction(sender: UIButton) {
        imageView.image = nil
        showImageView.hidden = true
    }
    
    //截图
    func snapshotAction() {
        let image = _mapView.takeSnapshot()
        showImageView.hidden = false
        imageView.image = image
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        zoomField.resignFirstResponder()
        rotateField.resignFirstResponder()
        overlookField.resignFirstResponder()
        return true
    }
    
    // MARK: - BMKMapViewDelegate
    
    /**
    *点中底图标注后会回调此接口
    *@param mapview 地图View
    *@param mapPoi 标注点信息
    */
    func mapView(mapView: BMKMapView!, onClickedMapPoi mapPoi: BMKMapPoi!) {
        messageLabel.text = "您点击了地图标注\(mapPoi.text)，当前经纬度:(\(mapPoi.pt.longitude),\(mapPoi.pt.latitude))，缩放级别:\(mapView.zoomLevel)，旋转角度:\(mapView.rotation)，俯视角度:\(mapView.overlooking)"
    }
    
    /**
     *点中底图空白处会回调此接口
     *@param mapview 地图View
     *@param coordinate 空白处坐标点的经纬度
     */
    func mapView(mapView: BMKMapView!, onClickedMapBlank coordinate: CLLocationCoordinate2D) {
        messageLabel.text = "您点击了地图空白处，当前经纬度:(\(coordinate.longitude),\(coordinate.latitude))，缩放级别:\(mapView.zoomLevel)，旋转角度:\(mapView.rotation)，俯视角度:\(mapView.overlooking)"
    }
    
    /**
     *双击地图时会回调此接口
     *@param mapview 地图View
     *@param coordinate 返回双击处坐标点的经纬度
     */
    func mapview(mapView: BMKMapView!, onDoubleClick coordinate: CLLocationCoordinate2D) {
        messageLabel.text = "您双击了地图，当前经纬度:(\(coordinate.longitude),\(coordinate.latitude))，缩放级别:\(mapView.zoomLevel)，旋转角度:\(mapView.rotation)，俯视角度:\(mapView.overlooking)"
    }
    
    /**
     *长按地图时会回调此接口
     *@param mapview 地图View
     *@param coordinate 返回长按事件坐标点的经纬度
     */
    func mapview(mapView: BMKMapView!, onLongClick coordinate: CLLocationCoordinate2D) {
        messageLabel.text = "您长按了地图，当前经纬度:(\(coordinate.longitude),\(coordinate.latitude))，缩放级别:\(mapView.zoomLevel)，旋转角度:\(mapView.rotation)，俯视角度:\(mapView.overlooking)"
    }
    
    /**
     *地图区域改变完成后会调用此接口
     *@param mapview 地图View
     *@param animated 是否动画
     */
    func mapView(mapView: BMKMapView!, regionDidChangeAnimated animated: Bool) {
        messageLabel.text = "当前地图区域发生了变化(x = \(mapView.visibleMapRect.origin.x), y = \(mapView.visibleMapRect.origin.y) width = \(mapView.visibleMapRect.size.width), height = \(mapView.visibleMapRect.size.height)) ZoomLevel = \(mapView.zoomLevel), RotateAngle = \(mapView.rotation), OverlookAngle = \(mapView.overlooking)"
    }
}