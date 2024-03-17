{
    lib,
    rustPlatform,
    fetchFromGitHub,
    # , testers
    # , alejandra
}:
rustPlatform.buildRustPackage rec {
    pname = "alejandra";
    version = "3.0.0";

    src = fetchFromGitHub {
        owner = "kamadorueda";
        repo = "alejandra";
        rev = version;
        sha256 = "sha256-xFumnivtVwu5fFBOrTxrv6fv3geHKF04RGP23EsDVaI=";
    };

    cargoSha256 = "sha256-tF8E9mnvkTXoViVss9cNjpU4UkEsARp4RtlxKWq55hc=";
    # cargoSha256 = "sha256-EZSH8AUKRvoL+ABufVQ9SF6coeNPOGZ10WhiErW05/c=";
    #   passthru.tests = {
    #     version = testers.testVersion { package = alejandra; };
    #   };
    patches = [./name-patch.diff];

    postPatch = ''
      substituteInPlace src/alejandra/src/builder.rs \
          --replace "2 * build_ctx.indentation" "4 * build_ctx.indentation"
      substituteInPlace src/alejandra/src/rules/string.rs \
          --replace 'format!("  {}", line)' 'format!("    {}", line)'

      rm -r src/alejandra/tests
    '';

    meta = with lib; {
        description = "The Uncompromising Nix Code Formatter";
        homepage = "https://github.com/kamadorueda/alejandra";
        changelog = "https://github.com/kamadorueda/alejandra/blob/${version}/CHANGELOG.md";
        license = licenses.unlicense;
        maintainers = with maintainers; [_0x4A6F kamadorueda sciencentistguy];
        mainProgram = "alejandra";
    };
}
