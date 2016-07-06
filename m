From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Wed, 6 Jul 2016 08:35:28 +0100
Subject: [PATCH 6/7] meson: clk: Add support for clock gates
In-Reply-To: <146776626852.35356.9847034661606022714@resonance>
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
 <1467741391-60534-7-git-send-email-serveralex@gmail.com>
 <b42e2bb3-2cd0-3115-9be4-16e3a48b46fd@codethink.co.uk>
 <146776626852.35356.9847034661606022714@resonance>
Message-ID: <07f37b8b-cfd2-ebc6-a693-4372d6c34293@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/07/16 01:51, Michael Turquette wrote:
> Hi Ben,
> 
> Quoting Ben Dooks (2016-07-05 11:01:14)
>> On 05/07/16 18:56, Alexander M?ller wrote:
>>> This patch adds support for the meson8b clock gates. Most of
>>> them are disabled by Amlogic U-Boot, but need to be enabled
>>> for ethernet, USB and many other components.
>>>
>>> Signed-off-by: Alexander M?ller <serveralex@gmail.com>
>>> ---
>>
>> This seems to be a lot of structures for clocks that may
>> never be use. I think it would be better to provide a custom
>> lookup function that creates these as needed and use the ID
>> in the dt as a offset+bit id.
> 
> We want the real clocks registered so that we can disable spuriously
> enabled at late_initcall time with clk_disable_unused.
> 
> Furthermore, I'd like to not represent all of these gates in the DT
> binding description (see my response to the earlier patches in this
> series), since it becomes ABI (and a maintenance nightmare).

Erm, so writing /more/ code and having them defined in /two/ places
is a nightmare? Sounds more of a nightmare of having the ID in the DT
represent the register/bit offset and then having them created at
lookup time.




-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
