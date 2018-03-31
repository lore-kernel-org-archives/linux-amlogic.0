From: sjg@chromium.org (Simon Glass)
Date: Sat, 31 Mar 2018 16:44:09 +0800
Subject: [PATCH 3/4] clk: add Amlogic meson clock driver
In-Reply-To: <5695d6af-fbb3-fc16-9a6a-fbd360e4e4f0@suse.de>
References: <20171203091713.22029-1-b.galvani@gmail.com>
 <20171203091713.22029-4-b.galvani@gmail.com>
 <0f77c1b8-845c-9190-5550-a115bad9c926@baylibre.com>
 <CAPnjgZ176Z7gjh=zvpzFvWEp=XrA6jML4UmgxSzc_WfDqyOJbw@mail.gmail.com>
 <37e9510f-8150-9c4e-e3b9-3938d637c650@baylibre.com>
 <CAPnjgZ0Mf6A2KxSDHcaT2wASOYCfxgh9x=8Y5y2+eSpY-Ws+yQ@mail.gmail.com>
 <5695d6af-fbb3-fc16-9a6a-fbd360e4e4f0@suse.de>
Message-ID: <CAPnjgZ2AdzpR+VcM53UY6Rf7CZJ36P3_2Kht8Mfao-=rUa8Wkg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Andreas,

On 30 March 2018 at 22:27, Andreas F?rber <afaerber@suse.de> wrote:
> Hi guys,
>
> Am 30.03.2018 um 10:41 schrieb Simon Glass:
>> On 30 March 2018 at 15:53, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>> On 30/03/2018 00:41, Simon Glass wrote:
>>>> On 29 March 2018 at 16:42, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>> On 03/12/2017 10:17, Beniamino Galvani wrote:
>>>>>> +
>>>>>> +     gate = &gates[clk->id];
>>>>>> +
>>>>>> +     if (gate->reg == 0)
>>>>>> +             return -ENOENT;
>>>>>
>>>>> Same here -ENOSYS
>>>
>>> Here thsi means it's not a gate.
>>
>> Yes, but the driver still supports the operation. The problem is that
>> its inputs are invalid. So use -ENOENT to mean that.
>
> Isn't that the definition of -EINVAL?

We tend to use that to indicate a failure to read the DT config.

I should probably not have said 'invalid'. The input value is
reasonable (it isn't -ve, for example) but the selected item does not
exist.

Regards,
Simon
