From: sjg@chromium.org (Simon Glass)
Date: Sat, 25 Nov 2017 15:34:21 -0700
Subject: [PATCH v2 0/5] Add support for Amlogic GXL Based SBCs
In-Reply-To: <5A193C7A.8030400@baylibre.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
 <5A193C7A.8030400@baylibre.com>
Message-ID: <CAPnjgZ0H_+sE5CdUVALuKZd31UEAkbXTe_E8Q7M8EBbbFV-DOA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

On 25 November 2017 at 02:48, Neil Armstrong <narmstrong@baylibre.com> wrote:
> Hi Tom, Simon,
>
> Le 22/11/2017 14:25, Neil Armstrong a ?crit :
>> This patchset aimed to add minimal support for the following Amlogic GXL SoC
>> based board:
>> - LibreTech-CC
>> - Khadas VIM
>>
>> The initial support is composed of :
>> - Minimal boot support with serial, MMC, Ethernet and SDCard
>> - Updated DTS from Linux 4.13.8
>>
>> Commands to generate a valid binary are provided in the board README.
>>
>> A common Ethernet init function is introduced to avoid duplicating
>> the same hardware init code.
>>
>> The P212 and Odroid-C2 board are also converted to this common function
>> by this patchset.
>>
>> The following work will be pushed later on :
>> - Support for dynamic reading of DDR memory size from registers
>> - USB DWC3 Host Support with PHY support
>
>
> I'll try to address Simon's comments, but is it still possible
> to have this merged for v2018.01 ?
>
> For the next release cycle, I'll try to add a proper clock driver
> and have a look to binman for sure.

>From my side this seems fine.

Regards,
Simon
