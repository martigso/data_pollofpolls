data {
  int polls;              // number of polls
  int polls2;              // number of polls for nordland and nord-trondelag
  int T;                  // number of days
  
  //OSLO
  matrix[T, polls] Y_oslo_ap;     // polls
  matrix[T, polls] sigma_oslo_ap; // polls standard deviations
  real initial_prior_oslo_ap;     // Election result 2013 Oslo Ap
  
  matrix[T, polls] Y_oslo_h;     // polls
  matrix[T, polls] sigma_oslo_h; // polls standard deviations
  real initial_prior_oslo_h;     // Election result 2013 Oslo H

  matrix[T, polls] Y_oslo_frp;       // polls
  matrix[T, polls] sigma_oslo_frp; // polls standard deviations
  real initial_prior_oslo_frp;     // Election result 2013 Oslo

  matrix[T, polls] Y_oslo_sv;       // polls
  matrix[T, polls] sigma_oslo_sv; // polls standard deviations
  real initial_prior_oslo_sv;     // Election result 2013 Oslo

  matrix[T, polls] Y_oslo_sp;       // polls
  matrix[T, polls] sigma_oslo_sp; // polls standard deviations
  real initial_prior_oslo_sp;     // Election result 2013 Oslo

  matrix[T, polls] Y_oslo_krf;       // polls
  matrix[T, polls] sigma_oslo_krf; // polls standard deviations
  real initial_prior_oslo_krf;     // Election result 2013 Oslo

  matrix[T, polls] Y_oslo_v;       // polls
  matrix[T, polls] sigma_oslo_v; // polls standard deviations
  real initial_prior_oslo_v;     // Election result 2013 Oslo

  matrix[T, polls] Y_oslo_mdg;       // polls
  matrix[T, polls] sigma_oslo_mdg; // polls standard deviations
  real initial_prior_oslo_mdg;     // Election result 2013 Oslo
  
  matrix[T, polls] Y_oslo_r;       // polls
  matrix[T, polls] sigma_oslo_r; // polls standard deviations
  real initial_prior_oslo_r;     // Election result 2013 Oslo
  
  matrix[T, polls] Y_oslo_a;       // polls
  matrix[T, polls] sigma_oslo_a; // polls standard deviations
  real initial_prior_oslo_a;     // Election result 2013 Oslo
  
  //AKERSHUS
  matrix[T, polls] Y_akershus_ap;     // polls
  matrix[T, polls] sigma_akershus_ap; // polls standard deviations
  real initial_prior_akershus_ap;     // Election result 2013 akershus Ap
  
  matrix[T, polls] Y_akershus_h;     // polls
  matrix[T, polls] sigma_akershus_h; // polls standard deviations
  real initial_prior_akershus_h;     // Election result 2013 akershus H

  matrix[T, polls] Y_akershus_frp;       // polls
  matrix[T, polls] sigma_akershus_frp; // polls standard deviations
  real initial_prior_akershus_frp;     // Election result 2013 akershus

  matrix[T, polls] Y_akershus_sv;       // polls
  matrix[T, polls] sigma_akershus_sv; // polls standard deviations
  real initial_prior_akershus_sv;     // Election result 2013 akershus

  matrix[T, polls] Y_akershus_sp;       // polls
  matrix[T, polls] sigma_akershus_sp; // polls standard deviations
  real initial_prior_akershus_sp;     // Election result 2013 akershus

  matrix[T, polls] Y_akershus_krf;       // polls
  matrix[T, polls] sigma_akershus_krf; // polls standard deviations
  real initial_prior_akershus_krf;     // Election result 2013 akershus

  matrix[T, polls] Y_akershus_v;       // polls
  matrix[T, polls] sigma_akershus_v; // polls standard deviations
  real initial_prior_akershus_v;     // Election result 2013 akershus

  matrix[T, polls] Y_akershus_mdg;       // polls
  matrix[T, polls] sigma_akershus_mdg; // polls standard deviations
  real initial_prior_akershus_mdg;     // Election result 2013 akershus
  
  matrix[T, polls] Y_akershus_r;       // polls
  matrix[T, polls] sigma_akershus_r; // polls standard deviations
  real initial_prior_akershus_r;     // Election result 2013 akershus
  
  matrix[T, polls] Y_akershus_a;       // polls
  matrix[T, polls] sigma_akershus_a; // polls standard deviations
  real initial_prior_akershus_a;     // Election result 2013 akershus

  //FINNMARK
  
  matrix[T, polls] Y_finnmark_ap;     // polls
  matrix[T, polls] sigma_finnmark_ap; // polls standard deviations
  real initial_prior_finnmark_ap;     // Election result 2013 finnmark Ap
  
  matrix[T, polls] Y_finnmark_h;     // polls
  matrix[T, polls] sigma_finnmark_h; // polls standard deviations
  real initial_prior_finnmark_h;     // Election result 2013 finnmark H

  matrix[T, polls] Y_finnmark_frp;       // polls
  matrix[T, polls] sigma_finnmark_frp; // polls standard deviations
  real initial_prior_finnmark_frp;     // Election result 2013 finnmark

  matrix[T, polls] Y_finnmark_sv;       // polls
  matrix[T, polls] sigma_finnmark_sv; // polls standard deviations
  real initial_prior_finnmark_sv;     // Election result 2013 finnmark

  matrix[T, polls] Y_finnmark_sp;       // polls
  matrix[T, polls] sigma_finnmark_sp; // polls standard deviations
  real initial_prior_finnmark_sp;     // Election result 2013 finnmark

  matrix[T, polls] Y_finnmark_krf;       // polls
  matrix[T, polls] sigma_finnmark_krf; // polls standard deviations
  real initial_prior_finnmark_krf;     // Election result 2013 finnmark

  matrix[T, polls] Y_finnmark_v;       // polls
  matrix[T, polls] sigma_finnmark_v; // polls standard deviations
  real initial_prior_finnmark_v;     // Election result 2013 finnmark

  matrix[T, polls] Y_finnmark_mdg;       // polls
  matrix[T, polls] sigma_finnmark_mdg; // polls standard deviations
  real initial_prior_finnmark_mdg;     // Election result 2013 finnmark
  
  matrix[T, polls] Y_finnmark_r;       // polls
  matrix[T, polls] sigma_finnmark_r; // polls standard deviations
  real initial_prior_finnmark_r;     // Election result 2013 finnmark
  
  matrix[T, polls] Y_finnmark_a;       // polls
  matrix[T, polls] sigma_finnmark_a; // polls standard deviations
  real initial_prior_finnmark_a;     // Election result 2013 finnmark
  
    
  //nordland
  
  matrix[T, polls2] Y_nordland_ap;     // polls
  matrix[T, polls2] sigma_nordland_ap; // polls standard deviations
  real initial_prior_nordland_ap;     // Election result 2013 nordland Ap
  
  matrix[T, polls2] Y_nordland_h;     // polls
  matrix[T, polls2] sigma_nordland_h; // polls standard deviations
  real initial_prior_nordland_h;     // Election result 2013 nordland H

  matrix[T, polls2] Y_nordland_frp;       // polls
  matrix[T, polls2] sigma_nordland_frp; // polls standard deviations
  real initial_prior_nordland_frp;     // Election result 2013 nordland

  matrix[T, polls2] Y_nordland_sv;       // polls
  matrix[T, polls2] sigma_nordland_sv; // polls standard deviations
  real initial_prior_nordland_sv;     // Election result 2013 nordland

  matrix[T, polls2] Y_nordland_sp;       // polls
  matrix[T, polls2] sigma_nordland_sp; // polls standard deviations
  real initial_prior_nordland_sp;     // Election result 2013 nordland

  matrix[T, polls2] Y_nordland_krf;       // polls
  matrix[T, polls2] sigma_nordland_krf; // polls standard deviations
  real initial_prior_nordland_krf;     // Election result 2013 nordland

  matrix[T, polls2] Y_nordland_v;       // polls
  matrix[T, polls2] sigma_nordland_v; // polls standard deviations
  real initial_prior_nordland_v;     // Election result 2013 nordland

  matrix[T, polls2] Y_nordland_mdg;       // polls
  matrix[T, polls2] sigma_nordland_mdg; // polls standard deviations
  real initial_prior_nordland_mdg;     // Election result 2013 nordland
  
  matrix[T, polls2] Y_nordland_r;       // polls
  matrix[T, polls2] sigma_nordland_r; // polls standard deviations
  real initial_prior_nordland_r;     // Election result 2013 nordland
  
  matrix[T, polls2] Y_nordland_a;       // polls
  matrix[T, polls2] sigma_nordland_a; // polls standard deviations
  real initial_prior_nordland_a;     // Election result 2013 nordland

  //troms
  
  matrix[T, polls] Y_troms_ap;     // polls
  matrix[T, polls] sigma_troms_ap; // polls standard deviations
  real initial_prior_troms_ap;     // Election result 2013 troms Ap
  
  matrix[T, polls] Y_troms_h;     // polls
  matrix[T, polls] sigma_troms_h; // polls standard deviations
  real initial_prior_troms_h;     // Election result 2013 troms H

  matrix[T, polls] Y_troms_frp;       // polls
  matrix[T, polls] sigma_troms_frp; // polls standard deviations
  real initial_prior_troms_frp;     // Election result 2013 troms

  matrix[T, polls] Y_troms_sv;       // polls
  matrix[T, polls] sigma_troms_sv; // polls standard deviations
  real initial_prior_troms_sv;     // Election result 2013 troms

  matrix[T, polls] Y_troms_sp;       // polls
  matrix[T, polls] sigma_troms_sp; // polls standard deviations
  real initial_prior_troms_sp;     // Election result 2013 troms

  matrix[T, polls] Y_troms_krf;       // polls
  matrix[T, polls] sigma_troms_krf; // polls standard deviations
  real initial_prior_troms_krf;     // Election result 2013 troms

  matrix[T, polls] Y_troms_v;       // polls
  matrix[T, polls] sigma_troms_v; // polls standard deviations
  real initial_prior_troms_v;     // Election result 2013 troms

  matrix[T, polls] Y_troms_mdg;       // polls
  matrix[T, polls] sigma_troms_mdg; // polls standard deviations
  real initial_prior_troms_mdg;     // Election result 2013 troms
  
  matrix[T, polls] Y_troms_r;       // polls
  matrix[T, polls] sigma_troms_r; // polls standard deviations
  real initial_prior_troms_r;     // Election result 2013 troms
  
  matrix[T, polls] Y_troms_a;       // polls
  matrix[T, polls] sigma_troms_a; // polls standard deviations
  real initial_prior_troms_a;     // Election result 2013 troms
  
  
   //telemark
  
  matrix[T, polls] Y_telemark_ap;     // polls
  matrix[T, polls] sigma_telemark_ap; // polls standard deviations
  real initial_prior_telemark_ap;     // Election result 2013 telemark Ap
  
  matrix[T, polls] Y_telemark_h;     // polls
  matrix[T, polls] sigma_telemark_h; // polls standard deviations
  real initial_prior_telemark_h;     // Election result 2013 telemark H

  matrix[T, polls] Y_telemark_frp;       // polls
  matrix[T, polls] sigma_telemark_frp; // polls standard deviations
  real initial_prior_telemark_frp;     // Election result 2013 telemark

  matrix[T, polls] Y_telemark_sv;       // polls
  matrix[T, polls] sigma_telemark_sv; // polls standard deviations
  real initial_prior_telemark_sv;     // Election result 2013 telemark

  matrix[T, polls] Y_telemark_sp;       // polls
  matrix[T, polls] sigma_telemark_sp; // polls standard deviations
  real initial_prior_telemark_sp;     // Election result 2013 telemark

  matrix[T, polls] Y_telemark_krf;       // polls
  matrix[T, polls] sigma_telemark_krf; // polls standard deviations
  real initial_prior_telemark_krf;     // Election result 2013 telemark

  matrix[T, polls] Y_telemark_v;       // polls
  matrix[T, polls] sigma_telemark_v; // polls standard deviations
  real initial_prior_telemark_v;     // Election result 2013 telemark

  matrix[T, polls] Y_telemark_mdg;       // polls
  matrix[T, polls] sigma_telemark_mdg; // polls standard deviations
  real initial_prior_telemark_mdg;     // Election result 2013 telemark
  
  matrix[T, polls] Y_telemark_r;       // polls
  matrix[T, polls] sigma_telemark_r; // polls standard deviations
  real initial_prior_telemark_r;     // Election result 2013 telemark
  
  matrix[T, polls] Y_telemark_a;       // polls
  matrix[T, polls] sigma_telemark_a; // polls standard deviations
  real initial_prior_telemark_a;     // Election result 2013 telemark

  
  //oppland
  
  matrix[T, polls] Y_oppland_ap;     // polls
  matrix[T, polls] sigma_oppland_ap; // polls standard deviations
  real initial_prior_oppland_ap;     // Election result 2013 oppland Ap
  
  matrix[T, polls] Y_oppland_h;     // polls
  matrix[T, polls] sigma_oppland_h; // polls standard deviations
  real initial_prior_oppland_h;     // Election result 2013 oppland H

  matrix[T, polls] Y_oppland_frp;       // polls
  matrix[T, polls] sigma_oppland_frp; // polls standard deviations
  real initial_prior_oppland_frp;     // Election result 2013 oppland

  matrix[T, polls] Y_oppland_sv;       // polls
  matrix[T, polls] sigma_oppland_sv; // polls standard deviations
  real initial_prior_oppland_sv;     // Election result 2013 oppland

  matrix[T, polls] Y_oppland_sp;       // polls
  matrix[T, polls] sigma_oppland_sp; // polls standard deviations
  real initial_prior_oppland_sp;     // Election result 2013 oppland

  matrix[T, polls] Y_oppland_krf;       // polls
  matrix[T, polls] sigma_oppland_krf; // polls standard deviations
  real initial_prior_oppland_krf;     // Election result 2013 oppland

  matrix[T, polls] Y_oppland_v;       // polls
  matrix[T, polls] sigma_oppland_v; // polls standard deviations
  real initial_prior_oppland_v;     // Election result 2013 oppland

  matrix[T, polls] Y_oppland_mdg;       // polls
  matrix[T, polls] sigma_oppland_mdg; // polls standard deviations
  real initial_prior_oppland_mdg;     // Election result 2013 oppland
  
  matrix[T, polls] Y_oppland_r;       // polls
  matrix[T, polls] sigma_oppland_r; // polls standard deviations
  real initial_prior_oppland_r;     // Election result 2013 oppland
  
  matrix[T, polls] Y_oppland_a;       // polls
  matrix[T, polls] sigma_oppland_a; // polls standard deviations
  real initial_prior_oppland_a;     // Election result 2013 oppland
  
  
    //buskerud
  
  matrix[T, polls] Y_buskerud_ap;     // polls
  matrix[T, polls] sigma_buskerud_ap; // polls standard deviations
  real initial_prior_buskerud_ap;     // Election result 2013 buskerud Ap
  
  matrix[T, polls] Y_buskerud_h;     // polls
  matrix[T, polls] sigma_buskerud_h; // polls standard deviations
  real initial_prior_buskerud_h;     // Election result 2013 buskerud H

  matrix[T, polls] Y_buskerud_frp;       // polls
  matrix[T, polls] sigma_buskerud_frp; // polls standard deviations
  real initial_prior_buskerud_frp;     // Election result 2013 buskerud

  matrix[T, polls] Y_buskerud_sv;       // polls
  matrix[T, polls] sigma_buskerud_sv; // polls standard deviations
  real initial_prior_buskerud_sv;     // Election result 2013 buskerud

  matrix[T, polls] Y_buskerud_sp;       // polls
  matrix[T, polls] sigma_buskerud_sp; // polls standard deviations
  real initial_prior_buskerud_sp;     // Election result 2013 buskerud

  matrix[T, polls] Y_buskerud_krf;       // polls
  matrix[T, polls] sigma_buskerud_krf; // polls standard deviations
  real initial_prior_buskerud_krf;     // Election result 2013 buskerud

  matrix[T, polls] Y_buskerud_v;       // polls
  matrix[T, polls] sigma_buskerud_v; // polls standard deviations
  real initial_prior_buskerud_v;     // Election result 2013 buskerud

  matrix[T, polls] Y_buskerud_mdg;       // polls
  matrix[T, polls] sigma_buskerud_mdg; // polls standard deviations
  real initial_prior_buskerud_mdg;     // Election result 2013 buskerud
  
  matrix[T, polls] Y_buskerud_r;       // polls
  matrix[T, polls] sigma_buskerud_r; // polls standard deviations
  real initial_prior_buskerud_r;     // Election result 2013 buskerud
  
  matrix[T, polls] Y_buskerud_a;       // polls
  matrix[T, polls] sigma_buskerud_a; // polls standard deviations
  real initial_prior_buskerud_a;     // Election result 2013 buskerud
  
  
   
  //hordaland
  
  matrix[T, polls] Y_hordaland_ap;     // polls
  matrix[T, polls] sigma_hordaland_ap; // polls standard deviations
  real initial_prior_hordaland_ap;     // Election result 2013 hordaland Ap
  
  matrix[T, polls] Y_hordaland_h;     // polls
  matrix[T, polls] sigma_hordaland_h; // polls standard deviations
  real initial_prior_hordaland_h;     // Election result 2013 hordaland H

  matrix[T, polls] Y_hordaland_frp;       // polls
  matrix[T, polls] sigma_hordaland_frp; // polls standard deviations
  real initial_prior_hordaland_frp;     // Election result 2013 hordaland

  matrix[T, polls] Y_hordaland_sv;       // polls
  matrix[T, polls] sigma_hordaland_sv; // polls standard deviations
  real initial_prior_hordaland_sv;     // Election result 2013 hordaland

  matrix[T, polls] Y_hordaland_sp;       // polls
  matrix[T, polls] sigma_hordaland_sp; // polls standard deviations
  real initial_prior_hordaland_sp;     // Election result 2013 hordaland

  matrix[T, polls] Y_hordaland_krf;       // polls
  matrix[T, polls] sigma_hordaland_krf; // polls standard deviations
  real initial_prior_hordaland_krf;     // Election result 2013 hordaland

  matrix[T, polls] Y_hordaland_v;       // polls
  matrix[T, polls] sigma_hordaland_v; // polls standard deviations
  real initial_prior_hordaland_v;     // Election result 2013 hordaland

  matrix[T, polls] Y_hordaland_mdg;       // polls
  matrix[T, polls] sigma_hordaland_mdg; // polls standard deviations
  real initial_prior_hordaland_mdg;     // Election result 2013 hordaland
  
  matrix[T, polls] Y_hordaland_r;       // polls
  matrix[T, polls] sigma_hordaland_r; // polls standard deviations
  real initial_prior_hordaland_r;     // Election result 2013 hordaland
  
  matrix[T, polls] Y_hordaland_a;       // polls
  matrix[T, polls] sigma_hordaland_a; // polls standard deviations
  real initial_prior_hordaland_a;     // Election result 2013 hordaland
  
  
    //sogn
  
  matrix[T, polls] Y_sogn_ap;     // polls
  matrix[T, polls] sigma_sogn_ap; // polls standard deviations
  real initial_prior_sogn_ap;     // Election result 2013 sogn Ap
  
  matrix[T, polls] Y_sogn_h;     // polls
  matrix[T, polls] sigma_sogn_h; // polls standard deviations
  real initial_prior_sogn_h;     // Election result 2013 sogn H

  matrix[T, polls] Y_sogn_frp;       // polls
  matrix[T, polls] sigma_sogn_frp; // polls standard deviations
  real initial_prior_sogn_frp;     // Election result 2013 sogn

  matrix[T, polls] Y_sogn_sv;       // polls
  matrix[T, polls] sigma_sogn_sv; // polls standard deviations
  real initial_prior_sogn_sv;     // Election result 2013 sogn

  matrix[T, polls] Y_sogn_sp;       // polls
  matrix[T, polls] sigma_sogn_sp; // polls standard deviations
  real initial_prior_sogn_sp;     // Election result 2013 sogn

  matrix[T, polls] Y_sogn_krf;       // polls
  matrix[T, polls] sigma_sogn_krf; // polls standard deviations
  real initial_prior_sogn_krf;     // Election result 2013 sogn

  matrix[T, polls] Y_sogn_v;       // polls
  matrix[T, polls] sigma_sogn_v; // polls standard deviations
  real initial_prior_sogn_v;     // Election result 2013 sogn

  matrix[T, polls] Y_sogn_mdg;       // polls
  matrix[T, polls] sigma_sogn_mdg; // polls standard deviations
  real initial_prior_sogn_mdg;     // Election result 2013 sogn
  
  matrix[T, polls] Y_sogn_r;       // polls
  matrix[T, polls] sigma_sogn_r; // polls standard deviations
  real initial_prior_sogn_r;     // Election result 2013 sogn
  
  matrix[T, polls] Y_sogn_a;       // polls
  matrix[T, polls] sigma_sogn_a; // polls standard deviations
  real initial_prior_sogn_a;     // Election result 2013 sogn

  
  
  //austagder
  
  matrix[T, polls] Y_austagder_ap;     // polls
  matrix[T, polls] sigma_austagder_ap; // polls standard deviations
  real initial_prior_austagder_ap;     // Election result 2013 austagder Ap
  
  matrix[T, polls] Y_austagder_h;     // polls
  matrix[T, polls] sigma_austagder_h; // polls standard deviations
  real initial_prior_austagder_h;     // Election result 2013 austagder H

  matrix[T, polls] Y_austagder_frp;       // polls
  matrix[T, polls] sigma_austagder_frp; // polls standard deviations
  real initial_prior_austagder_frp;     // Election result 2013 austagder

  matrix[T, polls] Y_austagder_sv;       // polls
  matrix[T, polls] sigma_austagder_sv; // polls standard deviations
  real initial_prior_austagder_sv;     // Election result 2013 austagder

  matrix[T, polls] Y_austagder_sp;       // polls
  matrix[T, polls] sigma_austagder_sp; // polls standard deviations
  real initial_prior_austagder_sp;     // Election result 2013 austagder

  matrix[T, polls] Y_austagder_krf;       // polls
  matrix[T, polls] sigma_austagder_krf; // polls standard deviations
  real initial_prior_austagder_krf;     // Election result 2013 austagder

  matrix[T, polls] Y_austagder_v;       // polls
  matrix[T, polls] sigma_austagder_v; // polls standard deviations
  real initial_prior_austagder_v;     // Election result 2013 austagder

  matrix[T, polls] Y_austagder_mdg;       // polls
  matrix[T, polls] sigma_austagder_mdg; // polls standard deviations
  real initial_prior_austagder_mdg;     // Election result 2013 austagder
  
  matrix[T, polls] Y_austagder_r;       // polls
  matrix[T, polls] sigma_austagder_r; // polls standard deviations
  real initial_prior_austagder_r;     // Election result 2013 austagder
  
  matrix[T, polls] Y_austagder_a;       // polls
  matrix[T, polls] sigma_austagder_a; // polls standard deviations
  real initial_prior_austagder_a;     // Election result 2013 austagder
  
    //vestagder
  
  matrix[T, polls] Y_vestagder_ap;     // polls
  matrix[T, polls] sigma_vestagder_ap; // polls standard deviations
  real initial_prior_vestagder_ap;     // Election result 2013 vestagder Ap
  
  matrix[T, polls] Y_vestagder_h;     // polls
  matrix[T, polls] sigma_vestagder_h; // polls standard deviations
  real initial_prior_vestagder_h;     // Election result 2013 vestagder H

  matrix[T, polls] Y_vestagder_frp;       // polls
  matrix[T, polls] sigma_vestagder_frp; // polls standard deviations
  real initial_prior_vestagder_frp;     // Election result 2013 vestagder

  matrix[T, polls] Y_vestagder_sv;       // polls
  matrix[T, polls] sigma_vestagder_sv; // polls standard deviations
  real initial_prior_vestagder_sv;     // Election result 2013 vestagder

  matrix[T, polls] Y_vestagder_sp;       // polls
  matrix[T, polls] sigma_vestagder_sp; // polls standard deviations
  real initial_prior_vestagder_sp;     // Election result 2013 vestagder

  matrix[T, polls] Y_vestagder_krf;       // polls
  matrix[T, polls] sigma_vestagder_krf; // polls standard deviations
  real initial_prior_vestagder_krf;     // Election result 2013 vestagder

  matrix[T, polls] Y_vestagder_v;       // polls
  matrix[T, polls] sigma_vestagder_v; // polls standard deviations
  real initial_prior_vestagder_v;     // Election result 2013 vestagder

  matrix[T, polls] Y_vestagder_mdg;       // polls
  matrix[T, polls] sigma_vestagder_mdg; // polls standard deviations
  real initial_prior_vestagder_mdg;     // Election result 2013 vestagder
  
  matrix[T, polls] Y_vestagder_r;       // polls
  matrix[T, polls] sigma_vestagder_r; // polls standard deviations
  real initial_prior_vestagder_r;     // Election result 2013 vestagder
  
  matrix[T, polls] Y_vestagder_a;       // polls
  matrix[T, polls] sigma_vestagder_a; // polls standard deviations
  real initial_prior_vestagder_a;     // Election result 2013 vestagder
  
  
  //rogaland
  
  matrix[T, polls] Y_rogaland_ap;     // polls
  matrix[T, polls] sigma_rogaland_ap; // polls standard deviations
  real initial_prior_rogaland_ap;     // Election result 2013 rogaland Ap
  
  matrix[T, polls] Y_rogaland_h;     // polls
  matrix[T, polls] sigma_rogaland_h; // polls standard deviations
  real initial_prior_rogaland_h;     // Election result 2013 rogaland H

  matrix[T, polls] Y_rogaland_frp;       // polls
  matrix[T, polls] sigma_rogaland_frp; // polls standard deviations
  real initial_prior_rogaland_frp;     // Election result 2013 rogaland

  matrix[T, polls] Y_rogaland_sv;       // polls
  matrix[T, polls] sigma_rogaland_sv; // polls standard deviations
  real initial_prior_rogaland_sv;     // Election result 2013 rogaland

  matrix[T, polls] Y_rogaland_sp;       // polls
  matrix[T, polls] sigma_rogaland_sp; // polls standard deviations
  real initial_prior_rogaland_sp;     // Election result 2013 rogaland

  matrix[T, polls] Y_rogaland_krf;       // polls
  matrix[T, polls] sigma_rogaland_krf; // polls standard deviations
  real initial_prior_rogaland_krf;     // Election result 2013 rogaland

  matrix[T, polls] Y_rogaland_v;       // polls
  matrix[T, polls] sigma_rogaland_v; // polls standard deviations
  real initial_prior_rogaland_v;     // Election result 2013 rogaland

  matrix[T, polls] Y_rogaland_mdg;       // polls
  matrix[T, polls] sigma_rogaland_mdg; // polls standard deviations
  real initial_prior_rogaland_mdg;     // Election result 2013 rogaland
  
  matrix[T, polls] Y_rogaland_r;       // polls
  matrix[T, polls] sigma_rogaland_r; // polls standard deviations
  real initial_prior_rogaland_r;     // Election result 2013 rogaland
  
  matrix[T, polls] Y_rogaland_a;       // polls
  matrix[T, polls] sigma_rogaland_a; // polls standard deviations
  real initial_prior_rogaland_a;     // Election result 2013 rogaland

   
  //nordtrondelag
  
  matrix[T, polls2] Y_nordtrondelag_ap;     // polls
  matrix[T, polls2] sigma_nordtrondelag_ap; // polls standard deviations
  real initial_prior_nordtrondelag_ap;     // Election result 2013 trondelag Ap
  
  matrix[T, polls2] Y_nordtrondelag_h;     // polls
  matrix[T, polls2] sigma_nordtrondelag_h; // polls standard deviations
  real initial_prior_nordtrondelag_h;     // Election result 2013 trondelag H

  matrix[T, polls2] Y_nordtrondelag_frp;       // polls
  matrix[T, polls2] sigma_nordtrondelag_frp; // polls standard deviations
  real initial_prior_nordtrondelag_frp;     // Election result 2013 trondelag

  matrix[T, polls2] Y_nordtrondelag_sv;       // polls
  matrix[T, polls2] sigma_nordtrondelag_sv; // polls standard deviations
  real initial_prior_nordtrondelag_sv;     // Election result 2013 trondelag

  matrix[T, polls2] Y_nordtrondelag_sp;       // polls
  matrix[T, polls2] sigma_nordtrondelag_sp; // polls standard deviations
  real initial_prior_nordtrondelag_sp;     // Election result 2013 trondelag

  matrix[T, polls2] Y_nordtrondelag_krf;       // polls
  matrix[T, polls2] sigma_nordtrondelag_krf; // polls standard deviations
  real initial_prior_nordtrondelag_krf;     // Election result 2013 trondelag

  matrix[T, polls2] Y_nordtrondelag_v;       // polls
  matrix[T, polls2] sigma_nordtrondelag_v; // polls standard deviations
  real initial_prior_nordtrondelag_v;     // Election result 2013 trondelag

  matrix[T, polls2] Y_nordtrondelag_mdg;       // polls
  matrix[T, polls2] sigma_nordtrondelag_mdg; // polls standard deviations
  real initial_prior_nordtrondelag_mdg;     // Election result 2013 trondelag
  
  matrix[T, polls2] Y_nordtrondelag_r;       // polls
  matrix[T, polls2] sigma_nordtrondelag_r; // polls standard deviations
  real initial_prior_nordtrondelag_r;     // Election result 2013 trondelag
  
  matrix[T, polls2] Y_nordtrondelag_a;       // polls
  matrix[T, polls2] sigma_nordtrondelag_a; // polls standard deviations
  real initial_prior_nordtrondelag_a;     // Election result 2013 trondelag
  
  
  
  //hedmark
  
  matrix[T, polls] Y_hedmark_ap;     // polls
  matrix[T, polls] sigma_hedmark_ap; // polls standard deviations
  real initial_prior_hedmark_ap;     // Election result 2013 hedmark Ap
  
  matrix[T, polls] Y_hedmark_h;     // polls
  matrix[T, polls] sigma_hedmark_h; // polls standard deviations
  real initial_prior_hedmark_h;     // Election result 2013 hedmark H

  matrix[T, polls] Y_hedmark_frp;       // polls
  matrix[T, polls] sigma_hedmark_frp; // polls standard deviations
  real initial_prior_hedmark_frp;     // Election result 2013 hedmark

  matrix[T, polls] Y_hedmark_sv;       // polls
  matrix[T, polls] sigma_hedmark_sv; // polls standard deviations
  real initial_prior_hedmark_sv;     // Election result 2013 hedmark

  matrix[T, polls] Y_hedmark_sp;       // polls
  matrix[T, polls] sigma_hedmark_sp; // polls standard deviations
  real initial_prior_hedmark_sp;     // Election result 2013 hedmark

  matrix[T, polls] Y_hedmark_krf;       // polls
  matrix[T, polls] sigma_hedmark_krf; // polls standard deviations
  real initial_prior_hedmark_krf;     // Election result 2013 hedmark

  matrix[T, polls] Y_hedmark_v;       // polls
  matrix[T, polls] sigma_hedmark_v; // polls standard deviations
  real initial_prior_hedmark_v;     // Election result 2013 hedmark

  matrix[T, polls] Y_hedmark_mdg;       // polls
  matrix[T, polls] sigma_hedmark_mdg; // polls standard deviations
  real initial_prior_hedmark_mdg;     // Election result 2013 hedmark
  
  matrix[T, polls] Y_hedmark_r;       // polls
  matrix[T, polls] sigma_hedmark_r; // polls standard deviations
  real initial_prior_hedmark_r;     // Election result 2013 hedmark
  
  matrix[T, polls] Y_hedmark_a;       // polls
  matrix[T, polls] sigma_hedmark_a; // polls standard deviations
  real initial_prior_hedmark_a;     // Election result 2013 hedmark

  
  
  //ostfold
  
  matrix[T, polls] Y_ostfold_ap;     // polls
  matrix[T, polls] sigma_ostfold_ap; // polls standard deviations
  real initial_prior_ostfold_ap;     // Election result 2013 ostfold Ap
  
  matrix[T, polls] Y_ostfold_h;     // polls
  matrix[T, polls] sigma_ostfold_h; // polls standard deviations
  real initial_prior_ostfold_h;     // Election result 2013 ostfold H

  matrix[T, polls] Y_ostfold_frp;       // polls
  matrix[T, polls] sigma_ostfold_frp; // polls standard deviations
  real initial_prior_ostfold_frp;     // Election result 2013 ostfold

  matrix[T, polls] Y_ostfold_sv;       // polls
  matrix[T, polls] sigma_ostfold_sv; // polls standard deviations
  real initial_prior_ostfold_sv;     // Election result 2013 ostfold

  matrix[T, polls] Y_ostfold_sp;       // polls
  matrix[T, polls] sigma_ostfold_sp; // polls standard deviations
  real initial_prior_ostfold_sp;     // Election result 2013 ostfold

  matrix[T, polls] Y_ostfold_krf;       // polls
  matrix[T, polls] sigma_ostfold_krf; // polls standard deviations
  real initial_prior_ostfold_krf;     // Election result 2013 ostfold

  matrix[T, polls] Y_ostfold_v;       // polls
  matrix[T, polls] sigma_ostfold_v; // polls standard deviations
  real initial_prior_ostfold_v;     // Election result 2013 ostfold

  matrix[T, polls] Y_ostfold_mdg;       // polls
  matrix[T, polls] sigma_ostfold_mdg; // polls standard deviations
  real initial_prior_ostfold_mdg;     // Election result 2013 ostfold
  
  matrix[T, polls] Y_ostfold_r;       // polls
  matrix[T, polls] sigma_ostfold_r; // polls standard deviations
  real initial_prior_ostfold_r;     // Election result 2013 ostfold
  
  matrix[T, polls] Y_ostfold_a;       // polls
  matrix[T, polls] sigma_ostfold_a; // polls standard deviations
  real initial_prior_ostfold_a;     // Election result 2013 ostfold
  
  
  //romsdal
  
  matrix[T, polls] Y_romsdal_ap;     // polls
  matrix[T, polls] sigma_romsdal_ap; // polls standard deviations
  real initial_prior_romsdal_ap;     // Election result 2013 romsdal Ap
  
  matrix[T, polls] Y_romsdal_h;     // polls
  matrix[T, polls] sigma_romsdal_h; // polls standard deviations
  real initial_prior_romsdal_h;     // Election result 2013 romsdal H

  matrix[T, polls] Y_romsdal_frp;       // polls
  matrix[T, polls] sigma_romsdal_frp; // polls standard deviations
  real initial_prior_romsdal_frp;     // Election result 2013 romsdal

  matrix[T, polls] Y_romsdal_sv;       // polls
  matrix[T, polls] sigma_romsdal_sv; // polls standard deviations
  real initial_prior_romsdal_sv;     // Election result 2013 romsdal

  matrix[T, polls] Y_romsdal_sp;       // polls
  matrix[T, polls] sigma_romsdal_sp; // polls standard deviations
  real initial_prior_romsdal_sp;     // Election result 2013 romsdal

  matrix[T, polls] Y_romsdal_krf;       // polls
  matrix[T, polls] sigma_romsdal_krf; // polls standard deviations
  real initial_prior_romsdal_krf;     // Election result 2013 romsdal

  matrix[T, polls] Y_romsdal_v;       // polls
  matrix[T, polls] sigma_romsdal_v; // polls standard deviations
  real initial_prior_romsdal_v;     // Election result 2013 romsdal

  matrix[T, polls] Y_romsdal_mdg;       // polls
  matrix[T, polls] sigma_romsdal_mdg; // polls standard deviations
  real initial_prior_romsdal_mdg;     // Election result 2013 romsdal
  
  matrix[T, polls] Y_romsdal_r;       // polls
  matrix[T, polls] sigma_romsdal_r; // polls standard deviations
  real initial_prior_romsdal_r;     // Election result 2013 romsdal
  
  matrix[T, polls] Y_romsdal_a;       // polls
  matrix[T, polls] sigma_romsdal_a; // polls standard deviations
  real initial_prior_romsdal_a;     // Election result 2013 romsdal

    //sortrondelag
  
  matrix[T, polls] Y_sortrondelag_ap;     // polls
  matrix[T, polls] sigma_sortrondelag_ap; // polls standard deviations
  real initial_prior_sortrondelag_ap;     // Election result 2013 sortrondelag Ap
  
  matrix[T, polls] Y_sortrondelag_h;     // polls
  matrix[T, polls] sigma_sortrondelag_h; // polls standard deviations
  real initial_prior_sortrondelag_h;     // Election result 2013 sortrondelag H

  matrix[T, polls] Y_sortrondelag_frp;       // polls
  matrix[T, polls] sigma_sortrondelag_frp; // polls standard deviations
  real initial_prior_sortrondelag_frp;     // Election result 2013 sortrondelag

  matrix[T, polls] Y_sortrondelag_sv;       // polls
  matrix[T, polls] sigma_sortrondelag_sv; // polls standard deviations
  real initial_prior_sortrondelag_sv;     // Election result 2013 sortrondelag

  matrix[T, polls] Y_sortrondelag_sp;       // polls
  matrix[T, polls] sigma_sortrondelag_sp; // polls standard deviations
  real initial_prior_sortrondelag_sp;     // Election result 2013 sortrondelag

  matrix[T, polls] Y_sortrondelag_krf;       // polls
  matrix[T, polls] sigma_sortrondelag_krf; // polls standard deviations
  real initial_prior_sortrondelag_krf;     // Election result 2013 sortrondelag

  matrix[T, polls] Y_sortrondelag_v;       // polls
  matrix[T, polls] sigma_sortrondelag_v; // polls standard deviations
  real initial_prior_sortrondelag_v;     // Election result 2013 sortrondelag

  matrix[T, polls] Y_sortrondelag_mdg;       // polls
  matrix[T, polls] sigma_sortrondelag_mdg; // polls standard deviations
  real initial_prior_sortrondelag_mdg;     // Election result 2013 sortrondelag
  
  matrix[T, polls] Y_sortrondelag_r;       // polls
  matrix[T, polls] sigma_sortrondelag_r; // polls standard deviations
  real initial_prior_sortrondelag_r;     // Election result 2013 sortrondelag
  
  matrix[T, polls] Y_sortrondelag_a;       // polls
  matrix[T, polls] sigma_sortrondelag_a; // polls standard deviations
  real initial_prior_sortrondelag_a;     // Election result 2013 sortrondelag
  
  //vestfold
  
  matrix[T, polls] Y_vestfold_ap;     // polls
  matrix[T, polls] sigma_vestfold_ap; // polls standard deviations
  real initial_prior_vestfold_ap;     // Election result 2013 vestfold Ap
  
  matrix[T, polls] Y_vestfold_h;     // polls
  matrix[T, polls] sigma_vestfold_h; // polls standard deviations
  real initial_prior_vestfold_h;     // Election result 2013 vestfold H

  matrix[T, polls] Y_vestfold_frp;       // polls
  matrix[T, polls] sigma_vestfold_frp; // polls standard deviations
  real initial_prior_vestfold_frp;     // Election result 2013 vestfold

  matrix[T, polls] Y_vestfold_sv;       // polls
  matrix[T, polls] sigma_vestfold_sv; // polls standard deviations
  real initial_prior_vestfold_sv;     // Election result 2013 vestfold

  matrix[T, polls] Y_vestfold_sp;       // polls
  matrix[T, polls] sigma_vestfold_sp; // polls standard deviations
  real initial_prior_vestfold_sp;     // Election result 2013 vestfold

  matrix[T, polls] Y_vestfold_krf;       // polls
  matrix[T, polls] sigma_vestfold_krf; // polls standard deviations
  real initial_prior_vestfold_krf;     // Election result 2013 vestfold

  matrix[T, polls] Y_vestfold_v;       // polls
  matrix[T, polls] sigma_vestfold_v; // polls standard deviations
  real initial_prior_vestfold_v;     // Election result 2013 vestfold

  matrix[T, polls] Y_vestfold_mdg;       // polls
  matrix[T, polls] sigma_vestfold_mdg; // polls standard deviations
  real initial_prior_vestfold_mdg;     // Election result 2013 vestfold
  
  matrix[T, polls] Y_vestfold_r;       // polls
  matrix[T, polls] sigma_vestfold_r; // polls standard deviations
  real initial_prior_vestfold_r;     // Election result 2013 vestfold
  
  matrix[T, polls] Y_vestfold_a;       // polls
  matrix[T, polls] sigma_vestfold_a; // polls standard deviations
  real initial_prior_vestfold_a;     // Election result 2013 vestfold

}
parameters {
  
  //OSLO
  vector<lower = 0>[T] mu_oslo_ap;                      // Latent for oslo Ap
  matrix[T, polls] shrunken_polls_oslo_ap;   // Imputed polls Oslo Ap
  real<lower = 0> tau_oslo_ap;               // the standard deviation of the random effects for oslo ap
  
  vector<lower = 0>[T] mu_oslo_h;                      // Latent for oslo H
  matrix[T, polls] shrunken_polls_oslo_h;   // Imputed polls Oslo H
  real<lower = 0> tau_oslo_h;               // the standard deviation of the random effects for oslo h
  
  vector<lower = 0>[T] mu_oslo_frp;                      // Latent for oslo frp
  matrix[T, polls] shrunken_polls_oslo_frp;   // Imputed polls Oslo frp
  real<lower = 0> tau_oslo_frp;               // the standard deviation of the random effects for oslo frp
 
  vector<lower = 0>[T] mu_oslo_sv;                      // Latent for oslo
  matrix[T, polls] shrunken_polls_oslo_sv;   // Imputed polls Oslo
  real<lower = 0> tau_oslo_sv;               // the standard deviation of the random effects for oslo
 
  vector<lower = 0>[T] mu_oslo_sp;                      // Latent for oslo
  matrix[T, polls] shrunken_polls_oslo_sp;   // Imputed polls Oslo
  real<lower = 0> tau_oslo_sp;               // the standard deviation of the random effects for oslo
 
  vector<lower = 0>[T] mu_oslo_krf;                      // Latent for oslo
  matrix[T, polls] shrunken_polls_oslo_krf;   // Imputed polls Oslo
  real<lower = 0> tau_oslo_krf;               // the standard deviation of the random effects for oslo
 
  vector<lower = 0>[T] mu_oslo_v;                      // Latent for oslo
  matrix[T, polls] shrunken_polls_oslo_v;   // Imputed polls Oslo
  real<lower = 0> tau_oslo_v;               // the standard deviation of the random effects for oslo
 
  vector<lower = 0>[T] mu_oslo_mdg;                      // Latent for oslo
  matrix[T, polls] shrunken_polls_oslo_mdg;   // Imputed polls Oslo
  real<lower = 0> tau_oslo_mdg;               // the standard deviation of the random effects for oslo
 
  vector<lower = 0>[T] mu_oslo_r;                      // Latent for oslo
  matrix[T, polls] shrunken_polls_oslo_r;   // Imputed polls Oslo
  real<lower = 0> tau_oslo_r;               // the standard deviation of the random effects for oslo
 
  vector<lower = 0>[T] mu_oslo_a;                      // Latent for oslo
  matrix[T, polls] shrunken_polls_oslo_a;   // Imputed polls Oslo
  real<lower = 0> tau_oslo_a;             // the standard deviation of the random effects for oslo
 
  //AKERSHUS
  vector<lower = 0>[T] mu_akershus_ap;                      // Latent for akershus Ap
  matrix[T, polls] shrunken_polls_akershus_ap;   // Imputed polls akershus Ap
  real<lower = 0> tau_akershus_ap;               // the standard deviation of the random effects for akershus ap
  
  vector<lower = 0>[T] mu_akershus_h;                      // Latent for akershus H
  matrix[T, polls] shrunken_polls_akershus_h;   // Imputed polls akershus H
  real<lower = 0> tau_akershus_h;               // the standard deviation of the random effects for akershus h
  
  vector<lower = 0>[T] mu_akershus_frp;                      // Latent for akershus frp
  matrix[T, polls] shrunken_polls_akershus_frp;   // Imputed polls akershus frp
  real<lower = 0> tau_akershus_frp;               // the standard deviation of the random effects for akershus frp
 
  vector<lower = 0>[T] mu_akershus_sv;                      // Latent for akershus
  matrix[T, polls] shrunken_polls_akershus_sv;   // Imputed polls akershus
  real<lower = 0> tau_akershus_sv;               // the standard deviation of the random effects for akershus
 
  vector<lower = 0>[T] mu_akershus_sp;                      // Latent for akershus
  matrix[T, polls] shrunken_polls_akershus_sp;   // Imputed polls akershus
  real<lower = 0> tau_akershus_sp;               // the standard deviation of the random effects for akershus
 
  vector<lower = 0>[T] mu_akershus_krf;                      // Latent for akershus
  matrix[T, polls] shrunken_polls_akershus_krf;   // Imputed polls akershus
  real<lower = 0> tau_akershus_krf;               // the standard deviation of the random effects for akershus
 
  vector<lower = 0>[T] mu_akershus_v;                      // Latent for akershus
  matrix[T, polls] shrunken_polls_akershus_v;   // Imputed polls akershus
  real<lower = 0> tau_akershus_v;               // the standard deviation of the random effects for akershus
 
  vector<lower = 0>[T] mu_akershus_mdg;                      // Latent for akershus
  matrix[T, polls] shrunken_polls_akershus_mdg;   // Imputed polls akershus
  real<lower = 0> tau_akershus_mdg;               // the standard deviation of the random effects for akershus
 
  vector<lower = 0>[T] mu_akershus_r;                      // Latent for akershus
  matrix[T, polls] shrunken_polls_akershus_r;   // Imputed polls akershus
  real<lower = 0> tau_akershus_r;               // the standard deviation of the random effects for akershus
 
  vector<lower = 0>[T] mu_akershus_a;                      // Latent for akershus
  matrix[T, polls] shrunken_polls_akershus_a;   // Imputed polls akershus
  real<lower = 0> tau_akershus_a;             // the standard deviation of the random effects for akershus
  
  
  //finnmark
  vector<lower = 0>[T] mu_finnmark_ap;                      // Latent for finnmark Ap
  matrix[T, polls] shrunken_polls_finnmark_ap;   // Imputed polls finnmark Ap
  real<lower = 0> tau_finnmark_ap;               // the standard deviation of the random effects for finnmark ap
  
  vector<lower = 0>[T] mu_finnmark_h;                      // Latent for finnmark H
  matrix[T, polls] shrunken_polls_finnmark_h;   // Imputed polls finnmark H
  real<lower = 0> tau_finnmark_h;               // the standard deviation of the random effects for finnmark h
  
  vector<lower = 0>[T] mu_finnmark_frp;                      // Latent for finnmark frp
  matrix[T, polls] shrunken_polls_finnmark_frp;   // Imputed polls finnmark frp
  real<lower = 0> tau_finnmark_frp;               // the standard deviation of the random effects for finnmark frp
 
  vector<lower = 0>[T] mu_finnmark_sv;                      // Latent for finnmark
  matrix[T, polls] shrunken_polls_finnmark_sv;   // Imputed polls finnmark
  real<lower = 0> tau_finnmark_sv;               // the standard deviation of the random effects for finnmark
 
  vector<lower = 0>[T] mu_finnmark_sp;                      // Latent for finnmark
  matrix[T, polls] shrunken_polls_finnmark_sp;   // Imputed polls finnmark
  real<lower = 0> tau_finnmark_sp;               // the standard deviation of the random effects for finnmark
 
  vector<lower = 0>[T] mu_finnmark_krf;                      // Latent for finnmark
  matrix[T, polls] shrunken_polls_finnmark_krf;   // Imputed polls finnmark
  real<lower = 0> tau_finnmark_krf;               // the standard deviation of the random effects for finnmark
 
  vector<lower = 0>[T] mu_finnmark_v;                      // Latent for finnmark
  matrix[T, polls] shrunken_polls_finnmark_v;   // Imputed polls finnmark
  real<lower = 0> tau_finnmark_v;               // the standard deviation of the random effects for finnmark
 
  vector<lower = 0>[T] mu_finnmark_mdg;                      // Latent for finnmark
  matrix[T, polls] shrunken_polls_finnmark_mdg;   // Imputed polls finnmark
  real<lower = 0> tau_finnmark_mdg;               // the standard deviation of the random effects for finnmark
 
  vector<lower = 0>[T] mu_finnmark_r;                      // Latent for finnmark
  matrix[T, polls] shrunken_polls_finnmark_r;   // Imputed polls finnmark
  real<lower = 0> tau_finnmark_r;               // the standard deviation of the random effects for finnmark
 
  vector<lower = 0>[T] mu_finnmark_a;                      // Latent for finnmark
  matrix[T, polls] shrunken_polls_finnmark_a;   // Imputed polls finnmark
  real<lower = 0> tau_finnmark_a;             // the standard deviation of the random effects for finnmark
 
   //nordland
  vector<lower = 0>[T] mu_nordland_ap;                      // Latent for nordland Ap
  matrix[T, polls2] shrunken_polls_nordland_ap;   // Imputed polls nordland Ap
  real<lower = 0> tau_nordland_ap;               // the standard deviation of the random effects for nordland ap
  
  vector<lower = 0>[T] mu_nordland_h;                      // Latent for nordland H
  matrix[T, polls2] shrunken_polls_nordland_h;   // Imputed polls nordland H
  real<lower = 0> tau_nordland_h;               // the standard deviation of the random effects for nordland h
  
  vector<lower = 0>[T] mu_nordland_frp;                      // Latent for nordland frp
  matrix[T, polls2] shrunken_polls_nordland_frp;   // Imputed polls nordland frp
  real<lower = 0> tau_nordland_frp;               // the standard deviation of the random effects for nordland frp
 
  vector<lower = 0>[T] mu_nordland_sv;                      // Latent for nordland
  matrix[T, polls2] shrunken_polls_nordland_sv;   // Imputed polls nordland
  real<lower = 0> tau_nordland_sv;               // the standard deviation of the random effects for nordland
 
  vector<lower = 0>[T] mu_nordland_sp;                      // Latent for nordland
  matrix[T, polls2] shrunken_polls_nordland_sp;   // Imputed polls nordland
  real<lower = 0> tau_nordland_sp;               // the standard deviation of the random effects for nordland
 
  vector<lower = 0>[T] mu_nordland_krf;                      // Latent for nordland
  matrix[T, polls2] shrunken_polls_nordland_krf;   // Imputed polls nordland
  real<lower = 0> tau_nordland_krf;               // the standard deviation of the random effects for nordland
 
  vector<lower = 0>[T] mu_nordland_v;                      // Latent for nordland
  matrix[T, polls2] shrunken_polls_nordland_v;   // Imputed polls nordland
  real<lower = 0> tau_nordland_v;               // the standard deviation of the random effects for nordland
 
  vector<lower = 0>[T] mu_nordland_mdg;                      // Latent for nordland
  matrix[T, polls2] shrunken_polls_nordland_mdg;   // Imputed polls nordland
  real<lower = 0> tau_nordland_mdg;               // the standard deviation of the random effects for nordland
 
  vector<lower = 0>[T] mu_nordland_r;                      // Latent for nordland
  matrix[T, polls2] shrunken_polls_nordland_r;   // Imputed polls nordland
  real<lower = 0> tau_nordland_r;               // the standard deviation of the random effects for nordland
 
  vector<lower = 0>[T] mu_nordland_a;                      // Latent for nordland
  matrix[T, polls2] shrunken_polls_nordland_a;   // Imputed polls nordland
  real<lower = 0> tau_nordland_a;             // the standard deviation of the random effects for nordland
  
  
  //troms
  vector<lower = 0>[T] mu_troms_ap;                      // Latent for troms Ap
  matrix[T, polls] shrunken_polls_troms_ap;   // Imputed polls troms Ap
  real<lower = 0> tau_troms_ap;               // the standard deviation of the random effects for troms ap
  
  vector<lower = 0>[T] mu_troms_h;                      // Latent for troms H
  matrix[T, polls] shrunken_polls_troms_h;   // Imputed polls troms H
  real<lower = 0> tau_troms_h;               // the standard deviation of the random effects for troms h
  
  vector<lower = 0>[T] mu_troms_frp;                      // Latent for troms frp
  matrix[T, polls] shrunken_polls_troms_frp;   // Imputed polls troms frp
  real<lower = 0> tau_troms_frp;               // the standard deviation of the random effects for troms frp
 
  vector<lower = 0>[T] mu_troms_sv;                      // Latent for troms
  matrix[T, polls] shrunken_polls_troms_sv;   // Imputed polls troms
  real<lower = 0> tau_troms_sv;               // the standard deviation of the random effects for troms
 
  vector<lower = 0>[T] mu_troms_sp;                      // Latent for troms
  matrix[T, polls] shrunken_polls_troms_sp;   // Imputed polls troms
  real<lower = 0> tau_troms_sp;               // the standard deviation of the random effects for troms
 
  vector<lower = 0>[T] mu_troms_krf;                      // Latent for troms
  matrix[T, polls] shrunken_polls_troms_krf;   // Imputed polls troms
  real<lower = 0> tau_troms_krf;               // the standard deviation of the random effects for troms
 
  vector<lower = 0>[T] mu_troms_v;                      // Latent for troms
  matrix[T, polls] shrunken_polls_troms_v;   // Imputed polls troms
  real<lower = 0> tau_troms_v;               // the standard deviation of the random effects for troms
 
  vector<lower = 0>[T] mu_troms_mdg;                      // Latent for troms
  matrix[T, polls] shrunken_polls_troms_mdg;   // Imputed polls troms
  real<lower = 0> tau_troms_mdg;               // the standard deviation of the random effects for troms
 
  vector<lower = 0>[T] mu_troms_r;                      // Latent for troms
  matrix[T, polls] shrunken_polls_troms_r;   // Imputed polls troms
  real<lower = 0> tau_troms_r;               // the standard deviation of the random effects for troms
 
  vector<lower = 0>[T] mu_troms_a;                      // Latent for troms
  matrix[T, polls] shrunken_polls_troms_a;   // Imputed polls troms
  real<lower = 0> tau_troms_a;             // the standard deviation of the random effects for troms
 

   //telemark
  vector<lower = 0>[T] mu_telemark_ap;                      // Latent for telemark Ap
  matrix[T, polls] shrunken_polls_telemark_ap;   // Imputed polls telemark Ap
  real<lower = 0> tau_telemark_ap;               // the standard deviation of the random effects for telemark ap
  
  vector<lower = 0>[T] mu_telemark_h;                      // Latent for telemark H
  matrix[T, polls] shrunken_polls_telemark_h;   // Imputed polls telemark H
  real<lower = 0> tau_telemark_h;               // the standard deviation of the random effects for telemark h
  
  vector<lower = 0>[T] mu_telemark_frp;                      // Latent for telemark frp
  matrix[T, polls] shrunken_polls_telemark_frp;   // Imputed polls telemark frp
  real<lower = 0> tau_telemark_frp;               // the standard deviation of the random effects for telemark frp
 
  vector<lower = 0>[T] mu_telemark_sv;                      // Latent for telemark
  matrix[T, polls] shrunken_polls_telemark_sv;   // Imputed polls telemark
  real<lower = 0> tau_telemark_sv;               // the standard deviation of the random effects for telemark
 
  vector<lower = 0>[T] mu_telemark_sp;                      // Latent for telemark
  matrix[T, polls] shrunken_polls_telemark_sp;   // Imputed polls telemark
  real<lower = 0> tau_telemark_sp;               // the standard deviation of the random effects for telemark
 
  vector<lower = 0>[T] mu_telemark_krf;                      // Latent for telemark
  matrix[T, polls] shrunken_polls_telemark_krf;   // Imputed polls telemark
  real<lower = 0> tau_telemark_krf;               // the standard deviation of the random effects for telemark
 
  vector<lower = 0>[T] mu_telemark_v;                      // Latent for telemark
  matrix[T, polls] shrunken_polls_telemark_v;   // Imputed polls telemark
  real<lower = 0> tau_telemark_v;               // the standard deviation of the random effects for telemark
 
  vector<lower = 0>[T] mu_telemark_mdg;                      // Latent for telemark
  matrix[T, polls] shrunken_polls_telemark_mdg;   // Imputed polls telemark
  real<lower = 0> tau_telemark_mdg;               // the standard deviation of the random effects for telemark
 
  vector<lower = 0>[T] mu_telemark_r;                      // Latent for telemark
  matrix[T, polls] shrunken_polls_telemark_r;   // Imputed polls telemark
  real<lower = 0> tau_telemark_r;               // the standard deviation of the random effects for telemark
 
  vector<lower = 0>[T] mu_telemark_a;                      // Latent for telemark
  matrix[T, polls] shrunken_polls_telemark_a;   // Imputed polls telemark
  real<lower = 0> tau_telemark_a;             // the standard deviation of the random effects for telemark
 


  //oppland
  vector<lower = 0>[T] mu_oppland_ap;                      // Latent for oppland Ap
  matrix[T, polls] shrunken_polls_oppland_ap;   // Imputed polls oppland Ap
  real<lower = 0> tau_oppland_ap;               // the standard deviation of the random effects for oppland ap
  
  vector<lower = 0>[T] mu_oppland_h;                      // Latent for oppland H
  matrix[T, polls] shrunken_polls_oppland_h;   // Imputed polls oppland H
  real<lower = 0> tau_oppland_h;               // the standard deviation of the random effects for oppland h
  
  vector<lower = 0>[T] mu_oppland_frp;                      // Latent for oppland frp
  matrix[T, polls] shrunken_polls_oppland_frp;   // Imputed polls oppland frp
  real<lower = 0> tau_oppland_frp;               // the standard deviation of the random effects for oppland frp
 
  vector<lower = 0>[T] mu_oppland_sv;                      // Latent for oppland
  matrix[T, polls] shrunken_polls_oppland_sv;   // Imputed polls oppland
  real<lower = 0> tau_oppland_sv;               // the standard deviation of the random effects for oppland
 
  vector<lower = 0>[T] mu_oppland_sp;                      // Latent for oppland
  matrix[T, polls] shrunken_polls_oppland_sp;   // Imputed polls oppland
  real<lower = 0> tau_oppland_sp;               // the standard deviation of the random effects for oppland
 
  vector<lower = 0>[T] mu_oppland_krf;                      // Latent for oppland
  matrix[T, polls] shrunken_polls_oppland_krf;   // Imputed polls oppland
  real<lower = 0> tau_oppland_krf;               // the standard deviation of the random effects for oppland
 
  vector<lower = 0>[T] mu_oppland_v;                      // Latent for oppland
  matrix[T, polls] shrunken_polls_oppland_v;   // Imputed polls oppland
  real<lower = 0> tau_oppland_v;               // the standard deviation of the random effects for oppland
 
  vector<lower = 0>[T] mu_oppland_mdg;                      // Latent for oppland
  matrix[T, polls] shrunken_polls_oppland_mdg;   // Imputed polls oppland
  real<lower = 0> tau_oppland_mdg;               // the standard deviation of the random effects for oppland
 
  vector<lower = 0>[T] mu_oppland_r;                      // Latent for oppland
  matrix[T, polls] shrunken_polls_oppland_r;   // Imputed polls oppland
  real<lower = 0> tau_oppland_r;               // the standard deviation of the random effects for oppland
 
  vector<lower = 0>[T] mu_oppland_a;                      // Latent for oppland
  matrix[T, polls] shrunken_polls_oppland_a;   // Imputed polls oppland
  real<lower = 0> tau_oppland_a;             // the standard deviation of the random effects for oppland
 
 
  //buskerud
  vector<lower = 0>[T] mu_buskerud_ap;                      // Latent for buskerud Ap
  matrix[T, polls] shrunken_polls_buskerud_ap;   // Imputed polls buskerud Ap
  real<lower = 0> tau_buskerud_ap;               // the standard deviation of the random effects for buskerud ap
  
  vector<lower = 0>[T] mu_buskerud_h;                      // Latent for buskerud H
  matrix[T, polls] shrunken_polls_buskerud_h;   // Imputed polls buskerud H
  real<lower = 0> tau_buskerud_h;               // the standard deviation of the random effects for buskerud h
  
  vector<lower = 0>[T] mu_buskerud_frp;                      // Latent for buskerud frp
  matrix[T, polls] shrunken_polls_buskerud_frp;   // Imputed polls buskerud frp
  real<lower = 0> tau_buskerud_frp;               // the standard deviation of the random effects for buskerud frp
 
  vector<lower = 0>[T] mu_buskerud_sv;                      // Latent for buskerud
  matrix[T, polls] shrunken_polls_buskerud_sv;   // Imputed polls buskerud
  real<lower = 0> tau_buskerud_sv;               // the standard deviation of the random effects for buskerud
 
  vector<lower = 0>[T] mu_buskerud_sp;                      // Latent for buskerud
  matrix[T, polls] shrunken_polls_buskerud_sp;   // Imputed polls buskerud
  real<lower = 0> tau_buskerud_sp;               // the standard deviation of the random effects for buskerud
 
  vector<lower = 0>[T] mu_buskerud_krf;                      // Latent for buskerud
  matrix[T, polls] shrunken_polls_buskerud_krf;   // Imputed polls buskerud
  real<lower = 0> tau_buskerud_krf;               // the standard deviation of the random effects for buskerud
 
  vector<lower = 0>[T] mu_buskerud_v;                      // Latent for buskerud
  matrix[T, polls] shrunken_polls_buskerud_v;   // Imputed polls buskerud
  real<lower = 0> tau_buskerud_v;               // the standard deviation of the random effects for buskerud
 
  vector<lower = 0>[T] mu_buskerud_mdg;                      // Latent for buskerud
  matrix[T, polls] shrunken_polls_buskerud_mdg;   // Imputed polls buskerud
  real<lower = 0> tau_buskerud_mdg;               // the standard deviation of the random effects for buskerud
 
  vector<lower = 0>[T] mu_buskerud_r;                      // Latent for buskerud
  matrix[T, polls] shrunken_polls_buskerud_r;   // Imputed polls buskerud
  real<lower = 0> tau_buskerud_r;               // the standard deviation of the random effects for buskerud
 
  vector<lower = 0>[T] mu_buskerud_a;                      // Latent for buskerud
  matrix[T, polls] shrunken_polls_buskerud_a;   // Imputed polls buskerud
  real<lower = 0> tau_buskerud_a;             // the standard deviation of the random effects for buskerud
 

   
  //hordaland
  vector<lower = 0>[T] mu_hordaland_ap;                      // Latent for hordaland Ap
  matrix[T, polls] shrunken_polls_hordaland_ap;   // Imputed polls hordaland Ap
  real<lower = 0> tau_hordaland_ap;               // the standard deviation of the random effects for hordaland ap
  
  vector<lower = 0>[T] mu_hordaland_h;                      // Latent for hordaland H
  matrix[T, polls] shrunken_polls_hordaland_h;   // Imputed polls hordaland H
  real<lower = 0> tau_hordaland_h;               // the standard deviation of the random effects for hordaland h
  
  vector<lower = 0>[T] mu_hordaland_frp;                      // Latent for hordaland frp
  matrix[T, polls] shrunken_polls_hordaland_frp;   // Imputed polls hordaland frp
  real<lower = 0> tau_hordaland_frp;               // the standard deviation of the random effects for hordaland frp
 
  vector<lower = 0>[T] mu_hordaland_sv;                      // Latent for hordaland
  matrix[T, polls] shrunken_polls_hordaland_sv;   // Imputed polls hordaland
  real<lower = 0> tau_hordaland_sv;               // the standard deviation of the random effects for hordaland
 
  vector<lower = 0>[T] mu_hordaland_sp;                      // Latent for hordaland
  matrix[T, polls] shrunken_polls_hordaland_sp;   // Imputed polls hordaland
  real<lower = 0> tau_hordaland_sp;               // the standard deviation of the random effects for hordaland
 
  vector<lower = 0>[T] mu_hordaland_krf;                      // Latent for hordaland
  matrix[T, polls] shrunken_polls_hordaland_krf;   // Imputed polls hordaland
  real<lower = 0> tau_hordaland_krf;               // the standard deviation of the random effects for hordaland
 
  vector<lower = 0>[T] mu_hordaland_v;                      // Latent for hordaland
  matrix[T, polls] shrunken_polls_hordaland_v;   // Imputed polls hordaland
  real<lower = 0> tau_hordaland_v;               // the standard deviation of the random effects for hordaland
 
  vector<lower = 0>[T] mu_hordaland_mdg;                      // Latent for hordaland
  matrix[T, polls] shrunken_polls_hordaland_mdg;   // Imputed polls hordaland
  real<lower = 0> tau_hordaland_mdg;               // the standard deviation of the random effects for hordaland
 
  vector<lower = 0>[T] mu_hordaland_r;                      // Latent for hordaland
  matrix[T, polls] shrunken_polls_hordaland_r;   // Imputed polls hordaland
  real<lower = 0> tau_hordaland_r;               // the standard deviation of the random effects for hordaland
 
  vector<lower = 0>[T] mu_hordaland_a;                      // Latent for hordaland
  matrix[T, polls] shrunken_polls_hordaland_a;   // Imputed polls hordaland
  real<lower = 0> tau_hordaland_a;             // the standard deviation of the random effects for hordaland
 
 
   //sogn
  vector<lower = 0>[T] mu_sogn_ap;                      // Latent for sogn Ap
  matrix[T, polls] shrunken_polls_sogn_ap;   // Imputed polls sogn Ap
  real<lower = 0> tau_sogn_ap;               // the standard deviation of the random effects for sogn ap
  
  vector<lower = 0>[T] mu_sogn_h;                      // Latent for sogn H
  matrix[T, polls] shrunken_polls_sogn_h;   // Imputed polls sogn H
  real<lower = 0> tau_sogn_h;               // the standard deviation of the random effects for sogn h
  
  vector<lower = 0>[T] mu_sogn_frp;                      // Latent for sogn frp
  matrix[T, polls] shrunken_polls_sogn_frp;   // Imputed polls sogn frp
  real<lower = 0> tau_sogn_frp;               // the standard deviation of the random effects for sogn frp
 
  vector<lower = 0>[T] mu_sogn_sv;                      // Latent for sogn
  matrix[T, polls] shrunken_polls_sogn_sv;   // Imputed polls sogn
  real<lower = 0> tau_sogn_sv;               // the standard deviation of the random effects for sogn
 
  vector<lower = 0>[T] mu_sogn_sp;                      // Latent for sogn
  matrix[T, polls] shrunken_polls_sogn_sp;   // Imputed polls sogn
  real<lower = 0> tau_sogn_sp;               // the standard deviation of the random effects for sogn
 
  vector<lower = 0>[T] mu_sogn_krf;                      // Latent for sogn
  matrix[T, polls] shrunken_polls_sogn_krf;   // Imputed polls sogn
  real<lower = 0> tau_sogn_krf;               // the standard deviation of the random effects for sogn
 
  vector<lower = 0>[T] mu_sogn_v;                      // Latent for sogn
  matrix[T, polls] shrunken_polls_sogn_v;   // Imputed polls sogn
  real<lower = 0> tau_sogn_v;               // the standard deviation of the random effects for sogn
 
  vector<lower = 0>[T] mu_sogn_mdg;                      // Latent for sogn
  matrix[T, polls] shrunken_polls_sogn_mdg;   // Imputed polls sogn
  real<lower = 0> tau_sogn_mdg;               // the standard deviation of the random effects for sogn
 
  vector<lower = 0>[T] mu_sogn_r;                      // Latent for sogn
  matrix[T, polls] shrunken_polls_sogn_r;   // Imputed polls sogn
  real<lower = 0> tau_sogn_r;               // the standard deviation of the random effects for sogn
 
  vector<lower = 0>[T] mu_sogn_a;                      // Latent for sogn
  matrix[T, polls] shrunken_polls_sogn_a;   // Imputed polls sogn
  real<lower = 0> tau_sogn_a;             // the standard deviation of the random effects for sogn
 
 
  //austagder
  vector<lower = 0>[T] mu_austagder_ap;                      // Latent for austagder Ap
  matrix[T, polls] shrunken_polls_austagder_ap;   // Imputed polls austagder Ap
  real<lower = 0> tau_austagder_ap;               // the standard deviation of the random effects for austagder ap
  
  vector<lower = 0>[T] mu_austagder_h;                      // Latent for austagder H
  matrix[T, polls] shrunken_polls_austagder_h;   // Imputed polls austagder H
  real<lower = 0> tau_austagder_h;               // the standard deviation of the random effects for austagder h
  
  vector<lower = 0>[T] mu_austagder_frp;                      // Latent for austagder frp
  matrix[T, polls] shrunken_polls_austagder_frp;   // Imputed polls austagder frp
  real<lower = 0> tau_austagder_frp;               // the standard deviation of the random effects for austagder frp
 
  vector<lower = 0>[T] mu_austagder_sv;                      // Latent for austagder
  matrix[T, polls] shrunken_polls_austagder_sv;   // Imputed polls austagder
  real<lower = 0> tau_austagder_sv;               // the standard deviation of the random effects for austagder
 
  vector<lower = 0>[T] mu_austagder_sp;                      // Latent for austagder
  matrix[T, polls] shrunken_polls_austagder_sp;   // Imputed polls austagder
  real<lower = 0> tau_austagder_sp;               // the standard deviation of the random effects for austagder
 
  vector<lower = 0>[T] mu_austagder_krf;                      // Latent for austagder
  matrix[T, polls] shrunken_polls_austagder_krf;   // Imputed polls austagder
  real<lower = 0> tau_austagder_krf;               // the standard deviation of the random effects for austagder
 
  vector<lower = 0>[T] mu_austagder_v;                      // Latent for austagder
  matrix[T, polls] shrunken_polls_austagder_v;   // Imputed polls austagder
  real<lower = 0> tau_austagder_v;               // the standard deviation of the random effects for austagder
 
  vector<lower = 0>[T] mu_austagder_mdg;                      // Latent for austagder
  matrix[T, polls] shrunken_polls_austagder_mdg;   // Imputed polls austagder
  real<lower = 0> tau_austagder_mdg;               // the standard deviation of the random effects for austagder
 
  vector<lower = 0>[T] mu_austagder_r;                      // Latent for austagder
  matrix[T, polls] shrunken_polls_austagder_r;   // Imputed polls austagder
  real<lower = 0> tau_austagder_r;               // the standard deviation of the random effects for austagder
 
  vector<lower = 0>[T] mu_austagder_a;                      // Latent for austagder
  matrix[T, polls] shrunken_polls_austagder_a;   // Imputed polls austagder
  real<lower = 0> tau_austagder_a;             // the standard deviation of the random effects for austagder
 
 //vestagder
  vector<lower = 0>[T] mu_vestagder_ap;                      // Latent for vestagder Ap
  matrix[T, polls] shrunken_polls_vestagder_ap;   // Imputed polls vestagder Ap
  real<lower = 0> tau_vestagder_ap;               // the standard deviation of the random effects for vestagder ap
  
  vector<lower = 0>[T] mu_vestagder_h;                      // Latent for vestagder H
  matrix[T, polls] shrunken_polls_vestagder_h;   // Imputed polls vestagder H
  real<lower = 0> tau_vestagder_h;               // the standard deviation of the random effects for vestagder h
  
  vector<lower = 0>[T] mu_vestagder_frp;                      // Latent for vestagder frp
  matrix[T, polls] shrunken_polls_vestagder_frp;   // Imputed polls vestagder frp
  real<lower = 0> tau_vestagder_frp;               // the standard deviation of the random effects for vestagder frp
 
  vector<lower = 0>[T] mu_vestagder_sv;                      // Latent for vestagder
  matrix[T, polls] shrunken_polls_vestagder_sv;   // Imputed polls vestagder
  real<lower = 0> tau_vestagder_sv;               // the standard deviation of the random effects for vestagder
 
  vector<lower = 0>[T] mu_vestagder_sp;                      // Latent for vestagder
  matrix[T, polls] shrunken_polls_vestagder_sp;   // Imputed polls vestagder
  real<lower = 0> tau_vestagder_sp;               // the standard deviation of the random effects for vestagder
 
  vector<lower = 0>[T] mu_vestagder_krf;                      // Latent for vestagder
  matrix[T, polls] shrunken_polls_vestagder_krf;   // Imputed polls vestagder
  real<lower = 0> tau_vestagder_krf;               // the standard deviation of the random effects for vestagder
 
  vector<lower = 0>[T] mu_vestagder_v;                      // Latent for vestagder
  matrix[T, polls] shrunken_polls_vestagder_v;   // Imputed polls vestagder
  real<lower = 0> tau_vestagder_v;               // the standard deviation of the random effects for vestagder
 
  vector<lower = 0>[T] mu_vestagder_mdg;                      // Latent for vestagder
  matrix[T, polls] shrunken_polls_vestagder_mdg;   // Imputed polls vestagder
  real<lower = 0> tau_vestagder_mdg;               // the standard deviation of the random effects for vestagder
 
  vector<lower = 0>[T] mu_vestagder_r;                      // Latent for vestagder
  matrix[T, polls] shrunken_polls_vestagder_r;   // Imputed polls vestagder
  real<lower = 0> tau_vestagder_r;               // the standard deviation of the random effects for vestagder
 
  vector<lower = 0>[T] mu_vestagder_a;                      // Latent for vestagder
  matrix[T, polls] shrunken_polls_vestagder_a;   // Imputed polls vestagder
  real<lower = 0> tau_vestagder_a;             // the standard deviation of the random effects for vestagder
 

 
  //rogaland
  vector<lower = 0>[T] mu_rogaland_ap;                      // Latent for rogaland Ap
  matrix[T, polls] shrunken_polls_rogaland_ap;   // Imputed polls rogaland Ap
  real<lower = 0> tau_rogaland_ap;               // the standard deviation of the random effects for rogaland ap
  
  vector<lower = 0>[T] mu_rogaland_h;                      // Latent for rogaland H
  matrix[T, polls] shrunken_polls_rogaland_h;   // Imputed polls rogaland H
  real<lower = 0> tau_rogaland_h;               // the standard deviation of the random effects for rogaland h
  
  vector<lower = 0>[T] mu_rogaland_frp;                      // Latent for rogaland frp
  matrix[T, polls] shrunken_polls_rogaland_frp;   // Imputed polls rogaland frp
  real<lower = 0> tau_rogaland_frp;               // the standard deviation of the random effects for rogaland frp
 
  vector<lower = 0>[T] mu_rogaland_sv;                      // Latent for rogaland
  matrix[T, polls] shrunken_polls_rogaland_sv;   // Imputed polls rogaland
  real<lower = 0> tau_rogaland_sv;               // the standard deviation of the random effects for rogaland
 
  vector<lower = 0>[T] mu_rogaland_sp;                      // Latent for rogaland
  matrix[T, polls] shrunken_polls_rogaland_sp;   // Imputed polls rogaland
  real<lower = 0> tau_rogaland_sp;               // the standard deviation of the random effects for rogaland
 
  vector<lower = 0>[T] mu_rogaland_krf;                      // Latent for rogaland
  matrix[T, polls] shrunken_polls_rogaland_krf;   // Imputed polls rogaland
  real<lower = 0> tau_rogaland_krf;               // the standard deviation of the random effects for rogaland
 
  vector<lower = 0>[T] mu_rogaland_v;                      // Latent for rogaland
  matrix[T, polls] shrunken_polls_rogaland_v;   // Imputed polls rogaland
  real<lower = 0> tau_rogaland_v;               // the standard deviation of the random effects for rogaland
 
  vector<lower = 0>[T] mu_rogaland_mdg;                      // Latent for rogaland
  matrix[T, polls] shrunken_polls_rogaland_mdg;   // Imputed polls rogaland
  real<lower = 0> tau_rogaland_mdg;               // the standard deviation of the random effects for rogaland
 
  vector<lower = 0>[T] mu_rogaland_r;                      // Latent for rogaland
  matrix[T, polls] shrunken_polls_rogaland_r;   // Imputed polls rogaland
  real<lower = 0> tau_rogaland_r;               // the standard deviation of the random effects for rogaland
 
  vector<lower = 0>[T] mu_rogaland_a;                      // Latent for rogaland
  matrix[T, polls] shrunken_polls_rogaland_a;   // Imputed polls rogaland
  real<lower = 0> tau_rogaland_a;             // the standard deviation of the random effects for rogaland
 
 
 //trondelag
  vector<lower = 0>[T] mu_nordtrondelag_ap;                      // Latent for trondelag Ap
  matrix[T, polls2] shrunken_polls_nordtrondelag_ap;   // Imputed polls trondelag Ap
  real<lower = 0> tau_nordtrondelag_ap;               // the standard deviation of the random effects for trondelag ap
  
  vector<lower = 0>[T] mu_nordtrondelag_h;                      // Latent for trondelag H
  matrix[T, polls2] shrunken_polls_nordtrondelag_h;   // Imputed polls trondelag H
  real<lower = 0> tau_nordtrondelag_h;               // the standard deviation of the random effects for trondelag h
  
  vector<lower = 0>[T] mu_nordtrondelag_frp;                      // Latent for trondelag frp
  matrix[T, polls2] shrunken_polls_nordtrondelag_frp;   // Imputed polls trondelag frp
  real<lower = 0> tau_nordtrondelag_frp;               // the standard deviation of the random effects for trondelag frp
 
  vector<lower = 0>[T] mu_nordtrondelag_sv;                      // Latent for trondelag
  matrix[T, polls2] shrunken_polls_nordtrondelag_sv;   // Imputed polls trondelag
  real<lower = 0> tau_nordtrondelag_sv;               // the standard deviation of the random effects for trondelag
 
  vector<lower = 0>[T] mu_nordtrondelag_sp;                      // Latent for trondelag
  matrix[T, polls2] shrunken_polls_nordtrondelag_sp;   // Imputed polls trondelag
  real<lower = 0> tau_nordtrondelag_sp;               // the standard deviation of the random effects for trondelag
 
  vector<lower = 0>[T] mu_nordtrondelag_krf;                      // Latent for trondelag
  matrix[T, polls2] shrunken_polls_nordtrondelag_krf;   // Imputed polls trondelag
  real<lower = 0> tau_nordtrondelag_krf;               // the standard deviation of the random effects for trondelag
 
  vector<lower = 0>[T] mu_nordtrondelag_v;                      // Latent for trondelag
  matrix[T, polls2] shrunken_polls_nordtrondelag_v;   // Imputed polls trondelag
  real<lower = 0> tau_nordtrondelag_v;               // the standard deviation of the random effects for trondelag
 
  vector<lower = 0>[T] mu_nordtrondelag_mdg;                      // Latent for trondelag
  matrix[T, polls2] shrunken_polls_nordtrondelag_mdg;   // Imputed polls trondelag
  real<lower = 0> tau_nordtrondelag_mdg;               // the standard deviation of the random effects for trondelag
 
  vector<lower = 0>[T] mu_nordtrondelag_r;                      // Latent for trondelag
  matrix[T, polls2] shrunken_polls_nordtrondelag_r;   // Imputed polls trondelag
  real<lower = 0> tau_nordtrondelag_r;               // the standard deviation of the random effects for trondelag
 
  vector<lower = 0>[T] mu_nordtrondelag_a;                      // Latent for trondelag
  matrix[T, polls2] shrunken_polls_nordtrondelag_a;   // Imputed polls trondelag
  real<lower = 0> tau_nordtrondelag_a;             // the standard deviation of the random effects for trondelag
  
  
  //hedmark
  vector<lower = 0>[T] mu_hedmark_ap;                      // Latent for hedmark Ap
  matrix[T, polls] shrunken_polls_hedmark_ap;   // Imputed polls hedmark Ap
  real<lower = 0> tau_hedmark_ap;               // the standard deviation of the random effects for hedmark ap
  
  vector<lower = 0>[T] mu_hedmark_h;                      // Latent for hedmark H
  matrix[T, polls] shrunken_polls_hedmark_h;   // Imputed polls hedmark H
  real<lower = 0> tau_hedmark_h;               // the standard deviation of the random effects for hedmark h
  
  vector<lower = 0>[T] mu_hedmark_frp;                      // Latent for hedmark frp
  matrix[T, polls] shrunken_polls_hedmark_frp;   // Imputed polls hedmark frp
  real<lower = 0> tau_hedmark_frp;               // the standard deviation of the random effects for hedmark frp
 
  vector<lower = 0>[T] mu_hedmark_sv;                      // Latent for hedmark
  matrix[T, polls] shrunken_polls_hedmark_sv;   // Imputed polls hedmark
  real<lower = 0> tau_hedmark_sv;               // the standard deviation of the random effects for hedmark
 
  vector<lower = 0>[T] mu_hedmark_sp;                      // Latent for hedmark
  matrix[T, polls] shrunken_polls_hedmark_sp;   // Imputed polls hedmark
  real<lower = 0> tau_hedmark_sp;               // the standard deviation of the random effects for hedmark
 
  vector<lower = 0>[T] mu_hedmark_krf;                      // Latent for hedmark
  matrix[T, polls] shrunken_polls_hedmark_krf;   // Imputed polls hedmark
  real<lower = 0> tau_hedmark_krf;               // the standard deviation of the random effects for hedmark
 
  vector<lower = 0>[T] mu_hedmark_v;                      // Latent for hedmark
  matrix[T, polls] shrunken_polls_hedmark_v;   // Imputed polls hedmark
  real<lower = 0> tau_hedmark_v;               // the standard deviation of the random effects for hedmark
 
  vector<lower = 0>[T] mu_hedmark_mdg;                      // Latent for hedmark
  matrix[T, polls] shrunken_polls_hedmark_mdg;   // Imputed polls hedmark
  real<lower = 0> tau_hedmark_mdg;               // the standard deviation of the random effects for hedmark
 
  vector<lower = 0>[T] mu_hedmark_r;                      // Latent for hedmark
  matrix[T, polls] shrunken_polls_hedmark_r;   // Imputed polls hedmark
  real<lower = 0> tau_hedmark_r;               // the standard deviation of the random effects for hedmark
 
  vector<lower = 0>[T] mu_hedmark_a;                      // Latent for hedmark
  matrix[T, polls] shrunken_polls_hedmark_a;   // Imputed polls hedmark
  real<lower = 0> tau_hedmark_a;             // the standard deviation of the random effects for hedmark
 
    //ostfold
  vector<lower = 0>[T] mu_ostfold_ap;                      // Latent for ostfold Ap
  matrix[T, polls] shrunken_polls_ostfold_ap;   // Imputed polls ostfold Ap
  real<lower = 0> tau_ostfold_ap;               // the standard deviation of the random effects for ostfold ap
  
  vector<lower = 0>[T] mu_ostfold_h;                      // Latent for ostfold H
  matrix[T, polls] shrunken_polls_ostfold_h;   // Imputed polls ostfold H
  real<lower = 0> tau_ostfold_h;               // the standard deviation of the random effects for ostfold h
  
  vector<lower = 0>[T] mu_ostfold_frp;                      // Latent for ostfold frp
  matrix[T, polls] shrunken_polls_ostfold_frp;   // Imputed polls ostfold frp
  real<lower = 0> tau_ostfold_frp;               // the standard deviation of the random effects for ostfold frp
 
  vector<lower = 0>[T] mu_ostfold_sv;                      // Latent for ostfold
  matrix[T, polls] shrunken_polls_ostfold_sv;   // Imputed polls ostfold
  real<lower = 0> tau_ostfold_sv;               // the standard deviation of the random effects for ostfold
 
  vector<lower = 0>[T] mu_ostfold_sp;                      // Latent for ostfold
  matrix[T, polls] shrunken_polls_ostfold_sp;   // Imputed polls ostfold
  real<lower = 0> tau_ostfold_sp;               // the standard deviation of the random effects for ostfold
 
  vector<lower = 0>[T] mu_ostfold_krf;                      // Latent for ostfold
  matrix[T, polls] shrunken_polls_ostfold_krf;   // Imputed polls ostfold
  real<lower = 0> tau_ostfold_krf;               // the standard deviation of the random effects for ostfold
 
  vector<lower = 0>[T] mu_ostfold_v;                      // Latent for ostfold
  matrix[T, polls] shrunken_polls_ostfold_v;   // Imputed polls ostfold
  real<lower = 0> tau_ostfold_v;               // the standard deviation of the random effects for ostfold
 
  vector<lower = 0>[T] mu_ostfold_mdg;                      // Latent for ostfold
  matrix[T, polls] shrunken_polls_ostfold_mdg;   // Imputed polls ostfold
  real<lower = 0> tau_ostfold_mdg;               // the standard deviation of the random effects for ostfold
 
  vector<lower = 0>[T] mu_ostfold_r;                      // Latent for ostfold
  matrix[T, polls] shrunken_polls_ostfold_r;   // Imputed polls ostfold
  real<lower = 0> tau_ostfold_r;               // the standard deviation of the random effects for ostfold
 
  vector<lower = 0>[T] mu_ostfold_a;                      // Latent for ostfold
  matrix[T, polls] shrunken_polls_ostfold_a;   // Imputed polls ostfold
  real<lower = 0> tau_ostfold_a;             // the standard deviation of the random effects for ostfold
 
    
  //romsdal
  vector<lower = 0>[T] mu_romsdal_ap;                      // Latent for romsdal Ap
  matrix[T, polls] shrunken_polls_romsdal_ap;   // Imputed polls romsdal Ap
  real<lower = 0> tau_romsdal_ap;               // the standard deviation of the random effects for romsdal ap
  
  vector<lower = 0>[T] mu_romsdal_h;                      // Latent for romsdal H
  matrix[T, polls] shrunken_polls_romsdal_h;   // Imputed polls romsdal H
  real<lower = 0> tau_romsdal_h;               // the standard deviation of the random effects for romsdal h
  
  vector<lower = 0>[T] mu_romsdal_frp;                      // Latent for romsdal frp
  matrix[T, polls] shrunken_polls_romsdal_frp;   // Imputed polls romsdal frp
  real<lower = 0> tau_romsdal_frp;               // the standard deviation of the random effects for romsdal frp
 
  vector<lower = 0>[T] mu_romsdal_sv;                      // Latent for romsdal
  matrix[T, polls] shrunken_polls_romsdal_sv;   // Imputed polls romsdal
  real<lower = 0> tau_romsdal_sv;               // the standard deviation of the random effects for romsdal
 
  vector<lower = 0>[T] mu_romsdal_sp;                      // Latent for romsdal
  matrix[T, polls] shrunken_polls_romsdal_sp;   // Imputed polls romsdal
  real<lower = 0> tau_romsdal_sp;               // the standard deviation of the random effects for romsdal
 
  vector<lower = 0>[T] mu_romsdal_krf;                      // Latent for romsdal
  matrix[T, polls] shrunken_polls_romsdal_krf;   // Imputed polls romsdal
  real<lower = 0> tau_romsdal_krf;               // the standard deviation of the random effects for romsdal
 
  vector<lower = 0>[T] mu_romsdal_v;                      // Latent for romsdal
  matrix[T, polls] shrunken_polls_romsdal_v;   // Imputed polls romsdal
  real<lower = 0> tau_romsdal_v;               // the standard deviation of the random effects for romsdal
 
  vector<lower = 0>[T] mu_romsdal_mdg;                      // Latent for romsdal
  matrix[T, polls] shrunken_polls_romsdal_mdg;   // Imputed polls romsdal
  real<lower = 0> tau_romsdal_mdg;               // the standard deviation of the random effects for romsdal
 
  vector<lower = 0>[T] mu_romsdal_r;                      // Latent for romsdal
  matrix[T, polls] shrunken_polls_romsdal_r;   // Imputed polls romsdal
  real<lower = 0> tau_romsdal_r;               // the standard deviation of the random effects for romsdal
 
  vector<lower = 0>[T] mu_romsdal_a;                      // Latent for romsdal
  matrix[T, polls] shrunken_polls_romsdal_a;   // Imputed polls romsdal
  real<lower = 0> tau_romsdal_a;             // the standard deviation of the random effects for romsdal
 
   //sortrondelag
  vector<lower = 0>[T] mu_sortrondelag_ap;                      // Latent for sortrondelag Ap
  matrix[T, polls] shrunken_polls_sortrondelag_ap;   // Imputed polls sortrondelag Ap
  real<lower = 0> tau_sortrondelag_ap;               // the standard deviation of the random effects for sortrondelag ap
  
  vector<lower = 0>[T] mu_sortrondelag_h;                      // Latent for sortrondelag H
  matrix[T, polls] shrunken_polls_sortrondelag_h;   // Imputed polls sortrondelag H
  real<lower = 0> tau_sortrondelag_h;               // the standard deviation of the random effects for sortrondelag h
  
  vector<lower = 0>[T] mu_sortrondelag_frp;                      // Latent for sortrondelag frp
  matrix[T, polls] shrunken_polls_sortrondelag_frp;   // Imputed polls sortrondelag frp
  real<lower = 0> tau_sortrondelag_frp;               // the standard deviation of the random effects for sortrondelag frp
 
  vector<lower = 0>[T] mu_sortrondelag_sv;                      // Latent for sortrondelag
  matrix[T, polls] shrunken_polls_sortrondelag_sv;   // Imputed polls sortrondelag
  real<lower = 0> tau_sortrondelag_sv;               // the standard deviation of the random effects for sortrondelag
 
  vector<lower = 0>[T] mu_sortrondelag_sp;                      // Latent for sortrondelag
  matrix[T, polls] shrunken_polls_sortrondelag_sp;   // Imputed polls sortrondelag
  real<lower = 0> tau_sortrondelag_sp;               // the standard deviation of the random effects for sortrondelag
 
  vector<lower = 0>[T] mu_sortrondelag_krf;                      // Latent for sortrondelag
  matrix[T, polls] shrunken_polls_sortrondelag_krf;   // Imputed polls sortrondelag
  real<lower = 0> tau_sortrondelag_krf;               // the standard deviation of the random effects for sortrondelag
 
  vector<lower = 0>[T] mu_sortrondelag_v;                      // Latent for sortrondelag
  matrix[T, polls] shrunken_polls_sortrondelag_v;   // Imputed polls sortrondelag
  real<lower = 0> tau_sortrondelag_v;               // the standard deviation of the random effects for sortrondelag
 
  vector<lower = 0>[T] mu_sortrondelag_mdg;                      // Latent for sortrondelag
  matrix[T, polls] shrunken_polls_sortrondelag_mdg;   // Imputed polls sortrondelag
  real<lower = 0> tau_sortrondelag_mdg;               // the standard deviation of the random effects for sortrondelag
 
  vector<lower = 0>[T] mu_sortrondelag_r;                      // Latent for sortrondelag
  matrix[T, polls] shrunken_polls_sortrondelag_r;   // Imputed polls sortrondelag
  real<lower = 0> tau_sortrondelag_r;               // the standard deviation of the random effects for sortrondelag
 
  vector<lower = 0>[T] mu_sortrondelag_a;                      // Latent for sortrondelag
  matrix[T, polls] shrunken_polls_sortrondelag_a;   // Imputed polls sortrondelag
  real<lower = 0> tau_sortrondelag_a;             // the standard deviation of the random effects for sortrondelag
 
 
  //vestfold
  vector<lower = 0>[T] mu_vestfold_ap;                      // Latent for vestfold Ap
  matrix[T, polls] shrunken_polls_vestfold_ap;   // Imputed polls vestfold Ap
  real<lower = 0> tau_vestfold_ap;               // the standard deviation of the random effects for vestfold ap
  
  vector<lower = 0>[T] mu_vestfold_h;                      // Latent for vestfold H
  matrix[T, polls] shrunken_polls_vestfold_h;   // Imputed polls vestfold H
  real<lower = 0> tau_vestfold_h;               // the standard deviation of the random effects for vestfold h
  
  vector<lower = 0>[T] mu_vestfold_frp;                      // Latent for vestfold frp
  matrix[T, polls] shrunken_polls_vestfold_frp;   // Imputed polls vestfold frp
  real<lower = 0> tau_vestfold_frp;               // the standard deviation of the random effects for vestfold frp
 
  vector<lower = 0>[T] mu_vestfold_sv;                      // Latent for vestfold
  matrix[T, polls] shrunken_polls_vestfold_sv;   // Imputed polls vestfold
  real<lower = 0> tau_vestfold_sv;               // the standard deviation of the random effects for vestfold
 
  vector<lower = 0>[T] mu_vestfold_sp;                      // Latent for vestfold
  matrix[T, polls] shrunken_polls_vestfold_sp;   // Imputed polls vestfold
  real<lower = 0> tau_vestfold_sp;               // the standard deviation of the random effects for vestfold
 
  vector<lower = 0>[T] mu_vestfold_krf;                      // Latent for vestfold
  matrix[T, polls] shrunken_polls_vestfold_krf;   // Imputed polls vestfold
  real<lower = 0> tau_vestfold_krf;               // the standard deviation of the random effects for vestfold
 
  vector<lower = 0>[T] mu_vestfold_v;                      // Latent for vestfold
  matrix[T, polls] shrunken_polls_vestfold_v;   // Imputed polls vestfold
  real<lower = 0> tau_vestfold_v;               // the standard deviation of the random effects for vestfold
 
  vector<lower = 0>[T] mu_vestfold_mdg;                      // Latent for vestfold
  matrix[T, polls] shrunken_polls_vestfold_mdg;   // Imputed polls vestfold
  real<lower = 0> tau_vestfold_mdg;               // the standard deviation of the random effects for vestfold
 
  vector<lower = 0>[T] mu_vestfold_r;                      // Latent for vestfold
  matrix[T, polls] shrunken_polls_vestfold_r;   // Imputed polls vestfold
  real<lower = 0> tau_vestfold_r;               // the standard deviation of the random effects for vestfold
 
  vector<lower = 0>[T] mu_vestfold_a;                      // Latent for vestfold
  matrix[T, polls] shrunken_polls_vestfold_a;   // Imputed polls vestfold
  real<lower = 0> tau_vestfold_a;             // the standard deviation of the random effects for vestfold
 
}
model {


   //OSLO
   
   //Priors for sum of mus
   
   
  // Priors Oslo AP
  // prior on initial difference Oslo AP
  mu_oslo_ap[1] ~ normal(initial_prior_oslo_ap, 1);
  tau_oslo_ap ~ student_t(4, 0, 5);
  
  // state model Oslo AP
  for(t in 2:T) {
    mu_oslo_ap[t] ~ normal(mu_oslo_ap[t-1], 0.25);
  }
  

  // Priors Oslo H
  // prior on initial difference Oslo H
  mu_oslo_h[1] ~ normal(initial_prior_oslo_h, 1);
  tau_oslo_h ~ student_t(4, 0, 5);
  
  // state model Oslo H
  for(t in 2:T) {
    mu_oslo_h[t] ~ normal(mu_oslo_h[t-1], 0.25);
  }
  
  mu_oslo_frp[1] ~ normal(initial_prior_oslo_frp, 1);
  tau_oslo_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oslo_frp[t] ~ normal(mu_oslo_frp[t-1], 0.25);
  }
  
  mu_oslo_sv[1] ~ normal(initial_prior_oslo_sv, 1);
  tau_oslo_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oslo_sv[t] ~ normal(mu_oslo_sv[t-1], 0.25);
  }
  
  mu_oslo_sp[1] ~ normal(initial_prior_oslo_sp, 1);
  tau_oslo_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oslo_sp[t] ~ normal(mu_oslo_sp[t-1], 0.25);
  }
  
  mu_oslo_krf[1] ~ normal(initial_prior_oslo_krf, 1);
  tau_oslo_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oslo_krf[t] ~ normal(mu_oslo_krf[t-1], 0.25);
  }
  
  mu_oslo_v[1] ~ normal(initial_prior_oslo_v, 1);
  tau_oslo_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oslo_v[t] ~ normal(mu_oslo_v[t-1], 0.25);
  }
  
  mu_oslo_mdg[1] ~ normal(initial_prior_oslo_mdg, 1);
  tau_oslo_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oslo_mdg[t] ~ normal(mu_oslo_mdg[t-1], 0.25);
  }
  
  mu_oslo_r[1] ~ normal(initial_prior_oslo_r, 1);
  tau_oslo_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oslo_r[t] ~ normal(mu_oslo_r[t-1], 0.25);
  }
  
  mu_oslo_a[1] ~ normal(initial_prior_oslo_a, 1);
  tau_oslo_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oslo_a[t] ~ normal(mu_oslo_a[t-1], 0.25);
  }

   //OSLO MEASUREMENT MODELS  
  // measurement model Oslo Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oslo_ap[t, p] != -9) {
        Y_oslo_ap[t,p]~ normal(shrunken_polls_oslo_ap[t, p], sigma_oslo_ap[t,p]);
        shrunken_polls_oslo_ap[t, p] ~ normal(mu_oslo_ap[t], tau_oslo_ap);
	} else {
        shrunken_polls_oslo_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model Oslo H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oslo_h[t, p] != -9) {
        Y_oslo_h[t,p]~ normal(shrunken_polls_oslo_h[t, p], sigma_oslo_h[t,p]);
        shrunken_polls_oslo_h[t, p] ~ normal(mu_oslo_h[t], tau_oslo_h);
	} else {
        shrunken_polls_oslo_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model Oslo _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oslo_frp[t, p] != -9) {
        Y_oslo_frp[t,p]~ normal(shrunken_polls_oslo_frp[t, p], sigma_oslo_frp[t,p]);
        shrunken_polls_oslo_frp[t, p] ~ normal(mu_oslo_frp[t], tau_oslo_frp);
	} else {
        shrunken_polls_oslo_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model Oslo _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oslo_sv[t, p] != -9) {
        Y_oslo_sv[t,p]~ normal(shrunken_polls_oslo_sv[t, p], sigma_oslo_sv[t,p]);
        shrunken_polls_oslo_sv[t, p] ~ normal(mu_oslo_sv[t], tau_oslo_sv);
	} else {
        shrunken_polls_oslo_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model Oslo _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oslo_sp[t, p] != -9) {
        Y_oslo_sp[t,p]~ normal(shrunken_polls_oslo_sp[t, p], sigma_oslo_sp[t,p]);
        shrunken_polls_oslo_sp[t, p] ~ normal(mu_oslo_sp[t], tau_oslo_sp);
	} else {
        shrunken_polls_oslo_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model Oslo _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oslo_krf[t, p] != -9) {
        Y_oslo_krf[t,p]~ normal(shrunken_polls_oslo_krf[t, p], sigma_oslo_krf[t,p]);
        shrunken_polls_oslo_krf[t, p] ~ normal(mu_oslo_krf[t], tau_oslo_krf);
	} else {
        shrunken_polls_oslo_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model Oslo _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oslo_v[t, p] != -9) {
        Y_oslo_v[t,p]~ normal(shrunken_polls_oslo_v[t, p], sigma_oslo_v[t,p]);
        shrunken_polls_oslo_v[t, p] ~ normal(mu_oslo_v[t], tau_oslo_v);
	} else {
        shrunken_polls_oslo_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model Oslo _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oslo_mdg[t, p] != -9) {
        Y_oslo_mdg[t,p]~ normal(shrunken_polls_oslo_mdg[t, p], sigma_oslo_mdg[t,p]);
        shrunken_polls_oslo_mdg[t, p] ~ normal(mu_oslo_mdg[t], tau_oslo_mdg);
	} else {
        shrunken_polls_oslo_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model Oslo _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oslo_r[t, p] != -9) {
        Y_oslo_r[t,p]~ normal(shrunken_polls_oslo_r[t, p], sigma_oslo_r[t,p]);
        shrunken_polls_oslo_r[t, p] ~ normal(mu_oslo_r[t], tau_oslo_r);
	} else {
        shrunken_polls_oslo_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model Oslo _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oslo_a[t, p] != -9) {
        Y_oslo_a[t,p]~ normal(shrunken_polls_oslo_a[t, p], sigma_oslo_a[t,p]);
        shrunken_polls_oslo_a[t, p] ~ normal(mu_oslo_a[t], tau_oslo_a);
	} else {
        shrunken_polls_oslo_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
  
   //akershus
   
   
   
  // Priors akershus AP
  // prior on initial difference akershus AP
  mu_akershus_ap[1] ~ normal(initial_prior_akershus_ap, 1);
  tau_akershus_ap ~ student_t(4, 0, 5);
  
  // state model akershus AP
  for(t in 2:T) {
    mu_akershus_ap[t] ~ normal(mu_akershus_ap[t-1], 0.25);
  }
  

  // Priors akershus H
  // prior on initial difference akershus H
  mu_akershus_h[1] ~ normal(initial_prior_akershus_h, 1);
  tau_akershus_h ~ student_t(4, 0, 5);
  
  // state model akershus H
  for(t in 2:T) {
    mu_akershus_h[t] ~ normal(mu_akershus_h[t-1], 0.25);
  }
  
  mu_akershus_frp[1] ~ normal(initial_prior_akershus_frp, 1);
  tau_akershus_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_akershus_frp[t] ~ normal(mu_akershus_frp[t-1], 0.25);
  }
  
  mu_akershus_sv[1] ~ normal(initial_prior_akershus_sv, 1);
  tau_akershus_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_akershus_sv[t] ~ normal(mu_akershus_sv[t-1], 0.25);
  }
  
  mu_akershus_sp[1] ~ normal(initial_prior_akershus_sp, 1);
  tau_akershus_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_akershus_sp[t] ~ normal(mu_akershus_sp[t-1], 0.25);
  }
  
  mu_akershus_krf[1] ~ normal(initial_prior_akershus_krf, 1);
  tau_akershus_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_akershus_krf[t] ~ normal(mu_akershus_krf[t-1], 0.25);
  }
  
  mu_akershus_v[1] ~ normal(initial_prior_akershus_v, 1);
  tau_akershus_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_akershus_v[t] ~ normal(mu_akershus_v[t-1], 0.25);
  }
  
  mu_akershus_mdg[1] ~ normal(initial_prior_akershus_mdg, 1);
  tau_akershus_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_akershus_mdg[t] ~ normal(mu_akershus_mdg[t-1], 0.25);
  }
  
  mu_akershus_r[1] ~ normal(initial_prior_akershus_r, 1);
  tau_akershus_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_akershus_r[t] ~ normal(mu_akershus_r[t-1], 0.25);
  }
  
  mu_akershus_a[1] ~ normal(initial_prior_akershus_a, 1);
  tau_akershus_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_akershus_a[t] ~ normal(mu_akershus_a[t-1], 0.25);
  }

   //akershus MEASUREMENT MODELS  
  // measurement model akershus Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_akershus_ap[t, p] != -9) {
        Y_akershus_ap[t,p]~ normal(shrunken_polls_akershus_ap[t, p], sigma_akershus_ap[t,p]);
        shrunken_polls_akershus_ap[t, p] ~ normal(mu_akershus_ap[t], tau_akershus_ap);
	} else {
        shrunken_polls_akershus_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model akershus H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_akershus_h[t, p] != -9) {
        Y_akershus_h[t,p]~ normal(shrunken_polls_akershus_h[t, p], sigma_akershus_h[t,p]);
        shrunken_polls_akershus_h[t, p] ~ normal(mu_akershus_h[t], tau_akershus_h);
	} else {
        shrunken_polls_akershus_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model akershus _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_akershus_frp[t, p] != -9) {
        Y_akershus_frp[t,p]~ normal(shrunken_polls_akershus_frp[t, p], sigma_akershus_frp[t,p]);
        shrunken_polls_akershus_frp[t, p] ~ normal(mu_akershus_frp[t], tau_akershus_frp);
	} else {
        shrunken_polls_akershus_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model akershus _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_akershus_sv[t, p] != -9) {
        Y_akershus_sv[t,p]~ normal(shrunken_polls_akershus_sv[t, p], sigma_akershus_sv[t,p]);
        shrunken_polls_akershus_sv[t, p] ~ normal(mu_akershus_sv[t], tau_akershus_sv);
	} else {
        shrunken_polls_akershus_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model akershus _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_akershus_sp[t, p] != -9) {
        Y_akershus_sp[t,p]~ normal(shrunken_polls_akershus_sp[t, p], sigma_akershus_sp[t,p]);
        shrunken_polls_akershus_sp[t, p] ~ normal(mu_akershus_sp[t], tau_akershus_sp);
	} else {
        shrunken_polls_akershus_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model akershus _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_akershus_krf[t, p] != -9) {
        Y_akershus_krf[t,p]~ normal(shrunken_polls_akershus_krf[t, p], sigma_akershus_krf[t,p]);
        shrunken_polls_akershus_krf[t, p] ~ normal(mu_akershus_krf[t], tau_akershus_krf);
	} else {
        shrunken_polls_akershus_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model akershus _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_akershus_v[t, p] != -9) {
        Y_akershus_v[t,p]~ normal(shrunken_polls_akershus_v[t, p], sigma_akershus_v[t,p]);
        shrunken_polls_akershus_v[t, p] ~ normal(mu_akershus_v[t], tau_akershus_v);
	} else {
        shrunken_polls_akershus_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model akershus _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_akershus_mdg[t, p] != -9) {
        Y_akershus_mdg[t,p]~ normal(shrunken_polls_akershus_mdg[t, p], sigma_akershus_mdg[t,p]);
        shrunken_polls_akershus_mdg[t, p] ~ normal(mu_akershus_mdg[t], tau_akershus_mdg);
	} else {
        shrunken_polls_akershus_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model akershus _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_akershus_r[t, p] != -9) {
        Y_akershus_r[t,p]~ normal(shrunken_polls_akershus_r[t, p], sigma_akershus_r[t,p]);
        shrunken_polls_akershus_r[t, p] ~ normal(mu_akershus_r[t], tau_akershus_r);
	} else {
        shrunken_polls_akershus_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model akershus _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_akershus_a[t, p] != -9) {
        Y_akershus_a[t,p]~ normal(shrunken_polls_akershus_a[t, p], sigma_akershus_a[t,p]);
        shrunken_polls_akershus_a[t, p] ~ normal(mu_akershus_a[t], tau_akershus_a);
	} else {
        shrunken_polls_akershus_a[t, p] ~ normal(0, 1);
      }
    }
  }
  //finnmark
   
   
   
  // Priors finnmark AP
  // prior on initial difference finnmark AP
  mu_finnmark_ap[1] ~ normal(initial_prior_finnmark_ap, 1);
  tau_finnmark_ap ~ student_t(4, 0, 5);
  
  // state model finnmark AP
  for(t in 2:T) {
    mu_finnmark_ap[t] ~ normal(mu_finnmark_ap[t-1], 0.25);
  }
  

  // Priors finnmark H
  // prior on initial difference finnmark H
  mu_finnmark_h[1] ~ normal(initial_prior_finnmark_h, 1);
  tau_finnmark_h ~ student_t(4, 0, 5);
  
  // state model finnmark H
  for(t in 2:T) {
    mu_finnmark_h[t] ~ normal(mu_finnmark_h[t-1], 0.25);
  }
  
  mu_finnmark_frp[1] ~ normal(initial_prior_finnmark_frp, 1);
  tau_finnmark_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_finnmark_frp[t] ~ normal(mu_finnmark_frp[t-1], 0.25);
  }
  
  mu_finnmark_sv[1] ~ normal(initial_prior_finnmark_sv, 1);
  tau_finnmark_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_finnmark_sv[t] ~ normal(mu_finnmark_sv[t-1], 0.25);
  }
  
  mu_finnmark_sp[1] ~ normal(initial_prior_finnmark_sp, 1);
  tau_finnmark_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_finnmark_sp[t] ~ normal(mu_finnmark_sp[t-1], 0.25);
  }
  
  mu_finnmark_krf[1] ~ normal(initial_prior_finnmark_krf, 1);
  tau_finnmark_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_finnmark_krf[t] ~ normal(mu_finnmark_krf[t-1], 0.25);
  }
  
  mu_finnmark_v[1] ~ normal(initial_prior_finnmark_v, 1);
  tau_finnmark_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_finnmark_v[t] ~ normal(mu_finnmark_v[t-1], 0.25);
  }
  
  mu_finnmark_mdg[1] ~ normal(initial_prior_finnmark_mdg, 1);
  tau_finnmark_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_finnmark_mdg[t] ~ normal(mu_finnmark_mdg[t-1], 0.25);
  }
  
  mu_finnmark_r[1] ~ normal(initial_prior_finnmark_r, 1);
  tau_finnmark_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_finnmark_r[t] ~ normal(mu_finnmark_r[t-1], 0.25);
  }
  
  mu_finnmark_a[1] ~ normal(initial_prior_finnmark_a, 1);
  tau_finnmark_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_finnmark_a[t] ~ normal(mu_finnmark_a[t-1], 0.25);
  }

   //finnmark MEASUREMENT MODELS  
  // measurement model finnmark Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_finnmark_ap[t, p] != -9) {
        Y_finnmark_ap[t,p]~ normal(shrunken_polls_finnmark_ap[t, p], sigma_finnmark_ap[t,p]);
        shrunken_polls_finnmark_ap[t, p] ~ normal(mu_finnmark_ap[t], tau_finnmark_ap);
	} else {
        shrunken_polls_finnmark_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model finnmark H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_finnmark_h[t, p] != -9) {
        Y_finnmark_h[t,p]~ normal(shrunken_polls_finnmark_h[t, p], sigma_finnmark_h[t,p]);
        shrunken_polls_finnmark_h[t, p] ~ normal(mu_finnmark_h[t], tau_finnmark_h);
	} else {
        shrunken_polls_finnmark_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model finnmark _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_finnmark_frp[t, p] != -9) {
        Y_finnmark_frp[t,p]~ normal(shrunken_polls_finnmark_frp[t, p], sigma_finnmark_frp[t,p]);
        shrunken_polls_finnmark_frp[t, p] ~ normal(mu_finnmark_frp[t], tau_finnmark_frp);
	} else {
        shrunken_polls_finnmark_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model finnmark _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_finnmark_sv[t, p] != -9) {
        Y_finnmark_sv[t,p]~ normal(shrunken_polls_finnmark_sv[t, p], sigma_finnmark_sv[t,p]);
        shrunken_polls_finnmark_sv[t, p] ~ normal(mu_finnmark_sv[t], tau_finnmark_sv);
	} else {
        shrunken_polls_finnmark_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model finnmark _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_finnmark_sp[t, p] != -9) {
        Y_finnmark_sp[t,p]~ normal(shrunken_polls_finnmark_sp[t, p], sigma_finnmark_sp[t,p]);
        shrunken_polls_finnmark_sp[t, p] ~ normal(mu_finnmark_sp[t], tau_finnmark_sp);
	} else {
        shrunken_polls_finnmark_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model finnmark _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_finnmark_krf[t, p] != -9) {
        Y_finnmark_krf[t,p]~ normal(shrunken_polls_finnmark_krf[t, p], sigma_finnmark_krf[t,p]);
        shrunken_polls_finnmark_krf[t, p] ~ normal(mu_finnmark_krf[t], tau_finnmark_krf);
	} else {
        shrunken_polls_finnmark_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model finnmark _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_finnmark_v[t, p] != -9) {
        Y_finnmark_v[t,p]~ normal(shrunken_polls_finnmark_v[t, p], sigma_finnmark_v[t,p]);
        shrunken_polls_finnmark_v[t, p] ~ normal(mu_finnmark_v[t], tau_finnmark_v);
	} else {
        shrunken_polls_finnmark_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model finnmark _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_finnmark_mdg[t, p] != -9) {
        Y_finnmark_mdg[t,p]~ normal(shrunken_polls_finnmark_mdg[t, p], sigma_finnmark_mdg[t,p]);
        shrunken_polls_finnmark_mdg[t, p] ~ normal(mu_finnmark_mdg[t], tau_finnmark_mdg);
	} else {
        shrunken_polls_finnmark_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model finnmark _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_finnmark_r[t, p] != -9) {
        Y_finnmark_r[t,p]~ normal(shrunken_polls_finnmark_r[t, p], sigma_finnmark_r[t,p]);
        shrunken_polls_finnmark_r[t, p] ~ normal(mu_finnmark_r[t], tau_finnmark_r);
	} else {
        shrunken_polls_finnmark_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model finnmark _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_finnmark_a[t, p] != -9) {
        Y_finnmark_a[t,p]~ normal(shrunken_polls_finnmark_a[t, p], sigma_finnmark_a[t,p]);
        shrunken_polls_finnmark_a[t, p] ~ normal(mu_finnmark_a[t], tau_finnmark_a);
	} else {
        shrunken_polls_finnmark_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
  //nordland
   
   
   
  // Priors nordland AP
  // prior on initial difference nordland AP
  mu_nordland_ap[1] ~ normal(initial_prior_nordland_ap, 1);
  tau_nordland_ap ~ student_t(4, 0, 5);
  
  // state model nordland AP
  for(t in 2:T) {
    mu_nordland_ap[t] ~ normal(mu_nordland_ap[t-1], 0.25);
  }
  

  // Priors nordland H
  // prior on initial difference nordland H
  mu_nordland_h[1] ~ normal(initial_prior_nordland_h, 1);
  tau_nordland_h ~ student_t(4, 0, 5);
  
  // state model nordland H
  for(t in 2:T) {
    mu_nordland_h[t] ~ normal(mu_nordland_h[t-1], 0.25);
  }
  
  mu_nordland_frp[1] ~ normal(initial_prior_nordland_frp, 1);
  tau_nordland_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordland_frp[t] ~ normal(mu_nordland_frp[t-1], 0.25);
  }
  
  mu_nordland_sv[1] ~ normal(initial_prior_nordland_sv, 1);
  tau_nordland_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordland_sv[t] ~ normal(mu_nordland_sv[t-1], 0.25);
  }
  
  mu_nordland_sp[1] ~ normal(initial_prior_nordland_sp, 1);
  tau_nordland_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordland_sp[t] ~ normal(mu_nordland_sp[t-1], 0.25);
  }
  
  mu_nordland_krf[1] ~ normal(initial_prior_nordland_krf, 1);
  tau_nordland_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordland_krf[t] ~ normal(mu_nordland_krf[t-1], 0.25);
  }
  
  mu_nordland_v[1] ~ normal(initial_prior_nordland_v, 1);
  tau_nordland_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordland_v[t] ~ normal(mu_nordland_v[t-1], 0.25);
  }
  
  mu_nordland_mdg[1] ~ normal(initial_prior_nordland_mdg, 1);
  tau_nordland_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordland_mdg[t] ~ normal(mu_nordland_mdg[t-1], 0.25);
  }
  
  mu_nordland_r[1] ~ normal(initial_prior_nordland_r, 1);
  tau_nordland_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordland_r[t] ~ normal(mu_nordland_r[t-1], 0.25);
  }
  
  mu_nordland_a[1] ~ normal(initial_prior_nordland_a, 1);
  tau_nordland_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordland_a[t] ~ normal(mu_nordland_a[t-1], 0.25);
  }

   //nordland MEASUREMENT MODELS  
  // measurement model nordland Ap
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordland_ap[t, p] != -9) {
        Y_nordland_ap[t,p]~ normal(shrunken_polls_nordland_ap[t, p], sigma_nordland_ap[t,p]);
        shrunken_polls_nordland_ap[t, p] ~ normal(mu_nordland_ap[t], tau_nordland_ap);
	} else {
        shrunken_polls_nordland_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model nordland H
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordland_h[t, p] != -9) {
        Y_nordland_h[t,p]~ normal(shrunken_polls_nordland_h[t, p], sigma_nordland_h[t,p]);
        shrunken_polls_nordland_h[t, p] ~ normal(mu_nordland_h[t], tau_nordland_h);
	} else {
        shrunken_polls_nordland_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model nordland _frp
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordland_frp[t, p] != -9) {
        Y_nordland_frp[t,p]~ normal(shrunken_polls_nordland_frp[t, p], sigma_nordland_frp[t,p]);
        shrunken_polls_nordland_frp[t, p] ~ normal(mu_nordland_frp[t], tau_nordland_frp);
	} else {
        shrunken_polls_nordland_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model nordland _sv
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordland_sv[t, p] != -9) {
        Y_nordland_sv[t,p]~ normal(shrunken_polls_nordland_sv[t, p], sigma_nordland_sv[t,p]);
        shrunken_polls_nordland_sv[t, p] ~ normal(mu_nordland_sv[t], tau_nordland_sv);
	} else {
        shrunken_polls_nordland_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model nordland _sp
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordland_sp[t, p] != -9) {
        Y_nordland_sp[t,p]~ normal(shrunken_polls_nordland_sp[t, p], sigma_nordland_sp[t,p]);
        shrunken_polls_nordland_sp[t, p] ~ normal(mu_nordland_sp[t], tau_nordland_sp);
	} else {
        shrunken_polls_nordland_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model nordland _krf
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordland_krf[t, p] != -9) {
        Y_nordland_krf[t,p]~ normal(shrunken_polls_nordland_krf[t, p], sigma_nordland_krf[t,p]);
        shrunken_polls_nordland_krf[t, p] ~ normal(mu_nordland_krf[t], tau_nordland_krf);
	} else {
        shrunken_polls_nordland_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model nordland _v
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordland_v[t, p] != -9) {
        Y_nordland_v[t,p]~ normal(shrunken_polls_nordland_v[t, p], sigma_nordland_v[t,p]);
        shrunken_polls_nordland_v[t, p] ~ normal(mu_nordland_v[t], tau_nordland_v);
	} else {
        shrunken_polls_nordland_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model nordland _mdg
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordland_mdg[t, p] != -9) {
        Y_nordland_mdg[t,p]~ normal(shrunken_polls_nordland_mdg[t, p], sigma_nordland_mdg[t,p]);
        shrunken_polls_nordland_mdg[t, p] ~ normal(mu_nordland_mdg[t], tau_nordland_mdg);
	} else {
        shrunken_polls_nordland_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model nordland _r
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordland_r[t, p] != -9) {
        Y_nordland_r[t,p]~ normal(shrunken_polls_nordland_r[t, p], sigma_nordland_r[t,p]);
        shrunken_polls_nordland_r[t, p] ~ normal(mu_nordland_r[t], tau_nordland_r);
	} else {
        shrunken_polls_nordland_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model nordland _a
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordland_a[t, p] != -9) {
        Y_nordland_a[t,p]~ normal(shrunken_polls_nordland_a[t, p], sigma_nordland_a[t,p]);
        shrunken_polls_nordland_a[t, p] ~ normal(mu_nordland_a[t], tau_nordland_a);
	} else {
        shrunken_polls_nordland_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
  
  

   //troms
   
   
   
  // Priors troms AP
  // prior on initial difference troms AP
  mu_troms_ap[1] ~ normal(initial_prior_troms_ap, 1);
  tau_troms_ap ~ student_t(4, 0, 5);
  
  // state model troms AP
  for(t in 2:T) {
    mu_troms_ap[t] ~ normal(mu_troms_ap[t-1], 0.25);
  }
  

  // Priors troms H
  // prior on initial difference troms H
  mu_troms_h[1] ~ normal(initial_prior_troms_h, 1);
  tau_troms_h ~ student_t(4, 0, 5);
  
  // state model troms H
  for(t in 2:T) {
    mu_troms_h[t] ~ normal(mu_troms_h[t-1], 0.25);
  }
  
  mu_troms_frp[1] ~ normal(initial_prior_troms_frp, 1);
  tau_troms_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_troms_frp[t] ~ normal(mu_troms_frp[t-1], 0.25);
  }
  
  mu_troms_sv[1] ~ normal(initial_prior_troms_sv, 1);
  tau_troms_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_troms_sv[t] ~ normal(mu_troms_sv[t-1], 0.25);
  }
  
  mu_troms_sp[1] ~ normal(initial_prior_troms_sp, 1);
  tau_troms_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_troms_sp[t] ~ normal(mu_troms_sp[t-1], 0.25);
  }
  
  mu_troms_krf[1] ~ normal(initial_prior_troms_krf, 1);
  tau_troms_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_troms_krf[t] ~ normal(mu_troms_krf[t-1], 0.25);
  }
  
  mu_troms_v[1] ~ normal(initial_prior_troms_v, 1);
  tau_troms_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_troms_v[t] ~ normal(mu_troms_v[t-1], 0.25);
  }
  
  mu_troms_mdg[1] ~ normal(initial_prior_troms_mdg, 1);
  tau_troms_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_troms_mdg[t] ~ normal(mu_troms_mdg[t-1], 0.25);
  }
  
  mu_troms_r[1] ~ normal(initial_prior_troms_r, 1);
  tau_troms_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_troms_r[t] ~ normal(mu_troms_r[t-1], 0.25);
  }
  
  mu_troms_a[1] ~ normal(initial_prior_troms_a, 1);
  tau_troms_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_troms_a[t] ~ normal(mu_troms_a[t-1], 0.25);
  }

   //troms MEASUREMENT MODELS  
  // measurement model troms Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_troms_ap[t, p] != -9) {
        Y_troms_ap[t,p]~ normal(shrunken_polls_troms_ap[t, p], sigma_troms_ap[t,p]);
        shrunken_polls_troms_ap[t, p] ~ normal(mu_troms_ap[t], tau_troms_ap);
	} else {
        shrunken_polls_troms_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model troms H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_troms_h[t, p] != -9) {
        Y_troms_h[t,p]~ normal(shrunken_polls_troms_h[t, p], sigma_troms_h[t,p]);
        shrunken_polls_troms_h[t, p] ~ normal(mu_troms_h[t], tau_troms_h);
	} else {
        shrunken_polls_troms_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model troms _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_troms_frp[t, p] != -9) {
        Y_troms_frp[t,p]~ normal(shrunken_polls_troms_frp[t, p], sigma_troms_frp[t,p]);
        shrunken_polls_troms_frp[t, p] ~ normal(mu_troms_frp[t], tau_troms_frp);
	} else {
        shrunken_polls_troms_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model troms _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_troms_sv[t, p] != -9) {
        Y_troms_sv[t,p]~ normal(shrunken_polls_troms_sv[t, p], sigma_troms_sv[t,p]);
        shrunken_polls_troms_sv[t, p] ~ normal(mu_troms_sv[t], tau_troms_sv);
	} else {
        shrunken_polls_troms_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model troms _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_troms_sp[t, p] != -9) {
        Y_troms_sp[t,p]~ normal(shrunken_polls_troms_sp[t, p], sigma_troms_sp[t,p]);
        shrunken_polls_troms_sp[t, p] ~ normal(mu_troms_sp[t], tau_troms_sp);
	} else {
        shrunken_polls_troms_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model troms _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_troms_krf[t, p] != -9) {
        Y_troms_krf[t,p]~ normal(shrunken_polls_troms_krf[t, p], sigma_troms_krf[t,p]);
        shrunken_polls_troms_krf[t, p] ~ normal(mu_troms_krf[t], tau_troms_krf);
	} else {
        shrunken_polls_troms_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model troms _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_troms_v[t, p] != -9) {
        Y_troms_v[t,p]~ normal(shrunken_polls_troms_v[t, p], sigma_troms_v[t,p]);
        shrunken_polls_troms_v[t, p] ~ normal(mu_troms_v[t], tau_troms_v);
	} else {
        shrunken_polls_troms_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model troms _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_troms_mdg[t, p] != -9) {
        Y_troms_mdg[t,p]~ normal(shrunken_polls_troms_mdg[t, p], sigma_troms_mdg[t,p]);
        shrunken_polls_troms_mdg[t, p] ~ normal(mu_troms_mdg[t], tau_troms_mdg);
	} else {
        shrunken_polls_troms_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model troms _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_troms_r[t, p] != -9) {
        Y_troms_r[t,p]~ normal(shrunken_polls_troms_r[t, p], sigma_troms_r[t,p]);
        shrunken_polls_troms_r[t, p] ~ normal(mu_troms_r[t], tau_troms_r);
	} else {
        shrunken_polls_troms_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model troms _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_troms_a[t, p] != -9) {
        Y_troms_a[t,p]~ normal(shrunken_polls_troms_a[t, p], sigma_troms_a[t,p]);
        shrunken_polls_troms_a[t, p] ~ normal(mu_troms_a[t], tau_troms_a);
	} else {
        shrunken_polls_troms_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
  //telemark
   
   
   
  // Priors telemark AP
  // prior on initial difference telemark AP
  mu_telemark_ap[1] ~ normal(initial_prior_telemark_ap, 1);
  tau_telemark_ap ~ student_t(4, 0, 5);
  
  // state model telemark AP
  for(t in 2:T) {
    mu_telemark_ap[t] ~ normal(mu_telemark_ap[t-1], 0.25);
  }
  

  // Priors telemark H
  // prior on initial difference telemark H
  mu_telemark_h[1] ~ normal(initial_prior_telemark_h, 1);
  tau_telemark_h ~ student_t(4, 0, 5);
  
  // state model telemark H
  for(t in 2:T) {
    mu_telemark_h[t] ~ normal(mu_telemark_h[t-1], 0.25);
  }
  
  mu_telemark_frp[1] ~ normal(initial_prior_telemark_frp, 1);
  tau_telemark_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_telemark_frp[t] ~ normal(mu_telemark_frp[t-1], 0.25);
  }
  
  mu_telemark_sv[1] ~ normal(initial_prior_telemark_sv, 1);
  tau_telemark_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_telemark_sv[t] ~ normal(mu_telemark_sv[t-1], 0.25);
  }
  
  mu_telemark_sp[1] ~ normal(initial_prior_telemark_sp, 1);
  tau_telemark_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_telemark_sp[t] ~ normal(mu_telemark_sp[t-1], 0.25);
  }
  
  mu_telemark_krf[1] ~ normal(initial_prior_telemark_krf, 1);
  tau_telemark_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_telemark_krf[t] ~ normal(mu_telemark_krf[t-1], 0.25);
  }
  
  mu_telemark_v[1] ~ normal(initial_prior_telemark_v, 1);
  tau_telemark_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_telemark_v[t] ~ normal(mu_telemark_v[t-1], 0.25);
  }
  
  mu_telemark_mdg[1] ~ normal(initial_prior_telemark_mdg, 1);
  tau_telemark_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_telemark_mdg[t] ~ normal(mu_telemark_mdg[t-1], 0.25);
  }
  
  mu_telemark_r[1] ~ normal(initial_prior_telemark_r, 1);
  tau_telemark_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_telemark_r[t] ~ normal(mu_telemark_r[t-1], 0.25);
  }
  
  mu_telemark_a[1] ~ normal(initial_prior_telemark_a, 1);
  tau_telemark_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_telemark_a[t] ~ normal(mu_telemark_a[t-1], 0.25);
  }

   //telemark MEASUREMENT MODELS  
  // measurement model telemark Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_telemark_ap[t, p] != -9) {
        Y_telemark_ap[t,p]~ normal(shrunken_polls_telemark_ap[t, p], sigma_telemark_ap[t,p]);
        shrunken_polls_telemark_ap[t, p] ~ normal(mu_telemark_ap[t], tau_telemark_ap);
	} else {
        shrunken_polls_telemark_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model telemark H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_telemark_h[t, p] != -9) {
        Y_telemark_h[t,p]~ normal(shrunken_polls_telemark_h[t, p], sigma_telemark_h[t,p]);
        shrunken_polls_telemark_h[t, p] ~ normal(mu_telemark_h[t], tau_telemark_h);
	} else {
        shrunken_polls_telemark_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model telemark _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_telemark_frp[t, p] != -9) {
        Y_telemark_frp[t,p]~ normal(shrunken_polls_telemark_frp[t, p], sigma_telemark_frp[t,p]);
        shrunken_polls_telemark_frp[t, p] ~ normal(mu_telemark_frp[t], tau_telemark_frp);
	} else {
        shrunken_polls_telemark_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model telemark _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_telemark_sv[t, p] != -9) {
        Y_telemark_sv[t,p]~ normal(shrunken_polls_telemark_sv[t, p], sigma_telemark_sv[t,p]);
        shrunken_polls_telemark_sv[t, p] ~ normal(mu_telemark_sv[t], tau_telemark_sv);
	} else {
        shrunken_polls_telemark_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model telemark _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_telemark_sp[t, p] != -9) {
        Y_telemark_sp[t,p]~ normal(shrunken_polls_telemark_sp[t, p], sigma_telemark_sp[t,p]);
        shrunken_polls_telemark_sp[t, p] ~ normal(mu_telemark_sp[t], tau_telemark_sp);
	} else {
        shrunken_polls_telemark_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model telemark _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_telemark_krf[t, p] != -9) {
        Y_telemark_krf[t,p]~ normal(shrunken_polls_telemark_krf[t, p], sigma_telemark_krf[t,p]);
        shrunken_polls_telemark_krf[t, p] ~ normal(mu_telemark_krf[t], tau_telemark_krf);
	} else {
        shrunken_polls_telemark_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model telemark _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_telemark_v[t, p] != -9) {
        Y_telemark_v[t,p]~ normal(shrunken_polls_telemark_v[t, p], sigma_telemark_v[t,p]);
        shrunken_polls_telemark_v[t, p] ~ normal(mu_telemark_v[t], tau_telemark_v);
	} else {
        shrunken_polls_telemark_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model telemark _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_telemark_mdg[t, p] != -9) {
        Y_telemark_mdg[t,p]~ normal(shrunken_polls_telemark_mdg[t, p], sigma_telemark_mdg[t,p]);
        shrunken_polls_telemark_mdg[t, p] ~ normal(mu_telemark_mdg[t], tau_telemark_mdg);
	} else {
        shrunken_polls_telemark_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model telemark _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_telemark_r[t, p] != -9) {
        Y_telemark_r[t,p]~ normal(shrunken_polls_telemark_r[t, p], sigma_telemark_r[t,p]);
        shrunken_polls_telemark_r[t, p] ~ normal(mu_telemark_r[t], tau_telemark_r);
	} else {
        shrunken_polls_telemark_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model telemark _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_telemark_a[t, p] != -9) {
        Y_telemark_a[t,p]~ normal(shrunken_polls_telemark_a[t, p], sigma_telemark_a[t,p]);
        shrunken_polls_telemark_a[t, p] ~ normal(mu_telemark_a[t], tau_telemark_a);
	} else {
        shrunken_polls_telemark_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
  
   //oppland
   
   
   
  // Priors oppland AP
  // prior on initial difference oppland AP
  mu_oppland_ap[1] ~ normal(initial_prior_oppland_ap, 1);
  tau_oppland_ap ~ student_t(4, 0, 5);
  
  // state model oppland AP
  for(t in 2:T) {
    mu_oppland_ap[t] ~ normal(mu_oppland_ap[t-1], 0.25);
  }
  

  // Priors oppland H
  // prior on initial difference oppland H
  mu_oppland_h[1] ~ normal(initial_prior_oppland_h, 1);
  tau_oppland_h ~ student_t(4, 0, 5);
  
  // state model oppland H
  for(t in 2:T) {
    mu_oppland_h[t] ~ normal(mu_oppland_h[t-1], 0.25);
  }
  
  mu_oppland_frp[1] ~ normal(initial_prior_oppland_frp, 1);
  tau_oppland_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oppland_frp[t] ~ normal(mu_oppland_frp[t-1], 0.25);
  }
  
  mu_oppland_sv[1] ~ normal(initial_prior_oppland_sv, 1);
  tau_oppland_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oppland_sv[t] ~ normal(mu_oppland_sv[t-1], 0.25);
  }
  
  mu_oppland_sp[1] ~ normal(initial_prior_oppland_sp, 1);
  tau_oppland_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oppland_sp[t] ~ normal(mu_oppland_sp[t-1], 0.25);
  }
  
  mu_oppland_krf[1] ~ normal(initial_prior_oppland_krf, 1);
  tau_oppland_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oppland_krf[t] ~ normal(mu_oppland_krf[t-1], 0.25);
  }
  
  mu_oppland_v[1] ~ normal(initial_prior_oppland_v, 1);
  tau_oppland_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oppland_v[t] ~ normal(mu_oppland_v[t-1], 0.25);
  }
  
  mu_oppland_mdg[1] ~ normal(initial_prior_oppland_mdg, 1);
  tau_oppland_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oppland_mdg[t] ~ normal(mu_oppland_mdg[t-1], 0.25);
  }
  
  mu_oppland_r[1] ~ normal(initial_prior_oppland_r, 1);
  tau_oppland_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oppland_r[t] ~ normal(mu_oppland_r[t-1], 0.25);
  }
  
  mu_oppland_a[1] ~ normal(initial_prior_oppland_a, 1);
  tau_oppland_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_oppland_a[t] ~ normal(mu_oppland_a[t-1], 0.25);
  }

   //oppland MEASUREMENT MODELS  
  // measurement model oppland Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oppland_ap[t, p] != -9) {
        Y_oppland_ap[t,p]~ normal(shrunken_polls_oppland_ap[t, p], sigma_oppland_ap[t,p]);
        shrunken_polls_oppland_ap[t, p] ~ normal(mu_oppland_ap[t], tau_oppland_ap);
	} else {
        shrunken_polls_oppland_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model oppland H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oppland_h[t, p] != -9) {
        Y_oppland_h[t,p]~ normal(shrunken_polls_oppland_h[t, p], sigma_oppland_h[t,p]);
        shrunken_polls_oppland_h[t, p] ~ normal(mu_oppland_h[t], tau_oppland_h);
	} else {
        shrunken_polls_oppland_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model oppland _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oppland_frp[t, p] != -9) {
        Y_oppland_frp[t,p]~ normal(shrunken_polls_oppland_frp[t, p], sigma_oppland_frp[t,p]);
        shrunken_polls_oppland_frp[t, p] ~ normal(mu_oppland_frp[t], tau_oppland_frp);
	} else {
        shrunken_polls_oppland_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model oppland _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oppland_sv[t, p] != -9) {
        Y_oppland_sv[t,p]~ normal(shrunken_polls_oppland_sv[t, p], sigma_oppland_sv[t,p]);
        shrunken_polls_oppland_sv[t, p] ~ normal(mu_oppland_sv[t], tau_oppland_sv);
	} else {
        shrunken_polls_oppland_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model oppland _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oppland_sp[t, p] != -9) {
        Y_oppland_sp[t,p]~ normal(shrunken_polls_oppland_sp[t, p], sigma_oppland_sp[t,p]);
        shrunken_polls_oppland_sp[t, p] ~ normal(mu_oppland_sp[t], tau_oppland_sp);
	} else {
        shrunken_polls_oppland_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model oppland _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oppland_krf[t, p] != -9) {
        Y_oppland_krf[t,p]~ normal(shrunken_polls_oppland_krf[t, p], sigma_oppland_krf[t,p]);
        shrunken_polls_oppland_krf[t, p] ~ normal(mu_oppland_krf[t], tau_oppland_krf);
	} else {
        shrunken_polls_oppland_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model oppland _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oppland_v[t, p] != -9) {
        Y_oppland_v[t,p]~ normal(shrunken_polls_oppland_v[t, p], sigma_oppland_v[t,p]);
        shrunken_polls_oppland_v[t, p] ~ normal(mu_oppland_v[t], tau_oppland_v);
	} else {
        shrunken_polls_oppland_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model oppland _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oppland_mdg[t, p] != -9) {
        Y_oppland_mdg[t,p]~ normal(shrunken_polls_oppland_mdg[t, p], sigma_oppland_mdg[t,p]);
        shrunken_polls_oppland_mdg[t, p] ~ normal(mu_oppland_mdg[t], tau_oppland_mdg);
	} else {
        shrunken_polls_oppland_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model oppland _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oppland_r[t, p] != -9) {
        Y_oppland_r[t,p]~ normal(shrunken_polls_oppland_r[t, p], sigma_oppland_r[t,p]);
        shrunken_polls_oppland_r[t, p] ~ normal(mu_oppland_r[t], tau_oppland_r);
	} else {
        shrunken_polls_oppland_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model oppland _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_oppland_a[t, p] != -9) {
        Y_oppland_a[t,p]~ normal(shrunken_polls_oppland_a[t, p], sigma_oppland_a[t,p]);
        shrunken_polls_oppland_a[t, p] ~ normal(mu_oppland_a[t], tau_oppland_a);
	} else {
        shrunken_polls_oppland_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
   //buskerud
   
   
   
  // Priors buskerud AP
  // prior on initial difference buskerud AP
  mu_buskerud_ap[1] ~ normal(initial_prior_buskerud_ap, 1);
  tau_buskerud_ap ~ student_t(4, 0, 5);
  
  // state model buskerud AP
  for(t in 2:T) {
    mu_buskerud_ap[t] ~ normal(mu_buskerud_ap[t-1], 0.25);
  }
  

  // Priors buskerud H
  // prior on initial difference buskerud H
  mu_buskerud_h[1] ~ normal(initial_prior_buskerud_h, 1);
  tau_buskerud_h ~ student_t(4, 0, 5);
  
  // state model buskerud H
  for(t in 2:T) {
    mu_buskerud_h[t] ~ normal(mu_buskerud_h[t-1], 0.25);
  }
  
  mu_buskerud_frp[1] ~ normal(initial_prior_buskerud_frp, 1);
  tau_buskerud_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_buskerud_frp[t] ~ normal(mu_buskerud_frp[t-1], 0.25);
  }
  
  mu_buskerud_sv[1] ~ normal(initial_prior_buskerud_sv, 1);
  tau_buskerud_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_buskerud_sv[t] ~ normal(mu_buskerud_sv[t-1], 0.25);
  }
  
  mu_buskerud_sp[1] ~ normal(initial_prior_buskerud_sp, 1);
  tau_buskerud_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_buskerud_sp[t] ~ normal(mu_buskerud_sp[t-1], 0.25);
  }
  
  mu_buskerud_krf[1] ~ normal(initial_prior_buskerud_krf, 1);
  tau_buskerud_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_buskerud_krf[t] ~ normal(mu_buskerud_krf[t-1], 0.25);
  }
  
  mu_buskerud_v[1] ~ normal(initial_prior_buskerud_v, 1);
  tau_buskerud_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_buskerud_v[t] ~ normal(mu_buskerud_v[t-1], 0.25);
  }
  
  mu_buskerud_mdg[1] ~ normal(initial_prior_buskerud_mdg, 1);
  tau_buskerud_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_buskerud_mdg[t] ~ normal(mu_buskerud_mdg[t-1], 0.25);
  }
  
  mu_buskerud_r[1] ~ normal(initial_prior_buskerud_r, 1);
  tau_buskerud_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_buskerud_r[t] ~ normal(mu_buskerud_r[t-1], 0.25);
  }
  
  mu_buskerud_a[1] ~ normal(initial_prior_buskerud_a, 1);
  tau_buskerud_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_buskerud_a[t] ~ normal(mu_buskerud_a[t-1], 0.25);
  }

   //buskerud MEASUREMENT MODELS  
  // measurement model buskerud Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_buskerud_ap[t, p] != -9) {
        Y_buskerud_ap[t,p]~ normal(shrunken_polls_buskerud_ap[t, p], sigma_buskerud_ap[t,p]);
        shrunken_polls_buskerud_ap[t, p] ~ normal(mu_buskerud_ap[t], tau_buskerud_ap);
	} else {
        shrunken_polls_buskerud_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model buskerud H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_buskerud_h[t, p] != -9) {
        Y_buskerud_h[t,p]~ normal(shrunken_polls_buskerud_h[t, p], sigma_buskerud_h[t,p]);
        shrunken_polls_buskerud_h[t, p] ~ normal(mu_buskerud_h[t], tau_buskerud_h);
	} else {
        shrunken_polls_buskerud_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model buskerud _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_buskerud_frp[t, p] != -9) {
        Y_buskerud_frp[t,p]~ normal(shrunken_polls_buskerud_frp[t, p], sigma_buskerud_frp[t,p]);
        shrunken_polls_buskerud_frp[t, p] ~ normal(mu_buskerud_frp[t], tau_buskerud_frp);
	} else {
        shrunken_polls_buskerud_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model buskerud _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_buskerud_sv[t, p] != -9) {
        Y_buskerud_sv[t,p]~ normal(shrunken_polls_buskerud_sv[t, p], sigma_buskerud_sv[t,p]);
        shrunken_polls_buskerud_sv[t, p] ~ normal(mu_buskerud_sv[t], tau_buskerud_sv);
	} else {
        shrunken_polls_buskerud_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model buskerud _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_buskerud_sp[t, p] != -9) {
        Y_buskerud_sp[t,p]~ normal(shrunken_polls_buskerud_sp[t, p], sigma_buskerud_sp[t,p]);
        shrunken_polls_buskerud_sp[t, p] ~ normal(mu_buskerud_sp[t], tau_buskerud_sp);
	} else {
        shrunken_polls_buskerud_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model buskerud _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_buskerud_krf[t, p] != -9) {
        Y_buskerud_krf[t,p]~ normal(shrunken_polls_buskerud_krf[t, p], sigma_buskerud_krf[t,p]);
        shrunken_polls_buskerud_krf[t, p] ~ normal(mu_buskerud_krf[t], tau_buskerud_krf);
	} else {
        shrunken_polls_buskerud_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model buskerud _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_buskerud_v[t, p] != -9) {
        Y_buskerud_v[t,p]~ normal(shrunken_polls_buskerud_v[t, p], sigma_buskerud_v[t,p]);
        shrunken_polls_buskerud_v[t, p] ~ normal(mu_buskerud_v[t], tau_buskerud_v);
	} else {
        shrunken_polls_buskerud_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model buskerud _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_buskerud_mdg[t, p] != -9) {
        Y_buskerud_mdg[t,p]~ normal(shrunken_polls_buskerud_mdg[t, p], sigma_buskerud_mdg[t,p]);
        shrunken_polls_buskerud_mdg[t, p] ~ normal(mu_buskerud_mdg[t], tau_buskerud_mdg);
	} else {
        shrunken_polls_buskerud_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model buskerud _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_buskerud_r[t, p] != -9) {
        Y_buskerud_r[t,p]~ normal(shrunken_polls_buskerud_r[t, p], sigma_buskerud_r[t,p]);
        shrunken_polls_buskerud_r[t, p] ~ normal(mu_buskerud_r[t], tau_buskerud_r);
	} else {
        shrunken_polls_buskerud_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model buskerud _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_buskerud_a[t, p] != -9) {
        Y_buskerud_a[t,p]~ normal(shrunken_polls_buskerud_a[t, p], sigma_buskerud_a[t,p]);
        shrunken_polls_buskerud_a[t, p] ~ normal(mu_buskerud_a[t], tau_buskerud_a);
	} else {
        shrunken_polls_buskerud_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
   //hordaland
   
   
   
  // Priors hordaland AP
  // prior on initial difference hordaland AP
  mu_hordaland_ap[1] ~ normal(initial_prior_hordaland_ap, 1);
  tau_hordaland_ap ~ student_t(4, 0, 5);
  
  // state model hordaland AP
  for(t in 2:T) {
    mu_hordaland_ap[t] ~ normal(mu_hordaland_ap[t-1], 0.25);
  }
  

  // Priors hordaland H
  // prior on initial difference hordaland H
  mu_hordaland_h[1] ~ normal(initial_prior_hordaland_h, 1);
  tau_hordaland_h ~ student_t(4, 0, 5);
  
  // state model hordaland H
  for(t in 2:T) {
    mu_hordaland_h[t] ~ normal(mu_hordaland_h[t-1], 0.25);
  }
  
  mu_hordaland_frp[1] ~ normal(initial_prior_hordaland_frp, 1);
  tau_hordaland_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hordaland_frp[t] ~ normal(mu_hordaland_frp[t-1], 0.25);
  }
  
  mu_hordaland_sv[1] ~ normal(initial_prior_hordaland_sv, 1);
  tau_hordaland_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hordaland_sv[t] ~ normal(mu_hordaland_sv[t-1], 0.25);
  }
  
  mu_hordaland_sp[1] ~ normal(initial_prior_hordaland_sp, 1);
  tau_hordaland_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hordaland_sp[t] ~ normal(mu_hordaland_sp[t-1], 0.25);
  }
  
  mu_hordaland_krf[1] ~ normal(initial_prior_hordaland_krf, 1);
  tau_hordaland_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hordaland_krf[t] ~ normal(mu_hordaland_krf[t-1], 0.25);
  }
  
  mu_hordaland_v[1] ~ normal(initial_prior_hordaland_v, 1);
  tau_hordaland_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hordaland_v[t] ~ normal(mu_hordaland_v[t-1], 0.25);
  }
  
  mu_hordaland_mdg[1] ~ normal(initial_prior_hordaland_mdg, 1);
  tau_hordaland_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hordaland_mdg[t] ~ normal(mu_hordaland_mdg[t-1], 0.25);
  }
  
  mu_hordaland_r[1] ~ normal(initial_prior_hordaland_r, 1);
  tau_hordaland_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hordaland_r[t] ~ normal(mu_hordaland_r[t-1], 0.25);
  }
  
  mu_hordaland_a[1] ~ normal(initial_prior_hordaland_a, 1);
  tau_hordaland_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hordaland_a[t] ~ normal(mu_hordaland_a[t-1], 0.25);
  }

   //hordaland MEASUREMENT MODELS  
  // measurement model hordaland Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hordaland_ap[t, p] != -9) {
        Y_hordaland_ap[t,p]~ normal(shrunken_polls_hordaland_ap[t, p], sigma_hordaland_ap[t,p]);
        shrunken_polls_hordaland_ap[t, p] ~ normal(mu_hordaland_ap[t], tau_hordaland_ap);
	} else {
        shrunken_polls_hordaland_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hordaland H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hordaland_h[t, p] != -9) {
        Y_hordaland_h[t,p]~ normal(shrunken_polls_hordaland_h[t, p], sigma_hordaland_h[t,p]);
        shrunken_polls_hordaland_h[t, p] ~ normal(mu_hordaland_h[t], tau_hordaland_h);
	} else {
        shrunken_polls_hordaland_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hordaland _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hordaland_frp[t, p] != -9) {
        Y_hordaland_frp[t,p]~ normal(shrunken_polls_hordaland_frp[t, p], sigma_hordaland_frp[t,p]);
        shrunken_polls_hordaland_frp[t, p] ~ normal(mu_hordaland_frp[t], tau_hordaland_frp);
	} else {
        shrunken_polls_hordaland_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model hordaland _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hordaland_sv[t, p] != -9) {
        Y_hordaland_sv[t,p]~ normal(shrunken_polls_hordaland_sv[t, p], sigma_hordaland_sv[t,p]);
        shrunken_polls_hordaland_sv[t, p] ~ normal(mu_hordaland_sv[t], tau_hordaland_sv);
	} else {
        shrunken_polls_hordaland_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model hordaland _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hordaland_sp[t, p] != -9) {
        Y_hordaland_sp[t,p]~ normal(shrunken_polls_hordaland_sp[t, p], sigma_hordaland_sp[t,p]);
        shrunken_polls_hordaland_sp[t, p] ~ normal(mu_hordaland_sp[t], tau_hordaland_sp);
	} else {
        shrunken_polls_hordaland_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model hordaland _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hordaland_krf[t, p] != -9) {
        Y_hordaland_krf[t,p]~ normal(shrunken_polls_hordaland_krf[t, p], sigma_hordaland_krf[t,p]);
        shrunken_polls_hordaland_krf[t, p] ~ normal(mu_hordaland_krf[t], tau_hordaland_krf);
	} else {
        shrunken_polls_hordaland_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hordaland _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hordaland_v[t, p] != -9) {
        Y_hordaland_v[t,p]~ normal(shrunken_polls_hordaland_v[t, p], sigma_hordaland_v[t,p]);
        shrunken_polls_hordaland_v[t, p] ~ normal(mu_hordaland_v[t], tau_hordaland_v);
	} else {
        shrunken_polls_hordaland_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hordaland _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hordaland_mdg[t, p] != -9) {
        Y_hordaland_mdg[t,p]~ normal(shrunken_polls_hordaland_mdg[t, p], sigma_hordaland_mdg[t,p]);
        shrunken_polls_hordaland_mdg[t, p] ~ normal(mu_hordaland_mdg[t], tau_hordaland_mdg);
	} else {
        shrunken_polls_hordaland_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hordaland _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hordaland_r[t, p] != -9) {
        Y_hordaland_r[t,p]~ normal(shrunken_polls_hordaland_r[t, p], sigma_hordaland_r[t,p]);
        shrunken_polls_hordaland_r[t, p] ~ normal(mu_hordaland_r[t], tau_hordaland_r);
	} else {
        shrunken_polls_hordaland_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hordaland _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hordaland_a[t, p] != -9) {
        Y_hordaland_a[t,p]~ normal(shrunken_polls_hordaland_a[t, p], sigma_hordaland_a[t,p]);
        shrunken_polls_hordaland_a[t, p] ~ normal(mu_hordaland_a[t], tau_hordaland_a);
	} else {
        shrunken_polls_hordaland_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
     //sogn
   
   
   
  // Priors sogn AP
  // prior on initial difference sogn AP
  mu_sogn_ap[1] ~ normal(initial_prior_sogn_ap, 1);
  tau_sogn_ap ~ student_t(4, 0, 5);
  
  // state model sogn AP
  for(t in 2:T) {
    mu_sogn_ap[t] ~ normal(mu_sogn_ap[t-1], 0.25);
  }
  

  // Priors sogn H
  // prior on initial difference sogn H
  mu_sogn_h[1] ~ normal(initial_prior_sogn_h, 1);
  tau_sogn_h ~ student_t(4, 0, 5);
  
  // state model sogn H
  for(t in 2:T) {
    mu_sogn_h[t] ~ normal(mu_sogn_h[t-1], 0.25);
  }
  
  mu_sogn_frp[1] ~ normal(initial_prior_sogn_frp, 1);
  tau_sogn_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sogn_frp[t] ~ normal(mu_sogn_frp[t-1], 0.25);
  }
  
  mu_sogn_sv[1] ~ normal(initial_prior_sogn_sv, 1);
  tau_sogn_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sogn_sv[t] ~ normal(mu_sogn_sv[t-1], 0.25);
  }
  
  mu_sogn_sp[1] ~ normal(initial_prior_sogn_sp, 1);
  tau_sogn_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sogn_sp[t] ~ normal(mu_sogn_sp[t-1], 0.25);
  }
  
  mu_sogn_krf[1] ~ normal(initial_prior_sogn_krf, 1);
  tau_sogn_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sogn_krf[t] ~ normal(mu_sogn_krf[t-1], 0.25);
  }
  
  mu_sogn_v[1] ~ normal(initial_prior_sogn_v, 1);
  tau_sogn_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sogn_v[t] ~ normal(mu_sogn_v[t-1], 0.25);
  }
  
  mu_sogn_mdg[1] ~ normal(initial_prior_sogn_mdg, 1);
  tau_sogn_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sogn_mdg[t] ~ normal(mu_sogn_mdg[t-1], 0.25);
  }
  
  mu_sogn_r[1] ~ normal(initial_prior_sogn_r, 1);
  tau_sogn_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sogn_r[t] ~ normal(mu_sogn_r[t-1], 0.25);
  }
  
  mu_sogn_a[1] ~ normal(initial_prior_sogn_a, 1);
  tau_sogn_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sogn_a[t] ~ normal(mu_sogn_a[t-1], 0.25);
  }

   //sogn MEASUREMENT MODELS  
  // measurement model sogn Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sogn_ap[t, p] != -9) {
        Y_sogn_ap[t,p]~ normal(shrunken_polls_sogn_ap[t, p], sigma_sogn_ap[t,p]);
        shrunken_polls_sogn_ap[t, p] ~ normal(mu_sogn_ap[t], tau_sogn_ap);
	} else {
        shrunken_polls_sogn_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sogn H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sogn_h[t, p] != -9) {
        Y_sogn_h[t,p]~ normal(shrunken_polls_sogn_h[t, p], sigma_sogn_h[t,p]);
        shrunken_polls_sogn_h[t, p] ~ normal(mu_sogn_h[t], tau_sogn_h);
	} else {
        shrunken_polls_sogn_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sogn _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sogn_frp[t, p] != -9) {
        Y_sogn_frp[t,p]~ normal(shrunken_polls_sogn_frp[t, p], sigma_sogn_frp[t,p]);
        shrunken_polls_sogn_frp[t, p] ~ normal(mu_sogn_frp[t], tau_sogn_frp);
	} else {
        shrunken_polls_sogn_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model sogn _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sogn_sv[t, p] != -9) {
        Y_sogn_sv[t,p]~ normal(shrunken_polls_sogn_sv[t, p], sigma_sogn_sv[t,p]);
        shrunken_polls_sogn_sv[t, p] ~ normal(mu_sogn_sv[t], tau_sogn_sv);
	} else {
        shrunken_polls_sogn_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model sogn _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sogn_sp[t, p] != -9) {
        Y_sogn_sp[t,p]~ normal(shrunken_polls_sogn_sp[t, p], sigma_sogn_sp[t,p]);
        shrunken_polls_sogn_sp[t, p] ~ normal(mu_sogn_sp[t], tau_sogn_sp);
	} else {
        shrunken_polls_sogn_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model sogn _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sogn_krf[t, p] != -9) {
        Y_sogn_krf[t,p]~ normal(shrunken_polls_sogn_krf[t, p], sigma_sogn_krf[t,p]);
        shrunken_polls_sogn_krf[t, p] ~ normal(mu_sogn_krf[t], tau_sogn_krf);
	} else {
        shrunken_polls_sogn_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sogn _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sogn_v[t, p] != -9) {
        Y_sogn_v[t,p]~ normal(shrunken_polls_sogn_v[t, p], sigma_sogn_v[t,p]);
        shrunken_polls_sogn_v[t, p] ~ normal(mu_sogn_v[t], tau_sogn_v);
	} else {
        shrunken_polls_sogn_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sogn _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sogn_mdg[t, p] != -9) {
        Y_sogn_mdg[t,p]~ normal(shrunken_polls_sogn_mdg[t, p], sigma_sogn_mdg[t,p]);
        shrunken_polls_sogn_mdg[t, p] ~ normal(mu_sogn_mdg[t], tau_sogn_mdg);
	} else {
        shrunken_polls_sogn_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sogn _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sogn_r[t, p] != -9) {
        Y_sogn_r[t,p]~ normal(shrunken_polls_sogn_r[t, p], sigma_sogn_r[t,p]);
        shrunken_polls_sogn_r[t, p] ~ normal(mu_sogn_r[t], tau_sogn_r);
	} else {
        shrunken_polls_sogn_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sogn _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sogn_a[t, p] != -9) {
        Y_sogn_a[t,p]~ normal(shrunken_polls_sogn_a[t, p], sigma_sogn_a[t,p]);
        shrunken_polls_sogn_a[t, p] ~ normal(mu_sogn_a[t], tau_sogn_a);
	} else {
        shrunken_polls_sogn_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
   //austagder
   
   
   
  // Priors austagder AP
  // prior on initial difference austagder AP
  mu_austagder_ap[1] ~ normal(initial_prior_austagder_ap, 1);
  tau_austagder_ap ~ student_t(4, 0, 5);
  
  // state model austagder AP
  for(t in 2:T) {
    mu_austagder_ap[t] ~ normal(mu_austagder_ap[t-1], 0.25);
  }
  

  // Priors austagder H
  // prior on initial difference austagder H
  mu_austagder_h[1] ~ normal(initial_prior_austagder_h, 1);
  tau_austagder_h ~ student_t(4, 0, 5);
  
  // state model austagder H
  for(t in 2:T) {
    mu_austagder_h[t] ~ normal(mu_austagder_h[t-1], 0.25);
  }
  
  mu_austagder_frp[1] ~ normal(initial_prior_austagder_frp, 1);
  tau_austagder_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_austagder_frp[t] ~ normal(mu_austagder_frp[t-1], 0.25);
  }
  
  mu_austagder_sv[1] ~ normal(initial_prior_austagder_sv, 1);
  tau_austagder_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_austagder_sv[t] ~ normal(mu_austagder_sv[t-1], 0.25);
  }
  
  mu_austagder_sp[1] ~ normal(initial_prior_austagder_sp, 1);
  tau_austagder_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_austagder_sp[t] ~ normal(mu_austagder_sp[t-1], 0.25);
  }
  
  mu_austagder_krf[1] ~ normal(initial_prior_austagder_krf, 1);
  tau_austagder_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_austagder_krf[t] ~ normal(mu_austagder_krf[t-1], 0.25);
  }
  
  mu_austagder_v[1] ~ normal(initial_prior_austagder_v, 1);
  tau_austagder_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_austagder_v[t] ~ normal(mu_austagder_v[t-1], 0.25);
  }
  
  mu_austagder_mdg[1] ~ normal(initial_prior_austagder_mdg, 1);
  tau_austagder_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_austagder_mdg[t] ~ normal(mu_austagder_mdg[t-1], 0.25);
  }
  
  mu_austagder_r[1] ~ normal(initial_prior_austagder_r, 1);
  tau_austagder_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_austagder_r[t] ~ normal(mu_austagder_r[t-1], 0.25);
  }
  
  mu_austagder_a[1] ~ normal(initial_prior_austagder_a, 1);
  tau_austagder_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_austagder_a[t] ~ normal(mu_austagder_a[t-1], 0.25);
  }

   //austagder MEASUREMENT MODELS  
  // measurement model austagder Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_austagder_ap[t, p] != -9) {
        Y_austagder_ap[t,p]~ normal(shrunken_polls_austagder_ap[t, p], sigma_austagder_ap[t,p]);
        shrunken_polls_austagder_ap[t, p] ~ normal(mu_austagder_ap[t], tau_austagder_ap);
	} else {
        shrunken_polls_austagder_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model austagder H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_austagder_h[t, p] != -9) {
        Y_austagder_h[t,p]~ normal(shrunken_polls_austagder_h[t, p], sigma_austagder_h[t,p]);
        shrunken_polls_austagder_h[t, p] ~ normal(mu_austagder_h[t], tau_austagder_h);
	} else {
        shrunken_polls_austagder_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model austagder _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_austagder_frp[t, p] != -9) {
        Y_austagder_frp[t,p]~ normal(shrunken_polls_austagder_frp[t, p], sigma_austagder_frp[t,p]);
        shrunken_polls_austagder_frp[t, p] ~ normal(mu_austagder_frp[t], tau_austagder_frp);
	} else {
        shrunken_polls_austagder_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model austagder _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_austagder_sv[t, p] != -9) {
        Y_austagder_sv[t,p]~ normal(shrunken_polls_austagder_sv[t, p], sigma_austagder_sv[t,p]);
        shrunken_polls_austagder_sv[t, p] ~ normal(mu_austagder_sv[t], tau_austagder_sv);
	} else {
        shrunken_polls_austagder_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model austagder _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_austagder_sp[t, p] != -9) {
        Y_austagder_sp[t,p]~ normal(shrunken_polls_austagder_sp[t, p], sigma_austagder_sp[t,p]);
        shrunken_polls_austagder_sp[t, p] ~ normal(mu_austagder_sp[t], tau_austagder_sp);
	} else {
        shrunken_polls_austagder_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model austagder _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_austagder_krf[t, p] != -9) {
        Y_austagder_krf[t,p]~ normal(shrunken_polls_austagder_krf[t, p], sigma_austagder_krf[t,p]);
        shrunken_polls_austagder_krf[t, p] ~ normal(mu_austagder_krf[t], tau_austagder_krf);
	} else {
        shrunken_polls_austagder_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model austagder _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_austagder_v[t, p] != -9) {
        Y_austagder_v[t,p]~ normal(shrunken_polls_austagder_v[t, p], sigma_austagder_v[t,p]);
        shrunken_polls_austagder_v[t, p] ~ normal(mu_austagder_v[t], tau_austagder_v);
	} else {
        shrunken_polls_austagder_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model austagder _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_austagder_mdg[t, p] != -9) {
        Y_austagder_mdg[t,p]~ normal(shrunken_polls_austagder_mdg[t, p], sigma_austagder_mdg[t,p]);
        shrunken_polls_austagder_mdg[t, p] ~ normal(mu_austagder_mdg[t], tau_austagder_mdg);
	} else {
        shrunken_polls_austagder_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model austagder _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_austagder_r[t, p] != -9) {
        Y_austagder_r[t,p]~ normal(shrunken_polls_austagder_r[t, p], sigma_austagder_r[t,p]);
        shrunken_polls_austagder_r[t, p] ~ normal(mu_austagder_r[t], tau_austagder_r);
	} else {
        shrunken_polls_austagder_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model austagder _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_austagder_a[t, p] != -9) {
        Y_austagder_a[t,p]~ normal(shrunken_polls_austagder_a[t, p], sigma_austagder_a[t,p]);
        shrunken_polls_austagder_a[t, p] ~ normal(mu_austagder_a[t], tau_austagder_a);
	} else {
        shrunken_polls_austagder_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
  
   //vestagder
   
   
   
  // Priors vestagder AP
  // prior on initial difference vestagder AP
  mu_vestagder_ap[1] ~ normal(initial_prior_vestagder_ap, 1);
  tau_vestagder_ap ~ student_t(4, 0, 5);
  
  // state model vestagder AP
  for(t in 2:T) {
    mu_vestagder_ap[t] ~ normal(mu_vestagder_ap[t-1], 0.25);
  }
  

  // Priors vestagder H
  // prior on initial difference vestagder H
  mu_vestagder_h[1] ~ normal(initial_prior_vestagder_h, 1);
  tau_vestagder_h ~ student_t(4, 0, 5);
  
  // state model vestagder H
  for(t in 2:T) {
    mu_vestagder_h[t] ~ normal(mu_vestagder_h[t-1], 0.25);
  }
  
  mu_vestagder_frp[1] ~ normal(initial_prior_vestagder_frp, 1);
  tau_vestagder_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestagder_frp[t] ~ normal(mu_vestagder_frp[t-1], 0.25);
  }
  
  mu_vestagder_sv[1] ~ normal(initial_prior_vestagder_sv, 1);
  tau_vestagder_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestagder_sv[t] ~ normal(mu_vestagder_sv[t-1], 0.25);
  }
  
  mu_vestagder_sp[1] ~ normal(initial_prior_vestagder_sp, 1);
  tau_vestagder_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestagder_sp[t] ~ normal(mu_vestagder_sp[t-1], 0.25);
  }
  
  mu_vestagder_krf[1] ~ normal(initial_prior_vestagder_krf, 1);
  tau_vestagder_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestagder_krf[t] ~ normal(mu_vestagder_krf[t-1], 0.25);
  }
  
  mu_vestagder_v[1] ~ normal(initial_prior_vestagder_v, 1);
  tau_vestagder_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestagder_v[t] ~ normal(mu_vestagder_v[t-1], 0.25);
  }
  
  mu_vestagder_mdg[1] ~ normal(initial_prior_vestagder_mdg, 1);
  tau_vestagder_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestagder_mdg[t] ~ normal(mu_vestagder_mdg[t-1], 0.25);
  }
  
  mu_vestagder_r[1] ~ normal(initial_prior_vestagder_r, 1);
  tau_vestagder_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestagder_r[t] ~ normal(mu_vestagder_r[t-1], 0.25);
  }
  
  mu_vestagder_a[1] ~ normal(initial_prior_vestagder_a, 1);
  tau_vestagder_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestagder_a[t] ~ normal(mu_vestagder_a[t-1], 0.25);
  }

   //vestagder MEASUREMENT MODELS  
  // measurement model vestagder Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestagder_ap[t, p] != -9) {
        Y_vestagder_ap[t,p]~ normal(shrunken_polls_vestagder_ap[t, p], sigma_vestagder_ap[t,p]);
        shrunken_polls_vestagder_ap[t, p] ~ normal(mu_vestagder_ap[t], tau_vestagder_ap);
	} else {
        shrunken_polls_vestagder_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestagder H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestagder_h[t, p] != -9) {
        Y_vestagder_h[t,p]~ normal(shrunken_polls_vestagder_h[t, p], sigma_vestagder_h[t,p]);
        shrunken_polls_vestagder_h[t, p] ~ normal(mu_vestagder_h[t], tau_vestagder_h);
	} else {
        shrunken_polls_vestagder_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestagder _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestagder_frp[t, p] != -9) {
        Y_vestagder_frp[t,p]~ normal(shrunken_polls_vestagder_frp[t, p], sigma_vestagder_frp[t,p]);
        shrunken_polls_vestagder_frp[t, p] ~ normal(mu_vestagder_frp[t], tau_vestagder_frp);
	} else {
        shrunken_polls_vestagder_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model vestagder _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestagder_sv[t, p] != -9) {
        Y_vestagder_sv[t,p]~ normal(shrunken_polls_vestagder_sv[t, p], sigma_vestagder_sv[t,p]);
        shrunken_polls_vestagder_sv[t, p] ~ normal(mu_vestagder_sv[t], tau_vestagder_sv);
	} else {
        shrunken_polls_vestagder_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model vestagder _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestagder_sp[t, p] != -9) {
        Y_vestagder_sp[t,p]~ normal(shrunken_polls_vestagder_sp[t, p], sigma_vestagder_sp[t,p]);
        shrunken_polls_vestagder_sp[t, p] ~ normal(mu_vestagder_sp[t], tau_vestagder_sp);
	} else {
        shrunken_polls_vestagder_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model vestagder _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestagder_krf[t, p] != -9) {
        Y_vestagder_krf[t,p]~ normal(shrunken_polls_vestagder_krf[t, p], sigma_vestagder_krf[t,p]);
        shrunken_polls_vestagder_krf[t, p] ~ normal(mu_vestagder_krf[t], tau_vestagder_krf);
	} else {
        shrunken_polls_vestagder_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestagder _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestagder_v[t, p] != -9) {
        Y_vestagder_v[t,p]~ normal(shrunken_polls_vestagder_v[t, p], sigma_vestagder_v[t,p]);
        shrunken_polls_vestagder_v[t, p] ~ normal(mu_vestagder_v[t], tau_vestagder_v);
	} else {
        shrunken_polls_vestagder_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestagder _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestagder_mdg[t, p] != -9) {
        Y_vestagder_mdg[t,p]~ normal(shrunken_polls_vestagder_mdg[t, p], sigma_vestagder_mdg[t,p]);
        shrunken_polls_vestagder_mdg[t, p] ~ normal(mu_vestagder_mdg[t], tau_vestagder_mdg);
	} else {
        shrunken_polls_vestagder_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestagder _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestagder_r[t, p] != -9) {
        Y_vestagder_r[t,p]~ normal(shrunken_polls_vestagder_r[t, p], sigma_vestagder_r[t,p]);
        shrunken_polls_vestagder_r[t, p] ~ normal(mu_vestagder_r[t], tau_vestagder_r);
	} else {
        shrunken_polls_vestagder_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestagder _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestagder_a[t, p] != -9) {
        Y_vestagder_a[t,p]~ normal(shrunken_polls_vestagder_a[t, p], sigma_vestagder_a[t,p]);
        shrunken_polls_vestagder_a[t, p] ~ normal(mu_vestagder_a[t], tau_vestagder_a);
	} else {
        shrunken_polls_vestagder_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
     //rogaland
   
   
   
  // Priors rogaland AP
  // prior on initial difference rogaland AP
  mu_rogaland_ap[1] ~ normal(initial_prior_rogaland_ap, 1);
  tau_rogaland_ap ~ student_t(4, 0, 5);
  
  // state model rogaland AP
  for(t in 2:T) {
    mu_rogaland_ap[t] ~ normal(mu_rogaland_ap[t-1], 0.25);
  }
  

  // Priors rogaland H
  // prior on initial difference rogaland H
  mu_rogaland_h[1] ~ normal(initial_prior_rogaland_h, 1);
  tau_rogaland_h ~ student_t(4, 0, 5);
  
  // state model rogaland H
  for(t in 2:T) {
    mu_rogaland_h[t] ~ normal(mu_rogaland_h[t-1], 0.25);
  }
  
  mu_rogaland_frp[1] ~ normal(initial_prior_rogaland_frp, 1);
  tau_rogaland_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_rogaland_frp[t] ~ normal(mu_rogaland_frp[t-1], 0.25);
  }
  
  mu_rogaland_sv[1] ~ normal(initial_prior_rogaland_sv, 1);
  tau_rogaland_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_rogaland_sv[t] ~ normal(mu_rogaland_sv[t-1], 0.25);
  }
  
  mu_rogaland_sp[1] ~ normal(initial_prior_rogaland_sp, 1);
  tau_rogaland_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_rogaland_sp[t] ~ normal(mu_rogaland_sp[t-1], 0.25);
  }
  
  mu_rogaland_krf[1] ~ normal(initial_prior_rogaland_krf, 1);
  tau_rogaland_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_rogaland_krf[t] ~ normal(mu_rogaland_krf[t-1], 0.25);
  }
  
  mu_rogaland_v[1] ~ normal(initial_prior_rogaland_v, 1);
  tau_rogaland_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_rogaland_v[t] ~ normal(mu_rogaland_v[t-1], 0.25);
  }
  
  mu_rogaland_mdg[1] ~ normal(initial_prior_rogaland_mdg, 1);
  tau_rogaland_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_rogaland_mdg[t] ~ normal(mu_rogaland_mdg[t-1], 0.25);
  }
  
  mu_rogaland_r[1] ~ normal(initial_prior_rogaland_r, 1);
  tau_rogaland_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_rogaland_r[t] ~ normal(mu_rogaland_r[t-1], 0.25);
  }
  
  mu_rogaland_a[1] ~ normal(initial_prior_rogaland_a, 1);
  tau_rogaland_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_rogaland_a[t] ~ normal(mu_rogaland_a[t-1], 0.25);
  }

   //rogaland MEASUREMENT MODELS  
  // measurement model rogaland Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_rogaland_ap[t, p] != -9) {
        Y_rogaland_ap[t,p]~ normal(shrunken_polls_rogaland_ap[t, p], sigma_rogaland_ap[t,p]);
        shrunken_polls_rogaland_ap[t, p] ~ normal(mu_rogaland_ap[t], tau_rogaland_ap);
	} else {
        shrunken_polls_rogaland_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model rogaland H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_rogaland_h[t, p] != -9) {
        Y_rogaland_h[t,p]~ normal(shrunken_polls_rogaland_h[t, p], sigma_rogaland_h[t,p]);
        shrunken_polls_rogaland_h[t, p] ~ normal(mu_rogaland_h[t], tau_rogaland_h);
	} else {
        shrunken_polls_rogaland_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model rogaland _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_rogaland_frp[t, p] != -9) {
        Y_rogaland_frp[t,p]~ normal(shrunken_polls_rogaland_frp[t, p], sigma_rogaland_frp[t,p]);
        shrunken_polls_rogaland_frp[t, p] ~ normal(mu_rogaland_frp[t], tau_rogaland_frp);
	} else {
        shrunken_polls_rogaland_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model rogaland _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_rogaland_sv[t, p] != -9) {
        Y_rogaland_sv[t,p]~ normal(shrunken_polls_rogaland_sv[t, p], sigma_rogaland_sv[t,p]);
        shrunken_polls_rogaland_sv[t, p] ~ normal(mu_rogaland_sv[t], tau_rogaland_sv);
	} else {
        shrunken_polls_rogaland_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model rogaland _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_rogaland_sp[t, p] != -9) {
        Y_rogaland_sp[t,p]~ normal(shrunken_polls_rogaland_sp[t, p], sigma_rogaland_sp[t,p]);
        shrunken_polls_rogaland_sp[t, p] ~ normal(mu_rogaland_sp[t], tau_rogaland_sp);
	} else {
        shrunken_polls_rogaland_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model rogaland _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_rogaland_krf[t, p] != -9) {
        Y_rogaland_krf[t,p]~ normal(shrunken_polls_rogaland_krf[t, p], sigma_rogaland_krf[t,p]);
        shrunken_polls_rogaland_krf[t, p] ~ normal(mu_rogaland_krf[t], tau_rogaland_krf);
	} else {
        shrunken_polls_rogaland_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model rogaland _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_rogaland_v[t, p] != -9) {
        Y_rogaland_v[t,p]~ normal(shrunken_polls_rogaland_v[t, p], sigma_rogaland_v[t,p]);
        shrunken_polls_rogaland_v[t, p] ~ normal(mu_rogaland_v[t], tau_rogaland_v);
	} else {
        shrunken_polls_rogaland_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model rogaland _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_rogaland_mdg[t, p] != -9) {
        Y_rogaland_mdg[t,p]~ normal(shrunken_polls_rogaland_mdg[t, p], sigma_rogaland_mdg[t,p]);
        shrunken_polls_rogaland_mdg[t, p] ~ normal(mu_rogaland_mdg[t], tau_rogaland_mdg);
	} else {
        shrunken_polls_rogaland_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model rogaland _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_rogaland_r[t, p] != -9) {
        Y_rogaland_r[t,p]~ normal(shrunken_polls_rogaland_r[t, p], sigma_rogaland_r[t,p]);
        shrunken_polls_rogaland_r[t, p] ~ normal(mu_rogaland_r[t], tau_rogaland_r);
	} else {
        shrunken_polls_rogaland_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model rogaland _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_rogaland_a[t, p] != -9) {
        Y_rogaland_a[t,p]~ normal(shrunken_polls_rogaland_a[t, p], sigma_rogaland_a[t,p]);
        shrunken_polls_rogaland_a[t, p] ~ normal(mu_rogaland_a[t], tau_rogaland_a);
	} else {
        shrunken_polls_rogaland_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
  
  
  
  

   //trondelag
   
   
   
  // Priors trondelag AP
  // prior on initial difference trondelag AP
  mu_nordtrondelag_ap[1] ~ normal(initial_prior_nordtrondelag_ap, 1);
  tau_nordtrondelag_ap ~ student_t(4, 0, 5);
  
  // state model trondelag AP
  for(t in 2:T) {
    mu_nordtrondelag_ap[t] ~ normal(mu_nordtrondelag_ap[t-1], 0.25);
  }
  

  // Priors trondelag H
  // prior on initial difference trondelag H
  mu_nordtrondelag_h[1] ~ normal(initial_prior_nordtrondelag_h, 1);
  tau_nordtrondelag_h ~ student_t(4, 0, 5);
  
  // state model trondelag H
  for(t in 2:T) {
    mu_nordtrondelag_h[t] ~ normal(mu_nordtrondelag_h[t-1], 0.25);
  }
  
  mu_nordtrondelag_frp[1] ~ normal(initial_prior_nordtrondelag_frp, 1);
  tau_nordtrondelag_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordtrondelag_frp[t] ~ normal(mu_nordtrondelag_frp[t-1], 0.25);
  }
  
  mu_nordtrondelag_sv[1] ~ normal(initial_prior_nordtrondelag_sv, 1);
  tau_nordtrondelag_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordtrondelag_sv[t] ~ normal(mu_nordtrondelag_sv[t-1], 0.25);
  }
  
  mu_nordtrondelag_sp[1] ~ normal(initial_prior_nordtrondelag_sp, 1);
  tau_nordtrondelag_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordtrondelag_sp[t] ~ normal(mu_nordtrondelag_sp[t-1], 0.25);
  }
  
  mu_nordtrondelag_krf[1] ~ normal(initial_prior_nordtrondelag_krf, 1);
  tau_nordtrondelag_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordtrondelag_krf[t] ~ normal(mu_nordtrondelag_krf[t-1], 0.25);
  }
  
  mu_nordtrondelag_v[1] ~ normal(initial_prior_nordtrondelag_v, 1);
  tau_nordtrondelag_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordtrondelag_v[t] ~ normal(mu_nordtrondelag_v[t-1], 0.25);
  }
  
  mu_nordtrondelag_mdg[1] ~ normal(initial_prior_nordtrondelag_mdg, 1);
  tau_nordtrondelag_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordtrondelag_mdg[t] ~ normal(mu_nordtrondelag_mdg[t-1], 0.25);
  }
  
  mu_nordtrondelag_r[1] ~ normal(initial_prior_nordtrondelag_r, 1);
  tau_nordtrondelag_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordtrondelag_r[t] ~ normal(mu_nordtrondelag_r[t-1], 0.25);
  }
  
  mu_nordtrondelag_a[1] ~ normal(initial_prior_nordtrondelag_a, 1);
  tau_nordtrondelag_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_nordtrondelag_a[t] ~ normal(mu_nordtrondelag_a[t-1], 0.25);
  }

   //trondelag MEASUREMENT MODELS  
  // measurement model trondelag Ap
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordtrondelag_ap[t, p] != -9) {
        Y_nordtrondelag_ap[t,p]~ normal(shrunken_polls_nordtrondelag_ap[t, p], sigma_nordtrondelag_ap[t,p]);
        shrunken_polls_nordtrondelag_ap[t, p] ~ normal(mu_nordtrondelag_ap[t], tau_nordtrondelag_ap);
	} else {
        shrunken_polls_nordtrondelag_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model trondelag H
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordtrondelag_h[t, p] != -9) {
        Y_nordtrondelag_h[t,p]~ normal(shrunken_polls_nordtrondelag_h[t, p], sigma_nordtrondelag_h[t,p]);
        shrunken_polls_nordtrondelag_h[t, p] ~ normal(mu_nordtrondelag_h[t], tau_nordtrondelag_h);
	} else {
        shrunken_polls_nordtrondelag_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model trondelag _frp
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordtrondelag_frp[t, p] != -9) {
        Y_nordtrondelag_frp[t,p]~ normal(shrunken_polls_nordtrondelag_frp[t, p], sigma_nordtrondelag_frp[t,p]);
        shrunken_polls_nordtrondelag_frp[t, p] ~ normal(mu_nordtrondelag_frp[t], tau_nordtrondelag_frp);
	} else {
        shrunken_polls_nordtrondelag_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model trondelag _sv
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordtrondelag_sv[t, p] != -9) {
        Y_nordtrondelag_sv[t,p]~ normal(shrunken_polls_nordtrondelag_sv[t, p], sigma_nordtrondelag_sv[t,p]);
        shrunken_polls_nordtrondelag_sv[t, p] ~ normal(mu_nordtrondelag_sv[t], tau_nordtrondelag_sv);
	} else {
        shrunken_polls_nordtrondelag_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model trondelag _sp
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordtrondelag_sp[t, p] != -9) {
        Y_nordtrondelag_sp[t,p]~ normal(shrunken_polls_nordtrondelag_sp[t, p], sigma_nordtrondelag_sp[t,p]);
        shrunken_polls_nordtrondelag_sp[t, p] ~ normal(mu_nordtrondelag_sp[t], tau_nordtrondelag_sp);
	} else {
        shrunken_polls_nordtrondelag_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model trondelag _krf
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordtrondelag_krf[t, p] != -9) {
        Y_nordtrondelag_krf[t,p]~ normal(shrunken_polls_nordtrondelag_krf[t, p], sigma_nordtrondelag_krf[t,p]);
        shrunken_polls_nordtrondelag_krf[t, p] ~ normal(mu_nordtrondelag_krf[t], tau_nordtrondelag_krf);
	} else {
        shrunken_polls_nordtrondelag_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model trondelag _v
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordtrondelag_v[t, p] != -9) {
        Y_nordtrondelag_v[t,p]~ normal(shrunken_polls_nordtrondelag_v[t, p], sigma_nordtrondelag_v[t,p]);
        shrunken_polls_nordtrondelag_v[t, p] ~ normal(mu_nordtrondelag_v[t], tau_nordtrondelag_v);
	} else {
        shrunken_polls_nordtrondelag_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model trondelag _mdg
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordtrondelag_mdg[t, p] != -9) {
        Y_nordtrondelag_mdg[t,p]~ normal(shrunken_polls_nordtrondelag_mdg[t, p], sigma_nordtrondelag_mdg[t,p]);
        shrunken_polls_nordtrondelag_mdg[t, p] ~ normal(mu_nordtrondelag_mdg[t], tau_nordtrondelag_mdg);
	} else {
        shrunken_polls_nordtrondelag_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model trondelag _r
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordtrondelag_r[t, p] != -9) {
        Y_nordtrondelag_r[t,p]~ normal(shrunken_polls_nordtrondelag_r[t, p], sigma_nordtrondelag_r[t,p]);
        shrunken_polls_nordtrondelag_r[t, p] ~ normal(mu_nordtrondelag_r[t], tau_nordtrondelag_r);
	} else {
        shrunken_polls_nordtrondelag_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model trondelag _a
  for(t in 1:T) {
    for(p in 1:polls2) {
      if(Y_nordtrondelag_a[t, p] != -9) {
        Y_nordtrondelag_a[t,p]~ normal(shrunken_polls_nordtrondelag_a[t, p], sigma_nordtrondelag_a[t,p]);
        shrunken_polls_nordtrondelag_a[t, p] ~ normal(mu_nordtrondelag_a[t], tau_nordtrondelag_a);
	} else {
        shrunken_polls_nordtrondelag_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
  
  
   //hedmark
   
   
   
  // Priors hedmark AP
  // prior on initial difference hedmark AP
  mu_hedmark_ap[1] ~ normal(initial_prior_hedmark_ap, 1);
  tau_hedmark_ap ~ student_t(4, 0, 5);
  
  // state model hedmark AP
  for(t in 2:T) {
    mu_hedmark_ap[t] ~ normal(mu_hedmark_ap[t-1], 0.25);
  }
  

  // Priors hedmark H
  // prior on initial difference hedmark H
  mu_hedmark_h[1] ~ normal(initial_prior_hedmark_h, 1);
  tau_hedmark_h ~ student_t(4, 0, 5);
  
  // state model hedmark H
  for(t in 2:T) {
    mu_hedmark_h[t] ~ normal(mu_hedmark_h[t-1], 0.25);
  }
  
  mu_hedmark_frp[1] ~ normal(initial_prior_hedmark_frp, 1);
  tau_hedmark_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hedmark_frp[t] ~ normal(mu_hedmark_frp[t-1], 0.25);
  }
  
  mu_hedmark_sv[1] ~ normal(initial_prior_hedmark_sv, 1);
  tau_hedmark_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hedmark_sv[t] ~ normal(mu_hedmark_sv[t-1], 0.25);
  }
  
  mu_hedmark_sp[1] ~ normal(initial_prior_hedmark_sp, 1);
  tau_hedmark_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hedmark_sp[t] ~ normal(mu_hedmark_sp[t-1], 0.25);
  }
  
  mu_hedmark_krf[1] ~ normal(initial_prior_hedmark_krf, 1);
  tau_hedmark_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hedmark_krf[t] ~ normal(mu_hedmark_krf[t-1], 0.25);
  }
  
  mu_hedmark_v[1] ~ normal(initial_prior_hedmark_v, 1);
  tau_hedmark_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hedmark_v[t] ~ normal(mu_hedmark_v[t-1], 0.25);
  }
  
  mu_hedmark_mdg[1] ~ normal(initial_prior_hedmark_mdg, 1);
  tau_hedmark_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hedmark_mdg[t] ~ normal(mu_hedmark_mdg[t-1], 0.25);
  }
  
  mu_hedmark_r[1] ~ normal(initial_prior_hedmark_r, 1);
  tau_hedmark_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hedmark_r[t] ~ normal(mu_hedmark_r[t-1], 0.25);
  }
  
  mu_hedmark_a[1] ~ normal(initial_prior_hedmark_a, 1);
  tau_hedmark_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_hedmark_a[t] ~ normal(mu_hedmark_a[t-1], 0.25);
  }

   //hedmark MEASUREMENT MODELS  
  // measurement model hedmark Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hedmark_ap[t, p] != -9) {
        Y_hedmark_ap[t,p]~ normal(shrunken_polls_hedmark_ap[t, p], sigma_hedmark_ap[t,p]);
        shrunken_polls_hedmark_ap[t, p] ~ normal(mu_hedmark_ap[t], tau_hedmark_ap);
	} else {
        shrunken_polls_hedmark_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hedmark H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hedmark_h[t, p] != -9) {
        Y_hedmark_h[t,p]~ normal(shrunken_polls_hedmark_h[t, p], sigma_hedmark_h[t,p]);
        shrunken_polls_hedmark_h[t, p] ~ normal(mu_hedmark_h[t], tau_hedmark_h);
	} else {
        shrunken_polls_hedmark_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hedmark _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hedmark_frp[t, p] != -9) {
        Y_hedmark_frp[t,p]~ normal(shrunken_polls_hedmark_frp[t, p], sigma_hedmark_frp[t,p]);
        shrunken_polls_hedmark_frp[t, p] ~ normal(mu_hedmark_frp[t], tau_hedmark_frp);
	} else {
        shrunken_polls_hedmark_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model hedmark _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hedmark_sv[t, p] != -9) {
        Y_hedmark_sv[t,p]~ normal(shrunken_polls_hedmark_sv[t, p], sigma_hedmark_sv[t,p]);
        shrunken_polls_hedmark_sv[t, p] ~ normal(mu_hedmark_sv[t], tau_hedmark_sv);
	} else {
        shrunken_polls_hedmark_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model hedmark _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hedmark_sp[t, p] != -9) {
        Y_hedmark_sp[t,p]~ normal(shrunken_polls_hedmark_sp[t, p], sigma_hedmark_sp[t,p]);
        shrunken_polls_hedmark_sp[t, p] ~ normal(mu_hedmark_sp[t], tau_hedmark_sp);
	} else {
        shrunken_polls_hedmark_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model hedmark _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hedmark_krf[t, p] != -9) {
        Y_hedmark_krf[t,p]~ normal(shrunken_polls_hedmark_krf[t, p], sigma_hedmark_krf[t,p]);
        shrunken_polls_hedmark_krf[t, p] ~ normal(mu_hedmark_krf[t], tau_hedmark_krf);
	} else {
        shrunken_polls_hedmark_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hedmark _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hedmark_v[t, p] != -9) {
        Y_hedmark_v[t,p]~ normal(shrunken_polls_hedmark_v[t, p], sigma_hedmark_v[t,p]);
        shrunken_polls_hedmark_v[t, p] ~ normal(mu_hedmark_v[t], tau_hedmark_v);
	} else {
        shrunken_polls_hedmark_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hedmark _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hedmark_mdg[t, p] != -9) {
        Y_hedmark_mdg[t,p]~ normal(shrunken_polls_hedmark_mdg[t, p], sigma_hedmark_mdg[t,p]);
        shrunken_polls_hedmark_mdg[t, p] ~ normal(mu_hedmark_mdg[t], tau_hedmark_mdg);
	} else {
        shrunken_polls_hedmark_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hedmark _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hedmark_r[t, p] != -9) {
        Y_hedmark_r[t,p]~ normal(shrunken_polls_hedmark_r[t, p], sigma_hedmark_r[t,p]);
        shrunken_polls_hedmark_r[t, p] ~ normal(mu_hedmark_r[t], tau_hedmark_r);
	} else {
        shrunken_polls_hedmark_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model hedmark _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_hedmark_a[t, p] != -9) {
        Y_hedmark_a[t,p]~ normal(shrunken_polls_hedmark_a[t, p], sigma_hedmark_a[t,p]);
        shrunken_polls_hedmark_a[t, p] ~ normal(mu_hedmark_a[t], tau_hedmark_a);
	} else {
        shrunken_polls_hedmark_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
  

   //ostfold
   
   
   
  // Priors ostfold AP
  // prior on initial difference ostfold AP
  mu_ostfold_ap[1] ~ normal(initial_prior_ostfold_ap, 1);
  tau_ostfold_ap ~ student_t(4, 0, 5);
  
  // state model ostfold AP
  for(t in 2:T) {
    mu_ostfold_ap[t] ~ normal(mu_ostfold_ap[t-1], 0.25);
  }
  

  // Priors ostfold H
  // prior on initial difference ostfold H
  mu_ostfold_h[1] ~ normal(initial_prior_ostfold_h, 1);
  tau_ostfold_h ~ student_t(4, 0, 5);
  
  // state model ostfold H
  for(t in 2:T) {
    mu_ostfold_h[t] ~ normal(mu_ostfold_h[t-1], 0.25);
  }
  
  mu_ostfold_frp[1] ~ normal(initial_prior_ostfold_frp, 1);
  tau_ostfold_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_ostfold_frp[t] ~ normal(mu_ostfold_frp[t-1], 0.25);
  }
  
  mu_ostfold_sv[1] ~ normal(initial_prior_ostfold_sv, 1);
  tau_ostfold_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_ostfold_sv[t] ~ normal(mu_ostfold_sv[t-1], 0.25);
  }
  
  mu_ostfold_sp[1] ~ normal(initial_prior_ostfold_sp, 1);
  tau_ostfold_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_ostfold_sp[t] ~ normal(mu_ostfold_sp[t-1], 0.25);
  }
  
  mu_ostfold_krf[1] ~ normal(initial_prior_ostfold_krf, 1);
  tau_ostfold_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_ostfold_krf[t] ~ normal(mu_ostfold_krf[t-1], 0.25);
  }
  
  mu_ostfold_v[1] ~ normal(initial_prior_ostfold_v, 1);
  tau_ostfold_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_ostfold_v[t] ~ normal(mu_ostfold_v[t-1], 0.25);
  }
  
  mu_ostfold_mdg[1] ~ normal(initial_prior_ostfold_mdg, 1);
  tau_ostfold_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_ostfold_mdg[t] ~ normal(mu_ostfold_mdg[t-1], 0.25);
  }
  
  mu_ostfold_r[1] ~ normal(initial_prior_ostfold_r, 1);
  tau_ostfold_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_ostfold_r[t] ~ normal(mu_ostfold_r[t-1], 0.25);
  }
  
  mu_ostfold_a[1] ~ normal(initial_prior_ostfold_a, 1);
  tau_ostfold_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_ostfold_a[t] ~ normal(mu_ostfold_a[t-1], 0.25);
  }

   //ostfold MEASUREMENT MODELS  
  // measurement model ostfold Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_ostfold_ap[t, p] != -9) {
        Y_ostfold_ap[t,p]~ normal(shrunken_polls_ostfold_ap[t, p], sigma_ostfold_ap[t,p]);
        shrunken_polls_ostfold_ap[t, p] ~ normal(mu_ostfold_ap[t], tau_ostfold_ap);
	} else {
        shrunken_polls_ostfold_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model ostfold H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_ostfold_h[t, p] != -9) {
        Y_ostfold_h[t,p]~ normal(shrunken_polls_ostfold_h[t, p], sigma_ostfold_h[t,p]);
        shrunken_polls_ostfold_h[t, p] ~ normal(mu_ostfold_h[t], tau_ostfold_h);
	} else {
        shrunken_polls_ostfold_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model ostfold _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_ostfold_frp[t, p] != -9) {
        Y_ostfold_frp[t,p]~ normal(shrunken_polls_ostfold_frp[t, p], sigma_ostfold_frp[t,p]);
        shrunken_polls_ostfold_frp[t, p] ~ normal(mu_ostfold_frp[t], tau_ostfold_frp);
	} else {
        shrunken_polls_ostfold_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model ostfold _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_ostfold_sv[t, p] != -9) {
        Y_ostfold_sv[t,p]~ normal(shrunken_polls_ostfold_sv[t, p], sigma_ostfold_sv[t,p]);
        shrunken_polls_ostfold_sv[t, p] ~ normal(mu_ostfold_sv[t], tau_ostfold_sv);
	} else {
        shrunken_polls_ostfold_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model ostfold _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_ostfold_sp[t, p] != -9) {
        Y_ostfold_sp[t,p]~ normal(shrunken_polls_ostfold_sp[t, p], sigma_ostfold_sp[t,p]);
        shrunken_polls_ostfold_sp[t, p] ~ normal(mu_ostfold_sp[t], tau_ostfold_sp);
	} else {
        shrunken_polls_ostfold_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model ostfold _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_ostfold_krf[t, p] != -9) {
        Y_ostfold_krf[t,p]~ normal(shrunken_polls_ostfold_krf[t, p], sigma_ostfold_krf[t,p]);
        shrunken_polls_ostfold_krf[t, p] ~ normal(mu_ostfold_krf[t], tau_ostfold_krf);
	} else {
        shrunken_polls_ostfold_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model ostfold _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_ostfold_v[t, p] != -9) {
        Y_ostfold_v[t,p]~ normal(shrunken_polls_ostfold_v[t, p], sigma_ostfold_v[t,p]);
        shrunken_polls_ostfold_v[t, p] ~ normal(mu_ostfold_v[t], tau_ostfold_v);
	} else {
        shrunken_polls_ostfold_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model ostfold _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_ostfold_mdg[t, p] != -9) {
        Y_ostfold_mdg[t,p]~ normal(shrunken_polls_ostfold_mdg[t, p], sigma_ostfold_mdg[t,p]);
        shrunken_polls_ostfold_mdg[t, p] ~ normal(mu_ostfold_mdg[t], tau_ostfold_mdg);
	} else {
        shrunken_polls_ostfold_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model ostfold _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_ostfold_r[t, p] != -9) {
        Y_ostfold_r[t,p]~ normal(shrunken_polls_ostfold_r[t, p], sigma_ostfold_r[t,p]);
        shrunken_polls_ostfold_r[t, p] ~ normal(mu_ostfold_r[t], tau_ostfold_r);
	} else {
        shrunken_polls_ostfold_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model ostfold _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_ostfold_a[t, p] != -9) {
        Y_ostfold_a[t,p]~ normal(shrunken_polls_ostfold_a[t, p], sigma_ostfold_a[t,p]);
        shrunken_polls_ostfold_a[t, p] ~ normal(mu_ostfold_a[t], tau_ostfold_a);
	} else {
        shrunken_polls_ostfold_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
   //romsdal
   
   
   
  // Priors romsdal AP
  // prior on initial difference romsdal AP
  mu_romsdal_ap[1] ~ normal(initial_prior_romsdal_ap, 1);
  tau_romsdal_ap ~ student_t(4, 0, 5);
  
  // state model romsdal AP
  for(t in 2:T) {
    mu_romsdal_ap[t] ~ normal(mu_romsdal_ap[t-1], 0.25);
  }
  

  // Priors romsdal H
  // prior on initial difference romsdal H
  mu_romsdal_h[1] ~ normal(initial_prior_romsdal_h, 1);
  tau_romsdal_h ~ student_t(4, 0, 5);
  
  // state model romsdal H
  for(t in 2:T) {
    mu_romsdal_h[t] ~ normal(mu_romsdal_h[t-1], 0.25);
  }
  
  mu_romsdal_frp[1] ~ normal(initial_prior_romsdal_frp, 1);
  tau_romsdal_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_romsdal_frp[t] ~ normal(mu_romsdal_frp[t-1], 0.25);
  }
  
  mu_romsdal_sv[1] ~ normal(initial_prior_romsdal_sv, 1);
  tau_romsdal_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_romsdal_sv[t] ~ normal(mu_romsdal_sv[t-1], 0.25);
  }
  
  mu_romsdal_sp[1] ~ normal(initial_prior_romsdal_sp, 1);
  tau_romsdal_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_romsdal_sp[t] ~ normal(mu_romsdal_sp[t-1], 0.25);
  }
  
  mu_romsdal_krf[1] ~ normal(initial_prior_romsdal_krf, 1);
  tau_romsdal_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_romsdal_krf[t] ~ normal(mu_romsdal_krf[t-1], 0.25);
  }
  
  mu_romsdal_v[1] ~ normal(initial_prior_romsdal_v, 1);
  tau_romsdal_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_romsdal_v[t] ~ normal(mu_romsdal_v[t-1], 0.25);
  }
  
  mu_romsdal_mdg[1] ~ normal(initial_prior_romsdal_mdg, 1);
  tau_romsdal_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_romsdal_mdg[t] ~ normal(mu_romsdal_mdg[t-1], 0.25);
  }
  
  mu_romsdal_r[1] ~ normal(initial_prior_romsdal_r, 1);
  tau_romsdal_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_romsdal_r[t] ~ normal(mu_romsdal_r[t-1], 0.25);
  }
  
  mu_romsdal_a[1] ~ normal(initial_prior_romsdal_a, 1);
  tau_romsdal_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_romsdal_a[t] ~ normal(mu_romsdal_a[t-1], 0.25);
  }

   //romsdal MEASUREMENT MODELS  
  // measurement model romsdal Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_romsdal_ap[t, p] != -9) {
        Y_romsdal_ap[t,p]~ normal(shrunken_polls_romsdal_ap[t, p], sigma_romsdal_ap[t,p]);
        shrunken_polls_romsdal_ap[t, p] ~ normal(mu_romsdal_ap[t], tau_romsdal_ap);
	} else {
        shrunken_polls_romsdal_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model romsdal H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_romsdal_h[t, p] != -9) {
        Y_romsdal_h[t,p]~ normal(shrunken_polls_romsdal_h[t, p], sigma_romsdal_h[t,p]);
        shrunken_polls_romsdal_h[t, p] ~ normal(mu_romsdal_h[t], tau_romsdal_h);
	} else {
        shrunken_polls_romsdal_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model romsdal _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_romsdal_frp[t, p] != -9) {
        Y_romsdal_frp[t,p]~ normal(shrunken_polls_romsdal_frp[t, p], sigma_romsdal_frp[t,p]);
        shrunken_polls_romsdal_frp[t, p] ~ normal(mu_romsdal_frp[t], tau_romsdal_frp);
	} else {
        shrunken_polls_romsdal_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model romsdal _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_romsdal_sv[t, p] != -9) {
        Y_romsdal_sv[t,p]~ normal(shrunken_polls_romsdal_sv[t, p], sigma_romsdal_sv[t,p]);
        shrunken_polls_romsdal_sv[t, p] ~ normal(mu_romsdal_sv[t], tau_romsdal_sv);
	} else {
        shrunken_polls_romsdal_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model romsdal _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_romsdal_sp[t, p] != -9) {
        Y_romsdal_sp[t,p]~ normal(shrunken_polls_romsdal_sp[t, p], sigma_romsdal_sp[t,p]);
        shrunken_polls_romsdal_sp[t, p] ~ normal(mu_romsdal_sp[t], tau_romsdal_sp);
	} else {
        shrunken_polls_romsdal_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model romsdal _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_romsdal_krf[t, p] != -9) {
        Y_romsdal_krf[t,p]~ normal(shrunken_polls_romsdal_krf[t, p], sigma_romsdal_krf[t,p]);
        shrunken_polls_romsdal_krf[t, p] ~ normal(mu_romsdal_krf[t], tau_romsdal_krf);
	} else {
        shrunken_polls_romsdal_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model romsdal _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_romsdal_v[t, p] != -9) {
        Y_romsdal_v[t,p]~ normal(shrunken_polls_romsdal_v[t, p], sigma_romsdal_v[t,p]);
        shrunken_polls_romsdal_v[t, p] ~ normal(mu_romsdal_v[t], tau_romsdal_v);
	} else {
        shrunken_polls_romsdal_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model romsdal _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_romsdal_mdg[t, p] != -9) {
        Y_romsdal_mdg[t,p]~ normal(shrunken_polls_romsdal_mdg[t, p], sigma_romsdal_mdg[t,p]);
        shrunken_polls_romsdal_mdg[t, p] ~ normal(mu_romsdal_mdg[t], tau_romsdal_mdg);
	} else {
        shrunken_polls_romsdal_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model romsdal _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_romsdal_r[t, p] != -9) {
        Y_romsdal_r[t,p]~ normal(shrunken_polls_romsdal_r[t, p], sigma_romsdal_r[t,p]);
        shrunken_polls_romsdal_r[t, p] ~ normal(mu_romsdal_r[t], tau_romsdal_r);
	} else {
        shrunken_polls_romsdal_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model romsdal _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_romsdal_a[t, p] != -9) {
        Y_romsdal_a[t,p]~ normal(shrunken_polls_romsdal_a[t, p], sigma_romsdal_a[t,p]);
        shrunken_polls_romsdal_a[t, p] ~ normal(mu_romsdal_a[t], tau_romsdal_a);
	} else {
        shrunken_polls_romsdal_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
   //sortrondelag
   
   
   
  // Priors sortrondelag AP
  // prior on initial difference sortrondelag AP
  mu_sortrondelag_ap[1] ~ normal(initial_prior_sortrondelag_ap, 1);
  tau_sortrondelag_ap ~ student_t(4, 0, 5);
  
  // state model sortrondelag AP
  for(t in 2:T) {
    mu_sortrondelag_ap[t] ~ normal(mu_sortrondelag_ap[t-1], 0.25);
  }
  

  // Priors sortrondelag H
  // prior on initial difference sortrondelag H
  mu_sortrondelag_h[1] ~ normal(initial_prior_sortrondelag_h, 1);
  tau_sortrondelag_h ~ student_t(4, 0, 5);
  
  // state model sortrondelag H
  for(t in 2:T) {
    mu_sortrondelag_h[t] ~ normal(mu_sortrondelag_h[t-1], 0.25);
  }
  
  mu_sortrondelag_frp[1] ~ normal(initial_prior_sortrondelag_frp, 1);
  tau_sortrondelag_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sortrondelag_frp[t] ~ normal(mu_sortrondelag_frp[t-1], 0.25);
  }
  
  mu_sortrondelag_sv[1] ~ normal(initial_prior_sortrondelag_sv, 1);
  tau_sortrondelag_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sortrondelag_sv[t] ~ normal(mu_sortrondelag_sv[t-1], 0.25);
  }
  
  mu_sortrondelag_sp[1] ~ normal(initial_prior_sortrondelag_sp, 1);
  tau_sortrondelag_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sortrondelag_sp[t] ~ normal(mu_sortrondelag_sp[t-1], 0.25);
  }
  
  mu_sortrondelag_krf[1] ~ normal(initial_prior_sortrondelag_krf, 1);
  tau_sortrondelag_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sortrondelag_krf[t] ~ normal(mu_sortrondelag_krf[t-1], 0.25);
  }
  
  mu_sortrondelag_v[1] ~ normal(initial_prior_sortrondelag_v, 1);
  tau_sortrondelag_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sortrondelag_v[t] ~ normal(mu_sortrondelag_v[t-1], 0.25);
  }
  
  mu_sortrondelag_mdg[1] ~ normal(initial_prior_sortrondelag_mdg, 1);
  tau_sortrondelag_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sortrondelag_mdg[t] ~ normal(mu_sortrondelag_mdg[t-1], 0.25);
  }
  
  mu_sortrondelag_r[1] ~ normal(initial_prior_sortrondelag_r, 1);
  tau_sortrondelag_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sortrondelag_r[t] ~ normal(mu_sortrondelag_r[t-1], 0.25);
  }
  
  mu_sortrondelag_a[1] ~ normal(initial_prior_sortrondelag_a, 1);
  tau_sortrondelag_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_sortrondelag_a[t] ~ normal(mu_sortrondelag_a[t-1], 0.25);
  }

   //sortrondelag MEASUREMENT MODELS  
  // measurement model sortrondelag Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sortrondelag_ap[t, p] != -9) {
        Y_sortrondelag_ap[t,p]~ normal(shrunken_polls_sortrondelag_ap[t, p], sigma_sortrondelag_ap[t,p]);
        shrunken_polls_sortrondelag_ap[t, p] ~ normal(mu_sortrondelag_ap[t], tau_sortrondelag_ap);
	} else {
        shrunken_polls_sortrondelag_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sortrondelag H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sortrondelag_h[t, p] != -9) {
        Y_sortrondelag_h[t,p]~ normal(shrunken_polls_sortrondelag_h[t, p], sigma_sortrondelag_h[t,p]);
        shrunken_polls_sortrondelag_h[t, p] ~ normal(mu_sortrondelag_h[t], tau_sortrondelag_h);
	} else {
        shrunken_polls_sortrondelag_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sortrondelag _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sortrondelag_frp[t, p] != -9) {
        Y_sortrondelag_frp[t,p]~ normal(shrunken_polls_sortrondelag_frp[t, p], sigma_sortrondelag_frp[t,p]);
        shrunken_polls_sortrondelag_frp[t, p] ~ normal(mu_sortrondelag_frp[t], tau_sortrondelag_frp);
	} else {
        shrunken_polls_sortrondelag_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model sortrondelag _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sortrondelag_sv[t, p] != -9) {
        Y_sortrondelag_sv[t,p]~ normal(shrunken_polls_sortrondelag_sv[t, p], sigma_sortrondelag_sv[t,p]);
        shrunken_polls_sortrondelag_sv[t, p] ~ normal(mu_sortrondelag_sv[t], tau_sortrondelag_sv);
	} else {
        shrunken_polls_sortrondelag_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model sortrondelag _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sortrondelag_sp[t, p] != -9) {
        Y_sortrondelag_sp[t,p]~ normal(shrunken_polls_sortrondelag_sp[t, p], sigma_sortrondelag_sp[t,p]);
        shrunken_polls_sortrondelag_sp[t, p] ~ normal(mu_sortrondelag_sp[t], tau_sortrondelag_sp);
	} else {
        shrunken_polls_sortrondelag_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model sortrondelag _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sortrondelag_krf[t, p] != -9) {
        Y_sortrondelag_krf[t,p]~ normal(shrunken_polls_sortrondelag_krf[t, p], sigma_sortrondelag_krf[t,p]);
        shrunken_polls_sortrondelag_krf[t, p] ~ normal(mu_sortrondelag_krf[t], tau_sortrondelag_krf);
	} else {
        shrunken_polls_sortrondelag_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sortrondelag _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sortrondelag_v[t, p] != -9) {
        Y_sortrondelag_v[t,p]~ normal(shrunken_polls_sortrondelag_v[t, p], sigma_sortrondelag_v[t,p]);
        shrunken_polls_sortrondelag_v[t, p] ~ normal(mu_sortrondelag_v[t], tau_sortrondelag_v);
	} else {
        shrunken_polls_sortrondelag_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sortrondelag _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sortrondelag_mdg[t, p] != -9) {
        Y_sortrondelag_mdg[t,p]~ normal(shrunken_polls_sortrondelag_mdg[t, p], sigma_sortrondelag_mdg[t,p]);
        shrunken_polls_sortrondelag_mdg[t, p] ~ normal(mu_sortrondelag_mdg[t], tau_sortrondelag_mdg);
	} else {
        shrunken_polls_sortrondelag_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sortrondelag _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sortrondelag_r[t, p] != -9) {
        Y_sortrondelag_r[t,p]~ normal(shrunken_polls_sortrondelag_r[t, p], sigma_sortrondelag_r[t,p]);
        shrunken_polls_sortrondelag_r[t, p] ~ normal(mu_sortrondelag_r[t], tau_sortrondelag_r);
	} else {
        shrunken_polls_sortrondelag_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model sortrondelag _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_sortrondelag_a[t, p] != -9) {
        Y_sortrondelag_a[t,p]~ normal(shrunken_polls_sortrondelag_a[t, p], sigma_sortrondelag_a[t,p]);
        shrunken_polls_sortrondelag_a[t, p] ~ normal(mu_sortrondelag_a[t], tau_sortrondelag_a);
	} else {
        shrunken_polls_sortrondelag_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
  
  

   //vestfold
   
   
   
  // Priors vestfold AP
  // prior on initial difference vestfold AP
  mu_vestfold_ap[1] ~ normal(initial_prior_vestfold_ap, 1);
  tau_vestfold_ap ~ student_t(4, 0, 5);
  
  // state model vestfold AP
  for(t in 2:T) {
    mu_vestfold_ap[t] ~ normal(mu_vestfold_ap[t-1], 0.25);
  }
  

  // Priors vestfold H
  // prior on initial difference vestfold H
  mu_vestfold_h[1] ~ normal(initial_prior_vestfold_h, 1);
  tau_vestfold_h ~ student_t(4, 0, 5);
  
  // state model vestfold H
  for(t in 2:T) {
    mu_vestfold_h[t] ~ normal(mu_vestfold_h[t-1], 0.25);
  }
  
  mu_vestfold_frp[1] ~ normal(initial_prior_vestfold_frp, 1);
  tau_vestfold_frp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestfold_frp[t] ~ normal(mu_vestfold_frp[t-1], 0.25);
  }
  
  mu_vestfold_sv[1] ~ normal(initial_prior_vestfold_sv, 1);
  tau_vestfold_sv ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestfold_sv[t] ~ normal(mu_vestfold_sv[t-1], 0.25);
  }
  
  mu_vestfold_sp[1] ~ normal(initial_prior_vestfold_sp, 1);
  tau_vestfold_sp ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestfold_sp[t] ~ normal(mu_vestfold_sp[t-1], 0.25);
  }
  
  mu_vestfold_krf[1] ~ normal(initial_prior_vestfold_krf, 1);
  tau_vestfold_krf ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestfold_krf[t] ~ normal(mu_vestfold_krf[t-1], 0.25);
  }
  
  mu_vestfold_v[1] ~ normal(initial_prior_vestfold_v, 1);
  tau_vestfold_v ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestfold_v[t] ~ normal(mu_vestfold_v[t-1], 0.25);
  }
  
  mu_vestfold_mdg[1] ~ normal(initial_prior_vestfold_mdg, 1);
  tau_vestfold_mdg ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestfold_mdg[t] ~ normal(mu_vestfold_mdg[t-1], 0.25);
  }
  
  mu_vestfold_r[1] ~ normal(initial_prior_vestfold_r, 1);
  tau_vestfold_r ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestfold_r[t] ~ normal(mu_vestfold_r[t-1], 0.25);
  }
  
  mu_vestfold_a[1] ~ normal(initial_prior_vestfold_a, 1);
  tau_vestfold_a ~ student_t(4, 0, 5);
  for(t in 2:T) {
    mu_vestfold_a[t] ~ normal(mu_vestfold_a[t-1], 0.25);
  }

   //vestfold MEASUREMENT MODELS  
  // measurement model vestfold Ap
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestfold_ap[t, p] != -9) {
        Y_vestfold_ap[t,p]~ normal(shrunken_polls_vestfold_ap[t, p], sigma_vestfold_ap[t,p]);
        shrunken_polls_vestfold_ap[t, p] ~ normal(mu_vestfold_ap[t], tau_vestfold_ap);
	} else {
        shrunken_polls_vestfold_ap[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestfold H
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestfold_h[t, p] != -9) {
        Y_vestfold_h[t,p]~ normal(shrunken_polls_vestfold_h[t, p], sigma_vestfold_h[t,p]);
        shrunken_polls_vestfold_h[t, p] ~ normal(mu_vestfold_h[t], tau_vestfold_h);
	} else {
        shrunken_polls_vestfold_h[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestfold _frp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestfold_frp[t, p] != -9) {
        Y_vestfold_frp[t,p]~ normal(shrunken_polls_vestfold_frp[t, p], sigma_vestfold_frp[t,p]);
        shrunken_polls_vestfold_frp[t, p] ~ normal(mu_vestfold_frp[t], tau_vestfold_frp);
	} else {
        shrunken_polls_vestfold_frp[t, p] ~ normal(0, 1);
      }
    }
  }

  // measurement model vestfold _sv
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestfold_sv[t, p] != -9) {
        Y_vestfold_sv[t,p]~ normal(shrunken_polls_vestfold_sv[t, p], sigma_vestfold_sv[t,p]);
        shrunken_polls_vestfold_sv[t, p] ~ normal(mu_vestfold_sv[t], tau_vestfold_sv);
	} else {
        shrunken_polls_vestfold_sv[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model vestfold _sp
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestfold_sp[t, p] != -9) {
        Y_vestfold_sp[t,p]~ normal(shrunken_polls_vestfold_sp[t, p], sigma_vestfold_sp[t,p]);
        shrunken_polls_vestfold_sp[t, p] ~ normal(mu_vestfold_sp[t], tau_vestfold_sp);
	} else {
        shrunken_polls_vestfold_sp[t, p] ~ normal(0, 1);
      }
    }
  }
  // measurement model vestfold _krf
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestfold_krf[t, p] != -9) {
        Y_vestfold_krf[t,p]~ normal(shrunken_polls_vestfold_krf[t, p], sigma_vestfold_krf[t,p]);
        shrunken_polls_vestfold_krf[t, p] ~ normal(mu_vestfold_krf[t], tau_vestfold_krf);
	} else {
        shrunken_polls_vestfold_krf[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestfold _v
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestfold_v[t, p] != -9) {
        Y_vestfold_v[t,p]~ normal(shrunken_polls_vestfold_v[t, p], sigma_vestfold_v[t,p]);
        shrunken_polls_vestfold_v[t, p] ~ normal(mu_vestfold_v[t], tau_vestfold_v);
	} else {
        shrunken_polls_vestfold_v[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestfold _mdg
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestfold_mdg[t, p] != -9) {
        Y_vestfold_mdg[t,p]~ normal(shrunken_polls_vestfold_mdg[t, p], sigma_vestfold_mdg[t,p]);
        shrunken_polls_vestfold_mdg[t, p] ~ normal(mu_vestfold_mdg[t], tau_vestfold_mdg);
	} else {
        shrunken_polls_vestfold_mdg[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestfold _r
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestfold_r[t, p] != -9) {
        Y_vestfold_r[t,p]~ normal(shrunken_polls_vestfold_r[t, p], sigma_vestfold_r[t,p]);
        shrunken_polls_vestfold_r[t, p] ~ normal(mu_vestfold_r[t], tau_vestfold_r);
	} else {
        shrunken_polls_vestfold_r[t, p] ~ normal(0, 1);
      }
    }
  }
  
  // measurement model vestfold _a
  for(t in 1:T) {
    for(p in 1:polls) {
      if(Y_vestfold_a[t, p] != -9) {
        Y_vestfold_a[t,p]~ normal(shrunken_polls_vestfold_a[t, p], sigma_vestfold_a[t,p]);
        shrunken_polls_vestfold_a[t, p] ~ normal(mu_vestfold_a[t], tau_vestfold_a);
	} else {
        shrunken_polls_vestfold_a[t, p] ~ normal(0, 1);
      }
    }
  }
  
 }