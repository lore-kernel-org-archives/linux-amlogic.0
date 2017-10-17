From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 17 Oct 2017 23:19:02 +0200
Subject: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
In-Reply-To: <CAK8P3a31GLjQDUUdyTeaAX_fELV5_UkNQfbj+ssHrGa7Ek2NcA@mail.gmail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
 <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com>
 <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com>
 <CAK8P3a2C+8w5_8uZF2qHvq7Cp=AH6DDx5Y=mGJFCCz2pTLvPPg@mail.gmail.com>
 <CAFBinCC7disratgMmmaSJMfywb-bPF32L-1BarSsX6zTChHEJg@mail.gmail.com>
 <CAK8P3a31GLjQDUUdyTeaAX_fELV5_UkNQfbj+ssHrGa7Ek2NcA@mail.gmail.com>
Message-ID: <CAFBinCCmk3bSa4-OY7Mu0sPEhVv6=dQbSO94P=YMqk_hc+53Pg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Arnd,

On Tue, Oct 17, 2017 at 11:10 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Oct 17, 2017 at 11:00 PM, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>> On Fri, Oct 13, 2017 at 9:37 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> On Thu, Oct 12, 2017 at 10:56 PM, Martin Blumenstingl
>>> <martin.blumenstingl@googlemail.com> wrote:
>>>
>>> It's possible that this has never worked on XHCI because of the lack
>>> of the root-hub in DT. Either way, we should ensure that it does work
>>> now and you didn't break it, so please at least test it with your patches.
>>>
>>> The patch below should be sufficient to see if any device has an
>>> of_node pointer when you add it to your DT:
>> I slightly modified your patch (see the attached version) and tried it:
>> # lsusb -t
>> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/0p, 5000M
>> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
>>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>>        |__ Port 3: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 480M
>>
>> the roothub (bus 1 port 1 dev 1) and a soldered down hub (child of
>> that root-hub, port 1 dev 2) have an entry in the .dts
>>
>> # dmesg | grep usb
>> [    0.174097] usbcore: registered new interface driver usbfs
>> [    0.174147] usbcore: registered new interface driver hub
>> [    0.174217] usbcore: registered new device driver usb
>> [    1.354280] usb usb2: We don't know the algorithms for LPM for this
>> host, disabling LPM.
>> [    1.373297] usbcore: registered new interface driver usb-storage
>> [    1.512840] usbcore: registered new interface driver dvb_usb_rtl28xxu
>> [    1.550506] usb 1-1: of_node /soc/usb at c9000000/hub at 1 parent /soc/usb at c9000000
>> ^ this is the soldered down hub
>> [    1.552579] usbcore: registered new interface driver bcm203x
>> [    1.712033] usbcore: registered new interface driver usbhid
>> [    1.716994] usbhid: USB HID core driver
>> [    1.738827] usb 1-1: new high-speed USB device number 2 using xhci-hcd
>> [    2.142392] usb 1-1.3: of_node <no-node> parent /soc/usb at c9000000/hub at 1
>> ^ this is the thumb drive plugged into the hub (not specified in the .dts)
>> [    2.220399] usb 1-1.3: new high-speed USB device number 3 using xhci-hcd
>> [    2.326144] usb-storage 1-1.3:1.0: USB Mass Storage device detected
>> [    2.328352] scsi host0: usb-storage 1-1.3:1.0
>>
>> so for me it seems to be working fine
>
> Ok, very good!
>
>> is there anything else you want me to test?
>
> What about the same dtb when run on a kernel without your
> patch series? Does that work as well, or are your patches
> required to make it work?
this is the only device I have which uses devicetree and a xHCI
controller. I can test it with a dwc2 based device though if you want


Regards,
Martin
