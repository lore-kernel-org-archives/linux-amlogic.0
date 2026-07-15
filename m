Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E25C44501
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 18:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjB735VKUa6risrqxFLgjnynSSXCFyQd2mqgg25i7Hg=; b=D5dViGe7+t8NDP
	KMpg96nsAV6N2PllPaf6iFu/wGBasFjmdOjZOQ3arBhUcLF6LkWe3U/6XxhuzJP1B+C67MEWhMLJw
	2qhUFKWdV9ypKs/vsT5SF4THuqVXsoWFGPivj62PleRc3sQnTMTTBDDTI+REGV9OQSwm8O0TscwHn
	i5u3T4UMJNuuxSKfczccZqxMeK50VeggoWhKrFYwSUHeF/t5cwRR0nm0PxraZtXVT7RFTDYuARpqM
	3ouujRo8UwivWk3z5eMqZ4IFrUL29uGji5Ys02/hV55N/1R241jUGdtHQyQlYf3bsEdpf14IwjVbG
	leZ9ERjqvYHDFTevd5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3xa-0000000Fc8V-0coZ;
	Wed, 15 Jul 2026 18:03:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3xZ-0000000Fc8O-1bcK
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jul 2026 18:03:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B99B402AC;
	Wed, 15 Jul 2026 18:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC1F1F000E9;
	Wed, 15 Jul 2026 18:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784138632;
	bh=+hLdvm5bi4I2pqi5e5o8weLMk1N1xO7kttAv7fJ38vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jKuHNa/2hlrkqgW4gS/thhfVqTVLy80WzuC8MPPxLC/E2kl0bPlcJtGeLSbvQD3No
	 QTat5XKZQGKmzmFX3OHAMOq1zpTiHGHIWeom+MXrmdWKyWrdYLPuN8jr/YOVqsy7jG
	 E/BOsE4J4KnKjUE785UpU1xSQAagbhfAAnNG0uz6uzYfPE9LXnuYUTDoZdikeakdJu
	 nGi0HEQLP+diJuVmiHLdj4Bm0B8VWtuSpZ7IrKf2LMLDiMwnD4jl1nYJ+rz73RNg3/
	 lCkAGKWwIqAA7pz1ukvwX5oYjHMRTWUSXBI6HoX2v2RTglHF8gI/96sPZTqk3KyjZT
	 aUlVPYpzkVdGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] iio: pressure: bmp280: make reg_write callback take
 const void *
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, ojeda@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, lee@kernel.org, linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260715175229.24672-6-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
 <20260715175229.24672-6-linkmauve@linkmauve.fr>
Date: Wed, 15 Jul 2026 18:03:51 +0000
Message-Id: <20260715180352.3EC1F1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtMb3ddIFN5
bnRheCBlcnJvciBkdWUgdG8gJ3ZvaWQgdm9pZCAqX3ZhbCcgcGFyYW1ldGVyIGluIHFmcHJvbV9y
ZWdfd3JpdGUuCgpQcmUtZXhpc3RpbmcgaXNzdWVzOgotIFtDcml0aWNhbF0gbTQ4dDU5X252cmFt
X3JlYWQgYW5kIG00OHQ1OV9udnJhbV93cml0ZSBjb21wbGV0ZWx5IGlnbm9yZSB0aGUgcmVxdWVz
dGVkIG9mZnNldC4KLS0KCi0tLSBQYXRjaCBbNV06IFtQQVRDSCA1LzhdIGlpbzogcHJlc3N1cmU6
IGJtcDI4MDogbWFrZSByZWdfd3JpdGUgY2FsbGJhY2sgdGFrZSBjb25zdCB2b2lkICogLS0tCmNv
bW1pdCBiZDg0MDRjOGM2ZDY5MmQ5YTcwMDU3ODQ1NTExMWY3OGZkMGVhZjJhCkF1dGhvcjogTGlu
ayBNYXV2ZSA8bGlua21hdXZlQGxpbmttYXV2ZS5mcj4KCmlpbzogcHJlc3N1cmU6IGJtcDI4MDog
bWFrZSByZWdfd3JpdGUgY2FsbGJhY2sgdGFrZSBjb25zdCB2b2lkICoKClRoZSBwcmV2aW91cyBj
b21taXQgc3dpdGNoZWQgZnJvbSBhIHBvaW50ZXIgdG8gbXV0YWJsZSBkYXRhIHRvIGEgcG9pbnRl
cgp0byBpbW11dGFibGUgZGF0YSwgc28gbGV04oCZcyBmaXggYWxsIHVzZXJzIG9mIHRoZSBudm1l
bV9jb25maWcgQVBJLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9xZnByb20uYyBiL2Ry
aXZlcnMvbnZtZW0vcWZwcm9tLmMKPiBpbmRleCBhODcyYzY0MGI4YzVhLi5iYWNkY2I1NjEwYmFl
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbnZtZW0vcWZwcm9tLmMKPiArKysgYi9kcml2ZXJzL252
bWVtL3FmcHJvbS5jCj4gQEAgLTI1MywxMyArMjUzLDEzIEBAIHN0YXRpYyBpbnQgcWZwcm9tX2Vu
YWJsZV9mdXNlX2Jsb3dpbmcoY29uc3Qgc3RydWN0IHFmcHJvbV9wcml2ICpwcml2LAo+ICAgKgo+
ICAgKiBSZXR1cm46IDAgb3IgLWVyci4KPiAgICovCj4gLXN0YXRpYyBpbnQgcWZwcm9tX3JlZ193
cml0ZSh2b2lkICpjb250ZXh0LCB1bnNpZ25lZCBpbnQgcmVnLCB2b2lkICpfdmFsLAo+ICtzdGF0
aWMgaW50IHFmcHJvbV9yZWdfd3JpdGUodm9pZCAqY29udGV4dCwgdW5zaWduZWQgaW50IHJlZywg
dm9pZCB2b2lkICpfdmFsLAo+ICAJCQkgICAgc2l6ZV90IGJ5dGVzKQo+ICB7CgpbU2V2ZXJpdHk6
IExvd10KRG9lcyB0aGlzIHN5bnRheCBlcnJvciBpbiBxZnByb21fcmVnX3dyaXRlKCkgcHJldmVu
dCB0aGUgcWZwcm9tIGRyaXZlciBmcm9tCmNvbXBpbGluZz8KCkl0IGxvb2tzIGxpa2UgInZvaWQg
dm9pZCAqX3ZhbCIgd2FzIGludHJvZHVjZWQgZHVyaW5nIGEgZmluZC1hbmQtcmVwbGFjZQp0byBt
YWtlIHRoZSBjYWxsYmFjayB0YWtlIGEgY29uc3Qgdm9pZCBwb2ludGVyLgoKPiAgCXN0cnVjdCBx
ZnByb21fcHJpdiAqcHJpdiA9IGNvbnRleHQ7Cj4gIAlzdHJ1Y3QgcWZwcm9tX3RvdWNoZWRfdmFs
dWVzIG9sZDsKPiAgCWludCB3b3JkcyA9IGJ5dGVzIC8gNDsKPiAtCXUzMiAqdmFsdWUgPSBfdmFs
Owo+ICsJY29uc3QgdTMyICp2YWx1ZSA9IF92YWw7Cj4gIAl1MzIgYmxvd19zdGF0dXM7CgpbIC4u
LiBdCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtbTQ4dDU5LmMgYi9kcml2ZXJzL3J0
Yy9ydGMtbTQ4dDU5LmMKPiBpbmRleCA0ZTYwOGJjOGJiZDM2Li5hZDQwN2ZhZWNmMWY4IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1tNDh0NTkuYwo+ICsrKyBiL2RyaXZlcnMvcnRjL3J0
Yy1tNDh0NTkuYwo+IEBAIC0zMjUsNyArMzI1LDcgQEAgc3RhdGljIGludCBtNDh0NTlfbnZyYW1f
d3JpdGUodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50IG9mZnNldCwgdm9pZCAqdmFsLAo+ICAJc3Ry
dWN0IG00OHQ1OV9wcml2YXRlICptNDh0NTkgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsK
PiAgCXNzaXplX3QgY250ID0gMDsKPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gLQl1OCAqYnVm
ID0gdmFsOwo+ICsJY29uc3QgdTggKmJ1ZiA9IHZhbDsKPiAgCj4gIAlzcGluX2xvY2tfaXJxc2F2
ZSgmbTQ4dDU5LT5sb2NrLCBmbGFncyk7Cj4gIAoKW1NldmVyaXR5OiBDcml0aWNhbF0KVGhpcyBp
cyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdGhlIGxvb3AgaW4gbTQ4dDU5X252cmFt
X3dyaXRlKCkKY29tcGxldGVseSBpZ25vcmUgdGhlIHJlcXVlc3RlZCBvZmZzZXQ/CgpJdCBhcHBl
YXJzIHRoYXQgY250IHN0YXJ0cyBhdCAwIGFuZCBpcyB1c2VkIGFzIHRoZSBoYXJkd2FyZSBhZGRy
ZXNzIGluc3RlYWQKb2YgYWRkaW5nIHRoZSByZXF1ZXN0ZWQgb2Zmc2V0OgoKZHJpdmVycy9ydGMv
cnRjLW00OHQ1OS5jOm00OHQ1OV9udnJhbV93cml0ZSgpIHsKICAgIC4uLgoJZm9yICg7IGNudCA8
IHNpemU7IGNudCsrKQoJCU00OFQ1OV9XUklURSgqYnVmKyssIGNudCk7CiAgICAuLi4KfQoKQW55
IHN1YnN5c3RlbSBvciB1c2VyLXNwYWNlIGFwcGxpY2F0aW9uIHBlcmZvcm1pbmcgYW4gTlZNRU0g
d3JpdGUgYXQgYW4Kb2Zmc2V0IGdyZWF0ZXIgdGhhbiAwIHdpbGwgc2lsZW50bHkgb3ZlcndyaXRl
IGRhdGEgYXQgdGhlIHZlcnkgYmVnaW5uaW5nCm9mIHRoZSBOVlJBTS4KClRoZSBzYW1lIGlzc3Vl
IHNlZW1zIHRvIGJlIHByZXNlbnQgaW4gbTQ4dDU5X252cmFtX3JlYWQoKSwgd2hpY2ggY291bGQK
bGVhZCB0byBpbmNvcnJlY3QgZGF0YSBkaXNjbG9zdXJlOgoKZHJpdmVycy9ydGMvcnRjLW00OHQ1
OS5jOm00OHQ1OV9udnJhbV9yZWFkKCkgewogICAgLi4uCglmb3IgKDsgY250IDwgc2l6ZTsgY250
KyspCgkJKmJ1ZisrID0gTTQ4VDU5X1JFQUQoY250KTsKICAgIC4uLgp9CgotLSAKU2FzaGlrbyBB
SSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzE1MTc1MjI5
LjI0NjcyLTEtbGlua21hdXZlQGxpbmttYXV2ZS5mcj9wYXJ0PTUKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
