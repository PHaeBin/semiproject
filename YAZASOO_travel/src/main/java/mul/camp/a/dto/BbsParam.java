package mul.camp.a.dto;

import java.io.Serializable;

public class BbsParam implements Serializable {
   private String choice,search,spot;

   public BbsParam(String choice, String search) {
      this.choice = choice;
      this.search = search;
      this.spot = spot;
   }

   public String getChoice() {
      return choice;
   }

   public void setChoice(String choice) {
      this.choice = choice;
   }

   public String getSearch() {
      return search;
   }

   public void setSearch(String search) {
      this.search = search;
   }
   
   public String getSpot() {
	   return spot;
   }

	public void setSpot(String spot) {
		this.spot = spot;
	}

	@Override
	public String toString() {
		return "BbsParam [choice=" + choice + ", search=" + search + ", spot=" + spot + "]";
	}
}