Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D25CA6018
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5++T7wecBaMfxpRExxOU0yXzTijY8/UjR9NHYrRZhDo=; b=33Qcvewzkjh2aY
	lcMvisQsChEQ8tpnBCMrxd76nYdVB8jGRdcN865XijfJPPtzKUWdFAR3AW13tggrNA6b3vQ3SWDgd
	/mzdM7wZn3Ac4Q1hfYUgP4ynGTa6jDZQ6e38P60gzIfKzQSQVpgK7DLnqSaQ5uydvb0MBkZeBqHun
	JWMSav+VkG8M+98vOV55FV2TFYXGUDkT0uccCpTQaARMTejwfl5TqoRCVIqb1l7EU+eUeaHBJrYQc
	J1Y9ULc0SMpUdv6Sr7uAkLRIeYAvYgxqpu82SgdtmJB9K1lM+vvUmf7oLcm6PEZm21qpenDZQ2EK6
	AQvFh+kb69gFxgzfjHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1Q4-00000005P1Q-0H2S;
	Fri, 09 Oct 2026 03:37:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1Q2-00000005P1F-1KKi
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:37:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A873D60DB0;
	Fri,  9 Oct 2026 03:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337D01F000FF;
	Fri,  9 Oct 2026 03:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517033;
	bh=lZSS/2RFzLxHfGPISuolpDPcoGqgS5kdjH1YQ467zPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A2tiCLpwJcacb1xdRusfD8qgcoTJ79YS0B9pjwCegN7UQ3nmJiIzcPWYS/5HlrBWB
	 cojSw6jaH3LvmxLXIc1VMoYnj0G3UT2/nbS9R2eYq2ZYm32e5ImehHIE5q68QHI8mL
	 fT54iAvIXyjBeFBX2OtwdoStRnyLVES1FY9O+okMBDPAgLD4lQ5sZW61iKofBWk+BI
	 X9MXXZ/Vi4qgn6SPjLY1MwWUyDrppX8IFcO8+IFmgmK+RgMVJPYKxLLvDTVKAnTeUG
	 jVtcSr4mFhzWFBucAIMaXkn40/k0h48/lI2o2xJ5/dmfMhOT7MPxCm4cRa/htdpuIG
	 Kne6lb22K0uhA==
Message-ID: <sashiko-outbox-164779@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/20] drm/msm/dp: Keep runtime PM calls outside the
 connection lock
To: "Xilin Wu" <sophon@radxa.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261009-msm-dp-hdr10-v2-6-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-6-1835d4966da3@radxa.com>
Date: Fri, 09 Oct 2026 03:37:12 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGRybS9tc206IFVucmVz
b2x2ZWQgQUJCQSBkZWFkbG9jayBiZXR3ZWVuIHJ1bnRpbWVfc3VzcGVuZCBhbmQgSVJRIHRocmVh
ZAotLQoKY29tbWl0IDMyZjBlNDYzYjQ2YjgyNGQxYjMxMjZkOGMwMTdkNmY0NTA5YThjN2IKQXV0
aG9yOiBYaWxpbiBXdSA8c29waG9uQHJhZHhhLmNvbT4KCmRybS9tc20vZHA6IEtlZXAgcnVudGlt
ZSBQTSBjYWxscyBvdXRzaWRlIHRoZSBjb25uZWN0aW9uIGxvY2sKClRoaXMgY29tbWl0IHNoaWZ0
cyBydW50aW1lIFBNIGNhbGxzIG91dHNpZGUgdGhlIGNvbm5lY3Rpb24gbG9jayBpbiB0aGUgcGx1
ZywKdW5wbHVnLCBhbmQgZGV0ZWN0IGhhbmRsZXJzLiBUaGUgZ29hbCBpcyB0byBhdm9pZCBob2xk
aW5nIHRoZSBsb2NrIGR1cmluZwpzeW5jaHJvbm91cyBQTSBvcGVyYXRpb25zIHRoYXQgbWlnaHQg
ZGVhZGxvY2sgd2l0aCBIUEQgSVJRIHRocmVhZHMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlz
cGxheS5jCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwoKWyAuLi4gXQoKPiBAQCAtNDg4
LDEwICs0OTEsMTAgQEAgc3RhdGljIGludCBtc21fZHBfaHBkX3VucGx1Z19oYW5kbGUoc3RydWN0
IG1zbV9kcF9kaXNwbGF5X3ByaXZhdGUgKmRwKQo+ICAJCQlkcC0+bXNtX2RwX2Rpc3BsYXkuY29u
bmVjdG9yX3R5cGUsCj4gIAkJCWRwLT5saW5rLT5zaW5rX2NvdW50KTsKPiAgCj4gLQlpZiAoZHAt
PnBsdWdnZWQpIHsKPiAtCQlwbV9ydW50aW1lX3B1dF9zeW5jKCZwZGV2LT5kZXYpOwo+IC0JCWRw
LT5wbHVnZ2VkID0gZmFsc2U7Cj4gLQl9Cj4gKwlkcC0+cGx1Z2dlZCA9IGZhbHNlOwo+ICsJbXV0
ZXhfdW5sb2NrKCZkcC0+cGx1Z2dlZF9sb2NrKTsKPiArCj4gKwlwbV9ydW50aW1lX3B1dF9zeW5j
KCZwZGV2LT5kZXYpOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgc3RpbGwgbGVhdmUgYW4g
QUJCQSBkZWFkbG9jaywganVzdCBzaGlmdGVkIGZyb20gdGhlIHBsdWdnZWRfbG9jawp0byB0aGUg
UE0gcnVudGltZSB3YWl0IHF1ZXVlPwoKSWYgYSBwcm9jZXNzIHRocmVhZCAoZS5nLiwgZHVyaW5n
IHVuYmluZCkgY2FsbHMgdGhpcyBwbV9ydW50aW1lX3B1dF9zeW5jKCkKYW5kIGRyb3BzIHRoZSBQ
TSB1c2FnZSBjb3VudCB0byAwLCBpdCB0cmlnZ2VycyBtc21fZHBfcG1fcnVudGltZV9zdXNwZW5k
KCkuCgpUaGUgc3VzcGVuZCBjYWxsYmFjayBjYWxscyBkaXNhYmxlX2lycShkcC0+aXJxKSwgd2hp
Y2ggc3luY2hyb25vdXNseSBibG9ja3MKd2FpdGluZyBmb3IgdGhlIG1zbV9kcF9kaXNwbGF5X2ly
cV90aHJlYWQgdG8gY29tcGxldGUuCgpIb3dldmVyLCBpZiB0aGUgSVJRIHRocmVhZCBpcyBjb25j
dXJyZW50bHkgaGFuZGxpbmcgYW4gZXZlbnQsIGl0IGV4ZWN1dGVzCm1zbV9kcF9icmlkZ2VfaHBk
X25vdGlmeSgpLCB3aGljaCB1bmNvbmRpdGlvbmFsbHkgY2FsbHM6Cgptc21fZHBfYnJpZGdlX2hw
ZF9ub3RpZnkoKQogICBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCZtc21fZHBfZGlzcGxheS0+
cGRldi0+ZGV2KQoKQmVjYXVzZSB0aGUgZGV2aWNlIHN0YXRlIGlzIFJQTV9TVVNQRU5ESU5HLCB0
aGUgSVJRIHRocmVhZCBibG9ja3Mgb24gdGhlClBNIHJ1bnRpbWUgd2FpdCBxdWV1ZSB3YWl0aW5n
IGZvciB0aGUgc3VzcGVuZCB0byBmaW5pc2guIFRoZSBzdXNwZW5kIHRocmVhZAppcyBibG9ja2Vk
IG9uIGRpc2FibGVfaXJxKCkgd2FpdGluZyBmb3IgdGhlIElSUSB0aHJlYWQsIHJlc3VsdGluZyBp
biBhCmRlYWRsb2NrLgoKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAwOS1tc20tZHAtaGRy
MTAtdjItMC0xODM1ZDQ5NjZkYTNAcmFkeGEuY29tP3BhcnQ9NgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
