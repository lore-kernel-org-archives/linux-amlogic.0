From: ulf.hansson@linaro.org (Ulf Hansson)
Date: Mon, 20 Mar 2017 19:02:26 +0100
Subject: [PATCH 1/4] mmc: pwrseq: add op reset to struct mmc_pwrseq_ops
In-Reply-To: <d029f887-4fd3-1319-fd01-a99ea9ede5c1@gmail.com>
References: <75ad5eac-412b-fe73-ff53-3d8b975937e4@gmail.com>
 <c75c3e5c-c4e1-3f2f-267b-1c781052c55e@gmail.com>
 <CAPDyKFr6_Y3cSv5Q1WRSQBo7_bsyeVVQTYBQ01gykdMpVWNtXw@mail.gmail.com>
 <ac5f62eb-64c6-b66f-24cc-b6ae74a01697@gmail.com>
 <d029f887-4fd3-1319-fd01-a99ea9ede5c1@gmail.com>
Message-ID: <CAPDyKFpuAgFnoAFymZeiPiCQcXATkz6KCEm8Wr_j4hD+nrtGuQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

[...]

>>
> Other alternative:
>
> typedef void (*hw_reset_t)(struct mmc_host *host);
>
> hw_reset_t mmc_get_hw_reset(struct mmc_host *host)
> {
>        struct mmc_pwrseq *p = host->pwrseq;
>
>        if (host->ops->hw_reset)
>                return host->ops->hw_reset;
>        else if (p && p->ops->reset)
>                return p->ops->reset;
>        else
>                return NULL;
> }
>
> And then use what mmc_get_hw_reset returns instead of using
> host->ops->hw_reset directly.
>
> How do you like this one?

Well, I would just rather do these checks and call the correct
callback in mmc_reset(). There is no need to invent a function
returning a function pointer when we call it directly instead.

Additionally, I wonder whether it could make sense to allow both
callbacks to co-exist and then call both. This would give the mmc host
some options for doing some internal reset as well, while the pwrseq
could handle the actual GPIO pin.

What do you think?

Kind regards
Uffe

>
>>>>  void mmc_set_data_timeout(struct mmc_data *data, const struct mmc_card *card);
>>>>
>>>>  #endif /* LINUX_MMC_CORE_H */
>>>> --
>>>> 2.11.0
>>>>
>>>>
>>>
>>> Kind regards
>>> Uffe
>>>
>>
>
