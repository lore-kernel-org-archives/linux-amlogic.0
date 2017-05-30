From: robh@kernel.org (Rob Herring)
Date: Tue, 30 May 2017 16:44:29 -0500
Subject: [PATCH RfC v3 7/7] pinctrl: meson: add interrupt controller to
 GPIO DT nodes
In-Reply-To: <1c8aa228-c1da-ed48-52a5-184332eecf26@gmail.com>
References: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
 <1c8aa228-c1da-ed48-52a5-184332eecf26@gmail.com>
Message-ID: <20170530214429.pulyr4hnhss4cmcr@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, May 17, 2017 at 10:17:10PM +0200, Heiner Kallweit wrote:
> Add interrupt controller properties to the gpio controller nodes and
> extend the gpio controller DT binding documentation.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v3:
> - added to the patch series
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
>  arch/arm/boot/dts/meson8.dtsi                               | 2 ++
>  arch/arm/boot/dts/meson8b.dtsi                              | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                 | 4 ++++
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                  | 4 ++++
>  5 files changed, 16 insertions(+)

Bindings and dts changes should be separate patches. With that,

Acked-by: Rob Herring <robh@kernel.org>
