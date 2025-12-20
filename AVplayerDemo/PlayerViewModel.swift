//
//  PlayerViewModel.swift
//  AVplayerDemo
//
//  Created by Vishal Kothari on 20/12/25.
//

import Foundation
import SwiftData
import AVFoundation

@Observable
class PlayerViewModel: NSObject{
    var player:AVPlayer?
    private var asset: AVURLAsset?
    var isPlaying = false
    // Example HLS URL
    private let streamURL = URL(string:"https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!
    
    func seUpPlayer(){
        asset = AVURLAsset(url: streamURL)
        asset?.resourceLoader.setDelegate(self, queue:  .main)
        let playerItem = AVPlayerItem(asset: asset!)
        player = AVPlayer(playerItem: playerItem)
        
    }
    
    // MARK: Playback Controls
    func togglePlayPause() {
        guard let player = player else { return }
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }
    
    func seekToStart() {
           player?.seek(to: .zero)
           player?.play()
           isPlaying = true
       }
       
}

// MARK: FairPlay DRM
extension PlayerViewModel: AVAssetResourceLoaderDelegate {
    func resourceLoader(_ resourceLoader: AVAssetResourceLoader,
                        shouldWaitForLoadingOfRequestedResource loadingRequest: AVAssetResourceLoadingRequest) -> Bool {
        
        // Placeholder for FairPlay DRM handling
        // Normally generate SPC -> send to license server -> respond with CKC
        loadingRequest.finishLoading()
        return true
    }
}
