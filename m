Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D2CC3DA7A
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Dec 2022 21:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5bXwh6oJrg7I30M9nVYo2ILmsSq8LArLWUcComynsk=; b=B2RJP4/1dqpRPl
	/vojupF/VeB2/+6Gejo4SEyIw+CFYQVrj/CFkJcY+UDbFkAMv2pqXbF0yn2GELPaHHCctllxOTMq2
	1c7RXcYpBVnyociQ4yiCv3Rux/4ESGVDvkkuVnGNTa7T/CMZcRV3eRSAj6MQ+UhY5yZXwYUzzqHSN
	PtQsIc8sIfMb9C+IP0Ut2H/hy9+NHG9u5ZZLA8Dru+V8JEWt5u1mxn7IPpkJ3UCkmsr9+1CnKXqi7
	IUA+xx5u4Y/gki1zKLtcG7SdMUDTpB6ZPmeYctZfoHvucI9smGI2lmBd39jBipRs47nyLTpcr92a5
	fAZWT2ROpzU1o09L16sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB0gg-002LfS-Nu; Thu, 29 Dec 2022 21:43:42 +0000
Received: from smtp-15.smtpout.orange.fr ([80.12.242.15] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB0gb-002LZ3-MP
	for linux-amlogic@lists.infradead.org; Thu, 29 Dec 2022 21:43:40 +0000
Received: from [192.168.1.18] ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id B0gKp7mDjBicGB0gKpHr5U; Thu, 29 Dec 2022 22:43:25 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 29 Dec 2022 22:43:25 +0100
X-ME-IP: 86.243.100.34
Message-ID: <c0deb523-0458-5422-bed5-ee104ca7c479@wanadoo.fr>
Date: Thu, 29 Dec 2022 22:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] PCI: amlogic: The check for devm_add_action_or_reset's
 return value added
Content-Language: fr, en-US
To: Aleksandr Burakov <a.burakov@rosalinux.ru>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Yue Wang <yue.wang@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20221220092137.6527-1-a.burakov@rosalinux.ru>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20221220092137.6527-1-a.burakov@rosalinux.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_134337_904282_36C44F02 
X-CRM114-Status: GOOD (  15.33  )
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

TGUgMjAvMTIvMjAyMiDDoCAxMDoyMSwgQWxla3NhbmRyIEJ1cmFrb3YgYSDDqWNyaXTCoDoKPiBU
aGUgcmV0dXJuIHZhbHVlIG9mIHRoZSBmdW5jdGlvbiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQo
KSB3YXMgbm90Cj4gY2hlY2tlZCBoZW5jZSBhbiBlcnJvciBjb2RlIHdvdWxkIG5vdCBiZSByZXR1
cm5lZC4KPiAKPiBGb3VuZCBieSBMaW51eCBWZXJpZmljYXRpb24gQ2VudGVyIChsaW51eHRlc3Rp
bmcub3JnKSB3aXRoIFNWQUNFLgo+IAo+IEZpeGVzOiA5YzBlZjZkMzRmZGIgKCJQQ0k6IGFtbG9n
aWM6IEFkZCB0aGUgQW1sb2dpYyBNZXNvbiBQQ0llIGNvbnRyb2xsZXIgZHJpdmVyIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGVrc2FuZHIgQnVyYWtvdiA8YS5idXJha292QHJvc2FsaW51eC5ydT4KPiAt
LS0KPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jIHwgNiArKysrKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYwo+IGluZGV4IGMxNTI3NjkzYmVkOS4u
M2Q4MmYwYjY1NDgwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3Bj
aS1tZXNvbi5jCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLW1lc29uLmMK
PiBAQCAtMTg3LDkgKzE4NywxMyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBjbGsgKm1lc29uX3Bj
aWVfcHJvYmVfY2xvY2soc3RydWN0IGRldmljZSAqZGV2LAo+ICAgCQlyZXR1cm4gRVJSX1BUUihy
ZXQpOwo+ICAgCX0KPiAgIAo+IC0JZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwKPiArCXJl
dCA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsCj4gICAJCQkJICh2b2lkICgqKSAodm9p
ZCAqKSljbGtfZGlzYWJsZV91bnByZXBhcmUsCgpIaSwKCnVzaW5nIGRldm1fY2xrX2dldF9lbmFi
bGVkKCkgYSBmZXcgbGluZXMgYWJvdmUgd291bGQgYmUgSU1ITyBtdWNoIG1vcmUgCmVsZWdhbnQg
dGhhbiB0aGVzZSBjYXN0cy4KClRoaXMgYWxzbyBzYXZlcyBhIGZldyBMb0MgYW5kIGF2b2lkIHNv
bWUgb3RoZXIgd2FybmluZ3MvaXNzdWVzLiAoc2VlIFsxXSkKClN1Y2ggYW4gYXBwcm9hY2ggaGFz
IGFscmVhZHkgYmVlbiB1c2VkIGluIFsyXS4KCkp1c3QgbXkgMmMsCgpDSgoKWzFdOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjExMTgyMzMxMDEubmV2ZXIuMjE1LWtlZXNAa2VybmVs
Lm9yZy8KWzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjEyMDIxODQ1MjUuZ29u
bmEuNDIzLWtlZXNAa2VybmVsLm9yZy8KCj4gICAJCQkJIGNsayk7Cj4gKwlpZiAocmV0KSB7Cj4g
KwkJZGV2X2VycihkZXYsICJjb3VsZG4ndCByZXNldCBjbGtcbiIpOwo+ICsJCXJldHVybiBFUlJf
UFRSKHJldCk7Cj4gKwl9Cj4gICAKPiAgIAlyZXR1cm4gY2xrOwo+ICAgfQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
