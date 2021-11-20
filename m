Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684BEC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Nov 2021 23:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q67eyjAUlElrme+C4msFWgkN4K7usMftQwmcl1PpMOY=; b=szVTjIFmQ5DJ+k
	Pr0Lmn2HSVcAUQ2gb59ML5EHeitPtmG89crcFKPlrZSnHpJKyZugyrfFbbLad18yt+2Uptzv+qELY
	MbZrydG+5edYEQE0wtTPjQCqeNYOIASxMrOVdBSuwpDYgNuoYPfGFMvWxsjbkmvS349ekOFoOE6OO
	HYCYxkNACINUgURgscjuHrMz45ktVIDxTyx+adiUtkbAuLMK6pNTe0IRc8UaP8YN56pqbG0imT0B3
	gYWsvDFe1TrQk7bNW5QoHkwM27HllzHc7h80ht8kpvkntGbYMS8uwfpXfElSxuA8sn54B6VDhDu0o
	UK0uSJYNdCs8vJMvRo9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moZtq-00D412-Rh; Sat, 20 Nov 2021 23:36:02 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moZto-00D402-3u
 for linux-amlogic@lists.infradead.org; Sat, 20 Nov 2021 23:36:01 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r11so59121876edd.9
 for <linux-amlogic@lists.infradead.org>; Sat, 20 Nov 2021 15:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=miohu6SbfONOwXs1AwLBMAYQ0I6KHthWM0k34SPD7Us=;
 b=KbfG5lOwCuU4fJYKhZXBMoXldAxxH37JKquC84SiBrjn42kWCfF/rRtD+E2hNHDEVd
 vuRyU1GDXmDJhT8Kfxdh5bOyp6FYNgxCSsXTkg/GqPzSvFFws//qi24FhOYj8UHwMmmC
 1xYj/dqPSaX+CBc605DYVmwKmzYLpwILnKTFUY3uS5Ca1/YoDFDy0DoosCF2YSStoSfa
 YRFRY7EuAIL/Xa6wGOuPi5aTZxyr4aYOek632+8M/K/w3+TwDr9vanHwzJiezhOp67CS
 NMqsVpiHl5+DLGEv2qB8Myiq7hlLEBtb/I/3OJSblKkkup5/bLzXgYegGK0sFZ//omz2
 nb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=miohu6SbfONOwXs1AwLBMAYQ0I6KHthWM0k34SPD7Us=;
 b=FHPS/AwwHUPoSqsuQ9cSohyG2i72UIEumW2h6jTKFW3l0O698fMlSn36ILDyL7qUNO
 WS02CBj/oDPNrHwS4/yU6itklTUGd8tFV7a2d1tlduEbDRAgx5+mKDdni4QTPxyoOp1V
 fzKtfHjNE3s5z3dw1oYkfEM5b6y8KD0D90v7F+dlpPv93cJFHsBktV4pzRs2pA+MiqpD
 AStuu3+qZs5QItb2sIuYjXQpPIi5JYcS/2ppVfdr88t3J3/QsKGf+QVMXpkV7oHs32x1
 mfrHwNoJcVucNODVQqPp2P9lWjHleK1H+KaEO2w3i69BzvAiRmmvwRZ8IJbqkeKuBhxh
 5kjA==
X-Gm-Message-State: AOAM532oGfX/hSrJfLp6UCv0tk5TXL14Cidkpgi6/ybktPT6VMB8BTah
 5xbn15wPV0c+VFFP2XugUSpcxImFwnkEf+nkU7ILhBAWscA=
X-Google-Smtp-Source: ABdhPJzb+Mb/pzMZF6ItoCWBP0DnD24bZ4mfE4rlHkdFJveHiazebKcC14rKmD2Uh1pseETZYxoWlxUleqtrT4mNHMI=
X-Received: by 2002:a17:906:2788:: with SMTP id
 j8mr23369848ejc.203.1637451358629; 
 Sat, 20 Nov 2021 15:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
 <20211108134628.120474-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20211108134628.120474-4-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Nov 2021 00:35:48 +0100
Message-ID: <CAFBinCCzw4NXU9TSnnRRQ5Jo+Nug=oAsB=_0GR3TmBRxSgNngQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] pwm: meson: Drop always false check from .apply()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_153600_184008_1928F67D 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBOb3YgOCwgMjAyMSBhdCAyOjQ2IFBNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlIHB3bSBjb3JlIG9ubHkgY2Fs
bHMgdGhlIGFwcGx5IGNhbGxiYWNrIHdpdGggYSB2YWxpZCBzdGF0ZSBwb2ludGVyLAo+IHNvIGRv
bid0IHJlcGVhdCB0aGlzIGNoZWNrIGFscmVhZHkgZG9uZSBpbiB0aGUgY29yZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rpbmds
QGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
