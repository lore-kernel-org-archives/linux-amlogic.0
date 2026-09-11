Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914EEC88E4C
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMBNbvfl3vC3Qaz6sQpJL/UtbgueJSZtzijMIaBz4Iw=; b=gcS2Eu39Ul68Zz
	9OPZMVZupzT+hHQm4SA6J3F6nAzX25VkCurhwaGW5xsIgnXLmbhXfnWFTFtZ9ndUzTRzUMtupHMCZ
	7/atX11g31be7D8RhZGkEhtgOG6zwNuLgm67beC8VarYQrFbf6i36bOk8zTS1Cz3ZYhy2tgm9KJJj
	BclW46bYWBQfQNDkR0tGsTw7yzFKKDCq72mMuQiIgEAx9H8LKLcgA0F5iYZK79DVUi4XZaeDs2Lap
	vwFspKWeoV7Se/FJjCmziDC8MG/uccw1qwckMZUHwkMJLOIXqE8Vk+5RIUu9JqE0iKVuORd+xXEgn
	aoX93dWw2/MAQs9W/chQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wlX-0000000G9lV-1cdi;
	Fri, 11 Sep 2026 08:37:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wlT-0000000G9lB-3PCB
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 08:37:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22C5743802;
	Fri, 11 Sep 2026 08:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6621F000FF;
	Fri, 11 Sep 2026 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789115863;
	bh=U/+R2RBZtLxPW6+25viO0bXXL/EUGvVqhK7SwO+jNZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ODVaoip7GFHffz3k8iEAYoIzaT6bQkrwMLGLBMtw5cxFot0tb4oYVLzr/a8TakBgD
	 pyOE2wEa6LVvHzPWtbSldpN2h4LtZj5+xz9mB1N/TNMoSi9Ro0csvkxbgKhg3g9hFT
	 BlUhaDwPvmFFpQPPuV8RxuJ1ZPLocv0Vqrmc3kYdotw0bOSsbNli+VEO2XcCXL02kQ
	 LrFL24KEj4kIWYkcVx3J5unV/GMEzxABQQISAFfAF3hiONb0UKDtxJRXWch4LwfEfp
	 IeIE+IPpzTxo3l2yF6tc1VJeHs7nB84HHiVOU2jTTgPhpBjI5OR+0W38bHQtAP7DHd
	 6a+Z/gZsGQjAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] soc: amlogic: clk-measure: Add support for more
 SoCs
To: "Chuan Liu" <chuan.liu@amlogic.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-3-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
 <20260911-more-socs-to-support-clk_measure-v1-3-940e269aa52f@amlogic.com>
Date: Fri, 11 Sep 2026 08:37:42 +0000
Message-Id: <20260911083742.9C6621F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIGBjbGtfbXNyX2E5
YCBhcnJheSBpcyBtaXNzaW5nIHRoZSBgY29uc3RgIHF1YWxpZmllciwgY2F1c2luZyBpdCB0byBi
ZSBwbGFjZWQgaW4gdGhlIG1vZGlmaWFibGUgYC5kYXRhYCBzZWN0aW9uIGluc3RlYWQgb2YgdGhl
IHJlYWQtb25seSBgLnJvZGF0YWAgc2VjdGlvbi4KLSBbTG93XSBQb3NzaWJsZSB0eXBvIGluIHRo
ZSBjbG9jayBuYW1lICJleGl0X1RzaW5fQl9DTEtfSU4iIGZvciBJRCAyNiBpbiB0aGUgYGNsa19t
c3JfYTlgIGFycmF5LgotLQoKY29tbWl0IGYwM2VjNDJjYTBkNzA5MmY4OGQyM2JhMDZkNGJmYjM4
ZmMzM2VkZTEKQXV0aG9yOiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KCnNvYzog
YW1sb2dpYzogY2xrLW1lYXN1cmU6IEFkZCBzdXBwb3J0IGZvciBtb3JlIFNvQ3MKClRoaXMgY29t
bWl0IGFkZHMgY2xrLW1lYXN1cmUgZHJpdmVyIHN1cHBvcnQgZm9yIHNldmVyYWwgQW1sb2dpYyBT
b0NzCmluY2x1ZGluZyBBNSwgQTQsIFM3LCBTN0QsIFM2LCBhbmQgQTkuCgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NvYy9hbWxvZ2ljL21lc29uLWNsay1tZWFzdXJlLmMgYi9kcml2ZXJzL3NvYy9h
bWxvZ2ljL21lc29uLWNsay1tZWFzdXJlLmMKPiBpbmRleCAwZDRiYTI1NTVkMTc1Li42NzFlMGMz
NzUzZGVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc29jL2FtbG9naWMvbWVzb24tY2xrLW1lYXN1
cmUuYwo+ICsrKyBiL2RyaXZlcnMvc29jL2FtbG9naWMvbWVzb24tY2xrLW1lYXN1cmUuYwpbIC4u
LiBdCj4gQEAgLTEwNDEsNiArMTA0MSw4NDMgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9t
c3JfaWQgY2xrX21zcl90N1tdID0gewpbIC4uLiBdCj4gK3N0YXRpYyBzdHJ1Y3QgbWVzb25fbXNy
X2lkIGNsa19tc3JfYTlbXSA9IHsKCltTZXZlcml0eTogTG93XQpJcyB0aGUgbWlzc2luZyBjb25z
dCBxdWFsaWZpZXIgaGVyZSBpbnRlbnRpb25hbD8gV2l0aG91dCBjb25zdCwgdGhpcyBhcnJheSBp
cwpwbGFjZWQgaW4gdGhlIG1vZGlmaWFibGUgZGF0YSBzZWN0aW9uIGluc3RlYWQgb2YgdGhlIHJl
YWQtb25seSByb2RhdGEgc2VjdGlvbiwKaW5jcmVhc2luZyB0aGUgbXV0YWJsZSBtZW1vcnkgZm9v
dHByaW50LgoKT3RoZXIgY2xvY2sgSUQgdGFibGVzIGludHJvZHVjZWQgaW4gdGhpcyBwYXRjaCwg
c3VjaCBhcyBjbGtfbXNyX2E1IGFuZApjbGtfbXNyX3M3LCBhcmUgcHJvcGVybHkgZGVmaW5lZCBh
cyBzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX21zcl9pZC4gQmVjYXVzZQp0aGUgZHJpdmVyIG9u
bHkgY29waWVzIHRoZSBlbGVtZW50cyBmcm9tIHRoZXNlIGFycmF5cyBkdXJpbmcgZGV2aWNlIHBy
b2JlLAp0aGUgb3JpZ2luYWwgdGVtcGxhdGUgYXJyYXkgZG9lcyBub3QgbmVlZCB0byBiZSBtdXRh
YmxlLgoKPiArCUNMS19NU1JfSUQoMCwgICJzeXNfY2xrIiksCj4gKwlDTEtfTVNSX0lEKDEsICAi
YXhpX2NsayIpLApbIC4uLiBdCj4gKwlDTEtfTVNSX0lEKDI0LCAiZGRyX2RwbGxfcHRfY2xrIiks
Cj4gKwlDTEtfTVNSX0lEKDI1LCAibW9kX1RzaW5fQV9DTEtfSU4iKSwKPiArCUNMS19NU1JfSUQo
MjYsICJleGl0X1RzaW5fQl9DTEtfSU4iKSwKCltTZXZlcml0eTogTG93XQpEb2VzIHRoaXMgc3Ry
aW5nIGNvbnRhaW4gYSB0eXBvPyBUaGUgbmFtZSAiZXhpdF9Uc2luX0JfQ0xLX0lOIiBpcyBleHBv
cnRlZCB0bwp1c2Vyc3BhY2UgdmlhIGRlYnVnZnMuCgpJbiBzaW1pbGFyIFNvQyBkZWZpbml0aW9u
cyBsaWtlIGNsa19tc3JfczYsIHRoZSBjb3JyZXNwb25kaW5nIElEIDI2IGlzIG5hbWVkCiJleHRf
VHNpbl9CX0NMS19JTiIsIGxpa2VseSBzdGFuZGluZyBmb3IgZXh0ZXJuYWwuIFVzaW5nICJleGl0
IiBoZXJlIGluc3RlYWQKb2YgImV4dCIgY291bGQgY29uZnVzZSB1c2VycyBvciBicmVhayB1c2Vy
c3BhY2Ugc2NyaXB0cyBleHBlY3RpbmcgY29uc2lzdGVudApuYW1pbmcgYWNyb3NzIFNvQ3MuCgo+
ICsJQ0xLX01TUl9JRCgyNywgInUzcDJwbGwxXzBfY2xrX2RpdjE2IiksClsgLi4uIF0KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5
MTEtbW9yZS1zb2NzLXRvLXN1cHBvcnQtY2xrX21lYXN1cmUtdjEtMC05NDBlMjY5YWE1MmZAYW1s
b2dpYy5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
