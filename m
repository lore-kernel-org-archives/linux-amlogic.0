Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E8FCCA463
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Oct 2026 03:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePUOetDx9uZ8i7a8gyK3ec2HwyWC8cmuGQGqQzfZQSU=; b=uoeVzLTzbP0WK3
	l0Z8oaqTowISxwaAN+IM6nQY5Jem6flchjwAU4PqJGI4NYvrUBw649mIFKVWU4KxmMf+teJ2Y1cPD
	kc0to7dLz8rFjGMpVVLSQJ5Fgiu+HC1mpTPEaDWEjtcyFtrTcTT6ABJ3lO5It8RR9/AkDHBjZ/RUD
	202yJqUX12lqrRjwpDq92CQT05nm1ZthZZ1p1E674NpWTKtzdFvP+DN1F/AjmhGx2cIn+Hn1qsENv
	ip626GMDhfijoSLnWJaTYAbiXLadBokJRFw0Tq52/oY220B8Fe0WdqK06CieR7qpNKEIcczVyfrIU
	PUmEuAX1/ASI1QLlPrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYJ1-00000001n5x-2YoM;
	Fri, 16 Oct 2026 03:08:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYJ0-00000001n5r-3F9f
	for linux-amlogic@lists.infradead.org;
	Fri, 16 Oct 2026 03:08:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A8D5409C0;
	Fri, 16 Oct 2026 03:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F061F000C4;
	Fri, 16 Oct 2026 03:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792120106;
	bh=uWxM2ni3Xzgx1w5ijJk2zH4L70ciNo7Z+DMrdJ7x6s4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UWYQ8dpMLOhvWV4xs+Fj4tUJdRfvxvUODPLKKxH6d45etUElPq4ws0I3i9nPVkhdC
	 siSA5oTUHegrwPCA6osw07JvMQyKGC/SCk6h2jCLZa8D8YFUEuKgjIGvNptwHRcd1L
	 NMqW+8TPjhyjRsrIjEoQIMBf4Nk8oTrNhh5xmtws9OhWEe3lSFUvztdMZoI7zsrlYM
	 aV00zNtUOCtqEATKR597xayf/W0QWLU3pyFhwTuliemT/imXB/33+80ZtZEpEkJ0OI
	 7y+xv5CPKGIerFD5Km3NJH7kl6Oco3BEZN7p0YIM8wT7BkwvhZsglGQKNJmpkh5KJo
	 Nv9rOufA7bl0A==
Message-ID: <sashiko-outbox-173653@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dmaengine: amlogic: Fix regmap error check issue
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
References: <20261016-fix-a9-dma-complier-v1-1-024421d5b3c8@amlogic.com>
Date: Fri, 16 Oct 2026 03:08:25 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZG1hZW5naW5lOiBh
bWxvZ2ljOiBmcmVlX3dxIGxlYWtlZCBvbiBlcnJvciBwYXRocyBpbiBhbWxfZG1hX3Byb2JlKCkK
LS0KCmNvbW1pdCA4NDI2MTE2M2M2ZjIwOGFhMTI4MzRlYzI0MmRhMzRiM2Q4MDVlN2FkCkF1dGhv
cjogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpkbWFlbmdpbmU6IGFt
bG9naWM6IEZpeCByZWdtYXAgZXJyb3IgY2hlY2sgaXNzdWUKClRoaXMgY29tbWl0IGNoYW5nZXMg
dGhlIGVycm9yIGNoZWNrIGZvciBkZXZtX3JlZ21hcF9pbml0X21taW8oKSB0byB1c2UKSVNfRVJS
KCkgaW5zdGVhZCBvZiBJU19FUlJfT1JfTlVMTCgpLiBUaGlzIHJlc29sdmVzIGEgU21hdGNoIHdh
cm5pbmcgYWJvdXQKcGFzc2luZyB6ZXJvIHRvIFBUUl9FUlIoKS4KCkNsb3NlczogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDI2MTAwODA5NTMuQzVUWWxDYUEtbGtwQGludGVsLmNvbS8KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL2FtbG9naWMtZG1hLmMgYi9kcml2ZXJzL2RtYS9hbWxv
Z2ljLWRtYS5jCj4gaW5kZXggNzhlZTIzMzdhZTcxMi4uNjg0MTIxZDEzZmNhYiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2RtYS9hbWxvZ2ljLWRtYS5jCj4gKysrIGIvZHJpdmVycy9kbWEvYW1sb2dp
Yy1kbWEuYwo+IEBAIC02MzIsNyArNjMyLDcgQEAgc3RhdGljIGludCBhbWxfZG1hX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJYW1sX2RtYS0+cmVnbWFwID0gZGV2
bV9yZWdtYXBfaW5pdF9tbWlvKCZwZGV2LT5kZXYsIGFtbF9kbWEtPmJhc2UsCj4gIAkJCQkJCSZh
bWxfcmVnbWFwX2NvbmZpZyk7Cj4gLQlpZiAoSVNfRVJSX09SX05VTEwoYW1sX2RtYS0+cmVnbWFw
KSkKPiArCWlmIChJU19FUlIoYW1sX2RtYS0+cmVnbWFwKSkKPiAgCQlyZXR1cm4gUFRSX0VSUihh
bWxfZG1hLT5yZWdtYXApOwoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgdGhpcyBjb2RlIGxlYWsg
dGhlIGZyZWVfd3Egd29ya3F1ZXVlIG9uIHRoaXMgZXJyb3IgcGF0aD8KCmFtbF9kbWEtPmZyZWVf
d3EgaXMgYWxsb2NhdGVkIGVhcmxpZXIgaW4gYW1sX2RtYV9wcm9iZSgpIHVzaW5nCmFsbG9jX29y
ZGVyZWRfd29ya3F1ZXVlKCksIHdoaWNoIGlzbid0IG1hbmFnZWQgYnkgZGV2cmVzOgoKZHJpdmVy
cy9kbWEvYW1sb2dpYy1kbWEuYzphbWxfZG1hX3Byb2JlKCkgewogICAgLi4uCglhbWxfZG1hLT5m
cmVlX3dxID0gYWxsb2Nfb3JkZXJlZF93b3JrcXVldWUoImFtbF9kbWFfZnJlZSIsIDApOwoJaWYg
KCFhbWxfZG1hLT5mcmVlX3dxKQoJCXJldHVybiAtRU5PTUVNOwogICAgLi4uCn0KCklmIGRldm1f
cmVnbWFwX2luaXRfbW1pbygpIGZhaWxzIGFuZCB3ZSByZXR1cm4gZGlyZWN0bHkgaGVyZSwgdGhl
cmUgaXMKbm8gY2xlYW51cCBmb3IgdGhlIGFsbG9jYXRlZCB3b3JrcXVldWUuCgo+ICAKPiAgCWFt
bF9kbWEtPmNsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKCZwZGV2LT5kZXYsIE5VTEwpOwoKLS0g
ClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MTAxNi1maXgtYTktZG1hLWNvbXBsaWVyLXYxLTEtMDI0NDIxZDViM2M4QGFtbG9naWMuY29tP3Bh
cnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
