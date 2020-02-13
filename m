Return-Path: <SRS0=deyy=4B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDC3C2BA83
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 17:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6381206ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2020 17:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="feNVD+cK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="y4z9797W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6381206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NtBjoTKNxuQV+04N5gzxQgF+avTpCd+dhDiSPxbDJm0=; b=feNVD+cKyJU+XkU4+mFbSRp8UJ
	Y/fUZ/f8scMmE6ruWQ4ZSfwTheiIuDiS0TR/SJHIEarYvlXNz+0uMJT4Qo2sQ5C3orKmFnLxS+JYN
	uVLN7i4AqJVWEszoI5MVYLfldXAX9O3g5Di1d099BlFdw3FMOUceswzK9v4QhATfEM4zn5RfS8wWh
	KiifKVnyRab2ZkcvpyjoTFvqF38sqAlpeDk8EOZi4m2Wc1u9A9wGsmt+FtZ8TCeb/iGchu5SzpagZ
	jk5J1supJA5B651hEcGrtb6J+DDxgpjsS3PUrFkQSCN8PNnzlIdDNHc+9GintlDKxG3nb3lUWUB6Y
	cA445K9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2IQt-0000lU-PC; Thu, 13 Feb 2020 17:37:47 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2IQq-0000l7-E3
 for linux-amlogic@lists.infradead.org; Thu, 13 Feb 2020 17:37:46 +0000
Received: by mail-wm1-x343.google.com with SMTP id a9so7715406wmj.3
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2020 09:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Zvz2XeVTIF+ueC8ZSbcXCfTRm4NOaCnXy121PGkk+Yg=;
 b=y4z9797WK5rw61o0bHX20MVMCzpPi8e1XV3NNiGnUzy/usayLB7afqaJPX9RbfFN8d
 DTHjeJKKl0pf+6s56FBO6zp7C85vj8QTq9rii/FdwUiZoqKNj2guPNqtyP8wgQNOtmdv
 UmaS7phuNaxUHCjYa2YlwmNpOzXz4C8VUr6ecOtZfSqBYOmP7+4uubq2yIunsJr3QiXl
 LX8W4qZbMWDrTV7lJnlgFd0vCm3XBm13uk9eSp8VTYshLUJcLJ6P1lfAfGOL5EPZQvVi
 OimW08hzSH5ujRFZxkJhUKNViVxC/yetGRK+uJ2pXq3g+0gHCPA1imWM3FBb0b/dl8fF
 KtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Zvz2XeVTIF+ueC8ZSbcXCfTRm4NOaCnXy121PGkk+Yg=;
 b=XsMaLbKEm5lCUEv7oS7LGkhHUQEd0sBgQh53TaRJZJAJGndII16zZ4jzgiXdqygdlX
 cSFvQMspMnEr0bGqVX+EllUiq72X4KTGIDgYadibddAyDqnQPpbwArx/FyM9/TWhDdNs
 q1aT5d8NCJ3lAuFm6q8nFNEwTN0upESDSZvnhcl38tAbB97b43rvxhPnK9nLR4M8zmre
 ITrhfvAhNeL6gLJ9ApxpoIbhp+ftCtXbhObYi/mYMejhqO7DZxlXAjd1ZjPLAYRLdEFq
 ykmiYGKfiSHKC0RaNP2AhC7fGqIq5pOVIYMnDTO0Rzf6sbX1NvKaFhva0uEdLJjjAKWY
 Y36A==
X-Gm-Message-State: APjAAAXdnLA19RzVXv/NqhnGgtx3oWqBFxYwr27ES6+UeMalSlAD4sXU
 TneVjbq4WpceS7RdF7pJymKNqA==
X-Google-Smtp-Source: APXvYqykC+mTy5IPmmZi7PPVz1FJbeRW+wBfOOUQU58sYIdkyHAaUT8ZIB+UlNf0ucjzIZv+uzieOg==
X-Received: by 2002:a05:600c:228f:: with SMTP id
 15mr7314496wmf.56.1581615463076; 
 Thu, 13 Feb 2020 09:37:43 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id y185sm4054871wmg.2.2020.02.13.09.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 09:37:42 -0800 (PST)
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
 <20200213155159.3235792-2-jbrunet@baylibre.com>
 <20200213171830.GH4333@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/9] ASoC: core: allow a dt node to provide several
 components
In-reply-to: <20200213171830.GH4333@sirena.org.uk>
Date: Thu, 13 Feb 2020 18:37:41 +0100
Message-ID: <1j4kvufkwq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_093744_520389_930413BC 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 13 Feb 2020 at 18:18, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Feb 13, 2020 at 04:51:51PM +0100, Jerome Brunet wrote:
>
>> At the moment, querying the dai_name will stop of the first component
>> matching the dt node. This does not allow a device (single dt node) to
>> provide several ASoC components which could then be used through DT.
>
>> This change let the search go on if the xlate function of the component
>> returns an error, giving the possibility to another component to match
>> and return the dai_name.
>
> My first question here would be why you'd want to do that rather than
> combine everything into a single component since the hardware seems to
> be doing that anyway.  Hopefully the rest of the series will answer this
> but it'd be good in the changelog here.

Hi Mark,

Sorry if I was not clear enough.

This HW is messy. It is indeed one monolithic device which
provides several functions/sub-devices/components

I tried several approaches:

* Just 1 component: This was ugly because the part that is present only on 1
SoC variant, I needed to reconstruct the dai, widget, route and control
table which involved a fair amount of useless copies.

* A lot of devices (and components) with syscon: This ended up being even
  uglier, difficult to work with since it did not really reflected the
  actual HW.

The solution proposed here is just one device with 3 possible
components (groups):
* The CPU producers a associated path
* The HDMI control
* The Internal DAC control

The impact on ASoC is rather small, the driver reflect quite well what
the HW is and, with a sound-dai-cell=2, it fairly simple in DT as well.

Do you think there is something wrong with a linux device providing
several ASoC components ?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
