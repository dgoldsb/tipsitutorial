Bloody hell! Perl!

     1	#!/usr/bin/perl

These two libraries are in ../tps_example/

     2	use lib "/home/prokin01/modules-4";

angle.pm
    sub d_ang_set_times() { $Btime = shift; $Etime = shift }
    sub d_ang_set_files()
    sub d_ang_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub d_ang_print_info()
    sub d_ang_calc_data_file()
    sub d_ang_get_at_frame()
    sub d_ang_get_at_time()
    sub d_ang_clean_temp_files()
    sub d_ang_last_time()
    sub d_ang_make_dat_file()
ca_based.pm
    sub ca_set_files()
    sub ca_init_calc()
    sub ca_frames()
    sub ca_clean()
    sub ca_print_info()
    sub ca_get_ncr_at_frame()
    sub ca_get_ncr_at_time()
    sub ca_native_contacts()
    sub ca_sum_matrix()
    sub ca_calc_native_ctm()
    sub ca_conv_cagro_to_ctm()
    sub ca_calc_contact_matrices()
    sub ca_extract_gros()
conf.pm
    sub G()
    sub trjcat()
    sub trjconv()
    sub grompp()
    sub mdrun()
    sub g_gyrate()
    sub g_energy()
    sub g_rms()
    sub g_saltbr()
    sub test_input_CONF_keys()
    sub get_CONF_key_type()
    sub print_CONF()
    sub init_CONF_from_file()
    sub value()
d_aXY.pm
    sub daXY_set_times() { $Btime = shift; $Etime = shift }
    sub daXY_set_files()
    sub daXY_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub daXY_print_info()
    sub daXY_calc_data_file()
    sub daXY_get_at_frame()
    sub daXY_get_at_time()
    sub daXY_clean_temp_files()
    sub daXY_last_time()
    sub daXY_make_dat_file()
d_gXY.pm
    sub d_gXY_set_times() { $Btime = shift; $Etime = shift }
    sub d_gXY_set_files()
    sub d_gXY_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub d_gXY_print_info()
    sub d_gXY_calc_data_file()
    sub d_gXY_get_at_frame()
    sub d_gXY_get_at_time()
    sub d_gXY_clean_temp_files()
    sub d_gXY_last_time()
    sub d_gXY_make_dat_file()
dih.pm
    sub dih_set_times() { $Btime = shift; $Etime = shift }
    sub dih_set_files()
    sub dih_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub dih_print_info()
    sub dih_calc_data_file()
    sub dih_last_time()
    sub dih_clean_temp_files()
    sub dih_make_dat_file()
dist.pm
    sub dist_set_times() { $Btime = shift; $Etime = shift }
    sub dist_set_files()
    sub dist_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub dist_set_groups() { $GROUP1 = shift; $GROUP2 = shift; }
    sub dist_print_info()
    sub dist_calc_data_file()
    sub dist_get_at_frame()
    sub dist_get_at_time()
    sub dist_clean_temp_files()
    sub dist_last_time()
    sub dist_make_dat_file()
dmin.pm
    sub dmin_set_times() { $Btime = shift; $Etime = shift }
    sub dmin_set_files()
    sub dmin_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub dmin_print_info()
    sub dmin_calc_data_file()
    sub dmin_get_at_frame()
    sub dmin_get_at_time()
    sub dmin_clean_temp_files()
    sub dmin_last_time()
    sub dmin_make_dat_file()
dmin_xY.pm
    sub dminxY_set_times() { $Btime = shift; $Etime = shift }
    sub dminxY_set_files()
    sub dminxY_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub dminxY_print_info()
    sub dminxY_calc_data_file()
    sub dminxY_get_at_frame()
    sub dminxY_get_at_time()
    sub dminxY_clean_temp_files()
    sub dminxY_last_time()
    sub dminxY_make_dat_file()
d_WP.pm
    sub dWP_set_times() { $Btime = shift; $Etime = shift }
    sub dWP_set_files()
    sub dWP_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub dWP_print_info()
    sub dWP_calc_data_file()
    sub dWP_get_at_frame()
    sub dWP_get_at_time()
    sub dWP_clean_temp_files()
    sub dWP_last_time()
    sub dWP_make_dat_file()
d_XY.pm
    sub dXY_set_times() { $Btime = shift; $Etime = shift }
    sub dXY_set_files()
    sub dXY_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub dXY_print_info()
    sub dXY_calc_data_file()
    sub dXY_get_at_frame()
    sub dXY_get_at_time()
    sub dXY_clean_temp_files()
    sub dXY_last_time()
    sub dXY_make_dat_file()
geom.pm
    sub point_in_poly_arr
    sub point_in_poly_file 
grotools.pm
    sub set_gro_time() #file, time
    sub gro_scale_velocities #grofile, factor, accuracy
    sub get_energy_from_gro #grofile/trr, time, file hash, path hash
    sub get_energy_at_time #edrfile, time, tempdir, gromacspth
    sub get_number_of_ndx_groups
    sub get_group_ndx_number
    sub get_mdp_value() # input ---> file , key
    sub set_mdp_value() #input ---> file, key, value
    sub get_gro_time() # input ---> gro file
    sub get_last_log_time()
    sub check_sim_dir()
hb.pm
    sub hb_set_times() { $Btime = shift; $Etime = shift }
    sub hb_set_files()
    sub hb_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub hb_set_type     { $TYPE1  = shift if @_; $TYPE2 = shift if @_ }
    sub hb_print_info()
    sub hb_calc_data_file()
    sub hb_get_at_frame()
    sub hb_get_at_time()
    sub hb_get_type_name()
    sub hb_clean_temp_files()
    sub hb_last_time()
    sub no_hb()
    sub hb_update_data()
    sub hb_make_dat_file()
hx_rmsd.pm
    sub hxrmsd_set_times() { $Btime = shift; $Etime = shift }
    sub hxrmsd_set_range() { $RES_START = shift; $RES_END = shift; }
    sub hxrmsd_set_files()
    sub hxrmsd_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub hxrmsd_print_info()
    sub hxrmsd_calc_data_file()
    sub hxrmsd_get_at_frame()
    sub hxrmsd_get_at_time()
    sub hxrmsd_last_time()
    sub hxrmsd_clean_temp_files()
    sub hxrmsd_make_dat_file()
nc_2.pm
    sub nc2_set_times() { $Btime = shift; $Etime = shift }
    sub nc2_set_files()
    sub nc2_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub nc2_print_info()
    sub nc2_get_norm(){ return $NC }
    sub nc2_get_at_frame()
    sub nc2_get_at_time()
    sub nc2_clean_temp_files()
    sub nc2_last_time()
    sub nc2_make_dat_file()
    sub nc2_calc_data_file()
    sub nc2_extract_gros()
    sub ca2_calc_contact_matrices()
    sub nc2_conv_cagro_to_ctm() #cagro ctm
    sub sum2_matrix()
    sub nc2_native_contacts()
nc_mod.pm
    sub nc_mod_set_times() { $Btime = shift; $Etime = shift }
    sub nc_mod_set_files()
    sub nc_mod_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub nc_mod_print_info()
    sub nc_mod_get_norm(){ return $NC }
    sub nc_mod_get_at_frame()
    sub nc_mod_get_at_time()
    sub nc_mod_clean_temp_files()
    sub nc_mod_last_time()
    sub nc_mod_make_dat_file()
    sub nc_mod_calc_data_file()
    sub nc_mod_extract_gros()
    sub nc_mod_calc_contact_matrices()
    sub nc_mod_conv_cagro_to_ctm() #cagro ctm
    sub nc_mod_sum_matrix()
    sub nc_mod_native_contacts()
nc.pm
    sub nc_set_times() { $Btime = shift; $Etime = shift }
    sub nc_set_files()
    sub nc_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub nc_print_info()
    sub nc_get_norm(){ return $NC }
    sub nc_get_at_frame()
    sub nc_get_at_time()
    sub nc_clean_temp_files()
    sub nc_last_time()
    sub nc_make_dat_file()
    sub nc_calc_data_file()
    sub nc_extract_gros()
    sub ca_calc_contact_matrices()
    sub nc_conv_cagro_to_ctm() #cagro ctm
    sub sum_matrix()
    sub nc_native_contacts()
nc_sch.pm
    sub ncsch_set_times() { $Btime = shift; $Etime = shift }
    sub ncsch_set_files()
    sub ncsch_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub ncsch_print_info()
    sub ncsch_get_norm(){ return $NC }
    sub ncsch_get_at_frame()
    sub ncsch_get_at_time()
    sub ncsch_clean_temp_files()
    sub ncsch_last_time()
    sub ncsch_make_dat_file()
    sub ncsch_calc_data_file()
    sub ncsch_extract_gros()
    sub sch_calc_contact_matrices()
    sub ncsch_conv_cagro_to_ctm() #cagro ctm
    sub sum_matrix()
    sub ncsch_native_contacts()
nc_wei.pm
    sub nc_wei_set_times() { $Btime = shift; $Etime = shift }
    sub nc_wei_set_files()
    sub nc_wei_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub nc_wei_print_info()
    sub nc_wei_get_norm(){ return $NC }
    sub nc_wei_get_at_frame()
    sub nc_wei_get_at_time()
    sub nc_wei_clean_temp_files()
    sub nc_wei_last_time()
    sub nc_wei_make_dat_file()
    sub nc_wei_calc_data_file()
    sub nc_wei_extract_gros()
    sub ca_wei_calc_contact_matrices()
    sub nc_wei_conv_cagro_to_ctm() #cagro ctm
    sub sum_wei_matrix()
    sub nc_wei_native_contacts()
nw_tr3.pm
    sub nwtr3_set_times() { $Btime = shift; $Etime = shift }
    sub nwtr3_set_files()
    sub nwtr3_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub nwtr3_set_type     { $TYPE  = shift if @_ }
    sub nwtr3_print_info()
    sub nwtr3_get_at_frame()
    sub nwtr3_get_at_time()
    sub nwtr3_clean_temp_files()
    sub nwtr3_last_time()
    sub nwtr3_update_data()
    sub  nwtr3_make_dat_file()
    sub nwtr3_get_type_name() #number, index
    sub nwtr3_calc_data_file()
    sub measure
    sub indexing
    sub sqr(){ my $x = shift;  return $x*$x }
nw_X.pm
    sub nwX_set_times() { $Btime = shift; $Etime = shift }
    sub nwX_set_files()
    sub nwX_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub nwX_print_info()
    sub nwX_calc_data_file()
    sub nwX_get_at_frame()
    sub nwX_get_at_time()
    sub nwX_clean_temp_files()
    sub nwX_last_time()
    sub nwX_make_dat_file()
PostScript
PostScript007
rg.pm
    sub rg_set_times() { $Btime = shift; $Etime = shift }
    sub rg_set_files()
    sub rg_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub rg_set_type     { $RGTYPE  = shift if @_ }
    sub rg_print_info()
    sub rg_calc_data_file()
    sub rg_get_at_frame()
    sub rg_get_at_time()
    sub rg_get_type_name()
    sub rg_clean_temp_files()
    sub rg_last_time()
    sub rg_update_data()
    sub rg_make_dat_file()
rmsd.pm
    sub rmsd_set_times() { $Btime = shift; $Etime = shift }
    sub rmsd_set_files()
    sub rmsd_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub rmsd_set_type     { $RMSDTYPE  = $_[0]; $RMSDFIT = $_[1] if @_>1; }
    sub rmsd_print_info()
    sub rmsd_calc_data_file()
    sub rmsd_get_at_frame()
    sub rmsd_get_at_time()
    sub rmsd_get_type_name()
    sub rmsd_last_time()
    sub rmsd_clean_temp_files()
    sub rmsd_make_dat_file()
sas.pm
    sub sas_set_times() { $Btime = shift; $Etime = shift }
    sub sas_set_files()
    sub sas_set_gromacs_path(){ $GR = &SL( shift ) if @_ && $_[0] }
    sub sas_set_type  { $SAS_TYPE1 = shift if @_; $SAS_TYPE2 = shift if @_;}
    sub sas_print_info()
    sub sas_calc_data_file()
    sub sas_get_at_frame()
    sub sas_get_at_time()
    sub sas_get_type_name()
    sub sas_clean_temp_files()
    sub sas_last_time()
    sub sas_update_data()
    sub sas_make_dat_file()
tools.pm
    sub wherewhen()
    sub read_col_from_file_to_array() #file, 0-basedcol, arr_ref
    sub read_file_to_array() #file arrref
    sub make_path_global()
    sub min()
    sub max()
    sub make_temp_dir_in()
    sub getrandarr()
    sub getsize()
    sub numtostr()
    sub clormakdi()
    sub tesexi()
    sub read_word()
    sub print_hash()
    sub get_upper_path()
    sub dvline() 
    sub file_count()
    sub line_count()
    sub get_deepest_folder()
    sub create_number_file()
    sub add_slash()
    sub SL() 
    sub xvg_to_dat() #xvgfile, datfile,
    sub dot(){ print "." }
    sub test_folder()
xvg.pm
    sub xvg_clean_buffers()
    sub xvg_save_as()
    sub get_first_point() #parfile, xcol, ycol
    sub get_last_point() #parfile, xcol, ycol
    sub add_point() #x,y, index, hash
    sub add_par_file() #file, index, hash, colx, coly
    sub add_xy_file() #file(x,y), index, hash
    sub copy_header() #file, prop_hash
    sub add_all_sets_from_xvg() #file,start_ind, prop_hash
    sub add_set_properties() #set num, property_hash
    sub get_x_maxmin_from_xvg()
    sub get_y_maxmin_from_xvg()
    sub reverse_x_in_set()
xvg_prop.dat

     3	use lib "/home/prokin01/modules-tis";

tis_state.pm:
    sub reverse_path() #path
    sub belongs_2_ensemble() #path, \@anchor_beg \@anchor_end 
    sub get_state_arrival_time() #parfile \%STATE \%PARAM
    sub get_all_frames_as_states() #parfile %PARAM
    sub get_state_str() #back xyf, forw xyf, %PARAM, backsign, forwsign
    sub get_rex_path() #file, interface, %PARAM
    sub get_lambda() #param line !, %PARAM 
    sub get_par_path() #file,  %PARAM, connector
    sub get_state() #param line !, %PARAM 
    sub read_param_hash() #CONFfile
    sub get_path_first_trans() #file, %STATE, %PARAM
    sub reached_fin_ini_state() #parfile, %STATE, %PARAM
    sub get_essential_path() #path, \@recrossing_rules 
    sub get_anchor_times() #fullpath, @anchor_beg, @anchor_end
    sub get_state_types()#state, %STATE
    sub get_state_old() #param line ! 
    sub get_par_path_old() #file, connectorsign
    sub get_state_str_old() #back xyf, forw xyf, backsign, forwsign
    sub get_transition_time() #transtype state_str
    sub state_init_conf() 
    sub read_areas() # @states?
    sub get_number_of_params()

tps_tools.pm:
    sub stop_running_folder()
    sub get_ord_pars() #par file
    sub get_last_trr() #OPATH{TRR}
    sub get_last_zos() #PATH{ZOS}
    sub stopped() #run_folder
    sub get_folder_psid() #run_folder
    sub bf_01()
    sub oppo()
    sub make_zos_file() # path/name, num0, num1

     4	
     5	use Term::ANSIColor;
     6	use Term::ANSIColor qw(:constants);
     7	
     8	use strict;
     9	use tools; 
    10	use grotools;
    11	use conf;  
    12	use tps_tools;
    13	use tis_state;
    14	
    15	srand;
    16	
    17	
    18	
    19	
    20	##############################################################################
    21	#                                                                            #
    22	#                      PATHS/FILES/SCRIPTS                                   #
    23	#                                                                            #
    24	##############################################################################
    25	my %OPATH;   #<<< store all output folders here 
    26	my %PATH;    #<<< store all other folders in this hash 
    27	my %FILE;    #<<< store all file paths here 
    28	my %SCRIPT;  #<<< store script locations here
    29	
    30	$PATH{MAIN} = &SL(`pwd`);
    31	$FILE{CONF} = $PATH{MAIN}."CONF";
    32	&init_CONF_from_file($FILE{CONF});

ROUTINE from modules-4/conf.pm
 
  "key = value" -> CONF[key] = value

FILE:

############################################################
#paths######################################################
mode                    = check|cont
gromacs.path    	= /hpc/sw/gromacs-4.5.5-sp/bin/
path.gromacs            = /hpc/sw/gromacs-4.5.5-sp/bin/
gromacs.ff		= 1
mdrun.file              = mdrun_mpi
mdrun.standard          = mdrun
script.update           = update_baseroll
max.simult.updates      = 100 
curr.upd.folder         = /home/prokin01/tps_baseroll/current_updates/
update.interval         = 600
trj.max.frames          = 2000
gro.ndec                = 8

t.coupl                 = 0.2
mdp.dt                  = 0.002
mdp.nstxout             = 2500
mdp.nstenergy           = 2500
mdp.nstlist             = 10
mdp.rlist               = 0.8
mdp.coulombtype         = PME
mdp.rcoulomb-switch     = 0
mdp.rcoulomb            = 0.8
mdp.vdw-type            = Cut-off
mdp.rvdw-switch         = 0
mdp.rvdw                = 0.8

folder.protein  	= dna.baseroll/
file.tpr        	= topol.tpr
file.top                = topol.top
file.topA               = topol_DNA_chain_A.itp
file.topB               = topol_DNA_chain_B.itp
folder.topincl		= 
file.mdp                = input/run.mdp
file.gro                = conf.gro

folder.temp      = 
folder.outputpar = output.par/ 
folder.outputedr = output.edr/
folder.outputtrr = output.trr/
folder.outputzos = output.zos/
folder.outputrej = output.rej/
folder.outputlog = output.log/


STATES = [A,B,I]
interface.param = 1

A.type        = STATE
A.definedby   = [3,4]

A.param3.min  = 0
A.param3.max  = 0.35
A.param4.min  = 0
A.param4.max  = 0.35

I.type        = STATE
I.definedby   = [1]

I.param1.min  = 0.35
I.param1.max  = 8

B.type        = STATE
B.definedby   = [3,5]

B.param3.min  = 0
B.param3.max  = 0.35
B.param5.min  = 0
B.param5.max  = 0.35

%% These are defined in modules-4?

param.1  = dist
param.2  = angle
param.3  = bp
param.4  = wc
param.5  = hg


%% state A = (bp > 0 && bp < 0.35) && (wc > 0 && wc < 0.35)
%% state I = (dist > 0 && dist < 8)
%% state B = (bp > 0 && bp < 0.35) && (hg > 0 && hg < 0.35)


    33	&print_CONF();
    34	

Required parameters:

    35	my @NECKEY = qw/ 
    36	    update.interval
    37	    gromacs.path  
    38	    mdrun.file
    39	    mdrun.standard
    40	    script.update
    41	    max.simult.updates
    42	    curr.upd.folder
    43	    update.interval
    44	    folder.protein
    45	    file.tpr
    46	    file.top
    47	    STATES
    48	    interface.param
    49	    mdp.dt            
    50	    mdp.nstxout
    51	    mdp.nstlist
    52	    mdp.rlist               
    53	    mdp.coulombtype         
    54	    mdp.rcoulomb-switch  
    55	    mdp.rcoulomb
    56	    mdp.vdw-type
    57	    mdp.rvdw-switch
    58	    mdp.rvdw/;
    59	my $extest = &test_input_CONF_keys(\@NECKEY);
    60	die $extest if $extest !~ /OK/; 
    61	
    62	

Set folders and filenames

    63	
    64	###temporary folders stuff###################################
    65	$PATH{MAIN}=~/\/((tps)_.*)\/run_(\d+)/;
    66	my $uniqname = $1."_run".$3;
    67	
    68	#change for huygens 
    69	my $TMPDIR = `echo \$TMPDIR`; chomp $TMPDIR;	
    70	print "$TMPDIR\n";
    71	
    72	$PATH{MAINTEMP} = &SL( $TMPDIR );
    73	exit if !-e $PATH{MAINTEMP};
    74	
    75	$PATH{TEMP}=$PATH{MAINTEMP}."/$uniqname/";
    76	print "$PATH{TEMP}\n";
    77	mkdir $PATH{TEMP};
    78	exit if !-e $PATH{TEMP};
    79	##############################################################
    80	
    81	
    82	
    83	$PATH{PREV_GROS} = $PATH{TEMP}."PREV_GROS/";
    84	$PATH{CURR_GROS} = $PATH{TEMP}."CURR_GROS/";
    85	
    86	$OPATH{XY}   = &SL( $PATH{MAIN}.&value("folder.outputpar") );
    87	$OPATH{PAR}  = &SL( $PATH{MAIN}.&value("folder.outputpar") );   #replace XY by PAR...
    88	
    89	$OPATH{EDR} = &SL( $PATH{MAIN}.&value("folder.outputedr") );
    90	$OPATH{TRR} = &SL( $PATH{MAIN}.&value("folder.outputtrr") );
    91	$OPATH{ZOS} = &SL( $PATH{MAIN}.&value("folder.outputzos") );
    92	$OPATH{REJ} = &SL( $PATH{MAIN}.&value("folder.outputrej") );
    93	$OPATH{LOG} = &SL( $PATH{MAIN}.&value("folder.outputlog") );
    94	
    95	
    96	
    97	$PATH{PROT} = $TMPDIR."/".&value("folder.protein");
    98	#$PATH{PROT} = &SL( &value("folder.protein") );
    99	
   100	$PATH{TPSDIR}  = &SL( $PATH{MAINTEMP}."/$uniqname"."_mds/" );
   101	system "rm -r $PATH{TPSDIR}" if -e $PATH{TPSDIR};
   102	mkdir $PATH{TPSDIR} if !-e $PATH{TPSDIR};
   103	
   104	$PATH{TPSRUNF} = &SL( $PATH{TPSDIR}."run_forw" );
   105	$PATH{TPSRUNB} = &SL( $PATH{TPSDIR}."run_back" );
   106	$FILE{TPR}      = $PATH{PROT}.&value("file.tpr");
   107	
   108	$FILE{MDP}      = $PATH{MAIN}.&value("file.mdp");
   109	 
   110	
   111	$FILE{TOP}      = $PATH{PROT}.&value("file.top");
   112	$FILE{TOPA}     = $PATH{PROT}.&value("file.topA") if &value("file.topA");
   113	$FILE{TOPB}     = $PATH{PROT}.&value("file.topB") if &value("file.topB");
   114	$FILE{NDX}      = $PATH{PROT}.&value("file.ndx");
   115	
   116	$PATH{TOPINCL}  = $PATH{PROT}.&value("folder.topincl") if &value("folder.topincl");
   117	
   118	$SCRIPT{UPDATE_XY}  = $PATH{MAIN}.&value("script.update");
   119	$SCRIPT{REV_GRO}    = $PATH{MAIN}."toolz/revgro.perl";
   120	$SCRIPT{COMB_GRO}   = $PATH{MAIN}."toolz/combgro.perl";
   121	$SCRIPT{CNT_TRR_FR} = $PATH{MAIN}."toolz/count.trr.frames";
   122	
   123	$FILE{STAT_TIME} = $PATH{MAIN}."output.dat/times.dat";
   124	$FILE{STAT_ACC}  = $PATH{MAIN}."output.dat/accep.dat";
   125	$FILE{ZOSINF}    = $PATH{MAIN}."output.dat/zosinf.dat";
   126	$FILE{PARPATH}   = $PATH{MAIN}."output.dat/parpath.dat";
   127	$FILE{STEP_SUMUP}= $PATH{MAIN}."output.dat/step_sumup.dat";
   128	$FILE{MOVES}     = $PATH{MAIN}."output.dat/moves.dat";
   129	$FILE{UPD_BREAKS}= $PATH{MAIN}."output.dat/upd_breaks.dat";
   130	
   131	#$PATH{GROMACS}         = $TMPDIR."/".&value("gromacs.path");
   132	$PATH{GROMACS}         = &value("gromacs.path"); 
   133	$FILE{MDRUN}           = $PATH{GROMACS}."/".&value("mdrun.file");
   134	$FILE{MDRUN_STANDARD}  = $PATH{GROMACS}."/".&value("mdrun.standard");
   135	
   136	&dvline("PATHS");   &print_hash(\%PATH);
   137	&dvline("OPATHS");  &print_hash(\%OPATH);
   138	&dvline("FILES");   &print_hash(\%FILE);
   139	&dvline("SCRIPTS"); &print_hash(\%SCRIPT);
   140	print "\n";
   141	
   142	
   143	

Done setting files
Setting some global parameters

   146	
   147	
   148	##############################################################################
   149	#                                                                            #
   150	#                      GLOBALS - CONST                                       #
   151	#                                                                            #
   152	##############################################################################
   153	my $DEBUG_ON           =    0;
   154	my $NULL               =    "/dev/null";
   155	my $MODE               =    &value("mode");
   156	my $UPD                =    &value("update.interval");
   157	my $MAX_SIMULT_UPDATES =    &value("max.simult.updates");
   158	my $CURR_UPD_FOLDER    =    &value("curr.upd.folder");
   159	my $TRR_STEP           =    &value("mdp.dt")*&value("mdp.nstxout");
   160	my $TIMESTEP           =    $TRR_STEP;      
   161	my $MAX_LEN_FR         =    &value("trj.max.frames");       
   162	my $GRO_PREC           =    &value("gro.ndec"); 
   163	
   164	
   165	
   166	
   167	
   168	# STEP GLOBALS
   169	my $CUT_G;                                            #init in prepare_new_run
   170	my $INIT_FORW_BACK;                                   #0-started with the backward frame, 1-forward
   171	my $STEP               =    &get_last_trr_number() + 1;      
   172	my $N_0;
   173	my $SW_0;
   174	my $STEP6;
   175	my %RES; $RES{F} ="f"; $RES{B}="f";                   #init along updating process
   176	my $T_START_CYCLE;                                    #init at the beg of cycle
   177	my $NMAX;
   178	my $SW_MAX;
   179	my $ACCEPTED           = "";
   180	my $STORED             = 0;
   181	
   182	##########################
   183	my $CHANGE_BOX_SIZE_FLAG   =  0;                      #<<<IMPORTANT!!!
   184	##########################
   185	
   186	my $CURR_TIME_DIRECT   = 1;
   187	my $STORED_TIME_DIRECT = 1;                             
   188	my $SHOOT_FROM_STATE   = "";
   189	
   190	
   191	

Done setting global parameters

   192	
   193	
   194	##############################################################################
   195	#                                                                            #
   196	#                      TPS definitions                                       #
   197	#                                                                            #
   198	##############################################################################
   199	my @STATE = split ",", (&value("STATES")=~/\[(.+)\]/g)[0];
   200	print "\@STATE = [".join(",",@STATE)."]\n";

Read state definitions and parameters

   201	my %PARAM = &read_param_hash( $FILE{CONF} );  #<<<< STATES in CONF  have to agree with the following!
   202	

Hardcoded definitions of states for ending or continuing?

   203	
   204	my %STATE;
   205	#script will stop after getting here#
   206	$STATE{FIN}{0}   = "B";
   207	$STATE{INI}{0}   = "A";
   208	#script will continue if passing through here
   209	$STATE{INT}{0}   = "I";  #interfacial area 1
   210	

This is a dictionary.
So, we have paths like

"^(I->A->I->)*A->(I->A->)*(I->)*(B->I->)*B(->I)*$"

   211	
   212	#recrossing rules and cuts allow to get the essential 
   213	#pathway from any possible pathway
   214	my @RECROSSING_RULES    = ("A->I->A->I",   "A->I",
   215	                           "I->A->I->A",   "I->A",
   216	                           "B->I->B->I",   "B->I",
   217	                           "I->B->I->B",   "I->B",
   218	                           "^I->A",        "A",        #caps
   219	                           "B->I\$",       "B",
   220	                           "A->I\$",       "A",
   221	                          );
   222	


   223	#anchors identify beginning or end in any pathway,
   224	#could later be build from the possible acceptable essential pathways
   225	my @ANCHOR_BEG = ("A->I");
   226	my @ANCHOR_END = ("I->B");
   227	
   228	#all possible acceptable essential pathways
   229	my @ACCEPTED_PATHS      = ("A->I->B"); 
   230	

This means a trajectory that was in A and went through I to get to B is accepted, 
regardless of the number of recrossings.

So, for a trajectory that started from A, we set

    -stop B

And for a trajectory that started from B

    -stop A

If we have more states we could have, starting from A

    -stop "B || C"


   231	
   232	my %TPS;
   233	
   234	#make this work 
   235	
   236	#gaussian bias parameters
   237	my %BIAS;
   238	$BIAS{PAR}        =  &value("interface.param");
   239	$BIAS{MAXAT}      =  0;
   240	$BIAS{SIGMA}      =  0;
   241	
   242	
   243	$TPS{SHOOTING}{TYPE}                =  "";          #set at the beginning of each cycle
   244	                                                    #used in CURRENT_LENGTH, start_runs, ACCEPTED
   245	                                                    #CURRENT TPS SHOOTING TYPE. MAY CHANGE EVERY STEP!
   246	                                                    #DEPENDING ON $TPS{SHOOTING}{PROB2WAYS}
   247	$TPS{SHOOTING}{PROB2WAYS}           =  0.0;          #probability of making a 2way shooting move 
   248	$TPS{MOVES}{TIME_REVERSAL}          =  "NO";        #implemented
   249	$TPS{STORE}{REJECTED}{PAR}          =  "YES";              
   250	$TPS{STORE}{REJECTED}{XTC}          =  "YES";         
   251	$TPS{SHOOT}{INI}{VEL}{_1WAY}        =  "RANDOM";
   252	$TPS{SHOOT}{INI}{VEL}{_2WAY}        =  "RANDOM";
   253	$TPS{BIAS}{TYPE}                    =  "UNIFORM";  #UNIFORM, GAUSSIAN
   254	
   255	
   256	
   257	
   258	
   259	##############################################################################
   260	#                                                                            #
   261	#                     Initialisations                                        #
   262	#                                                                            #
   263	##############################################################################

Set run parameter values according to CONF file

   264	&init_mdp_file($FILE{MDP});                         #changes init/run.mdp which is next copied to run folders 
  2141	sub init_mdp_file() #mdpfile
  2142	{
  2143	
  2144	
  2145	#THIS IS DONE ONLY ONCE AT THE INITIALISATION, NOT REPETED IN THE STEP CYCLE.
  2146	    print BLUE, "\n>>>>>>>>>>>>>>>>>> init_mdp_file: BEGIN <<<<<<<<<<<<<<<<<<\n", RESET if $DEBUG_ON;    
  2147	    my $mdp = shift;
  2148	    &set_mdp_value($mdp,"dt",     &value("mdp.dt"));
  2149	    &set_mdp_value($mdp,"nstxout",&value("mdp.nstxout"));
  2150	    &set_mdp_value($mdp,"nstvout",&value("mdp.nstxout"));
  2151	    &set_mdp_value($mdp,"nstlog", &value("mdp.nstxout"));
  2152	    &set_mdp_value($mdp,"nstenergy", &value("mdp.nstenergy"));
  2153	
  2154	    &set_mdp_value($mdp,"nstlist",      &value("mdp.nstlist"));
  2155	    &set_mdp_value($mdp,"rlist",        &value("mdp.rlist"));
  2156	    &set_mdp_value($mdp,"coulombtype",  &value("mdp.coulombtype"));
  2157	    &set_mdp_value($mdp,"rcoulomb-switch",  &value("mdp.rcoulomb-switch"));
  2158	    &set_mdp_value($mdp,"rcoulomb",     &value("mdp.rcoulomb"));
  2159	    &set_mdp_value($mdp,"vdw-type",     &value("mdp.vdw-type"));
  2160	    &set_mdp_value($mdp,"rvdw-switch",  &value("mdp.rvdw-switch"));
  2161	    &set_mdp_value($mdp,"rvdw",         &value("mdp.rvdw"));
  2162	
  2163	#REMOVED BECAUSE INI VEL HAS TO BE SET EVERY STEP DEPENDING ON TYPE OF SHOOTING
  2164	#    if( $TPS{SHOOTING}{INITIAL}{VELOCITIES}=~/RANDOM/ )
  2165	#    {
  2166	#	&set_mdp_value($mdp,"gen_vel",      "yes");
  2167	#	&set_mdp_value($mdp,"gen_seed",     "-1" );
  2168	#    }
  2169	#    if( $TPS{SHOOTING}{INITIAL}{VELOCITIES}=~/UNCHANGED/ )
  2170	#    {
  2171	#	&set_mdp_value($mdp,"gen_vel",      "no");
  2172	#	&set_mdp_value($mdp,"gen_seed",     "0" );
  2173	#    }
  2174	
  2175	#    if( &value("mdrun.file")=~/ander/ )
  2176	#    {
  2177		print "V-rescale thermostat settings...";
  2178		my $tcoupl = &value("t.coupl");
  2179		&set_mdp_value($mdp,"Tcoupl","v-rescale");
  2180		&set_mdp_value($mdp,"tau_t","$tcoupl $tcoupl");
  2181	#    }
  2182	
  2183	    print BLUE, ">>>>>>>>>>>>>>>>>> init_mdp_file: END <<<<<<<<<<<<<<<<<<\n", RESET if $DEBUG_ON;    
  2184	}


   265	&init_tps_folder();
  2110	sub init_tps_folder()
  2111	{
  2112	    print BLUE, "\n>>>>>>>>>>>>>>>>>> init_tps_folder: BEGIN <<<<<<<<<<<<<<<<<<\n", RESET if $DEBUG_ON;    
  2113	    #create directory################################
  2114	    print "initialising tps folders... \n";
  2115	    `rm $PATH{TPSDIR} -r` if -e $PATH{TPSDIR};
  2116	    mkdir $PATH{TPSDIR};
  2117	    mkdir $PATH{TPSRUNF};
  2118	    mkdir $PATH{TPSRUNB};
  2119	 
  2120	    #files copied once###############################
  2121	    my @list = ($FILE{TOP},$FILE{NDX},$FILE{MDP},$PATH{TOPINCL});
  2122	    push @list, $PATH{TOPINCL} if $PATH{TOPINCL};
  2123	    push @list, $FILE{TOPA} if $FILE{TOPA};
  2124	    push @list, $FILE{TOPB} if $FILE{TOPB};
  2125	    my $list = join " ", @list;
  2126	        
  2127	    `cp -r $list $PATH{TPSRUNF}`;
  2128	    `cp -r $list $PATH{TPSRUNB}`;
  2129	
  2130	    #MODIFY BACK AND FORW MDPS
  2131	    #$FILE{MDP} =~ /\/([a-zA-Z0-9_]+\.mdp)$/;
  2132	    #my $mdp = $1;
  2133	    #$PATH{TPSRUNF}.$mdp
  2134	    #$PATH{TPSRUNB}.$mdp
  2135	   
  2136	    
  2137	    print BLUE, "\n>>>>>>>>>>>>>>>>>> init_tps_folder: END <<<<<<<<<<<<<<<<<<\n", RESET if $DEBUG_ON;    
  2138	}
  2139	
  2140	


   266	&check_output_folders() if $MODE=~/check/;      
  2320	sub check_output_folders()  # %OPATH %FILE %PATH %SCRIPT
  2321	{
  2322	    print RED, ">>>>check_output_folders: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  2323	    #####################################
  2324	    #my $ref1 = shift; my $ref2 = shift; 
  2325	    #my $ref3 = shift; my $ref4 = shift;
  2326	    #my %OPATH  = %$ref1;
  2327	    #my %FILE   = %$ref2;
  2328	    #my %PATH   = %$ref3;
  2329	    #my %SCRIPT = %$ref4;
  2330	    #my $NULL   = "/dev/null";
  2331	    ####################################
  2332	    
  2333	
  2334	    &dvline("output check");
  2335	    #check wether trrs have their zos and right length
  2336	    my @trr = split "\n", `ls -1 $OPATH{TRR} | grep trr`;
  2337	      
  2338	    printf "%-10s      %s %s %s\n","trr file","FRS","ZOS","PAR";
  2339	    my %TMP; $TMP{0} = &make_temp_dir_in($PATH{TEMP});
  2340	    for(my $i=0; $i<@trr; $i++)
  2341	    {
  2342		$trr[$i] =~ /(\d+)/;
  2343		my $trr = "$OPATH{TRR}$trr[$i]";
  2344		my $num = $1;
  2345		my $num6 = &numtostr($1,6);
  2346		print "$trr[$i] --> ";
  2347		if( !-e "$OPATH{ZOS}$num6.zos" )
  2348		{
  2349		    print "no zos! exit";
  2350		    exit;
  2351		}
  2352		my $frs = `$SCRIPT{CNT_TRR_FR} $trr $FILE{TPR} $TMP{0}`;
  2353		printf "{%3d,",$frs;
  2354	
  2355		my $par_l = `wc -l  $OPATH{PAR}$num6.par`; 
  2356		$par_l -= 1; #header line
  2357	
  2358	#DIRTY HACK!!!!!	
  2359		$frs = $par_l;
  2360	
  2361		printf "%3d",$par_l;
  2362		
  2363	
  2364		##############################
  2365	#	$N_0 = $frs if $i == 0; 
  2366		##############################
  2367	
  2368		my @zos = split "", `head -n1 $OPATH{ZOS}$num6.zos`;
  2369		printf "%3d,",scalar(@zos);
  2370		if(@zos != $frs) 
  2371		{
  2372		    print "ERROR";
  2373	#	    exit;
  2374		} 
  2375		
  2376		
  2377		my $str = ( &get_par_path($OPATH{PAR}.$num6.".par",\%PARAM ) =~ /\[.+\]/g)[0];
  2378		print $str."\n";
  2379	    }
  2380	    print "output folders check ---> OK\n";
  2381	    
  2382	    #check also xy and edr folders....
  2383	
  2384	    `rm -r $TMP{0}`;
  2385	    &dvline();
  2386	    print RED, ">>>>check_output_folders: END (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  2387	}

   267	exit if $MODE!~/cont/;                              #<<<unknown mode then

   268	
   269	&init_tmp_gro_dir();
  2054	sub init_tmp_gro_dir()
  2055	{
  2056	    print RED, ">>>>init_tmp_gro_dir: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  2057	    #export gros from the last trr to tmp gro folder
  2058	    mkdir $PATH{PREV_GROS} if !-e $PATH{PREV_GROS};
  2059	    mkdir $PATH{CURR_GROS} if !-e $PATH{CURR_GROS};
  2060	    `rm $PATH{PREV_GROS}* 1> $NULL 2>$NULL`;
  2061	    `rm $PATH{CURR_GROS}* 1> $NULL 2>$NULL`; 
  2062	    

Split TRR to GRO files
  2063	    my $trr = &get_last_trr($OPATH{TRR});
  2064	    $trr =~ /(\d+)\.trr/;
  2065	    my $num6 = $1;
  2066	    print "extracting gros to temp folder from $num6.trr... ";
  2067	    my $input  = "-s $FILE{TPR} -f $trr -ndec $GRO_PREC -sep";
  2068	    my $output = "-o $PATH{PREV_GROS}.gro";
  2069	    my $stream = "1>$PATH{PREV_GROS}trjconv.out 2>$PATH{PREV_GROS}trjconv.err";  
  2070	    open(TRJ, "|$PATH{GROMACS}/trjconv $input $output $stream");
  2071	    print TRJ "0\n";
  2072	    close(TRJ);
  2073	    #system "$PATH{GROMACS}/trjconv $input $output $stream"." <<EOF\n 0\n EOF";
  2074	    print "done\n";
  2075	
  2076	    #system "cp $PATH{PREV_GROS}trjconv.err $PATH{MAIN}";
  2077	    

The ZOS is a line of 0/1s which should match the TRR
  2078	    print "checking zos compatibility... ";
  2079	    my @gros = split /\n/, `ls -1 $PATH{PREV_GROS} | grep gro`;
  2080	    my $zos = "$OPATH{ZOS}$num6.zos";
  2081	    die "no $zos fnd" if !-e $zos; 
  2082	    my @zos = split "", `head -n1 $zos`;
  2083	    die "incompatible zos and trr \n$#zos  $#gros\n" if @zos != @gros;
  2084	    print "done\n";
  2085	    

0 -> backward frame
1 -> forward frame
These should be flagged in the TRR file

  2086	    print "renaming gro frames in PREV_GROS... ";
  2087	    for(my $i=0; $i<@gros; $i++)
  2088	    {
  2089		$gros[$i] =~ /(\d+)/;
  2090		my $gnum  = $1;
  2091		my $gnum6 = &numtostr($gnum,6);
  2092		#print $gnum." --->  $zos[$gnum]\n";
  2093		`mv $PATH{PREV_GROS}$gros[$i] $PATH{PREV_GROS}b$gnum6.gro`
  2094		    if $zos[$gnum] == 0;
  2095		`mv $PATH{PREV_GROS}$gros[$i] $PATH{PREV_GROS}f$gnum6.gro`
  2096		    if $zos[$gnum] == 1;
  2097	    }
  2098	    print "done\n";
  2099	    print RED, ">>>>init_tmp_gro_dir: END (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  2100	}

   270	
   271	open FILE_MOVES, ">>".$FILE{MOVES};
000010  shooting(1WAY)  accepted        A->I->B
000011  shooting(1WAY)  rejected        A->I->A
000011  shooting(1WAY)  rejected        A->I->A
000011  shooting(1WAY)  rejected        B->I->B->0->I->B
000011  shooting(1WAY)  rejected        B->I->B
000011  shooting(1WAY)  rejected        B->I->B
000011  shooting(1WAY)  accepted        A->I->B
000012  shooting(1WAY)  rejected        A->I->A
000012  shooting(1WAY)  accepted        A->I->B
000013  shooting(1WAY)  rejected        A->I->A
000013  shooting(1WAY)  accepted        A->I->B


   272	    
   273	
   274	
   275	##############################################################################
   276	#                                                                            #
   277	#                     Main LOOP                                              #
   278	#                                                                            #
   279	##############################################################################

Coming back here from line 509

   280	BEG:
   281	
   282	print "\n/////////////////////////////////////////////////////////////////////////////////////////////////////\n";
   283	print "/////////////////////////////////////////////////////////////////////////////////////////////////////\n";
   284	print "/////////////////////////////////////////////////////////////////////////////////////////////////////\n";

Get the number of the last TRR

   289	$STEP  = &get_last_trr_number() + 1;                  #<<< set new step number 
  1950	sub get_last_trr_number()
  1951	{
  1952	    #read the current step from the trr folder#
  1953	    my @trrs = split /\n/, `ls -1 $OPATH{TRR}`;
  1954	    my $max_num = 0;
  1955	    for(my $i = 0; $i<@trrs; $i++)
  1956	    {
  1957		$trrs[$i] =~ /(\d+)/;
  1958		$max_num = $1 if $1 > $max_num;
  1959	    }
  1960	    
  1961	    return $max_num;
  1962	}


Pad the number with zeroes

   290	$STEP6 = &numtostr($STEP,6);

Read the configuration file (again)
The CONF file may be updated on the fly...

   291	&init_CONF_from_file($FILE{CONF});                    #<<< read configuration every step in case of some adjustements


   294	
   295	#-----------------------------------------------------------------------------------------------------------------------
   296	
   297	print RED, "TIME REVERSAL MOVES = $TPS{MOVES}{TIME_REVERSAL}\n", RESET;
   298	
   299	TIME_REVERSAL:
   300	#check if the trj is Initial->Interfaces->Initial
   301	#than if rand>0.5 REVERSE and $CURR_TIME_DIRECT*=-1
   302	#zos and gros reversed when the CURR_TIME_DIRECT != STOR_TIME_DIRECT and SHOOTING STARTS
   303	

Noooo! a GOTO? --> line 333

   304	goto SHOOTING if ($TPS{MOVES}{TIME_REVERSAL}=~/NO/);

if TIME_REVERSAL == True:
{
   305	my $roll = rand(); 
   306	if($roll > 0.5) { print "\n"; goto SHOOTING; }
   307	
   308	print "TIME REVERSAL: ";
   309	#WRONG _ ERROR 
   310	my $path = ( &get_par_path($OPATH{PAR}.&numtostr($STEP-1,6).".par",\%PARAM) =~ /\[(.+)\]/g )[0];
   311	my $ess_path = &get_essential_path($path,\@RECROSSING_RULES);
   312	
   313	my $rev_ess_path = &reverse_path($ess_path);
   314	print "REV[ $ess_path ] = $rev_ess_path";
   315	
   316	if( &belongs_2_ensemble($rev_ess_path,\@ANCHOR_BEG, \@ANCHOR_END) ) 
   317	{
   318	    print " --> ACCEPTED\n";
   319	    $CURR_TIME_DIRECT *= -1;
   320	    $ess_path = $rev_ess_path;
   321	    print FILE_MOVES "$STEP6\ttime_rev\taccepted\t$ess_path\n";

Go to line 299

   322	    goto TIME_REVERSAL;
   323	}
   324	else
   325	{
   326	    print " --> REJECTED\n";
   327	    print FILE_MOVES "$STEP6\ttime_rev\trejected\t$ess_path\n";

Go to line 299

   328	    goto TIME_REVERSAL;
   329	}
   330	
}
 

   331	#----------------------------------------------------------------------------------------------------------------------------
   332	
   333	SHOOTING: 
   334	
   335	my $rnd = rand();
   336	$TPS{SHOOTING}{TYPE}="2WAY" if $rnd <  $TPS{SHOOTING}{PROB2WAYS};
   337	$TPS{SHOOTING}{TYPE}="1WAY" if $rnd >= $TPS{SHOOTING}{PROB2WAYS};
   338	print RED, "SHOOTING TYPE THIS STEP = $TPS{SHOOTING}{TYPE}\n", RESET; 
   339	    
   340	
   341	&move_gro_frames();                                   #<<< move gro frames from CURR to PREV_GROS  
   342	if( $CURR_TIME_DIRECT != $STORED_TIME_DIRECT )
   343	{
   344	    &_reverse_gro_files_in_PREV();
   345	    $STORED_TIME_DIRECT *= -1;                        #<<< gros reverse (in PREV_GROS);
   346	}

 
   347	&prepare_new_run();                                   #<<< initiate run folders (and random the initial gro file)
Until line 2051
  1968	sub prepare_new_run()
  1969	{
  1970	    print RED, ">>>>prepare_new_run: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  1971	    print BLUE, "[ preparing new run ]\n", RESET if $DEBUG_ON;
  1972	   
  1973	
  1974	     #first remove unnecessary files####
  1975	    my @list =("*.log","*.err","*.out","*.gro","mdout.mdp",
  1976		       "*.tpr","*.xtc","*.trr","*.edr","#*");
  1977	
  1978	    #print "removing files --> [".join("|",@list)."]\n";
  1979	    print "removing files...\n" if $DEBUG_ON;
  1980	    for(my $i=0; $i<@list; $i++)
  1981	    {
  1982		`rm $PATH{TPSRUNF}$list[$i] 1>$NULL 2>$NULL`;
  1983		`rm $PATH{TPSRUNB}$list[$i] 1>$NULL 2>$NULL`;
  1984	    }
  1985	   
  1986	    #choos starting frame, prepare reverse gro###
  1987	    #and copy to right folders###################
* 1988	    &prepare_gro_files();
  1989	
  1990	    #init the RESULTS####
  1991	    $RES{F} = "f";
  1992	    $RES{B} = "f";
  1993	    
  1994	
  1995	    #also do some cleaning in output
  1996	    #remove all the files with the current step 
  1997	    #IMPORTANT!!! most IMPORTANT TO CLEAN XY!
  1998	    print "removing this step output files\n" if $DEBUG_ON;
  1999	    my $step6 = &numtostr($STEP,6);
  2000	    foreach my $ext (keys %OPATH)
  2001	    {
  2002		#dont remove REJECTED PATWAYS....
  2003		next if $ext=~/REJ/;
  2004		`rm $OPATH{$ext}$step6* 1>$NULL 2>$NULL`;
  2005	    }
  2006	    `rm $OPATH{PAR}$STEP.forw 1>$NULL 2>$NULL`;
  2007	    `rm $OPATH{PAR}$STEP.back 1>$NULL 2>$NULL`;
  2008	
  2009	    #here we set the mdp file ini vel type as it may change every step 
  2010	    my $mdpf = "$PATH{TPSRUNF}/run.mdp";
  2011	    my $mdpb = "$PATH{TPSRUNB}/run.mdp";
  2012	    if( $TPS{SHOOTING}{TYPE} =~ /1WAY/ )
  2013	    {	
  2014		if( $TPS{SHOOT}{INI}{VEL}{_1WAY} =~ /RANDOM/ )
  2015		{
  2016		    &set_mdp_value($mdpf,"gen_vel",      "yes");
  2017		    &set_mdp_value($mdpf,"gen_seed",     "-1" );
  2018		    &set_mdp_value($mdpb,"gen_vel",      "yes");
  2019		    &set_mdp_value($mdpb,"gen_seed",     "-1" );
  2020		}
  2021		if( $TPS{SHOOT}{INI}{VEL}{_1WAY} =~ /UNCHANGED/ )
  2022		{
  2023		    &set_mdp_value($mdpf,"gen_vel",      "no");
  2024		    &set_mdp_value($mdpf,"gen_seed",     "0" );
  2025		    &set_mdp_value($mdpb,"gen_vel",      "no");
  2026		    &set_mdp_value($mdpb,"gen_seed",     "0" );
  2027		}
  2028		
  2029	    }
  2030	    
  2031	    if( $TPS{SHOOTING}{TYPE} =~ /2WAY/ )
  2032	    {
  2033		if( $TPS{SHOOT}{INI}{VEL}{_2WAY} =~ /RANDOM/ )
  2034		{
  2035		    &set_mdp_value($mdpf,"gen_vel",      "yes");
  2036		    &set_mdp_value($mdpf,"gen_seed",     "-1" );
  2037		    &set_mdp_value($mdpb,"gen_vel",      "no");
  2038		    &set_mdp_value($mdpb,"gen_seed",     "0" );
  2039		}
  2040		if( $TPS{SHOOT}{INI}{VEL}{_2WAY} =~ /UNCHANGED/ )
  2041		{
  2042		    &set_mdp_value($mdpf,"gen_vel",      "no");
  2043		    &set_mdp_value($mdpf,"gen_seed",     "0" );
  2044		    &set_mdp_value($mdpb,"gen_vel",      "no");
  2045		    &set_mdp_value($mdpb,"gen_seed",     "0" );
  2046		}
  2047	    }
  2048	    
  2049	
  2050	    print RED, ">>>>prepare_new_run: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  2051	}


   348	&init_step_variables();                               #<<< set values for the global variables that change with new step 
   936	sub init_step_variables()
   937	{
   938	    print RED, "\n>>>>init_step_variables: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
   939	    $T_START_CYCLE = time;
   940	    
   941	    my @pars = `ls -1 $OPATH{PAR}/*.par`; chomp @pars;
   942	    my $par_0 = $pars[0];
   943	    die "$par_0 doesnt exist" if !-e $par_0;
   944	   
   945	    #$N_0 = `wc -l $OPATH{PAR}/$step6.par | awk \'{print \$1}\'`-1;
   946	    my $awk_col = $BIAS{PAR} + 1;
   947	
   948	    ##############################################################
   949	    my $prev_par = $OPATH{PAR}.&numtostr($STEP-1,6).".par";
   950	    my @lambda_prev = split "\n", `awk \'{print \$$awk_col}\' $prev_par`;
   951	    chomp @lambda_prev; shift @lambda_prev; 
   952	    my $SW_prev = &SW(\@lambda_prev);
   953	    my $alpha;
   954	    do{ $alpha = rand() } while ($alpha==0);
   955	    ##############################################################
   956	    $SW_MAX = $SW_prev / $alpha;  
   957	    ##############################################################
   958	
   959	
   960	
   961	    $RES{F}="f"; $RES{B}="f";   
   962	    
   963	    $ACCEPTED = "";
   964	        
   965	    #setting step dependent file names###
   966	    $FILE{XYF} = "$OPATH{PAR}$STEP.forw";
   967	    $FILE{XYB} = "$OPATH{PAR}$STEP.back";
   968	    #####################################
   969	    print RED, ">>>>init_step_variables: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
   970	}


   349	if($TPS{SHOOTING}{TYPE}=~/1WAY/)
   350	{
   351	    my $p = rand(); 
   352	    if($p<0.5){ $INIT_FORW_BACK=0 }
   353	    else { $INIT_FORW_BACK=1}                         #<<< decide if we shoot forward=1/backward=0
   354	    print "SHOOTING ".($INIT_FORW_BACK==1 ? "FORWARD " : "BACKWARD " );
   355	    printf "(rand = %.4f)\n", $p;
   356	}
   357	print "\n";
   358	
   359	&_info_step_variables();                              #<<< print values of the variables for checkup
   918	sub _info_step_variables()
   919	{
   920	    my $line = '-' x length($FILE{XYB});
   921	    print RED, "--------[ step variables ]$line\n",RESET;
   922	    print "\tSTEP               = $STEP\n";
   923	    print "\tCUT_G              = $CUT_G\n";
   924	    print "\tN_0                = $N_0\n";
   925	    print "\tNMAX               = $NMAX\n";
   926	   printf "\tSW_0               = %.2f\n", $SW_0;
   927	   printf "\tSW_MAX             = %.2f\n", $SW_MAX;
   928	    print "\t{RESB,RESF}        = {$RES{B},$RES{F}}\n";
   929	    print "\tACCEPTED           = $ACCEPTED\n";
   930	    print "\tSTORED             = $STORED\n";
   931	    print "\tINIT_FORW_BACK     = $INIT_FORW_BACK\n";
   932	    print "\tSTORED_TIME_DIRECT = $STORED_TIME_DIRECT\n";
   933	    print RED, "--------------------------$line\n",RESET;
   934	} 


   361	&start_runs();                                        #<<< start forw/back runs respectively of $INIT_FORW_BACK
Until line 1585
--------------------------------------------------
-forward forward.tpr -backward backward.tpr
if FORWARD:
    MD forward.tpr
if BACKWARD
    MD backward.tpr
--------------------------------------------------
  1436	sub start_runs()
  1437	{
  1438	    print RED, "\n>>>>start_runs: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  1439	    my $ERROR_STATUS = 0;
  1440	    
  1441	    if( $INIT_FORW_BACK == 1 || $TPS{SHOOTING}{TYPE}=~/2WAY/ )
  1442	    {
  1443		#GROMPP FORWARD#######################################
  1444		print "grompping forward run... ";
  1445		chdir $PATH{TPSRUNF};
  1446		my $input  = "-f run.mdp -c start.gro -p topol.top";
  1447		my $output = "-o run.tpr";
  1448		my $stream = "1>grompp.out 2>grompp.err";
  1449		
  1450		system "$PATH{GROMACS}/grompp  $input $output $stream";
  1451	
  1452	#	print &grompp("$input $output $stream");
  1453	#	system "cp grompp.err grompp.out $PATH{MAIN}";
  1454	
  1455		$ERROR_STATUS = "{tprforw}" if ! -e "run.tpr";
  1456		print "done\n";
  1457	    }
  1458	
  1459	    if( $INIT_FORW_BACK == 1 || $TPS{SHOOTING}{TYPE}=~/2WAY/ )
  1460	    {
  1461		#MDRUN FORWARD#########################################
  1462		print "starting forward mdrun... ";
  1463		chdir $PATH{TPSRUNF};
  1464		my $input  = "-s run.tpr";
  1465		my $output = "-e run -o run -c after -g run -x run";
  1466		my $stream = "1> mdrun.log 2> mdrun.err";
  1467	
  1468		system "srun $FILE{MDRUN} $input $output $stream &";
  1469		#system "$FILE{MDRUN} $input $output $stream &";
  1470	
  1471		my $mdtest=0;
  1472		my $mdpsid=-1;
  1473		while($mdtest<20 && $mdpsid==-1)
  1474		{
  1475		    $mdpsid = &get_folder_psid($PATH{TPSRUNF});
  1476		    $mdtest++;
  1477		    sleep(4);
  1478		}
  1479		if($mdpsid == -1)
  1480		{
  1481		    print "forw mdrun not successfull\n";
  1482		    print "---> CRASH\n";
  1483		    `cp $PATH{TPSRUNF}/mdrun.* $PATH{MAIN} `;
  1484		    `cp $PATH{TPSRUNF}/run.log $PATH{MAIN} `;
  1485		    exit;
  1486		}
  1487		print "done\n";
  1488	    }
  1489	    
  1490	
  1491	    #in case of the 2 way Shooting
  1492	    #we have to set the back mdp file no to randomize them,
  1493	    #initial gro file has to be extracted from the run.trr in run_forw. 
  1494	
  1495	    if( $TPS{SHOOTING}{TYPE}=~/2WAY/ )
  1496	    {
  1497		print "reversing first forward frame...";
  1498		chdir $PATH{TPSRUNB};
  1499	
  1500		#this is already done in prepare_new_run 
  1501		#&set_mdp_value("run.mdp","gen_vel",      "no");
  1502		#&set_mdp_value("run.mdp","gen_seed",     "0" );
  1503		
  1504		`rm start.gro`;
  1505		my $tpr = "$PATH{TPSRUNF}/run.tpr";
  1506		my $trr = "$PATH{TPSRUNF}/run.trr";
  1507		my $str = "1>ini.out 2>ini.err <<EOF\n0\nEOF";
  1508		`$PATH{GROMACS}/trjconv -s $tpr -f $trr -b 0 -e 0 -o ini.gro -ndec $GRO_PREC $str`;
  1509		die "problems with trjconv" if !-e "ini.gro";
  1510		
  1511		my %TMP; $TMP{0} = &make_temp_dir_in($PATH{TEMP}); 
  1512		`cp ini.gro $TMP{0}`;
  1513		my $revgro = &reverse_gro($TMP{0},"$TMP{0}ini.gro");
  1514		chdir $PATH{TPSRUNB};
  1515		`cp $revgro start.gro`;
  1516	
  1517		`rm ini.gro`;
  1518		`rm -r $TMP{0}`;
  1519		
  1520		
  1521	    }
  1522	
  1523	
  1524	    if( $INIT_FORW_BACK == 0 ||  $TPS{SHOOTING}{TYPE}=~/2WAY/ )
  1525	    {
  1526		#GROMPP BACKWARD######################################
  1527		print "grompping backward run... ";
  1528		chdir $PATH{TPSRUNB};
  1529		my $input  = "-f run.mdp -c start.gro -p topol.top";
  1530		my $output = "-o run.tpr";
  1531		my $stream = "1>grompp.out 2>grompp.err";
  1532	
  1533		system "$PATH{GROMACS}/grompp $input $output $stream";
  1534	
  1535	#@	print &grompp("$input $output $stream");
  1536	#	system "cp grompp.err grompp.out $PATH{MAIN}";
  1537	
  1538		$ERROR_STATUS = "{tprback}" if ! -e "run.tpr";
  1539		print "done\n";
  1540	    }
  1541	
  1542	    if( $ERROR_STATUS=~/(tprback|tprforw)/ )
  1543	    {
  1544		print "grompping was not successfull :: $1\n";
  1545		print "---> CRASH\n";
  1546		exit;
  1547		
  1548	    }
  1549	
  1550	    
  1551	    if( $INIT_FORW_BACK == 0 || $TPS{SHOOTING}{TYPE}=~/2WAY/ )
  1552	    {
  1553		#MDRUN BACKWARD########################################
  1554		print "starting backward mdrun... ";
  1555		chdir $PATH{TPSRUNB};
  1556		my $input  = "-s run.tpr";
  1557		my $output = "-e run -o run -c after -g run -x run";
  1558		my $stream = "1> mdrun.log 2> mdrun.err";
  1559	
  1560		system "srun $FILE{MDRUN} $input $output $stream &";
  1561		#system "$FILE{MDRUN} $input $output $stream &";
  1562	
  1563		my $mdtest=0;
  1564		my $mdpsid=-1;
  1565		while($mdtest<20 && $mdpsid==-1)
  1566		{
  1567		    $mdpsid = &get_folder_psid($PATH{TPSRUNB});
  1568		    $mdtest++;
  1569		    sleep(4);
  1570		}
  1571		if($mdpsid == -1)
  1572		{
  1573		    print "back mdrun not successfull\n";
  1574		    print "---> CRASH\n";
  1575		    exit;
  1576		    `cp $PATH{TPSRUNF}/mdrun.* $PATH{MAIN} `;
  1577		    `cp $PATH{TPSRUNF}/run.log $PATH{MAIN} `;
  1578		}
  1579	    
  1580		print "done\n";
  1581	    }
  1582	    #FINISHED###############################################
  1583	    chdir $PATH{MAIN};
  1584	    print RED, ">>>>start_runs: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  1585	}

The simulations run in the background....

   366	#######################################
   367	#                                     #
   368	#           MD LOOP                   #
   369	#                                     #
   370	#######################################
   371	my ($stf, $stb)  = (0, 0);                            
   372	do{
   373	    die "DIE in folder" if -e "DIE";
   374	    
   375	    #reload external variables#####################################################
   376	    &init_CONF_from_file($FILE{CONF}); 
   377	    $UPD                =    &value("update.interval");
   378	    $MAX_SIMULT_UPDATES =    &value("max.simult.updates");
   379	
   380	    #updating queue#################################################################
   381	    my $T1 = time; 
   382	    sleep($UPD); 
   383	    #my $dummy = &queue();
   384	    my $T2 = time; 
   385	
   386	    open  UPD_BREAKS,">>$FILE{UPD_BREAKS}";
   387	    print UPD_BREAKS ($T2-$T1)."\n";
   388	    close UPD_BREAKS;
   389	    
   390	    #`echo 1 > $CURR_UPD_FOLDER/$dummy`;  #add dummy file to the queue folder


   391	    &update_xy();
  1372	sub update_xy()
  1373	{   
  1374	    print RED, "\n>>>>update_xy: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  1375	    #FIRST FORWARD#################################
  1376	    
  1377	    #IMPORTANT.
  1378	    #this procedure also measures updating time, and if it is higher 
  1379	    #than update frequency, the update frequency is adequatly tuned.
  1380	    
  1381	    my $T1 = time;
  1382	    
  1383	    
  1384	    if(!&stopped($PATH{TPSRUNF}))
  1385	    {
  1386	
  1387		my $trr = "$PATH{TPSRUNF}run.trr";
  1388		#my $scr = "$SCRIPT{UPDATE_XY} $PATH{TPSRUNF} $STEP";
  1389		my $scr = "$SCRIPT{UPDATE_XY} $trr $STEP forw";
  1390	#	my $out = "$PATH{TPSRUNF}update.out";
  1391		my $out = "$OPATH{LOG}updatef.out";
  1392	#	my $err = "$PATH{TPSRUNF}update.err";
  1393		my $err = "$OPATH{LOG}updatef.err";
  1394		$scr.=" 1>$out 2>$err";
  1395		#print "update cmd = $scr\n";
Calculate parameters (and do a lot of silly things)
  1396		system $scr;    
  1397	
  1398		
  1399		#dummy XYB file only if 1WAY!
  1400		if( $TPS{SHOOTING}{TYPE} =~ /1WAY/ )
  1401		{
  1402		    open XYB, ">$FILE{XYB}";  print XYB " ";  close XYB;
  1403		}
  1404		
  1405	    }
  1406	    else {  }
  1407	 
  1408	   
  1409	    if(!&stopped($PATH{TPSRUNB}))
  1410	    {
  1411	
  1412		my $trr = "$PATH{TPSRUNB}run.trr";
  1413		#my $scr = "$SCRIPT{UPDATE_XY} $PATH{TPSRUNB} $STEP";
  1414		my $scr = "$SCRIPT{UPDATE_XY} $trr $STEP back";
  1415		my $out = "$OPATH{LOG}updateb.out";
  1416	#	my $out = "$PATH{TPSRUNB}update.out";
  1417		my $err = "$OPATH{LOG}updateb.err";
  1418	#	my $err = "$PATH{TPSRUNB}update.err";
  1419		$scr.=" 1>$out 2>$err";
  1420		#print "update cmd = $scr\n";
Calculate parameters (and do a lot of silly things)
  1421		system $scr;    
  1422	
  1423	
  1424		#dummy XYF file 
  1425		if( $TPS{SHOOTING}{TYPE} =~ /1WAY/ )
  1426		{
  1427		    open XYF, ">$FILE{XYF}";  print XYF " ";  close XYF;
  1428		}
  1429	    }
  1430	    else { }
  1431	
  1432	    print RED, ">>>>update_xy: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  1433	}


   392	    #`rm $CURR_UPD_FOLDER/$dummy`;        #remove dummy marker 
   393	    ################################################################################
   394	
   395	    #STATE tells what are final/initail states possible and PARAM gives their definitions 
   396	    $RES{F} = &reached_fin_ini_state($FILE{XYF},\%STATE,\%PARAM) if $RES{F}=~/f|0/;
   397	    $RES{B} = &reached_fin_ini_state($FILE{XYB},\%STATE,\%PARAM) if $RES{B}=~/f|0/;
   398	   
   399	    #print the current path in state representation
   400	  
   401	    
   402	
   403	    #check stopped/running status of both mdruns
   404	    $stf = &stopped($PATH{TPSRUNF});
   405	    $stb = &stopped($PATH{TPSRUNB});
   406	 
   407	    #stop mdrun in case it reached a state and is still running
   408	    &stop_running_folder($PATH{TPSRUNF})if($RES{F}=~/1/ && !$stf );
   409	    &stop_running_folder($PATH{TPSRUNB})if($RES{B}=~/1/ && !$stb );
   410	    sleep(2);            
   411	                          
   412	    #check the stopped status again just to be sure it was really stopped
   413	    $stf = &stopped($PATH{TPSRUNF});
   414	    $stb = &stopped($PATH{TPSRUNB});
   415	    
   416	    #check the N_max criterium
   417	#    my $N_sum = &CURRENT_LENGTH();
   418	    
   419	    my $fr_curr = &FR_CURR();
   420	    my $sw_curr = &SW_CURR();
   421	
   422	    if(  $fr_curr >= $MAX_LEN_FR  || $sw_curr >= $SW_MAX)
   423	    {
   424		print "NUMBER OF FRAMES ($MAX_LEN_FR) EXCEEDED\n" if $fr_curr >= $MAX_LEN_FR ;
   425		printf "SUM OF WEIGHTS  EXCEEDED SW_MAX=%.2f\n", $SW_MAX if $sw_curr >= $SW_MAX;
   426		&stop_running_folder($PATH{TPSRUNF}) if $stf==0;
   427		&stop_running_folder($PATH{TPSRUNB}) if $stb==0;
   428	    }
   429	   
   430	   
   431	
   432	    #check if stopped again
   433	    $stf = &stopped($PATH{TPSRUNF});
   434	    $stb = &stopped($PATH{TPSRUNB});
   435	   
   436	#do the loop until at least one is running. if stf+stb=2 than both stopped
   437	}while($stf + $stb < 2);
   438	#######################################
   439	#                                     #
   440	#         END of  MD LOOP             #
   441	#                                     #
   442	#######################################
   443	

End of one or two monitored MD runs

   444	
   445	&truncate_trrs();                                      #<<< cut the trr(s) just after they enter stable state
   446	print "\n";
   447	
   448	#first store to get par file even if this is not gonna be accepted########
   449	#the storage procedure is based on the ACCEPTED/STORED values, so we set them 
   450	#if they were going to be accepted                             
   451	$STORED = 1;                                               #set to 1 for the store_trr
   452	$ACCEPTED = $INIT_FORW_BACK == 1 ? "forw" : "back";          
   453	$ACCEPTED = "forwback" if $TPS{SHOOTING}{TYPE}=~/2WAY/;        
   454	&store_trr();                                              #<--- uses STORED and ACCEPTED
   455	&make_par_file();
   456	print "\n"; 
   457	
   458	
   459	my $parf = $OPATH{PAR}.&numtostr($STEP,6).".par";
   460	$ACCEPTED = &ACCEPTED($parf,$SW_MAX);
   461	print "ACCEPTED = [$ACCEPTED]\n";
   462	#now the files $STEP.par/trr/zos files are stored as if they were going to be accepted 
   463	#they will be removed later after storage of the rejected paths
   464	print "\n";
   465	
   466	#######################################
   467	#                                     #
   468	#         STORAGE & STATS             #
   469	#                                     #
   470	#######################################
   471	my $this_step_path = ( &get_par_path($parf,\%PARAM) =~ /\[(.+)\]/g )[0];
   472	my $this_step_ess_path = &get_essential_path($this_step_path,\@RECROSSING_RULES);
   473	
   474	
   475	
   476	&write_step_summary($parf); #write summary before par file might be moved to output.rej
   477	
   478	if( $ACCEPTED=~/forw/ || $ACCEPTED=~/back/ )
   479	{
   480	    $STORED = 1;
   481	    &store_dat_files_all_steps();
   482	    &store_dat_files_acc_steps();
   483	    &check_if_step_OK();
   484	    print FILE_MOVES "$STEP6\tshooting($TPS{SHOOTING}{TYPE})\taccepted\t$this_step_ess_path\n";
   485	    #storing direction is already correct
   486	}
   487	else 
   488	{ 
   489	    $STORED = 0;
   490	    
   491	    &store_dat_files_all_steps();
   492	    &store_rejected();
   493	
   494	    print " --> trial files are going to be removed:\n";
   495	    my $parf = $OPATH{PAR}.&numtostr($STEP,6).".par"; 
   496	    print "--> remove $parf"; `rm $parf`;
   497	    my $trrf = $OPATH{TRR}.&numtostr($STEP,6).".trr"; 
   498	    print "--> remove $trrf"; `rm $trrf`;
   499	    my $zosf = $OPATH{ZOS}.&numtostr($STEP,6).".zos";
   500	    print "--> remove $zosf"; `rm $zosf`;
   501	    `rm $PATH{CURR_GROS}/*`;
   502	
   503	    print FILE_MOVES "$STEP6\tshooting($TPS{SHOOTING}{TYPE})\trejected\t$this_step_ess_path\n";
   504	    
   505	}
   506	
   507	#----------------------------------------------------------------------------------------------------------------------------
   508	
   509	goto BEG ;

Goes back to line 280

   510	FIN: exit;

   511	##############################################################################
   512	#                                                                            #
   513	#                     END of Main LOOP                                       #
   514	#                                                                            #
   515	##############################################################################
   516	

SUB ROUTINES:

   517	
   518	sub B() # frame \@lambda
   519	{
   520	    #with this function we can bias the initial frames towards the interface
   521	
   522	    my $frame = shift;
   523	    my $ref = shift;
   524	    my @lambda = @{$ref};
   525	
   526	    my $L       = @lambda + 0; 
   527	    
   528	    #if bias type is  uniform B is just 1 - all initial frames are equally probable
   529	    return 1.0 if $TPS{BIAS}{TYPE} =~ /UNIFORM/;  #any frame will be picked with the same probability
   530	    
   531	    #gaussian case
   532	    if( $TPS{BIAS}{TYPE} =~ /GAUSSIAN/ )
   533	    {
   534		return &W($lambda[$frame]) / &SW(\@lambda);	
   535	    }
   536	}
   537	
   538	sub W() # $lambda
   539	{
   540	    if( $TPS{BIAS}{TYPE} =~ /UNIFORM/ ) { return 1 }  #each frame has weight 1 
   541	
   542	    if($TPS{BIAS}{TYPE} =~ /GAUSSIAN/ )
   543	    {
   544		my $lambda = shift;
   545		return exp(-($lambda-$BIAS{MAXAT})**2/(2*$BIAS{SIGMA}**2));
   546	    }
   547	}
   548	
   549	sub SW() #\@lambda
   550	{
   551	    my $ref = shift;
   552	    my @lambda = @{$ref};
   553	    my $sum = 0;
   554	    for(my $i=0; $i<@lambda; $i++)
   555	    {
   556		$sum += &W($lambda[$i]);
   557	    }
   558	    return $sum;  #the sum of weights will be N for the uniform case 
   559	}
   560	
   561	
   562	
   563	sub _reverse_gro_files_in_PREV()
   564	{
   565	    print RED, "\n>>>>_reverse_gro_files_in_PREV: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
   566	    #reverse numbers and b<->f
   567	    print "REVERSING INPUT GROS AS WILL BE SHOOTING FROM REVERSED TRR\n";
   568	    chdir $PATH{PREV_GROS};
   569	    mkdir "tmp";
   570	    my @b_gros = split "\n", `ls -1 b*  | grep gro`; chomp @b_gros;
   571	    my @f_gros = split "\n", `ls -1 f*  | grep gro`; chomp @b_gros;
   572	    my @gros   = split "\n", `ls -1     | grep gro`;   chomp @gros; 
   573	 
   574	    for(my $i=0; $i<@gros; $i++) {`mv $PATH{PREV_GROS}$gros[$i] $PATH{PREV_GROS}tmp/`}
   575	    
   576	    my %bf =  ( "b" => "f", "f" => "b" );
   577	    for(my $i=0; $i<@gros; $i++)
   578	    {
   579		$gros[$i] =~ /(b|f)(\d+)\.gro/;
   580		my $new6    = &numtostr(@gros-$2-1,6);
   581		my $new_gro = "$bf{$1}$new6.gro";
   582	#	print "tmp/$gros[$i] ---> $new_gro\n";
   583		`mv $PATH{PREV_GROS}tmp/$gros[$i] $PATH{PREV_GROS}$new_gro`;	
   584	    }
   585	    `rm -r tmp`;
   586	
   587	    #reverse velocities 
   588	    my @gros   = split "\n", `ls -1     | grep gro`;   chomp @gros;
   589	    for(my $g=0; $g<@gros; $g++)
   590	    {
   591	#	print "rev vel $gros[$g]\n";
   592	#NDEC16 `$SCRIPT{REV_GRO} -prec 16 -gro $gros[$g]`;	
   593		`$SCRIPT{REV_GRO} -prec $GRO_PREC -gro $gros[$g]`;	
   594		die "rev_$gros[$g] doesn't exist! problem with reversing gro file in $PATH{PREV_GROS}"
   595		    if !-e "rev_$gros[$g]";
   596		`mv rev_$gros[$g] $gros[$g]`;
   597	    }
   598	   
   599	    print RED, "\n>>>>_reverse_gro_files_in_PREV: END (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
   600	}
   601	


   616	
   617	
   618	
   619	#function that says what is and what is not accepted for storage
   620	sub ACCEPTED()  #parf nmax
   621	{
   622	    print RED "ACCEPTANCE";
   623	    print RESET;
   624	    print "\n";
   625	    my $parf = shift;
   626	    my $sw_max  = shift;
   627	
   628	    return "file" if !-e $parf;
   629	    #my $n_ = `wc -l $parf | awk \'\{print \$1\}\'`; 
   630	    my $awk_col = $BIAS{PAR} + 1;
   631	    my @lambda = split "\n", `awk \'{print \$$awk_col}\' $parf`;
   632	    chomp @lambda; shift @lambda;
   633	    my $sw = &SW(\@lambda);
   634	    return "nmax exceeded" if $sw > $sw_max;
   635	    
   636	    
   637	    #we need both signs the same for esspth (we dont care about times here)
   638	    my $path = &get_par_path($parf,\%PARAM,"->");
   639	    
   640	
   641	    my $spath = ($path=~/\[(.*)\]/g)[0];
   642	    print "NEW PATHWAY : $spath\n";
   643	    
   644	    my $ess_path = &get_essential_path($spath, \@RECROSSING_RULES, \%STATE);
   645	    print "ESSENTIAL   : $ess_path\n";
   646	
   647	    #TEST THE PATHWAY AGAINST THE ENSEMBLE RULES
   648	    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   649	    if($TPS{SHOOTING}{TYPE}=~/2WAY/) 
   650	    {
   651		#add rules here 
   652		print "CHECKING $ess_path WITH ALL COMBINATIONS OF BEG/END ANCHORS:\n";
   653		for(my $i=0; $i<@ANCHOR_END; $i++)
   654		{	    
   655		   
   656		    if ( $ess_path=~/$ANCHOR_END[$i]$/ )
   657		    {
   658			for(my $j=0; $j<@ANCHOR_BEG; $j++)
   659			{	    
   660			    print "---> {$ANCHOR_END[$i] + $ANCHOR_BEG[$j]} ";
   661			    if ( $ess_path=~/^$ANCHOR_BEG[$j]/ )
   662			    { 
   663				print "YES\n"; 
   664				return "forwback"; 
   665			    }	
   666			    print "NO\n";
   667			}
   668			
   669			
   670		    }
   671		    
   672		    
   673		}
   674		return ""; #if both dont fullfill rules - step will be rejected
   675	    }
   676	    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   677	    if($TPS{SHOOTING}{TYPE}=~/1WAY/ && $INIT_FORW_BACK==1 ) #one way shooting, forward
   678	    {
   679		print "CHECKING $ess_path WITH END ANCHORS:\n";
   680		for(my $i=0; $i<@ANCHOR_END; $i++)
   681		{	    
   682		    print "---> {$ANCHOR_END[$i]} ";
   683		    if ( $ess_path=~/$ANCHOR_END[$i]$/ ){ print "YES\n";  return "forw";}
   684		    print "NO\n";
   685		}
   686	    } 
   687	    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   688	    if($TPS{SHOOTING}{TYPE}=~/1WAY/ && $INIT_FORW_BACK==0 ) #one way shooting, backward
   689	    {
   690		print "CHECKING $ess_path WITH BEG ANCHORS:\n";
   691		for(my $i=0; $i<@ANCHOR_BEG; $i++)
   692		{
   693		    print "---> {$ANCHOR_BEG[$i]} ";
   694		    if ( $ess_path=~/^$ANCHOR_BEG[$i]/ ){ print "YES\n";  return "back"; }	
   695		    print "NO\n";
   696		}
   697	    }
   698	    #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   699	    return "";
   700	}
   701	
   702	sub FR_CURR()
   703	{
   704	    print "FR_CURR: ";
   705	    print "[ $TPS{SHOOTING}{TYPE} ] ";
   706	    
   707	    my $fr_curr = 0;
   708	    my $pstep6  = &numtostr($STEP-1,6);
   709	    
   710	    #load lambdas for previous and current trajectories################################## 
   711	    my $awk_col = $BIAS{PAR} + 1;
   712	    my @lambda_prev = split "\n", `awk \'{print \$$awk_col}\' $OPATH{PAR}$pstep6.par`;
   713	    chomp @lambda_prev; shift @lambda_prev;
   714	    my @lambda_curr_forw = split "\n", `awk \'{print \$$awk_col}\' $OPATH{PAR}/$STEP.forw`;
   715	    chomp @lambda_curr_forw; shift @lambda_curr_forw;
   716	    my @lambda_curr_back = split "\n", `awk \'{print \$$awk_col}\' $OPATH{PAR}/$STEP.back`;
   717	    chomp @lambda_curr_back; shift @lambda_curr_back;
   718	        
   719	    #we need to split @lambda_prev in two arrays -> before and after CUT_G. 
   720	    #CUT_G itself will be counted in STEP.forw or STEP.back so we dont include it 
   721	    my @lambda_prev_a = @lambda_prev[0 .. ($CUT_G-1)] ;
   722	    my @lambda_prev_b = @lambda_prev[($CUT_G+1) .. $#lambda_prev] ;
   723	
   724	    if( $TPS{SHOOTING}{TYPE} =~ /1WAY/)
   725	    {
   726		if($INIT_FORW_BACK == 1 ) #than we were shooting forward
   727		{
   728		    my $fr_old = scalar( @lambda_prev_a    );
   729		    my $fr_new = scalar( @lambda_curr_forw ); 
   730		    $fr_curr   = $fr_old + $fr_new;
   731		    print "[new sum: $fr_old + $fr_new (->) = $fr_curr]\n";
   732		    return $fr_curr;
   733		}
   734		
   735		if($INIT_FORW_BACK == 0 ) #than we were shooting backward
   736		{
   737		    my $fr_old = scalar( @lambda_prev_b    );
   738		    my $fr_new = scalar( @lambda_curr_back ); 
   739		    $fr_curr   = $fr_old + $fr_new;
   740		    print "[new sum: (<-) $fr_new + $fr_old = $fr_curr]\n";
   741		    return $fr_curr;
   742		}
   743	    }
   744	
   745	    if( $TPS{SHOOTING}{TYPE} =~ /2WAY/)
   746	    {
   747		my $fr_forw = scalar( @lambda_curr_forw ); 
   748		my $fr_back = scalar( @lambda_curr_back ); 
   749		$fr_curr = $fr_forw + $fr_back;
   750		print "[new sum: (<-) $fr_back + $fr_forw (->) = $fr_curr]\n";
   751		return $fr_curr;
   752	    }
   753	}
   754	
   755	
   756	
   757	sub SW_CURR()
   758	{
   759	    print "SW_CURR: ";
   760	    print "[ $TPS{SHOOTING}{TYPE} ] ";
   761	    
   762	    my $sw_curr = 0;
   763	    my $pstep6  = &numtostr($STEP-1,6);
   764	    
   765	    #load lambdas for previous and current trajectories################################## 
   766	    my $awk_col = $BIAS{PAR} + 1;
   767	    my @lambda_prev = split "\n", `awk \'{print \$$awk_col}\' $OPATH{PAR}$pstep6.par`;
   768	    chomp @lambda_prev; shift @lambda_prev;
   769	    my @lambda_curr_forw = split "\n", `awk \'{print \$$awk_col}\' $OPATH{PAR}/$STEP.forw`;
   770	    chomp @lambda_curr_forw; shift @lambda_curr_forw;
   771	    my @lambda_curr_back = split "\n", `awk \'{print \$$awk_col}\' $OPATH{PAR}/$STEP.back`;
   772	    chomp @lambda_curr_back; shift @lambda_curr_back;
   773	        
   774	    #we need to split @lambda_prev in two arrays -> before and after CUT_G. 
   775	    #CUT_G itself will be counted in STEP.forw or STEP.back so we dont include it 
   776	    my @lambda_prev_a = @lambda_prev[0 .. ($CUT_G-1)] ;
   777	    my @lambda_prev_b = @lambda_prev[($CUT_G+1) .. $#lambda_prev] ;
   778	
   779	    if( $TPS{SHOOTING}{TYPE} =~ /1WAY/)
   780	    {
   781		if($INIT_FORW_BACK == 1 ) #than we were shooting forward
   782		{
   783		    my $sw_old = sprintf "%.2f", &SW(\@lambda_prev_a);
   784		    my $sw_new = sprintf "%.2f", &SW(\@lambda_curr_forw); 
   785		    $sw_curr   = sprintf "%.2f", $sw_old + $sw_new;
   786	#	    print "[frames:  ".(@lambda_prev_a+0)." + ".(@lambda_curr_forw+0)."] ";
   787		    print "[new sum: $sw_old + $sw_new (->) = $sw_curr]\n";
   788		    return $sw_curr;
   789		}
   790		
   791		if($INIT_FORW_BACK == 0 ) #than we were shooting backward
   792		{
   793		    my $sw_old = sprintf "%.2f", &SW(\@lambda_prev_b);
   794		    my $sw_new = sprintf "%.2f", &SW(\@lambda_curr_back); 
   795		    $sw_curr   = sprintf "%.2f", $sw_old + $sw_new;
   796	#	    print "[frames:  ".(@lambda_curr_back+0)." + ".(@lambda_prev_b+0)."] ";
   797		    print "[new sum: (<-) $sw_new + $sw_old = $sw_curr]\n";
   798		    return $sw_curr;
   799		}
   800	    }
   801	
   802	    if( $TPS{SHOOTING}{TYPE} =~ /2WAY/)
   803	    {
   804		my $sw_forw = sprintf "%.2f", &SW(\@lambda_curr_forw); 
   805		my $sw_back = sprintf "%.2f", &SW(\@lambda_curr_back); 
   806		$sw_curr = sprintf "%.2f", $sw_forw + $sw_back;
   807	#	print "[frames:  ".(@lambda_curr_back+0)." + ".(@lambda_curr_forw+0)."] ";
   808		print "[new sum: (<-) $sw_back + $sw_forw (->) = $sw_curr]\n";
   809		return $sw_curr;
   810	    }
   811	
   812	}
   813	
   814	#function giving length of pathway that would be created if glued with old one
   815	sub CURRENT_LENGTH()
   816	{
   817	    
   818	    print ">>CURRENT_LENGTH:";
   819	    if( $TPS{SHOOTING}{TYPE} =~ /1WAY/)
   820	    {
   821		if($INIT_FORW_BACK == 1 ) #than we were shooting forward
   822		{
   823		    my $new_frames = &get_numof_frames("$PATH{TPSRUNF}run.trr");
   824		    print "[new=$new_frames]";
   825		    print "[shoot_point=$CUT_G]";
   826		    print "[curr_len=".($new_frames + $CUT_G)."]\n";
   827		    return $new_frames + $CUT_G;
   828		}
   829		
   830		if($INIT_FORW_BACK == 0 ) #than we were shooting backward
   831		{
   832		    my $new_frames = &get_numof_frames("$PATH{TPSRUNB}run.trr");
   833		    print "[new=$new_frames]";
   834		    my $prev_par = $OPATH{PAR}.&numtostr($STEP-1,6).".par";
   835		    my $prev_traj_length = `wc -l $prev_par | awk \'{print \$1}\'`;
   836		    chomp $prev_traj_length;
   837		    $prev_traj_length--; #header
   838		    print "[prev_path_len=$prev_traj_length]";
   839		    print "[shoot_point=$CUT_G]";
   840		    print "[curr_len=".($new_frames + ( $prev_traj_length - $CUT_G))."]\n";
   841		    return $new_frames + ( $prev_traj_length - $CUT_G);
   842		}
   843	    }
   844	    
   845	    if( $TPS{SHOOTING}{TYPE} =~ /2WAY/)
   846	    {
   847		my $new_fframes = &get_numof_frames("$PATH{TPSRUNF}run.trr");
   848		my $new_bframes = &get_numof_frames("$PATH{TPSRUNB}run.trr");
   849		print "[new_forw=$new_fframes][new_back=$new_bframes]";
   850		print "[shoot_point=$CUT_G]";
   851		print "[curr_len=".($new_fframes + $new_bframes)."]\n";
   852		return $new_fframes + $new_bframes;
   853	    }
   854	
   855	    return -1;
   856	}
   857	
   858	
   859	
   860	
   861	
   862	############################################################
   863	############################################################
   864	
   865	sub write_step_summary() #parf
   866	{
   867	    my $parf = shift;
   868	    my $this_step_path = ( &get_par_path($parf,\%PARAM) =~ /\[(.+)\]/g )[0];
   869	    my $this_step_ess_path = &get_essential_path($this_step_path,\@RECROSSING_RULES);
   870	    
   871	    print RED, "\n>>>>write_step_summary: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
   872	    if( !-e $FILE{STEP_SUMUP} )
   873	    {
   874		open SUMF, ">>$FILE{STEP_SUMUP}";
   875		printf SUMF "%-7s","STEP"; 
   876		printf SUMF "%-9s","SWMAX"; 
   877		printf SUMF "%-10s","SHOOTP"; 
   878		printf SUMF "%-10s","SHTYPE";
   879		printf SUMF "%-5s%-5s%-5s%-5s","RUNF","RUNB","ACCF","ACCB";
   880		printf SUMF "%-7s","LENTRR";  
   881		printf SUMF "%-15s","PATH ";
   882	#	printf SUMF "%-20s","TRTIMES";
   883		printf SUMF "\n";
   884		close SUMF;
   885	    }
   886	    open SUMF, ">>$FILE{STEP_SUMUP}";
   887	    
   888	    my $accf = $ACCEPTED =~/forw/ ? 1 : 0;
   889	    my $accb = $ACCEPTED =~/back/ ? 1 : 0;
   890	    my $runf = $INIT_FORW_BACK==1 ? 1 : 0;
   891	    my $runb = $INIT_FORW_BACK==1 ? 0 : 1;
   892	    if ($TPS{SHOOTING}{TYPE}=~/2WAY/) {$runf=1; $runb=1;}
   893	
   894	 #   my $state_str = &get_state_str($FILE{XYB},$FILE{XYF},\%PARAM);
   895	 #   $state_str =~ /(\[.*\])\s+(\{.*\})/;
   896	 #   my $path = $1;
   897	 #   my $times = $2;
   898	
   899	    my $step6 = &numtostr($STEP,6);
   900	    my $pathl = (`wc -l $parf`=~ /(\d+)/g )[0];
   901	    
   902	 
   903	    printf SUMF "%-7s",$step6;
   904	    printf SUMF "%-9.2f", $SW_MAX; 
   905	    printf SUMF "%-10d",$CUT_G; 
   906	    printf SUMF "%-10s",$TPS{SHOOTING}{TYPE}; 
   907	    printf SUMF "%-5d%-5d%-5d%-5d",$runf,$runb,$accf,$accb;
   908	    printf SUMF "%-7s",$pathl;
   909	    printf SUMF "%-15s",$this_step_ess_path." ";
   910	    
   911	 #  printf SUMF "%-20s",$times;
   912	    printf SUMF "\n";
   913	    close SUMF;
   914	    print RED, "\n>>>>write_step_summary: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
   915	}
   916	
   917	


   935	


   971	
   972	sub check_if_step_OK()
   973	{
   974	    print RED, "\n>>>>check_if_step_OK: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
   975	    return if $STORED==0; 
   976	    #check wether all files that should be there - are there
   977	    die "file $FILE{XYB} doesn't exist. check FAILED." if !-e $FILE{XYB};
   978	    die "file $FILE{XYF} doesn't exist. check FAILED." if !-e $FILE{XYF};
   979	
   980	    my $STEP6 = &numtostr($STEP,6);
   981	    my $trr = "$OPATH{TRR}$STEP6.trr";
   982	    die "file $trr doesn't exist. check FAILED." if !-e $trr;
   983	    print "done\n";
   984	    print RED, ">>>>check_if_step_OK: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
   985	  
   986	}
   987	
   988	sub store_rejected()
   989	{
   990	    print RED, "\n>>>>~sr~store_rejected: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
   991	    my $step6 = &numtostr($STEP,6);
   992	    my $step = $STEP+0;     
   993	    #concatenated files are needed in case of 2way shooting 
   994	    my $parf = $OPATH{PAR}.&numtostr($STEP,6).".par";  #concatenated par 
   995	    my $trrf = $OPATH{TRR}.&numtostr($STEP,6).".trr";  #concatenated trr 
   996	
   997	    #get the amount of already stored steps
   998	    my $n = `ls -1 $OPATH{REJ} | grep $step6 | grep xtc | wc -l` + 0;
   999	    my $suffix = chr(ord('a')+$n);
  1000	    
  1001	    if($TPS{SHOOTING}{TYPE}=~/1WAY/)
  1002	    {
  1003		my $exp1 = $INIT_FORW_BACK==1 ? "f" : "b";
  1004		my $exp  = $INIT_FORW_BACK==1 ? "forw" : "back";
  1005	
  1006		#the parfile/xtc names will be:
  1007		my $pname = $step6."_".$suffix."_".$exp1.".par";
  1008		my $xname = $step6."_".$suffix."_".$exp1.".xtc";
  1009	
  1010		#copy the forw/back file respectively 
  1011		if($TPS{STORE}{REJECTED}{PAR}=~/YES/i)
  1012		{
  1013		    system "cp $OPATH{PAR}$step.$exp $OPATH{REJ}$pname";
  1014		    #print "~sr~SOURCE ---> $OPATH{PAR}$step.$exp\n";
  1015		    #print "~sr~DEST -----> $OPATH{REJ}$pname\n";
  1016		    #print "~sr~".join( "|", split("\n", `ls -1 $OPATH{PAR} | grep forw `) )."\n" ;
  1017		    #print "~sr~".join( "|", split("\n", `ls -1 $OPATH{PAR} | grep back `) )."\n" ;
  1018		}
  1019		
  1020		#trjconv to xtc the run file from the correct tps folder 
  1021		if ($TPS{STORE}{REJECTED}{XTC}=~/YES/i) 
  1022		{
  1023		    my $trr = $INIT_FORW_BACK==1 ? "$PATH{TPSRUNF}run.trr" : "$PATH{TPSRUNB}run.trr";
  1024		    system "$PATH{GROMACS}/trjconv -f $trr -o $OPATH{REJ}$xname 1>$OPATH{LOG}trjconv_rej.out 2>$OPATH{LOG}trjconv_rej.err";
  1025		}
  1026		
  1027	    }
  1028	    else
  1029	    {
  1030		if($TPS{SHOOTING}{TYPE}=~/2WAY/) 
  1031		{
  1032		    #the parfile/xtc names will be:
  1033		    my $pname = $step6."_".$suffix."_bf.par";
  1034		    my $xname = $step6."_".$suffix."_bf.xtc";
  1035	
  1036		    #copy the concatenated par file
  1037		    if($TPS{STORE}{REJECTED}{PAR}=~/YES/i)
  1038		    {
  1039			system "cp $parf $OPATH{REJ}$pname";
  1040			print "~sr~error: $parf doesnt exist, storage of rejected unsuccessfull\n";
  1041		    }
  1042	
  1043		    #trjconv to xtc the concatenated trr file
  1044		    if ($TPS{STORE}{REJECTED}{XTC}=~/YES/i) 
  1045		    {
  1046			system "$PATH{GROMACS}/trjconv -f $trrf -o $OPATH{REJ}$xname 1>$OPATH{LOG}trjconv_rej.out 2>$OPATH{LOG}trjconv_rej.err";
  1047			print "~sr~error: $trrf doesnt exist, storage of rejected unsuccessfull\n";
  1048		    }
  1049		}
  1050	    }
  1051	
  1052	    
  1053	    &dvline();
  1054	    print RED, ">>>>~sr~store_rejected: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  1055	}
  1056	
  1057	
  1058	sub store_dat_files_all_steps()
  1059	{
  1060	    print RED, "\n>>>>store_dat_files_all_steps: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  1061	    print "Storing dat files (all steps)... ";
  1062	    my $curr_time = time;
  1063	    my $delta_t = $curr_time - $T_START_CYCLE;
  1064	    my $step6 = &numtostr($STEP,6);
  1065	
  1066	    #writing time.dat = real time sim info##########
  1067	    #mainly for statistics and sim time predistion##
  1068	    #WRITTEN ALWAYS even if NOT ACCEPTED############
  1069	    open  TIMES, ">>$FILE{STAT_TIME}";
  1070	    print TIMES "$step6 $curr_time $delta_t\n";
  1071	    close TIMES;
  1072	
  1073	    #acceptance file : STEP BACC FACC <-str->#########
  1074	    #to calculate rates we need to know how many was##
  1075	    #not accepted ?? #################################
  1076	    #WRITTEN ALWAYS even if NOT ACCEPTED##############
  1077	    open  ACCF, ">>$FILE{STAT_ACC}";
  1078	
  1079	
  1080	    my $facc = $ACCEPTED=~/forw/ ? 1 : 0;
  1081	    my $bacc = $ACCEPTED=~/back/ ? 1 : 0;
  1082	
  1083	    my $state_str = &get_state_str($FILE{XYB},$FILE{XYF},\%PARAM);
  1084	    print ACCF "$step6 $bacc $facc $state_str\n";
  1085	    close ACCF;
  1086	    
  1087	    print "done\n";
  1088	    print RED, ">>>>store_dat_files_all_steps: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  1089	}
  1090	
  1091	sub store_dat_files_acc_steps()
  1092	{ 
  1093	    print RED, "\n>>>>store_dat_files_acc_steps: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  1094	    print "Storing dat files (acc steps)... ";
  1095	    my $step6 = &numtostr($STEP,6);
  1096	    
  1097	    #zos info file -> has to be in accorance with the##
  1098	    #number of trrs and zos files so written only when#
  1099	    #traj accepted#####################################
  1100	    open ZOSINFO, ">>$FILE{ZOSINF}";
  1101	
  1102	    my $facc = $ACCEPTED=~/forw/ ? 1 : 0;
  1103	    my $bacc = $ACCEPTED=~/back/ ? 1 : 0;
  1104	
  1105	    printf ZOSINFO "%s %-5d %d %d\n",$step6,$CUT_G,$bacc,$facc;
  1106	    close ZOSINFO;
  1107	
  1108	    #path file. the final path is stored. shoule be####
  1109	    #A->0->B in TPS or eg A->0->1->0->1->B in TIS######
  1110	    my $path = &get_par_path("$OPATH{PAR}$step6.par",\%PARAM);
  1111	    open PATHF, ">>".$FILE{PARPATH};
  1112	  #  my $pathl = `more $OPATH{PAR}$step6.par | wc -l`;
  1113	    my $pathl = ( `wc -l $OPATH{PAR}$step6.par` =~ /(\d+)/g )[0];
  1114	    $pathl -= 1;
  1115	    print PATHF "$step6  $path $pathl\n";
  1116	    close PATHF; 
  1117	    print "done\n";
  1118	    print RED, ">>>>store_dat_files_acc_steps: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  1119	}
  1120	
  1121	sub move_gro_frames()
  1122	{
  1123	    print RED, "\n>>>>move_gro_frames: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  1124	    #if the results of the previous run were both
  1125	    #wrong, no files were created in the CURR_GROS.
  1126	    #than we should do nothing with temporary gros!
  1127	    
  1128	    if ( $STORED == 0 )
  1129	    {
  1130		print "no frames were moved\n" if $DEBUG_ON;
  1131		return;
  1132	    }
  1133	    
  1134	    #w przeciwnym wypdaku :
  1135	    `rm $PATH{PREV_GROS}* 1>$NULL 2>$NULL`;
  1136	    `mv $PATH{CURR_GROS}*.gro $PATH{PREV_GROS} 1>$NULL 2>$NULL`;
  1137	    `rm $PATH{CURR_GROS}* 1>$NULL 2>$NULL`;
  1138	
  1139	    print RED, "\n>>>>move_gro_frames: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  1140	}
  1141	
  1142	sub store_trr()
  1143	{ 
  1144	    print RED, "\n>>>>store_trr: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  1145	    print RED, "GLUEING AND CONCATENATING\n", RESET;
  1146	    my $last_frame_num;
  1147	    my $b_frames;
  1148	    my $f_frames;
  1149	    print "RES{F}=$RES{F}  RES{B}=$RES{B}\n" if $DEBUG_ON;
  1150	   
  1151	    if(!$STORED) { return; } 
  1152	
  1153	
  1154	    if($ACCEPTED =~ /back/)
  1155	    {
  1156		#new trajectory OK
  1157		#extract gros to $PATH{CURR_GROS}
  1158		print "PREPARING BACKWARD FRAMES\n";
  1159		my $trr = "$PATH{TPSRUNB}run.trr";
  1160		&extract_gros_from_trr($trr,$FILE{TPR},$PATH{CURR_GROS},"btmp");
  1161		
  1162		#change their names#
  1163		my @gros = split /\n/, `ls -1 $PATH{CURR_GROS} | grep gro | grep btmp`;
  1164		chomp @gros;
  1165	#	print join "\n", @gros;
  1166	#	print "\n--------------------\n";
  1167		for(my $i=0; $i<@gros; $i++)
  1168		{
  1169		    $gros[$i] =~ /(\d+)/;
  1170		    my $num  = $1;
  1171		    #if($num == 0 || $num == @gros-1)	    {
  1172		    # nie usuwamy ostatniej klatki bo to juz zostalo zrobione 
  1173		    # przez truncate_trr_and xys
  1174		    if($num == 0)
  1175		    {
  1176			`rm $PATH{CURR_GROS}$gros[$i]`;
  1177			next;
  1178		    }
  1179		    #cofamy o jeden licznik w dol######
  1180		    my $num_new = $num - 1;
  1181		    `mv $PATH{CURR_GROS}$gros[$i] $PATH{CURR_GROS}b$num_new.gro`;
  1182		}
  1183		
  1184		#reverse order of the files!!!!!!!
  1185		@gros = ();
  1186		@gros = split /\n/, `ls -1 $PATH{CURR_GROS} | grep gro | grep b`;
  1187	#	print "\n".join( "\n", @gros);
  1188	#	print "\n---------------------\n";
  1189		for(my $i = 0; $i<@gros; $i++)
  1190		{
  1191		    $gros[$i] =~ /(\d+)/;
  1192		    my $num  = $1;
  1193		    my $num6 = &numtostr(@gros - 1 - $num,6);
  1194	#	    print "moving --->$PATH{CURR_GROS}$gros[$i]\n";
  1195	#	    print "     to ---> $PATH{CURR_GROS}b$num6.gro\n";
  1196		    `mv $PATH{CURR_GROS}$gros[$i] $PATH{CURR_GROS}b$num6.gro`;
  1197		}
  1198	#	print join "\n", @gros;
  1199	#	print "\n--------------------\n";
  1200	       
  1201		$last_frame_num = @gros - 1;
  1202	    }
  1203	    else
  1204	    {
  1205		print "COPYING BACKWARD FRAMES FROM PREVIOUS TRR\n";
  1206		for(my $i=0; $i<$CUT_G; $i++)
  1207		{
  1208		    my $i6 = &numtostr($i,6);
  1209		    if( -e "$PATH{PREV_GROS}b$i6.gro" || -e "$PATH{PREV_GROS}f$i6.gro" ){  `cp $PATH{PREV_GROS}*$i6.gro $PATH{CURR_GROS}`; }
  1210		    else  
  1211		    {
  1212			print "going to die.$PATH{PREV_GROS} listing:\n".join("",split("\n",`ls -1 $PATH{PREV_GROS}`));
  1213			die "store_trr >>>>> $PATH{PREV_GROS}*$i6.gro DOES NOT EXIST"; 
  1214		    } 
  1215		}
  1216		##print "press sth.."; <STDIN>; #DEBUG
  1217		my @gros = `ls -1 $PATH{CURR_GROS} | grep gro`;
  1218		chomp @gros;
  1219		die "\@gros=".scalar(@gros).", \$CUT_G=$CUT_G \@gros != CUT_G" if @gros != $CUT_G;
  1220		$last_frame_num = @gros - 1;
  1221		
  1222	    }
  1223	  
  1224	    #FORWARD
  1225	    if($ACCEPTED =~ /forw/)
  1226	    {
  1227		#new trajectory OK
  1228		#extract gros to $PATH{CURR_GROS}
  1229		print "PREPARING FORWARD FRAMES\n";
  1230		my $trr = "$PATH{TPSRUNF}run.trr";
  1231		&extract_gros_from_trr($trr,$FILE{TPR},$PATH{CURR_GROS},"tmpf");
  1232		
  1233		#change their names#
  1234		my @gros = split /\n/, `ls -1 $PATH{CURR_GROS} | grep gro | grep tmpf`;
  1235		chomp @gros;
  1236		
  1237		for(my $i=0; $i<@gros; $i++)
  1238		{
  1239		    $gros[$i] =~ /(\d+)/;
  1240		    my $num  = $1;
  1241		    #the sam as upper -> the truncate_trr_and_xys script
  1242		    #already cut the last frame.
  1243	
  1244		    #if($num == @gros-1)	    {
  1245		    #	`rm $PATH{CURR_GROS}$gros[$i]`;
  1246		    #	next;
  1247		    #}
  1248	
  1249		    my $num6 = &numtostr($num+$last_frame_num+1,6);
  1250		    `mv $PATH{CURR_GROS}$gros[$i] $PATH{CURR_GROS}f$num6.gro`;
  1251		
  1252		}
  1253		##print "press sth.."; <STDIN>; #DEBUG
  1254	    }
  1255	    else
  1256	    {
  1257		#copy old trajectory#
  1258		my @gros = ();
  1259		my @pgros = split /\n/,  `ls -1 $PATH{PREV_GROS} | grep gro`;
  1260		print "COPYING FORWARD FRAMES FROM PREVIOUS TRR\n";
  1261		for(my $i=0; $i<@pgros; $i++)
  1262		{
  1263		    $pgros[$i] =~ /(\d+)/;
  1264		    my $pnum = $1;
  1265		    next if($pnum < $CUT_G);
  1266		    my $i6 = &numtostr($pnum,6);
  1267		    `cp $PATH{PREV_GROS}$pgros[$i] $PATH{CURR_GROS}prev_$pgros[$i]`;
  1268		    push @gros, "prev_".$pgros[$i];
  1269		}
  1270		
  1271		#the gros are sorted...
  1272		for(my $i=0; $i<@gros; $i++)
  1273		{
  1274		    $gros[$i] =~ /prev_(b|f)(\d+)/;
  1275		    my $nnum  = $last_frame_num + 1 + $i;
  1276		    my $nnum6 = &numtostr($nnum,6);
  1277		     `mv $PATH{CURR_GROS}$gros[$i] $PATH{CURR_GROS}$1$nnum6.gro`;	    
  1278		   
  1279		}
  1280	      
  1281	    }
  1282	    
  1283	    ###########################################################
  1284	    my $step6 = &numtostr( $STEP, 6);
  1285	    &concat_GROS_as("$OPATH{TRR}$step6.trr");
  1286	    
  1287	    ###########################################################
  1288	    #make zos file 
  1289	    my $b_frames = `ls -1 $PATH{CURR_GROS} | grep gro | grep b | wc -l`+0;
  1290	    my $f_frames = `ls -1 $PATH{CURR_GROS} | grep gro | grep f | wc -l`+0;
  1291	    
  1292	    print "SUMMARY: b_frames = $b_frames   f_frames = $f_frames\n";
  1293	
  1294	    my $zos = "$OPATH{ZOS}$step6.zos";
  1295	    &make_zos_file($zos,$b_frames,$f_frames);
  1296	    
  1297	    
  1298	    ##print "press sth.."; <STDIN>; #DEBUG
  1299	    #copy edr files, even if one of them might not be used...
  1300	    print "STORING EDR FILES\n";
  1301	    my $fedr = "$OPATH{EDR}$step6"."f.edr";
  1302	    my $bedr = "$OPATH{EDR}$step6"."b.edr";
  1303	    `cp $PATH{TPSRUNF}run.edr $fedr` if -e "$PATH{TPSRUNF}run.edr";
  1304	    `cp $PATH{TPSRUNB}run.edr $bedr` if -e "$PATH{TPSRUNB}run.edr";
  1305	    print RED, ">>>>store_trr: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  1306	}
  1307	
  1308	
  1309	#######################################################################
  1310	#######################################################################
  1311	sub concat_GROS_as() #output_trr_file_name
  1312	{
  1313	    print RED, "\n>>>>concat_GROS_as: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  1314	    my $out_trr = shift;
  1315	    #print "error output trr already exists (concat_GROS_as)\n ";
  1316	    #print "changing output name --> _$out_trr\n";
  1317	
  1318	    #at this moment one only has to glue the gro files together
  1319	    
  1320	    my @allgros = `ls -1 $PATH{CURR_GROS} | grep gro`;
  1321	    chomp @allgros;
  1322	
  1323	
  1324	    #BOX_SIZE################################
  1325	    if($CHANGE_BOX_SIZE_FLAG)
  1326	    {
  1327		for(my $gi = 0; $gi < @allgros; $gi++)
  1328		{
  1329		    &ChangeBoxSize($allgros[$gi]);
  1330		}
  1331	    }
  1332	    ########################################

This is the first call; there are two more later on.

  2416	sub ChangeBoxSize() #grofile
  2417	{
  2418	    print RED, ">>>>ChangeBoxSize: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  2419	    #read gro file###############
  2420	    my $grof = shift;
  2421	    return if !-e $grof;
  2422	    #CHANGE SIZE OF THE BOX########################################
  2423	    open GROF, "$grof";   
  2424	    my @GROA = <GROF>;
  2425	    close GROF;
  2426	    $GROA[-1]="5.03711   5.03711   3.56177   0.00000   0.00000   0.00000   0.00000   2.51855   2.51855\n";
  2427	    open GROF, ">$grof"; 
  2428	    print GROF join("",@GROA);
  2429	    close GROF;
  2430	    ##############################################################
  2431	    print RED, ">>>>ChangeBoxSize: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  2432	}

  1333	
  1334	
  1335	    my $times = "$PATH{CURR_GROS}times";
  1336	    
  1337	    my $count = 0;
  1338	    my $delta = 100;
  1339	
  1340	    print "CONCATENATION: ";
  1341	    do{
  1342	        #write times files
  1343		open TIMES, ">$times";
  1344		print TIMES "0\n" if -e $out_trr;
  1345		for(my $i=$count; $i<$count+$delta; $i++) {
  1346		    if( $i == @allgros ) { $delta = $i - $count;  last}
  1347		    print TIMES ($i*$TRR_STEP)."\n" }
  1348		close TIMES;
  1349	
  1350	        #prepare list of files
  1351	        my $list =  join( " ", map { "$PATH{CURR_GROS}$_" } @allgros[ $count .. ($count + $delta - 1) ] );
  1352	        $list = $out_trr." ".$list if -e $out_trr;
  1353	
  1354		my $input = "-f $list -settime";
  1355	        my $output = "-o $out_trr";
  1356	        my $stream = "1>/dev/null 2>/dev/null";
  1357	
  1358		#&dvline("command");
  1359	        #print &trjcat("$input $output $stream")." < $times \n";
  1360		print "$count ";
  1361	        system "$PATH{GROMACS}/trjcat $input $output $stream"." < $times";
  1362	        
  1363	        $count += $delta;
  1364	    }while($count < @allgros);
  1365	    print "\n";
  1366	    print RED, ">>>>concat_GROS_as: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  1367	    
  1368	}
  1369	#######################################################################
  1370	#######################################################################
  1371	


  1434	
  1435	##########################################################################


  1586	
  1587	##########################################################################
  1588	sub reverse_gro() #tmp dir, gro file
  1589	{
  1590	    print RED, "\n>>>>reverse_gro: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  1591	    print "[ reversing gro ";
  1592	    my %TMP; $TMP{0} = $_[0];
  1593	    chdir $TMP{0};
  1594	    my $gro = $_[1];
  1595	    
  1596	    #copy and modify mdp#
  1597	    my $mdp = "$TMP{0}mdout.mdp";
  1598	    `cp $FILE{MDP} $mdp`;   
  1599	    
  1600	    my $res; 
  1601	    $res=&set_mdp_value($mdp,"nsteps",1);
  1602	    die "problem with setting nsteps in $mdp when reversing" if $res<0;
  1603	    $res=&set_mdp_value($mdp,"nstxout",1);
  1604	    die "problem with setting nstxout in $mdp when reversing" if $res<0;
  1605	    $res=&set_mdp_value($mdp,"nstvout",1);
  1606	    die "problem with setting nstvout in $mdp when reversing" if $res<0;
  1607	    $res=&set_mdp_value($mdp,"gen_vel","no");
  1608	    die "problem with setting gen_vel in $mdp when reversing" if $res<0;
  1609	    $res=&set_mdp_value($mdp,"gen_seed","0");
  1610	    die "problem with setting gen_seed in $mdp when reversing" if $res<0;
  1611	#    $res=&set_mdp_value($mdp,"comm-mode","None");
  1612	#    die "problem with setting comm-mode in $mdp when reversing" if $res<0;
  1613	    $res=&set_mdp_value($mdp,"tcoupl","no");
  1614	
  1615	    $res=&set_mdp_value($mdp,"tau_t","0.2 0.2");
  1616	    die "problem with setting tau_t in $mdp when reversing" if $res<0;
  1617	    
  1618	    if( $res<0)
  1619	    {
  1620		$res=&set_mdp_value($mdp,"Tcoupl","no");
  1621		die "problem with setting tcoupl in $mdp when reversing" if $res<0;
  1622	    }
  1623	    $res=&set_mdp_value($mdp,"pcoupl","no");
  1624	    if( $res <0 )
  1625	    {
  1626		$res=&set_mdp_value($mdp,"Pcoupl","no");
  1627		die "problem with setting pcoupl in $mdp when reversing" if $res<0;
  1628	    }
  1629	    
  1630	    
  1631	    my $dt = &get_mdp_value($mdp,"dt");
  1632	
  1633	    
  1634	    #grompping###########
  1635	    print "grompp ";
  1636	    my $tpr    = "$TMP{0}run1.tpr"; 
  1637	    my $input  = "-f $mdp -c $gro -p $FILE{TOP}";
  1638	    my $output = "-o $tpr";
  1639	    my $stream = "1>$TMP{0}grompp.out 2>$TMP{0}grompp.err";
  1640	    system "$PATH{GROMACS}/grompp $input $output $stream";
  1641	    die "failed to create rev_gro in $TMP{0}, step1" if ! -e $tpr;
  1642	
  1643	    
  1644	
  1645	    #mdrunning###########
  1646	    print "mdrun ";
  1647	    my $trr = "$TMP{0}run1.trr";
  1648	    $input  = "-s $tpr";
  1649	    $output = "-o $trr -c $TMP{0}after_run1.gro";
  1650	    $stream = "1>$TMP{0}mdrun.out 2>$TMP{0}mdrun.err";
  1651	    system "$FILE{MDRUN_STANDARD} $input $output $stream";
  1652	    die "failed to create rev_gro in $TMP{0}, step2 \nCOMMAND ---> ".("$FILE{MDRUN_STANDARD} $input $output $stream") if ! -e $trr;
  1653	
  1654	    #get the frame in 16dig prec
  1655	    print "extract ";
  1656	    my $gro1 = "$TMP{0}start1.gro";
  1657	#NDEC16    $input  = "-s $tpr -f $trr -b $dt -e $dt -ndec 16";
  1658	    $input  = "-s $tpr -f $trr -b $dt -e $dt -ndec $GRO_PREC";
  1659	    $output = "-o $gro1";
  1660	    $stream = "1>$TMP{0}trjconv.out 2>$TMP{0}trjconv.err";
  1661	    system "$PATH{GROMACS}/trjconv $input $output $stream"." <<EOF\n 0\n EOF";
  1662	
  1663	    if( ! -e $gro1 )
  1664	    {
  1665		print "\nfailed to create rev_gro in $TMP{0}, step3\n";
  1666		print "\nCOMMAND ---> "."$PATH{GROMACS}/trjconv $input $output $stream"." <<EOF\n 0\n EOF\n";
  1667		return "ERROR";
  1668	    }
  1669	
  1670	
  1671	    print "combine ";
  1672	#NDEC16    `$SCRIPT{COMB_GRO} -prec 16 -grox $gro -grov $gro1`;
  1673	    `$SCRIPT{COMB_GRO} -prec $GRO_PREC -grox $gro -grov $gro1`;
  1674	    die "failed to create rev_gro in $TMP{0}, step4" 
  1675		if ! -e "$TMP{0}comb.gro";
  1676	    
  1677	    print "velrev ";
  1678	#NDEC16    `$SCRIPT{REV_GRO} -prec 16 -gro comb.gro`;
  1679	    `$SCRIPT{REV_GRO} -prec $GRO_PREC -gro comb.gro`;
  1680	    die "failed to create back_gro in $TMP{0}, step5" 
  1681		if ! -e "$TMP{0}rev_comb.gro";
  1682	     
  1683	    print "]\n";
  1684	    chdir $PATH{MAIN};
  1685	    print RED, ">>>>reverse_gro: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  1686	    return "$TMP{0}rev_comb.gro";
  1687	}
  1688	
  1689	sub get_nth_parline()#file, number of line 
  1690	{
  1691	#    print RED, "\n>>>>get_nth_parline: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  1692	    my $pfile = shift;
  1693	    return "" if !-e $pfile;
  1694	    my $pn = shift; 
  1695	    
  1696	    open PFILE, $pfile;
  1697	    my @pfile = <PFILE>;
  1698	    chomp @pfile;
  1699	    close PFILE;
  1700	    
  1701	    shift @pfile; #get rid of the header!
  1702	    my $pline = $pfile[$pn];
  1703	    @pfile=();
  1704	#    print RED, ">>>>get_nth_parline: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  1705	    return $pline;
  1706	}
  1707	
  1708	



  1709	#this works only if we do not reverse :/ ERROR
  1710	sub prepare_gro_files()
  1711	{
  1712	    print BLUE, "\n>>>>>>>>>>>>>>>> prepare_gro_files: BEGIN <<<<<<<<<<<<<<<<<\n", RESET if $DEBUG_ON;    
  1713	    print "PICKING INITIAL FRAME\n";

This is absurd! This tag is jumped to from another function!!

  1714	  prepare_gro_BEG:
  1715	    
  1716	    my %TMP; $TMP{0} = &make_temp_dir_in($PATH{TEMP});       
  1717	                                                        
  1718	    my $pstep6 = &numtostr($STEP-1,6);                  
  1719	    #read corresponding zos-file#######################################################
  1720	#    my $zosln = `head -n1 $OPATH{ZOS}$pstep6.zos`;             

  1721	    my @zos = &_get_zos_array_from_PREV();
   602	sub _get_zos_array_from_PREV() # 
   603	{
   604	    print RED, "\n>>>>get_zos_from_PREV: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
   605	    
   606	    my $b_frames = `ls -1 $PATH{PREV_GROS} | grep gro | grep b | wc -l`;
   607	    my $f_frames = `ls -1 $PATH{PREV_GROS} | grep gro | grep f | wc -l`;
   608	    chomp $b_frames; chomp $f_frames;
   609	    print "frames in PREV_GROS: b_frames = $b_frames  f_frames = $f_frames\n" if $DEBUG_ON;
   610	    my @zos;
   611	    for(my $i=0; $i<$b_frames; $i++) {push @zos, 0}
   612	    for(my $i=0; $i<$f_frames; $i++) {push @zos, 1}
   613	    print RED, "\n>>>>get_zos_from_PREV: END (DEBUG) <<<<<<<<<<\n", RESET if $DEBUG_ON;
   614	    return @zos;
   615	}

  1722	
  1723	    die "input trajectory too short" if @zos<10;
  1724	    print "zos from PREV_GROS --> ".join("",@zos)."\n" if $DEBUG_ON;
  1725	
  1726	    #choose gro from the trr###########################################################
  1727	    my $parpath = &get_par_path("$OPATH{PAR}$pstep6.par",\%PARAM);
  1728	    my $states_str = ($parpath=~/(\[.*\])/g)[0];
  1729	    my $times_str  =  ($parpath=~/(\{.*\})/g)[0];
  1730	    print $states_str."\n".$times_str."\n";
  1731	    my ($T1, $T2) = split /\s+/, &get_anchor_times($parpath,\@ANCHOR_BEG, \@ANCHOR_END);
  1732	    print "transition interval = ($T1,$T2)\n";
  1733	
  1734	       
  1735	    my $pacc;
  1736	    my $rand;
  1737	    my ($g, $gstate, $gtime);
  1738	    my $awk_col = $BIAS{PAR} + 1;
  1739	    my @lambda = split "\n", `awk \'{print \$$awk_col}\' $OPATH{PAR}$pstep6.par`;
  1740	    chomp @lambda; shift @lambda;
  1741	    
  1742	   


  1743	    do{
  1744		#first pick any frame between boundaries in a uniform way
  1745		
  1746		do{
  1747		    my $bndry = int( 0.05 *@zos );
  1748		    $g   = int(rand()*(@zos-$bndry)+0.5*$bndry);
  1749	#	    print "[gro=$g]";
  1750		    my $gline = &get_nth_parline("$OPATH{PAR}$pstep6.par",$g);
  1751		    $gstate = &get_state($gline,\%PARAM);
  1752	#	    print "[state=>$gstate]";
  1753		    $gtime = (split(/\s+/, $gline))[0];
  1754	#    	    print "[time=$gtime]\n";
  1755		}while( &get_state_types($gstate,\%STATE)=~/ini|fin/ );
  1756		
  1757		
  1758		#reject or accept as initial pframe according to Bias B()
  1759	       
  1760		$pacc = &B($g, \@lambda);
  1761		$rand = rand();
  1762	
  1763		if( $rand <= $pacc ) 
  1764		{
  1765		    printf "[trial gro: gro=%3d, time=%.3f, state=%s, lambda=%.2f] ",$g,$gtime,$gstate,$lambda[$g];
  1766		    printf "Pacc=%.4f Rand=%.4f ", $pacc, $rand;
  1767		    printf "ACCEPTED\n";
  1768		}
  1769	#	else {printf "REJECTED\n"}
  1770	
  1771	    }while($rand > $pacc);


  1772	    
  1773	   
  1774	   
  1775	    ###################################################################################
  1776	    
  1777	    $SHOOT_FROM_STATE = $gstate;
  1778	    
  1779	    my $g6  = &numtostr($g,6); 
  1780	    my $gro_name = &bf_01($zos[$g])."$g6.gro";
  1781	    $CUT_G = $g;
  1782	    my $gro = "$PATH{PREV_GROS}$gro_name";
  1783	    print "chosen gro => $gro\n" if $DEBUG_ON;
  1784	    die "this gro file doesn't exist" if !-e $gro;
  1785	       
  1786	    my $g_zo = $zos[$g];
  1787	    print "THIS IS A ".($g_zo==1 ? "FORWARD" : "BACWARD")." FRAME\n";
  1788	
  1789	        
  1790	    #BOX_SIZE#####################################
  1791	    &ChangeBoxSize($gro) if $CHANGE_BOX_SIZE_FLAG;
  1792	    ###############################################
  1793	
  1794	    `cp $gro $TMP{0}`;
  1795	    
  1796	    #always reversing, even if not necessary#######
  1797	    my $revgro = &reverse_gro($TMP{0},"$TMP{0}$gro_name");
  1798	    if( $revgro=~/ERROR/ )
  1799	    {
  1800		`rm -r $TMP{0}`;
  1801		goto prepare_gro_BEG;
  1802	    }
  1803	    
  1804	    #copy files to run_forw/run_back respectively##
  1805	    
  1806	    print "RUN FOLDER INITIATED WITH CHOSEN GRO: ";
  1807	    if($g_zo == 1)
  1808	    {
  1809		print "[gro->forw, revgro->back]\n";
  1810		`cp $gro    $PATH{TPSRUNF}start.gro`;
  1811		`cp $revgro $PATH{TPSRUNB}start.gro`;
  1812	    }
  1813	    if($g_zo == 0)
  1814	    {
  1815		print "[gro->back, revgro->forw]\n";
  1816		`cp $gro    $PATH{TPSRUNB}start.gro`;
  1817		`cp $revgro $PATH{TPSRUNF}start.gro`;
  1818	    }
  1819	   
  1820		
  1821	
  1822	    #clean#########################################
  1823	    `rm -r $TMP{0}`;
  1824	    print BLUE, "\n>>>>>>>>>>>>>>>>>> prepare_gro_files: END <<<<<<<<<<<<<<<<<<\n", RESET if $DEBUG_ON;    
  1825	}


  1826	
  1827	
  1828	sub prepare_gro_files_new()
  1829	{
  1830	
  1831	    my %TMP; $TMP{0} = &make_temp_dir_in($PATH{TEMP});       
  1832	    my $pstep6 = &numtostr($STEP-1,6);               
  1833	
  1834	    my @pgros = `ls -1 $PATH{PREV_GROS} | grep .gro`; chomp @pgros; 
  1835	    die "input trajectory too short" if @pgros<10;
  1836	    my @zos = &_get_zos_array_from_PREV();
   602	sub _get_zos_array_from_PREV() # 
   603	{
   604	    print RED, "\n>>>>get_zos_from_PREV: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
   605	    
   606	    my $b_frames = `ls -1 $PATH{PREV_GROS} | grep gro | grep b | wc -l`;
   607	    my $f_frames = `ls -1 $PATH{PREV_GROS} | grep gro | grep f | wc -l`;
   608	    chomp $b_frames; chomp $f_frames;
   609	    print "frames in PREV_GROS: b_frames = $b_frames  f_frames = $f_frames\n" if $DEBUG_ON;
   610	    my @zos;
   611	    for(my $i=0; $i<$b_frames; $i++) {push @zos, 0}
   612	    for(my $i=0; $i<$f_frames; $i++) {push @zos, 1}
   613	    print RED, "\n>>>>get_zos_from_PREV: END (DEBUG) <<<<<<<<<<\n", RESET if $DEBUG_ON;
   614	    return @zos;
   615	}

  1837	    print "zos from PREV_GROS --> ".join("",@zos)."\n";
  1838	
  1839	    open PAR, "$OPATH{PAR}$pstep6.par";
  1840	    my @par    = <PAR> ; chomp @par; shift @par;
  1841	    close PAR;
  1842	
  1843	    my @orig_par = @par; 
  1844	    
  1845	    my $awk_col = $BIAS{PAR} + 1;
  1846	    my @lambda = split "\n", `awk \'{print \$$awk_col}\' $OPATH{PAR}$pstep6.par`;
  1847	    chomp @lambda; shift @lambda;
  1848	    my $sw = &SW(\@lambda);
  1849	    
  1850	    if( $STORED_TIME_DIRECT == -1 ) #this means gros in prev_gros are reversed comparing to previous step
  1851	    {
  1852		#then we have to revers parameters arrays; 
  1853	     	@par    = reverse @par;
  1854	     	@lambda = reverse @lambda;
  1855	    }
  1856	    
  1857	    my ($g, $gstate, $gtime, $gtimeg, $rand, $pacc);
  1858	    do{
  1859		
  1860		do{
  1861		    my $bndry = int( 0.02 *@pgros );
  1862		    $g   = int(rand()*(@pgros-$bndry)+0.5*$bndry);
  1863		    print "[gro=$g]\n";
  1864		    my $gline = $par[$g];
  1865		    print "[$gline]\n";
  1866		    $gstate = &get_state($gline,\%PARAM);
  1867		    print "[state=>$gstate]\n";
  1868		    $gtime  = (split(/\s+/, $gline))[0];
  1869	#	    $gtimeg = (`head -n1 $PATH{PREV_GROS}/$pgros[$g]`=~/t(\s+)?=(\s+)?([0-9\.]+)/g)[2];
  1870	   	    print "[time from par=$gtime]\n";
  1871	#	    print "[time from gro=$gtimeg]\n";
  1872	#	    die "problems with reversal time from par!=time from gro" if $gtimeg!=$gtime; 
  1873		}while( &get_state_types($gstate,\%STATE)=~/ini|fin/ );
  1874		
  1875		
  1876		#reject or accept as initial pframe according to Bias B()
  1877		$pacc = &B($g, \@lambda);
  1878		$rand = rand()/$sw;
  1879	
  1880		if( $rand <= $pacc ) 
  1881		{
  1882		    printf "[trial gro: gro=%3d, time=%.3f, grotime=%.3f, state=%s, lambda=%.2f] "
  1883			,$g,$gtime,$gtimeg,$gstate,$lambda[$g];
  1884		    printf "Pacc=%.4f Rand=%.4f ", $pacc, $rand;
  1885		    printf "ACCEPTED\n";
  1886		}
  1887	#	else {printf "REJECTED\n"}
  1888	
  1889	    }while($rand > $pacc);
  1890	    $SHOOT_FROM_STATE = $gstate;
  1891	    $CUT_G = $g if $STORED_TIME_DIRECT == 1;
  1892	    $CUT_G = @pgros - $g -1 if $STORED_TIME_DIRECT == -1;
  1893	    
  1894	#    print "orig_par[CUT_G] =  ". $orig_par[$CUT_G]."\n";
  1895	    
  1896	    
  1897	    
  1898	    my $g6  = &numtostr($g,6); 
  1899	    my $gro = "$PATH{PREV_GROS}/$pgros[$g]";
  1900	    my $gro_name = $pgros[$g];
  1901	  
  1902	    print "chosen gro => $gro\n" if $DEBUG_ON;
  1903	    die "this gro file doesn't exist" if !-e $gro;
  1904	    my $g_zo = $zos[$g];
  1905	
  1906	
  1907	    
  1908	    
  1909	    #BOX_SIZE######################################
  1910	    &ChangeBoxSize($gro) if $CHANGE_BOX_SIZE_FLAG;
  1911	    ###############################################
  1912	
  1913	    `cp $gro $TMP{0}`;
  1914	    
  1915	    #always reversing, even if not necessary#######
  1916	    my $revgro = &reverse_gro($TMP{0},"$TMP{0}$gro_name");
  1917	    if( $revgro=~/ERROR/ )
  1918	    {
  1919		`rm -r $TMP{0}`;
  1920		goto prepare_gro_BEG;
  1921	    }
  1922	    
  1923	    #copy files to run_forw/run_back respectively##
  1924	    
  1925	    print "RUN FOLDER INITIATED WITH CHOSEN GRO: ";
  1926	    if($g_zo == 1)
  1927	    {
  1928		print "[gro->forw, revgro->back]\n";
  1929		`cp $gro    $PATH{TPSRUNF}start.gro`;
  1930		`cp $revgro $PATH{TPSRUNB}start.gro`;
  1931	    }
  1932	    if($g_zo == 0)
  1933	    {
  1934		print "[gro->back, revgro->forw]\n";
  1935		`cp $gro    $PATH{TPSRUNB}start.gro`;
  1936		`cp $revgro $PATH{TPSRUNF}start.gro`;
  1937	    }
  1938	   
  1939		
  1940	
  1941	    #clean#########################################
  1942	    `rm -r $TMP{0}`;
  1943	    print BLUE, "\n>>>>>>>>>>>>>>>>>> prepare_gro_files: END <<<<<<<<<<<<<<<<<<\n", RESET if $DEBUG_ON;    
  1944	}
  1945	


  1967	
  2052	
  2053	

  2101	
  2102	
  2103	
  2104	
  2105	
  2106	
  2107	
  2108	
  2109	



  2185	
  2186	
  2187	
  2188	###################################################################
  2189	# HELP SUBROUTINES
  2190	###################################################################
  2191	
  2192	#want to export it in future the problem is gropath 
  2193	sub extract_gros_from_trr() #trr, #tpr, #dest, gropattern
  2194	{
  2195	    print RED, ">>>>extract_gros_from_trr: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  2196	    my $trr = shift;
  2197	    my $tpr = shift;
  2198	    my %P; $P{0} = shift; $P{0} = &SL( $P{0} );
  2199	    my $gr = shift;
  2200	    my $b = my $e = -1;
  2201	    if($_[0] && $_[1]){ $b=shift; $e=shift }
  2202	
  2203	#NDEC16    my $input  = "-s $tpr -f $trr -ndec 16 -sep -b $b ";
  2204	    my $input  = "-s $tpr -f $trr -ndec $GRO_PREC -sep -b $b ";
  2205	    $input.=" -e $e" if $e!=-1;
  2206	    my $output = "-o $P{0}$gr.gro";
  2207	    my $stream = "1>$P{0}trjconv.out 2>$P{0}trjconv.err";
  2208	    system "$PATH{GROMACS}/trjconv $input $output $stream"." <<EOF\n 0\n EOF";
  2209	    print RED, ">>>>extract_gros_from_trr: END (DEBUG)<<<<<<<<<<<\n", RESET if $DEBUG_ON;
  2210	}
  2211	
  2212	
  2213	
  2214	
  2215	
  2216	
  2217	
  2218	sub get_numof_frames() #trr
  2219	{
  2220	    print RED, ">>>>get_numof_frames: BEGIN (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  2221	    my $trr = $_[0];
  2222	    return -1 if !-e $trr;
  2223	    my $FR = `$SCRIPT{CNT_TRR_FR} $trr $FILE{TPR} $PATH{TEMP}`; 
  2224	    print RED, ">>>>get_numof_frames: END (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;
  2225	    return $FR+0;
  2226	
  2227	}
  2228	
  2229	
  2230	
  2231	
  2232	
  2233	
  2234	sub truncate_trrs()
  2235	{
  2236	    print BLUE,">>>>>>>>> truncate_trrs_and_xys: BEGIN <<<<<<<<<<<<<<\n",RESET if $DEBUG_ON;    
  2237	    print "TRUNCATING TRRS: ";
  2238	    
  2239	    #truncating forw if accepted#############################
  2240	    my $TF  = &get_state_arrival_time($FILE{XYF},\%STATE,\%PARAM);
  2241	    
  2242	    if( $TF> 0 )
  2243	    {
  2244		$TF+=$TIMESTEP;	
  2245		print "[FORW at $TF] ";
  2246		#truncating trr####################################
  2247		my $trr = "$PATH{TPSRUNF}run.trr";
  2248		die "truncate_trrs: $trr file does not exist" if !-e $trr;
  2249		my $input  = "-s $FILE{TPR} -f $trr -e $TF";
  2250		my $output = "-o $PATH{TPSRUNF}run_trunc.trr";
  2251		my $stream = "1>$OPATH{LOG}truncate_trrs[forw].log 2>$OPATH{LOG}truncate_trrs[forw].err";
  2252		system "$PATH{GROMACS}/trjconv $input $output $stream"." <<EOF\n 0\n EOF";
  2253		`mv $PATH{TPSRUNF}run_trunc.trr $trr`;
  2254		
  2255	    }
  2256	    
  2257	    #truncating backward if accepted########################
  2258	    my $TB  = &get_state_arrival_time($FILE{XYB},\%STATE,\%PARAM);
  2259	    if( $TB > 0 )
  2260	    {
  2261		$TB+=$TIMESTEP;
  2262		print "[BACK at $TB]\n";
  2263		#truncating trr####################################
  2264		my $trr = "$PATH{TPSRUNB}run.trr";
  2265		die "truncate_trrs: $trr file does not exist" if !-e $trr;
  2266		my $input  = "-s $FILE{TPR} -f $trr -e $TB";
  2267		my $output = "-o $PATH{TPSRUNB}run_trunc.trr";
  2268		my $stream = "1>$OPATH{LOG}truncate_trrs[back].log 2>$OPATH{LOG}truncate_trrs[back].err";
  2269		system "$PATH{GROMACS}/trjconv $input $output $stream"." <<EOF\n 0\n EOF";
  2270		`mv $PATH{TPSRUNB}run_trunc.trr $trr`;
  2271	
  2272	    }
  2273	    print "\n";
  2274	    print BLUE,">>>>>>>>> truncate_trrs_and_xys: END <<<<<<<<<<<<<<\n",RESET if $DEBUG_ON;  
  2275	    
  2276	}
  2277	
  2278	
  2279	
  2280	
  2281	
  2282	
  2283	
  2284	
  2285	
  2286	
  2287	
  2288	
  2289	
  2290	sub make_par_file()
  2291	{
  2292	    print RED, ">>>>make_par_file: BEGIN (DEBUG)<<<<<<<\n", RESET if $DEBUG_ON;
  2293	    print "preparing par file... ";
  2294	    my $step6 = &numtostr($STEP,6);
  2295	    my $trr = "$OPATH{TRR}$step6.trr";
  2296	    my $out = "1>$NULL 2>$NULL";
  2297	
  2298	    #my $dummy = &queue();
  2299	
  2300	    #`echo 1 > $CURR_UPD_FOLDER/$dummy`;  #add dummy file to the queue folder
  2301	    system "$SCRIPT{UPDATE_XY} $trr $out";
  2302	    #`rm $CURR_UPD_FOLDER/$dummy`;        #remove dummy marker 
  2303	    
  2304	    print "done\n";
  2305	    print RED, ">>>>make_par_file: END (DEBUG)<<<<<<<<<\n", RESET if $DEBUG_ON;  
  2306	}
  2307	
  2308	
  2309	
  2310	
  2311	
  2312	
  2313	
  2314	
  2315	
  2316	
  2317	
  2318	
  2319	

  2388	
  2389	
  2390	
  2391	
  2392	
  2393	sub queue()
  2394	{
  2395	    #updating queue#################################################################
  2396	    my $queue;
  2397	    print "currently in update: " if $DEBUG_ON;
  2398	    my $cnt = 1;
  2399	    do{
  2400	    	$queue = `ls -1 $CURR_UPD_FOLDER | wc -l`; chomp $queue;
  2401		print $queue." " if $DEBUG_ON;
  2402		sleep( int( rand()*5+2 ) );
  2403		$cnt++;
  2404		if( $cnt >= 100) { print "\nWARNING: CANNOT UPDATE. IS QUEUE FULL?\n" }
  2405	    }while($queue > $MAX_SIMULT_UPDATES);
  2406	    
  2407	    my $dummy = &wherewhen();
  2408	    return $dummy;
  2409	}
  2410	 
  2411	
  2412	
  2413	
  2414	
  2415	

  2433	
  2434	
  2435	
  2436	 
  2437	
