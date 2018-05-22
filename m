From: yuq825@gmail.com (Qiang Yu)
Date: Tue, 22 May 2018 08:48:43 +0800
Subject: [PATCH RFC 03/24] arm64/dts: add switch-delay for meson mali
In-Reply-To: <70ef1af2-beff-04a1-063f-cfe430c4fdf9@baylibre.com>
References: <20180518092815.25280-1-yuq825@gmail.com>
 <20180518092815.25280-4-yuq825@gmail.com>
 <70ef1af2-beff-04a1-063f-cfe430c4fdf9@baylibre.com>
Message-ID: <CAKGbVbveF1n=MJrmV2EK7bR+uRAa92rdB=ybHh7xHnwaLM==Xw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

OK, I'll resend these patches.

Regards,
Qiang

On Mon, May 21, 2018 at 10:16 PM, Neil Armstrong
<narmstrong@baylibre.com> wrote:
> Hi Yuq,
>
> On 18/05/2018 11:27, Qiang Yu wrote:
>> Meson mali GPU operate in high clock frequency, need
>> this value be high to work in a stable state.
>>
>> Signed-off-by: Qiang Yu <yuq825@gmail.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
>> index eb327664a4d8..8bed15267c9c 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
>> @@ -23,6 +23,7 @@
>>                       "pp2", "ppmmu2";
>>               clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
>>               clock-names = "bus", "core";
>> +             switch-delay = <0xffff>;
>>
>>               /*
>>                * Mali clocking is provided by two identical clock paths
>>
>
> Please CC : linux-amlogic at lists.infradead.org
> to have these amlogic DT patches reviewed and applied.
>
> Same for cover-letter to have context.
>
> Thanks,
> Neil
