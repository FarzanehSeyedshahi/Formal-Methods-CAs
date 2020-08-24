mtype = {red, green, none, crossing, waiting};
mtype light;
mtype crosswalk_mode;
int count;
chan pedestrian_chan = [0] of {int};
chan signal = [0] of {mtype};

ltl l1{signal[0] == green -> (light == green ) U pedestrian[0] == 0}
ltl l2{pedestrian[0] != 0 -> crosswalk_mode = waiting U light == green}

proctype logic_unit(chan pedestrian_in, signal)
{

do
	::pedestrian_in ? count;
    ::if
      ::(count >= 5) -> 
		signal ! green;
        count = 0;
		pedestrian_in ! 0;
        
      ::(count < 5) -> 
		signal ! red;//or skip
      fi
od  

}

proctype sensor(chan signal, pedestrian_out)

{
do
    ::if
      ::(crosswalk_mode == crossing) ->
        if
        ::(signal == green) -> crosswalk_mode = none;
        fi
      ::(crosswalk_mode == none) ->
        if  
        :: (1 == 1) -> crosswalk_mode = none
        :: (1 == 1) -> 
			count=count+1
            pedestrian_out ! count
            crosswalk_mode = waiting
        fi
      ::(crosswalk_mode == waiting) ->
        if
        ::(signal == red) -> crosswalk_mode = crossing;
        fi
      fi
od   
}


init

{

    count = 0;

    light = red;

    crosswalk_mode = crossing;


    atomic
    {
        run logic_unit(pedestrian_chan, signal);
        run sensor( signal, pedestrian_chan);
    }

}
