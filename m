From: crow@linux.org.ba (crow)
Date: Thu, 15 Jun 2017 14:36:14 +0200
Subject: [PATCH] mmc: meson-gx: work around broken SDIO with certain WiFi
 chips
In-Reply-To: <CAFBinCBOS7mDja3EdfNViCqzuk_=ur0bQOG+6ZeL-xFQZM7+Ug@mail.gmail.com>
References: <dd12ffc8-e2a4-53bd-caa5-83bb7cbcd5e5@gmail.com>
 <CAFBinCDUNCgwm9YS9w8uQ6i1MX4SR1ZHf-mn8UnObnejjZiQOw@mail.gmail.com>
 <e0844236-ba11-3256-c388-ce2405c3b7b8@gmail.com>
 <CAFBinCBOS7mDja3EdfNViCqzuk_=ur0bQOG+6ZeL-xFQZM7+Ug@mail.gmail.com>
Message-ID: <CAG_g8w5Bk1OKNsvC7WAJbfozZxqgmmF6LbmYe+6aH_ZQFrjTdA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

On Sun, Jun 11, 2017 at 10:31 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> On Sat, Jun 10, 2017 at 1:34 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> Am 10.06.2017 um 00:06 schrieb Martin Blumenstingl:
>>> Hi Heiner,
>>>
>>> thanks for finding a solution (it didn't even take you long)!
>>>
>>> On Thu, Jun 8, 2017 at 8:43 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>> There have been reports about SDIO failing with certain WiFi chips in
>>>> descriptor chain mode. SD / eMMC are working fine.
>>>>
>>>> So let's fall back to bounce buffer mode for command SD_IO_RW_EXTENDED.
>>>> This was reported to fix this error.
>>>>
>>>> Fixes: 79ed05e329c3 "mmc: meson-gx: add support for descriptor chain mode"
>>>> Cc: <stable@vger.kernel.org> # 4.12.x
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>>
>>>> ---
>>>>  drivers/mmc/host/meson-gx-mmc.c | 9 +++++++++
>>>>  1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
>>>> index 1842ed34..4cdbe3c0 100644
>>>> --- a/drivers/mmc/host/meson-gx-mmc.c
>>>> +++ b/drivers/mmc/host/meson-gx-mmc.c
>>>> @@ -210,6 +210,15 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>>>>         int i;
>>>>         bool use_desc_chain_mode = true;
>>>>
>>>> +       /*
>>>> +        * Broken SDIO with AP6335-based WiFi on Khadas VIM Pro has been
>>> nit-pick: Khadas VIM Pro uses an Ampak AP6255 (not AP6335)
>>>
>> Uups, I obviously mixed up the device with one of the S905-based tv boxes.
>> Will fix it.
>>
>>>> +        * reported. For some strange reason this occurs in descriptor
>>>> +        * chain mode only. So let's fall back to bounce buffer mode
>>>> +        * for command SD_IO_RW_EXTENDED.
>>>> +        */
>>>> +       if (mrq->cmd->opcode == SD_IO_RW_EXTENDED)
>>>> +               return;
>>>> +
>>>>         for_each_sg(data->sg, sg, data->sg_len, i)
>>>>                 /* check for 8 byte alignment */
>>>>                 if (sg->offset & 7) {
>>>> --
>>>> 2.13.0
>>>>
>>> for the record: wireless performance with this patch applied is excellent
>>>
>> Just curious:
>> Do you also experience the lagging mentioned by crow?
> I just made a quick ping test:
>
> Khadas VIM Pro (AP6255, directly connected to my 802.11ac wifi AP):
> 30 packets transmitted, 30 received, 0% packet loss, time 29057ms
> rtt min/avg/max/mdev = 2.263/13.614/20.336/4.583 ms

Well that are nice value. My were much worse until I did chang my AP
(but only issue I have had was with Khadas VIM, thus never suspected
it is AP problem, notebook ping was just fine)

before AP change:
ssh router (AP) ping khadas vim with ArchLinuxArm mainline 4.12-rc5
with SDIO patch test 5GHz
30 packets transmitted, 29 packets received, 3% packet loss
round-trip min/avg/max = 177.542/791.630/1376.008 ms

ssh router (AP) ping ping notebook
30 packets transmitted, 30 packets received, 0% packet loss
round-trip min/avg/max = 1.523/1.907/3.687 ms


After router (AP) change to Archer C7 (AP) with LEDE:

ssh to router (AP) ping khadas vim with android nougat 5GHz
30 packets transmitted, 30 packets received, 0% packet loss
round-trip min/avg/max = 2.721/107.992/224.975 ms

ssh to router (AP) ping khadas vim with ArchLinuxArm 5GHz
30 packets transmitted, 30 packets received, 0% packet loss
round-trip min/avg/max = 31.109/130.086/227.538 ms

ssh to router (AP) ping notebook 5GHz
30 packets transmitted, 30 packets received, 0% packet loss
round-trip min/avg/max = 0.987/1.622/4.589 ms

ping notebook -> khadas vim which are connected to same router (AP):
Minimum = 10ms, Maximum = 611ms, Mittelwert = 149ms

ping khadas vim -> notebook which are connected to same router (AP):
30 packets transmitted, 30 received, 0% packet loss, time 29045ms
rtt min/avg/max/mdev = 6.889/15.296/23.906/4.942 ms


> on my workstation (connected via ethernet to a router running LEDE,
> which is also connected via wifi to my 802.11ac wifi AP):
> 30 packets transmitted, 30 received, 0% packet loss, time 29040ms
> rtt min/avg/max/mdev = 1.040/1.405/5.977/0.862 ms
>
> (distance between my Khadas VIM Pro and my AP vs the router running
> LEDE vs my AP is roughly the same, less than 50cm difference in
> distance, no additional walls etc.)

My Khadas VIM Pro and the Notebook are both on one the same table,
distance between them and  AP (Archer C7 router with LADE, was Netgear
WNDR 3700v2 with OpenWRT) is maybe 1,5m.

> so the delay is definitely "higher" than with other devices, but an
> average pin time of ~14ms still doesn't seem to cause any lags for me

As you can see before changing the router (AP) the average ping time
was 791ms (from router (AP) to device) and there was a huge lag (but
did not measure from notebook -> khadas vim), and after changing to
new router (AP) I get "only" 107ms with Android and 130ms with
ArchLinuxArm kernel 4.12-rc5 from router (AP).

And between notebook -> khadas vim only 149ms, other way around khadas
vim -> notebook only 15ms.

And now I don't have any input lag. Seems it was false positive :(.

Regards,
