Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7ABEC433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 08:14:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 727AC2070E
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 08:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AMsHgVJ6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3uytgrv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 727AC2070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QkcJ9MyRS+jL0MwxJfM4jPZqxv3Xa6qNM1WmM9RRBXs=; b=AMsHgVJ68GjfLcKEzO1ejXnZm
	QdWiZMmtza+6hrl36rGWpPFngYqfII3SGoP5Vw3X/Jri53/WjsD9PpvEl+1Q9RlLaRArATtq0Lefu
	tR1WTZPcrxBQD6aSHhT5z9qWKVGHdzZkej5CUXCkzC0aQptYZ5wWH+seyC8/b3BXm56x1PJ2LDeBW
	SvFwjINKYnq6bosF4nt6BweufrvmzzXG98Pke9LBOk0hqoWMEG3TVnmL4xi/ZsHZJs34xyvDrdNxl
	n2d9dpuR/fqSUSP9PI1GEnQz4PSFlY8f5/HWGZhHgQG4sfGH/PLT0LJxFXFq3qOY+Fp5wqlEXNb0G
	nYB/Qf3/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvz2M-0004o0-Gh; Thu, 16 Jul 2020 08:14:38 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvz2H-0004lm-DI; Thu, 16 Jul 2020 08:14:34 +0000
Received: by mail-il1-x12d.google.com with SMTP id e18so4301815ilr.7;
 Thu, 16 Jul 2020 01:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sb202bnMpR2L+FueL+OZRlSFJ9ClUCwQhcovgXlWEIE=;
 b=c3uytgrv60iea+g2Iy4az5CXHfYXhnKOMxcitOEDiE2mxPDdoGj5tlEocEAT8JPnFp
 8vZ6+ZpayANkGzGHcM3CNJePrfcN/8/KI+ycb2XEe3Cs6dgZ3SA51aQmNC/ySOziE4IG
 onCp5UAww7qXdyLat6PO1ctpxGJHAup9gfm7/jfVFwAUqDVirCUvs0bIcV1xVU9XBH6U
 nckI25Qa7Vnr0+3cr1+0GWO6Ks8bJB9KvmBMfFG047nApTky13RdvtGnKnqXNLEqyywu
 8fC4JgWBm4Krw7uNr+aKsbbDvWxTm5t9ZUWdQ2Cg2Bhw1z46swTYStUmobxQbZnva3+l
 sg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sb202bnMpR2L+FueL+OZRlSFJ9ClUCwQhcovgXlWEIE=;
 b=ONoSaSTUkSGmnCUAVYVrkfzdBPS11D4AGefarqFJIMtVIJUpLr4wND3B++oGYMz+ME
 CqSgk56IwWNAeszZFSyNp+U5pes8ovv7wyWKxAFAy+gv1TwcSx8bFeUYztO8UIEHzsdb
 npv8XOmgRAQECHTyXblQnT57xpBsCrbbVVA1PFecZhMCwL2vvRdrQ/fbXyQQAeRFcPdt
 e7Ml5SQXpgA4KA89Gl05EMcegyyJZ571MYHq5hCUQGWycAidhf6G8Nk4rMkzWLLjk57S
 7KQKvletc5CMVdZVF8k9QjZsvcP24xBwedVLQSyzUM1E+QiCTfwHFQHttbRt0zfMH62M
 P2Yw==
X-Gm-Message-State: AOAM530SdwPgOrDHktUJuBqdUFLOR/HZtxBj5GrfBS1ejfXwoUOlbG9h
 pVjdMeCa4v41q7IW+VkkcemoTzxs/tvpujfRD84=
X-Google-Smtp-Source: ABdhPJx70BD/CO0Vg0/CK048ltr5UHKj/YXBwSS65IPYtXx9dkPIK4ydIyOWjTTlEOG5K0KawrCFDvV9iFR6l8mAYf8=
X-Received: by 2002:a92:4810:: with SMTP id v16mr3470348ila.75.1594887271665; 
 Thu, 16 Jul 2020 01:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200715160209.652-1-linux.amoon@gmail.com>
 <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com>
In-Reply-To: <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 16 Jul 2020 13:44:21 +0530
Message-ID: <CANAwSgRXLUqqSqnguV2pgPdumMi8i6T9rh6hNQ0Y03mv_j7V-g@mail.gmail.com>
Subject: Re: [PATCHv1 0/3] Enable RTC on Odroid N2
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_041433_541912_0DDB5C1C 
X-CRM114-Status: GOOD (  10.15  )
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

Hi Neil,

Thanks for your review comments.

On Thu, 16 Jul 2020 at 12:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Anand,
>
> Only the vrtc is able to wakeup the device from suspend,
> the external RTC is not capable.
>
> Neil

Now I have two RTC driver registered

$ dmesg | grep rtc
[    4.737315] rtc-pcf8563 0-0051: registered as rtc0
[    4.738763] rtc-pcf8563 0-0051: setting system clock to
2020-07-16T08:00:46 UTC (1594886446)
[    4.790206] meson-vrtc ff8000a8.rtc: registered as rtc1

And there are two nodes
# ls /dev/rtc*
/dev/rtc  /dev/rtc0  /dev/rtc1

So it seames an issue that /dev/rtc0 is not able to handle wakeup events.
How can we resolve this issue?

# time rtcwake -s 30 -m mem
rtcwake: /dev/rtc0 not enabled for wakeup events

real    0m0.002s
user    0m0.001s
sys     0m0.002s

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
