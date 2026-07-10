Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93914C43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KfdKFDja6LtQzSrh3G9MoLoyLXokd8tLd9TvmWhjVA=; b=2mGN5VWsL3ea9X
	kzyyG+qsSFgjJZx8byODafrKTZnD2zXxv5Y/8mw7z+IU+knIfEY3+HKfyHzctP9QxFnU8UCRQbiVd
	Hjt68xtFoHu4J0EselyhK0A0iStku9OsUBlfsBlW0aiKW4TGVPk8K04DzpDEgXkNc5CY5laY5tNv+
	vVjL9jROirlFS4ZQ0oXrSn13wSVLjcEPsuZ3nbeNSY3VYV+pQiCcFTHMAue7Dtg84i3HNz0Yxr/3m
	gncq0wERukPjXaUk0lff8p/uuqJhUuy+bAS7052Oj31YqZCGkxBOaWWHBMbHv1/F7gNTl88+ANpLJ
	rOeT4ah1ymrMREJ4K6kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7BJ-00000004Wqf-2fHX;
	Fri, 10 Jul 2026 09:06:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7BI-00000004WqW-0qZq
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 09:06:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4333360051;
	Fri, 10 Jul 2026 09:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACCD1F000E9;
	Fri, 10 Jul 2026 09:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783674359;
	bh=J9rzyd6L340xp6rPy58GTHS1TRh27HvV2lr9MZUTMbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RrknD1ZZcgEIEnFXRExTtRpOg8Cirt7d5TYJFahF33p8wDZJwGc3iVmtVL2aFXM83
	 B7QJhVzIUJZT4R9CYNP7t/xLjErW4z3slphSyEJf4jGRmT29GUj5i22ULk7yvUt25b
	 PIVhaVlagVJn95b8jtaOQ11nvBMphiUKRlQFvJDTyUu31SA38uGnnYRzIhmvOU1ISV
	 Ow9P4MiqaDoV+OiQ4gJkvsekFax0UqD4oiFdOsIs++DfTg2Ax5W7wRdISEn2s+bLUe
	 jSShkMOp2rEvKAUkWxxPknarSndrxKuVuHAEOKwl6hpBIZTD3KmXCwa6VF/UqD8NJN
	 wcclcZRhLYZXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] media: meson-ir-tx: Ensure clock is disabled on
 unbind
To: "Sean Young" <sean@mess.org>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <2d7772d678d1815276c2d409d68ae4f4673d09aa.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
 <2d7772d678d1815276c2d409d68ae4f4673d09aa.1783673420.git.sean@mess.org>
Date: Fri, 10 Jul 2026 09:05:58 +0000
Message-Id: <20260710090558.BACCD1F000E9@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtMb3ddIFRo
ZSBjb21taXQgbWVzc2FnZSByZWZlcnMgdG8gbm9uLWV4aXN0ZW50IGNsb2NrIEFQSSBmdW5jdGlv
bnMuCgpQcmUtZXhpc3RpbmcgaXNzdWVzOgotIFtIaWdoXSBUaGUgZHJpdmVyIG1hc2tzIGAtRVBS
T0JFX0RFRkVSYCBhbmQgb3RoZXIgZXJyb3IgY29kZXMgYnkgdW5jb25kaXRpb25hbGx5IHJldHVy
bmluZyBgLUVOT0RFVmAgd2hlbiBgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKWAgb3IgYHBsYXRmb3Jt
X2dldF9pcnEoKWAgZmFpbHMsIGJyZWFraW5nIHByb2JlIGRlZmVycmFsLgotIFtIaWdoXSBUaGUg
YHJjX2RldmAgc3RydWN0dXJlIGFsbG9jYXRlZCBkdXJpbmcgcHJvYmUgaXMgcGVybWFuZW50bHkg
bGVha2VkIG9uIGRyaXZlciB1bmJpbmQgZHVlIHRvIHRoZSB1c2Ugb2YgYHJjX2FsbG9jYXRlX2Rl
dmljZSgpYCB3aXRob3V0IGVuc3VyaW5nIGEgY29ycmVzcG9uZGluZyBgcmNfZnJlZV9kZXZpY2Uo
KWAgY2FsbC4KLS0KCi0tLSBQYXRjaCBbNV06IFtQQVRDSCA1LzddIG1lZGlhOiBtZXNvbi1pci10
eDogRW5zdXJlIGNsb2NrIGlzIGRpc2FibGVkIG9uIHVuYmluZCAtLS0KY29tbWl0IGU5NTg5NTA3
ODExMzQ5NWZlYTViOTgxZmFmZTAwMmM1ZmYxZjU2YzEKQXV0aG9yOiBTZWFuIFlvdW5nIDxzZWFu
QG1lc3Mub3JnPgoKbWVkaWE6IG1lc29uLWlyLXR4OiBFbnN1cmUgY2xvY2sgaXMgZGlzYWJsZWQg
b24gdW5iaW5kCgpUaGlzIHBhdGNoIGNoYW5nZXMgdGhlIGNsb2NrIGFjcXVpc2l0aW9uIGluIHRo
ZSBtZXNvbi1pci10eCBkcml2ZXIgdG8gdXNlCnRoZSBkZXZyZXMgbWFuYWdlZCBkZXZtX2Nsa19n
ZXRfZW5hYmxlZCgpLiBUaGlzIGVuc3VyZXMgdGhlIGNsb2NrIGlzCmF1dG9tYXRpY2FsbHkgZGlz
YWJsZWQgYW5kIHVucHJlcGFyZWQgd2hlbiB0aGUgZHJpdmVyIHVuYmluZHMuCgo+IGNsa19wcmVw
YXJlX2VuYWJsZWQoKSBuZWVkcyBhIGNhbGwgdG8gY2xrX2Rpc2FibGVfcHJlcGFyZSgpIG9uCj4g
ZHJpdmVyIHVuYmluZC4gTWFrZSBpdCBkZXZtIG1hbmFnZWQuCgpbU2V2ZXJpdHk6IExvd10KVGhp
cyBpc24ndCBhIGJ1ZywgYnV0IHRoZXJlIGFyZSB0eXBvcyBpbiB0aGUgZnVuY3Rpb24gbmFtZXMg
bWVudGlvbmVkIGhlcmUuClNob3VsZCB0aGV5IGJlIGNsa19wcmVwYXJlX2VuYWJsZSgpIGFuZCBj
bGtfZGlzYWJsZV91bnByZXBhcmUoKSBpbnN0ZWFkPwoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9yYy9tZXNvbi1pci10eC5jIGIvZHJpdmVycy9tZWRpYS9yYy9tZXNvbi1pci10eC5jCj4g
aW5kZXggZmRlZDJjMjU2ZjJhNi4uZTdiYjEwN2U2YTg0MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L21lZGlhL3JjL21lc29uLWlyLXR4LmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3JjL21lc29uLWly
LXR4LmMKPiBAQCAtMjg4LDggKzI4OCw4IEBAIHN0YXRpYyBpbnQgbWVzb25faXJ0eF9tb2RfY2xv
Y2tfcHJvYmUoc3RydWN0IG1lc29uX2lydHggKmlyLAo+ICAJaWYgKCFucCkKPiAgCQlyZXR1cm4g
LUVOT0RFVjsKPiAgCj4gLQljbG9jayA9IGRldm1fY2xrX2dldChpci0+ZGV2LCAieHRhbCIpOwo+
IC0JaWYgKElTX0VSUihjbG9jaykgfHwgY2xrX3ByZXBhcmVfZW5hYmxlKGNsb2NrKSkKPiArCWNs
b2NrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoaXItPmRldiwgInh0YWwiKTsKPiArCWlmIChJU19F
UlIoY2xvY2spKQo+ICAJCXJldHVybiAtRU5PREVWOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlz
IGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGlzIGluY29ycmVjdGx5IG1hc2sgLUVQ
Uk9CRV9ERUZFUj8KCklmIGRldm1fY2xrX2dldF9lbmFibGVkKCkgcmV0dXJucyAtRVBST0JFX0RF
RkVSLCByZXR1cm5pbmcgYSBoYXJkY29kZWQKLUVOT0RFViB3aWxsIHBlcm1hbmVudGx5IGZhaWwg
dGhlIHByb2JlIGluc3RlYWQgb2YgYWxsb3dpbmcgaXQgdG8gZGVmZXIuCldvdWxkIGl0IGJlIGJl
dHRlciB0byByZXR1cm4gUFRSX0VSUihjbG9jaykgaGVyZT8KClRoZSBzYW1lIGlzc3VlIGFwcGVh
cnMgdG8gaGFwcGVuIHdpdGggcGxhdGZvcm1fZ2V0X2lycSgpIGluCm1lc29uX2lydHhfcHJvYmUo
KToKCmRyaXZlcnMvbWVkaWEvcmMvbWVzb24taXItdHguYzptZXNvbl9pcnR4X3Byb2JlKCkgewog
ICAgLi4uCiAgICBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwogICAgaWYgKGlycSA8
IDApCiAgICAgICAgcmV0dXJuIC1FTk9ERVY7CiAgICAuLi4KfQoKV291bGQgaXQgYmUgYmV0dGVy
IHRvIHByb3BhZ2F0ZSB0aGVzZSBlcnJvciBjb2RlcyBkaXJlY3RseT8KCgpbU2V2ZXJpdHk6IEhp
Z2hdClRoaXMgaXMgYW5vdGhlciBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBkb2VzIHRoaXMgZHJp
dmVyIHBlcm1hbmVudGx5IGxlYWsKdGhlIHJjX2RldiBzdHJ1Y3R1cmUgb24gdW5iaW5kPwoKVGhl
IGRyaXZlciBhbGxvY2F0ZXMgdGhlIHN0cnVjdHVyZSBtYW51YWxseSBpbiBtZXNvbl9pcnR4X3By
b2JlKCk6Cgpkcml2ZXJzL21lZGlhL3JjL21lc29uLWlyLXR4LmM6bWVzb25faXJ0eF9wcm9iZSgp
IHsKICAgIC4uLgogICAgcmMgPSByY19hbGxvY2F0ZV9kZXZpY2UoUkNfRFJJVkVSX0lSX1JBV19U
WCk7CiAgICAuLi4KICAgIHJldCA9IGRldm1fcmNfcmVnaXN0ZXJfZGV2aWNlKGRldiwgcmMpOwog
ICAgLi4uCn0KClNpbmNlIGRldm1fcmNfcmVnaXN0ZXJfZGV2aWNlKCkgb25seSB0aWVzIHJjX3Vu
cmVnaXN0ZXJfZGV2aWNlKCkgdG8gdGhlCmRldnJlcyBjbGVhbnVwLCBhbmQgdGhlcmUgaXMgbm8g
bWF0Y2hpbmcgcmNfZnJlZV9kZXZpY2UoKSBjYWxsIG9yIHVzZSBvZgpkZXZtX3JjX2FsbG9jYXRl
X2RldmljZSgpLCBkb2VzIHRoZSBpbml0aWFsIHJlZmVyZW5jZSBjb3VudCByZW1haW4KdW4tZHJv
cHBlZCB3aGVuIHRoZSBkcml2ZXIgaXMgdW5ib3VuZD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvY292ZXIuMTc4MzY3MzQyMC5naXQuc2Vh
bkBtZXNzLm9yZz9wYXJ0PTUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
