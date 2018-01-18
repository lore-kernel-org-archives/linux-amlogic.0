From: yixun.lan@amlogic.com (Yixun Lan)
Date: Thu, 18 Jan 2018 18:27:52 +0800
Subject: [PATCH net-next v5 0/4] dwmac-meson8b: clock fixes for Meson8b
In-Reply-To: <1516123172.2608.96.camel@baylibre.com>
References: <20180115171015.1118-1-martin.blumenstingl@googlemail.com>
 <25b1b957-b9c0-07a9-8c35-3d191eb8026e@amlogic.com>
 <1516095424.2608.36.camel@baylibre.com>
 <CAFBinCBZKw04FSUBEyuQNdwbNJLjTK6y8p-MmNBHu=dLVOnKCg@mail.gmail.com>
 <1516123172.2608.96.camel@baylibre.com>
Message-ID: <6d49179e-274b-78cb-0b0f-d229b155f2a2@amlogic.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

HI Jerome

On 01/17/18 01:19, Jerome Brunet wrote:
> On Tue, 2018-01-16 at 12:17 +0100, Martin Blumenstingl wrote:
>>>> Hi Martin
>>>>
>>>>   I'm having problem with this series applied.
>>>> I've tested on the A113D (AXG) platform, if this patch is applied, the
>>>> driver will choose MPLL2 as clk source, and seems it doesn't work out
>>>> with this clk (fail to get IP)
>>>>
>>>> grep mpll2 /sys/kernel/debug/clk/clk_summary
>>>>         mpll2                              1            1   249999449
>>>>       0 0
>>>>
>>>
>>> This is because the fixed pll is 1992000000 on the axg instead of 2Ghz.
>>
>> is there a chance that we can have a public AXG datasheet, similar to
>> what Hardkernel and Khadas published for the S805, S905, S905X and
>> S912?
>> this would give us community developers a chance to know that we are
>> going to break something on AXG *before* a patch is published (like in
>> this case :( )
>>
>>> As a consequence fdiv4 is 498000000.
> 
> Quick update
> I have just been able measure fdiv4 and it is exactly 500Mhz
> This means the the fixed_pll is actually 2GHz, as we would expect.
> 
yes, you right here. the output of fixed pll is actually 2GHz (1999.998MHz)


> This also means that calculation of the fixed_pll is slightly off on the axg
> platform.
> 
the calculation algorithm should be updated because previous one didn't
take the 'frac' part into account.


> Once the clock calculation is done correctly on axg, there should be no problem.
> 
there is still a problem, current calculation will still result at
fixed_pll frequency - 1999,000,000, I would expect it 2000,000,000 (to
round it to closest? or just 1999,998,000)


>>>
>>> CCF can reach something closer to 250Mhz with the mpll2.
>>>
>>> The easy way to fix this would be to make the inputs of ethernet mux optional
>>> and not provide the MPLL2 on the axg.
>>>
>>> However, this raises a few question on the axg platform :
>>> 1) Why is the root pll 1992Mhz and not 2GHz ? seems a weird choice just for 4MHz
>>> This 1992Mhz does not seems to help generate audio freqs anymore than 2GHz
>>> would. I don't really get this choice. Could you help us understand Yixun ?
>>>
>>> 2) Why is ethernet not working with mpll2 on axg ? espcially since we have
>>> proven the rate be correct on meson8 ... is there any change on this platform we
>>> don't know about ?
>>
>> I tried to force my Khadas VIM2 (GXM) into using MPLL2 by changing
>> meson-gxl.dtsi:
>>         clocks = <&clkc CLKID_ETH>,
>> -                <&clkc CLKID_FCLK_DIV2>,
>> +                <&xtal>,
>>                 <&clkc CLKID_MPLL2>;
>>
>> the resulting clock tree looks fine:
>>     fixed_pll                         4        4        0  2000000000
>>         0 0
>>       mpll2_div                      1        1        0   250000000
>>        0 0
>>          mpll2                       1        1        0   250000000
>>        0 0
>>             c9410000.ethernet#m250_sel       1        1        0
>> 250000000          0 0
>>                c9410000.ethernet#m250_div       1        1        0
>> 250000000          0 0
>>                   c9410000.ethernet#fixed_div2       1        1
>> 0   125000000          0 0
>>                      c9410000.ethernet#rgmii_tx_en       1        1
>>     0   125000000          0 0
>>
>> however, Ethernet is broken (I can't ping anything)
>>
>> @Yixun: according to all public datasheets bit 4 is reserved
>> however, Mike and Kevin were told that bit 4 controls a mux between
>> FCLK_DIV2 and MPLL2
>> could you please clarify the meaning of this bit 4 on:
>> - Meson8b
>> - Meson8m2 (a confirmation that it uses the same Ethernet registers
>> with the same bits/meanings of these as Meson8b would be enough)
>> - GXBB / GXL / GXM (assuming that these are using an identical IP for PRG_ETH0)
>> - AXG
> 
> Indeed, if bit 4 stands for something else, or if some combination are known to
> fail, it would be nice to know.
> 
the bit 4 is acutally a mux which used to choose two clock sources:
  a) fclk_div2  b) MPLL2
(I couldn't check all the SoC generation, but a least I know..)

>>From my point of view, the problem reported by yixun is with the clock
> controller, not this series, which I think should be merged.
> 
feedback from ASIC team, they think the MPLL2 clock source should also
work.. I don't know why it's broken here)-(

> Still, we should clockin of the mac optional so don't have to provide the inputs
> known to fail, if any.
> 
>>
>>
>> Regards
>> Martin
> 
> .
> 
