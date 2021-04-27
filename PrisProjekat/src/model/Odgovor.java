package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Odgovor database table.
 * 
 */
@Entity
@NamedQuery(name="Odgovor.findAll", query="SELECT o FROM Odgovor o")
public class Odgovor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_odgovor")
	private int idOdgovor;

	private String opis;

	//bi-directional many-to-one association to Korisnikk
	@ManyToOne
	@JoinColumn(name="Korisnikk_korisnicko_ime")
	private Korisnikk korisnikk;

	//bi-directional many-to-one association to Tema
	@ManyToOne
	@JoinColumn(name="Tema_id_tema")
	private Tema tema;

	public Odgovor() {
	}

	public int getIdOdgovor() {
		return this.idOdgovor;
	}

	public void setIdOdgovor(int idOdgovor) {
		this.idOdgovor = idOdgovor;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public Korisnikk getKorisnikk() {
		return this.korisnikk;
	}

	public void setKorisnikk(Korisnikk korisnikk) {
		this.korisnikk = korisnikk;
	}

	public Tema getTema() {
		return this.tema;
	}

	public void setTema(Tema tema) {
		this.tema = tema;
	}

}