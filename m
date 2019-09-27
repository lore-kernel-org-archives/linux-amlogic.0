Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3ABC4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 16:39:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DCB2207E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 16:39:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aD9NBIuv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vlJH88ij"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DCB2207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Znu0xoSbIqIIvfb2hFeDgONRdiBgPLngUX5MDzUT9fE=; b=aD9NBIuv7vHLgj0Co0ZMgIBsje
	2RrtL0s2bjBoHPUrIWPUOpk/3U7D1TyTPg2ARDzI+lLZPQJ9KayLIRKWCksGwB4VEXFTAo/d48aY2
	y+p/VjwOwU08em2zmlUt/X6hrUrs++bgmyZkTcbsq1ee8P9TAa/VtvzWXjNH7uyW8qya/rEKMvL8n
	mFkORQyahm610/4QHSJPwnzy4y9CXmM5ZNUJ2qY6NOXVw5o1DkxW2hTNT4jquLa7I/egWepl11fw5
	wkZf/RmojuXzwn2UecO9CXygHDo3VqVnVnhg7vN0Mjd2oHwHbDYUkJluRHHBJoNU1o/V5ZodKsQ4J
	rj3fGa/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDtGp-0002Wc-MQ; Fri, 27 Sep 2019 16:39:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDtGb-0002M5-Eq
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 16:38:51 +0000
Received: by mail-wr1-x443.google.com with SMTP id i18so3862275wru.11
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 09:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=H9qpcAXROEOSHATHIODGl5R6XLJmU3Nit6aFPlUl9PY=;
 b=vlJH88ijYnpukf4ZiGFC3tgXvxD1NRCykGaXRu7yCbSTKpcKP3ety0gptHFmz1x+9A
 R/Zij0mk9nhPfjOY+LKUIwqed8VuCJy6QuPiI87ofhmDeo6H6oLRNVsZ5zE71JbcpYs7
 uc7+vzjvAFtQ712pTxhRUUUTQcZwPb4HlY/iTEal88bUJii40H23wDmbW1J9zCSWVHGO
 4dLbPL+BvvZoXBrCGsugMVLtvI/uFbz+gafElcBGJnTW7LkFpuxjK4NBrzMpXkDvwg/i
 zRdsMSnPa1NibDmYOg/w0WIKy76RjgF1OahTmnNR5MoE/6qCzo8Gl5LJSwGSRso85PN5
 DL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=H9qpcAXROEOSHATHIODGl5R6XLJmU3Nit6aFPlUl9PY=;
 b=jH4uHoVzwbPgIqIldPIOvaQx4JJxz4TA0XUZNaWWaVM8i+3SzAH/NYD7VmXtyw3vCN
 g+ls6g30QBSqPpyLX0sRcDfs3rj5+2alTib1mnc+cwirtwzvFoiuarPELDVILmWj0DZV
 iCIGpbDFe4n0TATQQ9d9Hur8GovZM/SGSLgOZ0yzzJkq3z80gJcOLoVKsFSvVXJFZGq1
 0cexkuPoEPT4NE/I82KQLL1MfgecW+MEFzeiJE9N41TTjFR5I7k29Z3I8ydSdxDx3GRg
 +ZwpU9MP18J7XeAu+gw/X7/jMDbSFVTnCydogD0Rr/Fwyyelra85Edf9MRd4+lJvTsJT
 51Eg==
X-Gm-Message-State: APjAAAU2mnNUv2TAzV++ryz9lBVswv3J9QCP6TKTiOxY+cXo74E+CcWW
 C4u40UW0rVPb8ivCpiy/ZArREg==
X-Google-Smtp-Source: APXvYqyOToIhXgMB3p4wq1eYwswK4+ABcMmXeNT+QmoldWbGpxe9NmpO0SA2ZuMkhyc8J4VZ7vGPAw==
X-Received: by 2002:adf:f547:: with SMTP id j7mr3872939wrp.119.1569602327457; 
 Fri, 27 Sep 2019 09:38:47 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j1sm6587771wrg.24.2019.09.27.09.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 09:38:46 -0700 (PDT)
References: <20190919102518.25126-1-narmstrong@baylibre.com>
 <20190919102518.25126-2-narmstrong@baylibre.com>
 <20190927001425.DFDC7207FF@mail.kernel.org>
 <8486dec0-8aea-ea39-2a52-7347a01c5c40@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RFC 1/2] clk: introduce clk_invalidate_rate()
In-reply-to: <8486dec0-8aea-ea39-2a52-7347a01c5c40@baylibre.com>
Date: Fri, 27 Sep 2019 18:38:45 +0200
Message-ID: <1jef011yp6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_093849_545869_909FA88D 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: linux-amlogic@lists.infradead.org, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 27 Sep 2019 at 08:40, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 27/09/2019 02:14, Stephen Boyd wrote:
>> Quoting Neil Armstrong (2019-09-19 03:25:17)
>>> This introduces the clk_invalidate_rate() call used to recalculate the
>>> rate and parent tree of a particular clock if it's known that the
>>> underlying registers set has been altered by the firmware, like from
>>> a suspend/resume handler running in trusted cpu mode.
>>>
>>> The call refreshes the actual parent and when changed, instructs CCF
>>> the parent has changed. Finally the call will recalculate the rate of
>>> each part of the tree to make sure the CCF cached tree is in sync with
>>> the hardware.
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>> 
>> The knee-jerk reaction to these patches is that it shouldn't be a
>> consumer API (i.e. taking a struct clk) but a provider API (i.e. taking
>> a struct clk_hw). I haven't looked in any more detail but just know that
>> it's a non-starter to be a consumer based API because we don't want
>> random consumers out there to be telling the CCF or provider drivers
>> that some clk has lost state and needs to be "refreshed".
>> 
>
> Totally agree, I hesitated and obviously did the wrong choice, but
> this is a nit, the main algorithm is not tied to the API level.
>
> Should I resend it with clk_hw ? the difference will be small and
> the main subject is the resync algorithm.

Independent of the point above (partly a least), I wonder what will
happen in some particular use cases

* If clock is changed while in suspend. This clock can be a parent of
  the clock invalidated but currently is not. What happen, if later,
  it becomes the parent ?

  Since it is not parent on resume it won't be invalidated. CCF might
  still take a decision based on an invalid cached value.

* If a mux is changed while in suspend, the parent is not correct
  anymore. The proposed patch recurse through the parents, it might
  not invalidate what we need/expect ... things are getting a bit
  unpredictable

IOW, this change take a leaf clock and tries to tell CCF that any parent
of this clock should not be trusted, but it might get it wrong in some
cases.

I think we should do it in the opposite way:
 * Mark the "rogue" clock with a flag (CLK_REFRESH ?)
 * Let CCF update the children of these clocks based on the new status

Back to Stephen point, I don't know which API it should be, but I
think the platform (fw driver or power stuff - not only clock provider)
should be able somehow to trigger the mechanism to let CCF know
something sketchy may have happened.

For the parameter, maybe there should not be any (no struct clk or
clk_hw) ? Maybe it would better if we let CCF refresh all the "rogue"
clocks ?

>
> Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
