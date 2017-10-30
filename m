From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 30 Oct 2017 15:08:07 +0100
Subject: [PATCH v7 usb-next 4/4] dt-bindings: usb: xhci: include the
 roothub and a device in the example
In-Reply-To: <CAFBinCBocmr6fywO9vqWu+ngfrbG=FBFqdEvYEBWR84VgMANpw@mail.gmail.com>
References: <CAFBinCALbByzAiAqTOzGj6XHASGwWX34xg7GKf=Fa6_eiCEnkA@mail.gmail.com>
 <Pine.LNX.4.44L0.1710271550360.1355-100000@iolanthe.rowland.org>
 <CAFBinCBocmr6fywO9vqWu+ngfrbG=FBFqdEvYEBWR84VgMANpw@mail.gmail.com>
Message-ID: <CAK8P3a1xdUy7g991MbtrSTYFsM864MQDc61=sLZmfSMwrokCBg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Oct 28, 2017 at 3:33 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> On Fri, Oct 27, 2017 at 9:55 PM, Alan Stern <stern@rowland.harvard.edu> wrote:
>> On Fri, 27 Oct 2017, Martin Blumenstingl wrote:
>>> >> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>> >> index 5b49ba9f2f9a..20e5ce2b016a 100644
>>> >> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>> >> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>> >> @@ -42,4 +42,27 @@ Example:
>>> >>               compatible = "generic-xhci";
>>> >>               reg = <0xf0931000 0x8c8>;
>>> >>               interrupts = <0x0 0x4e 0x0>;
>>> >> +
>>> >> +             #address-cells = <1>;
>>> >> +             #size-cells = <0>;
>>> >> +
>>> >> +             /* see usb-roothub.txt */
>>> >> +             roothub at 0 {
>>> >> +                     compatible = "usb1d6b,3", "usb1d6b,2";
>>> >> +                     #address-cells = <1>;
>>> >> +                     #size-cells = <0>;
>>> >> +                     reg = <0>;
>>> >> +
>>> >> +                     port at 1 {
>>> >> +                             reg = <1>;
>>> >> +                             phys = <&usb2_phy1>, <&usb3_phy1>;
>>> >> +                             phy-names = "usb2-phy", "usb3-phy";
>>> >> +                     };
>>> >> +             };
>>> >> +
>>> >> +             /* see usb-device.txt */
>>> >> +             hub: genesys at 1 {

>> Two things to be aware of:
>>
>>     1.  /sys/kernel/debug/usb/devices has an off-by-one error in the
>>         "Port=" field.  Every value you see should actually be one
>>         higher than it is.  It has been this way for many, many years
>>         so we can't fix it now.
> here's the output of "lsusb -t" (which is easier to read I guess):
> # lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/0p, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>        |__ Port 3: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 480M

I see two possible problems here:

* Linux does show the root hub as a parent of the external hub,
  while the DT shows them as two unrelated children of the host
  controller. This clearly doesn't reflect the reality, and may come
  to bite us again later when we try to extend it in some other way.

* Listing the root hub as compatible="usb1d6b,3" encodes a Linux
  implementation detail into the OS-independent DT ABI: The
  root hub does not actually have this vendor/device ID, it's
  just something we make up in Linux.

I think you mentioned that an earlier version of the patch set
did not have the root hub at all but instead listed the PHYs directly
under the host controller. Can you summarize what the problem
with that approach was?

Is it correct that roothub at 0/port at 1 corresponds to the same
connector that genesys at 1 is connected to?

      Arnd
