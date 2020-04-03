Return-Path: <SRS0=u7yr=5T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70C2C43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 07:44:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F3A20678
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Apr 2020 07:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sqv/Xpn3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vMm6h/ZB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F3A20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgqmTGwSGpU9b1pQYncazlIKr3p1vK4gn+E98OuoXcI=; b=Sqv/Xpn38nNzLA
	RlV0aIV6aUWErb/GtKyvO7INmVrkyhyShvZZFLh1Hh84rlBLbdXNwe77g5BrAv3SvZ71hcYMGSOEE
	2rg4CDcS49M9aRFAhObcRMQ7S8eizmlBoE5Q9BpggeCUMr7i5ar/M/uoN3yTkyWABunnAyhvrmNbZ
	F/mLvNtcAuYDTjkGrRJfUljMujoOEqFkL0XOrNM78zrR2e8Ew/YVSl+Ctx489vnK2bGno7hWDTpIU
	obyScrL5ieKlU+7XshDfPIRMI4p+B4K9TCsyBgLga/VtaxVeo+EIqVocDr9IqS9e73WVqcAAekukx
	8J106nbt9TD63yuY9LVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKH0E-0006dW-Ai; Fri, 03 Apr 2020 07:44:34 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKH0B-0006al-71
 for linux-amlogic@lists.infradead.org; Fri, 03 Apr 2020 07:44:33 +0000
Received: by mail-wm1-x344.google.com with SMTP id z14so1427366wmf.0
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Apr 2020 00:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SK5TZMyPADiz9lPA4tN7KNl354WRdu5AzdV44f6b77I=;
 b=vMm6h/ZBwLu7dr+LSxkMDOGeAfibGmXEGxAVenzMfVNy4Pko88T2Jcq/bKHAhmJaZJ
 AJJm/WFkICfZoO0o5JRK2bLIB/SjVtEwCJicEXsbdyf5Gxv1/fAxkGMQ/ZeTuy+FjGTf
 T2lYw8Xb5sTtLZmrJqmls06dS8DVxqtRzkQtjVIlz2wK459EwmWy+G+7IqSkIKPxjYGZ
 kbQz4wUcjAxEOzUQrBDl75tkxXFSS141c9kvQVFd3IAD/o6IFX2bSB1LYM92gcB6BVMu
 owqyhfZkMy58/NnQuyyC9X5jA1nSfm0aPbiaAM9hwyMi4MZlKcVFdk654x+UR8I3ka8N
 mZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SK5TZMyPADiz9lPA4tN7KNl354WRdu5AzdV44f6b77I=;
 b=URRsmw56XFMbqKdD4RRZjfvgJJG6z/q5ML/y/BMleHgvE9CVNeGSNJdwaW4yOaZoMR
 2yu7eB1veYEel9wYk49cgak4brbhCafkQaVedOS3f4BhzilotWZEybvm7uKUTjHl7oVv
 4krxnSboLULXBlVp95wtRu6SOGqxFMNL3nRl7s07J3DtP1tiqmjoOmMvHQIlF3lXMIEY
 VxIxZ0fSxHCiMwsPwaNvtzXzSVUxuy299IV6I7JEl6kuAPzr3M58ivit08o9EngE+UsI
 fi1H7XQyshnp+Rp+eeDL1yrFMRWtWlK2njsB9JhwWEqvM3+fgUIzy3F00QIgaOha/YRN
 PCEQ==
X-Gm-Message-State: AGi0PuYQo3XDWSfVT+NVY5IwCgi4oih+smWQlvTAEkmBJm81f2vly//5
 gZziOlc7ugZaiV5kHDeUtVAfEw==
X-Google-Smtp-Source: APiQypIUZNDrHwAO1tmJINP2Rv/tr1kJE5vqgm3/VUgkcPmobAGHKAFQznhv92Oxh4f8LW6rYlK/Hw==
X-Received: by 2002:a1c:41d4:: with SMTP id o203mr7071415wma.1.1585899868366; 
 Fri, 03 Apr 2020 00:44:28 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2?
 ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id e5sm11161802wru.92.2020.04.03.00.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 00:44:27 -0700 (PDT)
Subject: Re: [PATCH] crypto:amlogic - Delete duplicate dev_err in
 meson_crypto_probe()
To: Tang Bin <tangbin@cmss.chinamobile.com>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net
References: <20200403015710.2764-1-tangbin@cmss.chinamobile.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <ab31f6e4-23cc-48f2-6d43-218e7fa652b9@baylibre.com>
Date: Fri, 3 Apr 2020 09:44:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200403015710.2764-1-tangbin@cmss.chinamobile.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_004431_320823_F2D2406A 
X-CRM114-Status: GOOD (  16.23  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

U3ViamVjdCBzaG91bGQgYmU6ICJbUEFUQ0ggdjNdIGNyeXB0bzphbWxvZ2ljOiBEZWxldGUgZHVw
bGljYXRlIGRldl9lcnIgaW4gbWVzb25fY3J5cHRvX3Byb2JlKCkiCgpTbyBmb3IgdGhlIG5leHQg
c2VuZCwgaXQgd2lsbCBiZSAiW1BBVENIIHYzXSBjcnlwdG86IGFtbG9naWM6IC4uLiIKCk9uIDAz
LzA0LzIwMjAgMDM6NTcsIFRhbmcgQmluIHdyb3RlOgo+IEluIHRoaXMgcGxhY2UsIHdoZW4gc29t
ZXRoaW5nIGdvZXMgd3JvbmcsIHBsYXRmb3JtX2dldF9pcnEoKSB3aWxsCj4gcHJpbnQgYW4gZXJy
b3IgbWVzc2FnZSwgc28gaW4gb3JkZXIgdG8gYXZvaWQgdGhlIHNpdHVhdGlvbiBvZiByZXBlYXQK
PiBvdXRwdXTvvIx3ZSBzaG91bGQgcmVtb3ZlIGRldl9lcnIgaGVyZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUYW5nIEJpbiA8dGFuZ2JpbkBjbXNzLmNoaW5hbW9iaWxlLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3JlLmMgfCA0ICstLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYyBiL2RyaXZlcnMvY3J5
cHRvL2FtbG9naWMvYW1sb2dpYy1neGwtY29yZS5jCj4gaW5kZXggOWQ0ZWFkMmY3Li40MTE4NTdm
YWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jcnlwdG8vYW1sb2dpYy9hbWxvZ2ljLWd4bC1jb3Jl
LmMKPiArKysgYi9kcml2ZXJzL2NyeXB0by9hbWxvZ2ljL2FtbG9naWMtZ3hsLWNvcmUuYwo+IEBA
IC0yNTMsMTAgKzI1Myw4IEBAIHN0YXRpYyBpbnQgbWVzb25fY3J5cHRvX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAltYy0+aXJxcyA9IGRldm1fa2NhbGxvYyhtYy0+ZGV2
LCBNQVhGTE9XLCBzaXplb2YoaW50KSwgR0ZQX0tFUk5FTCk7Cj4gIAlmb3IgKGkgPSAwOyBpIDwg
TUFYRkxPVzsgaSsrKSB7Cj4gIAkJbWMtPmlycXNbaV0gPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IGkpOwo+IC0JCWlmIChtYy0+aXJxc1tpXSA8IDApIHsKPiAtCQkJZGV2X2VycihtYy0+ZGV2LCAi
Q2Fubm90IGdldCBJUlEgZm9yIGZsb3cgJWRcbiIsIGkpOwo+ICsJCWlmIChtYy0+aXJxc1tpXSA8
IDApCj4gIAkJCXJldHVybiBtYy0+aXJxc1tpXTsKPiAtCQl9Cj4gIAo+ICAJCWVyciA9IGRldm1f
cmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgbWMtPmlycXNbaV0sIG1lc29uX2lycV9oYW5kbGVyLCAw
LAo+ICAJCQkJICAgICAgICJneGwtY3J5cHRvIiwgbWMpOwo+IAoKVGhpcyBpcyBiZXR0ZXIuCgpX
aXRoIHRoZSBzdWJqZWN0IGZpeGVkLCBpdCB3aWxsIGJlIG9rLgoKTmVpbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
