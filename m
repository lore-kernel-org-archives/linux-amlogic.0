From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 19 Mar 2018 14:10:50 +0100
Subject: [PATCH 0/3] dw-hdmi: add property to disable CEC
In-Reply-To: <20180319114345.29837-1-hverkuil@xs4all.nl>
References: <20180319114345.29837-1-hverkuil@xs4all.nl>
Message-ID: <0d341d4b-64f4-2d6e-555c-43136e74807e@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Hans,

On 19/03/2018 12:43, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil@cisco.com>
> 
> Some boards (amlogic) have two CEC controllers: the DesignWare controller
> and their own CEC controller (meson ao-cec).
> 
> Since the CEC line is not hooked up to the DW controller we need a way
> to disable that controller. This patch series adds the cec-disable
> property for that purpose.
> 
> Neil, I have added cec-disable to meson-gxl-s905x-libretech-cc.dts
> only, but I suspect it is probably valid for all meson-glx devices?
> Should I move it to meson-gxl.dtsi?

It's valid on all GX devices, so you can add to meson-gx.dtsi

Neil

> 
> Regards,
> 
> 	Hans
> 
> Hans Verkuil (3):
>   dt-bindings: display: dw_hdmi.txt
>   drm: bridge: dw-hdmi: check the cec-disable property
>   arm64: dts: meson-gxl-s905x-libretech-cc: add cec-disable
> 
>  Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt | 3 +++
>  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 1 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                    | 3 ++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
