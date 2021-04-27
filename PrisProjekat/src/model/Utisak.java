package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Utisak database table.
 * 
 */
@Entity
@NamedQuery(name="Utisak.findAll", query="SELECT u FROM Utisak u")
public class Utisak implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_utisak")
	private int idUtisak;

	private String opis;

	//bi-directional many-to-one association to Film
	@ManyToOne
	@JoinColumn(name="Film_id_film")
	private Film film;

	//bi-directional many-to-one association to Korisnikk
	@ManyToOne
	@JoinColumn(name="Korisnik_korisnicko_ime")
	private Korisnikk korisnikk;

	public Utisak() {
	}

	public int getIdUtisak() {
		return this.idUtisak;
	}

	public void setIdUtisak(int idUtisak) {
		this.idUtisak = idUtisak;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public Korisnikk getKorisnikk() {
		return this.korisnikk;
	}

	public void setKorisnikk(Korisnikk korisnikk) {
		this.korisnikk = korisnikk;
	}

}