From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 10 May 2018 01:02:32 +0200
Subject: [PATCH 3/6] ARM: meson: add support for the Meson8m2 SoCs
In-Reply-To: <7hy3gsxxxp.fsf@baylibre.com>
References: <20180506092119.467-1-martin.blumenstingl@googlemail.com>
 <20180506092119.467-4-martin.blumenstingl@googlemail.com>
 <7hy3gsxxxp.fsf@baylibre.com>
Message-ID: <CAFBinCCCo_8TnaYqVrUe7zZbzmA7yEF6=vuqT1K0ZdWuSc4vSg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Kevin,

On Thu, May 10, 2018 at 12:32 AM, Kevin Hilman <khilman@baylibre.com> wrote:
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
>> Add a new Kconfig entry as well as the newly introduced compatible
>> string for the Meson8m2 SoC.
>> The Kconfig entry selects the same drivers as Meson8b because Meson8m2
>> SoC is mostly compatible with Meson8 (both share the same pinctrl
>> driver, so they also share the same GPIO IRQ settings. also the same
>> Meson6 timer is used on Meson8m2).
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> ---
>>  arch/arm/mach-meson/Kconfig | 7 +++++++
>>  arch/arm/mach-meson/meson.c | 1 +
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/arch/arm/mach-meson/Kconfig b/arch/arm/mach-meson/Kconfig
>> index d90f61e6254f..44a489889bc1 100644
>> --- a/arch/arm/mach-meson/Kconfig
>> +++ b/arch/arm/mach-meson/Kconfig
>> @@ -32,4 +32,11 @@ config MACH_MESON8B
>>       select COMMON_CLK_MESON8B
>>       select MESON_IRQ_GPIO
>>
>> +config MACH_MESON8M2
>> +     bool "Amlogic Meson8m2 SoCs support"
>> +     default ARCH_MESON
>> +     select MESON6_TIMER
>> +     select COMMON_CLK_MESON8B
>> +     select MESON_IRQ_GPIO
>
> I'd prefer to stop the proliferation of identical Kconfigs which are
> only used to select which DTB files to compile.
>
> Instead, can you drop this new Kconfig as well as MACH_MESON8, and just
> make all the meson8* DTBs build based on MACH_MESON8?
>
> I think it better to have fewer Kconfigs. The only cost is building a
> couple extra DTBs.
sure, no problem - I'll re-send patches 3-6 in the next few days with this fixes


Regards
Martin
