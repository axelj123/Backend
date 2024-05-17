package com.example.conexionVallejo.servicios;

import com.example.conexionVallejo.modelos.Post;
import com.example.conexionVallejo.repositorios.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PostService {

    @Autowired
    private PostRepository postRepository;

    public List<Post> obtenerTodosLosPosts() {
        return postRepository.findAll();
    }
    // Método para obtener todos los posts que son preguntas
    public List<Post> obtenerPreguntas() {
        return postRepository.findAllByPostTypeId(1); // Suponiendo que el campo se llama "postType"
    }

    public Optional<Post> obtenerPostPorId(Long postId) {
        return postRepository.findById(postId);
    }

    public Post guardarPost(Post post) {
        return postRepository.save(post);
    }

    public void eliminarPost(Long postId) {
        postRepository.deleteById(postId);
    }
 
}
