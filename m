Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876CECD98C7
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jun 2026 02:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rn3kTd2S//WrUshU65wAWBCyZd6ZJzLkY+yvME6DIPU=; b=4+xuufsv+SSJSX
	q4+Q2fAG0A54TOTlXf/7BZdv3/5dRleFTo3yH4B6u21Cw0Zr3WQstBcEzXeqNcxTRtwDlhSWweIBe
	8LMEum0XChb247VoCKJu3In3RxJUVkXQki5gmxKvUYNyaO9AretRWNVLMHlZVJtZcDKmu5oa8BqEJ
	eJvyhhgmG6lhPMKTb5WaUoNBmouJ798hBPD6Rs3DC340cJhHXbBdrny3Trc4EhFi20v2xemZZKvwh
	E/Mi8lbb8WeFHysVOLn2n7JMuDwqBlkkKc8Vd4MNwctThRCA1hcBp4x6YechM0bRSWaGqSTHUfpfP
	7aubsCdBEJZrIN1wZ5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrlh-0000000AIEm-1pzh;
	Fri, 12 Jun 2026 02:37:13 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrlf-0000000AIEC-236F
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Jun 2026 02:37:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so761830a91.1
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 19:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781231830; cv=none;
        d=google.com; s=arc-20240605;
        b=j/BZhlsO/Mg/6f7PqlStAT39s2X0ppwyo7EIvlPU0DRlAlEQgOpAqSR2O33rvS3NkN
         P78MFtasXwn3pFM7r10irUO7bZ7Gxy3SbukTNojQn1QJC1b93w5IK9pxHL4318vjsw8b
         LGvVKCdaX6cdGNDO6nj/VHex3sPR/Ho+zXT8adPvsgGzzUDI34WJr0x7yUQwYdxhKcC4
         NuBlao0XKiS1nmU2rbNwqu81qXrTNSnySQU3lhV6FAPTraDspzsODcln1LIqenfbAqyr
         rEg915dsiMWu+GnqgRDINHUZSAfGfSyq/7D+bkO5U1mrbJGKmd9RZ/e1jNKiNDOAw8wq
         hRZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k7TWkPnU2ZFv4c9L/lpJaAzpAHYUyg4vWnHX2LiMAfg=;
        fh=QaDNiNlGpPPczrJVkbvxaaWUOSMRaWmoEpzUCGJ1GVk=;
        b=CNt3Byl2twt0dBxXIqXxP9xjq+DYjYaL6lYiPr1TYQohca8d5S94tiGyw/P90Wl3kr
         4RGzSsrYH2F/UaagrGfc1rdkpTjdKfV1a5iWR9WgAf4ZBDHD7EpQ0fiUP/TwPVKEFjsC
         AI0TgqkA/IfMQCPU/n4y1A3Fo5l1PtO766vj/kiZLnqIj6fbnSAuf/KPAUxFB7HFPDyf
         Ue8vd15I7PcM9DOJWi2f8BtpkrIWrGNVXPeY/WQ9kna0IgPz6kxoi7InDf3gwuD6LYfE
         BLQw4JeEtyFnArsYwlvz30QyI4pILkfTyurb0hJw4vMOgGJSplg9jv9loo077DbIdonJ
         EMng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781231830; x=1781836630; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k7TWkPnU2ZFv4c9L/lpJaAzpAHYUyg4vWnHX2LiMAfg=;
        b=Df/Hswh+TXuLqrTyloYfEuQLGo+Mxkjn1KP9lXW7fdBMbgFuwPt6EdrI2bWyNLlQ1y
         6O55Py1WRVdiFlMHTAKSIem8y6YuwA9QXyBTtcko5d6xrTxlrHr/iAeDjKRvkrmBhbgl
         zaanfK+/hjuSUMgyI7KYT4juJx8nXA3ofiVHqmv1mkMPbpSZCtswbmXpgfXG40vt7R3z
         i5SAsGu0Xo7pjkLOylgAUscwXPyAcViA8FGAfhBFfeQsz8GctIXnd9a7nzGwYn8iTYXz
         dxlPWWCblx1kjjodzrKP+wZ1ntHP6NH8c5MiTaIVezq9/AuBVr64d1mRwbDq/eHVePc2
         ObTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781231830; x=1781836630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7TWkPnU2ZFv4c9L/lpJaAzpAHYUyg4vWnHX2LiMAfg=;
        b=EIDXh/PTPwuLGaBn/N9BPeKkLxM2lNCvYNfESxbnQ0psLH1rimkgRDoQBNXJOKYicG
         UY5R21m92/x5MpL5TZ1Jmb0s+6AP3ZBFiTtcaoI+KoaazwHXFPT75JqDK/3+MpUtAobF
         +UQ0jAzoKh0FNoH9pu0+to879mkFlkpyO5g9rhPuZP3pwqqHFug7a1y/gpPhQsYJr2/h
         bzEXcQDIy9vwvaPkhOD3UFORIbqIYXlttmxAHr04Cz3WItb5r7q5wy+dEpLHse8bK8ps
         heEsj8kLhn2thyuUc6MUCjhxHyc2JgrBDPHPMPbEacFDdlnIQl13SuW1+ZXj0vWf8d3C
         l5Gg==
X-Forwarded-Encrypted: i=1; AFNElJ93IBS8kk3gRpC4pyymZxG9UqV9WkMXUosFMpfcjNJb3NQRsHI++PnKUepnz0Nv8+8/v8so2Dp3R2nuwDyu@lists.infradead.org
X-Gm-Message-State: AOJu0YyhSl7eaD83XVJNi/mLXoHtTqawPyezNj7J8qgKtuOd/eTrKDXT
	xM/3vYa0NEE9kNqYrOikRom6eVZVXzUE0WZIX9jxcWUNwopTzh+SWIwAaRYltDcJhmtkYprg8Ez
	Qm9T0yvduYnoWPWuRsGZClNRnuo0wd6c=
X-Gm-Gg: Acq92OEnlnViLr3ekNBCJwoAIKtUvz0CjhjiVAsNpSyMQ4MUI344cOcNdkzHoBJvV2a
	3d+l+RlLQaG+UtWyPNPIsZW9iVUjJ/hQEb0xVLXl/ch5creJQhiz7sCbelMjnq6Bz1nDpXzZKDP
	9nVPEzAYKFdH95ozc7dboPm7D2FrGWI7WV1V95XRaI/XSPwTf/Ja+ZtzVXwFHTWcwrUgTCbIoVK
	ZY20tNuk++ll15cY8rUzcK+MrHuWJUbvsYDp+GqbJBrFryEFIQoldNIfliHlni74MNd4qKBKPLb
	Qvj4chB+1lVBkaa2DSxkrMMTnszkQWTqoV4bUA==
X-Received: by 2002:a17:90b:1dce:b0:369:7491:7b24 with SMTP id
 98e67ed59e1d1-379ed8e27d2mr1063022a91.6.1781231830513; Thu, 11 Jun 2026
 19:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260610102153.83367-1-phucduc.bui@gmail.com> <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
 <CAABR9nGC=f_hO7FX2RnRHLb5D2Tt9=qT_yv-Fv2y32AAoQy+sw@mail.gmail.com> <1jo6hhebus.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jo6hhebus.fsf@starbuckisacylon.baylibre.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 12 Jun 2026 09:36:58 +0700
X-Gm-Features: AVVi8CcLu5Ty5I6ab3mqIKLS740KgAX1K7YLQYr3jFBVdQ6AaZKqSuuk1kFJF9c
Message-ID: <CAABR9nGQt0zsH2McjOFO91tS-CHsudzioxCkPvbkgmTyfKVo=Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_193711_556665_56B49FF6 
X-CRM114-Status: GOOD (  13.63  )
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

Hi Jerome,

Thank you for the review and for the Reviewed-by tag.

>
> The code is not better or worse with the change but you went through the
> trouble of doing so, if Mark is fine with it, let's have it
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>

Regarding the point about whether the change makes the code better or worse,
I have sent an additional patch to address related cleanup in the same area:

https://lore.kernel.org/all/20260612020113.9557-1-phucduc.bui@gmail.com/

Would appreciate your review on that as well.

While looking into the Meson ASoC probe paths,
I noticed a few consistency issues that seem to appear across multiple drivers:

1. Mixed usage of dev_err_probe() and dev_err() in probe error paths.

2. Inconsistent error message formatting: some messages start with lowercase
   ("failed to init..."), while others start with uppercase ("Failed
to register...").

3. In aiu_probe(), error paths for IRQ retrieval do not provide
additional context,
    making it harder to identify which resource failed:

   aiu->i2s.irq = platform_get_irq_byname(pdev, "i2s");
   if (aiu->i2s.irq < 0)
           return aiu->i2s.irq;

   aiu->spdif.irq = platform_get_irq_byname(pdev, "spdif");
   if (aiu->spdif.irq < 0)
           return aiu->spdif.irq;

4 ......

Do you think addressing these issues would improve readability and
maintainability of the Meson codebase over time?
Or is it generally preferred to leave these kinds of consistency
improvements untouched unless a functional bug is being fixed?

Best regards,
Phuc

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
