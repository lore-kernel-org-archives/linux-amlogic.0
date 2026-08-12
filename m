Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC11C5AD5A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 11:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKRZaRGvIc1wPP5vZetMR0kfgmN2AQOPn8p8ZvGvL9A=; b=PxFtRbRSjIVz6/
	cgPAmRh2WC01W82A8LFV+FORqjTYh9gIY4OoiVs0h0jEGJT77CnOcPZOULFl4QjeXMV9MJVeu2Gun
	CsyYA2Srt+5awkJfRrQiCK9o7GUyeYMRliMjDPjb2H/3fuaxCgyaYCocXl0nImCzxZ9UqZQ5EgWR/
	Jg3nkQPqnJ99NqmEIlvPPXtrVFZrUl9dH/Wp2KIFMB2BgKGEgnU2UYZMzXmcKmFgZSHoH1/Amq0zN
	ccdwOmU3JPJUnOZPSpGIX+qMv4CywR99IwTRSPBcCvqGakf0Tr24ir3oSZhDHy2ygAHS3JHbApuUK
	uEv8q3RX5Wjtxt5WUjcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7QP-0000000G82I-28F9;
	Wed, 12 Aug 2026 11:47:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7QO-0000000G82A-1e9m
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 11:47:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE53443360;
	Wed, 12 Aug 2026 11:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8641E1F00A3A;
	Wed, 12 Aug 2026 11:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786535231;
	bh=AWqyx9/j/+nbvFH4EjN7hWOopVh3Eqw1Jt9fVQElHQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mzUzC0ToJrQhuxq6R2ZYEXlgFMVEkf6JuqZ13BRcSQUWIGmNmZ3hiB0+4p1zIZAFS
	 u960G4k7caYd89dw1klqTcZXYjCn2NuWsFdhY0oiRf+bHfSltRkM++z5I00ojIhoHp
	 O2cPk+n9omcAHEEoTAeQikBZpaFaZ+7FofIJA/DNmCmyolov+kUgqDVW1n3s1bfL1x
	 nw8IxBePAAlZqUcurY2OK1jPrdhFxaInnhCq+CZS3f0B7tn6ys6Y2vlBCturEJ1tat
	 GIFNhG0DS7iqV+CSkWpPre0ZRV6ssEvSQUCb4gptkqn4KLabWhQsp+X91QWmk+zkWj
	 AXwSCQc4mWX4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] mmc: davinci: Handle errors from optional IRQ
 lookup
To: phucduc.bui@gmail.com
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260812112023.42254-3-phucduc.bui@gmail.com>
References: <20260812112023.42254-1-phucduc.bui@gmail.com>
 <20260812112023.42254-3-phucduc.bui@gmail.com>
Date: Wed, 12 Aug 2026 11:47:11 +0000
Message-Id: <20260812114711.8641E1F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIERpcmVjdCByZXR1cm4g
b24gZXJyb3IgZnJvbSBgcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgpYCBsZWFrcyB0aGUgY2xv
Y2sgcHJlcGFyZS9lbmFibGUgcmVmZXJlbmNlLgotLQoKLS0tIFBhdGNoIFsyXTogW1BBVENIIDIv
M10gbW1jOiBkYXZpbmNpOiBIYW5kbGUgZXJyb3JzIGZyb20gb3B0aW9uYWwgSVJRIGxvb2t1cCAt
LS0KY29tbWl0IDNiM2Q3MDZhOTU2ODhmZjJkODIyOTcwMmM4MmQyYTBjZDk1ZTNmNWQKQXV0aG9y
OiBidWkgZHVjIHBodWMgPHBodWNkdWMuYnVpQGdtYWlsLmNvbT4KCm1tYzogZGF2aW5jaTogSGFu
ZGxlIGVycm9ycyBmcm9tIG9wdGlvbmFsIElSUSBsb29rdXAKClRoaXMgY29tbWl0IHVwZGF0ZXMg
dGhlIGVycm9yIGhhbmRsaW5nIGZvciBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsIHRvCnByb3Bh
Z2F0ZSBuZWdhdGl2ZSBlcnJvciBjb2Rlcywgc3VjaCBhcyAtRVBST0JFX0RFRkVSLCByYXRoZXIg
dGhhbiBzdG9yaW5nCnRoZW0gZGlyZWN0bHkgYXMgdGhlIHNkaW9faXJxIG51bWJlci4gVGhpcyBh
bGxvd3MgdGhlIGNhbGxlciB0byBoYW5kbGUgdGhlc2UKZXJyb3JzIGFwcHJvcHJpYXRlbHkgaW5z
dGVhZCBvZiBibGluZGx5IGNvbnRpbnVpbmcgdGhlIHByb2JlLgoKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tbWMvaG9zdC9kYXZpbmNpX21tYy5jIGIvZHJpdmVycy9tbWMvaG9zdC9kYXZpbmNpX21t
Yy5jCj4gaW5kZXggY2RiOWZhOTRiNTZkMC4uNDc2NWQyZGVlNTk5MyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL21tYy9ob3N0L2RhdmluY2lfbW1jLmMKPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L2Rh
dmluY2lfbW1jLmMKPiBAQCAtMTI0OCw3ICsxMjQ4LDExIEBAIHN0YXRpYyBpbnQgZGF2aW5jaV9t
bWNzZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAKPiAgCWhvc3QtPnVz
ZV9kbWEgPSB1c2VfZG1hOwo+ICAJaG9zdC0+bW1jX2lycSA9IGlycTsKPiAtCWhvc3QtPnNkaW9f
aXJxID0gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbChwZGV2LCAxKTsKPiArCXJldCA9IHBsYXRm
b3JtX2dldF9pcnFfb3B0aW9uYWwocGRldiwgMSk7Cj4gKwlpZiAocmV0IDwgMCAmJiByZXQgIT0g
LUVOWElPKQo+ICsJCXJldHVybiByZXQ7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBkaXJl
Y3QgcmV0dXJuIGxlYWsgdGhlIGNsb2NrIHJlZmVyZW5jZT8KCkVhcmxpZXIgaW4gZGF2aW5jaV9t
bWNzZF9wcm9iZSgpLCB0aGUgY2xvY2sgaXMgcHJlcGFyZWQgYW5kIGVuYWJsZWQ6CgoJcmV0ID0g
Y2xrX3ByZXBhcmVfZW5hYmxlKGhvc3QtPmNsayk7CglpZiAocmV0KQoJCXJldHVybiByZXQ7CgpJ
ZiBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgcmV0dXJucyBhbiBlcnJvciBsaWtlIC1FUFJP
QkVfREVGRVIsIHJldHVybmluZwpkaXJlY3RseSBoZXJlIGJ5cGFzc2VzIHRoZSBjbGVhbnVwIGxh
YmVscyBhdCB0aGUgZW5kIG9mIHRoZSBmdW5jdGlvbiB0aGF0CmNhbGwgY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGhvc3QtPmNsaykuIFRoaXMgY2FuIGVuZGxlc3NseSBpbmNyZWFzZSB0aGUKY2xvY2sg
cmVmZXJlbmNlIGNvdW50IG9uIHByb2JlIHJldHJpZXMsIHBlcm1hbmVudGx5IHByZXZlbnRpbmcg
dGhlIGNsb2NrIGZyb20KYmVpbmcgZGlzYWJsZWQgZm9yIHBvd2VyIG1hbmFnZW1lbnQuCgpTaG91
bGQgdGhpcyB1c2UgYSBnb3RvIGxhYmVsIChsaWtlIHBhcnNlX2ZhaWwgb3IgZG1hX3Byb2JlX2Rl
ZmVyKSBpbnN0ZWFkPwoKPiArCWlmIChyZXQgPiAwKQo+ICsJCWhvc3QtPnNkaW9faXJxID0gcmV0
Owo+ICAKPiAgCWlmIChob3N0LT51c2VfZG1hKSB7Cj4gIAkJcmV0ID0gZGF2aW5jaV9hY3F1aXJl
X2RtYV9jaGFubmVscyhob3N0KTsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MTIxMTIwMjMuNDIyNTQtMS1waHVjZHVjLmJ1aUBn
bWFpbC5jb20/cGFydD0yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
