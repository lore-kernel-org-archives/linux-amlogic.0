Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AA7CD4F3C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 06:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4+1wTXTv+TA6YNle02Zv62u8nL5KAVwyRWDFsPy4cM=; b=uqFH4cZMCJlp6n
	+UYKTcxr2FXABDBYAV0aMM5LTatgSX17DMlIyPpl0Q1qYozSswX57aJTza44G9eAgC7ZzWJCfoKsp
	auDtG8gQUkdOs94CGCYfr3rrfKU7erg+DHKfXMC/y0wVu1YoYIivwPLowV4VNggM4J5BZZiFZr7s8
	4ckUgpyx5K1JsjUAUWJ0HFbcImMs+2LvWJQ7Khv7VD3hTw2kMpsMSXCUvfi4Id954xKEdOWtx401O
	+WsP1y4QPy4WMdUQLXZ5StO1KVUCum9nsURRRMFH59I/jENqgStVPJUfONsqScgbcJ9quInt8SloI
	mIJwnO/2juwTpKyFK1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrB2-0000000EOAR-3lhl;
	Mon, 18 May 2026 06:10:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrB1-0000000EO9f-0O5c
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 06:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D128439B2;
	Mon, 18 May 2026 06:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EB4C2BCB7;
	Mon, 18 May 2026 06:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779084605;
	bh=k9DfodE6MqooW48L8hhlRG9aByg9nhSH7yBJJdYJL/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=moDayv3Ukt6WDccQs877Qb6gjCPBKKimtjNwKBP6p6FNVfyCekWVsKbeU7cxw8v3R
	 8TxLZo66iKVGEHjuKMu1hD1AqoeUGjyFDY7GRkhuwJN4oODcutoRwWlzHH/Kp0yozx
	 gDFYqCfp3XrMej43aJF2y78tlPiuw6nK3Mg09//pAotBPN/VbtpznP8qjsxr0KHKWP
	 EbnkNgOlMKrC5N/w8OK98S5g9kCo1ogTfjXTCbLOZNQ59LY/6i4S3Nc6y8wYGirJKc
	 aDuW2Y7Yv7Gt23PUrutU7zsC/3d5xDDgR8xSYCG5EdItj28WncMMtiMA1hkX7b+dV1
	 z8Vi5OGZz2NAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: meson: vdec: avoid double free on video register
 failure
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260518054318.979147-1-lgs201920130244@gmail.com>
References: <20260518054318.979147-1-lgs201920130244@gmail.com>
Date: Mon, 18 May 2026 06:10:04 +0000
Message-Id: <20260518061005.B9EB4C2BCB7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_231007_154653_3A4BAABF 
X-CRM114-Status: GOOD (  10.64  )
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0NyaXRpY2FsXSBCeXBhc3Npbmcg
a29iamVjdCBsaWZldGltZSBtYW5hZ2VtZW50IHZpYSBhIGR1bW15IHJlbGVhc2UgZnVuY3Rpb24g
Y3JlYXRlcyBhIFVzZS1BZnRlci1GcmVlIChVQUYpIHZ1bG5lcmFiaWxpdHkuCi0tCgpjb21taXQg
YzliZjQzM2Y2NjM3OGI3MGFmNGJlNzlmNWMzZWVkYmVlNGE0NTgyYgpBdXRob3I6IEd1YW5nc2h1
byBMaSA8bGdzMjAxOTIwMTMwMjQ0QGdtYWlsLmNvbT4KCm1lZGlhOiBtZXNvbjogdmRlYzogYXZv
aWQgZG91YmxlIGZyZWUgb24gdmlkZW8gcmVnaXN0ZXIgZmFpbHVyZQoKVGhpcyBjb21taXQgdGVt
cG9yYXJpbHkgc2V0cyB0aGUgdmlkZW8gZGV2aWNlIHJlbGVhc2UgZnVuY3Rpb24gdG8KdmlkZW9f
ZGV2aWNlX3JlbGVhc2VfZW1wdHkgYmVmb3JlIGNhbGxpbmcgdmlkZW9fcmVnaXN0ZXJfZGV2aWNl
KCkgdG8gcHJldmVudAphIGRvdWJsZS1mcmVlIG9uIGZhaWx1cmUuIEl0IHJlc3RvcmVzIHRoZSBv
cmlnaW5hbCByZWxlYXNlIGZ1bmN0aW9uIHVwb24Kc3VjY2Vzcy4KCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYyBiL2RyaXZlcnMvc3RhZ2luZy9t
ZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+IGluZGV4IDRiNzdlYzFhZjVhNzYuLjI5OTRlNDZjYmMy
NTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5j
Cj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jCj4gQEAgLTEw
NzQsNyArMTA3NCw3IEBAIHN0YXRpYyBpbnQgdmRlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ICAJbXV0ZXhfaW5pdCgmY29yZS0+bG9jayk7Cj4gIAo+ICAJc3Ryc2NweSh2
ZGV2LT5uYW1lLCAibWVzb24tdmlkZW8tZGVjb2RlciIsIHNpemVvZih2ZGV2LT5uYW1lKSk7Cj4g
LQl2ZGV2LT5yZWxlYXNlID0gdmlkZW9fZGV2aWNlX3JlbGVhc2U7Cj4gKwl2ZGV2LT5yZWxlYXNl
ID0gdmlkZW9fZGV2aWNlX3JlbGVhc2VfZW1wdHk7Cj4gIAl2ZGV2LT5mb3BzID0gJnZkZWNfZm9w
czsKPiAgCXZkZXYtPmlvY3RsX29wcyA9ICZ2ZGVjX2lvY3RsX29wczsKPiAgCXZkZXYtPnZmbF9k
aXIgPSBWRkxfRElSX00yTTsKPiBAQCAtMTA4OSw2ICsxMDg5LDcgQEAgc3RhdGljIGludCB2ZGVj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAkJZGV2X2VycihkZXYsICJG
YWlsZWQgcmVnaXN0ZXJpbmcgdmlkZW8gZGV2aWNlXG4iKTsKPiAgCQlnb3RvIGVycl92ZGV2X3Jl
bGVhc2U7CgpXaGVuIHZpZGVvX3JlZ2lzdGVyX2RldmljZSgpIGludm9rZXMgZGV2aWNlX3JlZ2lz
dGVyKCksIHRoZSBlbWJlZGRlZCBzdHJ1Y3QKZGV2aWNlIGlzIGluaXRpYWxpemVkIGFuZCBjYW4g
cG90ZW50aWFsbHkgYmUgZXhwb3NlZCB0byB0aGUgc3lzdGVtIHZpYQpzeXNmcy4KCklmIHJlZ2lz
dHJhdGlvbiBmYWlscywgcHV0X2RldmljZSgpIGlzIGNhbGxlZCB0byBkcm9wIHRoZSByZWZlcmVu
Y2UsIGJ1dAp0aGlzIGRvZXMgbm90IGd1YXJhbnRlZSBpbW1lZGlhdGUgc3luY2hyb25vdXMgZGVz
dHJ1Y3Rpb24uIENvbmN1cnJlbnQKc3Vic3lzdGVtcyBtaWdodCB0ZW1wb3JhcmlseSBob2xkIHJl
ZmVyZW5jZXMsIG9yIGlmCkNPTkZJR19ERUJVR19LT0JKRUNUX1JFTEVBU0UgaXMgZW5hYmxlZCwg
dGhlIGtvYmplY3QgcmVsZWFzZSBpcyBzY2hlZHVsZWQKb24gYSB3b3JrcXVldWUuCgpXaWxsIGJ5
cGFzc2luZyB0aGUga29iamVjdCBsaWZldGltZSBtYW5hZ2VtZW50IGhlcmUgYnkgc2V0dGluZyBh
IGR1bW15CnJlbGVhc2UgZnVuY3Rpb24gYW5kIHN5bmNocm9ub3VzbHkgZnJlZWluZyB0aGUgZGV2
aWNlIGluIGVycl92ZGV2X3JlbGVhc2UKbGVhZCB0byBhIHVzZS1hZnRlci1mcmVlPwoKT25jZSB0
aGUgZGVsYXllZCBrb2JqZWN0IGNsZWFudXAgcnVucyBvciBjb25jdXJyZW50IGhvbGRlcnMgZHJv
cCB0aGVpcgpyZWZlcmVuY2VzLCB0aGUga2VybmVsIGNvdWxkIGFjY2VzcyB0aGUgYWxyZWFkeS1m
cmVlZCBzdHJ1Y3QgZGV2aWNlIHdpdGhpbgp0aGUgZnJlZWQgdmRldiB0byBwZXJmb3JtIGludGVy
bmFsIGtvYmplY3QgdGVhcmRvd24uCgo+ICAJfQo+ICsJdmRldi0+cmVsZWFzZSA9IHZpZGVvX2Rl
dmljZV9yZWxlYXNlOwo+ICAKPiAgCXJldHVybiAwOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxODA1NDMxOC45NzkxNDctMS1s
Z3MyMDE5MjAxMzAyNDRAZ21haWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
