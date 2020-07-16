Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3152DC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 08:35:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E97212067D
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 08:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HuRjSMNh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SksTmGnL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E97212067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HGobwc8meIVEylxTcTLaX3l0aDCXlMUgi+8HmN9lryM=; b=HuRjSMNhYE57jlROEp7wmTwZt
	NcTQXxaqG4AuMcJW5DH8JKjOgINjTv9ItntD2ah6n9jat3dwPIESPikr1LFGisnWZRNMXt9CxiPE7
	Kr+SEJBcd4MSbe1pp+d+zlL4EoHmzkW3ZAj+0L1adGl+nwt1riYkiN/xq1CuUf7sLDT5wFs0NpkEn
	l73T4LirXZV6m2U94DoIO3VXKsPVXcADI5a3HH5uWFAozHOcW+L61bVYRK+/7jJDzcxMBzkc5HDP/
	l4jT/qQIE7rU6gQbxNyTqSooQ8LVK+g13qsfVzx6GbhEY3aIxGdsioJ23ULgV21d8Cbnldcv3kx+i
	5ajYU5UUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvzMS-000869-Tp; Thu, 16 Jul 2020 08:35:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvzMP-00085H-Rp
 for linux-amlogic@lists.infradead.org; Thu, 16 Jul 2020 08:35:22 +0000
Received: by mail-wr1-x444.google.com with SMTP id z13so6129135wrw.5
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Jul 2020 01:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g9tInc8WAwgb2fltQstKt7OODeMNIe5ubcIW/8rewQU=;
 b=SksTmGnL7jz5Q3FxpBoKJsvTXyRharbixFCiChPt33feD7qDxqXFskXUSZp+Da6D5i
 eu9aeQqeWVfIg5zfH3TaA6VG0eY15bzq97adKH8imFnqMvMR3eEbgXCzan1i8BQ+7Ntm
 cytlfKZclQyyEE8J8IIMxLYdJBLbkpUJm6nRuwMzAOe27SV5nV+Bcm9eIned+xSZzMda
 btJGu78QeQi92Pv0POTmVOCoODm9H9h/SKvetqzhIM9KemVxHscbYbc0fW2ir782nBBo
 gOAqxDQtpbAAEjTHn/uh08djW+Ut5g89cXOoQavgDKXrERaBWGV+i59fbVhQwsXNbMzM
 7Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=g9tInc8WAwgb2fltQstKt7OODeMNIe5ubcIW/8rewQU=;
 b=GMOa/IVABy88IsUrsKmmIrqYtxoeAHdC5CktL9Yl7noinn35YZOxkA2yJctSMu+yWi
 oPpQ+b18Im+0OAvPMlXLorWzCzfWqsDzBONyxFtRSeTh2cKLzrRUeib7FejyEJGRuDrl
 Wu5CQMPT04sf0Vh7SE+vFfsqODK5vCif/7I0/ODEciiF35PtvUDjkJDuF8imH9J2GuI1
 BX/24XfjwNf85rH8NhYeK5NDHmR2nx3/PW+Z4fH6UqdHEh9nYNvStPrblzffSobCDDF2
 NueIxh9YpPqDOnVwJz2o6sCb+R+6kY6V1OHMn5SUzXYmL+llzDg369UEqdjeilkDEpM0
 ehMA==
X-Gm-Message-State: AOAM530nvzjuyGjlOWEkotaeRFwVq8YgjXrRpEMwPu7HnDxDev0zZq9T
 wHwHKaughWpip/9+IF3pU1Swsg==
X-Google-Smtp-Source: ABdhPJwpoZMhW16XpajJxvEatzAbmJ4MjFZNH3PJ2Va6iRmftJ62oB1QXabHDuVj3Dcbu+bApA3FtQ==
X-Received: by 2002:adf:e811:: with SMTP id o17mr4164857wrm.53.1594888520686; 
 Thu, 16 Jul 2020 01:35:20 -0700 (PDT)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w128sm8325501wmb.19.2020.07.16.01.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2020 01:35:20 -0700 (PDT)
Subject: Re: [PATCHv1 0/3] Enable RTC on Odroid N2
From: Neil Armstrong <narmstrong@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>
References: <20200715160209.652-1-linux.amoon@gmail.com>
 <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com>
 <CANAwSgRXLUqqSqnguV2pgPdumMi8i6T9rh6hNQ0Y03mv_j7V-g@mail.gmail.com>
 <91fbbe36-d839-d864-7666-5483cc643a5e@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <a7e9b154-ceb2-3915-454a-a53c9b65622e@baylibre.com>
Date: Thu, 16 Jul 2020 10:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <91fbbe36-d839-d864-7666-5483cc643a5e@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_043521_936599_8CBAB905 
X-CRM114-Status: GOOD (  19.67  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 16/07/2020 10:20, Neil Armstrong wrote:
> Hi,
> 
> On 16/07/2020 10:14, Anand Moon wrote:
>> Hi Neil,
>>
>> Thanks for your review comments.
>>
>> On Thu, 16 Jul 2020 at 12:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>
>>> Hi Anand,
>>>
>>> Only the vrtc is able to wakeup the device from suspend,
>>> the external RTC is not capable.
>>>
>>> Neil
>>
>> Now I have two RTC driver registered
>>
>> $ dmesg | grep rtc
>> [    4.737315] rtc-pcf8563 0-0051: registered as rtc0
>> [    4.738763] rtc-pcf8563 0-0051: setting system clock to
>> 2020-07-16T08:00:46 UTC (1594886446)
>> [    4.790206] meson-vrtc ff8000a8.rtc: registered as rtc1
>>
>> And there are two nodes
>> # ls /dev/rtc*
>> /dev/rtc  /dev/rtc0  /dev/rtc1
>>
>> So it seames an issue that /dev/rtc0 is not able to handle wakeup events.
>> How can we resolve this issue?
>>
>> # time rtcwake -s 30 -m mem
>> rtcwake: /dev/rtc0 not enabled for wakeup events
> 
> rtcwake -d /dev/rtc1 -s 30 -m mem
> 
> As Christian reported off-list, it may be necessary to keep the vrtc as rtc0,
> so you should add aliases in the odroid-n2 DT to have vrtc as rtc0 and the on-board
> rtc as rtc1, but it may break the hwclock tools, so the reverse may be better
> but you'll need to specify rtc1 to rtcwake.

While looking closer to the Odroid-N2 schematics and U-Boot/SCP Firmware, the external on-board
RTC can wake the device with the GPIO_AO 7, and wakeup is enabled in:
https://github.com/hardkernel/u-boot/blob/odroidn2-v2015.01/board/hardkernel/odroidn2/firmware/scp_task/pwr_ctrl.c#L143

So, something must be missing.

Neil

> 
> Neil
> 
>>
>> real    0m0.002s
>> user    0m0.001s
>> sys     0m0.002s
>>
>> -Anand
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
