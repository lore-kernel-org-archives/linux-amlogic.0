Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C452C369AB
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Apr 2025 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byg9MGR4FwX03V++R1V1I5VBPt6fsb+mpkqqcCgVzCk=; b=Bt/vem3oaT2J68
	P/FhnNYH0pwEbA0dtJe9tse3ls2GKUS/BjxaCeN5fFCZJgBVyAnsuGwx1f6SXmt5G2SSUywtflpLE
	h/4IRB1no1fKpABC7w0MePpAOZX9xLiPfHd7Kq9EAhJeAL12pVXU8fbwnvX6aelT11tuNzg3Szmny
	Vzx7bvXJXbm+THxGvmoE8efs+nJumIkB2jHIaEDtwvsacZPwwg+YKBp2doHPRBG7kGUQjBW9UMCuR
	2phZG8N+pvvDMdxC3Gwd95RaMFJQtxdeoehbv7W4Q7ApjQy8YPTHs/LCd5UVdGswRmKkQyQ6LnJZt
	qX7IjaUDJjLb7npxbdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bY5-00000004yDd-4BAp;
	Tue, 15 Apr 2025 08:21:41 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bMh-00000004wFB-2Mji
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Apr 2025 08:09:56 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso54226021fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Apr 2025 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704594; x=1745309394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=;
        b=v2WiGbVeNVLqZt/OpsTOQGKwjCgGV5by1FZH1aDsVUK88qr0tNalL9lBkC+v1M5MV0
         C/uAQAd9QgVhdxl2S4K7YmFh2VUa5nkMNhcNJ/n843U3dA9GXqviBSioASJV7YrQxC8Y
         mK/WGtj+vyzr+O7j4/mcP1p+O7L5sS4zALSHq2y3+x+prmYXAlwbz6H1UioJ/3z9owgw
         +/hn332X3p+90y7CHQbVA5imzcNGE6ZtPdQ/YEuvpSJG8cls7KTMx7etzzKXTqlEYBEX
         lC+uBkmr2GcSO6fYRr5IHZ1zOfGf5+++JAjM99I25HaQ8cGgPNRuhpc1ec5kUS7QIulm
         0r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704594; x=1745309394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=;
        b=ok7rgJXjtjLUpIMNAu57toWCCnhShcZlQ3bUDNTtD204jvgWn6Djq7qBU89PFM3Z1T
         LqljUzivZCg6k769iSXwsFjCGIHPru4SVTf63bcUQH/HQqJApJcRbH43aKk2pj5bUlA4
         80jnk/Uo3tREd1wEicUQ3e44q5wI3BqRJfwdSkIpeFVwfMOKfPY32g856bX0dF4Oot+l
         zooZ4CaSRIQOWdSSVoOT1aPxm2a7yIEo/xFSerTOzPtcKg21dAf4fYLMWmUMMQrKLiqu
         hcAplFKk+MrpVpl+7uqa8HRL60ExbobzE7yw3sh66FcQKYKdgImD93E8CRFvSKNbc0yD
         pXDw==
X-Forwarded-Encrypted: i=1; AJvYcCVJdaJJ88X0QrMN6YlyCriTv8PbiJbkfd+XNd4oECsNZmFurXyo5FPwG3XxJriSLW2DRLnApfXemj8LVqIn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx94cV7vPqHhvCs32IqrqL8aE7YTMNFQLO68iIc4qdV0nxpMj4T
	Ku+/N9OCGL3dL4KSXmNfpLBFQ64moSpltBNB2yEK3aSVmTBfRg/qrmZShi0wJ4+hQ74Zv6/LFC4
	QH5WfNehBnWLTzaLb4tZVCYYKE+YKhv1IDh8n5w==
X-Gm-Gg: ASbGncuv3PryluhzoZXdcbgSr/j7I17lt2i78Mbnz47oPslg/yKL1TZtQXgocnNKzjv
	Yd8+uyUt4ny49xlUfddwsnam+aw8tZVoyBetQ+1h+MMPghi8dRxFCS2TzM8P4UXbsfnLDEd2d+b
	RB7H2aipFigRazw+JaL/GDJQ==
X-Google-Smtp-Source: AGHT+IEMlMqsPAGJBzvZT2lPJQosRhpvoETScw1sCKukc31T9fTkGic2VsMp5FRUxyJuWIZeSw3pyLssyZGpIRA+vOE=
X-Received: by 2002:a2e:ad07:0:b0:30b:a187:44ad with SMTP id
 38308e7fff4ca-31049a80842mr52529351fa.26.1744704593653; Tue, 15 Apr 2025
 01:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org> <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:09:42 +0200
X-Gm-Features: ATxdqUEiPhEWajxjZ0u616Ca2IYOkRClv6g0V-9rh2iDXiM0Iv0_Uzdx0X_IW4c
Message-ID: <CACRpkdYJNLwKFyzjzOeuZofBzoHci39UH-0H5cEM=97koyW1FQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: uniphier: Do not enable by default during
 compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_010955_627158_5254B4E8 
X-CRM114-Status: UNSURE (   7.23  )
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

T24gRnJpLCBBcHIgNCwgMjAyNSBhdCAxOjU34oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKCj4gRW5hYmxpbmcgdGhlIGNvbXBp
bGUgdGVzdCBzaG91bGQgbm90IGNhdXNlIGF1dG9tYXRpYyBlbmFibGluZyBvZiBhbGwKPiBkcml2
ZXJzLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtv
emxvd3NraUBsaW5hcm8ub3JnPgoKTm8gY29tbWVudHMsIGJ1dCB0aGUgcGF0Y2ggbWFrZXMgcGVy
ZmVjdCBzZW5zZSB0byBtZSwgc28gYXBwbGllZC4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
