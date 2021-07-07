Return-Path: <SRS0=LiOq=L7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F99C07E95
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 06:13:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB9661C84
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jul 2021 06:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AB9661C84
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wrZjZEgTVltYmP6OW19P5pTialOaSwguaWIcPsWfnUc=; b=CfzskW/532S8g0LCghlAJfCaSe
	+lFkCjX3J61RbqZkpZIPj416Xali5SjWeDFDk1iOzBz1APJcbSK4C8Wk5YQHEf/gEiehtKO0YfpVx
	M+w4JepSOp/gEbe28MDsi5zwLxW+Nd7j612TcX0Zs+gP9j2QS1p+rg8IxirPnIvGf8EQfE4fFsARa
	AdXqsXD4NIYlHrzD2nyJ21KwEkDAbWixJ+UuHLZyXWVCqjVi6h/5a+DV0cpM2rn+7MxSHNo9vP6ME
	x8Q4B8fZfJXaXL0GaBIgaf9lpQWLKlBaaBvEiXhD3GOt56pWp6PIhVz9pMkG7sJ0Lzvq5xvw+rHZh
	FskJvoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m10oE-00DdAA-Vn; Wed, 07 Jul 2021 06:13:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m10ny-00Dd7K-EC
 for linux-amlogic@lists.infradead.org; Wed, 07 Jul 2021 06:13:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so863090wmc.2
 for <linux-amlogic@lists.infradead.org>; Tue, 06 Jul 2021 23:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=odt0jbZHZ7Fm2nPoaDhP3Dqf0zG4dR5TGlhg5EMNQlw=;
 b=2IBp2OQK5HpK3FQn+wc7Nykay6BSwETz+juSB+8NqwiTxLv9fjqJ96pHvmXwcVWPSJ
 OQ58lbsUEQMxex5ygeXfQqHdhnBqfdID1QtGnBFimD1pAvHjxVwH4DqJRi/s0kMaFHPz
 yhVjoeY4Xi01bdvr44r+ez/n8b49lP1e/L2kzUxrVGCjY4h2sh7RWNi6h8Qh1YR0bv0H
 HPNprkpNkjwpo3AA92s8K/MK97J6S0dGN9F6KGHhLi4TpX7l1nXD0wLRXZJWJcq5Z0Yp
 pPfB/NVBhF75aYZwTSKYWgihAoOlsmuqEQRTC1a4QP0lNOQxndRQvfycL91W4U2x9hy2
 LJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=odt0jbZHZ7Fm2nPoaDhP3Dqf0zG4dR5TGlhg5EMNQlw=;
 b=SkwmfVzHccztZRmtWD+//PL1N10dYgsjwfderMDurttXOre2A91J4KQGc6AKHVVRLk
 H0f1Mu6t/1Wx/3s2vuqumvTiPaJta/x+dSxrbkHExu3A9+QVGO4gKZsFrX6SVgotdOrh
 7DUwp1UOktLJ7xHYcw8/lw4CA90j75sGjKRxAJ81Zj4FH5u8PH5ckHLYb1AXo0GwyO4Z
 Cr2zan+untmEyhKX6jjIQF3VqODeNkia69yoLtIKJrOEYzxznOqTOikQP4+BMfyAWt6G
 QMg2ryB+Yt7WgDPJpmvZbEWzFpBrywodwu497kCUbs881DiE/13ctn0i+R7q+wBeil+O
 opDA==
X-Gm-Message-State: AOAM532CIeVsqKg8cB9tdJZ2nUWfbuCb43T5pVq6WFp9BaOWiepy6Doc
 2DcV9OejUDOF9lSGfHKpPSXR+g==
X-Google-Smtp-Source: ABdhPJzTNOuQs9xw3ntgNPVU+gGXeHa60Bz+hXBN8APBLYAtYALVVJJ1sELfK1Vum9ES59SqUldVCA==
X-Received: by 2002:a7b:c449:: with SMTP id l9mr4827330wmi.98.1625638384631;
 Tue, 06 Jul 2021 23:13:04 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b925:9854:af33:ad0d?
 ([2001:861:44c0:66c0:b925:9854:af33:ad0d])
 by smtp.gmail.com with ESMTPSA id h9sm17716724wmb.35.2021.07.06.23.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 23:13:04 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: Convert to Linux IRQ interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20210706074545.8763-1-tzimmermann@suse.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <84e08930-24a9-14f7-c2ad-9384a9bca86f@baylibre.com>
Date: Wed, 7 Jul 2021 08:13:02 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210706074545.8763-1-tzimmermann@suse.de>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_231306_578686_57A05535 
X-CRM114-Status: GOOD (  17.57  )
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

SGksCgpMZSAwNi8wNy8yMDIxIMOgIDA5OjQ1LCBUaG9tYXMgWmltbWVybWFubiBhIMOpY3JpdMKg
Ogo+IERyb3AgdGhlIERSTSBJUlEgbWlkbGF5ZXIgaW4gZmF2b3Igb2YgTGludXggSVJRIGludGVy
ZmFjZXMuIERSTSdzCj4gSVJRIGhlbHBlcnMgYXJlIG1vc3RseSB1c2VmdWwgZm9yIFVNUyBkcml2
ZXJzLiBNb2Rlcm4gS01TIGRyaXZlcnMKPiBkb24ndCBiZW5lZml0IGZyb20gdXNpbmcgaXQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYyB8IDEwICsrKy0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCj4gaW5kZXggM2QwY2NjN2VlZjFiLi5iYzBkNjBk
ZjA0YWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCj4gQEAgLTIxLDcgKzIxLDYg
QEAKPiAgI2luY2x1ZGUgPGRybS9kcm1fZmJfaGVscGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJt
X2dlbV9jbWFfaGVscGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9o
ZWxwZXIuaD4KPiAtI2luY2x1ZGUgPGRybS9kcm1faXJxLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJt
X21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVs
cGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgo+IEBAIC05NCw5ICs5Myw2IEBA
IERFRklORV9EUk1fR0VNX0NNQV9GT1BTKGZvcHMpOwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9kcml2ZXIgbWVzb25fZHJpdmVyID0gewo+ICAJLmRyaXZlcl9mZWF0dXJlcwk9IERSSVZFUl9H
RU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9BVE9NSUMsCj4gIAo+IC0JLyogSVJRICovCj4g
LQkuaXJxX2hhbmRsZXIJCT0gbWVzb25faXJxLAo+IC0KPiAgCS8qIENNQSBPcHMgKi8KPiAgCURS
TV9HRU1fQ01BX0RSSVZFUl9PUFNfV0lUSF9EVU1CX0NSRUFURShtZXNvbl9kdW1iX2NyZWF0ZSks
Cj4gIAo+IEBAIC0zMzUsNyArMzMxLDcgQEAgc3RhdGljIGludCBtZXNvbl9kcnZfYmluZF9tYXN0
ZXIoc3RydWN0IGRldmljZSAqZGV2LCBib29sIGhhc19jb21wb25lbnRzKQo+ICAJaWYgKHJldCkK
PiAgCQlnb3RvIGZyZWVfZHJtOwo+ICAKPiAtCXJldCA9IGRybV9pcnFfaW5zdGFsbChkcm0sIHBy
aXYtPnZzeW5jX2lycSk7Cj4gKwlyZXQgPSByZXF1ZXN0X2lycShwcml2LT52c3luY19pcnEsIG1l
c29uX2lycSwgMCwgZHJtLT5kcml2ZXItPm5hbWUsIGRybSk7Cj4gIAlpZiAocmV0KQo+ICAJCWdv
dG8gZnJlZV9kcm07Cj4gIAo+IEBAIC0zNTQsNyArMzUwLDcgQEAgc3RhdGljIGludCBtZXNvbl9k
cnZfYmluZF9tYXN0ZXIoc3RydWN0IGRldmljZSAqZGV2LCBib29sIGhhc19jb21wb25lbnRzKQo+
ICAJcmV0dXJuIDA7Cj4gIAo+ICB1bmluc3RhbGxfaXJxOgo+IC0JZHJtX2lycV91bmluc3RhbGwo
ZHJtKTsKPiArCWZyZWVfaXJxKHByaXYtPnZzeW5jX2lycSwgZHJtKTsKPiAgZnJlZV9kcm06Cj4g
IAlkcm1fZGV2X3B1dChkcm0pOwo+ICAKPiBAQCAtMzgyLDcgKzM3OCw3IEBAIHN0YXRpYyB2b2lk
IG1lc29uX2Rydl91bmJpbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJZHJtX2ttc19oZWxwZXJf
cG9sbF9maW5pKGRybSk7Cj4gIAlkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bihkcm0pOwo+ICAJ
Y29tcG9uZW50X3VuYmluZF9hbGwoZGV2LCBkcm0pOwo+IC0JZHJtX2lycV91bmluc3RhbGwoZHJt
KTsKPiArCWZyZWVfaXJxKHByaXYtPnZzeW5jX2lycSwgZHJtKTsKPiAgCWRybV9kZXZfcHV0KGRy
bSk7Cj4gIAo+ICAJaWYgKHByaXYtPmFmYmNkLm9wcykgewo+IAoKTG9va3MgZ29vZCAhCgpSZXZp
ZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgoKVGhhbmtz
LApOZWlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
