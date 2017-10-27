From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 27 Oct 2017 21:20:06 +0200
Subject: [PATCH v7 usb-next 4/4] dt-bindings: usb: xhci: include the
 roothub and a device in the example
In-Reply-To: <20171027032957.m55ntlce646hpd5a@rob-hp-laptop>
References: <20171023215718.3446-1-martin.blumenstingl@googlemail.com>
 <20171023215718.3446-5-martin.blumenstingl@googlemail.com>
 <20171027032957.m55ntlce646hpd5a@rob-hp-laptop>
Message-ID: <CAFBinCALbByzAiAqTOzGj6XHASGwWX34xg7GKf=Fa6_eiCEnkA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Rob,

On Fri, Oct 27, 2017 at 5:29 AM, Rob Herring <robh@kernel.org> wrote:
> On Mon, Oct 23, 2017 at 11:57:18PM +0200, Martin Blumenstingl wrote:
>> This extends the existing example from the USB xHCI binding
>> documentation so it includes the roothub and an actual device.
>> The goal of this is to show that the roothub is specified alongside the
>> actual devices on the USB bus (which is important because a device on
>> the USB bus - for example a hub - might need it's own phys / phy-names
>> properties. modelling the roothub as separate device and not nesting the
>> other devices on the bus below the roothub allows us to keep the
>> properties, for example the PHYs, separated).
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 23 ++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> index 5b49ba9f2f9a..20e5ce2b016a 100644
>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> @@ -42,4 +42,27 @@ Example:
>>               compatible = "generic-xhci";
>>               reg = <0xf0931000 0x8c8>;
>>               interrupts = <0x0 0x4e 0x0>;
>> +
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +
>> +             /* see usb-roothub.txt */
>> +             roothub at 0 {
>> +                     compatible = "usb1d6b,3", "usb1d6b,2";
>> +                     #address-cells = <1>;
>> +                     #size-cells = <0>;
>> +                     reg = <0>;
>> +
>> +                     port at 1 {
>> +                             reg = <1>;
>> +                             phys = <&usb2_phy1>, <&usb3_phy1>;
>> +                             phy-names = "usb2-phy", "usb3-phy";
>> +                     };
>> +             };
>> +
>> +             /* see usb-device.txt */
>> +             hub: genesys at 1 {
>
> What do the 0 and 1 addresses correspond to?
0 is the address of the root-hub, 1 is the first device on the root-hub
based on my previous dt-binding patch Arnd assumed that the devices
would be moved in the hierarchy: [0]
however, my understanding is that (at least for now) the root-hub node
(identified by reg = <0>) is used to describe only the root-hub (which
allows initializing the PHYs), not the devices that are connected to
it

here's an example from my Khadas VIM (which matches the example from
my patch, except: a) it has a different USB hub connected at port 1 b)
it has two ports on the root-hub)
this is a stripped and commented version of "cat /sys/kernel/debug/usb/devices"

T:  Bus=02 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=5000 MxCh= 0
D:  Ver= 3.00 Cls=09(hub  ) Sub=00 Prot=03 MxPS= 9 #Cfgs=  1
P:  Vendor=1d6b ProdID=0003 Rev= 3.14
-> (USB3 root-hub from a dwc3 controller) in the device-tree example
this belongs to &usb/roothub at 0

T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=480  MxCh= 2
D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1d6b ProdID=0002 Rev= 3.14
-> (USB2 root-hub from a dwc3 controller) in the device-tree example
this also belongs to &usb/roothub at 0

T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 4
D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1a40 ProdID=0801 Rev= 1.00
-> (USB2 hub soldered to the board, connected to root-hub port 1) in
the device-tree example this belongs to &usb/genesys at 1

T:  Bus=01 Lev=02 Prnt=02 Port=02 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=090c ProdID=1000 Rev= 7.22
-> USB thumb drive connected to the USB hub, not listed in the
device-tree example but it would be listed below &usb/genesys at 1


>> +                     compatible = "usb5e3,608";
>> +                     reg = <1>;
>> +             };
>>       };
>> --
>> 2.14.2
>>


Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-October/005091.html
