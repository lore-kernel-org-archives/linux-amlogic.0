From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 13 May 2016 18:07:52 +0200
Subject: [PATCH 1/2] mmc: Add Amlogic Meson driver
In-Reply-To: <CAOQ7t2Y6zoYfD88-tSCS78=zON-nr8FbU1nOkoDQz3a1FnTy5Q@mail.gmail.com>
 (Carlo Caione's message of "Fri, 13 May 2016 15:53:35 +0200")
References: <1463056902-8533-1-git-send-email-carlo@caione.org>
 <1463056902-8533-2-git-send-email-carlo@caione.org>
 <m2lh3e2hrb.fsf@baylibre.com>
 <CAOQ7t2Y6zoYfD88-tSCS78=zON-nr8FbU1nOkoDQz3a1FnTy5Q@mail.gmail.com>
Message-ID: <m2d1oq2b6v.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Carlo Caione <carlo@caione.org> writes:

> On Fri, May 13, 2016 at 3:46 PM, Kevin Hilman <khilman@baylibre.com> wrote:
>> Carlo Caione <carlo@caione.org> writes:
>>
>>> From: Carlo Caione <carlo@endlessm.com>
>>>
>>> This is a port / rewrite of the Amlogic driver shipped whithin the
>>> Amlogic SDK for the Meson GXBaby (S905) SoC.
>>>
>>> Signed-off-by: Carlo Caione <carlo@endlessm.com>
>>
>> [...]
>>
>>> +static const struct udevice_id meson_mmc_match[] = {
>>> +     { .compatible = "amlogic,meson-mmc" },
>>> +     { /* sentinel */ }
>>
>> IIUC, this controller is different between meson8* and gxbb.  If that's
>> the case, this compatible should probably be more specific.
>
> Yes, this is a point I raised also on lkml when I submitted the MMC
> driver for the Meson8b.
> Since the registers mapping is different I assume that this is the
> case. Just to be sure, given that you are the only one with a
> datasheet for the GXBB, can you confirm that?

I took a quick look and just compared the register layouts between s805
and s905 and indeed they are quite different.

Kevin
