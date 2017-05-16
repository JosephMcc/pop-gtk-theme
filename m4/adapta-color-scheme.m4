# ADAPTA_COLOR_SCHEME ()
# -----------------------------------------------------------
AC_DEFUN([ADAPTA_COLOR_SCHEME], [

    selection_default="`grep 'Content1' ./gtk/sass/common/_colors.scss | \
                        cut -d' ' -f3`"
    second_selection_default="`grep 'Content2' ./gtk/sass/common/_colors.scss | \
                               cut -d' ' -f3`"
    accent_default="`grep 'Context' ./gtk/sass/common/_colors.scss | \
                     cut -d' ' -f3`"
    suggestion_default="`grep 'Suggest' ./gtk/sass/common/_colors.scss | \
                         cut -d' ' -f3`"
    destruction_default="`grep 'Destruct' ./gtk/sass/common/_colors.scss | \
                          cut -d' ' -f3`"

    AC_ARG_WITH(
        [selection_color],
        [AS_HELP_STRING(
            [--with-selection_color],
            [Primary color for selected-items \
             (Default: #48B9C7)]
        )],
        [SELECTION="$withval"],
        [SELECTION=$selection_default]
    )
    AC_SUBST([SELECTION])

    AC_ARG_WITH(
        [second_selection_color],
        [AS_HELP_STRING(
            [--with-second_selection_color],
            [Primary color for 'select' effects \
             (Default: #48B9C7)]
        )],
        [SECOND_SELECTION="$withval"],
        [SECOND_SELECTION=$second_selection_default]
    )
    AC_SUBST([SECOND_SELECTION])

    AC_ARG_WITH(
        [accent_color],
        [AS_HELP_STRING(
            [--with-accent_color],
            [Secondary color for notifications and OSDs \
             (Default: #FAA41A)]
        )],
        [ACCENT="$withval"],
        [ACCENT=$accent_default]
    )
    AC_SUBST([ACCENT])

    AC_ARG_WITH(
        [suggestion_color],
        [AS_HELP_STRING(
            [--with-suggestion_color],
            [Secondary color for 'suggested' buttons \
             (Default: #73C48F)]
        )],
        [SUGGESTION="$withval"],
        [SUGGESTION=$suggestion_default]
    )
    AC_SUBST([SUGGESTION])

    AC_ARG_WITH(
        [destruction_color],
        [AS_HELP_STRING(
            [--with-destruction_color],
            [Tertiary color for 'destructive' buttons \
             (Default: #F15D22)]
        )],
        [DESTRUCTION="$withval"],
        [DESTRUCTION=$destruction_default]
    )
    AC_SUBST([DESTRUCTION])

# Store defined key color-scheme into SCSS file
echo \
"// Selection (Primary) color
\$key_selection_color: `echo $SELECTION`;

// Sub-selection-color
\$key_secondary_selection_color: `echo $SECOND_SELECTION`;

// Accent (Seondary) color
\$key_accent_color: `echo $ACCENT`;

// Suggestion color
\$key_suggestion_color: `echo $SUGGESTION`;

// Destruction (Tertiary) color
\$key_destruction_color: `echo $DESTRUCTION`;" \
> ./gtk/sass/common/_key_colors.scss

# Copy SCSS to shell SASS directory
cp -R ./gtk/sass/common/_key_colors.scss \
       ./shell/sass/common/_key_colors.scss

AC_MSG_RESULT([creating sass/common/_key_colors.scss])
])
