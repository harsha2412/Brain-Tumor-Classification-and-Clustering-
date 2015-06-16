/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Wonderland
 */

import java.awt.image.BufferedImage;
import java.awt.image.Raster;
import java.awt.image.WritableRaster;
import java.io.File;
import javax.imageio.ImageIO;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Lily
 */
public class Bicluster {
    public static final String IMG = "C:/Users/pragati/Desktop/project/bicluster/glioma.jpg";
    public static BufferedImage getImageFromArray(int[] pixels, int width, int height) {
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_BYTE_GRAY);
            WritableRaster raster = image.getRaster();
            raster.setPixels(0,0,width,height,pixels);
            System.out.println("Writing Image");
            File output=new File("C:/Users/pragati/Desktop/project/bicluster/gliomabi.jpg");
try {
    ImageIO.write(image,"jpg",output);
}
catch (Exception e)
{
    e.printStackTrace();
}
            return image;
        }
  
    public static void main(String[] args) throws Exception   { 
        int i,j,fill=0;
      //  File input = new File("C:/Users/Harsha/Pictures/t1.jpg");
       BufferedImage img ;
       ///img.TYPE_BYTE_BINARY 
       img = ImageIO.read(new File(IMG));
       //BufferedImage img = new BufferedImage(img1.getWidth(), img1.getHeight(), img1.TYPE_BYTE_BINARY);
         int[][] array1=new int[img.getWidth()][img.getHeight()];
    int [] arr =new int[img.getWidth()*img.getHeight()];
  int [] a =new int[img.getWidth()*img.getHeight()];
            int l=0;
   
    Raster raster = img.getData();
  //  System.out.println("Binary Image");
for ( j = 0; j < img.getWidth(); j++) {
    for (int k = 0; k < img.getHeight(); k++) {
        array1[j][k] = raster.getSample(j, k, 0);
        arr[l]=array1[j][k];
                l++;
       // System.out.print(array1[j][k]+" ");
    }
      
} 
int y=255/2;
int maxn=img.getWidth()*img.getHeight();
for(i=0;i<maxn;i++)
{
    if(arr[i]<y)
    {
        a[i]=0;
    }
    else
    {
        a[i]=255;
    }
}
System.out.println("New Image");
        for(i=0;i<maxn;i++)
            System.out.print(a[i]+ " ");
Bicluster ip =new Bicluster();
 BufferedImage im =ip.getImageFromArray(a, img.getHeight(),img.getWidth() );
    }
}
