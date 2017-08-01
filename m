From: shawn.lin@rock-chips.com (Shawn Lin)
Date: Tue, 1 Aug 2017 08:38:16 +0800
Subject: mmc: UHS Voltage switch and operating frequency question
In-Reply-To: <1501518004.2759.5.camel@baylibre.com>
References: <1501518004.2759.5.camel@baylibre.com>
Message-ID: <03c65837-6d3c-c822-f505-838e90f34295@rock-chips.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org


On 2017/8/1 0:20, Jerome Brunet wrote:
> Hi Ulf,
> 
> I am working on adding signal voltage switch callback to the meson mmc driver.
> While testing, I noticed that a few cards fail to exit the busy state after the
> voltage switch.
> 
> After tinkering with the driver a bit, I noticed that increasing the clock
> frequency from 400kHz to 1MHz solve the problem. Strange, isn't it ?

AFAICT, most of the internal circuit of card is running against the
input clock from host. So if you increase your clock, cards will finish
thier logic switch faster. Note that the spec does state that 400KHz is
the max freq for indentification mode. But the fact is that almost all
cards could accept higher frequecncy.

For you issue, please try to hack mmc_set_uhs_voltage to increase the
delay there to see if that could solve your problem.

> 
> I'm don't know MMC that much but is it possible that some card require a minimum
> operating frequency to enter UHS mode ?
> 

We shoule never give a hypothesis beyond the scope of spec.


> The simplified spec (Part 1 - Physical Layer) says that before CMD11, we should
> have had CMD41 (Init Command) . After CMD41, the card should be operating at
> Default Speed or SDR12.
> 
> I believe that in both case, the frequency is "up to 25Mhz" ? This would be the
> maximum, but is there a minimum ? 400kHz seems pretty low compared to 25Mhz ...
> 

400KHz is good for work unless your IP has limitation for that.

> I hope you will able to shed light on this :)
> 
> Best Regards
> jerome
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo at vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
