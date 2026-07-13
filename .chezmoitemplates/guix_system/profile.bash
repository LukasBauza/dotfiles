# Guix Home (only if present)
if [ -f "$HOME/.guix-home/setup-environment" ]; then
  HOME_ENVIRONMENT="$HOME/.guix-home"
  . "$HOME_ENVIRONMENT/setup-environment"
  "$HOME_ENVIRONMENT/on-first-login"
  unset HOME_ENVIRONMENT
fi
