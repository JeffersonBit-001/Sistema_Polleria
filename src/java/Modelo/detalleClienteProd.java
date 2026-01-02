/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JEFFERSON
 */
public class detalleClienteProd {
    private int id;
    private int idbebida;
    private String nombebida;
    private String bebidaImg;
    private float bebidaprecio;
    private int id_complemento;
    private String nomcomplemento;
    private String complementoImg;
    private float complementoprecio;
    private int id_prom;
    private String promonom;
    private String promoImg;
    private float promoPrecio;
    private int id_prod;
    private String prod_nom;
    private String productoImg;
    private float productoPrecio;
    private int total;

    public detalleClienteProd() {
    }

    public detalleClienteProd(int id, int idbebida, String nombebida, String bebidaImg, float bebidaprecio, int id_complemento, String nomcomplemento, String complementoImg, float complementoprecio, int id_prom, String promonom, String promoImg, float promoPrecio, int id_prod, String prod_nom, String productoImg, float productoPrecio, int total) {
        this.id = id;
        this.idbebida = idbebida;
        this.nombebida = nombebida;
        this.bebidaImg = bebidaImg;
        this.bebidaprecio = bebidaprecio;
        this.id_complemento = id_complemento;
        this.nomcomplemento = nomcomplemento;
        this.complementoImg = complementoImg;
        this.complementoprecio = complementoprecio;
        this.id_prom = id_prom;
        this.promonom = promonom;
        this.promoImg = promoImg;
        this.promoPrecio = promoPrecio;
        this.id_prod = id_prod;
        this.prod_nom = prod_nom;
        this.productoImg = productoImg;
        this.productoPrecio = productoPrecio;
        this.total = total;
    }
    

    

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdbebida() {
        return idbebida;
    }

    public void setIdbebida(int idbebida) {
        this.idbebida = idbebida;
    }

    public String getNombebida() {
        return nombebida;
    }

    public void setNombebida(String nombebida) {
        this.nombebida = nombebida;
    }

    public int getId_complemento() {
        return id_complemento;
    }

    public void setId_complemento(int id_complemento) {
        this.id_complemento = id_complemento;
    }

    public String getNomcomplemento() {
        return nomcomplemento;
    }

    public void setNomcomplemento(String nomcomplemento) {
        this.nomcomplemento = nomcomplemento;
    }

    public int getId_prom() {
        return id_prom;
    }

    public void setId_prom(int id_prom) {
        this.id_prom = id_prom;
    }

    public String getPromonom() {
        return promonom;
    }

    public void setPromonom(String promonom) {
        this.promonom = promonom;
    }

    public int getId_prod() {
        return id_prod;
    }

    public void setId_prod(int id_prod) {
        this.id_prod = id_prod;
    }

    public String getProd_nom() {
        return prod_nom;
    }

    public void setProd_nom(String prod_nom) {
        this.prod_nom = prod_nom;
    }

    public String getBebidaImg() {
        return bebidaImg;
    }

    public void setBebidaImg(String bebidaImg) {
        this.bebidaImg = bebidaImg;
    }

    public float getBebidaprecio() {
        return bebidaprecio;
    }

    public void setBebidaprecio(float bebidaprecio) {
        this.bebidaprecio = bebidaprecio;
    }

    public String getComplementoImg() {
        return complementoImg;
    }

    public void setComplementoImg(String complementoImg) {
        this.complementoImg = complementoImg;
    }

    public float getComplementoprecio() {
        return complementoprecio;
    }

    public void setComplementoprecio(float complementoprecio) {
        this.complementoprecio = complementoprecio;
    }

    public String getPromoImg() {
        return promoImg;
    }

    public void setPromoImg(String promoImg) {
        this.promoImg = promoImg;
    }

    public float getPromoPrecio() {
        return promoPrecio;
    }

    public void setPromoPrecio(float promoPrecio) {
        this.promoPrecio = promoPrecio;
    }

    public String getProductoImg() {
        return productoImg;
    }

    public void setProductoImg(String productoImg) {
        this.productoImg = productoImg;
    }

    public float getProductoPrecio() {
        return productoPrecio;
    }

    public void setProductoPrecio(float productoPrecio) {
        this.productoPrecio = productoPrecio;
    }
    
    
    
}
