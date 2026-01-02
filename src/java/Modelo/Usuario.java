/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JEFFERSON
 */
public class Usuario {
    private int id;
    private String nombre;
    private String apellido;
    private int dni;
    private String usuario;
    private String correo;
    private String pass;
    private int codigo;
    private String codig_form;

    public Usuario() {
    }

    public Usuario(int id, String nombre, String apellido, int dni, String usuario, String correo, String pass, int codigo, String codig_form) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.usuario = usuario;
        this.correo = correo;
        this.pass = pass;
        this.codigo = codigo;
        this.codig_form = codig_form;
    }

    

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getCodig_form() {
        return codig_form;
    }

    public void setCodig_form(String codig_form) {
        this.codig_form = codig_form;
    }
    
    

}
