Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC327C44501
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 18:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1rbN3pfRAHKUaoE8rkoWgo8K4D7Huk2l3+X7MkBUTU=; b=d/lPh6PRw4hToh
	R775l7YLtdlQvw/Liv+SIxNcbtMULK8IfbtuOwvsUsyteaG9lnCdUXAZ9P78uRR22lnuq0kmv1rCT
	2/iWsuZY/OeUBdtN20Oe3IVADyZpY5xKVwIEvGD2RSRhgv3E03V2yLiGSsGch0o26YmGylpt7pm63
	o1HQp419ejRKMAmpUU+mPU0aZs58CX7a1Nx0D7ejPI+asgY0MWeCz2unU80ZonX/7+IITkqqwrpdc
	VXMlCMF8Ot9yyIfEgpTx3P+K+xneOGsQd5ybXYL47n1PAZx9D2Btirxn4Tqtq1GcNQ9ap+v2b6ZMf
	Ny22q7ux1sR+qlK5WJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3um-0000000Fbst-26mv;
	Wed, 15 Jul 2026 18:01:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk3uk-0000000FbsP-1okF
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jul 2026 18:00:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B4F074395E;
	Wed, 15 Jul 2026 18:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE0C1F00A3E;
	Wed, 15 Jul 2026 18:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784138457;
	bh=d0dsrItk9jXayM9Q2oV+GZ8nC06mXCTAXStu/9l8J9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cx0YuZW9Mlvd6W/dp6K+vSWTyT78ZoyO33t1J68uMTGORjw9nmW1QhWjKoYT5IHdz
	 CBMAHZQmuWeUuR1+QIYWKK+ekXkaciKqkKDgbhVvOY30QJ7FFDU3RYDMeJkWc3d0Lp
	 czn/wWie/U61BRuwHFVWZwI0/T0m7psPSP5YNWAMgLiuRfj5RuHpztvG6hXjHWFCGj
	 RGCkMyYgjJn570ulTmvGfmUQM/6bSM06xdJbfWDRYSqkb5Ce21LaOOYWXJ8uSSydRC
	 LYGCQaQCj3x5frvNF1/qz5afWx6VS1VQZ8qxu7Q1DIrPx+qHqtijty+kUthDB6vHsG
	 MAYEUJ4uCMM/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] nvmem: core: make reg_write() take a const void *
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: linux-sunxi@lists.linux.dev, lee@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, neil.armstrong@linaro.org, linux-rtc@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-amlogic@lists.infradead.org, mfd@lists.linux.dev, ojeda@kernel.org
In-Reply-To: <20260715175229.24672-2-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
 <20260715175229.24672-2-linkmauve@linkmauve.fr>
Date: Wed, 15 Jul 2026 18:00:56 +0000
Message-Id: <20260715180057.0EE0C1F00A3E@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIE1vZGlmeWluZyB0aGUg
YG52bWVtX3JlZ193cml0ZV90YCBjYWxsYmFjayBzaWduYXR1cmUgdG8gdXNlIGBjb25zdCB2b2lk
ICp2YWxgIHdpdGhvdXQgdXBkYXRpbmcgdGhlIGltcGxlbWVudGluZyBkcml2ZXJzIGNhdXNlcyB3
aWRlc3ByZWFkIGJ1aWxkIGZhaWx1cmVzIGFuZCBydW50aW1lIGtDRkkgcGFuaWNzLgotLQoKLS0t
IFBhdGNoIFsxXTogW1BBVENIIDEvOF0gbnZtZW06IGNvcmU6IG1ha2UgcmVnX3dyaXRlKCkgdGFr
ZSBhIGNvbnN0IHZvaWQgKiAtLS0KY29tbWl0IDQ2NWFhMWVmN2FkNjQ3NWMyODY3MTZhMWZmZmM3
Y2RiOWI2ZjA5ZGMKQXV0aG9yOiBMaW5rIE1hdXZlIDxsaW5rbWF1dmVAbGlua21hdXZlLmZyPgoK
bnZtZW06IGNvcmU6IG1ha2UgcmVnX3dyaXRlKCkgdGFrZSBhIGNvbnN0IHZvaWQgKgoKVGhpcyBj
b21taXQgY2hhbmdlcyB0aGUgbnZtZW1fcmVnX3dyaXRlX3QgY2FsbGJhY2sgc2lnbmF0dXJlIHRv
IGV4cGVjdAphIGNvbnN0IHZvaWQgKiBpbnN0ZWFkIG9mIGEgbXV0YWJsZSB2b2lkICouCgo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmggYi9pbmNsdWRlL2xpbnV4
L252bWVtLXByb3ZpZGVyLmgKPiBpbmRleCBmM2IxM2RhNzhhYWM5Li5lNjIyODU4MzZjYmJlIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvbnZtZW0tcHJvdmlkZXIuaAo+IEBAIC0xOSw3ICsxOSw3IEBAIHN0cnVjdCBudm1l
bV9kZXZpY2U7Cj4gIHR5cGVkZWYgaW50ICgqbnZtZW1fcmVnX3JlYWRfdCkodm9pZCAqcHJpdiwg
dW5zaWduZWQgaW50IG9mZnNldCwKPiAgCQkJCXZvaWQgKnZhbCwgc2l6ZV90IGJ5dGVzKTsKPiAg
dHlwZWRlZiBpbnQgKCpudm1lbV9yZWdfd3JpdGVfdCkodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50
IG9mZnNldCwKPiAtCQkJCSB2b2lkICp2YWwsIHNpemVfdCBieXRlcyk7Cj4gKwkJCQkgY29uc3Qg
dm9pZCAqdmFsLCBzaXplX3QgYnl0ZXMpOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIG1vZGlmeWlu
ZyB0aGlzIGNhbGxiYWNrIHNpZ25hdHVyZSB3aXRob3V0IHVwZGF0aW5nIHRoZSBpbXBsZW1lbnRp
bmcKZHJpdmVycyBjYXVzZSB3aWRlc3ByZWFkIGJ1aWxkIGZhaWx1cmVzIGFuZCBydW50aW1lIGtD
RkkgcGFuaWNzPwoKRm9yIGV4YW1wbGUsIGRyaXZlcnMvbnZtZW0vYmNtLW9jb3RwLmM6YmNtX290
cGNfd3JpdGUoKSBzdGlsbCBleHBlY3RzCmEgbXV0YWJsZSB2b2lkICo6CgpzdGF0aWMgaW50IGJj
bV9vdHBjX3dyaXRlKHZvaWQgKmNvbnRleHQsIHVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnZh
bCwKICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3QgYnl0ZXMpCgpXaGVuIHRoaXMgaXMg
YXNzaWduZWQgdG8gcmVnX3dyaXRlIGluIGJjbV9vdHBjX252bWVtX2NvbmZpZywgaXQgY2F1c2Vz
IGFuCmluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgbWlzbWF0Y2guIFRoaXMgbGVhZHMgdG8gYnVp
bGQgZXJyb3JzIHdpdGggbW9kZXJuCmNvbXBpbGVycyBvciAtV2Vycm9yLCBhbmQgd2lsbCB0cmln
Z2VyIGtlcm5lbCBwYW5pY3MgdXBvbiBhbnkgbnZtZW0gd3JpdGUKb3BlcmF0aW9uIG9uIGtlcm5l
bHMgd2l0aCBDb250cm9sLUZsb3cgSW50ZWdyaXR5IChrQ0ZJKSBlbmFibGVkLgoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcxNTE3
NTIyOS4yNDY3Mi0xLWxpbmttYXV2ZUBsaW5rbWF1dmUuZnI/cGFydD0xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
