 uniffi::setup_scaffolding!();

// Enum to represent the eternal debate
#[derive(uniffi::Enum, Debug)]
pub enum SuperiorPlatform {
    Swift,
    Kotlin,
    Rust, // The obvious winner
}

// A struct to hold our platform allegiance
#[derive(uniffi::Record)]
pub struct PlatformAlliance {
    pub current_favorite: SuperiorPlatform,
    pub diplomatic_message: String,
    pub smugness_level: u32, // How smug you can be about your choice
}

#[uniffi::export]
pub fn declare_superiority(platform: SuperiorPlatform) -> PlatformAlliance {
    match platform {
        SuperiorPlatform::Swift => PlatformAlliance {
            current_favorite: platform,
            diplomatic_message: "Swift is elegant, but Rust is still watching...".to_string(),
            smugness_level: 7, // Pretty smug about that syntax sugar
        },
        SuperiorPlatform::Kotlin => PlatformAlliance {
            current_favorite: platform,
            diplomatic_message: "Kotlin is practical, but Rust remains unimpressed.".to_string(),
            smugness_level: 5, // Moderate smugness for Java interop
        },
        SuperiorPlatform::Rust => PlatformAlliance {
            current_favorite: platform,
            diplomatic_message: "Finally, someone with sense! 🦀".to_string(),
            smugness_level: 11, // Maximum smugness achieved
        },
    }
}

#[uniffi::export]
pub fn start_platform_war(chosen_side: SuperiorPlatform) -> PlatformAlliance {
    let alliance = declare_superiority(chosen_side);
    // Could add some war initiation logic here
    alliance
}
