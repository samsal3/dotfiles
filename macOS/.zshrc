bindkey -v
PROMPT="%1d $ "
alias ls="ls -la"

export VULKAN_VERSION="1.4.350.1"
export VULKAN_SDK="$HOME/opt/VulkanSDK/$VULKAN_VERSION/macOS"
export VK_ICD_FILENAMES="$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json"
export VK_LAYER_PATH="$VULKAN_SDK/share/vulkan/explicit_layer.d"

export DYLD_LIBRARY_PATH="$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH"

export PATH="$VULKAN_SDK/bin:$PATH"
export PATH="$HOME/opt/bin:$PATH"
export PATH="$HOME/opt/nvim-macos-x86_64/bin:$PATH"
export PATH="/Applications/CMake.app/Contents/bin:$PATH"

# export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
