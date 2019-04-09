package com.sipofcode.nullObjects;

import org.junit.Assert;
import org.junit.Test;

public class WeaponTests {

	@Test
	public void withoutWeapon() {
		Character attacker = new Character();
		Character receiver = new Character();
		
		attacker.attack(receiver);
		
		Assert.assertEquals(90, receiver.getHealth(), 0);
		Assert.assertEquals(99, attacker.getStamina(), 0);
	}
	
	@Test
	public void withShortWeapon() {
		Character attacker = new Character();
		Character receiver = new Character();
		
		attacker.equip(new ShortWeapon());
		attacker.attack(receiver);
		
		Assert.assertEquals(85, receiver.getHealth(), 0);
		Assert.assertEquals(95, attacker.getStamina(), 0);
	}
	
	@Test
	public void withLongWeapon() {
		Character attacker = new Character();
		Character receiver = new Character();
		
		attacker.equip(new LongWeapon());
		attacker.attack(receiver);
		
		Assert.assertEquals(75, receiver.getHealth(), 0);
		Assert.assertEquals(90, attacker.getStamina(), 0);
	}
}
