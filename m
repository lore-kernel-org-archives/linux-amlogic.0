From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 9 Jan 2017 00:15:03 +0100
Subject: dwc3: add support for hardware with multiple ports on USB2 hub
 enabled
In-Reply-To: <CAFBinCBMrPKN0nXttLday+rkd9bbADA0LozZ7Ebkz6uwPpSDpw@mail.gmail.com>
References: <CAFBinCBFVp1qdymz9rqKB2Lq8-iBihJ_Xo5JN7zCTLg223wWSw@mail.gmail.com>
 <CAFBinCBMrPKN0nXttLday+rkd9bbADA0LozZ7Ebkz6uwPpSDpw@mail.gmail.com>
Message-ID: <CAFBinCCY0j1QLqyh3v7iWCoLM0M6kiefWXszGoUedZQgRhg21w@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Felipe, Hello John,

On Sun, Nov 27, 2016 at 2:05 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> On Sun, Nov 27, 2016 at 2:02 PM, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>> Hello,
>>
>> while adding USB support on the Amlogic Meson GXL / GXM SoCs I have
>> come across something I did not know yet:
>> dwc3 has an internal USB2 hub (from what I can read in the code there
>> seem to be multiple USB3 ports supported as well).
>> When searching the web I did not come across any SoC that uses a
>> configuration with more than one port enabled.
I am still trying to figure out the logic behind the dwc3 USB hubs to
add USB support for the Amlogic Meson GXL and GXM SoCs.
Unfortunately I do not have access to the dwc3 documentation.

It would be great if you could share your thoughts how to add support
for dwc3 configurations with more than one port enabled on the
internal hub.
I am *not* expecting any finished code or a concept that just has to
be converted to "source code".
You can find *my* ideas on how to solve this below.

>> On my Amlogic Meson GXM device (consumer device, no development board)
>> I see the following USB2 PHY register configuration (full register
>> dump from the kernel that was shipped with the device is attached):
>> GUSB2PHYCFG(0) = 0x40102500
>> GUSB2PHYCFG(1) = 0x40102540
>> GUSB2PHYCFG(2) = 0x40102540
>>
>> Then vendor kernel sources (a 3.14 kernel) are adding the resets for
>> GUSB2PHYCFG([1-3]) in dwc3_core_soft_reset().
>> A mainline 4.9+(Meson GXL USB PHY patches + dwc3/xhci-plat DMA patches
>> from linux-usb) kernel works fine even with just applying the reset to
>> GUSB2PHYCFG(0).
>>
>> That brings up two questions:
>> 1. I guess it makes sense to adjust the upstream dwc3 to add the
>> resets for all available USB2 PHYs - is there a specific reason why
>> the current dwc3 driver does not do that (or is it simply because why
>> we find on Meson GXL/GXM is very exotic)?
>> 2. would we also implement this for the USB3 "pipes" as well (without
>> being able to test this)?
>> 3. from what I can see in the code we have to adjust dwc3_phy_setup()
>> and ulpi.c to add support for multiple ports, but how do we detect the
>> number of USB2 and USB3 ports (is this somewhere encoded in the
>> DWC3_GHWPARAMS registers)?
after reading more about how USB hubs are working internally it seems
to me that this design makes sense. I guess the answer for #1 and #2
is simply "yes".
it also seems to make sense that I have to enable all USB2 PHYs
(additional info: I cannot get dwc3 to detect any device as long as
any of the USB PHYs is disabled, even if the device is plugged into a
non-disabled port) due to the way an USB hub works. so it only seems
logical that we should add support for that to the dwc3 driver as
well.

my current idea is to describe the hub on the dwc3 via devicetree
(thanks to Rob for the idea back in November).
the result could look like this (very work in progress!):
roothub at 0 {
  compatible = "usb1d6b,2";
  #address-cells = <1>;
  #size-cells = <0>;
  reg = <0>;

  port at 1 {
    reg = <1>;
    phys = <&usb2_phy0>;
    phy-names = "usb2-phy";
  };

  port at 2 {
    reg = <2>;
    phys = <&usb2_phy1>;
    phy-names = "usb2-phy";
  };
};

(there are no usb3-phys configured because these are not supported on
the SoC I'm testing with, but the code would support these of course)
This would also allow us to move settings like
"snps,dis_u2_susphy_quirk" to specific ports as well.
If we don't find the root-hub as child-node of the dwc3 node then we
can simply fall back to parsing the dwc3 node itself (to ensure
backwards compatibility).
we could also use this in the future to prevent the following error
message when the dwc3 IP is configured without USB3 ports:
hub 2-0:1.0: USB hub found
hub 2-0:1.0: config failed, hub doesn't have any ports! (err -19)

PS: I found the  Genesys Logic GL850 and Cypress CY7C65642 datasheets helpful.
The "Block Diagrams" give a good basic overview.


Regards,
Martin
