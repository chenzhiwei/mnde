ROOT_PATH=$(cd $(dirname ${BASH_SOURCE}) && pwd -P)

function append_path() {
    path="$1"
    if ! [[ "$PATH" =~ "$path" ]]; then
        PATH="$PATH:$path"
    fi
}

for item in $(ls -d $ROOT_PATH/*); do
    append_path "$item/bin"
done

export PATH="$PATH"
