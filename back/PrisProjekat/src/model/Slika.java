package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Slika database table.
 * 
 */
@Entity
@NamedQuery(name="Slika.findAll", query="SELECT s FROM Slika s")
public class Slika implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_slika")
	private int idSlika;

	@Column(name="url_slika")
	private String urlSlika;

	//bi-directional many-to-one association to Film
	@ManyToOne
	@JoinColumn(name="Film_id_film")
	private Film film;

	//bi-directional many-to-one association to Zanimljivost
	@ManyToOne
	@JoinColumn(name="Zanimljivost_id_zanimljivost")
	private Zanimljivost zanimljivost;

	public Slika() {
	}

	public int getIdSlika() {
		return this.idSlika;
	}

	public void setIdSlika(int idSlika) {
		this.idSlika = idSlika;
	}

	public String getUrlSlika() {
		return this.urlSlika;
	}

	public void setUrlSlika(String urlSlika) {
		this.urlSlika = urlSlika;
	}

	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public Zanimljivost getZanimljivost() {
		return this.zanimljivost;
	}

	public void setZanimljivost(Zanimljivost zanimljivost) {
		this.zanimljivost = zanimljivost;
	}

}