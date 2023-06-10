# presentation-ethprague-2023
"How I Audit", Dominik Teiml, EthPrague 2023.

You can find the slides [here](./presentation-ethprague-2023.pdf) ([direct download](https://raw.githubusercontent.com/hacker-DOM/presentation-ethprague-2023/main/presentation-ethprague-2023.pdf)). You can join the Unofficial group at https://t.me/wokegroup.

Contact: https://lnk.bio/hacker-dom

Navigate to a scratch directory.

```zsh
echo 'Installing pipx & poetry'
brew info pipx
brew install pipx
pipx install poetry

echo 'Cloning the repository'
gh repo clone hacker-dom/woke
cd woke
git checkout feat/woke-dash

echo 'Creating the virtual environment'
python3 -m venv venv
source ./venv/bin/activate

echo 'Installing the package in editable form'
poetry install
```

Then, in a new tab:

```zsh
source ./venv/bin/activate
where woke # You should see your venv
echo 'print("I'm using woke! ✨")' >> woke/cli/__main__.py
woke --help # You should see Hacking on woke and dash
```

Alternatives:

* instead of `pipx`, you could install `peotry` globally with `pip install poetry` when not in a venv.
* instead of `gh`, you could use `git clone https://github.com/hacker-dom/woke`.
* instead of `venv`, you could use `mkvirtualenv scratch-woke-dash`.

Then:

```zsh
mkdir scratch
cd scratch
gh repo clone uniswap/v3-core
cd v3-core
woke dash contracts
```

Let's try some more!

```zsh
cd .. # back in woke/scratch
gh repo clone code-423n4/2023-05-maia
cd 2023-05-maia
touch woke.toml
```

Here is a `woke.toml`:

```toml
[compiler.solc]
via_IR = true
optimizer.enabled = true
optimizer.runs = 1_000_000
remappings = [
    "@ERC20/=src/erc-20/",
    "@ERC4626/=src/erc-4626/",
    "@gauges/=src/gauges/",
    "@hermes/=src/hermes/",
    "@lib/=lib/",
    "@maia/=src/maia/",
    "@omni/=src/ulysses-omnichain/",
    "@openzeppelin/contracts/=lib/openzeppelin-contracts/contracts/",
    "@rewards/=src/rewards/",
    "@talos/=src/talos/",
    "@test/=test/",
    "@ulysses-amm/=src/ulysses-amm/",
    "@uniswap/v3-core/contracts/=lib/v3-core/contracts/",
    "@uniswap/v3-periphery/contracts/=lib/v3-periphery/contracts/",
    "@v3-staker/=src/uni-v3-staker/",
    "ds-test/=lib/forge-std/lib/ds-test/src/",
    "forge-std/=lib/forge-std/src/",
    "solady/=lib/solady/src/",
    "solmate/=lib/solmate/src/",
    "v3-core/=lib/v3-core/contracts/",
    "v3-periphery/=lib/v3-periphery/contracts/",
]
```

Then, just run:

```zsh
woke dash src
```

To try the language server:

1. Run `code .`.
2. Navigate to "Extensions" and search "Tools for Solidity"; install it.
3. Run `mkdir .vscode; touch settings.json`.
4. Copy the following file and paste it in.
5. Open Command Palette (Cmd+Shift+P) and run "Developer: Reload Window".

```json
{
    "woke.compiler.solc": {
        "via_IR": true,
        "optimizer": {
            "enabled": true,
            "runs": 1000000
        },
        "remappings": [
            "@ERC20/=src/erc-20/",
            "@ERC4626/=src/erc-4626/",
            "@gauges/=src/gauges/",
            "@hermes/=src/hermes/",
            "@lib/=lib/",
            "@maia/=src/maia/",
            "@omni/=src/ulysses-omnichain/",
            "@openzeppelin/contracts/=lib/openzeppelin-contracts/contracts/",
            "@rewards/=src/rewards/",
            "@talos/=src/talos/",
            "@test/=test/",
            "@ulysses-amm/=src/ulysses-amm/",
            "@uniswap/v3-core/contracts/=lib/v3-core/contracts/",
            "@uniswap/v3-periphery/contracts/=lib/v3-periphery/contracts/",
            "@v3-staker/=src/uni-v3-staker/",
            "ds-test/=lib/forge-std/lib/ds-test/src/",
            "forge-std/=lib/forge-std/src/",
            "solady/=lib/solady/src/",
            "solmate/=lib/solmate/src/",
            "v3-core/=lib/v3-core/contracts/",
            "v3-periphery/=lib/v3-periphery/contracts/",
        ]
    }
}
```

## Tips

1. Due to our cli library (`click`), you need to put options before the command.
