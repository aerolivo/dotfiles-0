# ------------------------------
# Global Configuration for LaTeXmk
# ------------------------------

use File::Basename;  # Required for path manipulations

# 1. PDF Previewer
$pdf_previewer = 'xdg-open %S';  # Adjust as per your OS

# 2. LaTeX Engine Configuration
# Set LuaLaTeX with shell escape enabled
$pdflatex = 'lualatex -synctex=1 --shell-escape %O %S';

# 3. Shell Escape
$shell_escape = 1;

# 4. Default Main Files
# Clear @default_files to allow specifying main files explicitly
@default_files = ();

# 5. Output Directory Configuration
# Set output directories based on the main file's location and name
if (defined $root_file) {
    $out_dir = sub { 
        # Obtain the root file's directory and base name
        my $dir = dirname($root_file);
        my $base = basename($root_file_base);
    
        # Define the build directory within the main file's directory
        my $build_dir = "$dir/build";
    
        # Create the build directory if it doesn't exist
        unless (-d $build_dir) {
            mkdir $build_dir or die "Cannot create directory $build_dir: $!";
        }
    
        return $build_dir;
    }->();
} else {
    warn "No root file detected. Skipping output directory configuration.\n"
}

# 6. Bibliography Tool Configuration
# Using BibLaTeX with Biber (Recommended)
$biber = 'biber %O %S';
$bibtex = $biber;  # Alias $bibtex to use Biber

# 7. Custom Dependencies (e.g., axodraw)
# Uncomment and modify if you have custom dependencies
# add_cus_dep('ax1', 'ax2', 0, 'axohelp');
# sub axohelp {
#     return system("axohelp \"$_[0]\"");
# }

# 8. Cleanup Settings
# Define which files to clean
$clean_ext = 'aux bbl blg log lof lot out toc fls fdb_latexmk synctex.gz';
$clean_full_ext = 'gz aux bbl blg log brf idx ilg ind toc out pdfsync synctex.gz';

# 9. PDF Synchronization
$pdf_update_method = 2;

# 10. Maximum Repeats for Compilation Runs
$max_repeat = 5;

# 11. Optional: Rename PDF after Successful Build
# Uncomment and modify if needed
# $success_cmd = 'mv %R.pdf final_document.pdf';

# 12. Additional Configurations or Custom Dependencies
# Add any other custom settings below
