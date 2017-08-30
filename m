From: olof@lixom.net (Olof Johansson)
Date: Tue, 29 Aug 2017 22:26:38 -0700
Subject: [GIT PULL] Amlogic 64-bit DT updates for v4.14 (round 2)
In-Reply-To: <7h60dceef3.fsf@baylibre.com>
References: <7h60dceef3.fsf@baylibre.com>
Message-ID: <20170830052638.GG14499@localhost>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Aug 24, 2017 at 04:25:52PM -0700, Kevin Hilman wrote:
> Olof, Arnd,
> 
> Here's a final round of 64-bit DT changes for Amlogic SoC family.
> 
> This is a bit late as it was waiting for the clock dependencies to be
> merge into clk-next.  The good news is that clock dependencies should
> not be happending every cycle anymore as we've now exposed all the
> clocks for use by the bindings.
> 
> Also note that this branch pulls in -rc4 due to a minor add/add conflict
> for the GPIO names patch, which is why the diffstat is so big.
> 
> Kevin
> 
> 
> The following changes since commit f72d6f6037b7b07927f78e159e4949b8e0263258:
> 
>   ARM64: dts: meson-gx: use stable UART bindings with correct gate clock (2017-08-08 14:48:56 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64-2
> 
> for you to fetch changes up to 47884c5c746ee7c02e06fbf60480e0f13aa11dfe:
> 
>   ARM64: dts: meson-gxl-libretech-cc: Add GPIO lines names (2017-08-22 15:37:50 -0700)
> 
> ----------------------------------------------------------------
> Amlogic 64-bit DT updates for v4.14, round 2
> - clock updates w/dependencies on clock tree
> - GPIO names updates
> 
> ----------------------------------------------------------------
> Jerome Brunet (5):
>       clk: meson: meson8b: fix protection against undefined clks
>       clk: meson: gxbb: fix protection against undefined clks
>       clk: meson8b: expose every clock in the bindings
>       clk: meson-gxbb: expose almost every clock in the bindings
>       clk: meson: gxbb: Add sd_emmc clk0 clkids
> 
> Kevin Hilman (2):
>       Merge tag 'meson-clk-headers-for-4.14' of git://github.com/BayLibre/clk-meson into v4.14/dt64
>       Merge tag 'v4.13-rc4' into v4.14/dt64
> 
> Martin Blumenstingl (1):
>       dt-bindings: clock: meson8b: describe the embedded reset controller
> 
> Neil Armstrong (4):
>       dt-bindings: clock: gxbb-aoclk: Add CEC 32k clock
>       ARM64: dts: meson-gx: update AO clkc to new bindings
>       ARM64: dts: meson-gx: Add AO CEC nodes
>       ARM64: dts: meson-gxl-libretech-cc: Add GPIO lines names

That looks OK but the diffstat doesn't seem right.

Merged into next/dt64 though, please double check that it's the expected end
result.


-Olof
