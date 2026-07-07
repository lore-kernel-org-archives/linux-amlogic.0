Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A61C43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 01:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gazeAyET698d0xBnFE+LiKDt4ryt9JdCI+LUM5slg4Q=; b=DkJI+v1vFBNUFe
	eAgq5e0C/655mhf1T9z81KhvkekLBJ2H48U32Sh9G0iWU5DGtYWuzzC2Xbf87KfHJAdaIHzBolHeR
	xzS2SiW06pkUhbD7dusLUrbBk/z4rhJtGYVwbT2gUeInt2e4rh4sSNekShMcM2RHrkdNYlVrnoHQX
	4Z2NsQIvRvwBLoqEDO/Hg1+qvYxzOiVa82aYRPdZxJUg71Pwn4USvZjFkeQcUVzZdD1fBW32edMUs
	IR4WCzn0priMjqE2ct8XTQyDplGefPvxy/00eoW0jMqzChiQl2/UF7EXdPCq4WzbFRTd5Kkw4My6i
	8pR1ScnyB0U1GoGJR84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wguhr-0000000Dsop-3e6L;
	Tue, 07 Jul 2026 01:34:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wguhq-0000000DsoV-0KbF
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 01:34:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 60B9F42EAE;
	Tue,  7 Jul 2026 01:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DA61F000E9;
	Tue,  7 Jul 2026 01:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783388077;
	bh=MdTjO61VEthcZtWFEBtczvtdqujQxz8LfvWdaRKuarw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z4COrMyxdmJnSTA5t3sgMkwovJ6sL2Hu+dBbUqt2KcvaajtEFGJ4lbFl9BCFZ7lv2
	 udiFTdSbhn+RCQRAbdqOhzQqmKBJNP6vbH5SWDMwnwVyeVKYMRW+lsHWnYizn+n7AT
	 6scrL++EilUy3SD9CzB1CbMo6ptK6CkxTxDuYVCwmk80Ru60ZAsv6WxvTX7vzBRtb8
	 jOlInRn16tdxMW5wKDdplkuEwZI6mzL8us0JQwavbMx5fH8Kvo66U9na2J6hy05Iyq
	 /NjZ/UnmmilKC2RJNahQhHfr9n56CX3tRO+SZTRC+9XhDIg+3zHDvM02uj25zQnhVx
	 lHwyDv05RmC7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: meson: aiu: Fix resource leak
To: "Ethan Tidmore" <ethantidmore06@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260707012424.1661733-1-ethantidmore06@gmail.com>
References: <20260707012424.1661733-1-ethantidmore06@gmail.com>
Date: Tue, 07 Jul 2026 01:34:36 +0000
Message-Id: <20260707013437.27DA61F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIHBhdGNoIG1v
ZGlmaWVzIHRoZSBlcnJvciBwYXRoIHRvIHB1cnBvcnRlZGx5IGZyZWUgdGhlIGBhaXUtZm9ybWF0
dGVyYCByZXNvdXJjZSBieSBqdW1waW5nIHRvIHRoZSBgZXJyYCBsYWJlbCwgcmVmZXJlbmNpbmcg
Y29tbWl0IDgzYjgzMDI0Y2RiZmQuIEhvd2V2ZXIsIHRoZSBgYWl1LWZvcm1hdHRlcmAgYWxsb2Nh
dGlvbiBhbmQgY2xlYW51cCBjb2RlIChzcGVjaWZpY2FsbHkgYGd4X2Zvcm1hdHRlcl9jcmVhdGVg
IGFuZCBgZ3hfZm9ybWF0dGVyX2ZyZWVgKSBkb2VzIG5vdCBleGlzdCBpbiB0aGUgY29kZWJhc2Ug
YXQgdGhpcyByZXZpc2lvbi4gVGhlIHBhdGNoIGlzIGEgImdob3N0IGZpeCIgYXR0ZW1wdGluZyB0
byByZXNvbHZlIGEgcmVzb3VyY2UgbGVhayBmb3IgYSBmZWF0dXJlIHRoYXQgaXMgbWlzc2luZyBp
biB0aGlzIHRyZWUuCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0hdIEFTb0M6IG1lc29uOiBhaXU6
IEZpeCByZXNvdXJjZSBsZWFrIC0tLQpjb21taXQgZTFmNDNmNGE1OWM2MjY1NzQ4ODQ3MmFmODdh
YTJlNWQ4MDU3NmIwMwpBdXRob3I6IEV0aGFuIFRpZG1vcmUgPGV0aGFudGlkbW9yZTA2QGdtYWls
LmNvbT4KCkFTb0M6IG1lc29uOiBhaXU6IEZpeCByZXNvdXJjZSBsZWFrCgpUaGlzIGNvbW1pdCBj
aGFuZ2VzIGFuIGVycm9yIHBhdGggaW4gYWl1X3Byb2JlKCkgdG8gdXNlIGEgZ290byBsYWJlbApp
bnN0ZWFkIG9mIHJldHVybmluZyBkaXJlY3RseS4gVGhlIGNvbW1pdCBtZXNzYWdlIGluZGljYXRl
cyB0aGlzIGlzIHRvCmVuc3VyZSB0aGUgYWl1LWZvcm1hdHRlciBpcyBwcm9wZXJseSBmcmVlZCB3
aGVuIGNvbXBvbmVudCByZWdpc3RyYXRpb24KZmFpbHMuCgo+IGRpZmYgLS1naXQgYS9zb3VuZC9z
b2MvbWVzb24vYWl1LmMgYi9zb3VuZC9zb2MvbWVzb24vYWl1LmMKPiBpbmRleCBmMjg5MDExMWMx
ZDJjLi4xY2ZhMTY1ZmI5Y2ZjIDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi9haXUuYwo+
ICsrKyBiL3NvdW5kL3NvYy9tZXNvbi9haXUuYwoKWyAuLi4gXQoKPiBAQCAtMjg4LDcgKzI4OCw3
IEBAIHN0YXRpYyBpbnQgYWl1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IAkJCQkJIEFSUkFZX1NJWkUoYWl1X2NwdV9kYWlfZHJ2KSk7Cj4gIAlpZiAocmV0KSB7Cj4gIAkJ
ZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgY3B1IGNvbXBvbmVudFxuIik7Cj4gLQkJ
cmV0dXJuIHJldDsKPiArCQlnb3RvIGVycjsKCltTZXZlcml0eTogTWVkaXVtXQpJcyB0aGVyZSBh
IG1pc3NpbmcgZGVwZW5kZW5jeSBmb3IgdGhpcyBwYXRjaCwgb3IgaXMgaXQgYW4gaW5jb21wbGV0
ZQpiYWNrcG9ydD8KClRoZSBjb21taXQgbWVzc2FnZSBtZW50aW9ucyB0aGF0IHRoZSBhaXUtZm9y
bWF0dGVyIGlzIG5vdCBiZWluZyBmcmVlZC4KSG93ZXZlciwgbG9va2luZyBhdCBhaXVfcHJvYmUo
KSBpbiB0aGlzIHRyZWUsIHRoZXJlIGlzIG5vIGFpdS1mb3JtYXR0ZXIKYWxsb2NhdGlvbiBvciBj
bGVhbnVwIGNvZGUgcHJlc2VudCBhbnl3aGVyZSBpbiB0aGUgZnVuY3Rpb24uCgo+ICAJfQo+ICAK
PiAgCS8qIFJlZ2lzdGVyIHRoZSBoZG1pIGNvZGVjIGNvbnRyb2wgY29tcG9uZW50ICovCgpbIC4u
LiBdCgo+ICBlcnI6Cj4gIAlzbmRfc29jX3VucmVnaXN0ZXJfY29tcG9uZW50KGRldik7Cj4gIAly
ZXR1cm4gcmV0Owo+ICB9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KQXQgdGhpcyBlcnJvciBsYWJlbCwg
b25seSBzbmRfc29jX3VucmVnaXN0ZXJfY29tcG9uZW50KCkgaXMgY2FsbGVkLAphbmQgbm8gZm9y
bWF0dGVyIGNsZWFudXAgbG9naWMgZXhpc3RzLiBEb2VzIHRoaXMgZml4IGFwcGx5IHRvIGEKZGlm
ZmVyZW50IHRyZWUgd2hlcmUgdGhlIGZvcm1hdHRlciBmZWF0dXJlIGlzIGFjdHVhbGx5IHByZXNl
bnQ/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNzA3MDEyNDI0LjE2NjE3MzMtMS1ldGhhbnRpZG1vcmUwNkBnbWFpbC5jb20/cGFy
dD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
