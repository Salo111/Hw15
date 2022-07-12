//
//  MovieListModel.swift
//  hw15SalomeKhizanishvili
//
//  Created by salo khizanishvili on 11.07.22.
//

import Foundation

class MovieListModel {
  
    var movieListSectionsModels = [MovieListSectionModel]()
    
    init(movies: [Movie]){
        generateSectionModels(movies: movies)
    }
    
    class MovieListSectionModel {
        
        var movies : [Movie]
        var sectionName: String
     
        init (movies: [Movie], sectionName: String){
            self.movies = movies
            self.sectionName = sectionName
        }
        
        func addMovie(_ movie: Movie) {
            movies.append(movie)
        }
        
        func movieCount() -> Int {
            return movies.count
        }
        
        func getMovie(at index: Int) -> Movie{
            movies[index]
        }
        
        func removeMovie(at index: Int){
            movies.remove(at: index)
        }
    
        
        func getMovieIndex(_ movie: Movie) -> Int{
            return movies.firstIndex(of: movie)!
        }
        
    }
    
    func sectionCount()-> Int{
        return movieListSectionsModels.count
    }
    
    func moviewCount(in section: Int) -> Int {
        movieListSectionsModels[section].movieCount()
    }
    
    func addMovie(in section: Int, _ movie : Movie) {
        movieListSectionsModels[section].addMovie(movie)
    }
    
    func getMovie(in section: Int, at index: Int) -> Movie{
        movieListSectionsModels[section].getMovie(at: index)
    }
    
    func removeMovie(in section: Int, at index: Int){
        movieListSectionsModels[section].removeMovie(at: index)
    }
    
    func sectionName(for section: Int) -> String {
        return movieListSectionsModels[section].sectionName
    }
    
    func getMovieIndexPath(_ movie: Movie) -> IndexPath {
        let section = movie.seen ? 0 : 1
        let row = movieListSectionsModels[section].getMovieIndex(movie)
        return IndexPath(row: row, section: section)
    }
    
    
    
    func generateSectionModels(movies: [Movie]){
        var seenMovies = [Movie]()
        var notSeenMovies = [Movie]()
        for movie in movies {
            if movie.seen {
                seenMovies.append(movie)
            } else {
                notSeenMovies.append(movie)
            }
        }
        movieListSectionsModels.append(MovieListSectionModel(movies: seenMovies, sectionName: "Seen"))
        movieListSectionsModels.append(MovieListSectionModel(movies: notSeenMovies, sectionName: "To Watch"))
    }
    
}
