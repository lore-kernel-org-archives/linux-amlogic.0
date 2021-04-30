Return-Path: <SRS0=khaH=J3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7812C433ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 08:03:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0484061186
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 08:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0484061186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8twCnVTpPrEgILNv6OJN8X5e/xjYq1KB/nF4MUT9rjc=; b=dj68PvqsU679e4BE1FwkdOvuM
	KsdL6jEJMxYYGIJaiB8wAFBfkRhZTKBWOagAeoMULUbwRuTQwXSlIadphXqiO4Uamxwt8sEpITESy
	keslodGtSl1kVWhdIegwzugy/As9UdM+3OJnkm9D/o3sq1FRa5LrNxCgjZRJkDHDrQKcYEBsmf+KN
	+fhl94V7mOse7SXdQjM81ki3axJdsi0gF0bRHe6y2WvXoFtjqATBj5rabqabBDmmfOdqaPxzykfM8
	1TdAiQtu5ysrYKTotks/VBw4SKQSUepMwrE+n7Z2OrMmQFL9Vgvyho6rbHgksNcGHLFRnfe9U6eZ0
	NeucoLSIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcO76-007Td6-QH; Fri, 30 Apr 2021 08:03:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO74-007Td1-TG
 for linux-amlogic@desiato.infradead.org; Fri, 30 Apr 2021 08:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gEXOq4bTfcSUdUpLFcNhC6eN04AyrduIgQ9uuxLC6OQ=; b=V2nf04QlAhZ6rw2CnjXFZz2gFH
 0UEP7phGJDsDznmmWb35FymCNvG/P7/ndOLmgpYEytoPDzp85/RdMgmiuM8PCBkz8Eq/3W25u0sav
 jU25UDtg4BiusPTumwkfLcAmSdtP/ThAxu++iHNf9HnmHZqSSIabXJ132R8orVvUyOEGvE5aDP4pN
 oKjs2KWpJHr17Om9qWdUUVr9mYGDlLgzbmlSQm674bPaMh/4n98pXksoJeMAd7GfsOy6kAhE8vj+L
 CAAROg+4lnsJkurgY9Qmw6zjJ7o2g2bL1j2g5T6qM6hH9wg66h2C5CkK8fz2xfw5KVMZAH2zs3lhn
 621a+dGQ==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO71-001Dkl-NN
 for linux-amlogic@lists.infradead.org; Fri, 30 Apr 2021 08:03:01 +0000
Received: by mail-ej1-x635.google.com with SMTP id u17so104007615ejk.2
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Apr 2021 01:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=gEXOq4bTfcSUdUpLFcNhC6eN04AyrduIgQ9uuxLC6OQ=;
 b=CyLMRHNZPKD5a43+OjCNpQu0X+iMse+Mr2s56g3TR5iXy+jXFzudjJpE2fTY4RhNBj
 4V8hEHqAG7ZxzBoVsDu4/+iassEyaCRU+seGci3cHCaPgMa7O1v9riFc45YLhEzJ2VLs
 qWKOrXNo3xeXuo8CDVK5AQWFvHgggovEvtvxZrLztYPbJG8tkcZTYNYlpgwHyjSkSPBZ
 lbu9SRDRXQqGvEKSHcr3qbsVzwQdqGr6CV4kfMIMcOR7un+52eImiIMbSDR4dngbdH+6
 +ih3cdClm3/L/I/Nt0KRkGBhKQovaluwXwzYoE6z58qK5mgRHdROcwNWLG+HAEzNSMR0
 c7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=gEXOq4bTfcSUdUpLFcNhC6eN04AyrduIgQ9uuxLC6OQ=;
 b=G4/5kUvLPbx97ZmFhb2v5URTvxlpGGwTBPlW98Q5oXA3QEGTCD9Wm/gb7sHHPd/5rm
 gBkt2Es8eIuCGPDHWR3r0zeXY4Gnr6TiGD8BleWX5i6ka0rQp9x9CJdpd3OHadegBFC4
 X6OYwnyml5skchYKp+o3fMZTtU8piB8G96qTfgqgE+7TdHLsM8/RSOtUs9DzlyLDZcP3
 dzhxeTNg1Nm+b8TyPnArdtlYgbh1oN2tBGydoHi0TeDBdIfgRQBXdvEuccRb8CnVsPi2
 NiOAkRoRgg3ZQGU2f9WM7txxectI6uh+PcaNqhXWHzr6W5YlmidK/Cplc3CYDMLrqnyw
 1l1w==
X-Gm-Message-State: AOAM530T79eIkNsDz6gSwApwXufkHdq/ldZ6l+486E4dtg31GNG6GlCH
 1ilwvCvAfUSpbKwvoNdtqm2tUg==
X-Google-Smtp-Source: ABdhPJwWRSCUbw6PZjmgVFMqTWKuf9gCMZIlgo3uw/ckGNvacB1VpAMS8tzpBCnM3QlRu6BINi1NpQ==
X-Received: by 2002:a17:906:a20b:: with SMTP id
 r11mr2884072ejy.323.1619769777683; 
 Fri, 30 Apr 2021 01:02:57 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id x20sm666852edd.58.2021.04.30.01.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 01:02:57 -0700 (PDT)
References: <20210429090516.61085-1-jbrunet@baylibre.com>
 <CAFBinCCcKHqd7Mh3bV9NyyWzi=96pCWxzSZBOjg5Puy9wOuihQ@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: axg-audio: do not print error on defer
In-reply-to: <CAFBinCCcKHqd7Mh3bV9NyyWzi=96pCWxzSZBOjg5Puy9wOuihQ@mail.gmail.com>
Message-ID: <1jlf909p3j.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 30 Apr 2021 10:02:56 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_010259_828834_3B721596 
X-CRM114-Status: GOOD (  13.82  )
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


On Thu 29 Apr 2021 at 22:49, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Thu, Apr 29, 2021 at 11:06 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [...]
>> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
>> index 7c8d02164443..5e501eff0840 100644
>> --- a/drivers/clk/meson/axg-audio.c
>> +++ b/drivers/clk/meson/axg-audio.c
>> @@ -1811,7 +1811,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>>
>>         ret = device_reset(dev);
>>         if (ret) {
>> -               dev_err(dev, "failed to reset device\n");
>> +               if (ret != -EPROBE_DEFER)
>> +                       dev_err(dev, "failed to reset device\n");
> many drivers are switching to dev_err_probe nowadays
> According to it's documentation:
>   In case of -EPROBE_DEFER it sets also defer probe reason, which can be
>   checked later by reading devices_deferred debugfs attribute.
>
> so I think it makes sense to use dev_err_probe here as well

Old habits ;) thanks for pointing this out. Will do

>
>
> Best regards,
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
