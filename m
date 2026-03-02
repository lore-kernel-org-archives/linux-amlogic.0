Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610B6E9B36B
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2026 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQLJkKLBs4nujyvrtTfnRDe7W3n45iSNTGWb/U8B/Ak=; b=FHxd5BAvJSYfTJ
	JE8B7VjTRW3xwkXw7CJYuf1MR9lPMSBjRzWwkoBQfegwPsoeRxl/y6z3So+IDBw3dwFiYRA/G7cqX
	hDKNtMeq3cH4RHSBBTERzAr94tpvslZ/W3SJrlm1Uw8EhrW4ZE5JTQxva8/DXLpHcKkKPjVBh4VOL
	ZlaZhda9+gvZVJkxBdlWnula06b2J8jKiognXnts6vYHpzEwfOzX+7Knq3sxVvbPMrFvP8aphiWzJ
	pSzR1aFKfJ0r+/3cVIz8C0KLB21bB6wgLL9lPRtKmpaJpeJGugVlbeFLiczxl8pNgL6FZsP9nm2O9
	tFiGtW0c5UEBLat0EaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1mx-0000000CreW-3zQW;
	Mon, 02 Mar 2026 11:50:15 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1mu-0000000CrdV-3XeD
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Mar 2026 11:50:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ad21f437eeso32210705ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2026 03:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452212; cv=none;
        d=google.com; s=arc-20240605;
        b=grCyKJ0SHBsKR0RFwb8xx8AecO3xTq3HkLgduaWh6lgTu5VuL1DTCtgGrFasdhb24r
         AW+BAq67q6EDigydIU/Nhp2o/13AHJUJD00lDoyLXogNL4CpYRCF0cGdGFCTryyfAA7y
         ryONsL3JdLSqcpMbw4A9sMg5a9dCSsx564LfSxAZsU1S5K5purTZOJC20vzHw3J/F6HF
         Qmi1+ObV2QCO2qbjNrHdtd637Vi0/gm+Xp4KGMRc+h/4IlQh5jK8yEQJjfEak/E7pwBk
         xlsCNuKq1t8H/m4Ph+yWaNvYOoGseC4HWkLjc9JulrP5oONYUgnWA5rjLtLXrbHaboi3
         lFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5qAHqn3E4KqdIyv4rJj7K5venbc/uUWQxC4/jFfSWpw=;
        fh=3GGYzzHwF6ovQnzscRi5E93XMxc9z2AcSdNGUhkA3B0=;
        b=kHD9tVjH00X8gtUUrq2Ae5VRj14dkYPS/8ORhuuHyCXM85MemVjYI3ZaddrnuyG3i6
         6l+83WwsJ0e9+0f7vp7yU2g7x4SGdlRuYfA3KteB6/iP9BM7ARvf2VyMJw0gMSM1EZDk
         GCHxmVjgVzoa+X98Va8buPdK2nqJuj9ce2JFOlU+USiALs6BiQyv973ZfFELPhhT+Byr
         KiAGBnvpderIFWhN/OabuFYjAiBHOkkl1MS6S20QLSZGplaTAdEkht6+TD1T+y9fGm9f
         T8Hn51p3SF+yW6S5z6kzDhZXubMTIVy5Gydx2u8iaIfcu9miopQKpR2kcP2JtUbgrqTW
         0XTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452212; x=1773057012; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qAHqn3E4KqdIyv4rJj7K5venbc/uUWQxC4/jFfSWpw=;
        b=CI0KNr6JDm2d1E3yyI8MOG70GtfcPPGkyKUXlexoP24lfIcBmt9wcVlo6l8l/fteu8
         qQhoT3B/5tbuHUA8d7j5FNOjVVvtUpLC9R4tnLPxmGNinLqDtHD7Z9ftt+/IQQhIy/rn
         lG28f4VjGll5O5FBF2IAwT4vVICiidLfWDU9mFiJ3n8tYRp36DruicErDV4uyjHhRk8/
         hHMCiAxx/lbnsICb1slN46EHifqzXP+f3EMZKtCcGuwSI1zFY3ELmGdQwEhHq1LxeYuD
         NzraULiiUhkPeqFYeWwYhvIPHAPkOcGAR5oI2K+XJpEcgMAwQ615PC4RRO2+X5jvPRmo
         cwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452212; x=1773057012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5qAHqn3E4KqdIyv4rJj7K5venbc/uUWQxC4/jFfSWpw=;
        b=pTvlzC7v2ymddzxiqFWR+mroEIO//LS1FSDnBnjYd0m/q/JHt8//QdDGcRd6IjBlHJ
         2mQgRwP0limqnVj1SmMNVwh7GXrhgkpFKMhHA4fsg+XcF/NmmtG98E/7JnvEF7fsmGgm
         /yBOW6gGWAe5MioVcdol/9p9GFbc1DBpi4JDSVsT1mQ7Q4pKi5vdM/7IfMSlqa48Fa2V
         qP78x0w3OZKOExFAGsAOrCHKjYny2ixYFAJCzLcViHNCU91Nk7vio1dphsRCtsw3WZpi
         La0uJ/ddTW0IdWYkDDQJt30DP+gppIKm2Jff53uj+IQUKOHp+niOaLHiCTU9sGGaZWoh
         rUew==
X-Forwarded-Encrypted: i=1; AJvYcCW4nnPc4PvM12p+GaBYLG70Hh5rLLogfe4sl4KovaP0ObmYw0uoU0OVquSiCnuzrMmFO4GFKZgWbiZ7+e+u@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi7ddv3fgGMo/0CPSNkQzO4l0PDazAJ0n4Z/FD0tMvRFkFJoyN
	6PNSjotrYTtxbZ1DNmRr24+DA0KGPy2LgodA6dBfhCuc2d6SfYHrySkaBnS56aB5veeACmXSrf7
	YcC6awdbz7f9IuEOuBZ05XwOgE2rpIfI=
X-Gm-Gg: ATEYQzyu88Lu7uI5W91cbbk9Ke/jTRPURZdso3m66MVKbBFJ1UJQpnXpHT0RCRAMC/z
	7Xul73m9SYV6J6/T+t7gGYjK76tIiny5gODHNlMZEQz1UKTRSh7m9Z63W61AQaGKrzGFMBiXojv
	bimHhyeevV6iDv+eFKhR5VcVa9yvOp/RRGAYypPKaLbGvH3Cnm+KS9SPkWndSru9PgX/y2jTdVz
	lNDJYyIPNBrXIYvajvs3O7I08AFs4wHJ3FkF1pqBq9Jx+MySXf+7ewePgttxnCg23JBLvxFxP9d
	VK7PWFlJ6DzxTPxWUf6av+hqV0BPHAPA0nx20OIC
X-Received: by 2002:a17:902:a508:b0:2ad:da28:8c7a with SMTP id
 d9443c01a7336-2ae2b6500c4mr72503075ad.8.1772452212244; Mon, 02 Mar 2026
 03:50:12 -0800 (PST)
MIME-Version: 1.0
References: <20260228065840.702651-1-nick@khadas.com> <20260228065840.702651-3-nick@khadas.com>
In-Reply-To: <20260228065840.702651-3-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 12:50:01 +0100
X-Gm-Features: AaiRm533eCqYaaq7O8tndrUfX53W9xWv3UJ4VGBrO0ObYcu87bP8ebrDMdBbpZs
Message-ID: <CAFBinCATMbC_Q85QHv_=v1cdiNjD-+X1eR=eZB_0Yvj7DC4LoA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] iio: adc: meson-saradc: add support for Meson S4
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	krzk+dt@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035012_885578_85249CFE 
X-CRM114-Status: UNSURE (   9.04  )
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

T24gU2F0LCBGZWIgMjgsIDIwMjYgYXQgNzo1OeKAr0FNIE5pY2sgWGllIDxuaWNrQGtoYWRhcy5j
b20+IHdyb3RlOgo+Cj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBTQVJBREMgZm91bmQgb24gdGhlIEFt
bG9naWMgTWVzb24gUzQgU29DLgo+IEFjY29yZGluZyB0byB0aGUgZG9jdW1lbnRhdGlvbiBhbmQg
Y3VycmVudCB0ZXN0aW5nLCBpdCBpcyBmdWxseQo+IGNvbXBhdGlibGUgd2l0aCB0aGUgRzEyQSBw
YXJhbWV0ZXIgc2V0LCBzbyB3ZSByZXVzZQo+IGBtZXNvbl9zYXJfYWRjX2cxMmFfZGF0YWAgZm9y
IHRoaXMgbmV3IGNvbXBhdGlibGUgc3RyaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmljayBYaWUg
PG5pY2tAa2hhZGFzLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRp
bi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
