package model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Aayuj
 */

public class Product {
	private int id;
	private String food_name;
	private String category;
	private String description;
	private String ingredient;
	private String instruction;

	public Product(int id, String food_name, String category, String description,
			String ingredient, String instruction ) {
		this.id = id;
		this.food_name = food_name;
		this.category = category;
		this.description = description;
		this.ingredient = ingredient;
		this.instruction = instruction;
	}

	// Getters
	public int getId() {
		return id;
	}

	public String getFood() {
		return food_name;
	}


	public String getDescription() {
		return description;
	}
        
        public String getCategory() {
		return category;
	}

	public String getIngredient() {
		return ingredient;
	}


	public String getInstruction() {
		return instruction;
	}
}