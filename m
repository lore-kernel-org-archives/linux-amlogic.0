From: robh@kernel.org (Rob Herring)
Date: Mon, 27 Feb 2017 16:16:31 -0600
Subject: [PATCH v2 2/3] ARM64: dts: meson-gx: add clock CLKID_RNG0 to
 hwrng node
In-Reply-To: <8bf052e3-de8f-dbdf-be76-369a7bb1ed15@gmail.com>
References: <daf765e2-1a60-8dea-fee0-8af6ddecdf8e@gmail.com>
 <8bf052e3-de8f-dbdf-be76-369a7bb1ed15@gmail.com>
Message-ID: <20170227221631.g77uphvikrxf7zkh@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Feb 21, 2017 at 09:18:16PM +0100, Heiner Kallweit wrote:
> Add clock CLKID_RNG0 to HW randon number generator node and
> extend the DT binding documentation accordingly.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - splitted first version of patch into two
> - add DT binding documentation
> - mention that clock is optional
> - replace spaces with tabs in DT binding example
> ---
>  Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt | 8 ++++++--
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi                   | 2 +-
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                 | 5 +++++
>  3 files changed, 12 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
