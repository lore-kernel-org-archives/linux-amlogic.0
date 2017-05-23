From: robh@kernel.org (Rob Herring)
Date: Mon, 22 May 2017 19:56:01 -0500
Subject: [PATCH RfC v3 2/7] pinctrl: meson: document GPIO IRQ driver DT
 binding
In-Reply-To: <7c09969b-ac04-cfa4-7459-7ad25b7c5cbf@gmail.com>
References: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
 <7c09969b-ac04-cfa4-7459-7ad25b7c5cbf@gmail.com>
Message-ID: <20170523005601.h6nupyplymv2ieng@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, May 17, 2017 at 10:16:35PM +0200, Heiner Kallweit wrote:
> Document the DT binding for GPIO IRQ support on Amlogic Meson SoC's.
> 
> This documentation is intentionally not placed under
> interrupt-controllers as GPIO IRQ support on these SoC's acts more
> like an interrupt multiplexer.

I've not seen anything in the discussion that indicates this is a better 
fit as gpio. Seems to me multiple people including me have said this 
sounds like an interrupt controller.

> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - remove syscon
> v3:
> - no changes
> ---
>  .../bindings/gpio/amlogic,meson-gpio-interrupt.txt | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
