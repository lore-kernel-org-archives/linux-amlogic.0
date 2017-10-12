From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 12 Oct 2017 22:56:49 +0200
Subject: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
In-Reply-To: <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
 <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com>
Message-ID: <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Arnd,

thank you for reviewing this patch!

On Mon, Oct 9, 2017 at 12:24 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Sun, Oct 8, 2017 at 11:17 PM, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>> A USB root-hub may have several PHYs which need to be configured before
>> the root-hub starts working.
>> This adds the documentation for such a USB root-hub as well as a hint
>> regarding the child-nodes on XHCI controllers which can include the
>> roothub.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>
> Have you checked that this still works with DT properties on a USB device
> that is listed in the DT? A common use-case is to provide the MAC address
> of a soldered-down USB-ethernet that lacks its own eeprom, and it seems
> you are changing the way the parent devices of that get represented,
> so the dev->of_node pointer in the USB device might no longer refer
> to the correct device.
I haven't tested the described use-case. however, this patch is not
supposed to change the binding for actual devices.
USB device numbering starts at 1, while 0 is reserved for the root-hub
(at least from what I know). before this patch there was no way to
describe the root-hub via .dts. this however is required for some
platforms that need to set up a PHY for each port on the root-hub
(Amlogic Meson GXL platform is one example: there are two ports
enabled on dwc3's root-hub with 2x USB2 and 1x USB3 PHYs) - so this
patch uses a similar binding as we already have (to describe the
devices) to describe the root-hub


Regards,
Martin
