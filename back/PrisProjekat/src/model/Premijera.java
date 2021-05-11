package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the Premijera database table.
 * 
 */
@Entity
@NamedQuery(name="Premijera.findAll", query="SELECT p FROM Premijera p")
public class Premijera implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_premijera")
	private int idPremijera;

	@Temporal(TemporalType.DATE)
	private Date datum;

	private String grad;

	//bi-directional many-to-one association to Film
	@ManyToOne
	@JoinColumn(name="Film_id_film")
	private Film film;

	public Premijera() {
	}

	public int getIdPremijera() {
		return this.idPremijera;
	}

	public void setIdPremijera(int idPremijera) {
		this.idPremijera = idPremijera;
	}

	public Date getDatum() {
		return this.datum;
	}

	public void setDatum(Date datum) {
		this.datum = datum;
	}

	public String getGrad() {
		return this.grad;
	}

	public void setGrad(String grad) {
		this.grad = grad;
	}

	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

}