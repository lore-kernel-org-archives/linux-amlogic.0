From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 9 Nov 2018 10:45:05 +0100
Subject: [PATCH v3 0/3] arm64: dts: meson-gxl: add support for phicomm n1
In-Reply-To: <20181105172825.erlq7h5ddkptthqz@raspberrypi>
References: <20181105172825.erlq7h5ddkptthqz@raspberrypi>
Message-ID: <8bf8eda1-3e31-a2d8-b819-44cd2c445ae9@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

On 05/11/2018 18:28, He Yangxuan wrote:
> This patch adds support for the Phicomm N1. This device based on P230 reference design.
> The phy is RTL8211F, need to disable Energy Efficient Ethernet (EEE) to make it stable.
> And this box doesn't have cvbs, so disable related section in device tree.

Thanks for the re-spin, but :
- please fix git send-email, so the patches are linked by the Message-Id and it's simpler for us to group the patchs in our mail clients and Patchwork
- please also allways CC linux-arm-kernel at lists.infradead.org linux-kernel at vger.kernel.org
- you will need to also CC devicetree at vger.kernel.org for the bindings patches (2 & 3)

Thanks,
Neil

> 
> Changes since v2:
>  - remove changes section in commit message
>  - add commit message for patch of vendor prefix and bindings documentation
> 
> Changes since v1:
>  - rewrite external phy section
>  - add phicomm vendor prefix
>  - add phicomm n1 in Documentation/devicetree/bindings/arm/amlogic.txt
> 
> He Yangxuan (3):
>   arm64: dts: meson-gxl: add support for phicomm n1
>   dt-bindings: Add vendor prefix for PHICOMM Co., Ltd.
>   dt-bindings: arm: amlogic: Add Phicomm N1
> 
>  Documentation/devicetree/bindings/arm/amlogic.txt  |  1 +
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  arch/arm64/boot/dts/amlogic/Makefile               |  1 +
>  .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     | 26 ++++++++++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
> 
