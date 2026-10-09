Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12246CA6015
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ummBq+OQvcYVsRA1mT8Dj6e8KEJVyMohscj0DrTYyM8=; b=iuvlqFxKuPUrmp
	gy9VMLHUZAspf/wsBS2Mmd8s627G+aiUKMvP1BvbeHUhHhBe0Oj9+C8LTe0+XpAEDlbH881UQXT40
	CtskF3SHMXb4aKcu0DIPcLUxH5QBNS2aMSjEPjVNRi7GrQWlaB2+sLffTfn+VIQqAKWD7HRZLlmOq
	G4nXr8xf2Y4B0GpWxZE1vVEuceTHxvfd3/UeCiAlc1PKYEpklEBL780j0EGz5AUNhfbHCE4qV122G
	5Nm/2PaQ4kl+kq4lLMMdMTraLlF4CH2FQyX8PWNKqVb0uj/Gr+XfVQqKTvQGo9Js/sZ0vbYoHh/G3
	sjZRXNyBP2VcjM8aqdxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1X5-00000005Q4i-2T3P;
	Fri, 09 Oct 2026 03:44:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1X3-00000005Q47-1COM
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:44:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1CAC60DB1;
	Fri,  9 Oct 2026 03:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7081F000FF;
	Fri,  9 Oct 2026 03:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517468;
	bh=ic10yKCOaGvIjB1QnKoIJRXGkmtrTZldaiDdjxVQR5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LYhF0b/sBrOZ23ybZmMPD3LQJ8cNcUq5hNBk+u0NOSliz0JZc7XS7QOJu1y65GlRg
	 nUFctMCH7ioPmREzwcYsvFtuQlquHDHlmuMTh/gyKyqNSjEe+1XDVXTnBQMp6v8psz
	 +XDU+eYxAJ5Deu/xvooCNQSc8w6db0+L501bS7iVjZbsq6wWmYzQrje3Ub9avaspZ7
	 MOAZ4Z6YAkIqeRZ+9s3h0mg3lAsZsn+O7YjjMmlsIt6QnkqqsEO31Pybu8khhfY2Zr
	 UOA3W3EHmUXp8Mxlo1q+HM7GHM4yb/CfAP9jmQ1YhMeId6ONEaBAozCG8TXT8rnCFL
	 kEhtzGrtJ/2GA==
Message-ID: <sashiko-outbox-164787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/20] drm/msm/dp: Serialize video test state changes
To: "Xilin Wu" <sophon@radxa.com>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20261009-msm-dp-hdr10-v2-19-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-19-1835d4966da3@radxa.com>
Date: Fri, 09 Oct 2026 03:44:27 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gZHJtL21zbS9kcDog
bWlzc2luZyBwbHVnZ2VkX2xvY2sgaW4gbXNtX2RwX3BhbmVsX2dldF9tb2RlX2JwcCgpIGxlYXZl
cyBUT0NUT1UgcmFjZQotLQoKY29tbWl0IDAxNmYxNzQ5N2RjNWY0NzRiODZlMTUyMzI0ZmJhNGQ5
NDA5NzgxYjYKQXV0aG9yOiBYaWxpbiBXdSA8c29waG9uQHJhZHhhLmNvbT4KCmRybS9tc20vZHA6
IFNlcmlhbGl6ZSB2aWRlbyB0ZXN0IHN0YXRlIGNoYW5nZXMKClRoaXMgY29tbWl0IHNlcmlhbGl6
ZXMgdmlkZW8gdGVzdCBzdGF0ZSBhY2Nlc3MgYnkgcm91dGluZyBpdCB0aHJvdWdoIHRoZQpkaXNw
bGF5IGFuZCB1c2luZyBwbHVnZ2VkX2xvY2sgZm9yIEhQRCBhbmQgZGVidWdmcyB1cGRhdGVzLiBU
aGlzIHByZXZlbnRzCnJhY2UgY29uZGl0aW9ucyBkdXJpbmcgbW9kZSBwcm9ncmFtbWluZy4KCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKPiBpbmRleCAzNGUxYzQ4Y2RkNzk0Li5jNTFk
MDMzNTk4YTViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxh
eS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMKClsgLi4uIF0K
Cj4gQEAgLTY4OSw4ICs2OTksMTAgQEAgc3RhdGljIGludCBtc21fZHBfZGlzcGxheV9zZXRfbW9k
ZShzdHJ1Y3QgbXNtX2RwICptc21fZHBfZGlzcGxheSwKPiAgCj4gIAlkcCA9IGNvbnRhaW5lcl9v
Zihtc21fZHBfZGlzcGxheSwgc3RydWN0IG1zbV9kcF9kaXNwbGF5X3ByaXZhdGUsIG1zbV9kcF9k
aXNwbGF5KTsKPiAgCj4gLQlpZiAobXNtX2RwX2Rpc3BsYXlfY2hlY2tfdmlkZW9fdGVzdChtc21f
ZHBfZGlzcGxheSkpCj4gLQkJYnBwID0gbXNtX2RwX2Rpc3BsYXlfZ2V0X3Rlc3RfYnBwKG1zbV9k
cF9kaXNwbGF5KTsKPiArCWd1YXJkKG11dGV4KSgmZHAtPnBsdWdnZWRfbG9jayk7Cj4gKwo+ICsJ
aWYgKGRwLT5wYW5lbC0+dmlkZW9fdGVzdCkKPiArCQlicHAgPSBtc21fZHBfbGlua19iaXRfZGVw
dGhfdG9fYnBwKGRwLT5saW5rLT50ZXN0X3ZpZGVvLnRlc3RfYml0X2RlcHRoKTsKCltTZXZlcml0
eTogTWVkaXVtXQpUaGUgY29tbWl0IG1lc3NhZ2Ugbm90ZXMgdGhhdCByZWFkaW5nIHRoZSB0ZXN0
IGZsYWcgYW5kIHJlcXVlc3RlZCBkZXB0aApzZXBhcmF0ZWx5IGFsbG93cyB2YWx1ZXMgdG8gY2hh
bmdlIG1pZC1yZWFkLCBhbmQgdGhpcyBmdW5jdGlvbiB3YXMgc2FmZWx5CnVwZGF0ZWQgdG8gaG9s
ZCBwbHVnZ2VkX2xvY2suCgpIb3dldmVyLCBkb2VzIHRoaXMgcGF0Y2ggbWlzcyB0aGUgc2ltaWxh
ciByZWFkcyBpbiBtc21fZHBfcGFuZWxfZ2V0X21vZGVfYnBwKCkKaW4gZHJpdmVycy9ncHUvZHJt
L21zbS9kcC9kcF9wYW5lbC5jPyAKClRoYXQgZnVuY3Rpb24gaXMgY2FsbGVkIGR1cmluZyBEUk0g
bW9kZSB2YWxpZGF0aW9uIGFuZCBzdGlsbCByZWFkcyB0aGVzZQpmaWVsZHMgc2VxdWVudGlhbGx5
IHdpdGhvdXQgaG9sZGluZyBwbHVnZ2VkX2xvY2s6Cgpkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2Rw
X3BhbmVsLmM6bXNtX2RwX3BhbmVsX2dldF9tb2RlX2JwcCgpIHsKICAgIC4uLgogICAgaWYgKG1z
bV9kcF9wYW5lbC0+dmlkZW9fdGVzdCkKICAgICAgICBicHAgPSBtc21fZHBfbGlua19iaXRfZGVw
dGhfdG9fYnBwKAogICAgICAgICAgICAgICAgcGFuZWwtPmxpbmstPnRlc3RfdmlkZW8udGVzdF9i
aXRfZGVwdGgpOwogICAgLi4uCn0KCklmIEhQRCBvciBkZWJ1Z2ZzIHVwZGF0ZXMgdGhlc2UgdmFs
dWVzIGNvbmN1cnJlbnRseSwgY291bGQgdGhpcyBmdW5jdGlvbgpvYnNlcnZlIGEgdG9ybiBzdGF0
ZSB3aGVyZSB0aGUgdGVzdCBmbGFnIGlzIHRydWUgYnV0IHRoZSBiaXQgZGVwdGggaGFzIG5vdAp5
ZXQgYmVlbiB1cGRhdGVkLCBjYXVzaW5nIGl0IHRvIGluY29ycmVjdGx5IGFjY2VwdCBvciByZWpl
Y3QgYSBtb2RlIGJhc2VkCm9uIGluY29uc2lzdGVudCBwYXJhbWV0ZXJzPwoKPiAgCWVsc2UKPiAg
CQlicHAgPSBzdGF0ZS0+YnBwOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAwOS1tc20tZHAtaGRyMTAtdjItMC0xODM1ZDQ5NjZk
YTNAcmFkeGEuY29tP3BhcnQ9MTkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
