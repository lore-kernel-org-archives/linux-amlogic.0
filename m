Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8E5C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 19:19:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA412075F
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 19:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QdEJtFJP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Jq7zAcZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FA412075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpOxVu42I5JdXSQoFsHRj96ZrUd7SgraFmRH7RhzSo0=; b=QdEJtFJPdPaJkxbaay/rYJnXhe
	m4Q2xIniMp8cgAz4fbCzuSo6en/3pNiVgvGCm/bWu4gQiL8E4LYDXk1avnmJ3KaZRbXiLfl3sTi5u
	z3UEITsAuqcqcBTn0j00jddKHV5NWEMog+QkYiKlnhjLKhRx8r02kBXvKMkdRn7b37oBB2fLzNp6q
	Mk9w410X3e2ATrNLtCfVwUIwUNHUrXwZ7Cbo8X608hI76c0qT9kmNJJTM8mWjKoW7y66SeTJCZMNO
	p+vlivsk60MFles7SNSeAdNropefkjkaBzTBGnV6I6SaXHaPFrfCHL5Db7K/UF5RVFP95psueIfAX
	Xq5vh1xQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0rbz-00055V-6l; Wed, 29 Jul 2020 19:19:35 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0rbx-00054m-B5
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 19:19:34 +0000
Received: by mail-wm1-x343.google.com with SMTP id g8so3702298wmk.3
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2020 12:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=kyNgLg2bDls+bf/5jo3N2hZO1/znTry1pPqYBT3gZ5A=;
 b=Jq7zAcZJMgqLuc/ygQFZ8PI7IMVC4mz9y1n/K7I1j7uDwi4nZYfkhdE3188x4UvbOm
 4FWC8PMKEFnAM7uXSmmkkqGY+8rJAo/acRbf3PSoS3bqpt45demr8tjiJYypWffzQwPy
 vOIQAN2a0RcFKEjnRxU4Pq2rvC/aMI6hWK7B4y2AVr5XxcwvlGoS0biJc6F/4RyXFn+F
 Icu/pGNuYD4RUPPl3E0z93ZVnQQl946F5GLAN/mt5ZSZ85s+7AUZMFHVqj+kNZvHxWHB
 z+OR7cBfCGAJA2lFZ3dc88/DPghf7D8u1zYkEECxbBfj6l+bBl4QhM8eWp5pX20W/iZJ
 Jg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=kyNgLg2bDls+bf/5jo3N2hZO1/znTry1pPqYBT3gZ5A=;
 b=MXfbzz8CR3G3BtU0YITKruDneJJTaNeVX5JDUJUo8QBRoSIUqYQd44WCvBRbhTfNd2
 1w9MECF9/LBW2k/7h5wPZOB7pTm/PUtry6n+P0Mm690z1AVdDjnn2CO4p6KWHrsXuptZ
 h+oGWceTdZp6bQRmBucqnzGZjr5cvOeylB7CpHsu+c5X5Me4sM25BMl8ZVvxGQolYpya
 CVfAX3pfbf6UhaJC2Ccbx/F5gFxKf/PC6iPPP8lg1P/gCWubUQE+thphTlan4nAkDcn6
 YE82727NzoA7Dp/798fmy+DZBTpQYUEAHgghxHqCw5DBhz7m7qh4D8rRzhs14KnsfXR9
 85mw==
X-Gm-Message-State: AOAM530KufZNCDDQtOqjh8o6QCTY+PWddgvcFFC9THJcRl7VxRjBnqGH
 MRzLdef6r+G2qKz4Rl10HB4qWDyu0AYZBg==
X-Google-Smtp-Source: ABdhPJx/bfWuDIOFnXL1r/NQH41L6HmXnbX7+JgS/qMbN9BDTe5k5vRcubXTMkf4T3YeNxwezSuBLw==
X-Received: by 2002:a1c:2e10:: with SMTP id u16mr10667042wmu.121.1596050371999; 
 Wed, 29 Jul 2020 12:19:31 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x204sm14690272wmg.2.2020.07.29.12.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 12:19:31 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: dts: meson: odroid-n2: update sound card
In-Reply-To: <40a224cf-20ea-f76c-d3a1-679a897ce46a@baylibre.com>
References: <20200701094556.194498-1-jbrunet@baylibre.com>
 <40a224cf-20ea-f76c-d3a1-679a897ce46a@baylibre.com>
Date: Wed, 29 Jul 2020 12:19:28 -0700
Message-ID: <7hv9i62kov.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_151933_532590_9CB93DDD 
X-CRM114-Status: GOOD (  10.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 01/07/2020 11:45, Jerome Brunet wrote:
>> This patchset adds the support for the TDM loopback and audio on the jack
>> output using the internal codec.
>> 
>> Jerome Brunet (2):
>>   arm64: dts: meson: odroid-n2: enable audio loopback
>>   arm64: dts: meson: odroid-n2: add jack audio output support
>> 
>>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 136 +++++++++++++++++-
>>  1 file changed, 131 insertions(+), 5 deletions(-)
>> 
>
> Kevin, seems you forgot these 2 patches
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Oops, yes I did.  Thanks for the reminder.  Will queue these for v5.9,

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
