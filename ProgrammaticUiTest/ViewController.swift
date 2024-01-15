//
//  ViewController.swift
//  ProgrammaticUiTest
//
//  Created by Furkan Kaya on 15.01.2024.
//

import UIKit

class ViewController: UIViewController {

    // Üstteki View (Header ve Subheader için)
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // Header kısmı
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "PlantApp"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        // Burada translatesAutoresizingMaskIntoConstraints kullanmıyoruz, çünkü bu etiketi constraint'lerle değil, üstteki view'ın ortasına yerleştirerek konumlandıracağız.
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // "Get a PlantApp" metni
    let subHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Get a PlantApp"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Container view
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 1, alpha: 0.6) // Arkaplan rengi
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 10.0 // Köşeleri yuvarla
        return view
    }()

    // İki buton
    let iconButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // label1 ve label2 içeren bir view
    let labelsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // label1 oluştur
    let label1: UILabel = {
        let label = UILabel()
        label.text = "Label 1"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // label2 oluştur
    let label2: UILabel = {
        let label = UILabel()
        label.text = "Label 2"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // Complete Button
    let completeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Complete", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Arka plan resmi
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        backgroundImage.alpha = 0.8 // Saydamlık değeri (0 ile 1 arasında)
        backgroundImage.image = UIImage(named: "background.jpeg") // Bu satır yerine resmin URL'sini kullanabilirsiniz
        view.addSubview(backgroundImage)

        // labelsContainerView içine label1 ve label2'yi ekle
        labelsContainerView.addSubview(label1)
        labelsContainerView.addSubview(label2)

        // containerView içine labelsContainerView'ı ekleyip dikey olarak ortala
        containerView.addSubview(labelsContainerView)

        // topView içine headerLabel ve subHeaderLabel'ı ekle
        view.addSubview(topView)
        topView.addSubview(headerLabel)
        topView.addSubview(subHeaderLabel)

        view.addSubview(containerView)
        containerView.addSubview(iconButton)

        view.addSubview(completeButton)

        // Gesture recognizer ekleme
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(containerViewPressed))
        containerView.addGestureRecognizer(tapGesture)

        // Constraint'ler
        NSLayoutConstraint.activate([
            // Arka plan resmi constraint'leri
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor), // Resmin üst kenarı, view'ın üst kenarı ile hizalanır.
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor), // Resmin sol kenarı, view'ın sol kenarı ile hizalanır.
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor), // Resmin sağ kenarı, view'ın sağ kenarı ile hizalanır.
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor), // Resmin alt kenarı, view'ın alt kenarı ile hizalanır.

            // Üstteki view constraint'leri
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50), // Üstteki view, güvenli alanın üst kenarıyla 50 birim mesafede başlar.
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor), // Üstteki view, view'ın sol kenarı ile hizalanır.
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor), // Üstteki view, view'ın sağ kenarı ile hizalanır.

            // Header label constraint'leri
            headerLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 8), // Başlık etiketi, üstteki view'in üst kenarıyla 8 birim mesafede başlar.
            headerLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor), // Başlık etiketi, yatayda üstteki view'in ortasına yerleştirilir.

            // Subheader label constraint'leri
            subHeaderLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8), // Alt başlık etiketi, başlık etiketinin alt kenarıyla 8 birim mesafede başlar.
            subHeaderLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor), // Alt başlık etiketi, yatayda üstteki view'in ortasına yerleştirilir.

            // Container view constraint'leri
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Konteyner, view'ın yatayda ortasına yerleştirilir.
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor), // Konteyner, view'ın dikeyde ortasına yerleştirilir.
            containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40), // Konteyner, view'ın genişliğinin 40 birim eksik olacak şekilde ayarlanır.
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 60), // Konteyner, en az 60 birim yüksekliğe sahip olmalıdır.

            // İcon button constraint'leri
            iconButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20), // İkon butonu, konteynerin üst kenarıyla 20 birim mesafede başlar.
            iconButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20), // İkon düğmesi, konteynerin sol kenarıyla 20 birim mesafede başlar.
            iconButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor), // İkon düğmesi, dikeyde konteynerin ortasına yerleştirilir.

            // Labels container view constraint'leri
            labelsContainerView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor), // Labels konteyneri, dikeyde konteynerin ortasına yerleştirilir.
            labelsContainerView.leadingAnchor.constraint(equalTo: iconButton.trailingAnchor, constant: 16), // Labels konteyneri, yatayda ikon düğmesinin sağ kenarıyla 16 birim mesafede başlar.

            // Label 1 constraint'leri
            label1.topAnchor.constraint(equalTo: labelsContainerView.topAnchor), // Label 1, etiketler konteynerinin üst kenarıyla hizalanır.
            label1.leadingAnchor.constraint(equalTo: labelsContainerView.leadingAnchor), // Label 1, etiketler konteynerinin sol kenarıyla hizalanır.

            // Label 2 constraint'leri
            label2.bottomAnchor.constraint(equalTo: labelsContainerView.bottomAnchor), // Label 2, etiketler konteynerinin alt kenarıyla hizalanır.
            label2.leadingAnchor.constraint(equalTo: labelsContainerView.leadingAnchor), // Label 2, etiketler konteynerinin sol kenarıyla hizalanır.

            // Complete button constraint'leri
            completeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80), // Tamamla düğmesi, güvenli alanın alt kenarıyla 80 birim mesafede yer alır.
            completeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Tamamla düğmesi, yatayda view'ın ortasına yerleştirilir.
            completeButton.widthAnchor.constraint(equalToConstant: 120), // Tamamla düğmesi, genişliği 120 birim olacak şekilde ayarlanır.
            completeButton.heightAnchor.constraint(equalToConstant: 40), // Tamamla düğmesi, yüksekliği 40 birim olacak şekilde ayarlanır.

        ])
    }

    // Selector fonksiyonu
    @objc func containerViewPressed() {
        // Bu fonksiyon, containerView'a tıklandığında çalışacaktır

        // Buton Animasyonu ekleme
        UIView.animate(withDuration: 0.2, animations: {
            self.containerView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            UIView.animate(withDuration: 0.2, animations: {
                self.containerView.transform = CGAffineTransform.identity
            })
        }

        // İşlemlerinizi buraya ekleyebilirsiniz
    }
}
