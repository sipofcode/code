package com.sipofcode.nullObjects;

public class NoWeapon extends Weapon {

	@Override
	public double getAttackMultiplier() {
		return 1;
	}

	@Override
	public double getStaminaImpact() {
		return 1;
	}

}
