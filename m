From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 17 Oct 2017 23:00:03 +0200
Subject: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
In-Reply-To: <CAK8P3a2C+8w5_8uZF2qHvq7Cp=AH6DDx5Y=mGJFCCz2pTLvPPg@mail.gmail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
 <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com>
 <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com>
 <CAK8P3a2C+8w5_8uZF2qHvq7Cp=AH6DDx5Y=mGJFCCz2pTLvPPg@mail.gmail.com>
Message-ID: <CAFBinCC7disratgMmmaSJMfywb-bPF32L-1BarSsX6zTChHEJg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Arnd,

On Fri, Oct 13, 2017 at 9:37 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Oct 12, 2017 at 10:56 PM, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>> Hi Arnd,
>>
>> thank you for reviewing this patch!
>>
>> On Mon, Oct 9, 2017 at 12:24 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> On Sun, Oct 8, 2017 at 11:17 PM, Martin Blumenstingl
>>> <martin.blumenstingl@googlemail.com> wrote:
>>>> A USB root-hub may have several PHYs which need to be configured before
>>>> the root-hub starts working.
>>>> This adds the documentation for such a USB root-hub as well as a hint
>>>> regarding the child-nodes on XHCI controllers which can include the
>>>> roothub.
>>>>
>>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>>> Acked-by: Rob Herring <robh@kernel.org>
>>>
>>> Have you checked that this still works with DT properties on a USB device
>>> that is listed in the DT? A common use-case is to provide the MAC address
>>> of a soldered-down USB-ethernet that lacks its own eeprom, and it seems
>>> you are changing the way the parent devices of that get represented,
>>> so the dev->of_node pointer in the USB device might no longer refer
>>> to the correct device.
>> I haven't tested the described use-case. however, this patch is not
>> supposed to change the binding for actual devices.
>> USB device numbering starts at 1, while 0 is reserved for the root-hub
>> (at least from what I know). before this patch there was no way to
>> describe the root-hub via .dts. this however is required for some
>> platforms that need to set up a PHY for each port on the root-hub
>> (Amlogic Meson GXL platform is one example: there are two ports
>> enabled on dwc3's root-hub with 2x USB2 and 1x USB3 PHYs) - so this
>> patch uses a similar binding as we already have (to describe the
>> devices) to describe the root-hub
>
> My point is that the DT binding does depend on the hierarchy, there
> is no way to find a particular device unless each parent up the
> chain is described correctly in DT as well and has a valid of_node
> pointer.
>
> It's possible that this has never worked on XHCI because of the lack
> of the root-hub in DT. Either way, we should ensure that it does work
> now and you didn't break it, so please at least test it with your patches.
>
> The patch below should be sufficient to see if any device has an
> of_node pointer when you add it to your DT:
I slightly modified your patch (see the attached version) and tried it:
# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/0p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
   |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
       |__ Port 3: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 480M

the roothub (bus 1 port 1 dev 1) and a soldered down hub (child of
that root-hub, port 1 dev 2) have an entry in the .dts

# dmesg | grep usb
[    0.174097] usbcore: registered new interface driver usbfs
[    0.174147] usbcore: registered new interface driver hub
[    0.174217] usbcore: registered new device driver usb
[    1.354280] usb usb2: We don't know the algorithms for LPM for this
host, disabling LPM.
[    1.373297] usbcore: registered new interface driver usb-storage
[    1.512840] usbcore: registered new interface driver dvb_usb_rtl28xxu
[    1.550506] usb 1-1: of_node /soc/usb at c9000000/hub at 1 parent /soc/usb at c9000000
^ this is the soldered down hub
[    1.552579] usbcore: registered new interface driver bcm203x
[    1.712033] usbcore: registered new interface driver usbhid
[    1.716994] usbhid: USB HID core driver
[    1.738827] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[    2.142392] usb 1-1.3: of_node <no-node> parent /soc/usb at c9000000/hub at 1
^ this is the thumb drive plugged into the hub (not specified in the .dts)
[    2.220399] usb 1-1.3: new high-speed USB device number 3 using xhci-hcd
[    2.326144] usb-storage 1-1.3:1.0: USB Mass Storage device detected
[    2.328352] scsi host0: usb-storage 1-1.3:1.0

so for me it seems to be working fine

is there anything else you want me to test?

> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 17681d5638ac..498d0aa0a5c0 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -647,6 +647,7 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
>                 }
>                 dev->dev.of_node = usb_of_get_child_node(parent->dev.of_node,
>                                 raw_port);
> +               dev_info(&dev->dev, "of_node %p parent %p\n",
> dev->dev.of_node, parent->dev.of_node);
>
>                 /* hub driver sets up TT records */
>         }
>
>
>        Arnd


Regards,
Martin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: khadas-vim-soldered-usb-hub-print.patch
Type: text/x-patch
Size: 885 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20171017/f4a86034/attachment.bin>
