Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DE7CA5FED
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Joj8jZ2OTVeMoCcRtLPMN3DSbfmfG5vjykB8qUVVZB0=; b=v4iaomNgSC1fQC
	R3QnjB7LQY3qwawarzlmr+FH3k201x4HcC2RxBrmKqlD2smOxODhCuK2XhFM1dGqfxk8DdJggdnT5
	y9wDj6LKba8ay1gwY01HG4sKbBdDlQ9EOyT1X7KyYwj45PBnG6mGHhNmCoL+BNEYmnVcuLn/vEuiS
	1sJaVVZEbubfmUBQgXru1kjsYSoT2UJ/3WfDMwIIJDqELJ556ryK/Bxzow6H7E+PX5/998OfPNEUQ
	JeJxPnD7BDf/cbRYOiCEWI9NKt/qLz2I/vSDkWtjS8ZgqiXQC9bhSbmfSHYE0aidE5QJ0HL7v6mUb
	/Nw7BokmUGjCWC0o0hLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1N6-00000005OR4-2Gy0;
	Fri, 09 Oct 2026 03:34:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1N5-00000005OQl-0D4I
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:34:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2674D60DB0;
	Fri,  9 Oct 2026 03:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2DA1F000FF;
	Fri,  9 Oct 2026 03:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791516849;
	bh=/bDLIWmosHc7HMVZ5vK7Hifmrc/1cNgzcETy2OmyHQ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lY8nalWrmbbnwdP3Cc32d/F8XY7jY7kqtm7/vsgqpMfXW4dFQI6hWMwaJcuElMFlS
	 nXu8SqSYou/Idmd6QTXG53MHDMRFK5GFmT3Hr7bwFRwdbXuuEacUytxRzDDBvNV487
	 NfGdZyuoByBTzXki8v7/PZ6iT4/6M8+LnztzlvvVAatcKUATIKNZ7zs15/UKn0gk6f
	 KTGF2eqE9qG1nxMEOJMq1eslenGPRuhNVtciqTo//0gSRg481dObLOmG8atxwZbFim
	 HRRcH8L0Eb0y+rtAbl7WBl4nThymwZ48vLANlVNwKCUiL7RKIgfIlz2jUCF8/fo+J/
	 lYg8LAcaEPxVA==
Message-ID: <sashiko-outbox-164772@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/20] drm/msm/dp: Disable PSR for YUV420 streams
To: "Xilin Wu" <sophon@radxa.com>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
Date: Fri, 09 Oct 2026 03:34:09 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHJtL21zbTogZW5k
aWFubmVzcyBidWcgb24gRFBfUFNSX0VOX0NGRyB3cml0ZSB1c2luZyB1MzIgcG9pbnRlcgotLQoK
Y29tbWl0IGQxNDAzY2M1YzU4YzQ1MjgzNjg5NDFmMDhmMWVhMWVjMzMyZDFhNDkKQXV0aG9yOiBY
aWxpbiBXdSA8c29waG9uQHJhZHhhLmNvbT4KCmRybS9tc20vZHA6IERpc2FibGUgUFNSIGZvciBZ
VVY0MjAgc3RyZWFtcwoKVGhpcyBjb21taXQgZGlzYWJsZXMgc2VsZi1yZWZyZXNoIGZvciBZVVY0
MjAgc3RyZWFtcyBiZWNhdXNlIHRoZWlyCmNvbG9yaW1ldHJ5IFZTQyBwYWNrZXRzIGNhbm5vdCBz
aGFyZSB0aGUgYXV0b21hdGljIFBTUiBwYWNrZXQgZ2VuZXJhdG9yLgpJdCBjb21wdXRlcyBlbGln
aWJpbGl0eSBhZnRlciBjb21tb24gYXRvbWljIGNoZWNrcyBhbmQgcmVzdG9yZXMgUFNSCmNvbmZp
Z3VyYXRpb24gYWNjb3JkaW5nbHkuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2RwL2RwX2N0cmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY3RybC5jCj4gaW5kZXgg
NzgzY2FmYjIyMzc0OC4uODJlZjhlNDA1NTQzMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2RwL2RwX2N0cmwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfY3Ry
bC5jClsgLi4uIF0KPiBAQCAtMTkyMywxNSArMTkyMywyMCBAQCB2b2lkIG1zbV9kcF9jdHJsX2Nv
bmZpZ19wc3Ioc3RydWN0IG1zbV9kcF9jdHJsICptc21fZHBfY3RybCwKWyAuLi4gXQo+IC0JY2Zn
ID0gRFBfUFNSX0VOQUJMRTsKPiArCWNmZyA9IGVuYWJsZSA/IERQX1BTUl9FTkFCTEUgOiAwOwo+
ICAJZHJtX2RwX2RwY2Rfd3JpdGUoY3RybC0+YXV4LCBEUF9QU1JfRU5fQ0ZHLCAmY2ZnLCAxKTsK
CltTZXZlcml0eTogTWVkaXVtXQpDb3VsZCB0aGlzIHNpbGVudGx5IHdyaXRlIDAgYW5kIGZhaWwg
dG8gZW5hYmxlIFBTUiBvbiBiaWctZW5kaWFuIHBsYXRmb3Jtcz8KClRoZSB2YXJpYWJsZSBjZmcg
aXMgZGVmaW5lZCBhcyBhIHUzMiBhdCB0aGUgYmVnaW5uaW5nIG9mCm1zbV9kcF9jdHJsX2NvbmZp
Z19wc3IoKS4gV2hlbiBpdHMgYWRkcmVzcyBpcyBwYXNzZWQgdG8gZHJtX2RwX2RwY2Rfd3JpdGUo
KQp3aXRoIGEgc2l6ZSBvZiAxIGJ5dGUsIGxpdHRsZS1lbmRpYW4gc3lzdGVtcyB3aWxsIGNvcnJl
Y3RseSByZWFkIHRoZSBsZWFzdApzaWduaWZpY2FudCBieXRlIGNvbnRhaW5pbmcgdGhlIGVuYWJs
ZSBiaXQuIAoKSG93ZXZlciwgb24gYmlnLWVuZGlhbiBzeXN0ZW1zLCB0YWtpbmcgdGhlIGFkZHJl
c3Mgb2YgYSB1MzIgYW5kIHJlYWRpbmcgMQpieXRlIHdpbGwgcmVhZCB0aGUgbW9zdCBzaWduaWZp
Y2FudCBieXRlIGluc3RlYWQgKHdoaWNoIGlzIDB4MDApLgoKV291bGQgdXNpbmcgYSB1OCB2YXJp
YWJsZSBvciBkcm1fZHBfZHBjZF93cml0ZWIoKSBhdm9pZCB0aGlzIHN0cnVjdHVyYWwKbWlzbWF0
Y2ggYW5kIGVuc3VyZSB0aGUgY29ycmVjdCBieXRlIGlzIHdyaXR0ZW4gcmVnYXJkbGVzcyBvZiBh
cmNoaXRlY3R1cmUKZW5kaWFubmVzcz8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMDktbXNtLWRwLWhkcjEwLXYyLTAtMTgzNWQ0
OTY2ZGEzQHJhZHhhLmNvbT9wYXJ0PTE2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
