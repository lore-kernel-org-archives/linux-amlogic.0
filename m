Return-Path: <SRS0=UBLa=DV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB7BC433E7
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2020 07:43:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9C4920B1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2020 07:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BZ6RZ0Mn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TDGXnwMd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9C4920B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hWQpMKHuR55Us2BwRV2GIWWCZTbQZ4XqXsfidwh5bdk=; b=BZ6RZ0Mnx8xtde1Apug7otboU
	aOePiWcS1NaGCaBfRbQ4jVkHcW52x08TVQnO+bMEeBNGes2IqYgC4C6fkNFmH95PpYOnoaxHu06Gj
	wqvm7oPXiBiHrI61eYiZSVuvWBstL891t0VVQo911RD1vlNytFkiiHIt5DyBXCtahcpyClPy+EkhX
	VLiViMAMcN4t/JVXAZJSQDFAk39AyebwRZKLGEoVWkmxFAMOwD/aP6CpXv0WUnGGS4IX1s3vdAwno
	ujSQetNq/ogno+ZYqDpjcOEqpFZ6PlQztzKKsIbovatpJKBYhXcu+/JzXUuBC7r837DaDhl+XDwuV
	c5P4m75aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSbRF-0005NJ-EB; Wed, 14 Oct 2020 07:43:09 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSbRB-0005M6-BJ
 for linux-amlogic@lists.infradead.org; Wed, 14 Oct 2020 07:43:06 +0000
Received: by mail-wr1-x442.google.com with SMTP id b8so2576201wrn.0
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2020 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BZgy/avQrARbPHnmM1gwEInAIYc/CCT9PzE1R/a8ERg=;
 b=TDGXnwMdeujj1JtXBRMlnmyHNKLx9zjJlB73+939f5R2RoDhvGCxtxWOyIFNJR+21g
 UzYeoIO+OTnkD+pGTnp31fuIGY5CCDVfAzc29GgcFY1h5RM/GCF1hVC+tnYHaY1g1zyQ
 lB44jzW1gl18NKKNE11qkGdLsJwq37I6GqhFR+xBZyFNqJGgu7X+YHW+Aya9z9Bsyrjx
 0QNcBLiSvdn58A1ktt4uCmc6vl4zAe0+4hvPJiOJPzYW6Js+T51KHv0s/33mFTJxh2pc
 u9LnqL7vzzsrlxudml3IqHXo8vMK8+2xY8b78Xw2UwGm3DVwprFm+r2krvszoUVsT0EX
 vU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BZgy/avQrARbPHnmM1gwEInAIYc/CCT9PzE1R/a8ERg=;
 b=E6llxvbJ69LY7bgSq+V9Gjc2vsAIU3tgxes7NTzEwy+T4gXeAb0WKnvSBp6BSuUJ9L
 3xCPwB4YpJdtuI8U2yXdr9FFj8uhZQJjXseFOrU6Az8EhIuZHtViWwlL03o4HftzXboR
 jXiBq18LDs+BtYSa7XxpyhkWNF+bh36PuYyzYJtE3b+O1MbQw5hQSXkRs8aWGfQGoPHt
 CFyehGRSDqeqLqVJcbK1WzwNB/JGZjITcQ9ktAeTi+yaPxqOEcoK0GIHevxyPX3tvxQe
 TbrKdSZiLmOSnVX8xPq5ylhhfDPqEIVby+QWlZDDd5oCKhkgCLIPXkdD7UyuEM79pR1A
 Gytw==
X-Gm-Message-State: AOAM532uKIfbN5xlXqyaHkkbyXeklFtWEVx09d7xAkm4N5BZGzslDxc+
 vVghEGawaaiAVNdnD7RKQsRkrw==
X-Google-Smtp-Source: ABdhPJxnhEiMGiz4qwPtOPQjANqQ+7cIivNFchbn7Cus0y2Lpq/Oy2kNCUaNMBz0+FUPJPxDdDgFag==
X-Received: by 2002:a05:6000:c5:: with SMTP id
 q5mr4147031wrx.175.1602661384109; 
 Wed, 14 Oct 2020 00:43:04 -0700 (PDT)
Received: from [10.1.3.24] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m14sm3390913wro.43.2020.10.14.00.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2020 00:43:03 -0700 (PDT)
Subject: Re: [PATCH] reset: meson: make it possible to build as a module
To: Robin Murphy <robin.murphy@arm.com>, p.zabel@pengutronix.de
References: <20201013133943.412119-1-narmstrong@baylibre.com>
 <f8c0feba-c235-e22f-2ea5-61e54fe97c0f@arm.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <ce6c0961-7582-8b03-127f-88e4e1e84b78@baylibre.com>
Date: Wed, 14 Oct 2020 09:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8c0feba-c235-e22f-2ea5-61e54fe97c0f@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_034305_465769_33AF47B2 
X-CRM114-Status: GOOD (  20.61  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTMvMTAvMjAyMCAxNjo1NywgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjAtMTAtMTMg
MTQ6MzksIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+PiBJbiBvcmRlciB0byByZWR1Y2UgdGhlIGtl
cm5lbCBJbWFnZSBzaXplIG9uIG11bHRpLXBsYXRmb3JtIGRpc3RyaWJ1dGlvbnMsCj4+IG1ha2Ug
aXQgcG9zc2libGUgdG8gYnVpbGQgdGhlIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyIGFzIGEgbW9k
dWxlLgo+Pgo+PiBUaGlzIHBhcnRpYWxseSByZXZlcnRzIDgyOTA5MjRlICgicmVzZXQ6IG1lc29u
OiBtYWtlIGl0IGV4cGxpY2l0bHkgbm9uLW1vZHVsYXIiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBO
ZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2
ZXJzL3Jlc2V0L0tjb25maWfCoMKgwqDCoMKgwqAgfCA0ICsrLS0KPj4gwqAgZHJpdmVycy9yZXNl
dC9yZXNldC1tZXNvbi5jIHwgNyArKysrKystCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNl
dC9LY29uZmlnIGIvZHJpdmVycy9yZXNldC9LY29uZmlnCj4+IGluZGV4IGQ5ZWZiZmQyOTY0Ni4u
YWIzMTU2MTc1NjVmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3Jlc2V0L0tjb25maWcKPj4gKysr
IGIvZHJpdmVycy9yZXNldC9LY29uZmlnCj4+IEBAIC05NCw4ICs5NCw4IEBAIGNvbmZpZyBSRVNF
VF9MUEMxOFhYCj4+IMKgwqDCoMKgwqDCoMKgIFRoaXMgZW5hYmxlcyB0aGUgcmVzZXQgY29udHJv
bGxlciBkcml2ZXIgZm9yIE5YUCBMUEMxOHh4LzQzeHggU29Dcy4KPj4gwqAgwqAgY29uZmlnIFJF
U0VUX01FU09OCj4+IC3CoMKgwqAgYm9vbCAiTWVzb24gUmVzZXQgRHJpdmVyIiBpZiBDT01QSUxF
X1RFU1QKPj4gLcKgwqDCoCBkZWZhdWx0IEFSQ0hfTUVTT04KPj4gK8KgwqDCoCB0cmlzdGF0ZSAi
TWVzb24gUmVzZXQgRHJpdmVyIgo+PiArwqDCoMKgIGRlZmF1bHQgQVJDSF9NRVNPTiB8fCBDT01Q
SUxFX1RFU1QKPiAKPiBIb3cgYWJvdXQgYW4gYWN0dWFsIGRlcGVuZGVuY3kgbGlrZToKPiAKPiDC
oMKgwqDCoGRlcGVuZHMgb24gQVJDSF9NRVNPTiB8fCBDT01QSUxFX1RFU1QKPiDCoMKgwqDCoGRl
ZmF1bHQgQVJDSF9NRVNPTgo+ID8KPiAKPiBUaGF0IHdheSB0aGUgb3B0aW9uIHdvbid0IGJlIHBy
ZXNlbnRlZCB0byB1c2VycyB3aGVyZSBpdCdzIGNvbXBsZXRlbHkgaXJyZWxldmFudCwgZS5nLiBy
dW5uaW5nICJtYWtlIG9sZGNvbmZpZyIgd2l0aCBhbiB4ODYgZGlzdHJvIGNvbmZpZy4gSXQgYWx3
YXlzIGJ1Z3MgbWUgd2hlbiBJIHJlYmFzZSBhIGJyYW5jaCBhbmQgaGF2ZSB0byBtYW51YWxseSBj
b25maXJtIHRoYXQgaW5kZWVkIEkgZG9uJ3Qgd2FudCB0byBidWlsZCByYW5kb20gZHJpdmVycyBz
cGVjaWZpYyB0byB4ODYvUklTQy1WL2V0Yy4gU29DcyBmb3IgbXkgYXJtNjQgY29uZmlnLi4uIDsp
CgpZb3UncmUgcmlnaHQsIHRoYW5rcyBmb3IgcG9pbnRpbmcgbWUgdGhpcy4KCk5laWwKCj4gCj4g
Um9iaW4uCj4gCj4+IMKgwqDCoMKgwqAgaGVscAo+PiDCoMKgwqDCoMKgwqDCoCBUaGlzIGVuYWJs
ZXMgdGhlIHJlc2V0IGRyaXZlciBmb3IgQW1sb2dpYyBNZXNvbiBTb0NzLgo+PiDCoCBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9yZXNldC9yZXNldC1tZXNvbi5jIGIvZHJpdmVycy9yZXNldC9yZXNldC1t
ZXNvbi5jCj4+IGluZGV4IDk0ZDdiYTg4ZDdkMi4uNDM0ZDVjMGY4NzdlIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL3Jlc2V0L3Jlc2V0LW1lc29uLmMKPj4gKysrIGIvZHJpdmVycy9yZXNldC9yZXNl
dC1tZXNvbi5jCj4+IEBAIC05LDYgKzksNyBAQAo+PiDCoCAjaW5jbHVkZSA8bGludXgvaW5pdC5o
Pgo+PiDCoCAjaW5jbHVkZSA8bGludXgvaW8uaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L29mLmg+
Cj4+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3Jlc2V0LWNvbnRyb2xsZXIuaD4K
Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPj4gQEAgLTE0Miw0ICsxNDMsOCBAQCBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtZXNvbl9yZXNldF9kcml2ZXIgPSB7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCAub2ZfbWF0Y2hfdGFibGXCoMKgwqAgPSBtZXNvbl9yZXNldF9kdF9pZHMs
Cj4+IMKgwqDCoMKgwqAgfSwKPj4gwqAgfTsKPj4gLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyKG1l
c29uX3Jlc2V0X2RyaXZlcik7Cj4+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG1lc29uX3Jlc2V0
X2RyaXZlcik7Cj4+ICsKPj4gK01PRFVMRV9ERVNDUklQVElPTigiQW1sb2dpYyBNZXNvbiBSZXNl
dCBDb250cm9sbGVyIGRyaXZlciIpOwo+PiArTU9EVUxFX0FVVEhPUigiTmVpbCBBcm1zdHJvbmcg
PG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiIpOwo+PiArTU9EVUxFX0xJQ0VOU0UoIkR1YWwgQlNE
L0dQTCIpOwo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
