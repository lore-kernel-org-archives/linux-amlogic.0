Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B0AC44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D08NQL+gebKoWHKJ8dxicqVKCanJj1qNH9Y7j/GA98Q=; b=mp+wjECQ4XgQMg
	Rf74T1nHWGf+TMFfNsjA29LQgPPWQkGsdj7nTGDltwjhkU55B9sM7XXhNl04Lya0phkN3YMn9ep3w
	GMah3c1yqkgN8G0yl6rc/ie63qwfzHFeS3LoJ72McJ0IGKnzx0VwvB87W2B6/Yug8VJRJwh41YZ0D
	fRjBsieVdcKgA8qFQ20YYyK9NStopS9mMf76yhXIXUHtRiLUUwtoG4NyDwFpFVsCBxkXdV4c57td4
	yCY5XK6Hj5I17TRl4ebpG1gKIb48gDuQcXIjhht8DojXU0VqPWIkMvBxruL0td+RDXhq4GbPdmsEO
	xvAsd7mQdp4yzcdVCUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpv1-00000007C32-2ls7;
	Mon, 20 Jul 2026 15:28:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpv0-00000007C2a-151A
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:28:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0E12601ED;
	Mon, 20 Jul 2026 15:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA951F000E9;
	Mon, 20 Jul 2026 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784561313;
	bh=BABJFnYN3Mt7fhT/xNkof710NDy+wmhVX0gnBjBP8K0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b9uId99ZI+8OOUjbLR97IZGmcrkAwPmwah1uPoFYD1D5DTbq7Gx9VKd2MpKHffP/W
	 AU1hdDN6PjSqM3JstdvpM0WXL/4jnC0teRuq3Hc1Gu9DNCEWdI+LlJA55QGJPEZK6b
	 TcJb3qpzbGihsGXVDrgarWn1s4oVsAWpGPOjGeGTep/dBy63SaNh/4cdzpb+uI9ZbQ
	 4V4U1Wow0yR4tfBT2pZRo2gHJBPUmK2OjuV9T+HnsbYej55mqc/13kd9qLZdHHpgKx
	 7tQzNFUE7Sjh2vLlJ63c5L9PkOrr+DCfgvvT0xkeQBpBUt8m4zMvJl6mbSz8kEOqtD
	 Elo72hboNkzxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/16] PCI: dwc: imx6: Use cached PCIe capability
 offset
To: "Hans Zhang" <18255117159@163.com>
Cc: linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org, imx@lists.linux.dev, neil.armstrong@linaro.org, Frank.Li@kernel.org
In-Reply-To: <20260720150619.24733-4-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-4-18255117159@163.com>
Date: Mon, 20 Jul 2026 15:28:32 +0000
Message-Id: <20260720152833.1CA951F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIEluIEVuZHBvaW50IChF
UCkgbW9kZSwgdGhlIGNhY2hlZCBgcGNpLT5wY2llX2NhcGAgb2Zmc2V0IGlzIHVuaW5pdGlhbGl6
ZWQgYW5kIGRlZmF1bHRzIHRvIDAsIGNhdXNpbmcgYGlteF9wY2llX3N0YXJ0X2xpbmtgIGFuZCBg
aW14X3BjaWVfbHRzc21fZW5hYmxlYCB0byByZWFkIGFuZCBjb3JydXB0IHRoZSBzdGFuZGFyZCBQ
Q0kgY29uZmlndXJhdGlvbiBzcGFjZSBoZWFkZXIgaW5zdGVhZCBvZiB0aGUgUENJZSBMaW5rIENh
cGFiaWxpdGllcyByZWdpc3Rlci4KLS0KCi0tLSBQYXRjaCBbM106IFtQQVRDSCB2MyAwMy8xNl0g
UENJOiBkd2M6IGlteDY6IFVzZSBjYWNoZWQgUENJZSBjYXBhYmlsaXR5IG9mZnNldCAtLS0KY29t
bWl0IGU4OGNkNzdiMDI3YTEyNWU5NzEzZmMzMTBjNjEyYzUxNThhMjNiZTEKQXV0aG9yOiBIYW5z
IFpoYW5nIDwxODI1NTExNzE1OUAxNjMuY29tPgoKUENJOiBkd2M6IGlteDY6IFVzZSBjYWNoZWQg
UENJZSBjYXBhYmlsaXR5IG9mZnNldAoKVGhpcyBjb21taXQgdXBkYXRlcyB0aGUgaS5NWDYgUENJ
ZSBkcml2ZXIgdG8gdXNlIHRoZSBjYWNoZWQgcGNpZV9jYXAKb2Zmc2V0IGluc3RlYWQgb2YgZHlu
YW1pY2FsbHkgZmluZGluZyB0aGUgUENJX0NBUF9JRF9FWFAgY2FwYWJpbGl0eQpkdXJpbmcgbGlu
ayBzdGFydCBhbmQgTFRTU00gZW5hYmxlbWVudC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1pbXg2LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2ktaW14Ni5jCj4gaW5kZXggOThlMWRiNzUxMTMyYS4uNzRiMjhiNGRmNDg0NiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktaW14Ni5jCj4gKysrIGIvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWlteDYuYwo+IEBAIC05NjYsMTAgKzk2NiwxMCBAQCBz
dGF0aWMgdm9pZCBpbXhfcGNpZV9sdHNzbV9lbmFibGUoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7
Cj4gIAlzdHJ1Y3QgaW14X3BjaWUgKmlteF9wY2llID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4g
IAljb25zdCBzdHJ1Y3QgaW14X3BjaWVfZHJ2ZGF0YSAqZHJ2ZGF0YSA9IGlteF9wY2llLT5kcnZk
YXRhOwo+IC0JdTggb2Zmc2V0ID0gZHdfcGNpZV9maW5kX2NhcGFiaWxpdHkoaW14X3BjaWUtPnBj
aSwgUENJX0NBUF9JRF9FWFApOwo+ICsJc3RydWN0IGR3X3BjaWUgKnBjaSA9IGlteF9wY2llLT5w
Y2k7Cj4gIAl1MzIgdG1wOwo+ICAKPiAtCXRtcCA9IGR3X3BjaWVfcmVhZGxfZGJpKGlteF9wY2ll
LT5wY2ksIG9mZnNldCArIFBDSV9FWFBfTE5LQ0FQKTsKPiArCXRtcCA9IGR3X3BjaWVfcmVhZGxf
ZGJpKHBjaSwgcGNpLT5wY2llX2NhcCArIFBDSV9FWFBfTE5LQ0FQKTsKCltTZXZlcml0eTogSGln
aF0KSXMgcGNpLT5wY2llX2NhcCBndWFyYW50ZWVkIHRvIGJlIGluaXRpYWxpemVkIGhlcmUgaW4g
RW5kcG9pbnQgKEVQKSBtb2RlPwoKSXQgbG9va3MgbGlrZSBpbXhfYWRkX3BjaWVfZXAoKSBkb2Vz
IG5vdCBjYWxsIGR3X3BjaWVfZ2V0X3BjaWVfY2FwKCkgYWZ0ZXIKdGhlIGhhcmR3YXJlIGlzIGVu
YWJsZWQuIElmIHBjaS0+cGNpZV9jYXAgZXZhbHVhdGVzIHRvIDAgaW4gRVAgbW9kZSwgd291bGRu
J3QKdGhpcyByZWFkIGZyb20gb2Zmc2V0IDB4MEMgKENhY2hlIExpbmUgU2l6ZSwgTGF0ZW5jeSBU
aW1lciwgZXRjLikgaW4gdGhlCnN0YW5kYXJkIFBDSSBjb25maWd1cmF0aW9uIHNwYWNlIGluc3Rl
YWQgb2YgdGhlIFBDSWUgTGluayBDYXBhYmlsaXRpZXMgcmVnaXN0ZXI/Cgo+ICAJcGh5X3NldF9z
cGVlZChpbXhfcGNpZS0+cGh5LCBGSUVMRF9HRVQoUENJX0VYUF9MTktDQVBfU0xTLCB0bXApKTsK
PiAgCWlmIChkcnZkYXRhLT5sdHNzbV9tYXNrKQoKWyAuLi4gXQoKPiBAQCAtOTk1LDcgKzk5NSw3
IEBAIHN0YXRpYyBpbnQgaW14X3BjaWVfc3RhcnRfbGluayhzdHJ1Y3QgZHdfcGNpZSAqcGNpKQo+
ICB7Cj4gIAlzdHJ1Y3QgaW14X3BjaWUgKmlteF9wY2llID0gdG9faW14X3BjaWUocGNpKTsKPiAg
CXN0cnVjdCBkZXZpY2UgKmRldiA9IHBjaS0+ZGV2Owo+IC0JdTggb2Zmc2V0ID0gZHdfcGNpZV9m
aW5kX2NhcGFiaWxpdHkocGNpLCBQQ0lfQ0FQX0lEX0VYUCk7Cj4gKwl1OCBvZmZzZXQgPSBwY2kt
PnBjaWVfY2FwOwo+ICAJdTMyIHRtcDsKPiAgCWludCByZXQ7CgpbIC4uLiBdCgo+ICAJZHdfcGNp
ZV9kYmlfcm9fd3JfZW4ocGNpKTsKPiAgCXRtcCA9IGR3X3BjaWVfcmVhZGxfZGJpKHBjaSwgb2Zm
c2V0ICsgUENJX0VYUF9MTktDQVApOwo+ICAJdG1wICY9IH5QQ0lfRVhQX0xOS0NBUF9TTFM7Cj4g
IAl0bXAgfD0gUENJX0VYUF9MTktDQVBfU0xTXzJfNUdCOwo+ICAJZHdfcGNpZV93cml0ZWxfZGJp
KHBjaSwgb2Zmc2V0ICsgUENJX0VYUF9MTktDQVAsIHRtcCk7CgpbU2V2ZXJpdHk6IEhpZ2hdCkNh
biB0aGlzIGNvcnJ1cHQgdGhlIHN0YW5kYXJkIFBDSSBjb25maWd1cmF0aW9uIHNwYWNlIGhlYWRl
ciBpbiBFUCBtb2RlPwoKU2luY2Ugb2Zmc2V0IGlzIGRlcml2ZWQgZnJvbSBwY2ktPnBjaWVfY2Fw
LCBpZiBpdCByZW1haW5zIHVuaW5pdGlhbGl6ZWQKKDApIGZvciBlbmRwb2ludHMsIHRoaXMgd3Jp
dGUgd291bGQgdGFyZ2V0IG9mZnNldCAweDBDIGluIHRoZSBzdGFuZGFyZCBQQ0kKaGVhZGVyLiBU
aGlzIGNvdWxkIGNvcnJ1cHQgdGhlIENhY2hlIExpbmUgU2l6ZSwgTGF0ZW5jeSBUaW1lciwgSGVh
ZGVyIFR5cGUsCmFuZCBCSVNUIHJlZ2lzdGVycy4KCkRvZXMgdGhlIGVuZHBvaW50IGluaXRpYWxp
emF0aW9uIHBhdGggbmVlZCBhIGNhbGwgdG8gZHdfcGNpZV9nZXRfcGNpZV9jYXAoKQpiZWZvcmUg
dGhlIGxpbmsgaXMgc3RhcnRlZCB2aWEgZHdfcGNpZV9lcF9zdGFydCgpPwoKPiAgCWR3X3BjaWVf
ZGJpX3JvX3dyX2RpcyhwY2kpOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyMDE1MDYxOS4yNDczMy0xLTE4MjU1MTE3MTU5QDE2
My5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
