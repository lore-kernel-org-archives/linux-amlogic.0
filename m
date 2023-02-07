Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDCBC636CC
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPa3c+u3L0gbtohlTQrADa5HeBba81x1AiOdA6Sx+pM=; b=hUl+5KT0EpQErj
	pumxitd0Lrsp3RuifF19WaxnibQoibvXu7PHJZfrSBelAPdI3CWmurzNX6VdEx7mtZ+zlA7nhBkYW
	XEP2JWrIVwM1GWAkfrlZMS4sM+Be9Mqlcqd2jl+9WjLVp/tedeY1tnV0nmCcHmxqsINhuMSOUHPlf
	lJJS8UJ2GXNBXqelz0Bg7M+AI8TPEcwcM2eladQXil6dfWO9SAAFzDWgVWko4LyctMcQ6nGWajkDS
	Yq0crRroNTZyhbBeFbb2q7VfqWcsU4E5r0YzS1OovJ/ub1pZfEegpYkNPE4e+5jCPhbBPZw8mA8Uc
	GHTQ9MMM7qlJaA4/c1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKE7-00BTKC-Fl; Tue, 07 Feb 2023 09:25:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKE3-00BTHi-8d
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 09:25:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so741637wms.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 01:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y23lV7lH3PbjCfdQZUWDq9NFumhrpeHPeQ25oLo9lY=;
        b=rhJpCaong/2Uo1g0AsdV5ZAHpyhC7hZFSLxsh0mqiBcPkpo013pWEqEStTNyyzY03F
         OivEdnW1sNmxH4XgSPBG06JAEYig3bkmxlmvqt88xMFpOU314L+egiYfR9FURo+wqyT5
         yuCu7xwtnVEOnlACkAczxvdhbJdZXKCyVnaQY7syx+QWSOgzHRCS5N0oFbL2TySoOWKU
         w4pf9xh84RtNdaXKFFIpUKdkpxmMgU8w5yVChvDDy/wM0t+jWa2dCABVGwtDx/yeuezj
         nxrhawXmU0MN7nxou1M5v7pLOe6AK9uOo0PsfTpeiez4HAi/ibsDKNWk3G354JNo0LPO
         b0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y23lV7lH3PbjCfdQZUWDq9NFumhrpeHPeQ25oLo9lY=;
        b=MSZC8aQCDUwA2iiuBd58VgUuBAS8uxda4HoABvG4sl+tyxv0Pg8F1EjHsaFHaU8JPw
         VcPnNlILYlnJ8WRT3PVuHiNsCgVDCkSng7gMyJ0pO9yWfpCwvnKnG8pZfA/Zf4XK4osK
         CskjeFl8RNfKnrDIViME9vpJ8baB/DTuwIagxusOaJsuAT/EEdUH2og7FDi02iao/pPg
         9xxgvpxl8OhUnQ/QiW60CiCO1o7dNqqKLSD/0OMxKctG9tV6E2dOIe3xjUERJhO715mL
         qk0WBU5WnS+2YospRZ9i789f8jClLMppJnUqHw7jMm2cEvKR+BHeL8DwZAOMNF6WXYc/
         EcfA==
X-Gm-Message-State: AO0yUKXz1qXuPCFsiG0+5RqUxNWq9UWlpDcDjWGuXfZ3vfn/tpzjdpBK
	P+v4NBHa8xA5PHPy5GBnRLPZmA==
X-Google-Smtp-Source: AK7set+O3eYULAiOA3gTJI4M0T6vipBndxV2LKvLjIoxUkFTxmd/QCTl/UZPlsIgOC1/cDyyNjEDPQ==
X-Received: by 2002:a05:600c:16c8:b0:3db:3e8:feca with SMTP id l8-20020a05600c16c800b003db03e8fecamr1508866wmn.15.1675761917693;
        Tue, 07 Feb 2023 01:25:17 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id e7-20020adfdbc7000000b002425be3c9e2sm9945900wrj.60.2023.02.07.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:25:17 -0800 (PST)
References: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
 <f06d1676-4fce-846d-d8fe-fa68439b119e@linaro.org>
 <84d40502-fe1a-ef61-e945-9c581557f528@gmail.com>
 <1jedrg6mkl.fsf@starbuckisacylon.baylibre.com>
 <CACdvmAhW-uDUK-iL4HT1PgEnRHrBmNr26Q6M=wBYcpZ8=DF4Tg@mail.gmail.com>
 <0bc74947-8522-d924-de21-a1ebb6814364@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, Da Xue <da@lessconfused.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
Date: Tue, 07 Feb 2023 10:18:03 +0100
In-reply-to: <0bc74947-8522-d924-de21-a1ebb6814364@linaro.org>
Message-ID: <1jfsbh3k03.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_012519_549413_698623B0 
X-CRM114-Status: GOOD (  18.34  )
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


On Tue 07 Feb 2023 at 09:22, neil.armstrong@linaro.org wrote:

> On 03/02/2023 09:03, Da Xue wrote:
>> On Fri, Jan 27, 2023 at 10:10 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>>
>>>
>>> On Fri 27 Jan 2023 at 14:02, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>
>>>> On 27.01.2023 08:59, Neil Armstrong wrote:
>>>>> Hi,
>>>>>
>>>>> On 26/01/2023 15:03, Heiner Kallweit wrote:
>>>>>> The usage of edge-triggered interrupts lead to lost interrupts under load,
>>>>>> see [0]. This was confirmed to be fixed by using level-triggered
>>>>>> interrupts.
>>>>>> The report was about SDIO. However, as the host controller is the same
>>>>>> for SD and MMC, apply the change to all mmc controller instances.
>>>>>
>>>>> Thanks, I applied it in for-next so it runs on the CI tests.
>>>>>
>>>>>>
>>>>>> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
>>>>>>
>>>>>> Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
>>>>>
>>>>> I think we should find a better Fixes or perhaps split in 3 so it targets the
>>>>> right commit adding the nodes for each family.
>>>>>
>>>> This would be the cleanest option, right. Practically it shouldn't make
>>>> much of a difference. The chosen commit is from 2019, SDIO interrupt
>>>> support has been added just recently, and regarding MMC/SD it seems no
>>>> problems caused by edge-triggered interrupts are known.
>>>
>>> ... Well, I wonder is this might be linked to instabilities seen with
>>> very high speed mode (such as SDR104) and DDR modes. We have seen quite
>>> a lot of those over the years. In any case, if it helps stabilize the
>>> MMC on amlogic, it would be great if it can be picked up by stable.
>> On S905X, I'm still getting SDR104 failures with this change at both
>> 208MHz and 150MHz so maybe not completely.
>> [    9.071641] mmc1: tuning execution failed: -5
>> [    9.579765] mmc1: tuning execution failed: -5
>> [    9.761580] mmc1: tuning execution failed: -5
>> [    9.871836] mmc1: tuning execution failed: -5
>
> Are these the same before the change ? or did those appear with the change ?

This is a change Da is carrying in his tree.
LePotato is limited to high speed mode @50Mhz in upstream due to
previous instabilities with the SDR modes

The error above shows a systematic failure to find a valid SDR tuning.
It is actually a lot better than an unstable success.

IMO, It's another hint that we need to look at high speed modes again with
this change.

>
>> 
>>>
>>>>
>>>>> If the test doesn't report any breakage, I'll probably ask you that.
>>>>>
>>>> Sure.
>>>>
>>>>> Neil
>>>>>
>>>> Heiner
>>>
>>>
>>> _______________________________________________
>>> linux-amlogic mailing list
>>> linux-amlogic@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
