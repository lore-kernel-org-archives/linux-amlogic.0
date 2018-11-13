From: srinivas.kandagatla@linaro.org (Srinivas Kandagatla)
Date: Tue, 13 Nov 2018 09:05:57 +0000
Subject: [PATCH 2/4] nvmem: meson-efuse: bindings: add peripheral clock
In-Reply-To: <20181030102231.4851-3-jbrunet@baylibre.com>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
 <20181030102231.4851-3-jbrunet@baylibre.com>
Message-ID: <60b49b47-67d6-ef78-0e0b-78d28da1be6e@linaro.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 30/10/18 10:22, Jerome Brunet wrote:
> The efuse found in gx SoC requires a peripheral clock to properly operate.
> We have been able to work without it until now because the clock was on by
> default, and left on by the CCF. Soon, it will not be the case anymore, so
> the device needs to claim the clock it needs
> 
> Signed-off-by: Jerome Brunet<jbrunet@baylibre.com>
> ---
>   Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 3 +++
>   1 file changed, 3 insertions(+)

Applied, thanks,

--
Srini
