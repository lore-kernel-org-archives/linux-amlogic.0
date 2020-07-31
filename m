Return-Path: <SRS0=qkt4=BK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D8AC433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 12:16:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B81F22BF3
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 12:16:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M7OUZ2PL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="guQm0pLx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B81F22BF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m7tzf13cojJ9YL+3vcE0TqQDt0p6T23koAiECuLf6fs=; b=M7OUZ2PLqqC4xHOAghDq3bf8m
	kACKBGB7D9hpsik9kAGwqMsrsjk+84StIgDI9E7gzLYnQuHMQDNjw/RyGs2T69oLYyJneXf5QU7BP
	xI2a6JRvM/DPOVro9lS8whHcBOy9MCUjPsZdLW1F06qBNISCoBdFjyzLJwUQPeADZljYIY/hmKt+9
	DYNyT+IU/2//BL7eROELn8Fyc30++P3ybIB8AmnAHUL8070GyGppFfbuKAY5mW1x2SJKYJDKQRKf5
	Jbf5RA1A4Tkkhyas7RDL8WQF8lvENKLKs7wQbamEdXXYvlepzaHaqdRZBfbBsWwtdO2GeY+Rlq0VC
	ON23mOKKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Txw-0003DE-Na; Fri, 31 Jul 2020 12:16:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Txu-0003CY-08
 for linux-amlogic@lists.infradead.org; Fri, 31 Jul 2020 12:16:46 +0000
Received: by mail-wr1-x444.google.com with SMTP id r12so27755551wrj.13
 for <linux-amlogic@lists.infradead.org>; Fri, 31 Jul 2020 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=xABj9o/+LF58yiAkW0qlTl8H60o66EHmFAlpoGa2r4s=;
 b=guQm0pLxZhuiFMgT/YoFDq1qAQEhYLykNn383MHzp5vyWxpMrZ36YkRNI78Ke5XpUO
 wq1Q16/L+GkWgoNJLEf/o9HsPCU4002b1qrN9oB5YQTivbxhsh1zAj0g5r0ZMwxbvFs1
 txNvI+MFOaQIhzLW6qF79AjMywqpt6i/uYmN/8D2yUkRL2lcCo6Gkf0uBOCa2BbXDEao
 4qz9YkoQ+hEyjr96b5l/hRkD13LxOen7ADjs35KCziHBvXijJ+P1sTq5917Lqjz9Qhls
 GuhtcRBBoFrYjiEniyu6H5zZ+JPnAkF9+FBAarSjzbmGdrE9u2Ki04mtXhJ06YEYcu5m
 yA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=xABj9o/+LF58yiAkW0qlTl8H60o66EHmFAlpoGa2r4s=;
 b=J7N8z3Q7F397Vo3X7VBkb+KRxQG/27112rgOjvS0Zblt2FZHPDwFt+MetSBjSShjb4
 PwuFxgOb5Z8x6SounJuX69FYWlSHRDlyMbyyVSIsu1uQ1QytOphB+AvIgswezqy4ccBg
 21bfWcd+2CzDW8lLYcgo8iyKtzAViRCyofpEw0lmtZ3FYLb8JO14GCc04kCeldKFnzfb
 ddALTNxvHo84RFd8HOk/FzXVJUES5lerwOuHaEW88o/X0rtRxrFU9N7Jidstq9MjidH6
 A5eEr+IVDy02+0Ovy+lTjI+FNNiJetPJDdANgUxa0QXWkf6+2sCpgmN+Ao5E3bL+INUP
 1aPw==
X-Gm-Message-State: AOAM533aQ0t523Z2wi2zQGur7OlNJDvD7shwPWjBI4W/bfuKf9QDsg4M
 of9C7iRpV5Jwz5kyluZkZv4FLw==
X-Google-Smtp-Source: ABdhPJwnWi9tvSXSrHuqSUu1kDUIIUV324uwyEKL0/F8EHAeFwamGr+7Nm01PLL6fMFhOXcprj35Sg==
X-Received: by 2002:adf:e6cc:: with SMTP id y12mr3266378wrm.391.1596197804388; 
 Fri, 31 Jul 2020 05:16:44 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g126sm12527702wme.16.2020.07.31.05.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:16:43 -0700 (PDT)
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
 <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
 <20200730185229.GH5055@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
In-reply-to: <20200730185229.GH5055@sirena.org.uk>
Date: Fri, 31 Jul 2020 14:16:43 +0200
Message-ID: <1j7duj98wk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_081646_065951_A55FA413 
X-CRM114-Status: GOOD (  24.91  )
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
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, zhangn1985@outlook.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 30 Jul 2020 at 20:52, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Jul 30, 2020 at 11:06:23AM -0500, Pierre-Louis Bossart wrote:
>> On 7/30/20 4:04 AM, Jerome Brunet wrote:
>> > On Wed 29 Jul 2020 at 17:56, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
>> > > On 7/29/20 10:46 AM, Jerome Brunet wrote:
>
>> > > > The flag previously allowed card drivers to disable a stream direction on
>> > > > a link (whether or not such feature is deemed useful).
>
> Right, and I can see a use case for this if someone has a board that
> for some reason didn't physically connect one of the directions for some
> reason - perhaps they were running out of pins or something.  It's not
> clear if anyone's actually doing that though.
>
>> > > > Forcing the flags to be aligned with DAI caps just make the information
>> > > > the flag carry redundant with DAI caps, breaking a few cards along the way.
>
>> > > > This change drops the added error conditions and restore the initial flag
>> > > > semantics.
>
> I'm not 100% clear, have we actually found cases where the flags are
> used or is this something found through inspection and review?

One last thing I'd like to understand. Is this behavior of throwing an
error going to applied to the non-DPCM case as well ? so at least thing
are consistent between both cases ?

IOW:
 * An error is now throw if dpcm_capture is set on the link and the CPU
 DAI support playback_only
 * on non-DPCM links, will an error be thrown as well if playback_only
 is not set and the CPU on the link happen to not support capture ?
 
>
>> >   * It worked for every user of DPCM so a far.
>
>> Not completely true, when Morimoto-san added snd_soc_dai_stream_valid() it
>> exposed tons of cases where the information on direction was not provided in
>> a reliable at the DAI level. I will assert that we are still finding out
>> cases with broken DAI configurations, and as a result we will also find
>> broken dailink configurations. Your picture of DPCM as a perfectly
>> functional system that I broke is a distortion of reality.
>
>> The reality is that we have to work in steps, first make sure all DAIs are
>> properly described, then work on the dailinks and optimize at a later point.
>> we will need warnings to find out what the problem cases are, and move
>> slowly.
>
> This was all triggered by Morimoto-san's changes like you say.  DPCM has
> quite a lot of problems in general, here IIRC the issues were that we
> had multiple different ways of doing similar things which it wasn't
> quite clear if people were even using.  The intention with the warnings
> was to remove them one way or another, they're mainly intended to flush
> out actual active usage of the flags as opposed to redundant usage of
> them which could be confused/broken.
>
> This could definitely have been clearer in the changelogs though.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
