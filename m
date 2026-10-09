Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F324CA6018
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSXzLsZxnXkdvUHo2C1ioER7tWW0XgWtqYrzhlvOuiw=; b=wBp9vxVpW9YWQv
	CAAcqu5yEq8bjdXlSU4wWuGkCzhmvP4idBCQmGAS1BhHITHiPa+izvnt00fKO/K/smWbHJCJp6E7q
	9R9YyEGbifu2dVpF1oGkdfKlfOhfFOI/SrApianEqx2dfio3Krafv0BGwrWGbkteQt7138W84K6D9
	nX/y/K3pB4AV4QcG9v+qeqnGc71Xve5W55a5DYUWntxfYHSH6T0NOaQwUtN0+yOW8BgRUsmoPj7CA
	3QMwd9TGywweYkUIMyTk8EPAUzcbcWpwVR3R7U58Jt5dpVQ6sXuKw4intKldpkqvIWRegYucA16JZ
	mQzLagAkpLVFdgYkYQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1Jl-00000005NQk-2wph;
	Fri, 09 Oct 2026 03:30:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1Jk-00000005NQe-21TS
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:30:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F387660DB0;
	Fri,  9 Oct 2026 03:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB861F000FF;
	Fri,  9 Oct 2026 03:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791516642;
	bh=0Ks10+5VhMrL3rOeNGhm0fjzzaz3VzxUOuLGuCdVyxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KCSRsUkn2nAZY9yBB9WUq0+ucF0Rqxk2PyNdAKrqJTH4+jij4SPncSk2vhrt9c7GH
	 kvKfup4x52FhtXgDEkMf858JNN1w132BbVvA0PE9MLJQa5JgwZuBid//LdOxFLoCHr
	 +Xk6jtpVIJTV/rpkYlWeuuCYCyiFq+gnLzgbICwL9QfWgy6sU3uH5hhYWSXO5Qj0UW
	 NIGyq0QXgmq4XyEU8dLe42VT5redws8D5OgIntyrfp8PRlb6lDvZAh58/jRMmjh8Ez
	 A+SkrVanlKP7kv+5VerF9/TAv96rTODDJHZq45HE5OAPC5IGaMLJVp17ukqOCPkr8a
	 6rSD5rH0v6uvQ==
Message-ID: <sashiko-outbox-164766@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/20] drm/msm/dp: Serialize stream operations with
 HPD processing
To: "Xilin Wu" <sophon@radxa.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261009-msm-dp-hdr10-v2-7-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-7-1835d4966da3@radxa.com>
Date: Fri, 09 Oct 2026 03:30:41 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGRybTogc2xlZXBhYmxl
IG11dGV4IGxvY2sgaW4gYXRvbWljIGNvbnRleHQgKHBsdWdnZWRfbG9jaykKLS0KCmNvbW1pdCBj
YjAzNDdkZjk0ZjJjMTFlNThlY2IzZDk4ZmFhNzU1ZmQ0YjUyNmVmCkF1dGhvcjogWGlsaW4gV3Ug
PHNvcGhvbkByYWR4YS5jb20+Cgpkcm0vbXNtL2RwOiBTZXJpYWxpemUgc3RyZWFtIG9wZXJhdGlv
bnMgd2l0aCBIUEQgcHJvY2Vzc2luZwoKSFBEIFBIWSB0ZXN0IHJlcXVlc3RzIHN0b3AgYW5kIHJl
c3RhcnQgdGhlIG1haW5saW5rIHVuZGVyIHBsdWdnZWRfbG9jaywKYnV0IGF0b21pYyBzdHJlYW0g
ZW5hYmxlIGFuZCBkaXNhYmxlIGRvIG5vdCB0YWtlIHRoYXQgbG9jay4gQm90aCBwYXRocwpjYW4g
Y2hlY2sgYSByZXNvdXJjZSBmbGFnIGJlZm9yZSBlaXRoZXIgdXBkYXRlcyBpdCBhbmQgYWNxdWly
ZSBkdXBsaWNhdGUKY2xvY2sgb3IgUEhZIHJlZmVyZW5jZXMuIFRoZXkgY2FuIGFsc28gcmVzZXQg
YSBsaW5rIHdoaWxlIHRoZSBvdGhlciBwYXRoCmlzIHRyYWluaW5nIGl0IG9yIGVuYWJsaW5nIHZp
ZGVvLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwo+IGluZGV4IDMyYTJhYzg5ZDhl
ZDAuLjc4N2VmYmNiNmMxMjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kcC9k
cF9kaXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwoK
WyAuLi4gXQoKPiBAQCAtMTQ0OSw3ICsxNDY4LDEzIEBAIHZvaWQgbXNtX2RwX2Rpc3BsYXlfYXRv
bWljX2VuYWJsZShzdHJ1Y3QgbXNtX2RwICptc21fZHBfZGlzcGxheSwKPiAgCj4gIAlkcCA9IGNv
bnRhaW5lcl9vZihtc21fZHBfZGlzcGxheSwgc3RydWN0IG1zbV9kcF9kaXNwbGF5X3ByaXZhdGUs
IG1zbV9kcF9kaXNwbGF5KTsKPiAgCj4gLQlyYyA9IG1zbV9kcF9kaXNwbGF5X3ByZXBhcmVfbGlu
ayhkcCk7Cj4gKwlyYyA9IG1zbV9kcF9kaXNwbGF5X3ByZXBhcmUoZHApOwo+ICsJaWYgKHJjKQo+
ICsJCXJldHVybjsKPiArCj4gKwlndWFyZChtdXRleCkoJmRwLT5wbHVnZ2VkX2xvY2spOwoKW1Nl
dmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgaW50cm9kdWNlIGEgc2xlZXBpbmcgbG9jayBpbnRvIGFu
IGF0b21pYyBjb250ZXh0PwoKVGhlIERSTSBzdWJzeXN0ZW0gZ3VpZGVsaW5lcyBzdGF0ZSB0aGF0
IGVuY29kZXIgYXRvbWljIGVuYWJsZS9kaXNhYmxlCmNhbGxiYWNrcyBydW4gaW4gYXRvbWljIGNv
bnRleHQgZHVyaW5nIG5vbi1ibG9ja2luZyBjb21taXRzLiBDYWxsaW5nIHNsZWVwaW5nCmZ1bmN0
aW9ucywgbGlrZSBhY3F1aXJpbmcgYSBtdXRleCwgZnJvbSBhbiBhdG9taWMgY29udGV4dCBjYW4g
Y2F1c2Uga2VybmVsCndhcm5pbmdzLCBzeXN0ZW0gaW5zdGFiaWxpdHksIGFuZCBwb3RlbnRpYWwg
ZGVhZGxvY2tzLgoKPiArCj4gKwlyYyA9IG1zbV9kcF9kaXNwbGF5X3ByZXBhcmVfbGlua19sb2Nr
ZWQoZHApOwo+ICAJaWYgKHJjKSB7Cj4gIAkJRFJNX0VSUk9SKCJEUCBkaXNwbGF5IHByZXBhcmUg
ZmFpbGVkLCByYz0lZFxuIiwgcmMpOwo+ICAJCXJldHVybjsKClsgLi4uIF0KCj4gQEAgLTE0NzQs
NiArMTQ5OSw4IEBAIHZvaWQgbXNtX2RwX2Rpc3BsYXlfYXRvbWljX2Rpc2FibGUoc3RydWN0IG1z
bV9kcCAqZHApCj4gIAo+ICAJbXNtX2RwX2Rpc3BsYXkgPSBjb250YWluZXJfb2YoZHAsIHN0cnVj
dCBtc21fZHBfZGlzcGxheV9wcml2YXRlLCBtc21fZHBfZGlzcGxheSk7Cj4gIAo+ICsJZ3VhcmQo
bXV0ZXgpKCZtc21fZHBfZGlzcGxheS0+cGx1Z2dlZF9sb2NrKTsKCltTZXZlcml0eTogSGlnaF0K
RG9lcyB0aGlzIGFsc28gaW50cm9kdWNlIGEgc2xlZXBpbmcgbG9jayBpbnRvIGFuIGF0b21pYyBk
aXNhYmxlIGNhbGxiYWNrPwoKPiArCj4gIAkvKgo+ICAJICogSWYgLmF0b21pY19lbmFibGUoKSBi
YWlsZWQgb3V0IC0gbGluayB0cmFpbmluZyBmYWlsdXJlIGlzIHRoZSBjb21tb24KPiAgCSAqIGNh
c2UgLSB0aGUgbWFpbmxpbmsgd2FzIG5ldmVyIGJyb3VnaHQgdXAgYW5kIC0+cG93ZXJfb24gc3Rh
eWVkIGZhbHNlLgoKWyAuLi4gXQoKPiBAQCAtMTUxMSw3ICsxNTM4LDggQEAgdm9pZCBtc21fZHBf
ZGlzcGxheV9hdG9taWNfcG9zdF9kaXNhYmxlKHN0cnVjdCBtc21fZHAgKmRwKQo+ICAKPiAgCW1z
bV9kcF9kaXNwbGF5X2F1ZGlvX25vdGlmeV9kaXNhYmxlKG1zbV9kcF9kaXNwbGF5KTsKPiAgCj4g
LQltc21fZHBfZGlzcGxheV9kaXNhYmxlKG1zbV9kcF9kaXNwbGF5LCBtc21fZHBfZGlzcGxheS0+
cGFuZWwpOwo+ICsJc2NvcGVkX2d1YXJkKG11dGV4LCAmbXNtX2RwX2Rpc3BsYXktPnBsdWdnZWRf
bG9jaykKPiArCQltc21fZHBfZGlzcGxheV9kaXNhYmxlKG1zbV9kcF9kaXNwbGF5LCBtc21fZHBf
ZGlzcGxheS0+cGFuZWwpOwoKW1NldmVyaXR5OiBIaWdoXQpDb3VsZCB0aGlzIHNjb3BlZF9ndWFy
ZCgpIGNhdXNlIGEgc2xlZXAgaW4gYXRvbWljIGNvbnRleHQgZHVyaW5nIHRoZQpwb3N0LWRpc2Fi
bGUgcGhhc2Ugb2YgYW4gYXRvbWljIGNvbW1pdD8KCj4gIAo+ICAJbXNtX2RwX2Rpc3BsYXlfdW5w
cmVwYXJlKG1zbV9kcF9kaXNwbGF5KTsKPiAgfQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0
dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAwOS1tc20tZHAtaGRyMTAtdjItMC0x
ODM1ZDQ5NjZkYTNAcmFkeGEuY29tP3BhcnQ9NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
