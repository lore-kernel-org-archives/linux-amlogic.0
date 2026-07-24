Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC262C531F9
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2026 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUA/C9+VjkArkg/ibASSO2kQOEFdSkKlOgLOkDLQ9TI=; b=Pst0ZRqop/uqwt
	zTfMDwBIBsv4i9Iyg9PibVEeUxsdQyvUReT4/stdcqr2uFJhX4einam9IvzUOGDNVmF9fbXzGOMwN
	MjzSw53qB/Fs2OpQhCbVPwqI2TAL4u23Y9H4Qv+6AxVEJ1utGWaD+VxsT4Tr96JC+hA0ozCllvqsE
	LmY+zXYVldhqR3PJZwrjvRIj3pHx0SriO1yjA0nuYJA7sdgUyyIhm03rsW+OZR1GwKV/892WAwyk7
	Uv7OKZhcIytmWn6/xBxeiKX/bq9U9pFxXNIpenWvIx/kPOEuxE1G2vaIAd6cnPJ6dJ56X8tI7VkIC
	NunGZIVtvrs+PI7SkWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA8g-0000000FfmG-39Kh;
	Fri, 24 Jul 2026 07:16:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA8f-0000000Ffm5-0qTr
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Jul 2026 07:16:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE72443048;
	Fri, 24 Jul 2026 07:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACC41F000E9;
	Fri, 24 Jul 2026 07:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877368;
	bh=+4IWhtuFRIrmQydBixVdMD0bFYP1Rq35pmFdpkfn9l4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GrOvOIkWrs9nI5stk6Vb183U+jxbm0w32wnocdR4U2uVD/ZrGlANbKKGBiRtLYCF7
	 YHeOYjZYge1SYPzNN+sXpwUpJRoQ4uqQKPSs11ZQgtJp/sXwYXdUiaZ538+5slZmzA
	 xpjEyQGDZwr5HgQOWQ678V84lFSgJh9gjYjqnMqKIHzpq5SaVd9cLiIODurl21a2UN
	 W2JjKKctmFIPL2mulH3GKpjlGo8TbOsx+MUN2AfKWCiGDnvJ5OE0KjqJ8HFqtdj3Pv
	 oc6ZH9UvYYp/vitrc9aIXaQCsAJykYzv4LJrfZD9yhZ8vkL9O3hsqnw/V9w0H7pfEM
	 yulmEFi69l2RA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] firmware: meson: sm: Add video firmware loading
 SMC call
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
Date: Fri, 24 Jul 2026 07:16:07 +0000
Message-Id: <20260724071608.5ACC41F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIGNvbW1hbmQgaW5k
ZXggYFNNX0xPQURfVklERU9fRldgIGlzIHVzZWQgaW4gdGhlIGNvbW1hbmQgdGFibGUgYnV0IGlz
IG5ldmVyIGRlY2xhcmVkLCByZXN1bHRpbmcgaW4gYSBjb21waWxhdGlvbiBlcnJvci4KLS0KCi0t
LSBQYXRjaCBbMV06IFtQQVRDSCB2NiAxLzZdIGZpcm13YXJlOiBtZXNvbjogc206IEFkZCB2aWRl
byBmaXJtd2FyZSBsb2FkaW5nIFNNQyBjYWxsIC0tLQpjb21taXQgNGUxZGU4YTNlNDdhYTk5MWEy
MGE5MWYyMWVkNjg4MWE1OWRjOWM0OQpBdXRob3I6IFpoZW50YW8gR3VvIDx6aGVudGFvLmd1b0Bh
bWxvZ2ljLmNvbT4KCmZpcm13YXJlOiBtZXNvbjogc206IEFkZCB2aWRlbyBmaXJtd2FyZSBsb2Fk
aW5nIFNNQyBjYWxsCgpUaGlzIGNvbW1pdCBhZGRzIGEgbmV3IFNlY3VyZSBNb25pdG9yIENhbGwg
KFNNQykgSUQgZm9yIGxvYWRpbmcgdmlkZW8KZmlybXdhcmUgb24gQW1sb2dpYyBNZXNvbiBjaGlw
cy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYyBiL2Ry
aXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25fc20uYwo+IGluZGV4IGFiOTc1MWE1OWI1NTIuLjg4
N2NhYTVjNjI1ZGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9z
bS5jCj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5jCj4gQEAgLTQ4LDYg
KzQ4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9zbV9jaGlwIGd4YmJfY2hpcCA9IHsK
PiAgCQlDTUQoU01fVEhFUk1BTF9DQUxJQl9SRUFELAkweDgyMDAwMDQ3KSwKPiAgCQlDTUQoU01f
QTFfUFdSQ19TRVQsCQkweDgyMDAwMDkzKSwKPiAgCQlDTUQoU01fQTFfUFdSQ19HRVQsCQkweDgy
MDAwMDk1KSwKPiArCQlDTUQoU01fTE9BRF9WSURFT19GVywJCTB4YjIwMDAwMGYpLAoKW1NldmVy
aXR5OiBMb3ddCklzIFNNX0xPQURfVklERU9fRlcgZGVjbGFyZWQgYW55d2hlcmU/IEl0IGxvb2tz
IGxpa2UgaXQgd2FzIG1pc3NlZCBpbiB0aGUKY29tbWFuZCBlbnVtIGluIGluY2x1ZGUvbGludXgv
ZmlybXdhcmUvbWVzb24vbWVzb25fc20uaCBhbG9uZ3NpZGUgdGhlIG90aGVyClNNIGNvbW1hbmRz
LCB3aGljaCB3b3VsZCBjYXVzZSBhIGNvbXBpbGF0aW9uIGVycm9yIHdoZW4gYnVpbGRpbmcgdGhl
IGRyaXZlci4KCj4gIAkJeyAvKiBzZW50aW5lbCAqLyB9LAo+ICAJfSwKPiAgfTsKCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjQt
YjQtczQtdmRlYy11cHN0cmVhbS12Ni0wLTYwNzJhN2VlNzQyOEBhbWxvZ2ljLmNvbT9wYXJ0PTEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
