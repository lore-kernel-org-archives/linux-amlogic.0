Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943BAECAAD5
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+siRKbehWADC3qsyZLe5s7CkEagFR1mbwW2lWzq5dM=; b=LGpGvZCTbv9ym0
	bMZ4EUITUnc9fP060E2TYttACs4YBObnUo3uk3NI4h5tqlbIb/cG5lajQfBrQxcB9jdP8oH5oBJ6b
	KJtXZhSuWk4MtObHqzlkMu1JImXu0np6BtMQjvX6aSdk+mARVpahC/6Jv257uQ3T4kIvANr/f2EbA
	IZfywJnQliZB2T39Bo2dlxsE1eVbEv8Aa/XsKKO7WpyFDliu3xaeSov+JTbkMn8qD4VkRTS6p1JmC
	9meve5dtD5JPwP+qiMzafCm8iNyhgPM/UrGxKmVLKxJh4x6qhmOtrcPZHYMChkqSW6PrD3IaMdCt7
	EfngsU9aVf54OUiuEUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSffM-00B40S-R2; Mon, 29 Aug 2022 14:23:04 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSfes-00B3pn-V1
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 14:22:38 +0000
Received: by mail-lf1-x129.google.com with SMTP id bt10so11402355lfb.1
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 07:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=FfW4HGYn26XtUqQ/e7sAaYpbBaUM1Z8Gx46WxwdHwTg=;
        b=PE3nUuZ66F46QT6sv0gfgKmaz3nvEfONqeIADcJmzJlP1LZisqWqOkcfdtK+w3Q8O9
         k2t36IHqbAoaAZFXtDFCiTgP4g1fgS2tGEpPdFrAurQLNz0XEgOXgxlxB4DyzOq+U13M
         /yi49U68SBeKPEg2/y/yyKI5j5FAU1vtJdTvrPeKixTc+bUinQQ4h538arx6aNHU6/w5
         FENzVCe1Bw95uTvMLUP/MmYjAtcal4B1ICmFO/P7NFOsCBzSlk9wOjBl1DVU90Nfo92I
         OBv2tis1n+NYp4EP995PgNVdFQcZ66sL5ydvAJngKdkMM0QDxfsTGw4p/MsWBq5fAdfG
         epgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FfW4HGYn26XtUqQ/e7sAaYpbBaUM1Z8Gx46WxwdHwTg=;
        b=Fzrw0YzqKSCvPWbDLh3Q1uvqIGLIfSMl1HQUzIicHyiEd5zZT7lWetP9jRcuTRkDUK
         O/KVBxyuyBKfkgvo0NQXMnzCukwq3T994+BoPZAZqqmHifh2zAtnM6AhN3Ha4bAjxJ09
         DeHn3Orn/ySxLiD3j+CtJTJ/lnMZ0QGZWcqQJ9EnBHn0yEXDO0K9rfMFCMoOF7pLsS0h
         eqqWTcSyyaDzmv7LQT+/cRkqnYudpHJvtyzjvzGYHQC4X28m6f9XInMkPd0OXreoB+zp
         I3A5V07bJjI4WqJN3OM93bbjvLnLQK35tNKI4IqX8EVlywUjwnXmpYA3pRJGzPEdRwYY
         omtg==
X-Gm-Message-State: ACgBeo05nJNBc+OhtQ3DfMUntTp26QwFE98LAJ7cug7VOq/wXMbJ1KUa
	qcp60WyUDEzvdFo5IgzrDZ5O4GUUBaxMXPnB1f7uRA==
X-Google-Smtp-Source: AA6agR4i/W/hSJcdm+Gzv+x2zZm/NYYHPnwCT4l8m6WRM2o/xIsCCPqHBjSSqmpco/NdSgEMnVYKyGddaLleAVwK44Y=
X-Received: by 2002:ac2:59cf:0:b0:492:bf97:9a03 with SMTP id
 x15-20020ac259cf000000b00492bf979a03mr7051814lfn.233.1661782950289; Mon, 29
 Aug 2022 07:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <72459a46-fd20-60d8-a7e7-076d8f321816@gmail.com>
 <CAPDyKFokmJr7e8=gvsYbBbdxceG6kCa57vbYy1tUT_b+B=8P8Q@mail.gmail.com>
 <e970e07d-9bb8-707d-1dc6-09fae2abbfff@baylibre.com> <CAPDyKFqRm=RVn__3HJDk_0bBemudh_y7YEYPZe3W7iJCfP50fg@mail.gmail.com>
 <67f29dfe-a579-125e-cb84-f6b554932b42@baylibre.com>
In-Reply-To: <67f29dfe-a579-125e-cb84-f6b554932b42@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Aug 2022 16:21:54 +0200
Message-ID: <CAPDyKFqqtHUtGshE=JYaLK09P28EeenYAsvnDkROvMHb7i2bDg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mmc: meson-gx: add SDIO interrupt support
To: Neil Armstrong <narmstrong@baylibre.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_072235_131514_4DA52F8F 
X-CRM114-Status: GOOD (  18.61  )
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

On Mon, 29 Aug 2022 at 15:29, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 29/08/2022 14:07, Ulf Hansson wrote:
> > On Mon, 29 Aug 2022 at 09:42, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Hi Uffe, Heiner,
> >>
> >> On 26/08/2022 11:16, Ulf Hansson wrote:
> >>> On Thu, 25 Aug 2022 at 21:52, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >>>>
> >>>> Add SDIO interrupt support. Successfully tested on a S905X4-based
> >>>> system (V3 register layout) with a BRCM4334 SDIO wifi module
> >>>> (brcmfmac driver).
> >>>>
> >>>> v2:
> >>>> - use new SDIO interrupt API
> >>>> v3:
> >>>> - don't duplicate checking mmc->sdio_irq_pending
> >>>>
> >>>> Heiner Kallweit (2):
> >>>>     mmc: meson: adjust and re-use constant IRQ_EN_MASK
> >>>>     mmc: meson-gx: add SDIO interrupt support
> >>>>
> >>>>    drivers/mmc/host/meson-gx-mmc.c | 84 +++++++++++++++++++++++++--------
> >>>>    1 file changed, 65 insertions(+), 19 deletions(-)
> >>>>
> >>>
> >>> Applied for next, thanks!
> >>
> >> Thanks for applying, but I was off (like many of reviewers) and I would have like
> >> this patchset to be tested on earlier SoCs aswell, or only enabled on S4 for now.
> >
> > To actually make use of the new code, an update to the corresponding
> > DTS files are needed to set the cap-sdio-irq property.
>
> I know but it changed the IRQ handling, let's hope we don't see any regressions.

Right. Let's encourage people to test this!

I noticed that $subject patch sets the CLK_IRQ_SDIO_SLEEP bit, no
matter whether the SDIO IRQs has been enabled. Don't know if that is
intentional and/or could be a problem? Heiner?

[...]

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
