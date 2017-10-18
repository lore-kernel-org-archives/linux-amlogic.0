From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 18 Oct 2017 11:05:15 +0200
Subject: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation for
 USB root-hub
In-Reply-To: <CAFBinCCmk3bSa4-OY7Mu0sPEhVv6=dQbSO94P=YMqk_hc+53Pg@mail.gmail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-2-martin.blumenstingl@googlemail.com>
 <CAK8P3a2607YnNRRmAJJyTNJTTJmJvx-ZJm3QNAq84noPLy+F+A@mail.gmail.com>
 <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com>
 <CAK8P3a2C+8w5_8uZF2qHvq7Cp=AH6DDx5Y=mGJFCCz2pTLvPPg@mail.gmail.com>
 <CAFBinCC7disratgMmmaSJMfywb-bPF32L-1BarSsX6zTChHEJg@mail.gmail.com>
 <CAK8P3a31GLjQDUUdyTeaAX_fELV5_UkNQfbj+ssHrGa7Ek2NcA@mail.gmail.com>
 <CAFBinCCmk3bSa4-OY7Mu0sPEhVv6=dQbSO94P=YMqk_hc+53Pg@mail.gmail.com>
Message-ID: <CAK8P3a0hFF-gMa4UWMXh-28=scF-8cnzPv-Sa11PzyvgMYAkQw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Oct 17, 2017 at 11:19 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>> Ok, very good!
>>
>>> is there anything else you want me to test?
>>
>> What about the same dtb when run on a kernel without your
>> patch series? Does that work as well, or are your patches
>> required to make it work?
>
> this is the only device I have which uses devicetree and a xHCI
> controller. I can test it with a dwc2 based device though if you want

Does dwc2 also use separate nodes for the roothub? From your
description it sounds like it would not be affected by your patch.

To rephrase what I'm interested in, can you check that with your
patch series, we correctly associate a device node in DT with the
struct device in the kernel both with and without the optional
roothub node in the dtb?

Since you used a dtb that already listed an endpoint device below
an xhci, that would answer my earlier question of whether it worked
before your patch series, and you tested that it still works with your
patches applied and the roothub node added in the dtb.  Now we
just need to make sure we don't break existing dtb files that don't
have the roothub node but do have endpoint device nodes.

       Arnd
