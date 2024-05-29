package com.example.conexionVallejo.servicios;

import com.example.conexionVallejo.modelos.Post;
import com.example.conexionVallejo.repositorios.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
    

    public List<Post> obtenerTodosLosPostsAsc() {

        Pageable pageable = PageRequest.of(0, 15);  // Página 0, tamaño 15
        return postRepository.findAllByOrderByCreatedDateDesc(pageable);
    }

    // Método para obtener todos los posts que son preguntas
    public List<Post> obtenerPreguntas() {
        return postRepository.findAllByPostTypeId(1); // Suponiendo que el campo se llama "postType"
    }
    // Método para obtener todas las publicaciones paginadas
    public Page<Post> obtenerPostPaginados(Pageable pageable){
        return postRepository.findAll(pageable);
    }




}
