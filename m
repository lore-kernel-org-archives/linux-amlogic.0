Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71A4C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLEziYOkoHKjd16i6Ad1PPiRpYnqH7XeJQeutxKEuys=; b=t5tiYCK9AMs/o9a6nk13Je9jNZ
	WICeETQ0/JsusvUkGOe+G3DUovs6aIakmpRoUe3O2rOy1iVuEcBwyZ6VrMJGbELZ1fmEAEhqHsfWx
	BGWYEg/Isbos3ZMFzrH6Rw6hSbzqkjnld2X4CJ7XC0x5I+Mho8Tb+ctCr/R2cX8zPRfO5Kr52IEHD
	cz4zxfm2q/BWsOjGGUr02PCxkKRx9ray4+sK/51V0wuXIY4jyqfwif1TMkOv40URGth8O9UZqkgys
	shXRmK6zrw5x8U1TT5D/fdAK+Jx1zOZbbKSDo6sY9W4uCmhPYiadpFZ00UkBZ/1liqTaePeEVo7AB
	e3riHiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgokm-00BVse-27;
	Mon, 27 Mar 2023 15:27:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgoki-00BVq7-2q
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 15:27:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id q7-20020a05600c46c700b003ef6e809574so2289003wmo.4
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679930837;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VtoOLUcx0RtI++il9gKXOiFlcs2YJzPL6aI9QEiwN7M=;
        b=rto0BBdHjfDWk46+Hc5b3f7tvwon9q4CRFKAhVaM7edNB2tPiEk28qkrbKJXsmqvlb
         7XH74pzMNlrCbD9Pf0J1fNxCFalbQV1ENjLc/2SekzpAwE2DdC7f0/srzwslGfxN4fvN
         wBEM0TWsNeucBhaVmPwHOqutx9HV70JjSprmyoxCeTuavqSmpr14oYOa/L78HK+nyL22
         k9XCOHNPzOtuXMUOHk8u2rPlJwZZmnoDHYZBXklvNd1rhao+C8DnWq5921E1b48qX8wd
         yejizkSmjyiyk41JjwfsJbwFKYnjLJSiqH59m3r3+f37im4gTRHAGM4VMyUAslR2H0z6
         cpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679930837;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtoOLUcx0RtI++il9gKXOiFlcs2YJzPL6aI9QEiwN7M=;
        b=yJc20ablWQnfYIuL9dD+dioFnCV8Vg4cwNrcrC8pyHzHgjKUes6lpU6yncesaocsE9
         rcownThrlJrdZfEiIDfSH8jfLXF7RPckKEDEq+1ldaok9No9S8zgUdHXQALGRu24Mp41
         G7a//dIravlAtOFCrdDIahICtNIwUTRU0ULYR+RYMToMFVu0gCFko2m4K6SjoGIF/JDb
         1dtCv+7sa5OKhMPWhPjrk4EwhXP26ACHITUOr7y3x7438fgD+TTlV9cJXxd8N0XzdvG8
         MST1MEBC1HQRtUE+4FznbvWRZ7E5zfEHyA8YzjHoT3znrhgHPLJS1A0bLiPulxge+r4f
         sZrg==
X-Gm-Message-State: AO0yUKWFYm++S7pV7khDWLW3Wef2qQnHh/OkIHJJRWj9z2CQXBqgz85t
	e8pfnx14PjrJ5NBYVJ++Bzinlw==
X-Google-Smtp-Source: AK7set9XtuFTk2GMZHZ2rkL2ed780yDEDnCBR2s3+/9B2p7B1cn2Vq5mV+q3vrL+yjMl0ZJZP672Uw==
X-Received: by 2002:a7b:c448:0:b0:3ef:294c:de50 with SMTP id l8-20020a7bc448000000b003ef294cde50mr9639626wmi.29.1679930837686;
        Mon, 27 Mar 2023 08:27:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2? ([2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c4f1200b003ef67848a21sm7337200wmq.13.2023.03.27.08.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 08:27:17 -0700 (PDT)
Message-ID: <c728df98-82f6-0f2c-e4d9-416f3bb358d0@linaro.org>
Date: Mon, 27 Mar 2023 17:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] perf/amlogic: adjust register offsets
Content-Language: en-US
To: Will Deacon <will@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Jiucheng Xu <jiucheng.xu@amlogic.com>, Pierre-Hugues Husson <phh@phh.me>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Rutland <mark.rutland@arm.com>
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
 <20230327120932.2158389-4-mgonzalez@freebox.fr>
 <f0432ff5-7e73-1e7e-1745-6f3b679153fe@linaro.org>
 <20230327151216.GA32275@willie-the-truck>
Organization: Linaro Developer Services
In-Reply-To: <20230327151216.GA32275@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_082720_996504_CDCF30B1 
X-CRM114-Status: GOOD (  13.40  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/03/2023 17:12, Will Deacon wrote:
> On Mon, Mar 27, 2023 at 04:17:29PM +0200, Neil Armstrong wrote:
>> On 27/03/2023 14:09, Marc Gonzalez wrote:
>>> Commit "perf/amlogic: resolve conflict between canvas & pmu"
>>> changed the base address.
>>>
>>> Fixes: 2016e2113d35 ("perf/amlogic: Add support for Amlogic meson G12 SoC DDR PMU driver")
>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>> ---
>>>    drivers/perf/amlogic/meson_g12_ddr_pmu.c | 34 +++++++++++++++++-----------------
>>>    1 file changed, 17 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/perf/amlogic/meson_g12_ddr_pmu.c b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
>>> index a78fdb15e26c2..8b643888d5036 100644
>>> --- a/drivers/perf/amlogic/meson_g12_ddr_pmu.c
>>> +++ b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
>>> @@ -21,23 +21,23 @@
>>>    #define DMC_QOS_IRQ		BIT(30)
>>>    /* DMC bandwidth monitor register address offset */
>>> -#define DMC_MON_G12_CTRL0		(0x20  << 2)
>>> -#define DMC_MON_G12_CTRL1		(0x21  << 2)
>>> -#define DMC_MON_G12_CTRL2		(0x22  << 2)
>>> -#define DMC_MON_G12_CTRL3		(0x23  << 2)
>>> -#define DMC_MON_G12_CTRL4		(0x24  << 2)
>>> -#define DMC_MON_G12_CTRL5		(0x25  << 2)
>>> -#define DMC_MON_G12_CTRL6		(0x26  << 2)
>>> -#define DMC_MON_G12_CTRL7		(0x27  << 2)
>>> -#define DMC_MON_G12_CTRL8		(0x28  << 2)
>>> -
>>> -#define DMC_MON_G12_ALL_REQ_CNT		(0x29  << 2)
>>> -#define DMC_MON_G12_ALL_GRANT_CNT	(0x2a  << 2)
>>> -#define DMC_MON_G12_ONE_GRANT_CNT	(0x2b  << 2)
>>> -#define DMC_MON_G12_SEC_GRANT_CNT	(0x2c  << 2)
>>> -#define DMC_MON_G12_THD_GRANT_CNT	(0x2d  << 2)
>>> -#define DMC_MON_G12_FOR_GRANT_CNT	(0x2e  << 2)
>>> -#define DMC_MON_G12_TIMER		(0x2f  << 2)
>>> +#define DMC_MON_G12_CTRL0		(0x0  << 2)
>>> +#define DMC_MON_G12_CTRL1		(0x1  << 2)
>>> +#define DMC_MON_G12_CTRL2		(0x2  << 2)
>>> +#define DMC_MON_G12_CTRL3		(0x3  << 2)
>>> +#define DMC_MON_G12_CTRL4		(0x4  << 2)
>>> +#define DMC_MON_G12_CTRL5		(0x5  << 2)
>>> +#define DMC_MON_G12_CTRL6		(0x6  << 2)
>>> +#define DMC_MON_G12_CTRL7		(0x7  << 2)
>>> +#define DMC_MON_G12_CTRL8		(0x8  << 2)
>>> +
>>> +#define DMC_MON_G12_ALL_REQ_CNT		(0x9  << 2)
>>> +#define DMC_MON_G12_ALL_GRANT_CNT	(0xa  << 2)
>>> +#define DMC_MON_G12_ONE_GRANT_CNT	(0xb  << 2)
>>> +#define DMC_MON_G12_SEC_GRANT_CNT	(0xc  << 2)
>>> +#define DMC_MON_G12_THD_GRANT_CNT	(0xd  << 2)
>>> +#define DMC_MON_G12_FOR_GRANT_CNT	(0xe  << 2)
>>> +#define DMC_MON_G12_TIMER		(0xf  << 2)
>>>    /* Each bit represent a axi line */
>>>    PMU_FORMAT_ATTR(event, "config:0-7");
>>
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Will, I've applied DT patches 1 & 2, can you apply this one via your fixes tree for v6.3 ?
> 
> If you're sending the DT patches as fixes, you may as well just take this
> driver change at the same time with my ack:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Does that work for you?

Perfect ! Thx I'll pick it with the DT patches.

Thanks,
Neil

> 
> Will


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
