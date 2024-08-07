Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9168C52D71
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2024 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJkqMofFDPJhWtTmFTDDM3lCBKMwqbmxCqHMvwngksU=; b=uRXyDZRoCNW6At
	aXgbYZFcLwP/+vYmE8GgdwcibsjM8bxFZr4TVD5BTk+oi5BUEeOVwovqqsPHM2pubs7f811j5eX+k
	x1/PAf4uCKtK9ZptA5Yfq9uFbpKE1OkllipoMzf3YIgGxDrW9WnhA5nx6TVBRXVJ41YCJj1UxVoHU
	5IaG9LmUk4nTk+UuBncFnacmP1z/qj6YuUrky59QwKDUhvFxH9S1iMTU6i+pOOm6+pRTWHX+D6EhJ
	8WFiHrUyYIljlj29LECzwu7X0C1AOE6iiFauyvQ8AFDB5+WGR3kUfJuTWRY+9qyzYnQnTbZyli4Iw
	VdHjXyrqNm00TeJEzvUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbiHp-00000005SXv-0jiJ;
	Wed, 07 Aug 2024 15:09:13 +0000
Received: from smtp-30.smtpout.orange.fr ([80.12.242.30] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbiHA-00000005SP2-03C1;
	Wed, 07 Aug 2024 15:08:34 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id biH6s4lsUPZ0ybiH6sRgL8; Wed, 07 Aug 2024 17:08:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1723043309;
	bh=f2G0n1RxaM2sBQWtRjrv2LjX8lvuJMLC31IYVtjWuo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=HctJdtwHnDfiOI7/DtMXVlTSdhHGuRwTANIJGmqOY1dmE88fBpXQxRX+PCl65ZNq+
	 5Op86fklz9UfhsfOp29scmA03+5OqbWBixe1XY4Mm9wiwClroctC1RJ/BCYCKj4NbG
	 gTK4Xml/THYuMAYiG7WDtuGdBoM60DBejsv9jrodHHqIouDdsyIKobSA6vEO4ybK/j
	 7eQc2928aBSqUSVWjufe6Nw5dAfrMTlYd3fWx0ZkPlzVM7N4S+LFGekT2Mq96rZWai
	 DxI9AuWggkU8nQZMec9K1SikT49R/+Q4R7j8Onuuppore++1IUZviqkNhxGCaSCoz+
	 +l8UNe0VBSYgA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 07 Aug 2024 17:08:29 +0200
X-ME-IP: 90.11.132.44
Message-ID: <c8eca123-8ca8-4dfc-acc6-3e196ff0c844@wanadoo.fr>
Date: Wed, 7 Aug 2024 17:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] pinctrl: meson: Constify some structure
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linus.walleij@linaro.org, neil.armstrong@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
 <1jy158xvwz.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <1jy158xvwz.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_080832_479831_22662A0E 
X-CRM114-Status: GOOD (  13.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TGUgMDcvMDgvMjAyNCDDoCAxNjoxNCwgSmVyb21lIEJydW5ldCBhIMOpY3JpdMKgOgo+IE9uIFdl
ZCAwNyBBdWcgMjAyNCBhdCAxMTozMCwgQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmph
aWxsZXRAd2FuYWRvby5mcj4gd3JvdGU6Cj4gCj4+IFRoZXNlIDMgcGF0Y2hlcyBjb25zdGlmeSBz
b21lIHN0cnVjdHVyZXMgaW4gb3JkZXIgdG8gbW92ZSBzb21lIGRhdGEgdG8gYQo+PiByZWFkLW9u
bHkgc2VjdGlvbiwgc28gaW5jcmVhc2Ugb3ZlcmFsbCBzZWN1cml0eS4KPj4KPj4gSXQgaXMgc3Bs
aXR0ZWQgaW4gMyB0byBlYXNlIHJldmlldy4KPiAKPiBJJ20gbm90IGVudGlyZWx5IHN1cmUgaXQg
ZWFzZXMgcmV2aWV3IGluIHRoaXMgY2FzZS4KPiBJZiBhIHYyIGlzIG5lY2Vzc2FyeSwgSSB0aGlu
ayBhIHNpbmdsZSBwYXRjaCB3b3VsZCBiZSBiZXR0ZXIuCj4gCj4+IFBhdGNoIDE6IHN0cnVjdCBt
ZXNvbl9wbXhfZ3JvdXAgYW5kIG1lc29uX3BteF9mdW5jCj4+IHBhdGNoIDI6IHN0cnVjdCBtZXNv
bl9iYW5rCj4+IHBhdGNoIDM6IHN0cnVjdCBtZXNvbl9wbXhfYmFuawo+IAo+IElzIHRoZXJlIGFu
eSByZWFzb24gZm9yIGxlYXZpbmcgb3V0ICdzdHJ1Y3QgbWVzb25fcGluY3RybF9kYXRhJyBhbmQK
PiAnc3RydWN0IG1lc29uX2F4Z19wbXhfZGF0YScgPyBJIGRvbid0IHRoaW5rIHRoZXkgZ2V0IG1v
ZGlmaWVkIGJ1dCBtYXliZQo+IEkgbWlzc2VkIGl0LgoKTm8gZ29vZCByZWFzb25zLgoKSSdsbCBz
ZW5kIGEgdjIgd2l0aCBldmVyeXRoaW5nIGNvbnN0aWZpZWQgYWxsIGF0IG9uY2UuCgpTaG91bGQg
SSB0YWtlIHRoZSBSLWIgYW5kIFQtYiBiZWxvdywgZm9yIHRoZSB2Mj8KCgpUaGFua3MgZm9yIHRo
ZSByZXZpZXcgYW5kIGNvbW1lbnQuCgpDSgoKPiAKPj4KPj4gQWxsIHBhdGNoZXMgYXJlIG9ubHkg
Y29tcGlsZSB0ZXN0ZWQuCj4gCj4gTG9va3MgZ29vZCBhbnl3YXkKPiBSZXZpZXdlZC1ieTogSmVy
b21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gCj4gT24gdGhlIHZpbTNsOgo+IFRl
c3RlZC1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gCj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
