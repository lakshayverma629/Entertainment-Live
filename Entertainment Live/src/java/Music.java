
import jaco.mp3.player.MP3Player;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import javax.swing.*;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author lakshay
 */
class Music extends JFrame implements ActionListener
{
	   JButton play,pause,stop,next1,back,repeat,shuffle,close,minimize;
	JFileChooser jfc;
	   MP3Player pl;	
	JScrollPane jsp;	
	   File fl;
	ImageIcon pla,pa,ne,ba,st,br,re,sh,cl,mn;
	   Container con1;	
	
        Music()
	{
		System.out.println("working:"+System.getProperty("user.dir"));
		System.out.println("111");		
		//con1=getContentPane();
		con1.setBackground(Color.gray);

						
		pla=new ImageIcon(System.getProperty("user.dir")+"web/play.png");
		pa=new ImageIcon("webapps/headphoneslagale/player/web/pause.png");
		ne=new ImageIcon("webapps/headphoneslagale/player/web/next.png");
		ba=new ImageIcon("webapps/headphoneslagale/player/web/back.png");
		st=new ImageIcon("webapps/headphoneslagale/player/web/stop.png");		
		br=new ImageIcon("webapps/headphoneslagale/player/web/browse.png");
		re=new ImageIcon("webapps/headphoneslagale/player/web/repeat.png");
		sh=new ImageIcon("webapps/headphoneslagale/player/web/shuffle.png");
		cl=new ImageIcon("webapps/headphoneslagale/player/web/close.png");
		mn=new ImageIcon("webapps/headphoneslagale/player/web/minimize.png");
		play=new JButton(pla);
		pause=new JButton(pa);	
		stop=new JButton(st);
		next1=new JButton(ne);
		back=new JButton(ba);
		repeat=new JButton(re);
		shuffle=new JButton(sh);
		minimize=new JButton(mn);
		
		close=new JButton(cl);

		play.setBackground(Color.gray);		
		pause.setBackground(Color.gray);
		stop.setBackground(Color.gray);
		next1.setBackground(Color.gray);
		back.setBackground(Color.gray);
		repeat.setBackground(Color.gray);
		shuffle.setBackground(Color.gray);
		close.setBackground(Color.gray);
		minimize.setBackground(Color.gray);

		

		pl=new MP3Player(new File("webapps/headphoneslagale/player/songs/test.mp3"));
		//String url="webapps/headphoneslagale/player/songs/"+received_param+".mp3";
		//pl.addToPlayList(new File(url));
		play.addActionListener(this);		
		pause.addActionListener(this);	
		stop.addActionListener(this);
		next1.addActionListener(this);
		back.addActionListener(this);
		minimize.addActionListener(this);	
		close.addActionListener(this);
		
		setLayout(null);
//		jl.setVisibleRowCount(5);

		add(close);
		add(shuffle);
		add(back);
		add(play);
		add(pause);
		add(stop);	
		add(next1);		
		add(repeat);
		add(minimize);			
	
		System.out.println("2222");		
		
		setSize(414,50);

		
		shuffle.setBounds(0,0,50,50);
		back.setBounds(50,0,50,50);
		play.setBounds(100,0,50,50);
		pause.setBounds(150,0,50,50);
		stop.setBounds(200,0,50,50);
		next1.setBounds(250,0,50,50);
		repeat.setBounds(300,0,50,50);
		minimize.setBounds(350,0,32,32);
		close.setBounds(380,0,32,32);
		
		
		//setResizable(false);
		//setUndecorated(true);
		
			setLocation(
	(Toolkit.getDefaultToolkit().getScreenSize().width-getWidth())/2,
	(Toolkit.getDefaultToolkit().getScreenSize().height-getHeight())-80
	);
		System.out.println("3333");		
		
		//setLocation(300,660);		
		setVisible(true);	

		play.setToolTipText("Play");
		pause.setToolTipText("Pause");	
		stop.setToolTipText("Stop");
		next1.setToolTipText("Next");
		back.setToolTipText("Previous");
		minimize.setToolTipText("Minimize");		
		repeat.setToolTipText("Repeat");
		shuffle.setToolTipText("Shuffle");
		close.setToolTipText("Close");
		System.out.println("444");		
		

	}


public void actionPerformed(ActionEvent ae)
	{
		
		if(ae.getSource()==close)
		{
			pl.stop();
		//	dispose();	
		}
		if(ae.getSource()==minimize)
		{
		//	setState(ICONIFIED);
		}

		if(ae.getSource()==play)	
			{
			pl.play();
			}
		if(ae.getSource()==pause)	
			{
			pl.pause();
			}

		if(ae.getSource()==stop)	
			{
			pl.stop();
			}

		if(ae.getSource()==next1)	
			{
			pl.skipForward();
			}

		if(ae.getSource()==back)	
			{
			pl.skipBackward();
			}
		
		if(ae.getSource()==repeat)
			{
			if(pl.isRepeat())
				{
					pl.setRepeat(false);
				}
			else
				{
					pl.setRepeat(true);
				}
			}
		if(ae.getSource()==shuffle)
			{
			if(pl.isShuffle())
				{
					pl.setShuffle(false);
				}
			else
				{
					pl.setShuffle(true);
				}			

			}
	}

}

