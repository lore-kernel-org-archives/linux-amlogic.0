Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3699C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 09:40:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3D661058
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 09:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D3D661058
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7/gwqCF3QzAw9GyQwIkkGiYhB7mkyDEq1N4HuGoxIbc=; b=HXa7mtCxecTs5TK18Zw5oXO8Mp
	iDqY1fLvOFm/kBT1A3Zd1YnLCiMqteiKJ02261W6KLHZR/VfjR5gIg3mjAziEgmKqCITOl6WUNUa6
	qjA/9bm08YTUVgi79t5swSiGuUqMwSf2c+kJZ8EFpwL8z/pcWGPV5mC+ESnxokafFomUqZNJ5Sjjc
	dNVJykaAxX6Nn2ZiwZW+BlwsKmqrJFnw9n02zesZ4fIw0cV3nUt3bAVoOobf2GhE9ZB4NHMd2+jxC
	049X9VYbP+dR6hh+ZvAlYUD3TBSH0efde7MROx2SXKLqgfVOO7i8ZMA3uU6DJ3zjp12R29SIwcnUY
	GF7a/0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m92Ws-003g6d-DW; Thu, 29 Jul 2021 09:40:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m92Wk-003g2R-GI
 for linux-amlogic@lists.infradead.org; Thu, 29 Jul 2021 09:40:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id q3so6165379wrx.0
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Jul 2021 02:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ITafrgOQ7JI8igCzT3YLjImraa83NmdRcusXAFKxn/E=;
 b=jHCdy4ulv374187WYiQW42yMYxRxVqyMgpncLbkfrOtS9WAhCxkjC+DspSBBuLyeLI
 j3RUIQ4DFd11UirVyBk8oqHj9yTkkQ77l+yjGFNuEJyYpAn3VtFnwbFRTEGDoiG5p7uG
 bNDi2qmgJnDFpbFsTBQHFBpRXOGQuaHGFTUlioHdRez1KzpmmCqq6KBTFtHvSOSUsMMQ
 WDqce0JpWro2ljeUKC+6AX4Mm9y1sD+Rd8ZBuKwpTexLjtn6CWAeMcdl1EuCVWzBmHlX
 ClHauCTkr3VJ/zT/Mwtdp3qZQdU3rc++NN7R/6dck6/0FEBwLe7iRe+7R3jNIDqcvcrU
 kWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ITafrgOQ7JI8igCzT3YLjImraa83NmdRcusXAFKxn/E=;
 b=QBfJ9v2g8Qmj5szXTmKR2gwSaXr+3HIJl6Y1zxakyS6945KEp6kkb8ZfNw3KgRBfRl
 bCOJYc5OL2VuusfzwovaPQ6ZLy9VDGWz6yrUyY+uABHmfBfxAh9fOV2GL/dFmcWI4D2K
 FyzgoNzEZGLn8852jmMzyC/eHXoPERobyP38JFU6C22E67q7QOrKc/5aMvZhWTC7suIC
 drW743wCPx4UjllYIy8qNwZM3StdOBS54aUE3ssH99kppIdGc96DKBe+eMJYfeMvRHjx
 F1hQxaC5a9ZQuN4GHZUetsGbbXbvykLUtrJmrDFXUm2xtDaPQC/XiTVj6BzV6C2sIrEI
 1YZw==
X-Gm-Message-State: AOAM532t1DxZ6beRS3ulpDmAxRl6TkGxWvBTKtagMnpsO3GBa6c/4r9K
 jWFMksv93AvjsGgSVVy4ymHmN2cYIfgYq3Ng
X-Google-Smtp-Source: ABdhPJxAI81jNII7HAbAaJmvPPI/BcOQpXYsKw4GkhOySH2+D8tX58bsQOF6LdWZDsAgOv+3jEWkEQ==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr3884730wrs.125.1627551628240; 
 Thu, 29 Jul 2021 02:40:28 -0700 (PDT)
Received: from [10.1.3.29] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l5sm3095498wrc.90.2021.07.29.02.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 02:40:27 -0700 (PDT)
Subject: Re: does A311D supports SCPI?
To: =?UTF-8?B?5bygIOWugQ==?= <zhangn1985@outlook.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
References: <OS0P286MB0641C5CDF6A9A92CBD324E1ACDEB9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <1470f543-2f3b-8810-24ae-6777e278a884@baylibre.com>
Date: Thu, 29 Jul 2021 11:40:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <OS0P286MB0641C5CDF6A9A92CBD324E1ACDEB9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_024030_584039_650F2246 
X-CRM114-Status: GOOD (  14.28  )
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

T24gMjkvMDcvMjAyMSAwNDozMiwg5bygIOWugSB3cm90ZToKPiBIaSwKPiAKPiB3aGVuIEknbSBi
dWlsZGluZyBtaW5pbWFsIGtlcm5lbCBjb25maWcgZm9yIEEzMTFEWzFdLCBhbmQgZmluZCBBMzEx
RCBkb2Vzbid0IHN1cHBvcnQgU0NQSS4KCkknbSBub3Qgc3VyZSBleGFjdGx5LCBidXQgaXQgc2Vl
bXMgaXQncyBzdXBwb3J0ZWQgYnV0IG9ubHkgZm9yIGNwdSBpZGxlLgpCdXQgZm9yIG5vdyBpdCdz
IG5vdCBlbmFibGVkIGZvciBtYWlubGluZSBrZXJuZWwuCgo+IAo+IGFuZCBJIHRyaWVkIHRvIGZp
bmQgYW5zd2VyIGluIEEzMTFEIGRhdGFzaGVldCwgYnV0IG5vIGFuc3dlci4KPiAKPiBpcyBTQ1BJ
IG1hbmRhdG9yeSBmb3IgQWFyY2g2ND8KCk5vCgo+IAo+IGlmIHllcywgd2hhdCdzIHRoZSBzdGF0
dXMgb2YgU0NQSSBpbiBBMzExRD8KCkl0J3Mgc29tZXRoaW5nIHRvIGVuYWJsZQoKPiAKPiBCVFcs
IHdoYXQgYWJvdXQgY3B1IGlkbGUsIGFueSBwcm9ncmVzc1syXT8KCmlmIFNDUEkgZ2V0cyBlbmFi
bGVkIHRoZW4gZW5oYW5jZWQgY3B1IGlkbGUgY291bGQgYmUgZW5hYmxlZC4KCk5laWwKCj4gCj4g
QlIuCj4gTmluZy4KPiAKPiBbMV0gaHR0cHM6Ly9naXRlZS5jb20vemhhbmduMTk4NS9jb25maWcv
Cj4gWzJdIGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1hbWxvZ2lj
LzIwMjAtU2VwdGVtYmVyLzAwODA0NC5odG1sCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
