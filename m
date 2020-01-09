Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D88EC282DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 22:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 135F42077B
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 22:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZJrCt4Oh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/5Ut+zw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 135F42077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYDPBworD05y0DOiuNripEvVEQkxtOtbpW0KHRIETro=; b=ZJrCt4OhP6K/+Q
	GpoDBAOtel3y37T/uzsrWW5sJZPOZnKbcKiAfE6wtwPAF6r+YQBMjZL8fnOXCnzbxJucvFoz05o8g
	PBIckWqkBcno/mIQ+BSKcsMyZj8G37tcBqKKprL9FHn6BcTz2YDHdcHt0SqPFQWFJsxkju4OpB9Od
	qjfu9ZTaGut127jppEyvXZ5Ta8/yb72KEj/nGYfreCHgqX4akZC05GRv1yxjB6sZRhYLxAmnoYlOJ
	fSo4O8BCUQX1RL0xRCTf0wHg923IMzChNZ2y0qhoS+pBtCw0MKyS2DTHstf5Cam4SoFlnJWCvrXdr
	VLGoLYLExi0qRzS+tuNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipgWU-0006UB-5b; Thu, 09 Jan 2020 22:43:26 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipgWR-0006Tf-QY
 for linux-amlogic@lists.infradead.org; Thu, 09 Jan 2020 22:43:25 +0000
Received: by mail-wm1-x344.google.com with SMTP id p17so4638204wma.1
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Jan 2020 14:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t/bY2L+lT9cEkRxc3Db1rJxtgV2j+9NNeMib8nWiYgY=;
 b=x/5Ut+zwliQPZPU0JkolFxzy6+AoWe05Plhn7Z3dukh72Nge04r0u+Bg6eLu7aFAEU
 oTuK1GG6sMwH2F47qkYNE+ASM8tUaj3PABfjLd2jswr1E2Gdnh7LW02FmlUrjFh26g+J
 I4FIU/ZZWksEvNmeDwUKXWIDprOuk05IWZirmIFWBDWpkYyM70q/ZxaNtMEphEF3Nidk
 tbr4yWA5B+T5YoElG7CA1k3B2PGuSpSexbdZVMIlE5h/uNVWhb8aXH3XvzsgSsME92Cd
 ciTKGlgY1rg9DT/WK/HCiwSGAJeVVD/TLFWcOfhIPzvC+/HHMvXIRtNIProNVvqFZ0lL
 1DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t/bY2L+lT9cEkRxc3Db1rJxtgV2j+9NNeMib8nWiYgY=;
 b=i0m7KMyJWGczAM6PYEb4wR70p0J6D7iOrp1tncJH4ctg+rDboqCfDBE7QZfFB14s/R
 CLgv+QnlIBejhvTxmMHaLmj+GH+mpP1jJhMS0OgR9fIYhC9HhLbMMJyevhaUsGyHHKcA
 TIyqhYRtopbQu8kCt1jUauvVo9Otiz6xZFV8fkHuTHEzCppSW53Ay3rGpihxpLqAARwB
 qh+0HcEKh34LVZP55ymtylyF6xAqoDTJNaOIgiaPPAEW4sg/sfhkohWBUetkIti7Ii9Z
 vSbhP9FeSi5huG/aBh3cQ7GLsn9QMMKhlq3z1jM3x7DW6zhXAEoSSbWcoMjXSwItbe63
 mOrw==
X-Gm-Message-State: APjAAAXGGR+KZ03KIZL/QggztuREzb825bwjIhVecdMM4pIejbyMeicQ
 0wvy/54cabAA+RoqFtMXM+DgIw==
X-Google-Smtp-Source: APXvYqx1ZGuMxmqhMTPuffNDBAesqJDnzDxI5Ny+lKxkSUKU9am1NkfMRibRNBm1B//RMRNl46hKFg==
X-Received: by 2002:a1c:3c8b:: with SMTP id j133mr261882wma.66.1578609802135; 
 Thu, 09 Jan 2020 14:43:22 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:f1d5:61e0:e9d8:1c3d?
 ([2a01:e34:ed2f:f020:f1d5:61e0:e9d8:1c3d])
 by smtp.googlemail.com with ESMTPSA id j12sm9773419wrt.55.2020.01.09.14.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 14:43:21 -0800 (PST)
Subject: Re: [PATCH 0/2] make generic-adc-thermal less noisy
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 rui.zhang@intel.com, amit.kucheria@verdurent.com, linux-pm@vger.kernel.org
References: <20200107232044.889075-1-martin.blumenstingl@googlemail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <15378eed-d8d1-a37f-7f4c-88c112ecde0b@linaro.org>
Date: Thu, 9 Jan 2020 23:43:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107232044.889075-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_144324_073024_F5AF5358 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: edubezval@gmail.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, jeff.dagenais@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDgvMDEvMjAyMCAwMDoyMCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBJIHdhbnQg
dG8gdXNlIGdlbmVyaWMtYWRjLXRoZXJtYWwgb24gdGhlIDMyLWJpdCBBbWxvZ2ljIFNvQ3MgaW4g
dGhlCj4gZnV0dXJlLiBUaGVzZSBoYXZlIGEgdGhlcm1hbCBzZW5zb3JzIHdoaWNoIGNhbiBiZSBy
ZWFkIHRocm91Z2ggdGhlCj4gU0FSIEFEQyAoZm9yIHdoaWNoIHdlIGhhdmUgYW4gSUlPIGRyaXZl
cikgb24gdGhvc2UgU29Dcy4KPiAKPiBXaGlsZSB0ZXN0aW5nIEkgZm91bmQgdGhlIGdlbmVyaWMt
YWRjLXRoZXJtYWwgZHJpdmVyIHRvIGJlIGEgYml0Cj4gbm9pc3kgd2hlbiBvcGVyYXRpbmcgaW4g
d2VsbCBzdXBwb3J0ZWQgZW52aXJvbm1lbnQ6Cj4gLSB0aGUgU29DIHRlbXBlcmF0dXJlIHNlbnNv
ciBvbiB0aGUgMzItYml0IEFtbG9naWMgU29DcyBpcyB0eXBpY2FsbHkKPiAgIGxvYWRlZCBsYXRl
IGJlY2F1c2Ugb2YgaXQncyBkZXBlbmRlbmNpZXMgKGl0IG5lZWRzIGRhdGEgZnJvbSB0aGUKPiAg
IGVGdXNlIGFuZCBhIHN5c2NvbiB0byBjYWxpYnJhdGUpLiBZZXQgSSBzdGlsbCBnb3QgYSBtZXNz
YWdlIHN0YXRpbmcKPiAgIHRoZXJlJ3Mgbm8gbG9va3VwIHRhYmxlIGZvciB0aGUgZ2VuZXJpYy1h
ZGMtdGhlcm1hbCBkZWZpbmVkICh3aGljaAo+ICAgaXMgZXhwZWN0ZWQgYW5kIHBlcmZlY3RseSB2
YWxpZCBvbiB0aGVzZSBBbWxvZ2ljIFNvQ3MsIGFzIHRoZSBJSU8KPiAgIGNoYW5uZWwgcmV0dXJu
cyB0aGUgdGVtcGVyYXR1cmUpLgo+IC0gdGhlIElJTyBjaGFubmVsIGlzIGNvcnJlY3RseSBkZWZp
bmVkIHdpdGggdHlwZSBJSU9fVEVNUCwgeWV0IHRoZQo+ICAgZ2VuZXJpYy1hZGMtdGhlcm1hbCBk
cml2ZXIgc3RpbGwgcHJpbnRzIGEgbWVzc2FnZSB3aGljaCBmaXJzdCBsZWFkCj4gICBtZSB0byBi
ZWxpZXZlIHRoYXQgSSBwYXNzZWQgYW4gaW5jb3JyZWN0IElJTyBjaGFubmVsIChvbmUgdGhhdAo+
ICAgcmV0dXJucyBhIHZvbHRhZ2UpLgo+IAo+IAo+IE1hcnRpbiBCbHVtZW5zdGluZ2wgKDIpOgo+
ICAgdGhlcm1hbDogZ2VuZXJpYy1hZGM6IHNpbGVuY2UgIm5vIGxvb2t1cCB0YWJsZSIgb24gZGVm
ZXJyZWQgcHJvYmUKPiAgIHRoZXJtYWw6IGdlbmVyaWMtYWRjOiBzaWxlbmNlIGluZm8gbWVzc2Fn
ZSBmb3IgSUlPX1RFTVAgY2hhbm5lbHMKPiAKPiAgZHJpdmVycy90aGVybWFsL3RoZXJtYWwtZ2Vu
ZXJpYy1hZGMuYyB8IDIwICsrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzCgotLSAKIDxo
dHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20v
cGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3Jn
PiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
