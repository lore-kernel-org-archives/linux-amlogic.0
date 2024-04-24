Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5EDC4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfMshONZH2nrReHzd9Nq0I2ND4HkRN1hpo0hz+0yJMU=; b=nor5X7OtBi5C+S
	jrQhnBRyGrjK+O8w6WSqCmopaSk4J587kg3qUr24gNdhi/RywfKPh1IzO1+N/b94o1jBxWvoU235p
	VCcQaRTPDyofi6IzjVrNHE5o0QMCoExUynTkdAkdBPqjv9XBp84CVl40bescX6bLca722OIEv/8rE
	Vo/hrAXaOb6R3IjZMNMNokkvT2QzRRUkBz7tTE3mqTvgrakYCophuzcjSFVxtzgNQMRSAC7W6TEJq
	v6CyhE7j0W9qvQdPQ+wlxjVwI568vgHZ/Hpkd94LS250mGJrASk7vHWPv1eCRbeCaQm/tKu82NMeT
	+asatAOXQb9WT8SFd1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzd58-00000004MOD-2I0U;
	Wed, 24 Apr 2024 13:54:42 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzd56-00000004MMA-0FHN
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Apr 2024 13:54:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-349545c3eb8so5027730f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Apr 2024 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713966876; x=1714571676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqG6EAw4hfK6YDk87ISdjEyvEY4/LHJcMlZc2x8R9og=;
        b=plPpkyYV1Hejl+Yid2vO3d8a1cCUGKgJ8h5LoggKhQT0mUMEQiJzWEIFCT6Wl/H2cu
         AaTDX2yi0zVzlgxAhPuDDmAbDcOhgJvnl/c1+Sw8Ftlcp24bUF1PhjEsqhskTixZW3nG
         UGcKn+Lp3Cv916AJLDH/k0OybcNQPxNJ6rG/q32DPvuFmmZShrupeeDwh5fktrkkUgRp
         ueRbIT9KlMCjB1DUtgW1YD1LfLKBt6Bc7qxjTSndCsqVsk7TOvSL1rzPePvy1hu/Sy0G
         227kLS3MToBRFoQ3+Bvs4NqO2kgfQ/lfzN6FAI1XTm0X751g1Xzph09uZtadouAPdhwT
         rybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713966876; x=1714571676;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nqG6EAw4hfK6YDk87ISdjEyvEY4/LHJcMlZc2x8R9og=;
        b=k7dESDvRucyenwMaADuzwrgY2LodXYPDoEBU9i+UfR2igyYeIGPIFZyd6Qw4ElEINN
         Tis9qPi9D3sX+DBQqqKrNlO5wGNVppgaxvekJ0SHzorfgl6DKwveBmsBOLVPEnmlgbJx
         oc3TSkX2b1Nej3mjxpzmCpn0v35AkQBvxO6FVwbobRurATyfO9wCuzLhQKV/nz3QBK++
         dX3zfFq4AWJsF7AmtaY2Qzi03tjKL0vq/nFaTvUIeML0eVRFgurmESMoGzJMunIEfISh
         I9BV//OEmuVnuktQozdmy/MUa61u/JybHanEMglMxewyvWZYL/bermOzcwaHBhoirfB0
         ogpA==
X-Forwarded-Encrypted: i=1; AJvYcCUCFu0h2X8WBtMSfjwL2w8aj12LRlsgS5MvsGWbVOZ0WV/69XWU7tQoBp2++duAz6a1bXylF1eG6HK0s44jxfPO5seK0mW5KKdrGcDu4uvXhts=
X-Gm-Message-State: AOJu0YzJYe1m1fiVjw8GoA4BgI9mlf9Ft1hSvWGK3KM+sFWlRcBXeJdj
	B+sxaodi3gN1aLVD17R0uG4OtYjI2QvP+dsOh19yb+SE6Z19NWbRRkBOxrdiJPY=
X-Google-Smtp-Source: AGHT+IEOznvXT2DbTMtec6cIfPbt6cznBYSdTY7urC4yVUpfeeSzluMWHpxbXdtlOl9wyfNYXsAK/A==
X-Received: by 2002:a5d:56c2:0:b0:346:251a:396d with SMTP id m2-20020a5d56c2000000b00346251a396dmr1588928wrw.51.1713966876400;
        Wed, 24 Apr 2024 06:54:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ab48:1b7:631c:952a])
        by smtp.gmail.com with ESMTPSA id r14-20020a05600c458e00b00417e5b71188sm23952306wmo.34.2024.04.24.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 06:54:36 -0700 (PDT)
References: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
 <20240424-s4-pwm-v4-1-ee22effd40d0@amlogic.com>
 <1jil07f3ps.fsf@starbuckisacylon.baylibre.com>
 <ikwqq5veuad7fehk6qrpebevvn2ezuxwm3h7agloqeomxc5cbg@kj3be67luyxm>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, kelvin.zhang@amlogic.com, George
 Stark <gnstark@salutedevices.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Junyi Zhao
 <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 1/2] pwm: meson: Add support for Amlogic S4 PWM
Date: Wed, 24 Apr 2024 15:53:44 +0200
In-reply-to: <ikwqq5veuad7fehk6qrpebevvn2ezuxwm3h7agloqeomxc5cbg@kj3be67luyxm>
Message-ID: <1jbk5yg92c.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_065440_124702_47346C2E 
X-CRM114-Status: GOOD (  11.61  )
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

Ck9uIFdlZCAyNCBBcHIgMjAyNCBhdCAxNTo1MSwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IFtbUEdQIFNpZ25lZCBQYXJ0OlVuZGVj
aWRlZF1dCj4gSGVsbG8sCj4KPiBPbiBXZWQsIEFwciAyNCwgMjAyNCBhdCAxMjozMjozNlBNICsw
MjAwLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+PiA+ICtlcnI6Cj4+ID4gKwl3aGlsZSAoLS1pID49
IDApIHsKPj4gPiArCQljaGFubmVsID0gJm1lc29uLT5jaGFubmVsc1tpXTsKPj4gPiArCQljbGtf
cHV0KGNoYW5uZWwtPmNsayk7Cj4+IAo+PiBGaW5lIG9uIGVycm9yIGJ1dCBsZWFrcyBvbiBtb2R1
bGUgdW5sb2FkLgo+PiAKPj4gU2FtZSBhcyBHZW9yZ2UsCj4+IAo+PiBBZGQgdGhlIGRldm0gdmFy
aWFudCBvZiBvZl9jbGtfZ2V0KCkgaWYgeW91IG11c3QuCj4KPiBUaGVyZSBzaG91bGRuJ3QgYmUg
YSByZWFzb24gdG8gc3RpbGwgdXNlIG9mX2Nsa19nZXQoKS4gSSdkIGV4cGVjdCB0aGF0Cj4gZGV2
bV9jbGtfZ2V0KCkgc2hvdWxkIGRvIHRoZSBqb2IgYW5kIGlmIG5vdCB0aGF0J3MgYSBidWcuCgpH
ZXR0aW5nIGEgY2xvY2sgcmVzc291cmNlIGJ5IGluZGV4IGluc3RlYWQgb2YgYnkgbmFtZSBpcyBh
IHJlYXNvbi4KCj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCgotLSAKSmVyb21lCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
