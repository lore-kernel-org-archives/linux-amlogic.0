Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6E7C64ED9
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7Y2p6n9+1pih9yj32ls/ZO89eZkmYAoubLd32tbfwA=; b=cBL3xoDzjKu0Ph
	sq89PFkiVzVoQa4HuzurUx6VcgJyPnV13685ULzJ4+hmrHbwG7Idbxlm0bK8ZWP3eWAxdaHTcNKw+
	PMb9U9uDuFjQWd/Hagqr4bBbcR+vq2md+qCAB2ljlvt6t7lKpfVVJ2/9E9JJE/tunHher6uRjTdui
	7zRHpba2d1aa2Wungu1s0usaTiFJqReTpUTxyuTwrC/8hqSVHI2fNphmSFKClmStqNl8Bkp453Ok/
	FIGwheSlwuEo71xY9LoaJCX8XHXGcGOJWbVOXZUUNUZH6Sd3Dt3coUKqwV3ZfA2Lp9pB3FUHd6Yja
	Rn9MxJ672QnJyZCJRv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWkbj-00BEuP-3u; Mon, 27 Feb 2023 21:00:27 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWkbR-00BEpA-R9; Mon, 27 Feb 2023 21:00:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id d30so31240945eda.4;
        Mon, 27 Feb 2023 13:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3QWyBtUKTsnmjo+LKjmdels1q2qAxKzuieSdjre2UE=;
        b=XAyF6rkDUDvQodh7Z6CzV6tThrbYQVBI2vsMDLO4x19xFzH9HqWOjHLNfBael4c9kV
         zKnINzI/rHq7+GG1jpAo+sufP+MgmVgJY8InHfNHYsCpSQXstsCPSw8xVL3Nx6XrusRg
         Z4iWG7jHgg2ScncKEcrOk02g16PXopktVRrXOq1r5Fh3erg6CnUqo1PRNNBsb1heMW8S
         r3Q5zS+9j5kvP62HW7PJP5nCmMuso6zWgeQs2GRIoT2jnpSXHE5AXuV5Q1L6f2E7Clc5
         X3y32jkaW4iA/wUBNSKgcfxJ9t4EGeqj/m+0WYmxab/PwIeD86zifL8/7AfcFNsRbgGE
         yv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3QWyBtUKTsnmjo+LKjmdels1q2qAxKzuieSdjre2UE=;
        b=HWYSU9abmHDnqVsIEuM3UEDA0qCm+hQRrAovJy9/4CkjYnwnN7P8xjyX2EUlQCduZZ
         CAJtLuzjbeMQVJpCSX/oGENt2D9mrWKONiFk19FFWZ9veCfZdcDETmqo49iSKg63vaPs
         DjEBjeHdYcX5ziKCEjeavrlosf3Y5gCKjcCAId3ItF/a7w6835XFEcSkAH4qQjdb5GSS
         D0ARk3AgL+ZQIdcncLDsJD57tk4l0X66/4rjKcc/i/lg7A2Gjt+G5WW0itiWdhA2JSIp
         rvxelS5OJ7AXxy87YuIFyNRruoTWN3lgV0IvNTKqu/Aw8enqd4/J0oNSQuov6/j2xdli
         yzhg==
X-Gm-Message-State: AO0yUKXY8Bq6kl9ssJ6PDnQafR2gbf/gXK5LmmhCca1mP4kPrVo7g0qZ
	68XgJ1kWZ84GL0B41UQDzr4=
X-Google-Smtp-Source: AK7set+0l20UFQZRLE8Q8U+epbrYk3c8xr2NdD8+uzgN35NQeQPmM82G+srNgdwmEgumNOofJrmmrw==
X-Received: by 2002:a05:6402:1048:b0:4af:59fa:2a20 with SMTP id e8-20020a056402104800b004af59fa2a20mr1028464edu.15.1677531601709;
        Mon, 27 Feb 2023 13:00:01 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9e4:5300:7c04:7bb8:89f1:77e7? (dynamic-2a01-0c23-b9e4-5300-7c04-7bb8-89f1-77e7.c23.pool.telefonica.de. [2a01:c23:b9e4:5300:7c04:7bb8:89f1:77e7])
        by smtp.googlemail.com with ESMTPSA id p3-20020a50cd83000000b004acba0afaa3sm3529702edi.21.2023.02.27.13.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 13:00:01 -0800 (PST)
Message-ID: <df82a381-4c50-fecf-cca6-d8a40ab9bfa1@gmail.com>
Date: Mon, 27 Feb 2023 21:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] mmc: core: add helpers
 mmc_regulator_set_ocr_vmmc_up/off
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
References: <02b46550-e0b5-4251-8156-56eb0f690d89@gmail.com>
 <2553f3bc-b1e6-4af2-fb6c-def486dd99a3@gmail.com>
 <CAPDyKFpCEzubkJ=roniomXHaWrY5AOqfPZmNLbMbBnubHzZrEg@mail.gmail.com>
 <0725e5eb-43fd-65a7-27e8-84bbfe31c798@gmail.com>
 <CAPDyKFouH_uxF_p7ke_WAwwuQxp=O3qitC7iXHU7n1MGN1Nhmw@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAPDyKFouH_uxF_p7ke_WAwwuQxp=O3qitC7iXHU7n1MGN1Nhmw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_130009_913756_00661BBA 
X-CRM114-Status: GOOD (  24.70  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27.02.2023 17:13, Ulf Hansson wrote:
> On Fri, 17 Feb 2023 at 21:09, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 17.02.2023 11:47, Ulf Hansson wrote:
>>> On Wed, 15 Feb 2023 at 21:14, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>>
>>>> A lot of drivers use this code, therefore let's factor it out to
>>>> helpers.
>>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>> ---
>>>>  include/linux/mmc/host.h | 17 +++++++++++++++++
>>>>  1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
>>>> index 812e6b583..f93fb8c7d 100644
>>>> --- a/include/linux/mmc/host.h
>>>> +++ b/include/linux/mmc/host.h
>>>> @@ -597,6 +597,23 @@ static inline int mmc_regulator_set_vqmmc(struct mmc_host *mmc,
>>>>  }
>>>>  #endif
>>>>
>>>> +static inline int mmc_regulator_set_ocr_vmmc_up(struct mmc_host *mmc,
>>>> +                                               struct mmc_ios *ios)
>>>> +{
>>>> +       if (IS_ERR(mmc->supply.vmmc))
>>>> +               return 0;
>>>
>>> Rather than adding these two new helper functions, how about adding
>>> the similar check in mmc_regulator_set_ocr() instead?
>>>
>> There's a number of drivers having 3 paths here:
>> 1. IS_ERR() is true -> do nothing and go one
>> 2. mmc_regulator_set_ocr() returns 0 -> some action and go on
>> 3. mmc_regulator_set_ocr() returns an error -> bail out
> 
> Right, thanks for pointing this out.
> 
> The important point I am trying to make is that the mmc core is
> treating "mmc->supply.vmmc" as optional (see
> mmc_regulator_get_supply()). To be consistent with that behaviour, I
> think it would make sense to bail out and return 0, in
> mmc_regulator_set_ocr() "if (IS_ERR(mmc->supply.vmmc))". We don't need
> a new set of helper functions to do that.
> 
You're right. I'll submit a patch for it.

>>
>> So the question is: what should mmc_regulator_set_ocr_vmmc_up return
>> if IS_ERR() is true:
>> 1. An errno? Then this errno would have to be different from the
>>    error codes the function can normally return.
>> 2. A positive value? Seems to be the best option
>>
>> Then we could write:
>>
>> ret = mmc_regulator_set_ocr()
>> if (ret < 0)
>>         return ret;
>> if (!ret) {
>>         some_action();
>> }
>> ...
>>
>> Works but I'm not sure whether it's very intuitive.
>>
>> The other benefit of the proposed helpers is that they hide the
>> complexity of using mmc->supply.vmmc and ios->vdd.
>>
>> Mileage may vary here. Do you have any preference?
> 
> Actually, there is no complexity. Drivers should always be able to
> pass 'ios->vdd' to mmc_regulator_set_ocr() (as it holds the correct
> value).
> 
> For some reasons, some driver authors seem to find it clearer (I
> guess) to call mmc_regulator_set_ocr() with an explicit '0' at
> MMC_POWER_OFF, but it isn't needed (see mmc_power_off()).
> 
> [...]
> 
> Kind regards
> Uffe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
