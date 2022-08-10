//
//  PopularMovies.swift
//  SimpleMovie
//
//  Created by kirill on 8/5/2022.
//

import SwiftUI
import Flutter

struct PopularMovies: View {
    @EnvironmentObject var flowController: FlowCoordinator
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List() {
                    ForEach(viewModel.state.movies) { movie in
                        MovieListItem(movie: movie).onTapGesture {
                            flowController.showDetailMovieFlutter(movieId: movie.id, title: movie.originalTitle)
                        }
                            
                    }
                if viewModel.state.canLoadNextPage {
                    Button(action: {
                        viewModel.fetchNextPageIfPossible()
                    }) { Text("Load more movies") }
                        .accessibility(identifier: "loadMore")
                }
            }
            .navigationTitle("Popular Movies")
        }
    }
}

struct PopularMovies_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovies(viewModel: PopularMovies.ViewModel.init())
    }
}
