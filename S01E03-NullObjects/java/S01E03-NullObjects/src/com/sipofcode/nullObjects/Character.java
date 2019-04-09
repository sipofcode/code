package com.sipofcode.nullObjects;

public class Character {
	
	private double stamina, health, strength;
	private Weapon weapon;
	
	public Character() {
		this.strength = 10;
		this.stamina = this.health = 100;
		this.weapon = new NoWeapon();
	}
	
	public void applyDamage(double damage) {
		this.health = Math.max(this.health - damage, 0);
	}
	
	public void attack(Character other) {
		double damage = this.strength * this.weapon.getAttackMultiplier();
		double staminaImpact = this.weapon.getStaminaImpact();
		other.applyDamage(damage);
		this.stamina = Math.max(this.stamina - staminaImpact, 0);
	}
	
	public void equip(Weapon weapon) {
		this.weapon = weapon;
	}
	
	public void unequip() {
		this.weapon = new NoWeapon();
	}

	public double getStamina() {
		return this.stamina;
	}

	public double getHealth() {
		return this.health;
	}
}
