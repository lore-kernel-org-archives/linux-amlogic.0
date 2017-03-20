From: ulf.hansson@linaro.org (Ulf Hansson)
Date: Mon, 20 Mar 2017 18:56:03 +0100
Subject: [PATCH 1/4] mmc: pwrseq: add op reset to struct mmc_pwrseq_ops
In-Reply-To: <ac5f62eb-64c6-b66f-24cc-b6ae74a01697@gmail.com>
References: <75ad5eac-412b-fe73-ff53-3d8b975937e4@gmail.com>
 <c75c3e5c-c4e1-3f2f-267b-1c781052c55e@gmail.com>
 <CAPDyKFr6_Y3cSv5Q1WRSQBo7_bsyeVVQTYBQ01gykdMpVWNtXw@mail.gmail.com>
 <ac5f62eb-64c6-b66f-24cc-b6ae74a01697@gmail.com>
Message-ID: <CAPDyKFrhfteb8Nx2Tzi__VgmQrsWbvjAVnFmAPTOBtHohLXiUA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

[...]

>>> @@ -166,6 +166,7 @@ int mmc_wait_for_cmd(struct mmc_host *host, struct mmc_command *cmd,
>>>                 int retries);
>>>
>>>  int mmc_hw_reset(struct mmc_host *host);
>>> +void mmc_hw_reset_pwrseq(struct mmc_host *host);
>>
>> Don't you think we can make this transparent to mmc host drivers,
>> instead of them having to assign their host_ops->hw_reset() callback
>> to this new API? Because I guess that's the though!?
>>
>> In principle the mmc core already have all the information it needs,
>> as to understand when the eMMC pwrseq should be invoked. Or perhaps
>> the code may become a bit too messy for that?
>>
> The easiest way I could think of:
> If host->ops->hw_reset is NULL overwrite it with pwrseq->ops->reset
> in mmc_add_host. But host->ops is defined es being const, so the compiler
> won't allow us to do this. Of course we could do some casting but usually
> I try to avoid hacks like casting away const qualifiers.

No thanks. :-)

[...]

Kind regards
Uffe
