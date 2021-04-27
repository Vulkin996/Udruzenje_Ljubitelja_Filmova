package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Tema database table.
 * 
 */
@Entity
@NamedQuery(name="Tema.findAll", query="SELECT t FROM Tema t")
public class Tema implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_tema")
	private int idTema;

	private String naziv;

	//bi-directional many-to-one association to Odgovor
	@OneToMany(mappedBy="tema")
	private List<Odgovor> odgovors;

	//bi-directional many-to-one association to Korisnikk
	@ManyToOne
	@JoinColumn(name="Korisnikk_korisnicko_ime")
	private Korisnikk korisnikk;

	public Tema() {
	}

	public int getIdTema() {
		return this.idTema;
	}

	public void setIdTema(int idTema) {
		this.idTema = idTema;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<Odgovor> getOdgovors() {
		return this.odgovors;
	}

	public void setOdgovors(List<Odgovor> odgovors) {
		this.odgovors = odgovors;
	}

	public Odgovor addOdgovor(Odgovor odgovor) {
		getOdgovors().add(odgovor);
		odgovor.setTema(this);

		return odgovor;
	}

	public Odgovor removeOdgovor(Odgovor odgovor) {
		getOdgovors().remove(odgovor);
		odgovor.setTema(null);

		return odgovor;
	}

	public Korisnikk getKorisnikk() {
		return this.korisnikk;
	}

	public void setKorisnikk(Korisnikk korisnikk) {
		this.korisnikk = korisnikk;
	}

}