//
//  SettingsViewController.swift
//  TestApp
//
//  Created by Vladislav Simonov on 25.08.24.
//

import UIKit

final class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var viewModel: SettingsViewModeling!
    private let _view = SettingsView()
    
    init(viewModel: SettingsViewModeling) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        fillUI()
        layout()
    }
    
    /*
     */
    
    private func fillUI() {
        viewModel.showAlert = { [weak self] alert in
            self?.present(alert, animated: true)
        }
        
        viewModel.dataSource.bind { [weak self] _ in
            self?._view.tableView.reloadData()
        }
    }
    
    private func layout() {
        _view.layout()
    }
    
    private func setupView() {
        _view.tableView.dataSource = self
        _view.tableView.delegate = self
    }
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource.value.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.dataSource.value[safe: indexPath.item] ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        viewModel.createAlert()
    }
}
