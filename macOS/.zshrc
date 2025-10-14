bindkey -v
PROMPT="%1d $ "
alias ls="ls -la"

export VULKAN_SDK="$HOME/opt/VulkanSDK/1.4.328.1/macOS"
export PATH="$VULKAN_SDK/bin:$PATH"
export DYLD_LIBRARY_PATH="$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH"
export VK_ICD_FILENAMES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"

alias ctags="`brew --prefix`/bin/ctags"
