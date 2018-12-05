Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD38C04EBF
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 01:12:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E178020834
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 01:12:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oKIkQB8J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mxNqAucm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E178020834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OfHy+9Z3c+zbfyKw1+6YoMbjbAjj/VsEY5gnb7JoJS8=; b=oKIkQB8JXi3DfH
	nSZxyBRKMxjeBSK0fpjPQu+CGMacHnr3YsEz/31e3SrcjgkrUeSFTgvrO6VixStAfkjSuDdxSImLm
	96MFrUpR3KuGddnc9kqWPvEDJ0/INKY3eBIY5k6v370ZIsEPIC3fqsvVpx3pTw6zDXJVk6K9KkIrn
	RLx/c4dj7gtQAq41/VeU1RkoYbKwF37yUhpFEfTa/8uLtW/2xtJJ2vaTbECrFmDAFmkmo6BYxpQee
	EPbiDYLuin5/SCOr6aHX28fmBQLW+mxyFG/23qR6XWGmkj4OQ8Y0XbuuH3445M5w7HU10RhJL4dXq
	vxgNufk7BtKwu6+015gQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gULk4-0001dW-EF; Wed, 05 Dec 2018 01:12:44 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gULjs-0001Sj-Is
 for linux-amlogic@lists.infradead.org; Wed, 05 Dec 2018 01:12:33 +0000
Received: by mail-pf1-x443.google.com with SMTP id q1so9115485pfi.5
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 17:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version
 :content-transfer-encoding;
 bh=huMzzg9M5IKQF8pp+XWvd6Y/O8piGr2fBzs2L4BaH2Q=;
 b=mxNqAucmO4xPN5bms8oNBx4Z6YNIezG0yId1Q6TKgMed9TEwanu6H9ry+hBQti60FD
 9BFZPJWOetOaoyltBP/emZqg6hLiZx/giWwbrwYOvxbJ5Dbu1w15Weo9KHqqP279Y0lI
 oGwvWESsaEV44KX3K+Mt5fLFnUklKIpH0DgNSK9b5rpgXaRflKZBncs2Xdy2Y5MV38gt
 0ZHS7lR22XoU54phJxZV86mTeSirFus1P5o3VIaKvsiP6pKx2kYDZNM4u8rkf7DM2c6t
 0GA7n+84UIXW2Dbegp3ePdm8KE2K8vBunbs+rfWr75/Pg7tvbuPMBrFKFn1tJEA1ILVQ
 Ttng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=huMzzg9M5IKQF8pp+XWvd6Y/O8piGr2fBzs2L4BaH2Q=;
 b=qSaMSDkn9mC0T0UpgMzb/U/RZ7ib5fspw4ZoNmfhgnFQWZ1oV/Jy7nTjMzc5BWPfA9
 vlYcRn1BY8KX+N0Enslpp8aS3zkgOtzOCE/0JFEyOVMYBAaQ2nN94HCzUgHt2zOQF6+U
 HyQgGWicstIDlQnE9/mX7XbFe09IofkhhKnqjKPtAXpDHVea4838JRseMN/+MVbseYqX
 TJRaC5gLGoWr35wO9PNwh819+WldduyJO2mwcuFi7uIu8lP6lV/wDCM7PiALvyXy8kK+
 B+mi84iPsmPArz0Awt7c50bLIVFm32gMnCDhlS9N62wgOMcsY25Qq9y3noeR6J/oOVdd
 Hz1g==
X-Gm-Message-State: AA+aEWbrbmyGaTLvRCRO3BsBNbwovYdtIXQkUyIk+idG8RAJoW9MXHh4
 hO4gbeTTuTwRHZOr/JTJK/JqlA==
X-Google-Smtp-Source: AFSGD/UvwCPupdAH7RMbAszqTm5uaO07k3VoyZbiTvS7lln6phXHkcnPDf3kfpq/wXY4q2j+ilNsmg==
X-Received: by 2002:a62:4255:: with SMTP id p82mr22078398pfa.13.1543972340941; 
 Tue, 04 Dec 2018 17:12:20 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 x27sm26839549pfe.178.2018.12.04.17.12.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 17:12:20 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com
Subject: Re: [PATCH 1/2] arm64: dts: meson: Fix IRQ trigger type for macirq
In-Reply-To: <5C06DB0D.3010306@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <20181204160447.27869-2-ccaione@baylibre.com> <5C06DB0D.3010306@baylibre.com>
Date: Tue, 04 Dec 2018 17:12:19 -0800
Message-ID: <7hin08bwuk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_171232_617274_0DCD0D61 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IEhpIENh
cmxvLAo+Cj4gTGUgMDQvMTIvMjAxOCAxNzowNCwgQ2FybG8gQ2Fpb25lIGEgw6ljcml0IDoKPj4g
QSBsb25nIHJ1bm5pbmcgc3RyZXNzIHRlc3Qgb24gYSBjdXN0b20gYm9hcmQgc2hpcHBpbmcgYW4g
QVhHIFNvQ3MgYW5kIGEKPj4gUmVhbHRlayBSVEw4MjExRiBQSFkgcmV2ZWFsZWQgdGhhdCBhZnRl
ciBhIGZldyBob3VycyB0aGUgY29ubmVjdGlvbgo+PiBzcGVlZCB3b3VsZCBkcm9wIGRyYXN0aWNh
bGx5LCBmcm9tIH4xMDAwTWJwcyB0byB+M01icHMuIEF0IHRoZSBzYW1lIHRpbWUKPj4gdGhlICdt
YWNpcnEnIChldGgwKSBJUlEgd291bGQgc3RvcCBiZWluZyB0cmlnZ2VyZWQgYXQgYWxsIGFuZCBh
cwo+PiBjb25zZXF1ZW5jZSB0aGUgR01BQyBJUlFzIG5ldmVyIEFDS2VkLgo+PiAKPj4gQWZ0ZXIg
YSBwYWluZnVsIGludmVzdGlnYXRpb24gdGhlIHByb2JsZW0gc2VlbWVkIHRvIGJlIGR1ZSB0byBh
IHdyb25nCj4+IGRlZmluZWQgSVJRIHR5cGUgZm9yIHRoZSBHTUFDIElSUSB0aGF0IHNob3VsZCBi
ZSBMRVZFTF9ISUdIIGluc3RlYWQgb2YKPj4gRURHRV9SSVNJTkcuCj4KPiBUaGlzIGlzIGEgZ29v
ZCBuZXdzICEKPgo+IEtldmluLAo+IFdoYXQncyB0aGUgYmVzdCBwcm9jZWR1cmUgaGVyZSB0byBt
YWtlIGl0IGFwcGx5IG9uIHRoZSA0LjE5LCA0LjE0IGFuZCA0Ljkgc3RhYmxlCj4gdHJlZXMgPyBm
b3IgNC4xNCBhbmQgNC45IGl0IHdpbGwgbmVlZCB0byBiZSByZXdvcmtlZCB0byBhcHBseSBjb3Jy
ZWN0bHkuCgpBZGRpbmcgYSBGaXhlczogdGFnIHdoZXJlIHRoZSBvcmlnaW5hbCBidWcgd2FzIGlu
dHJvZHVjZSBpcyB0aGUgYmVzdCB3YXkKZm9yIGl0IHRvIGF1dG9tYXRpY2FsbHkgZ2V0IGFwcGxp
ZWQuCgpIb3dldmVyLCBpZiByZXdvcmsgaXMgcmVxdWlyZWQsIHRoYXQgd2lsbCBoYXZlIHRvIGJl
IG1hbnVhbGx5IGRvbmUgYW5kCnNlbnQgdG8gdGhlIHN0YWJsZSBsaXN0LgoKS2V2aW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
