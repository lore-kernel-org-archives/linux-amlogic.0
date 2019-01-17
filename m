Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4601C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 21:04:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5E920851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 21:04:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BwJiT0UI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="A2IkTug7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E5E920851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nKRuh/S5plvi2sCOLANnVnJGrrEtk++EEsV862/CMBs=; b=BwJiT0UIaqzNI3
	dcd2tUG2sCTjPfma0/cFDCGi7KeAfPE3LPRWeN1FhZteeP9AhLsE7N1ka1rlHg9oHzj1bc3fsqsFR
	Mt57ASdDhWy1/E7l/4/6RYVLXK6NaC7Ar43b9Qnmc4NpVc4GHaYABZ5IlE3288PPtywhv+z1quvir
	5W6QiDffzUYOr/lYIfVOjznLScdzQYufgJvMpOCP03p0PnwPiVYoVzBGkM0SERSTDT5mFWLQfjosn
	sVO5VzYRm84yThKDZAiY6sG0Z9b9ciOsXhlW/Oq6uFSlKJxgCs5K/xaSsqggl0x7lyz6j9cwPud+v
	YCYxhz5HU/6eiIEhRLXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkEpi-0007tD-NH; Thu, 17 Jan 2019 21:04:14 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkEpf-0007rp-HC
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 21:04:13 +0000
Received: by mail-pl1-x643.google.com with SMTP id 101so5286531pld.6
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 13:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Fptx6C7hghkDPI4ABVf4d5Tzlh9B6pi/H8yrCIC/nR4=;
 b=A2IkTug7yS2JGtAuGs2e0PJEvZSrCC4aekC6ZOqtQD9AJnYuh7f260b/ui1ZfeJN/Z
 07fc93f1YviP0YGQ4987DRNnk7ktP02Ys/wBjuIp75Q85UasEa5RodITN3NqT8Tgs+dW
 34cWJ8Wgao/aBZqnQG8Z+QsZ6nzO67dKkbw+r61ki6UbrfyoaG9XoLfI9leWt13Med2z
 2X0PxhEuBQKHJGedEWYAFQCXd+RP8N6CHBAVSfdFUoU5mnsSkhFyINIQtDJjW7O0UJYy
 Za/XDJINirfxaECjvFwXdGFgFdV1bZz+xRxo/pBM2hnPJGSWyStt9C8ZOrDJUGJcLtdw
 Xeiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Fptx6C7hghkDPI4ABVf4d5Tzlh9B6pi/H8yrCIC/nR4=;
 b=gOEyVZtozdA8UiEZJ7f0wpzP1QSAMB722Pkr/3t5k0VcvauXDBVsjIXJFXTAywADb3
 Y04FE+GTp4Oj//4+NNFbhhqjCERnMGPDX15DdCG+NMOjRZ/oLOU2qZD2i0+tb2EChtvD
 q/RUU63PJqvlxS1zqDcFFRBBv8ZqP3qfOFi2/lyVgcGyN3Fd4iSGKt96nWbjQ9oeydGC
 JjVdSfAyDh/WnBRmcVY5Sy+E94bQxjHMepwPmgASVNjKGNh9VFuJNNg9VQVAxy+P+z8u
 7a3LQdr3+GqAdKtMA/FaTrIRKKx01YJ9Jv8fwfmrOEFJSC1WYrspsYLsz3YXYUGUdiLx
 mN/w==
X-Gm-Message-State: AJcUukf6jPKSxxaebg/vENmyBVCckMjOxbQPW4b0yQtRZ6KY0zmlRLhC
 O1guV9f3uDXmfeX9Hl7bd0GwQg==
X-Google-Smtp-Source: ALg8bN7t+7Sazg4wXwLvnjHHdtk61Jb3n7YCXgo/JIC4M/OCZY64SZsv7kACECouFMGigTLcsdQk4A==
X-Received: by 2002:a17:902:2887:: with SMTP id
 f7mr16105467plb.176.1547759050567; 
 Thu, 17 Jan 2019 13:04:10 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:e076:9fe9:59e2:1e0b])
 by smtp.googlemail.com with ESMTPSA id x28sm9017036pge.66.2019.01.17.13.04.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 13:04:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/6] ARM: dts: meson: chip temperature (hwmon) support
In-Reply-To: <CAFBinCDfbHgCEyieqageo7mxqSAxb6Hp+m7asDoR=FuK=UD8Jw@mail.gmail.com>
References: <20190112130649.23838-1-martin.blumenstingl@googlemail.com>
 <7hk1j3av3x.fsf@baylibre.com>
 <CAFBinCDfbHgCEyieqageo7mxqSAxb6Hp+m7asDoR=FuK=UD8Jw@mail.gmail.com>
Date: Thu, 17 Jan 2019 13:04:09 -0800
Message-ID: <7ha7jzatdi.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_130411_569058_CFC15F02 
X-CRM114-Status: GOOD (  11.55  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Kevin,
>
> On Thu, Jan 17, 2019 at 9:26 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>
>> > Now that the Meson SAR ADC driver can get the chip temperature on
>> > Meson8, Meson8b and Meson8m2 (see [0]) we can add the missing bits to
>> > the .dts{,i} and enable iio-hwmon for all boards where this could be
>> > tested successfully.
>> >
>> > This was successfully tested on multiple boards:
>> > - Meson8b Odroid-C1 (me)
>> > - Meson8b EC-100 (me)
>> > - Meson8m2 M8S (not upstream yet, me)
>> > - Meson8m2 MXIII-Plus (an earlier version of this series, Oleg Ivanov)
>> >
>> > compile-time dependencies:
>> > - none
>>
>> This seems to depend on your HHI series, which I held off on last cycle
>> and you said you were planning to resend.
> ouch, indeed
>
> is it OK for you if I re-send this series with the HHI patch included
> here - or do you want to have it separately?

Feel free to include it.

Thanks,

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
