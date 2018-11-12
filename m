From: robh@kernel.org (Rob Herring)
Date: Mon, 12 Nov 2018 17:36:52 -0600
Subject: [PATCH 2/4] nvmem: meson-efuse: bindings: add peripheral clock
In-Reply-To: <20181030102231.4851-3-jbrunet@baylibre.com>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
 <20181030102231.4851-3-jbrunet@baylibre.com>
Message-ID: <5bea0e97.1c69fb81.5f348.8925@mx.google.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 30 Oct 2018 11:22:29 +0100, Jerome Brunet wrote:
> The efuse found in gx SoC requires a peripheral clock to properly operate.
> We have been able to work without it until now because the clock was on by
> default, and left on by the CCF. Soon, it will not be the case anymore, so
> the device needs to claim the clock it needs
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
