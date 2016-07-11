From: carlo@caione.org (Carlo Caione)
Date: Tue, 12 Jul 2016 00:52:02 +0200
Subject: [U-Boot] [PATCH v7 0/4] Amlogic Meson GXBaby and ODROID-C2 support
In-Reply-To: <7b67ed3e-59cc-c89c-c6dc-71867884736c@suse.de>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
 <57831945.2040009@suse.de>
 <CALeDE9OM__RZT7Re1+bHn0h41Hku9=k_yj_0hqiW8REjsYx0Uw@mail.gmail.com>
 <20160711194858.GA12930@gmail.com> <5783FE7A.9070400@suse.de>
 <CAOQ7t2ZKB_9w=Z3UNcy99FwCv74V=BMJxDHhjzNEY4TcriLtRw@mail.gmail.com>
 <7b67ed3e-59cc-c89c-c6dc-71867884736c@suse.de>
Message-ID: <CAOQ7t2ZhnZNYXhuzntEvkETOUbX27H5LmuZ9rZtA-b1UjMAZFA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Jul 11, 2016 at 11:38 PM, Andreas F?rber <afaerber@suse.de> wrote:
> Am 11.07.2016 um 22:36 schrieb Carlo Caione:
>> On Mon, Jul 11, 2016 at 10:15 PM, Andreas F?rber <afaerber@suse.de> wrote:

[...]

>>>
>>> DRAM:  2 GiB
>>> No maUsing default environment
>>>
>>> In:    serial at 4c0
>>> Out:   serial at 4c0
>>> Err:   serial at 4c0
>>> Net:   No ethernet found.
>>> =>
>>>
>>> The eth_designware line (twice, if counting "No ma") is due to what Tom
>>> mentioned wrt DM GPIO, I guess.
>>>
>>> Shouldn't we get a version line from SPL, too? A serial driver issue?
>>
>> AFAIKT there is no SPL. U-Boot is loaded by BL3-1 also in the U-Boot
>> shipped by amlogic.
>
> You're right, Hardkernel's version is without SPL, too.
>
> Still I wonder about that "No ma" (after the DRAM line).

drivers/core/lists.c:                   dm_warn("No match for driver
'%s'\n", entry->name);

:)

-- 
Carlo Caione
