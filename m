Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E067C77B61
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5uC4ThyLgywS1dLScjnWvpacjJj+KXLlbkShJVd1lU=; b=0lETULiS/z/Hqj
	KULIaNx0+nH3BPJijsXL4wuUXhguTP5WcdL1TP4GL1RiZcHl+k01GJCusF+OA2ySiuj2fU0Q5Ptou
	OUHLlj7PjnguvMfbgHeJBSN6ZSfSiA6fCb5bbc/8rVvIfpe3qCAlSfUKDdMRt4nfRQTxReXoRGPVm
	vINXTkq+nzIcWOuB+BxaRnLfRLEeFIrwG3LVCla2UsawfhxAKFpaOiQ8sEb9QQQfCxq7Lkh6IMo9F
	WFkRJmefXpyXf4DEoGG3frE7kpRMwEJSNxuFRoswSk/oDa0tPnuvwL5t3No8wlhlKf8SUjgaCG2NY
	bx/su7jNX/Cvyh3XAMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptT3I-00G2Zf-0J;
	Mon, 01 May 2023 12:54:48 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptT3F-00G2Z4-39;
	Mon, 01 May 2023 12:54:47 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc456cc39so1850401a12.1;
        Mon, 01 May 2023 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682945684; x=1685537684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvMlMk+g9+vzaZ1OWKXbFrRdjkHE+cIOaEaWSWx3yeM=;
        b=h07jkgAH2pyhCZVKjt79SZAaEYWyQXm6TWqpoKmnzK6zYzTv2oE3Ob8cZEeBvw/+Bf
         8IIeRtYzTay148BY98KudqhCgDU2d3PY2qSr8votk+DQORTNKq7pSMOfZqCR6QKNXpgt
         WRc7gqG+Z7zPhYAp6+k255qxIDHRkXatOvFP1038WhIIwdzGyTpdXCOh8uqKtrRz0So8
         5fEq0l7MAt6hmohkQ1I2JU65EBvkHOgoi+K684ScgtehYOq0/yxL1EmoBqDdZ8KwVDO8
         G37ZbyNszv/K2utdFde8ObsNyEjEOxMRfroBwx/CZS5SQInEGHoTZ3WAxHdVNJugQLXE
         Jorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945684; x=1685537684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvMlMk+g9+vzaZ1OWKXbFrRdjkHE+cIOaEaWSWx3yeM=;
        b=ALe94ZFOXmL83voCGqycqhb6tbQ1OHLGbaCjlLXFyNNO/zzC+9uB2NIOBGL1IitU8h
         X3aoS3tnjjmp+jCoP2/9KZ4o57vzhSl7vuv7LfwYM/JrOj48txMECEavb47RD4lCuFDn
         tPmyIGLhVyVZWhMSJzcoSK2n6otLTo/nTb3KPYJf69IYzhx9qHIsz8fwkG77ex5+Ns/b
         Neq2TUaAuzgX7P8DM5y9ZXIm0wNdZr4clhvv4LZ54wGf8K968AHOBfQQGD4e2HLaGxtc
         s5IJDSRm40usHT8G2bLEryhVObLuN17h1kE/Zk/VeBLti/gm6RuB28MvpSczvO4n55cX
         y/bw==
X-Gm-Message-State: AC+VfDwLf1Ptb1uK2jBQD3tRHRyRP/EcRFyGf/9AZic/hSn221Zkn5It
	eOWxm3vzXE9TMX1jJMqU1CJ8Ey5MVXN67WxE204=
X-Google-Smtp-Source: ACHHUZ6/a2ChTGXpyoAxt0VdAT7RdfEXxC/8hthQRDyOA0Bawg7ngmFYluiEfZ9SB+z5QTcA7urN8/4WQOwEIxw+54M=
X-Received: by 2002:a17:907:360b:b0:960:ce5:20c0 with SMTP id
 bk11-20020a170907360b00b009600ce520c0mr12214296ejc.20.1682945683886; Mon, 01
 May 2023 05:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230425165624.11999-1-exkcmailist@inbox.lv> <20230425165624.11999-3-exkcmailist@inbox.lv>
In-Reply-To: <20230425165624.11999-3-exkcmailist@inbox.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 1 May 2023 14:54:32 +0200
Message-ID: <CAFBinCA4c1qDC5=NWJKEMkTh5HfhkqpgrpetgEH3kJTY_qLVHA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: meson-gxl: add support for Xiaomi Mi
 box 3
To: Karl Chan <exkcmailist@inbox.lv>
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_055446_018024_0A1651B1 
X-CRM114-Status: UNSURE (   9.10  )
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

T24gVHVlLCBBcHIgMjUsIDIwMjMgYXQgNjo1N+KAr1BNIEthcmwgQ2hhbiA8ZXhrY21haWxpc3RA
aW5ib3gubHY+IHdyb3RlOgo+Cj4gRnJvbTogIkthcmwgQ2hhbiIgIDxleGtjbWFpbGlzdEBpbmJv
eC5sdj4KPgo+IFRoZSBYaWFvbWkgTWkgYm94IDMgaXMgYSBUViBib3ggYmFzZWQgb24gdGhlIEFt
bG9naWMgUzkwNVggY2hpcHNldC4KPiBUaGVyZSBhcmUgdHdvIHZhcmlhbnRzOgo+IC0gMiBHaUIv
OEdJQgo+IC0gMSBHaUIvNEdJQgo+Cj4gQm90aCB2YXJpYW50cyBjb21lIHdpdGg6Cj4gLSA4MDIu
MTFhL2IvZy9uL2FjIHdpZmkgKEJDTTQzNDUpCj4gLSBIRE1JICwgQVYgKENWQlMpIGFuZCBTL1BE
SUYgb3B0aWNhbCBvdXRwdXQKPiAtIDF4IFVTQgo+Cj4gU2lnbmVkLW9mZi1ieTogS2FybCBDaGFu
IDxleGtjbWFpbGlzdEBpbmJveC5sdj4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wg
PG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpOb3RlOiBOZWlsIHdpbGwgcHJv
YmFibHkgb25seSBhcHBseSB0aGlzIChhbmQgdGhlIG90aGVyIHBhdGNoIGZyb20KdGhpcyBzZXJp
ZXMpIGFmdGVyIDYuNC1yYzEgaGFzIGJlZW4gcmVsZWFzZWQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
