Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A399EC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Nov 2021 23:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9gJoAUX3BmiQLpgkR0OHqv3t34xXawn3qhl0oZ2hiU=; b=uxgK0qePh8p/PL
	rLzDyj3i0OAT6K8eGHpUCFbzNfTV/wSIiqU1Pt6A8ykzA3w57Pxbvx7XHvJ2MgCfy+I+DuSFjjVTG
	8eoJOQW9wpL+Zuet9QllF5Cj8BRRAPeGJOxDiU0SHvgvNRmwTy6V0o92lQzYCU6Ub1ibUCccbAONi
	5vQsW95UBoAdxHPtbA4GPvqb2ViCqhxAVTZmpTOPgeR5BMDyq8B48EMSq6tpr7UKiWL44Funsw/t/
	V0DOIpatcCWpxF33qxwsFXehUG+81gZ+1yUpuc5LrSF1Sa6gQTSA0M0rvhSh0lLUP0JWIIS1K/rLE
	xfzh27carlrjbnJwQhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moZsY-00D3kr-OF; Sat, 20 Nov 2021 23:34:42 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moZsV-00D3kP-IH
 for linux-amlogic@lists.infradead.org; Sat, 20 Nov 2021 23:34:40 +0000
Received: by mail-ed1-x52d.google.com with SMTP id z5so59250326edd.3
 for <linux-amlogic@lists.infradead.org>; Sat, 20 Nov 2021 15:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tv8HLzUluQkTs0q0uddjhiVOF25UCticbPEqcPKHBjw=;
 b=fs/FzKGJXmddVV2n/avgGcBD16MmtHPBNm3GBjN5k6cY6p6tIvtTvs18wvvFoGQGPB
 iY6F6UIySX91OVy6aUhPzd+14km05J3c+40ytmNrtl55O1MUhLbd7Z4rrjwv58HroSFv
 DsRYB+bhtLU3qO3JwTAmp6Fxmg8Bv9SVYIHjP4/HF6piYdKMqq/JG7d8my600+CWe7W6
 Kva4o6F4dlYnpkMi9G9AzayFCz+VqDxvCTKCDigGeRxZ6A+sR2qbpmvv5Ofb+sieYyh7
 YMJhLZ1HcDWXYtC8W3x31wJSj5WcjATXsOnmlFgPKyqP/xm+MwQLQcEKE5PMURWgYWy/
 6ygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tv8HLzUluQkTs0q0uddjhiVOF25UCticbPEqcPKHBjw=;
 b=BV5bdqSd0pggS7ZyPz4TTXGWncKFHwSdZhageQJyMO+l9Jlb8Qf/GwAnnf8BkV6CyU
 45hmKQjuBidyhdEBTWkQyOdLwXWQ16oF3dBdnlr6PnQZfxUtTHJOw80omMS2nF9KBJfo
 kTYqwIkH3ZaPVcAPePLeyRjkRb+jbgazBaCPp7fiSNIX+4Mm6lIhC6h+aQ2OVUTPPX6X
 juAgnCxNZ+ZN0G2mIMzOnyl0+l0B/iZ4Qtfv9GnaPIkaruWDlbjJZDPBRKiLFFbowMjS
 krE7yhEc69vMQhDQgb7EUrPIAGe1qL/qnE+Khz21B7dJNdShuG9J+Fz3JSjNlr9Be/Fo
 Bspg==
X-Gm-Message-State: AOAM532iyaAf76Add2I2tol8Dg9lOTi3a1RUbIH5acWG9Lr2JU7jnRKN
 8O4KsoaofR4QprQAXKSS8auXE6rskQ/FfsUfGAE=
X-Google-Smtp-Source: ABdhPJy0tD2Z6ScIRSCnvVicKFa+RTzFVjEzxt9euVHdrHOasoGnTuE5RGOERYAAokG8NbHHWUNdKM2CTwzzMNQPMMk=
X-Received: by 2002:a17:907:6e8e:: with SMTP id
 sh14mr24614498ejc.536.1637451276616; 
 Sat, 20 Nov 2021 15:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Nov 2021 00:34:25 +0100
Message-ID: <CAFBinCDW-E6d5HQUn0q_-M-Gi4+tXiGV0NBg16iyBUFJC11e7g@mail.gmail.com>
Subject: Re: [PATCH 1/4] pwm: meson: Drop always false check from .request()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_153439_665309_ABFDC1FB 
X-CRM114-Status: UNSURE (   6.83  )
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
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gSW4gLnJlcXVlc3QoKSBwd21fZ2V0
X2NoaXBfZGF0YSgpIHJldHVybnMgTlVMTCBhbHdheXMgc2luY2UgY29tbWl0Cj4gZTkyNmIxMmM2
MTFjICgicHdtOiBDbGVhciBjaGlwX2RhdGEgaW4gcHdtX3B1dCgpIikuIChBbmQgaWYgaXQgZGlk
bid0Cj4gcmV0dXJuaW5nIDAgd291bGQgYmUgd3JvbmcgYmVjYXVzZSB0aGVuIC5yZXF1ZXN0KCkg
d291bGRuJ3QgcmVlbmFibGUKPiB0aGUgY2xrIHdoaWNoIHRoZSBvdGhlciBkcml2ZXIgY29kZSBk
ZXBlbmRzIG9uLikKPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rpbmds
IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
