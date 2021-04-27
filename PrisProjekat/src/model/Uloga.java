package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Uloga database table.
 * 
 */
@Entity
@NamedQuery(name="Uloga.findAll", query="SELECT u FROM Uloga u")
public class Uloga implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_uloga")
	private int idUloga;

	private String naziv;

	//bi-directional many-to-one association to Film
	@ManyToOne
	@JoinColumn(name="Film_id_film")
	private Film film;

	//bi-directional many-to-one association to Glumac
	@ManyToOne
	@JoinColumn(name="Glumac_id_glumac")
	private Glumac glumac;

	public Uloga() {
	}

	public int getIdUloga() {
		return this.idUloga;
	}

	public void setIdUloga(int idUloga) {
		this.idUloga = idUloga;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public Glumac getGlumac() {
		return this.glumac;
	}

	public void setGlumac(Glumac glumac) {
		this.glumac = glumac;
	}

}