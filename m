Return-Path: <SRS0=kgfN=4U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3B1C3F2C6
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2020 14:06:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9F920848
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Mar 2020 14:06:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TWijSkph";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xI7BGtCs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD9F920848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u4gU5uckmVEn2CrvN0s+B9i9wbhuhY/aSFndgnun5Lg=; b=TWijSkph43LlV6ASqGlKqcx9Ex
	yhIKNtW7B3FMqd1/qFqI+tKqwuOTKUObjdUfLvhGuLP4vljxlwXsTRIiXzXWbDoScYabXgPZW7fJj
	yvxEZL3ltWDtcPEPD5Xl8BUATzJioc8o2jOcYM9rod0WKQu3TrjtmkQ2g67+USZ8jtXrlVrqBT2E/
	wCPwQ3w4/YWz4weQ4bolxghghEyoFgDw9L/m0h1a1gUOU06P3Ha/zPkvwbZGwoyY6VEPqBsROPW69
	XAyWkavVCclEgbkepxA0TBcJtMbZ0SMbt5K/KCzhJY6uU3VQ8kmZQNfBnkhRFMvSePWPIlCG1Ipjl
	eungyGqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j98BQ-0000B5-LF; Tue, 03 Mar 2020 14:06:04 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j98BN-0000A1-0t
 for linux-amlogic@lists.infradead.org; Tue, 03 Mar 2020 14:06:03 +0000
Received: by mail-wm1-x343.google.com with SMTP id g134so1989522wme.3
 for <linux-amlogic@lists.infradead.org>; Tue, 03 Mar 2020 06:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8N1oOD+iNq+ZZ+RgWQgUmilBB731/M/GX7cmlCKvzWA=;
 b=xI7BGtCss1bWD/FSMLj3IRg4AN9LJ4tMGESHxrhCo7EMDedk7YIW8zsHwS4gAhLug5
 2ygfwCXiGCzl0BGUYzKxYq83/nZC6bgtZCLijC2OtIkMq3WtKWzRUjPhUOvmxpYwAS0a
 n1EGOB1Mj/ZFzAN199aZWeMxKPFE8XD0vPxYuik25uGBoZnu5C7hgd/fWfVPdMO9iS7T
 fsRzzt8C8Sim4N3ixSSo2LGbOo3zcTi0yXFCQnzt+l61nzNXboMcGbNW/StiCX6PakXZ
 vJAYDX4InVfn8XBLcmeJ4CXmkxQ6c4X7TKdh7OfjLxgg+nroIYKhLrDC7EKW9YkmtdLH
 qlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8N1oOD+iNq+ZZ+RgWQgUmilBB731/M/GX7cmlCKvzWA=;
 b=ALqOIBv9fWwyuIDJFJ2bmUPWmyf4iJk+oceIE3relt7JCVBc19qduRrwXzJjvtdsbL
 75smWvj1aBZmf2HpAHwTIiPp7XrLmfwqN0NHZ3M6NrRDhFAuUNQog6jASTpwqPnisLXS
 9uqNyZhKbi5m5RJbUxinuoe29btJa8doPu5vG80Qr5xYHm9qP7tODen14ojkB3DgAQF4
 YWq9VkzXZMxWe6mQ/U4y4+ur7k9T4V9Nz3rKQ1dwQXX6bY49/tyoNvUJzH1rqVvcdwzy
 ZG/Y/3CH8oRQE+zu/dxA8W9laRq9SXWl9zpQ06+DXfJQSd6KPkFb+FNEji3OpC72T+a4
 B8rA==
X-Gm-Message-State: ANhLgQ3kzkmXJ7vTNQ3OL8RJ6r1y1Kwl58RpIZK4tJCqQBLL/XNAmFA2
 jajQXo5so4lZXrqEA3Sn9sjzo0mYsSUnCA==
X-Google-Smtp-Source: ADFU+vsxIz7cdZ/pq0rIj3O0+ThaUq135bU9TJt89hnuHuxtDmciENUqLw+VLPQZOeEJUuIVNPNbKA==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr4266218wmi.37.1583244357678; 
 Tue, 03 Mar 2020 06:05:57 -0800 (PST)
Received: from [10.1.3.173]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d203sm3953330wmd.37.2020.03.03.06.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 06:05:57 -0800 (PST)
Subject: Re: [PATCH] pinctrl: meson: add tsin pinctrl for meson gxbb/gxl/gxm
To: Otto Meier <gf435@gmx.net>, linux-amlogic@lists.infradead.org
References: <0522f4cb-936d-50e0-1b6f-c885c94d7aa9@gmx.net>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <51cb10de-ead9-49d5-8623-9c2e55f38635@baylibre.com>
Date: Tue, 3 Mar 2020 15:05:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0522f4cb-936d-50e0-1b6f-c885c94d7aa9@gmx.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_060601_089807_59BB8C93 
X-CRM114-Status: GOOD (  12.29  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDMvMDMvMjAyMCAxNDoyMywgT3R0byBNZWllciB3cm90ZToKPiDCoEhlbGxvCj4gCj4gYWZ0
ZXIgaGF2aW5nIGZpeGVkIHRoZSB1YXJ0X2MgcGluY3RybCBkZWZpbml0aW9ucyBkdXJpbmcgU2Vw
dGVtYmVyLAo+IAo+IHRoaXMgcGF0Y2ggd291bGQgcmV2ZXJ0IHBhcnQgb2YgdGhlIGZvcm1lcmx5
IFBhdGNoLgo+IAo+IAo+IMKgwqDCoMKgIC8qIEJhbmsgWSAqLwo+IC3CoMKgwqAgR1JPVVAodWFy
dF9jdHNfYyzCoMKgwqAgMSzCoMKgwqAgMTcpLAo+IC3CoMKgwqAgR1JPVVAodWFydF9ydHNfYyzC
oMKgwqAgMSzCoMKgwqAgMTYpLAo+IC3CoMKgwqAgR1JPVVAodWFydF90eF9jLMKgwqDCoCAxLMKg
wqDCoCAxOSksCj4gLcKgwqDCoCBHUk9VUCh1YXJ0X3J4X2MswqDCoMKgIDEswqDCoMKgIDE4KSwK
PiArwqDCoMKgIEdST1VQKHRzaW5fYV9mYWlsLMKgwqDCoCAzLMKgwqDCoCAzKSwKPiArwqDCoMKg
IEdST1VQKHRzaW5fYV9kX3ZhbGlkLMKgwqDCoCAzLMKgwqDCoCAyKSwKPiArwqDCoMKgIEdST1VQ
KHRzaW5fYV9zb3AswqDCoMKgIDMswqDCoMKgIDEpLAo+ICvCoMKgwqAgR1JPVVAodHNpbl9hX2Ns
ayzCoMKgwqAgMyzCoMKgwqAgMCksCj4gK8KgwqDCoCBHUk9VUCh0c2luX2FfZDAswqDCoMKgIDMs
wqDCoMKgIDQpLAo+ICvCoMKgwqAgR1JPVVAodHNpbl9hX2RwLMKgwqDCoCAzLMKgwqDCoCA1KSwK
PiArwqDCoMKgIEdST1VQKHVhcnRfY3RzX2MswqDCoMKgIDEswqDCoMKgIDE5KSwKPiArwqDCoMKg
IEdST1VQKHVhcnRfcnRzX2MswqDCoMKgIDEswqDCoMKgIDE4KSwKPiArwqDCoMKgIEdST1VQKHVh
cnRfdHhfYyzCoMKgwqAgMSzCoMKgwqAgMTcpLAo+ICvCoMKgwqAgR1JPVVAodWFydF9yeF9jLMKg
wqDCoCAxLMKgwqDCoCAxNiksCj4gCj4gVGhlIE51bWJlcmluZyBvZiB1YXJ0X0MgcGlucyBpcyBj
aGFuZ2VkIGJ5IHRoaXMgcGF0Y2guCgpJbmRlZWQsIFRoYW5rcyBmb3Igbm90aWNpbmcgIQoKPiAK
PiBUaGlzIHBhdGNoIGRlZmluaXRseSBicmVha3PCoCB0aGUgc2RjYXJkLCBpZiB1YXJ0X2MgaXMg
ZW5hYmxlZC4KCk5vcCBpdCBvbmx5IHNodWZmbGVzIHRoZSB1YXJ0YyByeC90YyBhbmQgcnRjL2N0
cyBwaW5zIHJlZ2lzdGVyIGJpdHMsCml0IHdvdWxkIHN0aWxsIHdvcmsgaWYgdHIvcngvcnRzL2N0
cyB3YXMgdXNlZCBhbGx0b2dldGhlci4KCkJ1dCBpdCdzIHN0aWxsIHdyb25nIGFuZCB0aGUgcGF0
Y2ggc2hvdWxkIGJlIGZpeGVkLgoKTmVpbAoKPiAKPiBieWUKPiAKPiBPdHRvCj4gCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
