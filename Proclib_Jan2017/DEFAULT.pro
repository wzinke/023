// This sets all of the user defined global variables.
// It is needed because of the loop structure which allows multiple tasks to run 
// from the same protocol.  If multiple protocols use the same variables, we may 
// run into problems if we don't specifically reset them at the beginning of each
// task change.
//
// written by david.c.godlove@vanderbilt.edu 	July, 2011


declare DEFAULT(int state, 
				int monkey, 
				int room);

process DEFAULT(int state, 
				int monkey, 
				int room)
	{
	
	declare hide int run_cmd_sess 		= 1;	// state 1 is countermanding
	declare hide int run_fix_sess 		= 2;	// state 2 is fixation
	declare hide int run_mg_sess 		= 3;	// state 3 is mem guided sacc
	declare hide int run_gonogo_sess	= 4;	// state 4 is gonogo
	declare hide int run_flash_sess		= 5;	// state 5 is flash screen protocol
	declare hide int run_delayed_sess   = 6;
	declare hide int run_search_sess    = 7;

	

	declare hide int xena    	= 1;
	declare hide int euler		= 2; // in this case e is 6 not 2.71828183
	declare hide int broca		= 3;	
	declare hide int helmholtz	= 4;
    declare hide int gauss		= 5;

	declare hide int color_num,r_, g_, b_;
	r_ = 0; g_ = 1; b_ = 2;

	
	Trls_per_block 			= 10000; // In other words, there are no blocks
	
	//----------------------------------------------------------------------------------------------------------------
	// Trial type distributions (MUST SUM TO 100)
	Go_weight				= 0.0;
	Stop_weight				= 100.0;
	Ignore_weight			= 0.0;
	
	DR1_flag				= 0;	// We don't normally want to do 1DR version.
	
	Bonus_weight			= 0.0;	// percentage of time that the subject is wrong but gets rewarded anyway.
	Dealer_wins_weight		= 0.0;	// percentage of time that the subject is right but gets punished anyway.
	
	BigR_weight				= 0;// weights for random changes of reward size
	MedR_weight				= 100;// weights for random changes of reward size
	SmlR_weight				= 0;// weights for random changes of reward size
	SmlP_weight				= 0;// weights for random changes of punsiment size
	MedP_weight				= 100;// weights for random changes of punsiment size
	BigP_weight				= 0;// weights for random changes of punsiment size
	
	
	
	//----------------------------------------------------------------------------------------------------------------
	// Stimulus properties
	// White iso luminant value is 35,33,27;
	// Red iso luminant value is is 63,0,0;
	// Green iso luminant value is 0,36,0;
	// Blue iso luminant value is 0,0,59;
	
	//////////// Default Search Variables
	TargetType				= 1; //1 = L, 2 = T
	PlacPres				= 1; // 1 = absent, 2 = present
	SearchType				= 2; //Hetero = 1, Homo = 2
	SetSize					= 1; //SS1 = 1, SS2 = 2, SS4 = 3, SS8 = 4, SS12 = 5
	search_fix_time			= 500; //
	plac_duration	 		= 1000; //consider adding to ALLVARS.pro
	////////////
	
	
	Classic					= 0;
	
	Stop_sig_color[r_]		= 63;	
	Stop_sig_color[g_]		= 0;	
	Stop_sig_color[b_]		= 0;	
	
	Ignore_sig_color[r_]	= 0;	
	Ignore_sig_color[g_]	= 36;	
	Ignore_sig_color[b_]	= 0;	
					
	Fixation_color[r_]		= 35;	
	Fixation_color[g_]		= 33;	
	Fixation_color[b_]		= 27;	
	
	N_targ_pos				= 2;	// number of target positions (this is calculated below based on user input)
									
	Color_list[0,r_]		= 35;	// color of each target individually
	Color_list[0,g_]		= 33;	// color of each target individually
	Color_list[0,b_]		= 27;	// color of each target individually
					
	Color_list[1,r_]		= 35;
	Color_list[1,g_]		= 33;
	Color_list[1,b_]		= 27;
					
	Color_list[2,r_]		= 35;
	Color_list[2,g_]		= 33;
	Color_list[2,b_]		= 27;
							
	Color_list[3,r_]		= 35;
	Color_list[3,g_]		= 33;
	Color_list[3,b_]		= 27;
					
	Color_list[4,r_]		= 35;
	Color_list[4,g_]		= 33;
	Color_list[4,b_]		= 27;
							
	Color_list[5,r_]		= 35;
	Color_list[5,g_]		= 33;
	Color_list[5,b_]		= 27;
							
	Color_list[6,r_]		= 35;
	Color_list[6,g_]		= 33;
	Color_list[6,b_]		= 27;
							
	Color_list[7,r_]		= 35;
	Color_list[7,g_]		= 33;
	Color_list[7,b_]		= 27;

	Color_list[8,r_]		= 35;
	Color_list[8,g_]		= 33;
	Color_list[8,b_]		= 27;

	Color_list[9,r_]		= 35;
	Color_list[9,g_]		= 33;
	Color_list[9,b_]		= 27;

	Color_list[10,r_]		= 35;
	Color_list[10,g_]		= 33;
	Color_list[10,b_]		= 27;

	Color_list[11,r_]		= 35;
	Color_list[11,g_]		= 33;
	Color_list[11,b_]		= 27;	
	
	
	Size_list[0]			= 0.5;	// size of each target individually (degrees)
	Size_list[1]			= 0.5;
	Size_list[2]			= 0.5;
	Size_list[3]			= 0.5;
	Size_list[4]			= 0.5;
	Size_list[5]			= 0.5;
	Size_list[6]			= 0.5;
	Size_list[7]			= 0.5;
	Size_list[8]			= 0.5;
	Size_list[9]			= 0.5;
	Size_list[10]			= 0.5;
	Size_list[11]			= 0.5;

	
	Angle_list[0]			= 0;	// angle of each target individually (degrees)
	Angle_list[1]			= 180;
	Angle_list[2]			= 90;
	Angle_list[3]			= 135;
	Angle_list[4]			= 180;
	Angle_list[5]			= -135;
	Angle_list[6]			= -90;
	Angle_list[7]			= -45;
	
	Eccentricity_list[0]	= 10.0;	// distance of each target from center of screen individually (degrees)
	Eccentricity_list[1]	= 10.0;
	Eccentricity_list[2]	= 10.0;
	Eccentricity_list[3]	= 10.0;
	Eccentricity_list[4]	= 10.0;
	Eccentricity_list[5]	= 10.0;
	Eccentricity_list[6]	= 10.0;
	Eccentricity_list[7]	= 10.0;
	Eccentricity_list[8]	= 10.0;
	Eccentricity_list[9]	= 10.0;
	Eccentricity_list[10]	= 10.0;
	Eccentricity_list[11]	= 10.0;
	
	Reward_weight_list[0]	= 1.0; 	// this number will be multiplied by the time of solonoid opening to weight reward by locations (1DR).  
	Reward_weight_list[1]	= 1.0;
	Reward_weight_list[2]	= 1.0;
	Reward_weight_list[3]	= 1.0;
	Reward_weight_list[4]	= 1.0;
	Reward_weight_list[5]	= 1.0;
	Reward_weight_list[6]	= 1.0;
	Reward_weight_list[7]	= 1.0;
	Reward_weight_list[8]	= 1.0;
	Reward_weight_list[9]	= 1.0;
	Reward_weight_list[10]	= 1.0;
	Reward_weight_list[11]	= 1.0;
	
	
	Fixation_size			= .5;	// size of the fixatoin point (degrees)	
	
	Success_Tone_bigR		= 100;	// positive secondary reinforcer in Hz (large reward)
	Success_Tone_medR		= 200;	// positive secondary reinforcer in Hz (medium reward)
	Success_Tone_smlR		= 400;	// positive secondary reinforcer in Hz (small reward)		
	Failure_Tone_smlP		= 800;	// negative secondary reinforcer in Hz (short timeout)
	Failure_Tone_medP		= 1600;	// negative secondary reinforcer in Hz (medium timeout)
	Failure_Tone_bigP		= 3200;	// negative secondary reinforcer in Hz (long timeout)	
	
	Fixation_Target 		= 0;	// Target number for the fixation task (not used here);
	
	//----------------------------------------------------------------------------------------------------------------
	// Eye related variables
	Fix_win_size			= 2.5;	// size of fixation window (degrees)
	Targ_win_size			= 6;	// size of target window (degrees)
	
	
	
	//----------------------------------------------------------------------------------------------------------------
	// Task timing paramaters (all times in ms unless otherwise specified)
	Allowed_fix_time		= 2000;	// subject has this long to acquire fixation before a new trial is initiated
	Expo_Jitter_soa				= 0;	// defines if exponential holdtime is used or if holdtime is sampled from rectanglular dist.
	expo_jitter 			= 1;
	Min_Holdtime			= 500;  // minimum time after fixation before target presentation
	Max_Holdtime			= 1000; // maximum time after fixation before target presentation
	Min_SOA					= 0;	// minimum time between target onset and fixation offset (mem guided only)
	Max_SOA					= 1000;	// maximum time between target onset and fixation offset (mem guided only)
	Min_saccade_time		= 0;
	Max_saccade_time		= 800;	// subject has this long to saccade to the target
	Max_sacc_duration		= 100;	// once the eyes leave fixation they must be in the target before this time is up
	Targ_hold_time			= 600; 	// after saccade subject must hold fixation at target for this long
	Staircase				= 1;	// do we select the next SSD based on a staircasing algorithm?
	
	SSD_list[0]				= 3;	// needs to be in vertical retrace units
	SSD_list[1]				= 6;
	SSD_list[2]				= 9;
	SSD_list[3]				= 12;
	SSD_list[4]				= 0;
	SSD_list[5]				= 0;
	SSD_list[6]				= 0;
	SSD_list[7]				= 0;
	SSD_list[8]				= 0;
	SSD_list[9]				= 0;
	SSD_list[10]			= 0;
	SSD_list[11]			= 0;
	SSD_list[12]			= 0;
	SSD_list[13]			= 0;
	SSD_list[14]			= 0;
	SSD_list[15]			= 0;
	SSD_list[16]			= 0;
	SSD_list[17]			= 0;
	SSD_list[18]			= 0;
	SSD_list[19]			= 0;
	
 	SSD_floor 				= 0;	// for training to cancel consistantly
 	SSD_ceil				= 0;	// for training to cancel consistantly
	
	Cancl_time				= Max_saccade_time * 2;	// subject must hold fixation for this long on a stop trial to be deemed canceled
	Tone_Duration			= 30;	// how long should the error and success tones be presented?
	Exp_juice 				= 0;	// Exponential juice reward duration by reaction time
	Reward_Offset			= 600;	// how long after tone before juice is given (needed to seperate primary and secondary reinforcement)
	Base_Reward_time		= 60;	// medium time for the juice solonoid to remain open (monkeys are very interested in this varaible)
	Base_Punish_time		= 2000;	// medium time out for messing up (monkeys care less for this one)
	Max_move_ct				= 5;	// for training to be still with a motion detector
	Bmove_tout				= 2000;	// for training to be still with a motion detector
	TrainingStill			= 0;	// Indicates that we are using motion detector to train the monk to be still
	Canc_alert				= 0;	// Alert operator that the monk has canceled a trial (during training)
	Fixed_trl_length		= 1;	// 1 for fixed trial length, 0 for fixed inter trial intervals
	Trial_length			= 0; 	// fixed at this value (only works if Fixed_trl_length == 1) must figure out max time for this variable and include it in comments
	Inter_trl_int			= 200;	// how long between trials (only works if Fixed_trl_length == 0)
	
	
	
	
	
	
	
	//--------------------------------------------------------------------------------------------------------------------
	// Xena
	if(monkey == xena)
		{		
		
		// GENERAL ACROSS ALL TASKS---------------------------------------------------------------------------------------
		// distance from center of subjects eyeball to screen
		if(room == 28)
			{
			Subj_dist	= 457.0;
			TrainingStill = 0;		
			}
		else if (room == 29)
			{
			Subj_dist	= 535.0;
			}
		// else if (room == 23)
			// {
			// }
			
		Set_tones = 1;
		
		Fix_win_size			= 3.5;
		Targ_win_size			= 5;	
		
		Allowed_fix_time		= 1000;
		Max_saccade_time		= 800;
		Base_Reward_time		= 50;
		Base_Punish_time		= 1000;
		
		// SEARCH TASK SPECIFIC--------------------------------------------------------------------------------------
		if (state == run_search_sess)
			{
			Trls_per_block 			= 10000;
			
			DR1_flag				= 0;
			
			Go_weight				= 100.0;
			Stop_weight				= 0.0;
			Ignore_weight			= 0.0;
			
			Reward_weight_list[0]	= 0.50; 	// DR1 (this works like ring buffer in DR1)
			Reward_weight_list[1]	= 1.0;
			Reward_weight_list[2]	= 0.50;
			Reward_weight_list[3]	= 1.0;
			Reward_weight_list[4]	= 0.50;
			Reward_weight_list[5]	= 1.0;
			Reward_weight_list[6]	= 0.50;
			Reward_weight_list[7]	= 1.0;
			Reward_weight_list[8]	= 0.50;
			Reward_weight_list[9]	= 1.0;
			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			Size_list[8]			= 1.5;
			Size_list[9]			= 1.5;
			Size_list[10]			= 1.5;
			Size_list[11]			= 1.5;			
			
			Eccentricity_list[0]	= 3;	
			Eccentricity_list[1]	= 6;
			Eccentricity_list[2]	= 9;
			Eccentricity_list[3]	= 6;
			Eccentricity_list[4]	= 6;	
			Eccentricity_list[5]	= 9;
			Eccentricity_list[6]	= 2;
			Eccentricity_list[7]	= 4;
			Eccentricity_list[8]	= 5;	
			Eccentricity_list[9]	= 6;
			Eccentricity_list[10]	= 8;
			Eccentricity_list[11]	= 9;
						
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 30;
			Angle_list[2]			= 60;
			Angle_list[3]			= 90;
			Angle_list[4]			= 120;
			Angle_list[5]			= 150;
			Angle_list[6]			= 180;
			Angle_list[7]			= 210;
			Angle_list[8]			= 240;
			Angle_list[9]			= 270;
			Angle_list[10]			= 300;
			Angle_list[11]			= 330;
			}		
	
		
		
		// STOP SIGNAL TASK SPECIFIC--------------------------------------------------------------------------------------
		if (state == run_cmd_sess)
			{
			Trls_per_block 			= 20;
			N_targ_pos = 2;
			DR1_flag				= 1;
			
			Go_weight				= 50.0;
			Stop_weight				= 50.0;
			Ignore_weight			= 0.0;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
			
			Stop_sig_color[r_]		= 0;	
			Stop_sig_color[g_]		= 36;	
			Stop_sig_color[b_]		= 0;					
					
			Ignore_sig_color[r_]	= 63;	
			Ignore_sig_color[g_]	= 0;	
			Ignore_sig_color[b_]	= 0;
			
			Reward_weight_list[0]	= 0.50; 	// DR1 (this works like ring buffer in DR1)
			Reward_weight_list[1]	= 1.0;
			Reward_weight_list[2]	= 0.50;
			Reward_weight_list[3]	= 1.0;
			Reward_weight_list[4]	= 0.50;
			Reward_weight_list[5]	= 1.0;
			Reward_weight_list[6]	= 0.50;
			Reward_weight_list[7]	= 1.0;
			Reward_weight_list[8]	= 0.50;
			Reward_weight_list[9]	= 1.0;
			
			SSD_list[0]				= 3;	
			SSD_list[1]				= 13;
			SSD_list[2]				= 23;
			SSD_list[3]				= 33;
			SSD_list[4]				= 43;
			SSD_list[5]				= 53;
			SSD_list[6]				= 63;
			SSD_list[7]				= 0;
			SSD_list[8]				= 0;
			SSD_list[9]				= 0;
			SSD_list[10]			= 0;
			SSD_list[11]			= 0;
			SSD_list[12]			= 0;
			SSD_list[13]			= 0;
			SSD_list[14]			= 0;
			SSD_list[15]			= 0;
			SSD_list[16]			= 0;
			SSD_list[17]			= 0;
			SSD_list[18]			= 0;
			SSD_list[19]			= 0;

			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			Size_list[8]			= 1.5;
			Size_list[9]			= 1.5;
			Size_list[10]			= 1.5;
			Size_list[11]			= 1.5;			
			}
			
			
		// FIXATION TASK SPECIFIC----------------------------------------------------------------------------
		if (state == run_fix_sess)
			{
			N_targ_pos = 9;
			
			Color_list[0,r_]		= 35;	// color of each target individually
			Color_list[0,g_]		= 33;	// color of each target individually
			Color_list[0,b_]		= 27;	// color of each target individually
							
			Color_list[1,r_]		= 35;
			Color_list[1,g_]		= 33;
			Color_list[1,b_]		= 27;
							
			Color_list[2,r_]		= 35;
			Color_list[2,g_]		= 33;
			Color_list[2,b_]		= 27;
									
			Color_list[3,r_]		= 35;
			Color_list[3,g_]		= 33;
			Color_list[3,b_]		= 27;
							
			Color_list[4,r_]		= 35;
			Color_list[4,g_]		= 33;
			Color_list[4,b_]		= 27;
									
			Color_list[5,r_]		= 35;
			Color_list[5,g_]		= 33;
			Color_list[5,b_]		= 27;
									
			Color_list[6,r_]		= 35;
			Color_list[6,g_]		= 33;
			Color_list[6,b_]		= 27;
									
			Color_list[7,r_]		= 35;
			Color_list[7,g_]		= 33;
			Color_list[7,b_]		= 27;
			
			Color_list[8,r_]		= 35;
			Color_list[8,g_]		= 33;
			Color_list[8,b_]		= 27;
		
		
			Size_list[0]			= 0.5;	// size of each target individually (degrees)
			Size_list[1]			= 0.5;
			Size_list[2]			= 0.5;
			Size_list[3]			= 0.5;
			Size_list[4]			= 0.5;
			Size_list[5]			= 0.5;
			Size_list[6]			= 0.5;
			Size_list[7]			= 0.5;
			Size_list[8]			= 0.5;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 90;
			Angle_list[2]			= -90;
			Angle_list[3]			= 180;
			Angle_list[4]			= 0;
			Angle_list[5]			= 135;
			Angle_list[6]			= 45;
			Angle_list[7]			= -135;
			Angle_list[8]			= -45;
			
			Eccentricity_list[0]	= 0.0;	// distance of each target from center of screen individually (degrees)
			Eccentricity_list[1]	= 11.0;
			Eccentricity_list[2]	= 11.0;
			Eccentricity_list[3]	= 11.0;
			Eccentricity_list[4]	= 11.0;
			Eccentricity_list[5]	= 15.6;
			Eccentricity_list[6]	= 15.6;
			Eccentricity_list[7]	= 15.6;
			Eccentricity_list[8]	= 15.6;
			
			Fix_win_size = 0;
			Targ_win_size = 2.5;
			
			Allowed_fix_time = 1200;
			Max_saccade_time = 800;
			Targ_hold_time = 600; 
			}
		}
	
	
	if(monkey == broca)
		{		
		
		// GENERAL ACROSS ALL TASKS---------------------------------------------------------------------------------------
		// distance from center of subjects eyeball to screen
		if(room == 28)
			{
			Subj_dist	= 450.0;
			TrainingStill = 0;		
			}
		else if (room == 29)
			{
			Subj_dist	= 535.0;
			}
		// else if (room == 23)
			// {
			// }
			
		Set_tones = 1;
		
		Fix_win_size			= 3.5;
		Targ_win_size			= 6;	
		
		Allowed_fix_time		= 1000;
		Max_saccade_time		= 800;
		Base_Reward_time		= 50;
		Base_Punish_time		= 1000;
		
		
		// STOP SIGNAL TASK SPECIFIC--------------------------------------------------------------------------------------
		if (state == run_cmd_sess)
			{
			Trls_per_block 			= 20;
			
			DR1_flag				= 1;
			
			Go_weight				= 50.0;
			Stop_weight				= 50.0;
			Ignore_weight			= 0.0;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
			
			Stop_sig_color[r_]		= 0;	
			Stop_sig_color[g_]		= 36;	
			Stop_sig_color[b_]		= 0;					
					
			Ignore_sig_color[r_]	= 63;	
			Ignore_sig_color[g_]	= 0;	
			Ignore_sig_color[b_]	= 0;
			
			Reward_weight_list[0]	= 0.50; 	// DR1 (this works like ring buffer in DR1)
			Reward_weight_list[1]	= 1.0;
			Reward_weight_list[2]	= 0.50;
			Reward_weight_list[3]	= 1.0;
			Reward_weight_list[4]	= 0.50;
			Reward_weight_list[5]	= 1.0;
			Reward_weight_list[6]	= 0.50;
			Reward_weight_list[7]	= 1.0;
			Reward_weight_list[8]	= 0.50;
			Reward_weight_list[9]	= 1.0;
			
			SSD_list[0]				= 3;	
			SSD_list[1]				= 13;
			SSD_list[2]				= 23;
			SSD_list[3]				= 33;
			SSD_list[4]				= 43;
			SSD_list[5]				= 53;
			SSD_list[6]				= 63;
			SSD_list[7]				= 0;
			SSD_list[8]				= 0;
			SSD_list[9]				= 0;
			SSD_list[10]			= 0;
			SSD_list[11]			= 0;
			SSD_list[12]			= 0;
			SSD_list[13]			= 0;
			SSD_list[14]			= 0;
			SSD_list[15]			= 0;
			SSD_list[16]			= 0;
			SSD_list[17]			= 0;
			SSD_list[18]			= 0;
			SSD_list[19]			= 0;		
			}
			
			
	
		if (state == run_mg_sess)
			{	
			Go_weight				= 90;
			Stop_weight				= 10;
			Ignore_weight			= 0;
									
			Min_SOA = 600;
			Max_SOA = 1400;
			Expo_Jitter_SOA 		= 0;
			Exp_juice 				= 1;
			Trial_length			= 5000;
			Cancl_time				= 1200;
			Min_Holdtime			= 500;  // minimum time after fixation before target presentation
			Max_Holdtime			= 1000; // maximum time after fixation before target presentation
			
			
			
			Max_saccade_time		= 400;
			Base_Reward_time		= 100;
			Base_Punish_time		= 1000;
			
			N_targ_pos				= 2;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
			
			Stop_sig_color[r_]		= 63;	
			Stop_sig_color[g_]		= 0;	
			Stop_sig_color[b_]		= 0;
			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 0;
			Size_list[3]			= 0;
			Size_list[4]			= 0;
			Size_list[5]			= 0;
			Size_list[6]			= 0;
			Size_list[7]			= 0;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 180;
			Angle_list[2]			= 90;
			Angle_list[3]			= 135;
			Angle_list[4]			= 180;
			Angle_list[5]			= -135;
			Angle_list[6]			= -90;
			Angle_list[7]			= -45;
			
			Stop_sig_color[r_]		= 63;	
			Stop_sig_color[g_]		= 0;	
			Stop_sig_color[b_]		= 0;
			                          
			Ignore_sig_color[r_]	= 0;	//63
			Ignore_sig_color[g_]	= 36;	
			Ignore_sig_color[b_]	= 0;	
			
			Color_list[0,r_]		= 35;	// color of each target individually
			Color_list[0,g_]		= 33;	// color of each target individually
			Color_list[0,b_]		= 27;	// color of each target individually
							
			Color_list[1,r_]		= 35;
			Color_list[1,g_]		= 33;
			Color_list[1,b_]		= 27;
							
			Color_list[2,r_]		= 35;
			Color_list[2,g_]		= 33;
			Color_list[2,b_]		= 27;
									
			Color_list[3,r_]		= 35;
			Color_list[3,g_]		= 33;
			Color_list[3,b_]		= 27;
							
			Color_list[4,r_]		= 35;
			Color_list[4,g_]		= 33;
			Color_list[4,b_]		= 27;
									
			Color_list[5,r_]		= 35;
			Color_list[5,g_]		= 33;
			Color_list[5,b_]		= 27;
									
			Color_list[6,r_]		= 35;
			Color_list[6,g_]		= 33;
			Color_list[6,b_]		= 27;
									
			Color_list[7,r_]		= 35;
			Color_list[7,g_]		= 33;
			Color_list[7,b_]		= 27;
	
			SOA_list[0]				= 50;	
			SOA_list[1]				= 60;
			SOA_list[2]				= 70;
			SOA_list[3]				= 80;
			SOA_list[4]				= 90;
			SOA_list[5]				= 0;
			SOA_list[6]				= 0;
			SOA_list[7]				= 0;
			SOA_list[8]				= 0;
			SOA_list[9]				= 0;
			SOA_list[10]			= 0;
			SOA_list[11]			= 0;
			SOA_list[12]			= 0;
			SOA_list[13]			= 0;
			SOA_list[14]			= 0;
			SOA_list[15]			= 0;
			SOA_list[16]			= 0;
			SOA_list[17]			= 0;
			SOA_list[18]			= 0;
			SOA_list[19]			= 0;
			}	
			

		}
	
	
	//--------------------------------------------------------------------------------------------------------------------
	// Euler
	if(monkey == euler)
		{		
		
		// GENERAL ACROSS ALL TASKS---------------------------------------------------------------------------------------
		// distance from center of subjects eyeball to screen
		if(room == 28)
			{
			Subj_dist	= 450.0;
			TrainingStill = 0;	
			Max_move_ct = 10;
			Bmove_tout = 6000;
			}
			
		Success_Tone_bigR		= 800;	// positive secondary reinforcer in Hz (large reward)
		Success_Tone_medR		= 800;	// positive secondary reinforcer in Hz (medium reward)
		Success_Tone_smlR		= 800;	// positive secondary reinforcer in Hz (small reward)		
		Failure_Tone_smlP		= 3200;	// negative secondary reinforcer in Hz (short timeout)
		Failure_Tone_medP		= 3200;	// negative secondary reinforcer in Hz (medium timeout)
		Failure_Tone_bigP		= 3200;	// negative secondary reinforcer in Hz (long timeout)
					
		Set_tones = 0;
		
		Fix_win_size			= 3.25;
		Targ_win_size			= 2.1;	
		
		Fixation_size			= 0.5;
		
		Allowed_fix_time		= 1000;
		Max_saccade_time		= 800;
		Base_Reward_time		= 110;
		Base_Punish_time		= 7000;

		
		
		// STOP SIGNAL TASK SPECIFIC--------------------------------------------------------------------------------------
		if (state == run_cmd_sess)
			{
			Trls_per_block 			= 10;
			
			DR1_flag				= 1;
			
			Go_weight				= 50;
			Stop_weight				= 50;
			Ignore_weight			= 0.0;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
			
			Stop_sig_color[r_]		= 63;	
			Stop_sig_color[g_]		= 0;	
			Stop_sig_color[b_]		= 0;					
					
			Ignore_sig_color[r_]	= 0;	
			Ignore_sig_color[g_]	= 36;	
			Ignore_sig_color[b_]	= 0;
			
			Reward_weight_list[0]	= 1.0; 	// DR1 (this works like ring buffer in DR1)
			Reward_weight_list[1]	= 0.33;
			Reward_weight_list[2]	= 1.0;
			Reward_weight_list[3]	= 0.33;
			Reward_weight_list[4]	= 1.0;
			Reward_weight_list[5]	= 0.33;
			Reward_weight_list[6]	= 1.0;
			Reward_weight_list[7]	= 0.33;
			Reward_weight_list[8]	= 1.0;
			Reward_weight_list[9]	= 0.33;
			
			//Size_list[0]			= 1.5;	// size of each target individually (degrees)
			//Size_list[1]			= 1.5;
			//Size_list[2]			= 1.5;
			//Size_list[3]			= 1.5;
			//Size_list[4]			= 1.5;
			//Size_list[5]			= 1.5;
			//Size_list[6]			= 1.5;
			//Size_list[7]			= 1.5;
			
			//Angle_list[0]			= 0;	// angle of each target individually (degrees)
			//Angle_list[1]			= 45;
			//Angle_list[2]			= 90;
			//Angle_list[3]			= 135;
			//Angle_list[4]			= 180;
			//Angle_list[5]			= -135;
			//Angle_list[6]			= -90;
			//Angle_list[7]			= -45;
			
			//Eccentricity_list[0]	= 10.0;	// distance of each target from center of screen individually (degrees)
			//Eccentricity_list[1]	= 10.0;
			//Eccentricity_list[2]	= 10.0;
			//Eccentricity_list[3]	= 10.0;
			//Eccentricity_list[4]	= 10.0;
			//Eccentricity_list[5]	= 8.0;
			//Eccentricity_list[6]	= 8.0;
			//Eccentricity_list[7]	= 8.0;
			
			SSD_list[0]				= 3;	
			SSD_list[1]				= 5;
			SSD_list[2]				= 7;
			SSD_list[3]				= 9;
			SSD_list[4]				= 11;
			SSD_list[5]				= 13;
			SSD_list[6]				= 15;
			SSD_list[7]				= 17;
			SSD_list[8]				= 19;
			SSD_list[9]				= 21;
			SSD_list[10]			= 23;
			SSD_list[11]			= 25;
			SSD_list[12]			= 27;
			SSD_list[13]			= 29;
			SSD_list[14]			= 31;
			SSD_list[15]			= 33;
			SSD_list[16]			= 35;
			SSD_list[17]			= 37;
			SSD_list[18]			= 39;
			SSD_list[19]			= 41;			
					
			SSD_floor				= 7;	// for training to cancel consistantly
			SSD_ceil				= 13;	// for training to cancel consistantly
						
			}
			
			
		// MEMORY GUIDED SACCADE TASK SPECIFIC----------------------------------------------------------------------------
		if (state == run_gonogo_sess)
			{	
			Go_weight				= 33.34;
			Stop_weight				= 33.33;
			Ignore_weight			= 33.33;

			Min_SOA = 0;
			Max_SOA = 1000;
			Expo_Jitter_SOA = 0;

			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 45;
			Angle_list[2]			= 135;
			Angle_list[3]			= 180;
			Angle_list[4]			= -135;
			Angle_list[5]			= -45;
			Angle_list[6]			= 0;
			Angle_list[7]			= 180;
			
			Stop_sig_color[r_]		= 0;	
			Stop_sig_color[g_]		= 36;	
			Stop_sig_color[b_]		= 0;
			                          
			Ignore_sig_color[r_]	= 63;	//63
			Ignore_sig_color[g_]	= 0;	
			Ignore_sig_color[b_]	= 0;	
			
			Mask_sig_color[r_]		= 	0;	//63
			Mask_sig_color[g_]		= 	0;	
			Mask_sig_color[b_]		= 	0;
			
			Color_list[0,r_]		= 35;	// color of each target individually
			Color_list[0,g_]		= 33;	// color of each target individually
			Color_list[0,b_]		= 27;	// color of each target individually
							
			Color_list[1,r_]		= 35;
			Color_list[1,g_]		= 33;
			Color_list[1,b_]		= 27;
							
			Color_list[2,r_]		= 35;
			Color_list[2,g_]		= 33;
			Color_list[2,b_]		= 27;
									
			Color_list[3,r_]		= 35;
			Color_list[3,g_]		= 33;
			Color_list[3,b_]		= 27;
							
			Color_list[4,r_]		= 35;
			Color_list[4,g_]		= 33;
			Color_list[4,b_]		= 27;
									
			Color_list[5,r_]		= 35;
			Color_list[5,g_]		= 33;
			Color_list[5,b_]		= 27;
									
			Color_list[6,r_]		= 35;
			Color_list[6,g_]		= 33;
			Color_list[6,b_]		= 27;
									
			Color_list[7,r_]		= 35;
			Color_list[7,g_]		= 33;
			Color_list[7,b_]		= 27;
			
			SSD_list[0]				= 3;	
			SSD_list[1]				= 8;
			SSD_list[2]				= 13;
			SSD_list[3]				= 18;
			SSD_list[4]				= 23;
			SSD_list[5]				= 28;
			SSD_list[6]				= 33;
			SSD_list[7]				= 38;
			SSD_list[8]				= 43;
			SSD_list[9]				= 48;
			SSD_list[10]			= 0;
			SSD_list[11]			= 0;
			SSD_list[12]			= 0;
			SSD_list[13]			= 0;
			SSD_list[14]			= 0;
			SSD_list[15]			= 0;
			SSD_list[16]			= 0;
			SSD_list[17]			= 0;
			SSD_list[18]			= 0;
			SSD_list[19]			= 0;
			}
			
		if (state == run_mg_sess)
			{	
			Go_weight				= 100;
			Stop_weight				= 0;
			Ignore_weight			= 0;

			Min_SOA = 600;
			Max_SOA = 1100;
			Expo_Jitter_SOA = 0;
			
			N_targ_pos				= 2;
			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 0;
			Size_list[3]			= 0;
			Size_list[4]			= 0;
			Size_list[5]			= 0;
			Size_list[6]			= 0;
			Size_list[7]			= 0;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 180;
			Angle_list[2]			= 90;
			Angle_list[3]			= 135;
			Angle_list[4]			= 180;
			Angle_list[5]			= -135;
			Angle_list[6]			= -90;
			Angle_list[7]			= -45;
			
			Stop_sig_color[r_]		= 0;	
			Stop_sig_color[g_]		= 36;	
			Stop_sig_color[b_]		= 0;
			                          
			Ignore_sig_color[r_]	= 63;	//63
			Ignore_sig_color[g_]	= 0;	
			Ignore_sig_color[b_]	= 0;	
			
			Color_list[0,r_]		= 35;	// color of each target individually
			Color_list[0,g_]		= 33;	// color of each target individually
			Color_list[0,b_]		= 27;	// color of each target individually
							
			Color_list[1,r_]		= 35;
			Color_list[1,g_]		= 33;
			Color_list[1,b_]		= 27;
							
			Color_list[2,r_]		= 35;
			Color_list[2,g_]		= 33;
			Color_list[2,b_]		= 27;
									
			Color_list[3,r_]		= 35;
			Color_list[3,g_]		= 33;
			Color_list[3,b_]		= 27;
							
			Color_list[4,r_]		= 35;
			Color_list[4,g_]		= 33;
			Color_list[4,b_]		= 27;
									
			Color_list[5,r_]		= 35;
			Color_list[5,g_]		= 33;
			Color_list[5,b_]		= 27;
									
			Color_list[6,r_]		= 35;
			Color_list[6,g_]		= 33;
			Color_list[6,b_]		= 27;
									
			Color_list[7,r_]		= 35;
			Color_list[7,g_]		= 33;
			Color_list[7,b_]		= 27;
	
			SSD_list[0]				= 3;	
			SSD_list[1]				= 8;
			SSD_list[2]				= 13;
			SSD_list[3]				= 18;
			SSD_list[4]				= 23;
			SSD_list[5]				= 28;
			SSD_list[6]				= 33;
			SSD_list[7]				= 38;
			SSD_list[8]				= 43;
			SSD_list[9]				= 48;
			SSD_list[10]			= 0;
			SSD_list[11]			= 0;
			SSD_list[12]			= 0;
			SSD_list[13]			= 0;
			SSD_list[14]			= 0;
			SSD_list[15]			= 0;
			SSD_list[16]			= 0;
			SSD_list[17]			= 0;
			SSD_list[18]			= 0;
			SSD_list[19]			= 0;
			}	
			
		if (state == run_delayed_sess)
			{	
			Go_weight				= 100;
			Stop_weight				= 0;
			Ignore_weight			= 0;
			
			Min_Holdtime			= 500;  // minimum time after fixation before target presentation
			Max_Holdtime			= 1000; // maximum time after fixation before target presentation
			Min_SOA					= 1000;	// minimum time between target onset and fixation offset (mem guided only)
			Max_SOA					= 2000;	// maximum time between target onset and fixation offset (mem guided only)
			Reward_Offset			= 0;	// how long after tone before juice is given (needed to seperate primary and secondary reinforcement)
			Exp_juice 				= 0;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 180;
			Angle_list[2]			= 90;
			Angle_list[3]			= 135;
			Angle_list[4]			= 180;
			Angle_list[5]			= -135;
			Angle_list[6]			= -90;
			Angle_list[7]			= -45;
			}
		
		}
		

		
	
if(monkey == helmholtz)
		{		
		
		// GENERAL ACROSS ALL TASKS---------------------------------------------------------------------------------------
		// distance from center of subjects eyeball to screen
		if(room == 28)
			{
			Subj_dist	= 440.0;
			TrainingStill = 0;		
			}
		else if (room == 29)
			{
			Subj_dist	= 535.0;
			}
		// else if (room == 23)
			// {
			// }
			
		Set_tones = 1;
		
		Fix_win_size			= 3.5;
		Targ_win_size			= 6;	
		
		Allowed_fix_time		= 1000;
		Max_saccade_time		= 800;
		Base_Reward_time		= 70;
		Base_Punish_time		= 1000;
		
		
		// STOP SIGNAL TASK SPECIFIC--------------------------------------------------------------------------------------
		if (state == run_cmd_sess)
			{
			Trls_per_block 			= 10000;
			
			DR1_flag				= 0;
			
			Go_weight				= 100.0;
			Stop_weight				= 0.0;
			Ignore_weight			= 0.0;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
			
			Stop_sig_color[r_]		= 0;	
			Stop_sig_color[g_]		= 36;	
			Stop_sig_color[b_]		= 0;					
					
			Ignore_sig_color[r_]	= 63;	
			Ignore_sig_color[g_]	= 0;	
			Ignore_sig_color[b_]	= 0;
			
			Reward_weight_list[0]	= 0.50; 	// DR1 (this works like ring buffer in DR1)
			Reward_weight_list[1]	= 1.0;
			Reward_weight_list[2]	= 0.50;
			Reward_weight_list[3]	= 1.0;
			Reward_weight_list[4]	= 0.50;
			Reward_weight_list[5]	= 1.0;
			Reward_weight_list[6]	= 0.50;
			Reward_weight_list[7]	= 1.0;
			Reward_weight_list[8]	= 0.50;
			Reward_weight_list[9]	= 1.0;
			
			SSD_list[0]				= 3;	
			SSD_list[1]				= 13;
			SSD_list[2]				= 23;
			SSD_list[3]				= 33;
			SSD_list[4]				= 43;
			SSD_list[5]				= 53;
			SSD_list[6]				= 63;
			SSD_list[7]				= 0;
			SSD_list[8]				= 0;
			SSD_list[9]				= 0;
			SSD_list[10]			= 0;
			SSD_list[11]			= 0;
			SSD_list[12]			= 0;
			SSD_list[13]			= 0;
			SSD_list[14]			= 0;
			SSD_list[15]			= 0;
			SSD_list[16]			= 0;
			SSD_list[17]			= 0;
			SSD_list[18]			= 0;
			SSD_list[19]			= 0;		
			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 45;
			Angle_list[2]			= 90;
			Angle_list[3]			= 135;
			Angle_list[4]			= 180;
			Angle_list[5]			= -135;
			Angle_list[6]			= -90;
			Angle_list[7]			= -45;
			}
		//GO NO-GO TASK SPECIFIC-----------------------------------------------------------------------------------		
		if (state == run_gonogo_sess)
			{	
			Go_weight				= 100;
			Stop_weight				= 0;
			Ignore_weight			= 0;

			Min_SOA = 0;
			Max_SOA = 1000;
			Expo_Jitter_SOA = 0;

			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 45;
			Angle_list[2]			= 135;
			Angle_list[3]			= 180;
			Angle_list[4]			= -135;
			Angle_list[5]			= -45;
			Angle_list[6]			= 0;
			Angle_list[7]			= 180;
			
			Stop_sig_color[r_]		= 0;	
			Stop_sig_color[g_]		= 36;	
			Stop_sig_color[b_]		= 0;
			                          
			Ignore_sig_color[r_]	= 63;	//63
			Ignore_sig_color[g_]	= 0;	
			Ignore_sig_color[b_]	= 0;	
			
			Mask_sig_color[r_]		= 	0;	//63
			Mask_sig_color[g_]		= 	0;	
			Mask_sig_color[b_]		= 	0;
			
			Color_list[0,r_]		= 35;	// color of each target individually
			Color_list[0,g_]		= 33;	// color of each target individually
			Color_list[0,b_]		= 27;	// color of each target individually
							
			Color_list[1,r_]		= 35;
			Color_list[1,g_]		= 33;
			Color_list[1,b_]		= 27;
							
			Color_list[2,r_]		= 35;
			Color_list[2,g_]		= 33;
			Color_list[2,b_]		= 27;
									
			Color_list[3,r_]		= 35;
			Color_list[3,g_]		= 33;
			Color_list[3,b_]		= 27;
							
			Color_list[4,r_]		= 35;
			Color_list[4,g_]		= 33;
			Color_list[4,b_]		= 27;
									
			Color_list[5,r_]		= 35;
			Color_list[5,g_]		= 33;
			Color_list[5,b_]		= 27;
									
			Color_list[6,r_]		= 35;
			Color_list[6,g_]		= 33;
			Color_list[6,b_]		= 27;
									
			Color_list[7,r_]		= 35;
			Color_list[7,g_]		= 33;
			Color_list[7,b_]		= 27;
			
			SSD_list[0]				= 3;	
			SSD_list[1]				= 8;
			SSD_list[2]				= 13;
			SSD_list[3]				= 18;
			SSD_list[4]				= 23;
			SSD_list[5]				= 28;
			SSD_list[6]				= 33;
			SSD_list[7]				= 38;
			SSD_list[8]				= 43;
			SSD_list[9]				= 48;
			SSD_list[10]			= 0;
			SSD_list[11]			= 0;
			SSD_list[12]			= 0;
			SSD_list[13]			= 0;
			SSD_list[14]			= 0;
			SSD_list[15]			= 0;
			SSD_list[16]			= 0;
			SSD_list[17]			= 0;
			SSD_list[18]			= 0;
			SSD_list[19]			= 0;
			}	
		// MEMORY GUIDED TASK SPECIFIC--------------------------------------------------------------------------------------
		if (state == run_mg_sess)
			{	
			Go_weight				= 100;
			Stop_weight				= 0;
			Ignore_weight			= 0;
									
			Min_SOA = 600;
			Max_SOA = 1400;
			Expo_Jitter_SOA 		= 0;
			Exp_juice 				= 1;
			Trial_length			= 5000;
			Cancl_time				= 1200;
			Min_Holdtime			= 500;  // minimum time after fixation before target presentation
			Max_Holdtime			= 1000; // maximum time after fixation before target presentation
			
			Max_saccade_time		= 1000;
			Base_Reward_time		= 100;
			Base_Punish_time		= 1000;
			
			N_targ_pos				= 4;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
			
			Stop_sig_color[r_]		= 63;	
			Stop_sig_color[g_]		= 0;	
			Stop_sig_color[b_]		= 0;
			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			
			Angle_list[0]			= 90;	// angle of each target individually (degrees)
			Angle_list[1]			= 270;//270
			Angle_list[2]			= 0;
			Angle_list[3]			= 180;
			Angle_list[4]			= 180;
			Angle_list[5]			= -135;
			Angle_list[6]			= -90;
			Angle_list[7]			= -45;
			
			Stop_sig_color[r_]		= 63;	
			Stop_sig_color[g_]		= 0;	
			Stop_sig_color[b_]		= 0;
			                          
			Ignore_sig_color[r_]	= 0;	//63
			Ignore_sig_color[g_]	= 36;	
			Ignore_sig_color[b_]	= 0;	
			
			Color_list[0,r_]		= 35;	// color of each target individually
			Color_list[0,g_]		= 33;	// color of each target individually
			Color_list[0,b_]		= 27;	// color of each target individually
							
			Color_list[1,r_]		= 35;
			Color_list[1,g_]		= 33;
			Color_list[1,b_]		= 27;
							
			Color_list[2,r_]		= 35;
			Color_list[2,g_]		= 33;
			Color_list[2,b_]		= 27;
									
			Color_list[3,r_]		= 35;
			Color_list[3,g_]		= 33;
			Color_list[3,b_]		= 27;
							
			Color_list[4,r_]		= 35;
			Color_list[4,g_]		= 33;
			Color_list[4,b_]		= 27;
									
			Color_list[5,r_]		= 35;
			Color_list[5,g_]		= 33;
			Color_list[5,b_]		= 27;
									
			Color_list[6,r_]		= 35;
			Color_list[6,g_]		= 33;
			Color_list[6,b_]		= 27;
									
			Color_list[7,r_]		= 35;
			Color_list[7,g_]		= 33;
			Color_list[7,b_]		= 27;
	
			SOA_list[0] = 500;
			SOA_list[1] = 600;
			SOA_list[2] = 700;
			SOA_list[3] = 800;
			SOA_list[4] = 1000;
			SOA_list[5] = 1100;
			SOA_list[6] = 1200;
			SOA_list[7] = 1300;
			SOA_list[8] = 0;
			SOA_list[9] = 0;
			SOA_list[10] = 0;
			SOA_list[11] = 0;
			SOA_list[12] = 0;
			SOA_list[13] = 0;
			SOA_list[14] = 0;
			SOA_list[15] = 0;
			SOA_list[16] = 0;
			SOA_list[17] = 0;
			SOA_list[18] = 0;
			SOA_list[19] = 0;
			
			}	
			

		

		// SEARCH TASK SPECIFIC--------------------------------------------------------------------------------------
		if (state == run_search_sess)
			{
			Trls_per_block 			= 60;
			Base_Punish_time		= 2000;
			
			////////// Training-specific variables - allow user to use fixed distractor locations and identities
			Train	 				= 1;
			//TrainOrt 				= 1;
			TargTrainSet			= 1; //1=random loc, 2= fixed pos. 1, 3 = fixed pos 2., etc. up to max location number
			DistOrt					= 2; //T/L - 1=UP, 2=INV, 3=LEFT, 4=RIGHT  
			TargOrt					= 1;
			SearchEcc				= 8; //Eccentricity in degrees; use to make fixed eccentricity 
			//////////
			
			catch_hold_time			= 100;
			Perc_catch				= 20; //percent catch trials
			TargetType				= 2; //1 = L, 2 = T
			PlacPres				= 1; //1 = no placeholders,  2 = placeholders
			SearchType				= 2; //Hetero = 1, Homo = 2
			SetSize					= 8; //SS1 = 1, SS2 = 2, etc. up to set size 12
			
			search_fix_time			= 0; //equiv to SOA - amount of time the fixation point stays on after target onset; fix off = go signal
			max_plactime			= 700;
			min_plactime			= 1000;
			
			targ_hold_time			= 100;
			Max_sacc_duration		= 200;
			Max_saccade_time 		= 500;
			Min_Holdtime			= 500;  // minimum time after fixation before target presentation
			Max_Holdtime			= 1000; // maximum time after fixation before target presentation		
					
			Go_weight				= 100.0;
			Stop_weight				= 0.0;
			Ignore_weight			= 0.0;
						
			Reward_weight_list[0]	= 1.0; 	
			Reward_weight_list[1]	= 1.0;
			Reward_weight_list[2]	= 1.0;
			Reward_weight_list[3]	= 1.0;
			Reward_weight_list[4]	= 1.0;
			Reward_weight_list[5]	= 1.0;
			Reward_weight_list[6]	= 1.0;
			Reward_weight_list[7]	= 1.0;
			Reward_weight_list[8]	= 1.0;
			Reward_weight_list[9]	= 1.0;
			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			Size_list[8]			= 1.5;
			Size_list[9]			= 1.5;
			Size_list[10]			= 1.5;
			Size_list[11]			= 1.5;			
			
			Eccentricity_list[0]	= 3;	
			Eccentricity_list[1]	= 6;
			Eccentricity_list[2]	= 9;
			Eccentricity_list[3]	= 6;
			Eccentricity_list[4]	= 6;	
			Eccentricity_list[5]	= 9;
			Eccentricity_list[6]	= 2;
			Eccentricity_list[7]	= 4;
			Eccentricity_list[8]	= 5;	
			Eccentricity_list[9]	= 6;
			Eccentricity_list[10]	= 8;
			Eccentricity_list[11]	= 9;
						
//Canonical angles			
/* 			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 30;
			Angle_list[2]			= 60;
			Angle_list[3]			= 90;
			Angle_list[4]			= 120;
			Angle_list[5]			= 150;
			Angle_list[6]			= 180;
			Angle_list[7]			= 210;
			Angle_list[8]			= 240;
			Angle_list[9]			= 270;
			Angle_list[10]			= 300;
			Angle_list[11]			= 330; */
//training angles			
/* 			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 90;
			Angle_list[2]			= 180;
			Angle_list[3]			= 270;
			Angle_list[4]			= 120;
			Angle_list[5]			= 150;
			Angle_list[6]			= 30;
			Angle_list[7]			= 210;
			Angle_list[8]			= 240;
			Angle_list[9]			= 60;
			Angle_list[10]			= 300;
			Angle_list[11]			= 330; */
//training angles	SS8		
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 45;
			Angle_list[2]			= 90;
			Angle_list[3]			= 135;
			Angle_list[4]			= 180;
			Angle_list[5]			= 225;
			Angle_list[6]			= 270;
			Angle_list[7]			= 315;
		
			}		
	
		// FIXATION TASK SPECIFIC----------------------------------------------------------------------------
		
		if (state == run_fix_sess)
			{
			N_targ_pos = 9;
			
			Color_list[0,r_]		= 35;	// color of each target individually
			Color_list[0,g_]		= 33;	// color of each target individually
			Color_list[0,b_]		= 27;	// color of each target individually
							
			Color_list[1,r_]		= 35;
			Color_list[1,g_]		= 33;
			Color_list[1,b_]		= 27;
							
			Color_list[2,r_]		= 35;
			Color_list[2,g_]		= 33;
			Color_list[2,b_]		= 27;
									
			Color_list[3,r_]		= 35;
			Color_list[3,g_]		= 33;
			Color_list[3,b_]		= 27;
							
			Color_list[4,r_]		= 35;
			Color_list[4,g_]		= 33;
			Color_list[4,b_]		= 27;
									
			Color_list[5,r_]		= 35;
			Color_list[5,g_]		= 33;
			Color_list[5,b_]		= 27;
									
			Color_list[6,r_]		= 35;
			Color_list[6,g_]		= 33;
			Color_list[6,b_]		= 27;
									
			Color_list[7,r_]		= 35;
			Color_list[7,g_]		= 33;
			Color_list[7,b_]		= 27;
			
			Color_list[8,r_]		= 35;
			Color_list[8,g_]		= 33;
			Color_list[8,b_]		= 27;
		
		
			Size_list[0]			= 0.5;	// size of each target individually (degrees)
			Size_list[1]			= 0.5;
			Size_list[2]			= 0.5;
			Size_list[3]			= 0.5;
			Size_list[4]			= 0.5;
			Size_list[5]			= 0.5;
			Size_list[6]			= 0.5;
			Size_list[7]			= 0.5;
			Size_list[8]			= 0.5;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 90;
			Angle_list[2]			= -90;
			Angle_list[3]			= 180;
			Angle_list[4]			= 0;
			Angle_list[5]			= 135;
			Angle_list[6]			= 45;
			Angle_list[7]			= -135;
			Angle_list[8]			= -45;
			
			Eccentricity_list[0]	= 0.0;	// distance of each target from center of screen individually (degrees)
			Eccentricity_list[1]	= 11.0;
			Eccentricity_list[2]	= 11.0;
			Eccentricity_list[3]	= 11.0;
			Eccentricity_list[4]	= 11.0;
			Eccentricity_list[5]	= 15.6;
			Eccentricity_list[6]	= 15.6;
			Eccentricity_list[7]	= 15.6;
			Eccentricity_list[8]	= 15.6;
			
			Fix_win_size = 0;
			Targ_win_size = 2.5;
			
			Allowed_fix_time = 1200;
			Max_saccade_time = 800;
			Targ_hold_time = 600;
			}

		// DELAYED SACCADE TASK SPECIFIC----------------------------------------------------------------------------
		
		if (state == run_delayed_sess)
			{	
			Go_weight				= 100;
			Stop_weight				= 0;
			Ignore_weight			= 0;
			
			Min_Holdtime			= 500;  // minimum time after fixation before target presentation
			Max_Holdtime			= 1000; // maximum time after fixation before target presentation
			Min_SOA					= 200;	// minimum time between target onset and fixation offset (mem guided only)
			Max_SOA					= 200;	// maximum time between target onset and fixation offset (mem guided only)
			Reward_Offset			= 0;	// how long after tone before juice is given (needed to seperate primary and secondary reinforcement)
			Exp_juice 				= 0;
			
			N_targ_pos				= 4;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
		
		
			Angle_list[0]			= 90;	// angle of each target individually (degrees)
			Angle_list[1]			= 270;//270
			Angle_list[2]			= 0;
			Angle_list[3]			= 180;
			Angle_list[4]			= 180;
			Angle_list[5]			= -135;
			Angle_list[6]			= -90;
			Angle_list[7]			= -45;
		
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			Size_list[8]			= 1.5;
			Size_list[9]			= 1.5;
			Size_list[10]			= 1.5;
			Size_list[11]			= 1.5;
			
			
			SOA_list[0] = 300;
			SOA_list[1] = 400;
			SOA_list[2] = 500;
			SOA_list[3] = 600;
			SOA_list[4] = 700;
			SOA_list[5] = 1100;
			SOA_list[6] = 1200;
			SOA_list[7] = 1300;
			SOA_list[8] = 0;
			SOA_list[9] = 0;
			SOA_list[10] = 0;
			SOA_list[11] = 0;
			SOA_list[12] = 0;
			SOA_list[13] = 0;
			SOA_list[14] = 0;
			SOA_list[15] = 0;
			SOA_list[16] = 0;
			SOA_list[17] = 0;
			SOA_list[18] = 0;
			SOA_list[19] = 0; 
			}
		//--------------------------------------------------------------------------------------------------------------------
		// Flash task
		if (state == run_flash_sess)
			{
			Success_Tone_medR 	= 1600;
			Base_Reward_time 	= 100;
			Fix_win_size 		= 22;
			}
		}	


if(monkey == gauss)
		{		
		
		// GENERAL ACROSS ALL TASKS---------------------------------------------------------------------------------------
		// distance from center of subjects eyeball to screen
		if(room == 28)
			{
			Subj_dist	= 440.0;
			TrainingStill = 0;		
			}
		else if (room == 29)
			{
			Subj_dist	= 535.0;
			}
		// else if (room == 23)
			// {
			// }
			
		Set_tones = 1;
		
		Fix_win_size			= 3.5;
		Targ_win_size			= 6;	
		
		Allowed_fix_time		= 1000;
		Max_saccade_time		= 800;
		Base_Reward_time		= 50;
		Base_Punish_time		= 1000;
		
		
		// STOP SIGNAL TASK SPECIFIC--------------------------------------------------------------------------------------
		if (state == run_cmd_sess)
			{
			Trls_per_block 			= 10000;
			
			DR1_flag				= 0;
			
			Go_weight				= 100.0;
			Stop_weight				= 0.0;
			Ignore_weight			= 0.0;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
			
			Stop_sig_color[r_]		= 0;	
			Stop_sig_color[g_]		= 36;	
			Stop_sig_color[b_]		= 0;					
					
			Ignore_sig_color[r_]	= 63;	
			Ignore_sig_color[g_]	= 0;	
			Ignore_sig_color[b_]	= 0;
			
			Reward_weight_list[0]	= 0.50; 	// DR1 (this works like ring buffer in DR1)
			Reward_weight_list[1]	= 1.0;
			Reward_weight_list[2]	= 0.50;
			Reward_weight_list[3]	= 1.0;
			Reward_weight_list[4]	= 0.50;
			Reward_weight_list[5]	= 1.0;
			Reward_weight_list[6]	= 0.50;
			Reward_weight_list[7]	= 1.0;
			Reward_weight_list[8]	= 0.50;
			Reward_weight_list[9]	= 1.0;
			
			SSD_list[0]				= 3;	
			SSD_list[1]				= 13;
			SSD_list[2]				= 23;
			SSD_list[3]				= 33;
			SSD_list[4]				= 43;
			SSD_list[5]				= 53;
			SSD_list[6]				= 63;
			SSD_list[7]				= 0;
			SSD_list[8]				= 0;
			SSD_list[9]				= 0;
			SSD_list[10]			= 0;
			SSD_list[11]			= 0;
			SSD_list[12]			= 0;
			SSD_list[13]			= 0;
			SSD_list[14]			= 0;
			SSD_list[15]			= 0;
			SSD_list[16]			= 0;
			SSD_list[17]			= 0;
			SSD_list[18]			= 0;
			SSD_list[19]			= 0;		
			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 45;
			Angle_list[2]			= 90;
			Angle_list[3]			= 135;
			Angle_list[4]			= 180;
			Angle_list[5]			= -135;
			Angle_list[6]			= -90;
			Angle_list[7]			= -45;
			}
		//GO NO-GO TASK SPECIFIC-----------------------------------------------------------------------------------		
		if (state == run_gonogo_sess)
			{	
			
			
			Go_weight				= 100;
			Stop_weight				= 0;
			Ignore_weight			= 0;

			Min_SOA = 0;
			Max_SOA = 1000;
			Expo_Jitter_SOA = 0;

			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 45;
			Angle_list[2]			= 135;
			Angle_list[3]			= 180;
			Angle_list[4]			= -135;
			Angle_list[5]			= -45;
			Angle_list[6]			= 0;
			Angle_list[7]			= 180;
			
			Stop_sig_color[r_]		= 0;	
			Stop_sig_color[g_]		= 36;	
			Stop_sig_color[b_]		= 0;
			                          
			Ignore_sig_color[r_]	= 63;	//63
			Ignore_sig_color[g_]	= 0;	
			Ignore_sig_color[b_]	= 0;	
			
			Mask_sig_color[r_]		= 	0;	//63
			Mask_sig_color[g_]		= 	0;	
			Mask_sig_color[b_]		= 	0;
			
			Color_list[0,r_]		= 35;	// color of each target individually
			Color_list[0,g_]		= 33;	// color of each target individually
			Color_list[0,b_]		= 27;	// color of each target individually
							
			Color_list[1,r_]		= 35;
			Color_list[1,g_]		= 33;
			Color_list[1,b_]		= 27;
							
			Color_list[2,r_]		= 35;
			Color_list[2,g_]		= 33;
			Color_list[2,b_]		= 27;
									
			Color_list[3,r_]		= 35;
			Color_list[3,g_]		= 33;
			Color_list[3,b_]		= 27;
							
			Color_list[4,r_]		= 35;
			Color_list[4,g_]		= 33;
			Color_list[4,b_]		= 27;
									
			Color_list[5,r_]		= 35;
			Color_list[5,g_]		= 33;
			Color_list[5,b_]		= 27;
									
			Color_list[6,r_]		= 35;
			Color_list[6,g_]		= 33;
			Color_list[6,b_]		= 27;
									
			Color_list[7,r_]		= 35;
			Color_list[7,g_]		= 33;
			Color_list[7,b_]		= 27;
			
			SSD_list[0]				= 3;	
			SSD_list[1]				= 8;
			SSD_list[2]				= 13;
			SSD_list[3]				= 18;
			SSD_list[4]				= 23;
			SSD_list[5]				= 28;
			SSD_list[6]				= 33;
			SSD_list[7]				= 38;
			SSD_list[8]				= 43;
			SSD_list[9]				= 48;
			SSD_list[10]			= 0;
			SSD_list[11]			= 0;
			SSD_list[12]			= 0;
			SSD_list[13]			= 0;
			SSD_list[14]			= 0;
			SSD_list[15]			= 0;
			SSD_list[16]			= 0;
			SSD_list[17]			= 0;
			SSD_list[18]			= 0;
			SSD_list[19]			= 0;
			}	
		// MEMORY GUIDED TASK SPECIFIC--------------------------------------------------------------------------------------
		if (state == run_mg_sess)
			{	
			Go_weight				= 100;
			Stop_weight				= 0;
			Ignore_weight			= 0;
									
			Min_SOA = 600;
			Max_SOA = 1400;
			Expo_Jitter_SOA 		= 0;
			Exp_juice 				= 1;
			Trial_length			= 5000;
			Cancl_time				= 1200;
			Min_Holdtime			= 500;  // minimum time after fixation before target presentation
			Max_Holdtime			= 1000; // maximum time after fixation before target presentation
			
			
			
			Max_saccade_time		= 1000;
			Base_Reward_time		= 75;
			Base_Punish_time		= 1000;
			
			N_targ_pos				= 4;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
			
			Stop_sig_color[r_]		= 63;	
			Stop_sig_color[g_]		= 0;	
			Stop_sig_color[b_]		= 0;
			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			
			Angle_list[0]			= 90;	// angle of each target individually (degrees)
			Angle_list[1]			= 270;//270
			Angle_list[2]			= 0;
			Angle_list[3]			= 180;
			Angle_list[4]			= 180;
			Angle_list[5]			= -135;
			Angle_list[6]			= -90;
			Angle_list[7]			= -45;
			
			Stop_sig_color[r_]		= 63;	
			Stop_sig_color[g_]		= 0;	
			Stop_sig_color[b_]		= 0;
			                          
			Ignore_sig_color[r_]	= 0;	//63
			Ignore_sig_color[g_]	= 36;	
			Ignore_sig_color[b_]	= 0;	
			
			Color_list[0,r_]		= 35;	// color of each target individually
			Color_list[0,g_]		= 33;	// color of each target individually
			Color_list[0,b_]		= 27;	// color of each target individually
							
			Color_list[1,r_]		= 35;
			Color_list[1,g_]		= 33;
			Color_list[1,b_]		= 27;
							
			Color_list[2,r_]		= 35;
			Color_list[2,g_]		= 33;
			Color_list[2,b_]		= 27;
									
			Color_list[3,r_]		= 35;
			Color_list[3,g_]		= 33;
			Color_list[3,b_]		= 27;
							
			Color_list[4,r_]		= 35;
			Color_list[4,g_]		= 33;
			Color_list[4,b_]		= 27;
									
			Color_list[5,r_]		= 35;
			Color_list[5,g_]		= 33;
			Color_list[5,b_]		= 27;
									
			Color_list[6,r_]		= 35;
			Color_list[6,g_]		= 33;
			Color_list[6,b_]		= 27;
									
			Color_list[7,r_]		= 35;
			Color_list[7,g_]		= 33;
			Color_list[7,b_]		= 27;
	
			SOA_list[0] = 300;
			SOA_list[1] = 400;
			SOA_list[2] = 500;
			SOA_list[3] = 600;
			SOA_list[4] = 700;
			SOA_list[5] = 800;
			SOA_list[6] = 900;
			SOA_list[7] = 1000;
			SOA_list[8] = 0;
			SOA_list[9] = 0;
			SOA_list[10] = 0;
			SOA_list[11] = 0;
			SOA_list[12] = 0;
			SOA_list[13] = 0;
			SOA_list[14] = 0;
			SOA_list[15] = 0;
			SOA_list[16] = 0;
			SOA_list[17] = 0;
			SOA_list[18] = 0;
			SOA_list[19] = 0;
			
			}	
			
		// SEARCH TASK SPECIFIC--------------------------------------------------------------------------------------
		if (state == run_search_sess)
			{
			Trls_per_block 			= 60;
			Base_Punish_time		= 2000;
			
			////////// Training-specific variables - allow user to use fixed distractor locations and identities
			Train	 				= 1;// 1 = Sets locations to fixed eccentricity and angle, set using SearchEcc below
			//TrainOrt 				= 1;// 1 = Sets orientations to fixed orient, using TargOrt and DistOrt below//
			TargTrainSet			= 1; //1= random loc, 2= fixed pos. 1, 3 = fixed pos 2., etc. up to max location number
			DistOrt					= 1; //T/L - 1=UP, 2=INV, 3=LEFT, 4=RIGHT  
			TargOrt					= 2; //T/L - 1=UP, 2=INV, 3=LEFT, 4=RIGHT 
			SearchEcc				= 8; //Eccentricity in degrees; use to make fixed eccentricity 
			//////////
			
			catch_hold_time			= 0;
			Perc_catch				= 0; //percent catch trials
			TargetType				= 2; //1 = L, 2 = T
			PlacPres				= 1; //1 = no placeholders,  2 = placeholders
			SearchType				= 2; //Hetero = 1, Homo = 2
			SetSize					= 8; //SS1 = 1, SS2 = 2, etc. up to set size 12
			
			search_fix_time			= 0; //equiv to SOA - amount of time the fixation point stays on after target onset; fix off = go signal
			max_plactime			= 700;
			min_plactime			= 1000;
			
			targ_hold_time			= 100;
			Max_sacc_duration		= 200;
			Max_saccade_time 		= 300;
			Min_Holdtime			= 500;  // minimum time after fixation before target presentation
			Max_Holdtime			= 1000; // maximum time after fixation before target presentation		
					
			Go_weight				= 100.0;
			Stop_weight				= 0.0;
			Ignore_weight			= 0.0;
						
			Reward_weight_list[0]	= 1.0; 	
			Reward_weight_list[1]	= 1.0;
			Reward_weight_list[2]	= 1.0;
			Reward_weight_list[3]	= 1.0;
			Reward_weight_list[4]	= 1.0;
			Reward_weight_list[5]	= 1.0;
			Reward_weight_list[6]	= 1.0;
			Reward_weight_list[7]	= 1.0;
			Reward_weight_list[8]	= 1.0;
			Reward_weight_list[9]	= 1.0;
			
			Size_list[0]			= 1.5;	// size of each target individually (degrees)
			Size_list[1]			= 1.5;
			Size_list[2]			= 1.5;
			Size_list[3]			= 1.5;
			Size_list[4]			= 1.5;
			Size_list[5]			= 1.5;
			Size_list[6]			= 1.5;
			Size_list[7]			= 1.5;
			Size_list[8]			= 1.5;
			Size_list[9]			= 1.5;
			Size_list[10]			= 1.5;
			Size_list[11]			= 1.5;			
			
			Eccentricity_list[0]	= 3;	
			Eccentricity_list[1]	= 6;
			Eccentricity_list[2]	= 9;
			Eccentricity_list[3]	= 6;
			Eccentricity_list[4]	= 6;	
			Eccentricity_list[5]	= 9;
			Eccentricity_list[6]	= 2;
			Eccentricity_list[7]	= 4;
			Eccentricity_list[8]	= 5;	
			Eccentricity_list[9]	= 6;
			Eccentricity_list[10]	= 8;
			Eccentricity_list[11]	= 9;
			
//Canonical angles			
/* 			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 30;
			Angle_list[2]			= 60;
			Angle_list[3]			= 90;
			Angle_list[4]			= 120;
			Angle_list[5]			= 150;
			Angle_list[6]			= 180;
			Angle_list[7]			= 210;
			Angle_list[8]			= 240;
			Angle_list[9]			= 270;
			Angle_list[10]			= 300;
			Angle_list[11]			= 330; */
			
/* //training angles	SS12		
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 90;
			Angle_list[2]			= 180;
			Angle_list[3]			= 270;
			Angle_list[4]			= 120;
			Angle_list[5]			= 150;
			Angle_list[6]			= 30;
			Angle_list[7]			= 210;
			Angle_list[8]			= 240;
			Angle_list[9]			= 60;
			Angle_list[10]			= 300;
			Angle_list[11]			= 330; */
			
//training angles	SS8		
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 45;
			Angle_list[2]			= 90;
			Angle_list[3]			= 135;
			Angle_list[4]			= 180;
			Angle_list[5]			= 225;
			Angle_list[6]			= 270;
			Angle_list[7]			= 315;

			}		
	
		// FIXATION TASK SPECIFIC----------------------------------------------------------------------------
		
		if (state == run_fix_sess)
			{
			N_targ_pos = 9;
			
			Color_list[0,r_]		= 35;	// color of each target individually
			Color_list[0,g_]		= 33;	// color of each target individually
			Color_list[0,b_]		= 27;	// color of each target individually
							
			Color_list[1,r_]		= 35;
			Color_list[1,g_]		= 33;
			Color_list[1,b_]		= 27;
							
			Color_list[2,r_]		= 35;
			Color_list[2,g_]		= 33;
			Color_list[2,b_]		= 27;
									
			Color_list[3,r_]		= 35;
			Color_list[3,g_]		= 33;
			Color_list[3,b_]		= 27;
							
			Color_list[4,r_]		= 35;
			Color_list[4,g_]		= 33;
			Color_list[4,b_]		= 27;
									
			Color_list[5,r_]		= 35;
			Color_list[5,g_]		= 33;
			Color_list[5,b_]		= 27;
									
			Color_list[6,r_]		= 35;
			Color_list[6,g_]		= 33;
			Color_list[6,b_]		= 27;
									
			Color_list[7,r_]		= 35;
			Color_list[7,g_]		= 33;
			Color_list[7,b_]		= 27;
			
			Color_list[8,r_]		= 35;
			Color_list[8,g_]		= 33;
			Color_list[8,b_]		= 27;
		
		
			Size_list[0]			= 0.5;	// size of each target individually (degrees)
			Size_list[1]			= 0.5;
			Size_list[2]			= 0.5;
			Size_list[3]			= 0.5;
			Size_list[4]			= 0.5;
			Size_list[5]			= 0.5;
			Size_list[6]			= 0.5;
			Size_list[7]			= 0.5;
			Size_list[8]			= 0.5;
			
			Angle_list[0]			= 0;	// angle of each target individually (degrees)
			Angle_list[1]			= 90;
			Angle_list[2]			= -90;
			Angle_list[3]			= 180;
			Angle_list[4]			= 0;
			Angle_list[5]			= 135;
			Angle_list[6]			= 45;
			Angle_list[7]			= -135;
			Angle_list[8]			= -45;
			
			Eccentricity_list[0]	= 0.0;	// distance of each target from center of screen individually (degrees)
			Eccentricity_list[1]	= 11.0;
			Eccentricity_list[2]	= 11.0;
			Eccentricity_list[3]	= 11.0;
			Eccentricity_list[4]	= 11.0;
			Eccentricity_list[5]	= 15.6;
			Eccentricity_list[6]	= 15.6;
			Eccentricity_list[7]	= 15.6;
			Eccentricity_list[8]	= 15.6;
			
			Fix_win_size = 0;
			Targ_win_size = 2.5;
			
			Allowed_fix_time = 1200;
			Max_saccade_time = 800;
			Targ_hold_time = 600;
			}

		// DELAYED SACCADE TASK SPECIFIC----------------------------------------------------------------------------
		
		if (state == run_delayed_sess)
			{	
			Go_weight				= 100;
			Stop_weight				= 0;
			Ignore_weight			= 0;
			
			Min_Holdtime			= 500;  // minimum time after fixation before target presentation
			Max_Holdtime			= 1000; // maximum time after fixation before target presentation
			Min_SOA					= 200;	// minimum time between target onset and fixation offset (mem guided only)
			Max_SOA					= 200;	// maximum time between target onset and fixation offset (mem guided only)
			Reward_Offset			= 0;	// how long after tone before juice is given (needed to seperate primary and secondary reinforcement)
			Exp_juice 				= 0;
			
			N_targ_pos				= 8;
			
			BigR_weight				= 0.0;
			MedR_weight				= 100.0;
			SmlR_weight				= 0.0;
			SmlP_weight				= 0.0;
			MedP_weight				= 100.0;
			BigP_weight				= 0.0;
		
			Angle_list[0]			= 90;	// angle of each target individually (degrees)
			Angle_list[1]			= 270;//270
			Angle_list[2]			= 0;
			Angle_list[3]			= 180;
			Angle_list[4]			= 45;
			Angle_list[5]			= 135;
			Angle_list[6]			= 225;
			Angle_list[7]			= 315;
		
			SOA_list[0] = 300;
			SOA_list[1] = 400;
			SOA_list[2] = 500;
			SOA_list[3] = 600;
			SOA_list[4] = 700;
			SOA_list[5] = 800;
			SOA_list[6] = 900;
			SOA_list[7] = 1000;
			SOA_list[8] = 0;
			SOA_list[9] = 0;
			SOA_list[10] = 0;
			SOA_list[11] = 0;
			SOA_list[12] = 0;
			SOA_list[13] = 0;
			SOA_list[14] = 0;
			SOA_list[15] = 0;
			SOA_list[16] = 0;
			SOA_list[17] = 0;
			SOA_list[18] = 0;
			SOA_list[19] = 0;
			}
		//--------------------------------------------------------------------------------------------------------------------
		// Flash task
		if (state == run_flash_sess)
			{
			Success_Tone_medR 	= 1600;
			Base_Reward_time 	= 100;
			Fix_win_size 		= 22;
			}
	}	

		
}