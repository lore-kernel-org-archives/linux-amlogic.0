From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 1 Aug 2018 22:13:33 +0200
Subject: [RFC 4/4] dt-bindings: media: add Amlogic Meson Video Decoder
 Bindings
In-Reply-To: <20180801193320.25313-5-maxi.jourdan@wanadoo.fr>
References: <20180801193320.25313-1-maxi.jourdan@wanadoo.fr>
 <20180801193320.25313-5-maxi.jourdan@wanadoo.fr>
Message-ID: <CAFBinCCS_i5vWAexmZiwQYopfKB_aX_ZE-QM6r95ePAsVCLQiA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Maxime,

many thanks for your work!

On Wed, Aug 1, 2018 at 9:34 PM Maxime Jourdan <maxi.jourdan@wanadoo.fr> wrote:
>
> Add documentation for the meson vdec dts node.
>
> Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
> ---
>  .../bindings/media/amlogic,meson-vdec.txt     | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-vdec.txt
>
> diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-vdec.txt b/Documentation/devicetree/bindings/media/amlogic,meson-vdec.txt
> new file mode 100644
> index 000000000000..120b135e6bb5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,meson-vdec.txt
> @@ -0,0 +1,60 @@
> +Amlogic Meson Video Decoder
> +================================
> +
> +The VDEC IP is composed of the following blocks :
> +
> +- ESPARSER is a bitstream parser that outputs to a VIFIFO. Further VDEC blocks
> +then feed from this VIFIFO.
> +- VDEC_1 can decode MPEG-1, MPEG-2, MPEG-4 part 2, H.263, H.264.
> +- VDEC_2 is used as a helper for corner cases like H.264 4K on older SoCs.
> +It is not handled by this driver.
is it currently not handled or will it never be?

> +- VDEC_HCODEC is the H.264 encoding block. It is not handled by this driver.
> +- VDEC_HEVC can decode HEVC and VP9.
> +
> +Device Tree Bindings:
> +---------------------
> +
> +VDEC: Video Decoder
> +--------------------------
> +
> +Required properties:
> +- compatible: value should be different for each SoC family as :
> +       - GXBB (S905) : "amlogic,meson-gxbb-vdec"
> +       - GXL (S905X, S905D) : "amlogic,meson-gxl-vdec"
> +       - GXM (S912) : "amlogic,meson-gxm-vdec"
> +- reg: base address and size of he following memory-mapped regions :
> +       - dos
> +       - esparser
> +       - dmc
> +- reg-names: should contain the names of the previous memory regions
any reason why you are not using the DMC syscon (as added in your
patch "dt-bindings: soc: amlogic: add meson-canvas documentation")
instead of mapping the DMC region again?

> +- interrupts: should contain the vdec and esparser IRQs.
are these two IRQs the "currently supported" ones or are there more
for the whole IP block (but just not implemented yet)?

> +- clocks: should contain the following clocks :
> +       - dos_parser
> +       - dos
> +       - vdec_1
> +       - vdec_hevc
> +- clock-names: should contain the names of the previous clocks
> +- resets: should contain the parser reset.
> +- reset-names: should be "esparser".
> +
> +Example:
> +
> +vdec: video-decoder at 0xd0050000 {
> +       compatible = "amlogic,meson-gxbb-vdec";
> +       reg = <0x0 0xc8820000 0x0 0x10000
> +              0x0 0xc110a580 0x0 0xe4
> +              0x0 0xc8838000 0x0 0x60>;
AFAIK the "correct" format is (just like you've done for the clocks below):
       reg = <0x0 0xc8820000 0x0 0x10000>,
                 <0x0 0xc110a580 0x0 0xe4>,
                 <0x0 0xc8838000 0x0 0x60>;

> +       reg-names = "dos", "esparser", "dmc";
> +
> +       interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING
> +                     GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
AFAIK the "correct" format is (just like you've done for the clocks below):
       interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
                           <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;

> +       interrupt-names = "vdec", "esparser";
> +
> +       amlogic,ao-sysctrl = <&sysctrl_AO>;
this is not documented above - is it needed?


Regards
Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-August/008034.html
