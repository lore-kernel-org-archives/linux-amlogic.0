Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E30AC5CFDB
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OZ+ZAHQsjxRqhfb3It16TE8NJtub96Win2H+g86weQ=; b=IfnGDg+bq2KHKF
	bprqEDjFsoKZKn5WNhGdlRWBJd4vPBrchYw97Oge7AF83SGQBH595mtYRgZWWZq6SQhHQ7xhLgyMj
	Q+5IoikUArZMYvymNmScOHq5BOkryUuDX/Zz+QePTsrwQHt9SLewy7imR1PBa9MIuSv+WrxKpDhu1
	/uOvNgxPcHSGpqJTV4o3bs3QwNP4U9Q/pumBAujKXrGkLB/RDfSysSTHaXUMoAUKNo5BUob8ojyuF
	plU95Hru89wqt/tGRGr2jaqWfveGspDw5r8CgEuMwnSoQcdZxlCFOU8OAuOW2GKddwBueDwChPATf
	GfSnE2oHBEvqr0TmZPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7KB-0000000G7N8-04T0;
	Wed, 12 Aug 2026 11:40:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7K9-0000000G7N2-31hO
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 11:40:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C1CE260A85;
	Wed, 12 Aug 2026 11:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4481F000E9;
	Wed, 12 Aug 2026 11:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786534844;
	bh=RL5AUKDYdwtsktA+KCYAus6NzJJh/6isKtmiAFOqPB0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=efmkeQY+h4Zg5bJACsMrqhLkYpN5jU4G7sYknEwARYbzZh2jrg26+EE+rlVfyzY1M
	 wg3i4CRr4LQuxq552+HKJBccivDztBXDWc05aPqOY66l5A0dOtRq7rQ0A+NVKDJaFc
	 f852jykaKABuTqQW4sWmvTEJLefl+kESXja8VKqScA207kzp1XLQ8EXK0Ijde4fNB+
	 H3lujBDTP/Nia2BQVEcEKltmrVabCtUfwZoFrEYhe3gNXcilHJnonEEe86TzQygOt4
	 hX5ZDMEyA3+i6nuBY6ddOtGzerkYezztz/95OXZdahpYXOrZ5CtbZzKOh0G788vprM
	 7cY5piXQsnhtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] mmc: meson-gx: Handle errors from optional IRQ
 lookup
To: phucduc.bui@gmail.com
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260812112023.42254-2-phucduc.bui@gmail.com>
References: <20260812112023.42254-1-phucduc.bui@gmail.com>
 <20260812112023.42254-2-phucduc.bui@gmail.com>
Date: Wed, 12 Aug 2026 11:40:43 +0000
Message-Id: <20260812114044.4D4481F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFVuaW5pdGlhbGl6ZWQg
dmFyaWFibGUgdXNhZ2UgaW4gYG1lc29uX21tY19wcm9iZSgpYDogYGNkX2lycWAgaXMgcGFzc2Vk
IHRvIGBtbWNfZ3Bpb19zZXRfY2RfaXJxKClgIHdpdGhvdXQgYmVpbmcgaW5pdGlhbGl6ZWQgd2hl
biB0aGUgb3B0aW9uYWwgSVJRIGlzIG5vdCBwcmVzZW50LgotLQoKLS0tIFBhdGNoIFsxXTogW1BB
VENIIDEvM10gbW1jOiBtZXNvbi1neDogSGFuZGxlIGVycm9ycyBmcm9tIG9wdGlvbmFsIElSUSBs
b29rdXAgLS0tCmNvbW1pdCAwNTAzMjAzMDliOWYyMjJiYjNmMTM0Y2MwOGIzYTQ4YzNhNjJmNmM4
CkF1dGhvcjogYnVpIGR1YyBwaHVjIDxwaHVjZHVjLmJ1aUBnbWFpbC5jb20+CgptbWM6IG1lc29u
LWd4OiBIYW5kbGUgZXJyb3JzIGZyb20gb3B0aW9uYWwgSVJRIGxvb2t1cAoKVGhpcyBjb21taXQg
dXBkYXRlcyB0aGUgb3B0aW9uYWwgSVJRIGxvb2t1cCBpbiBtZXNvbl9tbWNfcHJvYmUoKSB0bwpw
cm9wZXJseSBwcm9wYWdhdGUgZXJyb3JzIG90aGVyIHRoYW4gLUVOWElPLiBJdCBhbHNvIGFzc2ln
bnMgdGhlIGZldGNoZWQKSVJRIHRvIGNkX2lycSBvbmx5IGlmIGEgdmFsaWQgcG9zaXRpdmUgbnVt
YmVyIGlzIHJldHVybmVkLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1n
eC1tbWMuYyBiL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPiAtLS0gYS9kcml2ZXJz
L21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1n
eC1tbWMuYwo+IEBAIC0xMTg1LDcgKzExODUsMTEgQEAgc3RhdGljIGludCBtZXNvbl9tbWNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCWlmIChob3N0LT5pcnEgPCAwKQo+
ICAJCXJldHVybiBob3N0LT5pcnE7Cj4gIAo+IC0JY2RfaXJxID0gcGxhdGZvcm1fZ2V0X2lycV9v
cHRpb25hbChwZGV2LCAxKTsKPiArCXJldCA9IHBsYXRmb3JtX2dldF9pcnFfb3B0aW9uYWwocGRl
diwgMSk7Cj4gKwlpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVOWElPKQo+ICsJCXJldHVybiByZXQ7
Cj4gKwlpZiAocmV0ID4gMCkKPiArCQljZF9pcnEgPSByZXQ7Cj4gIAltbWNfZ3Bpb19zZXRfY2Rf
aXJxKG1tYywgY2RfaXJxKTsKCltTZXZlcml0eTogSGlnaF0KRG9lcyB0aGlzIGNvZGUgcGFzcyBh
biB1bmluaXRpYWxpemVkIHZhcmlhYmxlIHRvIG1tY19ncGlvX3NldF9jZF9pcnEoKQp3aGVuIHRo
ZSBvcHRpb25hbCBJUlEgaXMgbm90IHByZXNlbnQ/CgpJZiBwbGF0Zm9ybV9nZXRfaXJxX29wdGlv
bmFsKCkgcmV0dXJucyAtRU5YSU8sIHRoZSBhc3NpZ25tZW50IHRvIGNkX2lycQppcyBza2lwcGVk
LiBUaGUgdW5pbml0aWFsaXplZCBjZF9pcnEgdmFyaWFibGUgaXMgdGhlbiBwYXNzZWQgdG8KbW1j
X2dwaW9fc2V0X2NkX2lycSgpLgoKSWYgdGhlIHVuaW5pdGlhbGl6ZWQgc3RhY2sgdmFsdWUgaGFw
cGVucyB0byBiZSA+PSAwLCBtbWNfZ3Bpb19zZXRfY2RfaXJxKCkKd2lsbCBhY2NlcHQgaXQgYW5k
IG92ZXJ3cml0ZSB0aGUgY2FyZC1kZXRlY3QgSVJRIGNvbmZpZ3VyYXRpb24gd2l0aCBhbgppbnZh
bGlkIG9yIHJhbmRvbSBJUlEgbnVtYmVyLgoKQ291bGQgY2RfaXJxIGJlIGluaXRpYWxpemVkIHRv
IGEgbmVnYXRpdmUgdmFsdWUgd2hlbiBpdCBpcyBkZWNsYXJlZD8KCj4gIAo+ICAJaG9zdC0+cGlu
Y3RybCA9IGRldm1fcGluY3RybF9nZXQoJnBkZXYtPmRldik7CgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwODEyMTEyMDIzLjQyMjU0
LTEtcGh1Y2R1Yy5idWlAZ21haWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
