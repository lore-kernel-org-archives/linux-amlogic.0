Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A28CA6002
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 22:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+/DosiIN5UOO+rbkt5OZug42/ymGKPVzHDlEGqVpm8=; b=23cJtovWLWNiGy
	NrMDop8Qe3TE72le5/UpGdeSpn8mBJImsGLYCiTi/dUdszpTPcKubBoSM6YQ0YobCQZS0IBh6t4lU
	qHWWeIw9GQBefQVRzNG0WcrmYctLox20GAhARjPd+HZk7ztg7alTgtYKkWQFpEuP8iilVjSSTaDH1
	OcGWDGn6VsNs4oESepwE6L3MIzFvdQxwipeDCFP428yug40YL2TXbBLuv8uN52a0MBTQfOxIm/glK
	JJ6gaM2ohZgKya0OhGkjNkpC3w6zdFjSvMPz9fzAYh+aKvVE4m0/s5Do2rBqrLC2NcpmkwPeSZHAd
	Ua6cPPPFxvUFXIIspgKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZkX-00000003ELz-0eck;
	Wed, 07 Oct 2026 22:04:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZkV-00000003ELl-1YVV
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 22:04:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 807B960A6D;
	Wed,  7 Oct 2026 22:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF4A1F000FF;
	Wed,  7 Oct 2026 22:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791410670;
	bh=yI7nQnMjEbfJQs/jv1OqMyoTBJx/JTdne94uTy4f1R4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvaYBk44ySy2QjwaCgUtX0F9cysYIulVzsXslM2o6se08zkHraOBKPpSyZDO+ahoB
	 An3V2v8w42LyiknEGNG7qs9ra9r0oofx7nvlTG7eRLIMd6E93NkeKNkpUTBOwzJHCC
	 f9B6QUdEvBNCpf91mLbPCKnfNMKyTmmWeuOBRj1InXYnYCCaSq8dw4ex7b4pU7qI2C
	 g2Twpjh6G8iYDyZpwZkrgLKSwmmY6AqWC5nn+6kA6kew4QbsfugKp7rMq6LIXbqN8Z
	 YbCB6YLq8mpkUdw43nSThGGLi4J/P88FbXeMMj+z4UidAkmOtcW7sYDkOuI2X6qosu
	 cy65on3fAjb3A==
Message-ID: <sashiko-outbox-163402@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] irqchip/meson-gpio: Allow the GPIO interrupts to wake
 the system
To: "Igor Velkov" <iav@iav.lv>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20261008-meson-gpio-wake-v1-1-fec8a1f5d830@iav.lv>
References: <20261008-meson-gpio-wake-v1-1-fec8a1f5d830@iav.lv>
Date: Wed, 07 Oct 2026 22:04:29 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gaXJxY2hpcDogbWVz
b24tZ3Bpbzogc3B1cmlvdXMgd2FrZXVwcyBkdWUgdG8gbWlzc2luZyBJUlFDSElQX01BU0tfT05f
U1VTUEVORAotLQoKY29tbWl0IDM5Y2U2OTUxODhmMDA2MTdkMzU5N2ZkMjU2YzEwM2E0ZGY3NDI4
ZjcKQXV0aG9yOiBJZ29yIFZlbGtvdiA8aWF2QGlhdi5sdj4KCmlycWNoaXAvbWVzb24tZ3Bpbzog
QWxsb3cgdGhlIEdQSU8gaW50ZXJydXB0cyB0byB3YWtlIHRoZSBzeXN0ZW0KClRoaXMgY29tbWl0
IGFkZHMgdGhlIElSUUNISVBfU0tJUF9TRVRfV0FLRSBmbGFnIHRvIHRoZSBtZXNvbl9ncGlvX2ly
cV9jaGlwCmRlZmluaXRpb24uIFRoaXMgcHJldmVudHMgZW5hYmxlX2lycV93YWtlKCkgZnJvbSBm
YWlsaW5nIGFuZCBhbGxvd3MgR1BJTwppbnRlcnJ1cHRzIHJvdXRlZCB0aHJvdWdoIHRoaXMgY29u
dHJvbGxlciB0byB3YWtlIHRoZSBzeXN0ZW0gZnJvbSBzdXNwZW5kLgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLW1l
c29uLWdwaW8uYwo+IGluZGV4IDkxYTljMzM3ZmU2ZDkuLmUwMzI5ZWY1ZTRhMjEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMKPiArKysgYi9kcml2ZXJzL2ly
cWNoaXAvaXJxLW1lc29uLWdwaW8uYwo+IEBAIC01MzgsNyArNTM4LDcgQEAgc3RhdGljIHN0cnVj
dCBpcnFfY2hpcCBtZXNvbl9ncGlvX2lycV9jaGlwID0gewo+ICAjaWZkZWYgQ09ORklHX1NNUAo+
ICAJLmlycV9zZXRfYWZmaW5pdHkJPSBpcnFfY2hpcF9zZXRfYWZmaW5pdHlfcGFyZW50LAo+ICAj
ZW5kaWYKPiAtCS5mbGFncwkJCT0gSVJRQ0hJUF9TRVRfVFlQRV9NQVNLRUQsCj4gKwkuZmxhZ3MJ
CQk9IElSUUNISVBfU0VUX1RZUEVfTUFTS0VEIHwgSVJRQ0hJUF9TS0lQX1NFVF9XQUtFLAoKW1Nl
dmVyaXR5OiBNZWRpdW1dCldpbGwgdGhpcyBjYXVzZSBzcHVyaW91cyB3YWtldXBzIGZyb20gbm9u
LXdha2V1cCBHUElPIGludGVycnVwdHMgZHVyaW5nCnN5c3RlbSBzdXNwZW5kPwoKRHVyaW5nIHN1
c3BlbmQsIHN1c3BlbmRfZGV2aWNlX2lycXMoKSBsYXppbHkgZGlzYWJsZXMgbm9uLXdha2V1cCBp
bnRlcnJ1cHRzCmJ5IHNldHRpbmcgSVJRRF9JUlFfRElTQUJMRUQsIGJ1dCB3aXRob3V0IGNhbGxp
bmcgLmlycV9tYXNrKCkgYmVjYXVzZSB0aGUKcGFyZW50IEdJQyBsYWNrcyBhbiAuaXJxX2Rpc2Fi
bGUoKSBjYWxsYmFjay4gVGhlIGNvcmUgSVJRIHBvd2VyIG1hbmFnZW1lbnQKY29kZSBvbmx5IHBo
eXNpY2FsbHkgbWFza3MgdGhlIGludGVycnVwdCBpZiB0aGUgdG9wLWxldmVsIGlycV9jaGlwIHBy
b3ZpZGVzCnRoZSBJUlFDSElQX01BU0tfT05fU1VTUEVORCBmbGFnLgoKU2luY2UgbWVzb25fZ3Bp
b19pcnFfY2hpcCBkb2VzIG5vdCBzZXQgSVJRQ0hJUF9NQVNLX09OX1NVU1BFTkQsIG5vbi13YWtl
dXAKR1BJTyBpbnRlcnJ1cHRzIG1pZ2h0IHJlbWFpbiB1bm1hc2tlZCBhdCB0aGUgR0lDIGxldmVs
LiBJZiBhIG5vbi13YWtldXAKaW50ZXJydXB0IHRyaWdnZXJzIHdoaWxlIHRoZSBzeXN0ZW0gaXMg
YXNsZWVwLCB0aGUgR0lDIHdpbGwgZm9yd2FyZCBpdCB0bwp0aGUgQ1BVLCBwb3RlbnRpYWxseSBs
ZWFkaW5nIHRvIGFuIHVuaW50ZW5kZWQgd2FrZXVwIGFuZCBwb3dlciBkcmFpbi4KCkRvZXMgdGhp
cyBmbGFnIGRlZmluaXRpb24gbmVlZCB0byBpbmNsdWRlIElSUUNISVBfTUFTS19PTl9TVVNQRU5E
IGFzIHdlbGw/Cgo+ICB9Owo+ICAKPiAgc3RhdGljIGludCBtZXNvbl9ncGlvX2lycV9kb21haW5f
dHJhbnNsYXRlKHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sCgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDA4LW1lc29uLWdwaW8t
d2FrZS12MS0xLWZlYzhhMWY1ZDgzMEBpYXYubHY/cGFydD0xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
