Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0924C44501
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2026 18:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1Ynin+DKm/ja1F9KaMXvig4yXHklFZx1z6xysxm05A=; b=N2jKpZr9EiAzQP
	+hI69Uzje1Tbw/dEI8nZpx9dFCCFl2tTF1TV1Z2mVsvyIBLrErIsujUPqYOuq8TtS771+03DqP5eV
	czNF+lxYUJWrAf0WKu/znJywDJ1PiroRcs+OQrUc/28kHMR0e0AbryDywvRQ7tEq+Yj1LfZc5Duez
	08NvRyF1JtCypyf/SflCawOEu1Zv8Rc8bDCsYT2vuApqZ8u+El5vK8KGp4QRZVlXBrvR1IPhuY1Db
	gVcBHz5+wiOjyJQQ3kbcfIwkrn982NouF0ZNyIwniDS6lqLqm89lZOEdyYOpBZK8eUVEUHEveZOwC
	VY18BXAsRzLdCFDMT3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk42T-0000000Fe4f-2hkR;
	Wed, 15 Jul 2026 18:08:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk42S-0000000Fe4B-2be6
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jul 2026 18:08:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDD956187C;
	Wed, 15 Jul 2026 18:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5671F000E9;
	Wed, 15 Jul 2026 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784138935;
	bh=az6A+r5sV1xM8anb9eU0+PGR2wIcnyNZ2dPn/ThWLL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WNqO+nw8Bkk2TpyUjJ7VhYmd+ZjPfelOhKRWosJrECDZ84XrANXi2OnBIKDebUn8w
	 J2eQrKXxoC9mOWTmvHCwxAM5ms2bWzCHGgfvr1y4u9IC1hSZSEtciHbkjgkYYLmdSU
	 o8qB+/3RI3En/zS8aanRMcx4thoh8JFVkeF5dhD3JasbsXebwWjbSkthdij7zZEmA6
	 BAsEozCI+7Jq+uaj9MibgI0hHUqzg9rgLqU2/+aZSRLAeCraRjK9Sz9ralmShoxN1r
	 il/T+MIJEOySTvoWINhAI2NN0X8UtuX5D1vC7JP7KyP6gH8Mw/mLZ89xIluBXemwU0
	 Cs+FUMDcEM+vQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] mfd: twl-core: make reg_write callback take const
 void *
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, ojeda@kernel.org, neil.armstrong@linaro.org, linux-rtc@vger.kernel.org, imx@lists.linux.dev, mfd@lists.linux.dev, Frank.Li@kernel.org, lee@kernel.org, linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org
In-Reply-To: <20260715175229.24672-8-linkmauve@linkmauve.fr>
References: <20260715175229.24672-1-linkmauve@linkmauve.fr>
 <20260715175229.24672-8-linkmauve@linkmauve.fr>
Date: Wed, 15 Jul 2026 18:08:54 +0000
Message-Id: <20260715180854.EE5671F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpOZXcgaXNzdWVzOgotIFtMb3ddIFRo
ZSBjb21taXQgbWVzc2FnZSBkZXNjcmlwdGlvbiBpcyBub3QgY2FwaXRhbGl6ZWQsIHZpb2xhdGlu
ZyBNRkQgc3Vic3lzdGVtIGd1aWRlbGluZXMuCgpQcmUtZXhpc3RpbmcgaXNzdWVzOgotIFtIaWdo
XSBQcm9iZSBmYWlsdXJlIGR1cmluZyBNRkQgZGV2aWNlIHJlZ2lzdHJhdGlvbiBza2lwcyBtYW51
YWwgcmVzb3VyY2UgY2xlYW51cCwgY2F1c2luZyByZXNvdXJjZSBsZWFrcy4KLS0KCi0tLSBQYXRj
aCBbN106IFtQQVRDSCA3LzhdIG1mZDogdHdsLWNvcmU6IG1ha2UgcmVnX3dyaXRlIGNhbGxiYWNr
IHRha2UgY29uc3Qgdm9pZCAqIC0tLQpjb21taXQgNTUyNWZkM2JmYTczNDI0ZTk0Mjg5MmJkMWUx
ZmIyZDJlOTU1NDE1OQpBdXRob3I6IExpbmsgTWF1dmUgPGxpbmttYXV2ZUBsaW5rbWF1dmUuZnI+
CgptZmQ6IHR3bC1jb3JlOiBtYWtlIHJlZ193cml0ZSBjYWxsYmFjayB0YWtlIGNvbnN0IHZvaWQg
KgoKVGhpcyBjb21taXQgdXBkYXRlcyB0aGUgcmVnX3dyaXRlIGNhbGxiYWNrIHRvIHVzZSBhIGNv
bnN0IHZvaWQgcG9pbnRlciBmb3IKaXRzIGRhdGEgYXJndW1lbnQuIEl0IGZpeGVzIGFsbCB1c2Vy
cyBvZiB0aGUgbnZtZW1fY29uZmlnIEFQSSB0byBhY2NvbW1vZGF0ZQp0aGlzIGNoYW5nZS4KCj4g
bWZkOiB0d2wtY29yZTogbWFrZSByZWdfd3JpdGUgY2FsbGJhY2sgdGFrZSBjb25zdCB2b2lkICoK
CltTZXZlcml0eTogTG93XQpUaGlzIGlzbid0IGEgYnVnLCBidXQgc2hvdWxkIHRoZSBkZXNjcmlw
dGlvbiBhZnRlciB0aGUgc3Vic3lzdGVtIHByZWZpeCBiZQpjYXBpdGFsaXplZCAoaS5lLiwgIk1h
a2UgcmVnX3dyaXRlLi4uIikgdG8gbWF0Y2ggdGhlIE1GRCBzdWJzeXN0ZW0gZ3VpZGVsaW5lcz8K
CltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IEkgbm90
aWNlZCBhIHBvdGVudGlhbCByZXNvdXJjZSBsZWFrIGluCnR3bF9wcm9iZSgpLiBJZiBkZXZtX21m
ZF9hZGRfZGV2aWNlcygpIGZhaWxzLCB0aGUgY29kZSBqdW1wcyBkaXJlY3RseSB0bwp0aGUgJ2Zy
ZWUnIGxhYmVsLCBza2lwcGluZyB0aGUgJ2ZhaWwnIGxhYmVsOgoKZHJpdmVycy9tZmQvdHdsLWNv
cmUuYzp0d2xfcHJvYmUoKSB7CiAgICAuLi4KCQlzdGF0dXMgPSBkZXZtX21mZF9hZGRfZGV2aWNl
cygmY2xpZW50LT5kZXYsIFBMQVRGT1JNX0RFVklEX05PTkUsCgkJCQkJICAgICAgY2VsbHMsIG51
bV9jZWxscywgTlVMTCwgMCwgTlVMTCk7CgkJaWYgKHN0YXR1cyA8IDApCgkJCWdvdG8gZnJlZTsK
ICAgIC4uLgpmYWlsOgoJaWYgKHN0YXR1cyA8IDApCgkJdHdsX3JlbW92ZShjbGllbnQpOwpmcmVl
OgoJaWYgKHN0YXR1cyA8IDApCgkJcGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIocGRldik7CiAg
ICAuLi4KfQoKRG9lcyB0aGlzIGJ5cGFzcyBsZWFrIG1hbnVhbGx5IHJlcXVlc3RlZCBJUlEgZG9t
YWlucyBhbmQgdW5tYW5hZ2VkIGR1bW15IEkyQwpkZXZpY2VzIGJ5IHNraXBwaW5nIHR3bF9yZW1v
dmUoKT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjA3MTUxNzUyMjkuMjQ2NzItMS1saW5rbWF1dmVAbGlua21hdXZlLmZyP3BhcnQ9
NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
