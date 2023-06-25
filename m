Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75071EB64DD
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 20:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/XPqMpPzk/wO81czvxb810Kx3p7Lr1Al958zeEHsOA=; b=BFsDMDJ15OUhM9
	+CJRmUrRzKHPt5G1wfKLMTgBiQYBpoyXVwMRaOECoPUtygJh0AT063IgEHw++lda0Wmxfozm95Unp
	Tyxi1leZloVBShF/xFGUzjd+d4wWhZQtGqmIWreMnyRukkA8yng22NEBIrGUzhJjkrgEuSbb8km2C
	tee5JulnDflvaP27mx18QsWeRd1k6CZ0QV9wqhCFxZsbKtEBrZswDL5UfprxC3Sqg9yiYs0SkY7Nh
	E8RyEXXBL6WDz46swdPwpl8WWpT8BN8aliT8B+rTGantJ7zFd6Eu22diUz8mY/lD1842DcMJ7RMrq
	AsDM+nG68fboG6mci6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWU7-008ewy-2z;
	Sun, 25 Jun 2023 20:37:23 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDWU5-008euf-1H;
	Sun, 25 Jun 2023 20:37:22 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9875c2d949eso399802866b.0;
        Sun, 25 Jun 2023 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687725431; x=1690317431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPEEXOayrC5kIElDx6mVXihAHFqvW3pl2AK2GXH8Dz4=;
        b=XFkr/2ryDfP/kOgJUJjAhpDf4wBta7e01Hc9IRRavETIlHFtcyFKkMKrICgZxWSTCg
         wAJ2PSu99A6Q9qlsMumwpHvQoztVdQD79miZAi6j8jM1e+z/70OaWA5Xz5UFiRk+iUwX
         rfIgJ5vhUwMQdh14EjzPY9VsZuLuR3/inz1yJslvQeiu7krwFytZo6fcYgrmy3IxTgcs
         d3kMxXQfamVYcOx3WEcDB+Ft56pud1zDysYg//p5uNmt2X7eXssmvDlnoSrl9YyA5ygH
         9o60y8C93iJOQ0E3VX7N5dKB7h93dvR2cFWwf4rVDWka2R1tfaIZrGlwx46+fUZa549F
         r8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687725431; x=1690317431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPEEXOayrC5kIElDx6mVXihAHFqvW3pl2AK2GXH8Dz4=;
        b=DtcLZLhVjBhRMuRt1jaA/4juZng/wBwBoBOuG9YEaVl8lSZZYJ6ZLuAgMCiNxYXq6P
         X0nyuMupSdMCAn9Wj/coYUbbP7nUovdunRc4IdWqWPwViPBd1ec3AxdApkhr0m4I7Qu3
         mMZTd9f0GQDuwPpTNiyVGgVYAuqyhlHQaxXHaHDryq6qjt6ZKXO+3RFWLYG5GtOLsfoT
         6NohJZa/30O6CsZWUJkk5MDXcsKNeB3+sDvrsAsSaDbrVLq2SQTXjMlPl8wDqtw9npzF
         2e1G2O+9WDP1uFw6wiCfrBTkbxvNCG11Xq9fwQHrvNzbMoeqsiuJ/ZT3Vh5gDgAANe/3
         rzvQ==
X-Gm-Message-State: AC+VfDwyXB/ZTbA6ntnfrEE6A0GCnHD1EuTt/Ypmv2GZPARyuM4XA85Q
	7rARR9jsnPSbiJ+5x/158MU7yRecK/V0DUt769s=
X-Google-Smtp-Source: ACHHUZ4JXpMZ9XyyEpdax0IaCH+S8eNV76nhvfHU4BK6OWDEYqE7Bi4HV7SBpmZkWKitYD5YU3xkHDKGs5bBac1p3H8=
X-Received: by 2002:a17:907:a0c:b0:978:8e8c:1bcb with SMTP id
 bb12-20020a1709070a0c00b009788e8c1bcbmr25059662ejc.43.1687725431246; Sun, 25
 Jun 2023 13:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230623022334.791026-1-gnstark@sberdevices.ru>
 <20230623022334.791026-7-gnstark@sberdevices.ru> <CAFBinCBv993Xv_wk9fE-U0Tw2mzTB1z22Tj6x8Uy1rRw_dztng@mail.gmail.com>
 <67d2a9b7-ac7b-57f7-d053-cff4bf0f9d2e@sberdevices.ru>
In-Reply-To: <67d2a9b7-ac7b-57f7-d053-cff4bf0f9d2e@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Jun 2023 22:37:00 +0200
Message-ID: <CAFBinCCzx2e92S-cQp2CVup4hr6Ge12uCJ3Qh0+sqNVFRWkv7A@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] meson saradc: support reading from channel7 mux inputs
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, andriy.shevchenko@linux.intel.com, 
	nuno.sa@analog.com, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, kernel@sberdevices.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_133721_433104_A011B87D 
X-CRM114-Status: UNSURE (   9.25  )
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

SGkgR2VvcmdlLAoKT24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgNjozOOKAr1BNIEdlb3JnZSBTdGFy
ayA8Z25zdGFya0BzYmVyZGV2aWNlcy5ydT4gd3JvdGU6ClsuLi5dCj4gU28gSSB0aGluayB0byBy
ZXR1cm4gdG8gZG91YmxlIGRlZmluaXRpb24gb2YgbWVzb25fc2FyX2FkY19paW9fY2hhbm5lbHMg
YW5kIGtlZXAgdGhlIGRyaXZlciBiYWNrd2FyZHMgY29tcGF0aWJsZS4KQWNrIQoKPiBJJ3ZlIGp1
c3QgcmVhbGl6ZWQgYW5vdGhlciBtb21lbnQgd2l0aCBjaGFubmVscyBkZWZpbmVkIGFmdGVyIE1F
U09OX1NBUl9BRENfVEVNUF9DSEFOIGluIGNoYW5uZWwgYXJyYXkuCkdvb2QgY2F0Y2gKCj4gSW4g
ZHRzIGJ5IGRlZmF1bHQgY2hhbm5lbHMgYXJlIHJlZmVyZW5jZWQgYnkgY2hhbm5lbCBhcnJheSBp
bmRleCBub3QgZXZlbiBieSBjaGFubmVsIG51bWJlci4KPiBTbyBjaGFubmVsIGUuZyBNVVhfMF9W
U1Mgd2lsbCBoYXZlIHRoZSBzYW1lIG51bWJlciAoZHVlIHRvIGVudW0gcGF0Y2gpIGJ1dCBkaWZm
ZXJlbnQgaW5kZXggb24gbWVzb244IGFuZCBneGJiLgo+IEFzIGFsdGVybmF0aXZlIHdlIGNhbiBp
bXBsZW1lbnQgZndub2RlX3hsYXRlIG1ldGhvZCBpbiBtZXNvbiBhZGMgZHJpdmVyIGFuZCB1c2Ug
Y2hhbm5lbCBudW1iZXJzIGluIGR0cyAocHJvYmFibHkgbm90IGluIHRoZSBjdXJyZW50IHBhdGNo
c2V0KQpUaGF0IGlzIGFjdHVhbGx5IGFuIGludGVyZXN0aW5nIHRoaXJkIGFwcHJvYWNoLiBCdXQg
YXMgeW91IHNhaWQ6IGxldCdzCnN0YXJ0IHNpbXBsZSBhbmQgYWRkIHRoZSB0YWJsZXMgYmFjayBm
b3Igbm93LgoKCkJlc3QgcmVnYXJkcywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
