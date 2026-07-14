Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10486C4450C
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGuAzPMm7viKwYhGVj55AKUapfYgNtXHpuRIX5HLSX8=; b=Zd72jOjEVobzDn
	QRCEaJ2VUIX9+Y1HxcOql2YkH5eLrWMOYrN570jQZDHr27JRHvvkgtgj6lj1cEjkNIqfnyLjHycwz
	/veYyFCvRnIbLJfh+U9EhYnucV1iK12g4ZXlBhsNBuAZlPGuPdhTFZ4CsBeyq/XDuOk4ytjnEsUC1
	vkFLgFR5DAzHL+l5dRRGQjVeqgZv69JyUfpMo8ZAjsXUHFbPcHqMjZu3qZ5iZ+FKaAVwFqO/gcxqH
	gTN8QwoLMxUgx+Fx43HO+1cBaamS4r+xgNOC7PYuqLpEhZGCseFYjxZ37KOKah2oSofds+Gp+96Ez
	S7wYn8qhJoR3FxieWfRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfHB-0000000CZLk-0k7F;
	Tue, 14 Jul 2026 15:42:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfHA-0000000CZL2-3tf1
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 15:42:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA73F41A34;
	Tue, 14 Jul 2026 15:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110201F000E9;
	Tue, 14 Jul 2026 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784043748;
	bh=KzLzlZEIQWdOfOHHccHzIxsuh8r8/GLHQufn8tqIl00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JaB+BSn1vjJemZtx4BVnFEQqoC1yNc7sTpqpG+DByqrYclrLj47X5LIhBkfbKxNdT
	 5pTP8eIIiVNMIrJ8JA3tDDPe7TJIVyQCB7esrAWnFnTT6mUl29wpgGJlmQZ9cExfjW
	 QjY+Y/t/IN8398nR7LPPLvLrv6Fi2zqRmi818N8dPFhneBqIxieSEDmPu6c+TAO64U
	 OgooZn4VQ7GGQDGLb5e4I0A/eRTqLXm5/yENf/xSoPDzeEgeulUjP/a3GfIhMk7IfJ
	 ZjsDGSdMdaWiyuCHpTCbtWwCT/T77m2moMDTVCDu1ZNtPmgT0KXWzmEXHiTE8atouf
	 hddsmjqFKX6Cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 10/10] net: stmmac: qcom-ethqos: add
 support for sa8255p
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-10-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
 <20260713-qcom-sa8255p-emac-v13-10-119f8699ef8e@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:42:26 +0000
Message-Id: <20260714154227.110201F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGV0aHFvc19zY21pX3Nl
dHVwIG9taXRzIG1hbnVhbCBpbnZvY2F0aW9uIG9mIGV0aHFvc19jbGtzX2NvbmZpZygpLCB3aGlj
aCBwcmV2ZW50cyBNQUMgd3JhcHBlciBjb25maWd1cmF0aW9uIGR1cmluZyBwcm9iZSBhbmQgbGVh
ZHMgdG8gYSBETUEgcmVzZXQgdGltZW91dC4KLS0KCi0tLSBQYXRjaCBbMTBdOiBbUEFUQ0ggbmV0
LW5leHQgdjEzIDEwLzEwXSBuZXQ6IHN0bW1hYzogcWNvbS1ldGhxb3M6IGFkZCBzdXBwb3J0IGZv
ciBzYTgyNTVwIC0tLQpjb21taXQgYjdkYjM1YjRmODAxODg1OWQzZmM4OTM3YzI1ZDBjZmNmNmM0
MjFmMQpBdXRob3I6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3Nz
LnF1YWxjb21tLmNvbT4KCm5ldDogc3RtbWFjOiBxY29tLWV0aHFvczogYWRkIHN1cHBvcnQgZm9y
IHNhODI1NXAKCkV4dGVuZCB0aGUgZHJpdmVyIHRvIHN1cHBvcnQgdGhlIHNhODI1NXAgbW9kZWws
IHdoaWNoIHVzZXMgU0NNSSBwb3dlcgpkb21haW5zLiBUaGlzIGFkZHMgYSBuZXcgZW1hYyBkYXRh
IHZhcmlhbnQgYW5kIGEgc2VwYXJhdGUgc2V0dXAgY2FsbGJhY2suCgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+
IGluZGV4IDNhZjE2MDhmYzIxY2MuLmQzNGYyMGY4NjgxMzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3MuYwo+ICsrKyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMK
ClsgLi4uIF0KCj4gQEAgLTc1Niw2ICs3ODgsNjMgQEAgc3RhdGljIGludCBldGhxb3NfaGxvc19z
ZXR1cChzdHJ1Y3QgcWNvbV9ldGhxb3MgKmV0aHFvcywKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+
ICtzdGF0aWMgY29uc3QgY2hhciAqY29uc3QgZXRocW9zX3NjbWlfcGRfbmFtZXNbXSA9IHsgImNv
cmUiLCAibWRpbyIgfTsKPiArCj4gK3N0YXRpYyBpbnQgZXRocW9zX3NjbWlfc2V0dXAoc3RydWN0
IHFjb21fZXRocW9zICpldGhxb3MsCj4gKwkJCSAgICAgc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9k
YXRhICpwbGF0X2RhdCkKPiArewoKWyAuLi4gXQoKPiArCS8qCj4gKwkgKiBSdW4gb24gZXZlcnkg
cnVudGltZSByZXN1bWUsIHdoaWNoIHN0bW1hYyBwZXJmb3JtcyBhZnRlciB0aGUgcG93ZXIKPiAr
CSAqIGRvbWFpbnMgYXJlIG9uIGJ1dCBiZWZvcmUgc2VyZGVzX3Bvd2VydXAoKSBhbmQgdGhlIERN
QSByZXNldCwgc28gdGhlCj4gKwkgKiB3cmFwcGVyIGlzIGFsd2F5cyBjb25maWd1cmVkIGFoZWFk
IG9mIHRoZSByZXNldC4KPiArCSAqLwo+ICsJcGxhdF9kYXQtPmNsa3NfY29uZmlnID0gZXRocW9z
X2Nsa3NfY29uZmlnOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgY29kZSBuZWVkIHRvIGV4
cGxpY2l0bHkgY2FsbCBldGhxb3NfY2xrc19jb25maWcoKSBkdXJpbmcgcHJvYmU/CgpUaGUgc3Rt
bWFjIGNvcmUgYnJpbmdzIHRoZSBkZXZpY2Ugb3V0IG9mIHN1c3BlbmQgdXNpbmcgcG1fcnVudGlt
ZV9zZXRfYWN0aXZlKCkKZHVyaW5nIHByb2JlLCB3aGljaCBvbmx5IHVwZGF0ZXMgdGhlIFBNIHN0
YXR1cyBidXQgZG9lcyBub3QgaW52b2tlIHRoZQpydW50aW1lX3Jlc3VtZSBjYWxsYmFjay4gV2l0
aG91dCBtYW51YWxseSBjYWxsaW5nIGV0aHFvc19jbGtzX2NvbmZpZygpIGhlcmUsCndpbGwgdGhl
IHdyYXBwZXIgY2xvY2tzIHJlbWFpbiBkaXNhYmxlZCBhbmQgY2F1c2UgYSBETUEgcmVzZXQgdGlt
ZW91dD8KCj4gKwlwbGF0X2RhdC0+Y2xrX3B0cF9yYXRlID0gZXRocW9zLT5kYXRhLT5wdHBfY2xr
X3JhdGU7Cj4gKwo+ICsJc3dpdGNoIChldGhxb3MtPnBoeV9tb2RlKSB7Cj4gKwljYXNlIFBIWV9J
TlRFUkZBQ0VfTU9ERV8yNTAwQkFTRVg6CgpbIC4uLiBdCgotLSAKU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzEzLXFjb20tc2E4MjU1cC1l
bWFjLXYxMy0wLTExOWY4Njk5ZWY4ZUBvc3MucXVhbGNvbW0uY29tP3BhcnQ9MTAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
