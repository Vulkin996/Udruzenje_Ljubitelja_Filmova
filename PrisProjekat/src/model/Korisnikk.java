package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the Korisnikk database table.
 * 
 */
@Entity
@NamedQuery(name="Korisnikk.findAll", query="SELECT k FROM Korisnikk k")
public class Korisnikk implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="korisnicko_ime")
	private String korisnickoIme;

	@Temporal(TemporalType.DATE)
	@Column(name="datum_rodjenja")
	private Date datumRodjenja;

	private String ime;

	private String prezime;

	private String sifra;

	//bi-directional many-to-one association to Film
	@OneToMany(mappedBy="korisnikk")
	private List<Film> films;

	//bi-directional many-to-one association to Ocena
	@OneToMany(mappedBy="korisnikk")
	private List<Ocena> ocenas;

	//bi-directional many-to-one association to Odgovor
	@OneToMany(mappedBy="korisnikk")
	private List<Odgovor> odgovors;

	//bi-directional many-to-one association to Tema
	@OneToMany(mappedBy="korisnikk")
	private List<Tema> temas;

	//bi-directional many-to-one association to Utisak
	@OneToMany(mappedBy="korisnikk")
	private List<Utisak> utisaks;

	//bi-directional many-to-one association to Zanimljivost
	@OneToMany(mappedBy="korisnikk")
	private List<Zanimljivost> zanimljivosts;

	public Korisnikk() {
	}

	public String getKorisnickoIme() {
		return this.korisnickoIme;
	}

	public void setKorisnickoIme(String korisnickoIme) {
		this.korisnickoIme = korisnickoIme;
	}

	public Date getDatumRodjenja() {
		return this.datumRodjenja;
	}

	public void setDatumRodjenja(Date datumRodjenja) {
		this.datumRodjenja = datumRodjenja;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public String getSifra() {
		return this.sifra;
	}

	public void setSifra(String sifra) {
		this.sifra = sifra;
	}

	public List<Film> getFilms() {
		return this.films;
	}

	public void setFilms(List<Film> films) {
		this.films = films;
	}

	public Film addFilm(Film film) {
		getFilms().add(film);
		film.setKorisnikk(this);

		return film;
	}

	public Film removeFilm(Film film) {
		getFilms().remove(film);
		film.setKorisnikk(null);

		return film;
	}

	public List<Ocena> getOcenas() {
		return this.ocenas;
	}

	public void setOcenas(List<Ocena> ocenas) {
		this.ocenas = ocenas;
	}

	public Ocena addOcena(Ocena ocena) {
		getOcenas().add(ocena);
		ocena.setKorisnikk(this);

		return ocena;
	}

	public Ocena removeOcena(Ocena ocena) {
		getOcenas().remove(ocena);
		ocena.setKorisnikk(null);

		return ocena;
	}

	public List<Odgovor> getOdgovors() {
		return this.odgovors;
	}

	public void setOdgovors(List<Odgovor> odgovors) {
		this.odgovors = odgovors;
	}

	public Odgovor addOdgovor(Odgovor odgovor) {
		getOdgovors().add(odgovor);
		odgovor.setKorisnikk(this);

		return odgovor;
	}

	public Odgovor removeOdgovor(Odgovor odgovor) {
		getOdgovors().remove(odgovor);
		odgovor.setKorisnikk(null);

		return odgovor;
	}

	public List<Tema> getTemas() {
		return this.temas;
	}

	public void setTemas(List<Tema> temas) {
		this.temas = temas;
	}

	public Tema addTema(Tema tema) {
		getTemas().add(tema);
		tema.setKorisnikk(this);

		return tema;
	}

	public Tema removeTema(Tema tema) {
		getTemas().remove(tema);
		tema.setKorisnikk(null);

		return tema;
	}

	public List<Utisak> getUtisaks() {
		return this.utisaks;
	}

	public void setUtisaks(List<Utisak> utisaks) {
		this.utisaks = utisaks;
	}

	public Utisak addUtisak(Utisak utisak) {
		getUtisaks().add(utisak);
		utisak.setKorisnikk(this);

		return utisak;
	}

	public Utisak removeUtisak(Utisak utisak) {
		getUtisaks().remove(utisak);
		utisak.setKorisnikk(null);

		return utisak;
	}

	public List<Zanimljivost> getZanimljivosts() {
		return this.zanimljivosts;
	}

	public void setZanimljivosts(List<Zanimljivost> zanimljivosts) {
		this.zanimljivosts = zanimljivosts;
	}

	public Zanimljivost addZanimljivost(Zanimljivost zanimljivost) {
		getZanimljivosts().add(zanimljivost);
		zanimljivost.setKorisnikk(this);

		return zanimljivost;
	}

	public Zanimljivost removeZanimljivost(Zanimljivost zanimljivost) {
		getZanimljivosts().remove(zanimljivost);
		zanimljivost.setKorisnikk(null);

		return zanimljivost;
	}

}