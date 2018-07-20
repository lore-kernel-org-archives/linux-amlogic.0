From: robh@kernel.org (Rob Herring)
Date: Fri, 20 Jul 2018 07:52:15 -0600
Subject: [PATCH 1/2] reset: meson: add dt-bindings for meson-axg audio arb
In-Reply-To: <20180706143122.7612-2-jbrunet@baylibre.com>
References: <20180706143122.7612-1-jbrunet@baylibre.com>
 <20180706143122.7612-2-jbrunet@baylibre.com>
Message-ID: <20180720135215.GA31492@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Jul 06, 2018 at 04:31:21PM +0200, Jerome Brunet wrote:
> Add dt-bindings for the audio memory arbitror found on Amlogic's
> A113 based SoCs

s/arbitror/arbiter/

> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/reset/amlogic,meson-axg-audio-arb.txt  | 21 +++++++++++++++++++++
>  .../dt-bindings/reset/amlogic,meson-axg-audio-arb.h | 17 +++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
> new file mode 100644
> index 000000000000..e29b3463f2e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
> @@ -0,0 +1,21 @@
> +* Amlogic audio memory arbitror controller

s/arbitror/arbiter/

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
