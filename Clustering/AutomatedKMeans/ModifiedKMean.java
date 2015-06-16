
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
 * @author Wonderland
 */
public class ModifiedKMean {
     public static final String IMG = "E:/study/FYP/Input/normal.jpg";
    public static BufferedImage getImageFromArray(int[] pixels, int width, int height) {
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_BYTE_GRAY);
            WritableRaster raster = image.getRaster();
            raster.setPixels(0,0,width,height,pixels);
            File output=new File("E:/study/FYP/Output/normalmodkmean.jpg");
try {
    ImageIO.write(image,"jpg",output);
}
catch (Exception e)
{
    e.printStackTrace();
}
            return image;
        }
     public static int search (int[] arr,int val,int size)
    {
        int res=0;
        for(int i=0;i<size;i++)
        {
            if(arr[i]==val)
            {
                res=1;
                break;
            }
        }
        return res;
    }
      public static int findMax(double[] fit,int gen)
       {
           int kval=2;
           double currentValue = fit[2]; 
           for (int j=3; j < gen; j++) {
               System.out.println("CurrentValue= "+currentValue);
			if (fit[j] > currentValue)
                        { 
				currentValue = fit[j];
                                kval= j;
                        }
		}
           System.out.println("Max Fitness Val "+ fit[kval]);
                return kval;
       }
     public static double CalDistance(double x,double y)
     {
         double dis=0;
         dis=x-y;
         if(dis<0)
             dis=-dis;
         return dis;
     }
      public static int findMin(double[] dis,int k)
    {
    	double currentValue = dis[0]; 
		int smallestIndex = 0;
		for (int j=1; j < k; j++) {
			if (dis[j] < currentValue)
                        { 
				currentValue = dis[j];
                                smallestIndex = j;
                        }
		}
                return smallestIndex;
    }
 
      
       public static void main(String[] args) throws Exception   { 
      
      int i,j,fill=0;
      //  File input = new File("C:/Users/Harsha/Pictures/t1.jpg");
       BufferedImage img ;
    img = ImageIO.read(new File(IMG));
    System.out.println("Size" + img.getHeight()+"  "+ img.getWidth() );
    int [] tnew =new int[img.getWidth()*img.getHeight()];
    int[][] array1=new int[img.getWidth()][img.getHeight()];
    int [] arr =new int[img.getWidth()*img.getHeight()];
  
            int l=0;
   
    Raster raster = img.getData();
for ( j = 0; j < img.getWidth(); j++) {
    for (int k = 0; k < img.getHeight(); k++) {
        array1[j][k] = raster.getSample(j, k, 0);
        arr[l]=array1[j][k];
                l++;
       // System.out.print(array1[j][k]+" ");
    }
      
}   
int maxn=img.getWidth()*img.getHeight();
int[] arrnew =new int[maxn];
int gen=10;
 double[] intra=new double[gen];
          double[] inter=new double[gen];
          double[] fitness=new double[gen];
/*BufferedReader br = new BufferedReader (new InputStreamReader(System.in));
	System.out.println("Enter number of clusters");*/
	 int nc=2;
                int cgen=0;
        System.out.println("K Means");
         while(nc<gen)
                {
         double[][] interDis =new double[nc][nc];
        int c=0;
        int [] iseed=new int [nc];
         int[][] kmean=new int [maxn][nc];
          int flag=0;
          int[][] t=new int[maxn][nc];
          int[] lowest=new int[nc];
        double[] tmean =new double[nc];
        //int
        double[] mean=new double[nc];
        double[] sum = new double[nc];
         double[][] distance =new double [maxn][nc];
         int[] countelements = new int[nc];
        int[] tcount =new int[nc];
        int g=0;
        int initial=-1;
        for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
             kmean[i][c]= initial;   
            }
         }
        for(c=0;c<nc;c++)
         {
             iseed[c]=(int)( 0 + (Math.random() * ((maxn) - 0)));
            // System.out.println(iseed[c]);
            kmean[iseed[c]][c]=iseed[c];
             
        //System.out.println("chosen seed "+ kmean[iseed[c]][c]);
             
         }
        int d;
         for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
                if(i!=kmean[0][c])
                {
                int seed=iseed[c];
                int s=arr[seed];
                d=arr[i];
                g=s-d;
               if(g<0)
                   g=-g;
               distance[i][c]=g;
               
                }
                else 
                   distance[i][c]=0; 
               
            }
         }
      //   int [] cnt =new int[nc];
         int y=0;
         for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
                if(search(iseed,i,nc)==0)
                {
                  //  System.out.println("i to be tested");
                   
                        y=findMin(distance[i],nc);
                        kmean[i][y]=i;
                        //cnt++;
                   
                    
                }
               
            } 
             
         }
	
       for(c=0;c<nc;c++)
            {
               // mean[c]=0;
               // cnt=0;
                //System.out.println("cluster" +(c+1));
            for(i=0;i<maxn;i++) 
            {
               
                //System.out.printf("%3s",c);
               if(kmean[i][c]==initial);
               // System.out.printf(" ");
                else
               {
                //System.out.printf("%3s byte value",byte_buffer[kmean[i][c]]);
                //System.out.print("kmean"+kmean[i][c]);
                sum[c]=sum[c]+arr[kmean[i][c]];
            
                countelements[c]++;
               }
                
            }
          // System.out.println("\nSum = "+ sum[c]);
            if(sum[c]==0)
                mean[c]=0;
            else
            mean[c]=sum[c]/countelements[c];
            
            }
       for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
            t[i][c]=initial;  
            tmean[c]=mean[c];
           // tcount[c]=count
            }
         }
        int run=0;
       while(flag==0)
        {
            run++;
            for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
            t[i][c]=-1;   
            }
         }
            for(i=0;i<nc;i++)
            {
                tcount[i]=0;
          
                 
                for(j=0;j<maxn;j++)
                {
               distance[j][i]=CalDistance(tmean[i], (double)arr[j]);
              
                        }
               /// System.out.println();
            }
            for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
                  //  System.out.println("i to be tested");
                   
                        y=findMin(distance[i],nc);
                        t[i][y]=i;
                       
            }
         }
              for(c=0;c<nc;c++)
            {
                sum[c]=0;
            for(i=0;i<maxn;i++) 
            {
               if(t[i][c]==-1);
                else
               {
                  
                sum[c]=sum[c]+arr[t[i][c]];
              
                tcount[c]++;
               }
                
            }
          
            if(sum[c]==0)
                tmean[c]=0;
            else
            tmean[c]=sum[c]/tcount[c];
        
            }
              for(c=0;c<nc;c++)
              {
                  if(tcount[c]!=countelements[c] || tmean[c]!=mean[c])
                  {
                     flag=0;
                     break;
                  }
                  else
                      flag=1;
              }
              for( i=0;i<maxn;i++)
        {
            for( j=0;j<nc;j++)
            {
                kmean[i][j]=t[i][j];
                mean[j]=tmean[j];
                countelements[j]=tcount[j];
            
            }
           // System.out.println();
        }
           
 
        }//end While
        
        for(c=0;c<nc;c++)
            {
                lowest[c]=1000;
                mean[c]=0;
                countelements[c]=0;
                sum[c]=0;
                // System.out.println("cluster" +(c+1));
            for(i=0;i<maxn;i++) 
            {
                 // System.out.printf("%3s",kmean[i][c]+ " &"); 
                //System.out.printf("%3s",c);
               if(kmean[i][c]==-1);
               // System.out.printf(" ");
                else
               {
                  // System.out.println("Here");
           //  System.out.printf("%3s",arr[kmean[i][c]]); 
             if(arr[kmean[i][c]]<lowest[c])
                 lowest[c]=arr[kmean[i][c]];
                    // tnew[kmean[i][c]]=lowest[c];
                sum[c]=sum[c]+arr[kmean[i][c]];
               
                countelements[c]++;
               }
                
            }
          // System.out.println("\nSum = "+ sum[c]);
            if(sum[c]==0)
            {
                mean[c]=0;
            }
            else
            {
            mean[c]=sum[c]/countelements[c];
           
            }
       
           // System.out.println("\n Mean Value = "+mean[c]);
           // System.out.println("\nMinimum Val :"+lowest[c]);
                 // int m=(int)mean[c];
              //bytenew[fill++]=(byte)m;
            }
        for(c=0;c<nc;c++)
            {
             System.out.println("Mean = "+ mean[c]); 
    for(i=0;i<maxn;i++) 
            {
                 // System.out.printf("%3s",kmean[i][c]+ " &"); 
                //System.out.printf("%3s",c);
               if(kmean[i][c]==-1);
               // System.out.printf(" ");
                else
               {
                   
                   double temp=mean[c]-(double)arr[i];
                  // System.out.println("Value and Difference is"+FindValue(i)+"   "+ temp  );
                   if(temp<0)
                       temp=-temp;
    intra[nc]=intra[nc]+temp;
                
            }
            }
            }
          double intercluster;
        //double fitness;
        for(i=0;i<nc;i++)
        {
            for(j=0;j<nc;j++)
            {
                if(i!=j)
                {
                interDis[i][j]=mean[i]-mean[j];
                if(interDis[i][j]<0)
                    interDis[i][j]=-interDis[i][j];
                }
                else 
                    interDis[i][j]=-1;
            }
        }
        intercluster=interDis[0][1];
          for(i=0;i<nc;i++)
        {
            for(j=0;j<nc;j++)
            {
                if(i!=j)
                {
                 if(intercluster>interDis[i][j])
                      intercluster=interDis[i][j];
                }
                    
                    
                    }
            
            
        }
          inter[nc]= intercluster;
          intra[nc]=intra[nc]/maxn;
          fitness[nc]=inter[nc]/intra[nc];
           System.out.println("For nc ="+nc+ " intra cluster ="+ intra[nc]);
            System.out.println("For nc ="+nc+ " inter="+ inter[nc]);
       System.out.println("For nc ="+nc+ "  Fitness Value Actual ="+ fitness[nc]);
      //  intra[nc]=intra[nc]/n;
         //System.out.println("For nc ="+nc+ "  Fitness Value Inverted ="+intra[nc]);
        
       
       
       
       
         int p=0;
        for(i=0;i<maxn;i++)
        {
            for(c=0;c<nc;c++)
            {
                if(kmean[i][c]!=initial)
                    tnew[kmean[i][c]]=(int)mean[c];
            }
        }
        cgen++;
       nc++;
                }//End Automated KMEAN
       
      
       /* for(c=0;c<nc;c++)
  {
     // int m=(int)mean[c];
      for(i=0;i<countelements[c];i++)
      {2
         /// tnew[p++]=
          arrnew[fill++]=lowest[c];
      }
  }*/
         int finalkvalue =findMax(fitness, gen);
                System.out.println("Optimized k= "+  finalkvalue);
                nc=finalkvalue;
                System.out.println("K Means");
        int c=0;
        int [] iseed=new int [nc];
         int[][] kmean=new int [maxn][nc];
          int flag=0;
          int[][] t=new int[maxn][nc];
          int[] lowest=new int[nc];
        double[] tmean =new double[nc];
        //int
        double[] mean=new double[nc];
        double[] sum = new double[nc];
         double[][] distance =new double [maxn][nc];
         int[] countelements = new int[nc];
        int[] tcount =new int[nc];
        int g=0;
        int initial=-1;
        for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
             kmean[i][c]= initial;   
            }
         }
        for(c=0;c<nc;c++)
         {
             iseed[c]=(int)( 0 + (Math.random() * ((maxn) - 0)));
             System.out.println(iseed[c]);
            kmean[iseed[c]][c]=iseed[c];
             
        System.out.println("chosen seed "+ kmean[iseed[c]][c]);
             
         }
        int d;
         for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
                if(i!=kmean[0][c])
                {
                int seed=iseed[c];
                int s=arr[seed];
                d=arr[i];
                g=s-d;
               if(g<0)
                   g=-g;
               distance[i][c]=g;
               
                }
                else 
                   distance[i][c]=0; 
               
            }
         }
      //   int [] cnt =new int[nc];
         int y=0;
         for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
                if(search(iseed,i,nc)==0)
                {
                  //  System.out.println("i to be tested");
                   
                        y=findMin(distance[i],nc);
                        kmean[i][y]=i;
                        //cnt++;
                   
                    
                }
               
            } 
             
         }
	
       for(c=0;c<nc;c++)
            {
               // mean[c]=0;
               // cnt=0;
                //System.out.println("cluster" +(c+1));
            for(i=0;i<maxn;i++) 
            {
               
                //System.out.printf("%3s",c);
               if(kmean[i][c]==initial);
               // System.out.printf(" ");
                else
               {
                //System.out.printf("%3s byte value",byte_buffer[kmean[i][c]]);
                //System.out.print("kmean"+kmean[i][c]);
                sum[c]=sum[c]+arr[kmean[i][c]];
            
                countelements[c]++;
               }
                
            }
          // System.out.println("\nSum = "+ sum[c]);
            if(sum[c]==0)
                mean[c]=0;
            else
            mean[c]=sum[c]/countelements[c];
            
            }
       for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
            t[i][c]=initial;  
            tmean[c]=mean[c];
           // tcount[c]=count
            }
         }
        int run=0;
       while(flag==0)
        {
            run++;
            for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
            t[i][c]=-1;   
            }
         }
            for(i=0;i<nc;i++)
            {
                tcount[i]=0;
          
                 
                for(j=0;j<maxn;j++)
                {
               distance[j][i]=CalDistance(tmean[i], (double)arr[j]);
              
                        }
               /// System.out.println();
            }
            for(i=0;i<maxn;i++)
         {
            for(c=0;c<nc;c++)
            {
                  //  System.out.println("i to be tested");
                   
                        y=findMin(distance[i],nc);
                        t[i][y]=i;
                       
            }
         }
              for(c=0;c<nc;c++)
            {
                sum[c]=0;
            for(i=0;i<maxn;i++) 
            {
               if(t[i][c]==-1);
                else
               {
                  
                sum[c]=sum[c]+arr[t[i][c]];
              
                tcount[c]++;
               }
                
            }
          
            if(sum[c]==0)
                tmean[c]=0;
            else
            tmean[c]=sum[c]/tcount[c];
        
            }
              for(c=0;c<nc;c++)
              {
                  if(tcount[c]!=countelements[c] || tmean[c]!=mean[c])
                  {
                     flag=0;
                     break;
                  }
                  else
                      flag=1;
              }
              for( i=0;i<maxn;i++)
        {
            for( j=0;j<nc;j++)
            {
                kmean[i][j]=t[i][j];
                mean[j]=tmean[j];
                countelements[j]=tcount[j];
            
            }
           // System.out.println();
        }
           
 
        }//end While
        
        for(c=0;c<nc;c++)
            {
                lowest[c]=1000;
                mean[c]=0;
                countelements[c]=0;
                sum[c]=0;
                 System.out.println("cluster" +(c+1));
            for(i=0;i<maxn;i++) 
            {
                 // System.out.printf("%3s",kmean[i][c]+ " &"); 
                //System.out.printf("%3s",c);
               if(kmean[i][c]==-1);
               // System.out.printf(" ");
                else
               {
                  // System.out.println("Here");
             System.out.printf("%3s",arr[kmean[i][c]]); 
             if(arr[kmean[i][c]]<lowest[c])
                 lowest[c]=arr[kmean[i][c]];
                    // tnew[kmean[i][c]]=lowest[c];
                sum[c]=sum[c]+arr[kmean[i][c]];
               
                countelements[c]++;
               }
                
            }
          // System.out.println("\nSum = "+ sum[c]);
            if(sum[c]==0)
            {
                mean[c]=0;
            }
            else
            {
            mean[c]=sum[c]/countelements[c];
           
            }
       
            System.out.println("\n Mean Value = "+mean[c]);
           // System.out.println("\nMinimum Val :"+lowest[c]);
                 // int m=(int)mean[c];
              //bytenew[fill++]=(byte)m;
            }
        int p=0;
        for(i=0;i<maxn;i++)
        {
            for(c=0;c<nc;c++)
            {
                if(kmean[i][c]!=initial)
                    tnew[kmean[i][c]]=(int)mean[c];
            }
        }
        
        for(i=0;i<maxn;i++)
        {
            System.out.print(tnew[i]+ " ");
        }
                
                
System.out.println();
          System.out.println();
           System.out.println("New Image");
        for(i=0;i<maxn;i++)
            System.out.print(tnew[i]+ " ");
       ModifiedKMean ip =new ModifiedKMean();
 BufferedImage im =ip.getImageFromArray(tnew, img.getHeight(),img.getWidth() );
         
         
      
      
      
     }//End Main     
}//End class
      
      
  