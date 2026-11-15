Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E494606A31F
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 21:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1XKRufSI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=xVtLiVPR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zCrNRQlfBWq5wOGVOizR6Vo33Qd2kY9TWMyWZj2Fc8c=; b=1XKRufSIm5jONMvUhGmq9pCYD1
	f/xcGXx5UlXiBoNP9nO6F4Z5GPNDdYN/dW+kp86HtuX+IqFcjBToA3oKnJfZNRd87KXkn8u5kp6HK
	Ei1v4Ltkh7B4Qx/JCdHPhZD7UK5USs7y9KX4baZDBodVhaX8zdYdnmURNbGzgtPu5p4vQbuTBDdAA
	VAKH4g2rfr9yRrDv+AQCRZY7n1VH5BpcfbzqP7UjJZqkN8La+9+EQUgaUg/NzsETVvPiYE/xheo7k
	aNOaWYmeOKXgYmmi+icABQCyHDvga6tNKMFybkYoumvGaDukceyV4RBOJ+ABVCqCDMkSiI/Vyosgu
	YYAUrXOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShmk-00000000VpK-1MEH;
	Sun, 15 Nov 2026 21:29:14 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShmh-00000000Vo7-1Lzo
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 21:29:12 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso3607528d50.1
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 13:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778150; cv=none;
        d=google.com; s=arc-20260327;
        b=Ce18fEmiK/XYYghVIbwaYu32XTKaKEu6NXDsbR6qo5+bFV2ZXUijkVudfeuH/32nF9
         fLReqAHDFgfBFfvYloULBup9+O3ZhHogKAJUr6V2KNECYwKelEbLZdmAuPmyZL2J2LM/
         xcOJ2jIz2rR+nvccoBayDnYqRHDLPjvARtQeXQWAFWfKfnmJUqpx6wHARqbmqjG7CFW0
         s/nkK+zvw9hTPL+laQ9GQ+mi0/YKn0AFXZBCtjZEvWKDyFylZTc8RQOWbrYn5Pp3L0r0
         x7yhsiDzzanfs2AN2cnaT3w5znH7BoLyqeuX2/SgaGX1qL9JSz0HgGFFzNYgjxcKmSsV
         sMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        fh=hRna/heNoTr8IebNRoZbqx6vY+t8VXdEFoTUoG6aWbo=;
        b=L4V83gXJuBgqQe7ETyQj/lTs4HT2l1PZ1bkXhnEjYu0UI3SHJmtEra+8e3ywOyxQMz
         i5UI1RS2ihvvrPlIDXOLDai4T0EtQmnuwCan+mAHHLxLYp2C1h1+u8bAafQP6Q7K4rQW
         hQUPbpM6E0Nvaaa9MAk6smpTWS5vlHd1H8w5v5r1qcAE96MToUoyYo9i87l8ErlHk66x
         s2rmxeuFM9K6MD+8fpqYFR7AgBQGV5NtQAaD89qH+s/wspBnmYBS0Dm5wRji0niyiTsv
         7XIhgF06T4KvIbo7D1UcB4FGMm9kllRrmIIx8oYrnOrHe3dgtmQBH3GYDRY7tde8X7yB
         fZ+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778150; x=1795382950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        b=xVtLiVPRWLpwqK1qzdnX/vgyaSB1RmgMVHEXfLHaFAgyKG9lSYUrfPKetY+VaNjLIZ
         Triws1FUK6wzAy7/n7i51KSxWseFUGiRgXxJxvRqvN1u79omq5NRWn2+vLX+uuvW79Da
         kqRZ+H+Jkr4fYL0aVT6Wb73srkVX4w98BVdMmNkVlcM2HctnwGWmyVFbVhwutPPmwklI
         KXXD6yKeAiRVoaotZCl5TdmgSxbj7A2reP7lnpROt8AkokFx7y+bDa7lFOmCVoGdZwxT
         7wyWO8S4aQf0wMgosKSXOrOU6JAuYyGo1flO9Ad/rmnULonRkty9LnICMrIod2kSK5U7
         xvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778150; x=1795382950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        b=Qx3wIiNR/M81Tsxnx4RB91fO7MaVRGPnAXM5i5UOwxkCb2Ttg089aXl13kQVqaJA38
         kd7qUl37QONxPWifXWSbk7feSxboF9WqH31IgPeIVswrT8152pq621xugoW4voG9kQA1
         JReejTIPyrstWqrkQmWSqVwupnrQAot17nGg8+3X+FORXK3c1iLfT4dJ59sV6CyIhJPA
         NtxEzWT/Oc/m30vCtcWpII5qSpi/4C+qJZ/E0tZJAnc2/V6ZZECKlH/tGOCj2DoVI82M
         AvfuRxYOO9g9wQG4CuYsbVF8xbzXRar8QQB8H44+smygFnnZ3dN6amfad8BxhIoR4wxD
         aeqw==
X-Forwarded-Encrypted: i=1; AL+hErFEGMQUzShlgxjI+bjyHB+M280pb3byldxb32YQYT590yVuzfJEdLxFJETk1BCA6IrHeDIEPWgRdEypi88a@lists.infradead.org
X-Gm-Message-State: APuU4Z9fYexpOKHi8I2VculYgfdHV1TyLV1wVbTzrvXHzfFX4Rno9OqW
	2uLaxWw2MsBXmiAf9Uh4/yoKpsgmMAI027HKGzNR+TVoLkefD4oR/MvWpcwGVW7xeHiACY6Ed+l
	aVuDlMDmTOoKa7fXAoyzDEsWKfThkn+o=
X-Gm-Gg: AYBFou2uUplKSjQ7w+NSkv2H1JwY8omlI3Y3rvVSFU6auG7rvdaNbMtJjJKpJkHr7mq
	HzVVTKJAH+KRwASRRoNBavFrFQAUYIRdRvnB9dplhH/3YRafXzQp+HxwXCUn2kC9Q2bd4WqLo//
	zq7oaCJvU23QzJKb+dMXylaogLY1oohbaZSTlzBjaAHQ/z3YQcc4dxeL52sdqC1Mxwmrhp7Ox3/
	4Dsne2dzYNXoCTW7tDCpI4klBU1ZM1prBAULbFVpBo3a3U4A0LwBHZj8voi04tp8qK+gBTSd2wv
	UtHgqmBS6SRtklzb9/nqmiMBmRqUdxxu3piSP8de6yBuPyGsGnb/h/cwtbrFW/u2SlVrAzdY7Hs
	OHtDXnrnRstoJdzpI63kiAdVQhbET4C/XXpRakLdpKZyjVzg8ENW/e4YZc+Tjsr4ONtAhMA==
X-Received: by 2002:a05:690e:1c0f:b0:67d:b0a1:c9c3 with SMTP id
 956f58d0204a3-67db0a1d2ebmr1094277d50.32.1794778149875; Sun, 15 Nov 2026
 13:29:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:28:59 +0100
X-Gm-Features: AclHuK_mrwYOs88jQPUihYmd8k-bNvXzF9c0J2wcB0Lmj_2uDGdqbd4QCFY5NB0
Message-ID: <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_132911_367341_D7127D4F 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMTgsIDIwMjYgYXQgMTI6MTjigK9QTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlA
YmF5bGlicmUuY29tPiB3cm90ZToKWy4uLl0KPiArICAgICAgIGlmIChneF9jYXJkX2NwdV9pZGVu
dGlmeShkYWlfbGluay0+Y3B1cywgRFRfUFJFRklYICJneGJiLWF1ZGluIiwgIkZJRk8iKSkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIG1lc29uX2NhcmRfc2V0X2ZlX2xpbmsoY2FyZCwgZGFpX2xp
bmssIG5wLCBmYWxzZSk7Ckkgc3VnZ2VzdCB1c2luZyB0aGUgImF1ZGluIiBwcmVmaXguIEFJVSAv
IGF1ZGluIHNlZW0gY2xvc2UgZW5vdWdoIG9uCmFsbCBzdXBwb3J0ZWQgU29DcyB0aGF0IHdlIGRv
bid0IG5lZWQgYSBTb0MgZ2VuZXJhdGlvbiBwcmVmaXggIGluCnRoZXJlIHRvIGhhbmRsZSB0aGlz
IGRpZmZlcmVudGx5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
