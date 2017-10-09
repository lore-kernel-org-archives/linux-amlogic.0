From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 9 Oct 2017 12:24:59 +0200
Subject: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
In-Reply-To: <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
Message-ID: <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Oct 8, 2017 at 11:17 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> A USB root-hub may have several PHYs which need to be configured before
> the root-hub starts working.
> This adds the documentation for such a USB root-hub as well as a hint
> regarding the child-nodes on XHCI controllers which can include the
> roothub.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Have you checked that this still works with DT properties on a USB device
that is listed in the DT? A common use-case is to provide the MAC address
of a soldered-down USB-ethernet that lacks its own eeprom, and it seems
you are changing the way the parent devices of that get represented,
so the dev->of_node pointer in the USB device might no longer refer
to the correct device.

       Arnd
