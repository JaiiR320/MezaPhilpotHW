/**
 * Examples
 * holds all junit tests
 */

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;


public class Examples {
    public static final Athlete jair = new Athlete();   
    public static final Athlete cather = new Athlete();
    public static final Athlete rob = new Athlete();

    @Test
    public void examplesTest(){
        rob.result.shoot.setRounds(5, 5, 5, 5);
        rob.result.ski.setLaps(10, 10, 10, 10);
        rob.result.ski.penalties = 0;
        rob.result.ski.position = 1;

        jair.result.shoot.setRounds(5, 3, 4, 2);
        jair.result.ski.setLaps(12, 19, 21, 14);
        jair.result.ski.penalties = 2;
        jair.result.ski.position = 3;

        cather.result.shoot.setRounds(0, 0, 0, 0);
        cather.result.ski.setLaps(30, 30, 10, 30);
        cather.result.ski.penalties = 5;
        cather.result.ski.position = 100;

        //pointsEarned (ShootingResult)
        assertEquals(20, rob.result.shoot.pointsEarned(), .01);
        assertEquals(14.0, jair.result.shoot.pointsEarned(), .01);
        assertEquals(0, cather.result.shoot.pointsEarned(), .01);

        //pointsEarned (SkiingResult)
        assertEquals(40.0, rob.result.ski.pointsEarned(), .01);
        assertEquals(66.0, jair.result.ski.pointsEarned(), .01);
        assertEquals(100.0, cather.result.ski.pointsEarned(), .01);

        //getPenalties (ShootingResult)
        assertEquals(0.0, rob.result.shoot.getPenalties(), .01);
        assertEquals(360.0, jair.result.shoot.getPenalties(), .01);
        assertEquals(1200.0, cather.result.shoot.getPenalties(), .01);

        //getPenalties (SkiingResult)
        assertEquals(0.0, rob.result.ski.getPenalties(), .01);
        assertEquals(10.0, jair.result.ski.getPenalties(), .01);
        assertEquals(25.0, cather.result.ski.getPenalties(), .01);

        //finalScore
        assertEquals(30, rob.result.finalScore(), .01);
        assertEquals(433.0, jair.result.finalScore(), .01);
        assertEquals(1325.0, cather.result.finalScore(), .01);

        //betterSkiier - will not input equal cases
        assertTrue(rob.betterSkiier(jair));
        assertTrue(rob.betterSkiier(cather));
        assertTrue(jair.betterSkiier(cather));
        assertFalse(jair.betterSkiier(rob));
        assertFalse(cather.betterSkiier(rob));
        assertFalse(cather.betterSkiier(jair));

        //betterShooter - will not input equal cases
        assertTrue(rob.betterShooter(jair));
        assertTrue(rob.betterShooter(cather));
        assertTrue(jair.betterShooter(cather));
        assertFalse(jair.betterShooter(rob));
        assertFalse(cather.betterShooter(rob));
        assertFalse(cather.betterShooter(jair));

        //hasBeaten
        assertTrue(rob.hasBeaten(jair));
        assertTrue(rob.hasBeaten(cather));
        assertTrue(jair.hasBeaten(cather));
        assertFalse(jair.hasBeaten(rob));
        assertFalse(cather.hasBeaten(rob));
        assertFalse(cather.hasBeaten(jair));
    }
}

