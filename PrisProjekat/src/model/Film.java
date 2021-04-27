package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Film database table.
 * 
 */
@Entity
@NamedQuery(name="Film.findAll", query="SELECT f FROM Film f")
public class Film implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_film")
	private int idFilm;

	private String naziv;

	private String opis;

	private String trailer;

	private String trajanje;

	private String zanr;

	//bi-directional many-to-one association to Kategorija
	@ManyToOne
	@JoinColumn(name="Kategorija_id_kategorija")
	private Kategorija kategorija;

	//bi-directional many-to-one association to Korisnikk
	@ManyToOne
	@JoinColumn(name="Korisnikk_korisnicko_ime")
	private Korisnikk korisnikk;

	//bi-directional many-to-one association to Ocena
	@OneToMany(mappedBy="film")
	private List<Ocena> ocenas;

	//bi-directional many-to-one association to Premijera
	@OneToMany(mappedBy="film")
	private List<Premijera> premijeras;

	//bi-directional many-to-one association to Slika
	@OneToMany(mappedBy="film")
	private List<Slika> slikas;

	//bi-directional many-to-one association to Uloga
	@OneToMany(mappedBy="film")
	private List<Uloga> ulogas;

	//bi-directional many-to-one association to Utisak
	@OneToMany(mappedBy="film")
	private List<Utisak> utisaks;

	public Film() {
	}

	public int getIdFilm() {
		return this.idFilm;
	}

	public void setIdFilm(int idFilm) {
		this.idFilm = idFilm;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public String getTrailer() {
		return this.trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public String getTrajanje() {
		return this.trajanje;
	}

	public void setTrajanje(String trajanje) {
		this.trajanje = trajanje;
	}

	public String getZanr() {
		return this.zanr;
	}

	public void setZanr(String zanr) {
		this.zanr = zanr;
	}

	public Kategorija getKategorija() {
		return this.kategorija;
	}

	public void setKategorija(Kategorija kategorija) {
		this.kategorija = kategorija;
	}

	public Korisnikk getKorisnikk() {
		return this.korisnikk;
	}

	public void setKorisnikk(Korisnikk korisnikk) {
		this.korisnikk = korisnikk;
	}

	public List<Ocena> getOcenas() {
		return this.ocenas;
	}

	public void setOcenas(List<Ocena> ocenas) {
		this.ocenas = ocenas;
	}

	public Ocena addOcena(Ocena ocena) {
		getOcenas().add(ocena);
		ocena.setFilm(this);

		return ocena;
	}

	public Ocena removeOcena(Ocena ocena) {
		getOcenas().remove(ocena);
		ocena.setFilm(null);

		return ocena;
	}

	public List<Premijera> getPremijeras() {
		return this.premijeras;
	}

	public void setPremijeras(List<Premijera> premijeras) {
		this.premijeras = premijeras;
	}

	public Premijera addPremijera(Premijera premijera) {
		getPremijeras().add(premijera);
		premijera.setFilm(this);

		return premijera;
	}

	public Premijera removePremijera(Premijera premijera) {
		getPremijeras().remove(premijera);
		premijera.setFilm(null);

		return premijera;
	}

	public List<Slika> getSlikas() {
		return this.slikas;
	}

	public void setSlikas(List<Slika> slikas) {
		this.slikas = slikas;
	}

	public Slika addSlika(Slika slika) {
		getSlikas().add(slika);
		slika.setFilm(this);

		return slika;
	}

	public Slika removeSlika(Slika slika) {
		getSlikas().remove(slika);
		slika.setFilm(null);

		return slika;
	}

	public List<Uloga> getUlogas() {
		return this.ulogas;
	}

	public void setUlogas(List<Uloga> ulogas) {
		this.ulogas = ulogas;
	}

	public Uloga addUloga(Uloga uloga) {
		getUlogas().add(uloga);
		uloga.setFilm(this);

		return uloga;
	}

	public Uloga removeUloga(Uloga uloga) {
		getUlogas().remove(uloga);
		uloga.setFilm(null);

		return uloga;
	}

	public List<Utisak> getUtisaks() {
		return this.utisaks;
	}

	public void setUtisaks(List<Utisak> utisaks) {
		this.utisaks = utisaks;
	}

	public Utisak addUtisak(Utisak utisak) {
		getUtisaks().add(utisak);
		utisak.setFilm(this);

		return utisak;
	}

	public Utisak removeUtisak(Utisak utisak) {
		getUtisaks().remove(utisak);
		utisak.setFilm(null);

		return utisak;
	}

}