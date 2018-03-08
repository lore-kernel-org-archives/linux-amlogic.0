From: balbi@kernel.org (Felipe Balbi)
Date: Thu, 08 Mar 2018 10:49:35 +0200
Subject: [PATCH usb-next v2 0/3] DWC3 support for Amlogic Meson AXG and
 GXL SoCs
In-Reply-To: <CAFBinCB=8xQcJHcw5bX4z5Y2JOEqU7O-FH02JS4myJ-d487_zQ@mail.gmail.com>
References: <20180211211517.5846-1-martin.blumenstingl@googlemail.com>
 <CAFBinCBhOy2J7dgyLg-Oii1iMn0RJyud7ykW=EMBGg+F8X7DpA@mail.gmail.com>
 <CAFBinCB=8xQcJHcw5bX4z5Y2JOEqU7O-FH02JS4myJ-d487_zQ@mail.gmail.com>
Message-ID: <87o9jzuf34.fsf@linux.intel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


Hi,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>> Martin Blumenstingl (3):
>>>   dt-bindings: usb: add support for dwc3 controller on Amlogic Meson GX
>>>   usb: dwc3: of-simple: add support for shared and pulsed reset lines
>>>   usb: dwc3: of-simple: add support for the Amlogic Meson GXL and AXG
>>>     SoCs
>> could you please let me know if you spotted any problems, code-style
>> issues in v2 or whether you are waiting for feedback from another
>> maintainer?
>> in case everything is fine: will you take this series through your tree?
> could you please let me know how this series is supposed to land in
> the next kernel release:
> - Felipe, will you take it through your usb tree (which contains many
> other dwc2/dwc3 driver changes)?

it'll go through my tree. I'm about to merge it into my testing/next.

-- 
balbi
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180308/99f17c96/attachment.sig>
