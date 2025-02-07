Vim�UnDo� d�ꝲ �:}jtn�4}�/��"�(* Zz�   "   =$success_cmd = 'mv %R.pdf compile-`date +%Y%m%d-%H%M%S`.pdf';   !                         g��H    _�                             ����                                                                                                                                                                                                                                                                                                                                       O           V        g���     �              O    # ------------------------------   ,# Project-Specific Configuration for LaTeXmk    # ------------------------------       use File::Basename;       # 1. PDF Previewer   8$pdf_previewer = 'xdg-open %S';  # Adjust as per your OS       # 2. LaTeX Engine Configuration   7$pdflatex = 'lualatex -synctex=1 --shell-escape %O %S';       # 3. Shell Escape   $shell_escape = 1;       ## 4. Output Directory Configuration   $out_dir = 'build';   unless (-d $out_dir) {   A    mkdir $out_dir or die "Cannot create directory $out_dir: $!";   }       $# 5. Bibliography Tool Configuration   $biber = 'biber %O %S';   /$bibtex = $biber;  # Alias $bibtex to use Biber       # 6. Cleanup Settings   J$clean_ext = 'aux bbl blg log lof lot out toc fls fdb_latexmk synctex.gz';   R$clean_full_ext = 'gz aux bbl blg log brf idx ilg ind toc out pdfsync synctex.gz';       # 7. PDF Synchronization   $pdf_update_method = 2;       )# 8. Maximum Repeats for Compilation Runs   $max_repeat = 5;       0# 9. Optional: Rename PDF after Successful Build    # Uncomment and modify if needed   0# $success_cmd = 'mv %R.pdf final_document.pdf';       6# 10. Additional Configurations or Custom Dependencies   %# Add any other custom settings below        # ------------------------------   0# Hook to Rename Compiled PDF with Date and Time    # ------------------------------       ;# Add a 'finished' hook to rename the PDF after compilation   $$latexmk->add_hook('finished', sub {       my ($latexmk) = @_;       4    # Get the job name (base name without extension)   *    my $jobname = $latexmk->get_jobname();   &    my $original_pdf = "$jobname.pdf";           # Get current local time   =    my ($sec, $min, $hour, $mday, $mon, $year) = localtime();   !    $year += 1900;  # Adjust year   "    $mon += 1;      # Adjust month       -    # Format date and time as YYYYMMDD-HHMMSS   8    my $date_time = sprintf("%04d%02d%02d-%02d%02d%02d",   C                            $year, $mon, $mday, $hour, $min, $sec);       !    # Define the new PDF filename   +    my $new_pdf = "compile-$date_time.pdf";       &    # Check if the original PDF exists       if (-e $original_pdf) {           # Rename the PDF   .        if (rename($original_pdf, $new_pdf)) {   8            print "Renamed $original_pdf to $new_pdf\n";           } else {   D            warn "Failed to rename $original_pdf to $new_pdf: $!\n";   	        }       } else {   F        warn "Original PDF $original_pdf not found. Cannot rename.\n";       }   });    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        g���     �                   5�_�                    P        ����                                                                                                                                                                                                                                                                                                                                                  V        g���     �   O   P          gg5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        g���    �          O      !# ------------------------------5�_�                            ����                                                                                                                                                                                                                                                                                                                                       O           V        g��K     �              O    # ------------------------------   ,# Project-Specific Configuration for LaTeXmk    # ------------------------------       use File::Basename;       # 1. PDF Previewer   8$pdf_previewer = 'xdg-open %S';  # Adjust as per your OS       # 2. LaTeX Engine Configuration   7$pdflatex = 'lualatex -synctex=1 --shell-escape %O %S';       # 3. Shell Escape   $shell_escape = 1;       ## 4. Output Directory Configuration   $out_dir = 'build';   unless (-d $out_dir) {   A    mkdir $out_dir or die "Cannot create directory $out_dir: $!";   }       $# 5. Bibliography Tool Configuration   $biber = 'biber %O %S';   /$bibtex = $biber;  # Alias $bibtex to use Biber       # 6. Cleanup Settings   J$clean_ext = 'aux bbl blg log lof lot out toc fls fdb_latexmk synctex.gz';   R$clean_full_ext = 'gz aux bbl blg log brf idx ilg ind toc out pdfsync synctex.gz';       # 7. PDF Synchronization   $pdf_update_method = 2;       )# 8. Maximum Repeats for Compilation Runs   $max_repeat = 5;       0# 9. Optional: Rename PDF after Successful Build    # Uncomment and modify if needed   0# $success_cmd = 'mv %R.pdf final_document.pdf';       6# 10. Additional Configurations or Custom Dependencies   %# Add any other custom settings below        # ------------------------------   0# Hook to Rename Compiled PDF with Date and Time    # ------------------------------       ;# Add a 'finished' hook to rename the PDF after compilation   $$latexmk->add_hook('finished', sub {       my ($latexmk) = @_;       4    # Get the job name (base name without extension)   *    my $jobname = $latexmk->get_jobname();   &    my $original_pdf = "$jobname.pdf";           # Get current local time   =    my ($sec, $min, $hour, $mday, $mon, $year) = localtime();   !    $year += 1900;  # Adjust year   "    $mon += 1;      # Adjust month       -    # Format date and time as YYYYMMDD-HHMMSS   8    my $date_time = sprintf("%04d%02d%02d-%02d%02d%02d",   C                            $year, $mon, $mday, $hour, $min, $sec);       !    # Define the new PDF filename   +    my $new_pdf = "compile-$date_time.pdf";       &    # Check if the original PDF exists       if (-e $original_pdf) {           # Rename the PDF   .        if (rename($original_pdf, $new_pdf)) {   8            print "Renamed $original_pdf to $new_pdf\n";           } else {   D            warn "Failed to rename $original_pdf to $new_pdf: $!\n";   	        }       } else {   F        warn "Original PDF $original_pdf not found. Cannot rename.\n";       }   });    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        g��P    �                   5�_�                    >       ����                                                                                                                                                                                                                                                                                                                                                             g��y     �   =   >          C                            $year, $mon, $mday, $hour, $min, $sec);5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             g��{     �          O       # ------------------------------5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                       O           V        g��}     �              O       ,# Project-Specific Configuration for LaTeXmk    # ------------------------------       use File::Basename;       # 1. PDF Previewer   8$pdf_previewer = 'xdg-open %S';  # Adjust as per your OS       # 2. LaTeX Engine Configuration   7$pdflatex = 'lualatex -synctex=1 --shell-escape %O %S';       # 3. Shell Escape   $shell_escape = 1;       ## 4. Output Directory Configuration   $out_dir = 'build';   unless (-d $out_dir) {   A    mkdir $out_dir or die "Cannot create directory $out_dir: $!";   }       $# 5. Bibliography Tool Configuration   $biber = 'biber %O %S';   /$bibtex = $biber;  # Alias $bibtex to use Biber       # 6. Cleanup Settings   J$clean_ext = 'aux bbl blg log lof lot out toc fls fdb_latexmk synctex.gz';   R$clean_full_ext = 'gz aux bbl blg log brf idx ilg ind toc out pdfsync synctex.gz';       # 7. PDF Synchronization   $pdf_update_method = 2;       )# 8. Maximum Repeats for Compilation Runs   $max_repeat = 5;       0# 9. Optional: Rename PDF after Successful Build    # Uncomment and modify if needed   0# $success_cmd = 'mv %R.pdf final_document.pdf';       6# 10. Additional Configurations or Custom Dependencies   %# Add any other custom settings below        # ------------------------------   0# Hook to Rename Compiled PDF with Date and Time    # ------------------------------       ;# Add a 'finished' hook to rename the PDF after compilation   $$latexmk->add_hook('finished', sub {       my ($latexmk) = @_;       4    # Get the job name (base name without extension)   *    my $jobname = $latexmk->get_jobname();   &    my $original_pdf = "$jobname.pdf";           # Get current local time   =    my ($sec, $min, $hour, $mday, $mon, $year) = localtime();   !    $year += 1900;  # Adjust year   "    $mon += 1;      # Adjust month       -    # Format date and time as YYYYMMDD-HHMMSS   8    my $date_time = sprintf("%04d%02d%02d-%02d%02d%02d",       !    # Define the new PDF filename   +    my $new_pdf = "compile-$date_time.pdf";       &    # Check if the original PDF exists       if (-e $original_pdf) {           # Rename the PDF   .        if (rename($original_pdf, $new_pdf)) {   8            print "Renamed $original_pdf to $new_pdf\n";           } else {   D            warn "Failed to rename $original_pdf to $new_pdf: $!\n";   	        }       } else {   F        warn "Original PDF $original_pdf not found. Cannot rename.\n";       }   });        5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                  V        g���    �                   5�_�   
                E       ����                                                                                                                                                                                                                                                                                                                                       O           V        g��     �   D   F   O   	           # Rename the PDF   .        if (rename($original_pdf, $new_pdf)) {   8            print "Renamed $original_pdf to $new_pdf\n";           } else {   D            warn "Failed to rename $original_pdf to $new_pdf: $!\n";   	        }       } else {   F        warn "Original PDF $original_pdf not found. Cannot rename.\n";       }5�_�                    E       ����                                                                                                                                                                                                                                                                                                                                       G           V        g��     �   D   E                  # Rename the PD   }5�_�                            ����                                                                                                                                                                                                                                                                                                                                       F           V        g��"     �              F    # ------------------------------   ,# Project-Specific Configuration for LaTeXmk    # ------------------------------       use File::Basename;       # 1. PDF Previewer   8$pdf_previewer = 'xdg-open %S';  # Adjust as per your OS       # 2. LaTeX Engine Configuration   7$pdflatex = 'lualatex -synctex=1 --shell-escape %O %S';       # 3. Shell Escape   $shell_escape = 1;       ## 4. Output Directory Configuration   $out_dir = 'build';   unless (-d $out_dir) {   A    mkdir $out_dir or die "Cannot create directory $out_dir: $!";   }       $# 5. Bibliography Tool Configuration   $biber = 'biber %O %S';   /$bibtex = $biber;  # Alias $bibtex to use Biber       # 6. Cleanup Settings   J$clean_ext = 'aux bbl blg log lof lot out toc fls fdb_latexmk synctex.gz';   R$clean_full_ext = 'gz aux bbl blg log brf idx ilg ind toc out pdfsync synctex.gz';       # 7. PDF Synchronization   $pdf_update_method = 2;       )# 8. Maximum Repeats for Compilation Runs   $max_repeat = 5;       0# 9. Optional: Rename PDF after Successful Build    # Uncomment and modify if needed   0# $success_cmd = 'mv %R.pdf final_document.pdf';       6# 10. Additional Configurations or Custom Dependencies   %# Add any other custom settings below        # ------------------------------   0# Hook to Rename Compiled PDF with Date and Time    # ------------------------------       ;# Add a 'finished' hook to rename the PDF after compilation   add_hook('finished', sub {       my ($latexmk) = @_;       4    # Get the job name (base name without extension)   *    my $jobname = $latexmk->get_jobname();   &    my $original_pdf = "$jobname.pdf";           # Get current local time   =    my ($sec, $min, $hour, $mday, $mon, $year) = localtime();   !    $year += 1900;  # Adjust year   "    $mon += 1;      # Adjust month       -    # Format date and time as YYYYMMDD-HHMMSS   8    my $date_time = sprintf("%04d%02d%02d-%02d%02d%02d",   C                            $year, $mon, $mday, $hour, $min, $sec);       !    # Define the new PDF filename   +    my $new_pdf = "compile-$date_time.pdf";       &    # Check if the original PDF exists       if (-e $original_pdf) {   });    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                          g��)     �                   5�_�                    !       ����                                                                                                                                                                                                                                                                                                                                                          g��4     �       "   "      =$success_cmd = 'mv %R.pdf compile-`date +%Y%m%d-%H%M%S`.pdf';5�_�                    !        ����                                                                                                                                                                                                                                                                                                                                                          g��9    �       "   "      C$success_cmd = 'mv build/%R.pdf compile-`date +%Y%m%d-%H%M%S`.pdf';5�_�                     !   -    ����                                                                                                                                                                                                                                                                                                                                                             g��H   
 �       "   "      D$success_cmd = 'mv build/%R.pdf build/%R-`date +%Y%m%d-%H%M%S`.pdf';5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                  V        g��     �       P           5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             g��   	 �              "   ,# Project-Specific Configuration for LaTeXmk       # PDF Previewer   $pdf_previewer = 'xdg-open %S';       # LaTeX Engine Configuration   7$pdflatex = 'lualatex -synctex=1 --shell-escape %O %S';       # Shell Escape   $shell_escape = 1;        # Output Directory Configuration   $out_dir = 'build';   unless (-d $out_dir) {   A    mkdir $out_dir or die "Cannot create directory $out_dir: $!";   }       !# Bibliography Tool Configuration   $biber = 'biber %O %S';   /$bibtex = $biber;  # Use Biber for bibliography       # Cleanup Settings   J$clean_ext = 'aux bbl blg log lof lot out toc fls fdb_latexmk synctex.gz';   R$clean_full_ext = 'gz aux bbl blg log brf idx ilg ind toc out pdfsync synctex.gz';       # PDF Synchronization   $pdf_update_method = 2;       &# Maximum Repeats for Compilation Runs   $max_repeat = 5;       ## Rename PDF after Successful Build   =$success_cmd = 'mv %R.pdf compile-`date +%Y%m%d-%H%M%S`.pdf';    5��