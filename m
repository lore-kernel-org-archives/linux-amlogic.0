Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E54CA5FED
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcu5971Dxko4AT40hcrUpSz+YyB5oYixm5+kr7+03KE=; b=N7PfFE3mwISd/A
	m7abAIO0W319hoLx+Ux9N53WleU9eVXamcpq5IULX/6/umtTwv+cswgSkYww6tk1MsTvpLin9fUMN
	4idQIgIiw7UKgncmmgcP7rNg8dYTtIW0xZfRIoaRPVfST5wwPCjE03CW+Xm/uLrz3Lq83F5TuO/AB
	9pTg4vgTInkrSBHbAO/e8coZdY+2wvkqxrRw6y5xbBZjaLulst5RuoPEoIsDUncq8oQ6sAbT8FA5m
	rs4TA13Ll5MMJaz324SUSoast0kP8NNkCFwQEaMEN7WqV0WzTXacfMQmO68O9z7XDNWtQQMohOlbm
	bHcxc2nWOjKeRSmqSXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1I2-00000005NDi-1uhz;
	Fri, 09 Oct 2026 03:28:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1I1-00000005NDR-1ZTv
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:28:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BF7E41433;
	Fri,  9 Oct 2026 03:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5281F000FF;
	Fri,  9 Oct 2026 03:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791516535;
	bh=KDRGUQEvleVgZ50NmhKARf7BLY4q08cxZc5+JRNScVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DtlO+l2bCXmQzs700KOttxF6NiVzCd+YbiMyDuZ7QfLsqCqVutRLueMdlb72DXNsJ
	 6utaRrTMijHxSkDouv1QegjVNjH0c8lPTpcOZwPzX5shlKvSlr5jsNV7vTjTdzL7Vk
	 D0Vi11bqvPy/rTv7EsRKw3aGhogdLHu0qifVgjJdDxPyGU/g1QfXcyWKW4ZkWubFSY
	 SrjCxKcAa2mUJBBVDCc8XCHfa7HX/RB2xLcT6EdU/7UqlLdKSZ4x+11E2e0ZZKOHeQ
	 WuRJrwLDrdbU8r2ikJqTwYjnxtTSsTQVIDagzrpLXN2v6Lje5bUEcQRCES11b1YIKx
	 3a3uTqiLP5GPg==
Message-ID: <sashiko-outbox-164763@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/20] drm/msm/dp: Report stream enable failures
 through link status
To: "Xilin Wu" <sophon@radxa.com>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20261009-msm-dp-hdr10-v2-10-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-10-1835d4966da3@radxa.com>
Date: Fri, 09 Oct 2026 03:28:55 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHJtL21zbS9kcDogbWl4
aW5nIGdvdG8gYW5kIHNjb3BlZF9ndWFyZCBpbiBtc21fZHBfZGlzcGxheV9hdG9taWNfZW5hYmxl
KCkKLS0KCmNvbW1pdCA1Mzg5ZDc2YjhlYTkxYjI0MDgyYmUwYTYyNTRjZDBjNzgwNTE4ZTBkCkF1
dGhvcjogWGlsaW4gV3UgPHNvcGhvbkByYWR4YS5jb20+CmRybS9tc20vZHA6IFJlcG9ydCBzdHJl
YW0gZW5hYmxlIGZhaWx1cmVzIHRocm91Z2ggbGluayBzdGF0dXMKClRoaXMgY29tbWl0IHVwZGF0
ZXMgdGhlIGRyaXZlciB0byBtYXJrIHRoZSBjb25uZWN0b3IgbGluayBzdGF0dXMgYXMgYmFkIGZy
b20KYSB3b3JrIGl0ZW0gYWZ0ZXIgdW53aW5kaW5nIGEgZmFpbGVkIGVuYWJsZS4gSXQgc2VuZHMg
YSBzaW5nbGUgaG90cGx1Zwpub3RpZmljYXRpb24gcGVyIGZhaWx1cmUgZXBpc29kZSwgYWxsb3dp
bmcgZmJkZXYgdG8gcmV0cnkgdGhlIG1vZGVzZXQKc3luY2hyb25vdXNseSB3aGlsZSBwcmV2ZW50
aW5nIHVuYm91bmRlZCByZXRyeSBsb29wcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZHAvZHBfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5
LmMKPiBpbmRleCBiMDc2ZDQ0YjUxMThjLi44MTZmMmRjMTFhZWExIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9kcC9kcF9kaXNwbGF5LmMKClsgLi4uIF0KCj4gQEAgLTE1ODMsNiArMTYzMywxMSBAQCB2
b2lkIG1zbV9kcF9kaXNwbGF5X2F0b21pY19lbmFibGUoc3RydWN0IG1zbV9kcCAqbXNtX2RwX2Rp
c3BsYXksCj4gIAlpZiAobXNtX2RwX2Rpc3BsYXktPmlzX2VkcCkKPiAgCQltc21fZHBfaHBkX3Vu
cGx1Z19oYW5kbGUoZHApOwo+ICAJbXNtX2RwX2Rpc3BsYXlfdW5wcmVwYXJlKGRwKTsKPiArCXNj
b3BlZF9ndWFyZChtdXRleCwgJmRwLT5wbHVnZ2VkX2xvY2spIHsKCltTZXZlcml0eTogTG93XQpU
aGlzIGlzbid0IGEgZnVuY3Rpb25hbCBidWcsIGJ1dCBkb2VzIGl0IG1peCBnb3RvLWJhc2VkIGVy
cm9yIGhhbmRsaW5nIGFuZApzY29wZS1iYXNlZCBjbGVhbnVwIGluIHRoZSBzYW1lIGZ1bmN0aW9u
PwoKVGhlIGZ1bmN0aW9uIG1zbV9kcF9kaXNwbGF5X2F0b21pY19lbmFibGUoKSB1c2VzIGdvdG8t
YmFzZWQgZXJyb3IgaGFuZGxpbmcKd2l0aCB0aGUgZXJyIGFuZCBlcnJfcHJlcGFyZSBsYWJlbHMg
dG8gbWFuYWdlIGl0cyBjbGVhbnVwIHNlcXVlbmNlLgoKVGhlIGtlcm5lbCBndWlkZWxpbmVzIGlu
IGluY2x1ZGUvbGludXgvY2xlYW51cC5oIGFkdmlzZSBhZ2FpbnN0IG1peGluZwpnb3RvLWJhc2Vk
IGNsZWFudXAgYW5kIGd1YXJkIGRlY2xhcmF0aW9ucyB3aXRoaW4gdGhlIHNhbWUgcm91dGluZSwg
YXMgaXQKY2FuIGNyZWF0ZSBjb25mdXNpbmcgb3duZXJzaGlwIHNlbWFudGljcy4KCkNvdWxkIHRo
aXMgYmUgcmVmYWN0b3JlZCB0byB1c2Ugc3RhbmRhcmQgbXV0ZXhfbG9jaygpIGFuZCBtdXRleF91
bmxvY2soKSB0bwptYWludGFpbiBzdHJ1Y3R1cmFsIGNvbnNpc3RlbmN5PwoKPiArCQlkcC0+bGlu
a19mYWlsZWQgPSB0cnVlOwo+ICsJCS8qIEtlZXAgcmVwb3J0aW5nIEJBRCwgYnV0IG5vdGlmeSBv
bmx5IG9uY2UgdW50aWwgcmVjb3ZlcnkuICovCj4gKwkJc2NoZWR1bGVfd29yaygmZHAtPmxpbmtf
c3RhdHVzX3dvcmspOwo+ICsJfQo+ICB9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDA5LW1zbS1kcC1oZHIxMC12Mi0wLTE4MzVk
NDk2NmRhM0ByYWR4YS5jb20/cGFydD0xMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
