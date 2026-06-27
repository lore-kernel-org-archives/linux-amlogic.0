Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DC2C43458
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2026 13:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8mKGFYwH9C1MIFiwF9OH2PFNUOJJO4M/eBAxhncxIk=; b=QRWKXuC0SvlVW2
	j6FiXYjesiVIhoVt306EqMWREFmJMhjYPO+nNskD2REft1LgU/X05dNLbjWV5n+epwAUxvLdEojax
	vkxfPOWo/ELl0lLNR4jI0/E6KM1OifvkhqHDEaEQOTB2GHkfhxl/kdPJgXkcqmQ7qInKBrbPj73Tc
	ypz7YCwj02LkA4ya5/7qUM5D766TiKcPSOjDD+bML62KYXtArSRqqFPbJ0KC6yU/tLyJcFsmBs24a
	O6RgOHqK8n2qbj6IU9NiG5mz7AU4a6Hh+KL2oVmPeRpjy9nMuIScHu6izY4RWtC25bErghr73XCXV
	8SUx1AVmIm/ecg7B+/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdT1C-0000000CVQb-1iSd;
	Sat, 27 Jun 2026 13:24:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdT1B-0000000CVQU-2XDg
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Jun 2026 13:24:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6E596001A;
	Sat, 27 Jun 2026 13:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B377F1F000E9;
	Sat, 27 Jun 2026 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782566660;
	bh=08laLLSXvDo7Eg+gU0CVATPj+IzYSvOxm405BPV010A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GIe26PhGkccN/wFRHjngu6ZqX24GNB0TtYl3gnWNnJsP1rjQLsQqOJs5wECwmr05c
	 ZvVCZZU6zab0tlzrsNNJrq9t/HgnzgJFs4m7R0z+68iTVLDESCPL3//GzfLN8+bYOo
	 qbbxsUViPYOuCBuIYSIqXqrVFfMUPKZi1UL+sDnypJHBsqOcqAJAI8nqD7DSgc/EqU
	 cfrVm852d7GNS5CN4rR8GDbjTE8/qjL6ZvHGzqY+iEFcu/JdHLN8Q60ZISi+06qRwZ
	 g5De2tXdZQ1EU4TDkrD0WnngjZZ2Yeh/XWC7I6E6TihRyAX9L41/jcNgKghY20bSDU
	 0Z4wcJ3geLkCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
To: "Christian Hewitt" <christianshewitt@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260627131205.808800-1-christianshewitt@gmail.com>
References: <20260627131205.808800-1-christianshewitt@gmail.com>
Date: Sat, 27 Jun 2026 13:24:19 +0000
Message-Id: <20260627132419.B377F1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIENhbGxpbmcgYHNuZF9z
b2NfY29tcG9uZW50X3dyaXRlKClgIGluIHRoZSBBTFNBIFBDTSBgdHJpZ2dlcmAgY2FsbGJhY2sg
YXR0ZW1wdHMgdG8gYWNxdWlyZSBhIHNsZWVwaW5nIG11dGV4IGluIGFuIGF0b21pYyBjb250ZXh0
LgotLQoKY29tbWl0IDEzNzZjYmY5NDMyN2U5NTFjY2QyNzBlZjViMTAyOWQ1ZGIzYzVkMGYKQXV0
aG9yOiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KCkFTb0M6
IG1lc29uOiBhaXU6IGZpZm8tc3BkaWY6IHNvZnQgcmVzZXQgdGhlIFMvUERJRiBkYXRhcGF0aCBv
biBzdGFydC9zdG9wCgpUaGlzIGNvbW1pdCBzb2Z0LXJlc2V0cyB0aGUgc3BkaWYgZGF0YXBhdGgg
b24gc3RhcnQgYW5kIHN0b3AgdG8gZml4ICJtYWNoaW5lIApndW4gbm9pc2UiIGJ1ZmZlciB1bmRl
cnJ1bnMuIEl0IG1pcnJvcnMgdGhlIGRvd25zdHJlYW0gdmVuZG9yIGRyaXZlcidzIApiZWhhdmlv
ciBieSB0b2dnbGluZyB0aGUgcmVzZXQgYml0cy4KCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9t
ZXNvbi9haXUtZmlmby1zcGRpZi5jIGIvc291bmQvc29jL21lc29uL2FpdS1maWZvLXNwZGlmLmMK
PiBpbmRleCBlMGUwMGVjMDI2ZGNjLi5hOTg2MWM1ZDY2Mzc0IDEwMDY0NAo+IC0tLSBhL3NvdW5k
L3NvYy9tZXNvbi9haXUtZmlmby1zcGRpZi5jCj4gKysrIGIvc291bmQvc29jL21lc29uL2FpdS1m
aWZvLXNwZGlmLmMKClsgLi4uIF0KCj4gQEAgLTY4LDExICs2OSwxNSBAQCBzdGF0aWMgaW50IGZp
Zm9fc3BkaWZfdHJpZ2dlcihzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwgaW50
IGNtZCwKPiAgCWNhc2UgU05EUlZfUENNX1RSSUdHRVJfU1RBUlQ6Cj4gIAljYXNlIFNORFJWX1BD
TV9UUklHR0VSX1JFU1VNRToKPiAgCWNhc2UgU05EUlZfUENNX1RSSUdHRVJfUEFVU0VfUkVMRUFT
RToKPiArCQlzbmRfc29jX2NvbXBvbmVudF93cml0ZShjb21wb25lbnQsIEFJVV9SU1RfU09GVCwK
PiArCQkJCQlBSVVfUlNUX1NPRlRfOTU4X0ZBU1QpOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRo
aXMgY29kZSBhdHRlbXB0IHRvIHNsZWVwIGluIGFuIGF0b21pYyBjb250ZXh0PwoKVGhlIGF1ZGlv
IGNvcmUgZXhlY3V0ZXMgdGhlIHRyaWdnZXIgY2FsbGJhY2sgYXRvbWljYWxseSB3aXRoCnNuZF9w
Y21fc3RyZWFtX2xvY2tfaXJxKCkgKHVubGVzcyB0aGUgbm9uLWF0b21pYyBmbGFnIGlzIHNldCBi
eSB0aGUgbWFjaGluZQpkcml2ZXIsIHdoaWNoIGlzIG5vdCB0aGUgY2FzZSBmb3IgZ3gtY2FyZC5j
KS4KCkhvd2V2ZXIsIHNuZF9zb2NfY29tcG9uZW50X3dyaXRlKCkgdW5jb25kaXRpb25hbGx5IGF0
dGVtcHRzIHRvIGFjcXVpcmUgYQpzbGVlcGluZyBtdXRleDoKCnNvdW5kL3NvYy9zb2MtY29tcG9u
ZW50LmM6c25kX3NvY19jb21wb25lbnRfd3JpdGUoKSB7CiAgICAuLi4KICAgIG11dGV4X2xvY2so
JmNvbXBvbmVudC0+aW9fbXV0ZXgpOwogICAgLi4uCn0KCldpbGwgdGhpcyBsZWFkIHRvIGEgc2No
ZWR1bGluZyB3aGlsZSBhdG9taWMgc3BsYXQgd2hlbiBzdGFydGluZyB0aGUgc3RyZWFtPwoKPiAg
CQlmaWZvX3NwZGlmX2RjdV9lbmFibGUoY29tcG9uZW50LCB0cnVlKTsKPiAgCQlicmVhazsKPiAg
CWNhc2UgU05EUlZfUENNX1RSSUdHRVJfU1VTUEVORDoKPiAgCWNhc2UgU05EUlZfUENNX1RSSUdH
RVJfUEFVU0VfUFVTSDoKPiAgCWNhc2UgU05EUlZfUENNX1RSSUdHRVJfU1RPUDoKPiArCQlzbmRf
c29jX2NvbXBvbmVudF93cml0ZShjb21wb25lbnQsIEFJVV9SU1RfU09GVCwKPiArCQkJCQlBSVVf
UlNUX1NPRlRfOTU4X0ZBU1QpOwoKW1NldmVyaXR5OiBIaWdoXQpDYW4gdGhpcyB3cml0ZSBhbHNv
IHRyaWdnZXIgYSBzbGVlcGluZyBpbiBhdG9taWMgY29udGV4dCByZWdyZXNzaW9uIHdoZW4Kc3Rv
cHBpbmcgdGhlIGRldmljZT8KCj4gIAkJZmlmb19zcGRpZl9kY3VfZW5hYmxlKGNvbXBvbmVudCwg
ZmFsc2UpOwo+ICAJCWJyZWFrOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYyNzEzMTIwNS44MDg4MDAtMS1jaHJpc3RpYW5zaGV3
aXR0QGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
