From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 15 Feb 2017 21:55:18 +0100
Subject: [PATCH 00/18] mmc: meson-gx: code and performance improvements
In-Reply-To: <m2efyz6xp6.fsf@baylibre.com>
References: <74c3a06c-d972-1e70-fb22-744df8ef31d9@gmail.com>
 <m2efyz6xp6.fsf@baylibre.com>
Message-ID: <ac165497-3df9-46f6-13bd-ee225693aa4b@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Am 15.02.2017 um 20:49 schrieb Kevin Hilman:
> Hi Heiner,
> 
> Heiner Kallweit <hkallweit1@gmail.com> writes:
> 
>> This patch series includes several improvements and boosted the
>> read performance from 13 MB/s to 32 MB/s (at 60MHz clock rate)
>> on a Odroid C2 with a 128GB eMMC module.
>>
>> Higher frequencies needed tuning in my case. With some hacked
>> test tuning I reached 52 MB/s at 200MHz.
>> With a 8GB card 200MHz were stable out of the box, but with
>> less performacne.
> 
> Thanks for the series and improvements.  I'm not very familiar with MMC,
> so I've been hoping someone would come along and improve this driver.  I
> really appreciate it.
> 
> There are a few comments I've made on individual patches in the series.
> 
> It will probably be helpful to the MMC maintainers if you separate the
> series into:
> 
> - cleanups (non-functional changes)
> - fixes: things that fix actual bugs (not sure there are any in this
>   series)
> 
> followed by a series that does the functional changes.
> 
Thanks for the review comments and indeed, the patches should be re-ordered.

> Also, can I recommend that you use git-format-patch and git-send-email
> to export and email your patches?  If you use git-send-email, all of the
> individual patches will be sent as a reply to the cover-letter, making
> the threading work better and generally make readers/reviewers happier.
> 
Uups, obviously something went wrong. The patch series was supposed to
be threaded together. I'll check ..

> Thanks again for the great work,
> 
> Kevin
> 
>> Heiner Kallweit (18):
>>   mmc: meson-gx: set segment host parameters
>>   mmc: meson-gx: remove code for unsupported CMD23
>>   mmc: meson-gx: explicitely call stop command for multi-block commands only
>>   mmc: meson-gx: improve meson_mmc_start_cmd
>>   mmc: meson-gx: eliminate struct sd_emmc_data
>>   mmc: meson-gx: simplify bounce buffer setting in meson_mmc_start_cmd
>>   mmc: meson-gx: check return value of sg_copy_[from,to]_buffer
>>   mmc: meson-gx: make two functions return void
>>   mmc: meson-gx: change interrupt name
>>   mmc: meson-gx: remove unused members irq, ocr_mask from struct meson_host
>>   mmc: meson-gx: remove unneeded variable in meson_mmc_clk_init
>>   mmc: meson-gx: remove member parent_mux from struct meson_host
>>   mmc: meson-gx: remove unneeded meson_mmc_clk_set in meson_mmc_clk_init
>>   mmc: meson-gx: remove unneeded devm_kstrdup in meson_mmc_clk_init
>>   mmc: meson-gx: improve initial configuration
>>   mmc: meson-gx: improve response reading and sending stop command
>>   mmc: meson-gx: remove member mrq from struct meson_host
>>   mmc: meson-gx: move handling of one case from threaded handler to main irq
>>
>>  drivers/mmc/host/meson-gx-mmc.c | 241 ++++++++++++++++------------------------
>>  1 file changed, 97 insertions(+), 144 deletions(-)
> 
