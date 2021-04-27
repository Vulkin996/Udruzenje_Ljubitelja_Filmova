package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Zanimljivost database table.
 * 
 */
@Entity
@NamedQuery(name="Zanimljivost.findAll", query="SELECT z FROM Zanimljivost z")
public class Zanimljivost implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_zanimljivost")
	private int idZanimljivost;

	private String naslov;

	private String slika;

	@Lob
	private String tekst;

	private String video;

	//bi-directional many-to-one association to Slika
	@OneToMany(mappedBy="zanimljivost")
	private List<Slika> slikas;

	//bi-directional many-to-one association to Korisnikk
	@ManyToOne
	@JoinColumn(name="Korisnikk_korisnicko_ime")
	private Korisnikk korisnikk;

	public Zanimljivost() {
	}

	public int getIdZanimljivost() {
		return this.idZanimljivost;
	}

	public void setIdZanimljivost(int idZanimljivost) {
		this.idZanimljivost = idZanimljivost;
	}

	public String getNaslov() {
		return this.naslov;
	}

	public void setNaslov(String naslov) {
		this.naslov = naslov;
	}

	public String getSlika() {
		return this.slika;
	}

	public void setSlika(String slika) {
		this.slika = slika;
	}

	public String getTekst() {
		return this.tekst;
	}

	public void setTekst(String tekst) {
		this.tekst = tekst;
	}

	public String getVideo() {
		return this.video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public List<Slika> getSlikas() {
		return this.slikas;
	}

	public void setSlikas(List<Slika> slikas) {
		this.slikas = slikas;
	}

	public Slika addSlika(Slika slika) {
		getSlikas().add(slika);
		slika.setZanimljivost(this);

		return slika;
	}

	public Slika removeSlika(Slika slika) {
		getSlikas().remove(slika);
		slika.setZanimljivost(null);

		return slika;
	}

	public Korisnikk getKorisnikk() {
		return this.korisnikk;
	}

	public void setKorisnikk(Korisnikk korisnikk) {
		this.korisnikk = korisnikk;
	}

}