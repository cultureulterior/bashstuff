function download_if_new_without_head
{
    ADDRESS="$1"
    FILENAME="${ADDRESS/*\//}"
    #Required when using google code, which does not support head requests
    #https://code.google.com/p/support/issues/detail?id=660
    curl -v --header "If-Modified-Since: $(date --rfc-2822 -d @$(stat --format "%Y" "${FILENAME}"))" -o "${FILENAME}" "${ADDRESS}"
}
