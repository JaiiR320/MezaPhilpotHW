import org.junit.*;
import static org.junit.Assert.*;

public class Examples {
    Athlete rob = new Athlete (new FinalResult(new ShootingResult(new ShootingRound(0), new ShootingRound(0), new ShootingRound(0), new ShootingRound(0)), new SkiingResult(5, 145.32,143.2, 155.43, 180.01, 0)));
    Athlete jair = new Athlete (new FinalResult(new ShootingResult(new ShootingRound(5), new ShootingRound(5), new ShootingRound(5), new ShootingRound(5)), new SkiingResult(1,120, 122.23, 118.76, 148.23,2)));
    Athlete cather = new Athlete (new FinalResult(new ShootingResult(new ShootingRound(3), new ShootingRound(3), new ShootingRound(3), new ShootingRound(3)), new SkiingResult(4, 122.12, 126.65, 130.55, 167.31, 1)));

    @Test
    public void skiingGetPenalties(){
        assertEquals(0, rob.finalResult.skiingResult.getPenalties(),0.01);
        assertEquals(10, jair.finalResult.skiingResult.getPenalties(), 0.01);
        assertEquals(5, cather.finalResult.skiingResult.getPenalties(), 0.01);
    }

    @Test
    public void skiingPointsEarned(){
        assertEquals(623.96, rob.finalResult.skiingResult.pointsEarned(),0.01);
        assertEquals(509.22, jair.finalResult.skiingResult.pointsEarned(),0.01);
        assertEquals(546.6300000000001, cather.finalResult.skiingResult.pointsEarned(),0.01);
    }

    @Test
    public void shootingGetPenalties(){
        assertEquals(1200.0, rob.finalResult.shootingResult.getPenalties(),0.01);
        assertEquals(0, jair.finalResult.shootingResult.getPenalties(),0.01);
        assertEquals(480, cather.finalResult.shootingResult.getPenalties(),0.01);
    }

    @Test
    public void shootingPointsEarned(){
        assertEquals(0, rob.finalResult.shootingResult.pointsEarned(),0.01);
        assertEquals(20, jair.finalResult.shootingResult.pointsEarned(),0.01);
        assertEquals(12, cather.finalResult.shootingResult.pointsEarned(),0.01);
    }

    @Test
    public void finalResultFinalScore(){
        assertEquals(1823.96, rob.finalResult.finalScore(),0.01);
        assertEquals(529.22, jair.finalResult.finalScore(),0.01);
        assertEquals(1042.63, cather.finalResult.finalScore(),0.01);
    }

    @Test
    public void athleteBetterSkier(){
        assertTrue(rob.betterSkier(jair));
        assertTrue(rob.betterSkier(cather));
        assertFalse(jair.betterSkier(rob));
        assertFalse(jair.betterSkier(cather));
        assertFalse(cather.betterSkier(rob));
        assertTrue(cather.betterSkier(jair));
    }

    @Test
    public void athleteBetterShooter(){
        assertFalse(rob.betterShooter(jair));
        assertFalse(rob.betterShooter(cather));
        assertTrue(jair.betterShooter(rob));
        assertTrue(jair.betterShooter(cather));
        assertTrue(cather.betterShooter(rob));
        assertFalse(cather.betterShooter(jair));
    }

    @Test
    public void athleteHasBeaten(){
        assertTrue(rob.hasBeaten(jair));
        assertTrue(rob.hasBeaten(cather));
        assertTrue(jair.hasBeaten(rob));
        assertTrue(jair.hasBeaten(cather));
        assertTrue(cather.hasBeaten(rob));
        assertTrue(cather.hasBeaten(jair));
    }
}
