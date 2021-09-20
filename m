Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BF1C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 20:25:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481A2610A0
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 20:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 481A2610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUbLkfuBD0p6QZvWOeKBLP/6EAE7Glr+4+7HZvy1zpU=; b=o0WXsc8mHzJ+d/
	MNXNCzvwYnEcmPqRMQRU6u69b6haJfB0IWSNCta0RXihlJlNsZ/02W2z6IZAPUFBtASHey2n53owl
	V2pZI5b3Vm64kuyIyHAF26CrL/0LpgibHPFTWZkkhlXRIS5eugJBoQXbpHbnLyAGy5w3QXw4vhwm7
	orBpNK1vvI2xhpyP5zv010ckmeCn95S5wVJyESw4UWl4NXn/hU1lRYhNI2Ss69cE0tIGDiKsqFmmv
	wUvfh3ZFc722c89ITAuuSmKQ2D/WOoJHKnKPlEzil7q1bvErRaPaiEg0e5aqKogTSRtUexJHngaFR
	cVORhrbtr44t+ALdLJbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSPqc-00328s-3W; Mon, 20 Sep 2021 20:25:06 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSPqZ-00327n-VN; Mon, 20 Sep 2021 20:25:05 +0000
Received: by mail-ed1-x536.google.com with SMTP id t6so65703869edi.9;
 Mon, 20 Sep 2021 13:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AewO3aO3+z4hlxCwFUZ9p0OHCR2EQKSX+iYFMao6nc0=;
 b=WlFs5oPPaUXTN+8fM3tZZ4yFpm8r8IgTSFP1cJLfWFwUQqjOYBaREpxJ5wY1VgC+Jc
 Dh7y5DzfBQ7pEYF3w51CtovgkKI68ReEkdlCSOK/dgJag7xi9DrC/MC4rVEnq8fQ0ivB
 wPKWiqB1+UGDojR6HGuMEiJOhdNGv7/2wpZ/Tcn+l9WojxeOx2ZzxKOapLN7aEWKm9LZ
 Q8hCNZzkkpAY9pF+37I9UTj4esgXe3fjAf9sVG7VnMOEpEoRDuMCLHW96wgqpSIxKzpC
 8G9DgMDfr3zUZi9SwzFqT5MtiCUmXwgSIPS1258EfUig6QeLWqMfMsduf/yqypk2dgUO
 YLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AewO3aO3+z4hlxCwFUZ9p0OHCR2EQKSX+iYFMao6nc0=;
 b=DT8Re5rHuvDK25csbCs+iRyCnWKlNo++grU5zYdEoTPHI6k40jhjvmCp1ytycNFKWz
 qDHNdeuQQ5sJ3UVPHU5YcL4OE1AE5mbzrte38oSoyDgq1O9/1sUxn9UpPDLQOXlCO/rZ
 dR2GKe/eYssTIXFu1IwxiiEtsT7TFjcuyqbQtwwEYHc4xfe5z9/96pyA3XBRlwn+l2Gs
 /ZabQgg+xLEUa/F9UkPNzBfUMMwMzI7vFK6guYCPim98NGRtLP1Dpkj1eyjr8sZE4y/D
 KLtd1QCN+1GTm09rkAzhJJeCvk+sI9XJAseDPUQETQV697ZDqDuILxqCZkq/UD9KJ8aw
 oS8w==
X-Gm-Message-State: AOAM530TXivbp1ssK+Ot4+S7P8wQIo4Q9CRj752GGbMb9QNsI3d36A9i
 26iHChU6NrL+4D8hrb6ziqJgcJzkQeZOEgOpiVM=
X-Google-Smtp-Source: ABdhPJwkUmyH5gYMjWJ2V2eDW+BhQLLZjiG5GzSZPFfz145M9TBUTN1XRqXTHJlhfKSmof0VVXdttq5fa/CP+dW00Hg=
X-Received: by 2002:a17:906:9747:: with SMTP id
 o7mr30754181ejy.486.1632169500694; 
 Mon, 20 Sep 2021 13:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210920074405.252477-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210920074405.252477-1-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 Sep 2021 22:24:49 +0200
Message-ID: <CAFBinCA2yjQnRyaU3WKd5wiQE9b4nNMVMac5XePJ1DG1QCeeNw@mail.gmail.com>
Subject: Re: [PATCH v2] hwrng: meson - Improve error handling for core clock
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 linux-crypto@vger.kernel.org, kernel@pengutronix.de, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_132504_066973_E7D0CACB 
X-CRM114-Status: GOOD (  10.77  )
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

T24gTW9uLCBTZXAgMjAsIDIwMjEgYXQgOTo0NCBBTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IC1FTk9FTlQgKGllLiAidGhlcmUg
aXMgbm8gY2xvY2siKSBpcyBmaW5lIHRvIGlnbm9yZSBmb3IgYW4gb3B0aW9uYWwKPiBjbG9jaywg
b3RoZXIgdmFsdWVzIGFyZSBub3Qgc3VwcG9zZWQgdG8gYmUgaWdub3JlZCBhbmQgc2hvdWxkIGJl
Cj4gZXNjYWxhdGVkIHRvIHRoZSBjYWxsZXIgKGUuZy4gLUVQUk9CRV9ERUZFUikuIElnbm9yZSAt
RU5PRU5UIGJ5IHVzaW5nCj4gZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCkuCj4KPiBXaGlsZSB0b3Vj
aGluZyB0aGlzIGNvZGUgYWxzbyBhZGQgYW4gZXJyb3IgbWVzc2FnZSBmb3IgdGhlIGZhdGFsIGVy
cm9ycy4KPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGU+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0
aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgphcyB3ZWxsIGFzOgpUZXN0ZWQtYnk6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+ICMK
b24gT2Ryb2lkLUMxCgpUaGFuayB5b3UgVXdlIQoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
