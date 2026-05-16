Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235ADCD4F3C
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 May 2026 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMnbF4YQ2W9HYFDROCp2+P7zzNIyjWeUlXzrpuBcosY=; b=l3OddWqV0p2s1M
	XpEvYpfAOVddPhSu+nlndIBxLv1/8rqIkpgC4p4VzqmJ8Su+b74GgEm36MNseiuCNpDzTh4tzpuDC
	1qH0yR1LN3s7v6iImJCA07xOxXa2M4Wtxg6Pc9ugk+oqsloSAhbPjuAo5hq5GREsVRyGcomgSC5xR
	7F/O2uMMsMPrX6RgccuBWZKpGnmsJxD6hhGZiRRymQOnS3ilVLl7/SY2FttZM3DK5mSmUWwm7Mq74
	wL3RNdlwJ/lHzmqZ9XvPIsRcQWmG/cBbp0xrUJBv48nyw4J3MblVJ3Yyf9VlN52OKL5IZMQb7HOtJ
	LaIj7qs/aLLHejb8TT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKYN-0000000BMCg-2VpD;
	Sat, 16 May 2026 19:20:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKYM-0000000BMCR-2p0v
	for linux-amlogic@lists.infradead.org;
	Sat, 16 May 2026 19:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C94316020A;
	Sat, 16 May 2026 19:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E4EC19425;
	Sat, 16 May 2026 19:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778959201;
	bh=xpnbXdC7DEafCl4a3hRxkRaK1iet2Pxhvq1itahaKVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ev/UmnaheJKlVOlwgkfKxcsIMyRAkvXjWcbSDrqxZKKOtLOzxg1v+xTMAQWv9wJlg
	 tTwPCDyBnOWc65C65/Xid1bZmoJXQqDmK+cjeVDX23ovSQHYyqIkdKkWjCBxPPyQkk
	 OZAZe7o3VxfUdW38cSQQRWMJRRaGIrnm6+LoD4wWulX2IVZ5PlpzyJm/QYfn8boWvs
	 7vXoFTpVVrkBsEgCNL3iWRq8zJN2uVE8l5QuRSlfCmwYDb5wDiMpXrMa7kB692TNQI
	 KpV1Pju1aIWWYH5rLuqiZXa/T4vmYCjq+qR2B2ewYD5O1Qr55mbNEhOpPMn2BdSByb
	 Nml4T94bUK3Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/22] drm: bridge: dw_hdmi: Use generic CEC notifier
 helpers
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260516183838.2024991-14-jonas@kwiboo.se>
References: <20260516183838.2024991-14-jonas@kwiboo.se>
Date: Sat, 16 May 2026 19:20:00 +0000
Message-Id: <20260516192001.27E4EC19425@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFVzZS1BZnRlci1GcmVl
IGFuZCBNZW1vcnkgTGVhayBpbiBDRUMgbm90aWZpZXIgY2xlYW51cCBkdWUgdG8gZHJtbSBhbmQg
bWFudWFsIGxpZmVjeWNsZSBtaXNtYXRjaAotLQoKY29tbWl0IGViNTlmNmZlOTc2YjAzYWE1Zjcx
OWI3OWEyODM1NWIyN2Y0MDNiZmUKQXV0aG9yOiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28u
c2U+ClN1YmplY3Q6IGRybTogYnJpZGdlOiBkd19oZG1pOiBVc2UgZ2VuZXJpYyBDRUMgbm90aWZp
ZXIgaGVscGVycwoKVGhpcyBjb21taXQgcmVwbGFjZXMgb3Blbi1jb2RlZCBDRUMgbm90aWZpZXIg
aGFuZGxpbmcgd2l0aCBnZW5lcmljIENFQwpoZWxwZXJzIHVzaW5nIGRybW1fY29ubmVjdG9yX2hk
bWlfY2VjX25vdGlmaWVyX3JlZ2lzdGVyLiBJdCBhbHNvIHJlbW92ZXMKdGhlIG1hbnVhbCBub3Rp
ZmllciB1bnJlZ2lzdHJhdGlvbiBmcm9tIGR3X2hkbWlfY29ubmVjdG9yX2Rlc3Ryb3kuCgo+IFRo
ZSBkcm1tIHJlbGVhc2UgYWN0aW9uIGZvciB0aGUgZ2VuZXJpYyBDRUMgbm90aWZpZXIgc2hvdWxk
IHJ1biBqdXN0Cj4gYmVmb3JlIGR3X2hkbWlfY29ubmVjdG9yX2Rlc3Ryb3koKSwgY2xvc2VseSBt
YXRjaGluZyB0aGUgbGlmZXRpbWUgb2YKPiB0aGUgcmVwbGFjZWQgQ0VDIG5vdGlmaWVyIGFuZCB0
aGUgY29ubmVjdG9yLgoKSXMgdGhpcyBsaWZlY3ljbGUgYXNzdW1wdGlvbiBhY2N1cmF0ZSBmb3Ig
ZHJpdmVycyB0aGF0IGRvIG5vdCB1c2UgZHJtbQpmb3IgbW9kZSBjb25maWc/Cgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LWhkbWkuYwpbIC4uLiBdCj4gQEAgLTI1NDcsOSArMjU0Myw2IEBAIHN0YXRp
YyB2b2lkIGR3X2hkbWlfY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcikKPiAgewo+ICAJc3RydWN0IGR3X2hkbWkgKmhkbWkgPSBjb250YWluZXJfb2YoY29u
bmVjdG9yLCBzdHJ1Y3QgZHdfaGRtaSwgY29ubmVjdG9yKTsKPiAgCj4gLQljZWNfbm90aWZpZXJf
Y29ubl91bnJlZ2lzdGVyKGhkbWktPmNlY19ub3RpZmllcik7Cj4gLQloZG1pLT5jZWNfbm90aWZp
ZXIgPSBOVUxMOwo+IC0KPiAgCWRybV9jb25uZWN0b3JfY2xlYW51cChjb25uZWN0b3IpOwo+ICAJ
ZHJtX2JyaWRnZV9wdXQoJmhkbWktPmJyaWRnZSk7Cj4gIH0KClNpbmNlIGRybV9jb25uZWN0b3Jf
Y2xlYW51cCgpIHplcm9lcyB0aGUgY29ubmVjdG9yIG1lbW9yeSwgYW5kCmRybV9icmlkZ2VfcHV0
KCkgY2FuIGRyb3AgdGhlIGZpbmFsIHJlZmVyZW5jZSB0byB0aGUgYnJpZGdlICh3aGljaCBmcmVl
cwp0aGUgZHdfaGRtaSBzdHJ1Y3R1cmUgYW5kIGl0cyBlbWJlZGRlZCBjb25uZWN0b3IpLCBjb3Vs
ZCB0aGlzIGxlYWQgdG8gYQp1c2UtYWZ0ZXItZnJlZT8KCklmIGEgdXNlci1zcGFjZSBhcHBsaWNh
dGlvbiBob2xkcyBhbiBvcGVuIGZpbGUgZGVzY3JpcHRvciB0byB0aGUgRFJNIGRldmljZQpkdXJp
bmcgZHJpdmVyIHVuYmluZCwgdGhlIERSTSBkZXZpY2UgcmVtYWlucyBhbGl2ZS4gVGhlIGRlZmVy
cmVkIGRybW0KcmVsZWFzZSBhY3Rpb24gd2lsbCBvbmx5IGV4ZWN1dGUgbGF0ZXIgd2hlbiB0aGUg
ZmlsZSBkZXNjcmlwdG9yIGlzIGNsb3NlZAphbmQgdGhlIERSTSBkZXZpY2UncyByZWZjb3VudCBk
cm9wcyB0byB6ZXJvLgoKV2hlbiB0aGUgZHJtbSBhY3Rpb24gZXZlbnR1YWxseSBydW5zLCBpdCB3
aWxsIGRlcmVmZXJlbmNlIHRoZSBmcmVlZApjb25uZWN0b3IgcG9pbnRlci4KCkFkZGl0aW9uYWxs
eSwgYmVjYXVzZSBkcm1fY29ubmVjdG9yX2NsZWFudXAoKSBleGVjdXRlcwptZW1zZXQoY29ubmVj
dG9yLCAwLCBzaXplb2YoKmNvbm5lY3RvcikpLCB3b24ndCBjb25uZWN0b3ItPmNlYy5kYXRhIGJl
Y29tZQpOVUxMPyBUaGlzIHdvdWxkIGNhdXNlIHRoZSBkZWxheWVkIGRybW0gcmVsZWFzZSBhY3Rp
b24gdG8gc2lsZW50bHkgc2tpcAp1bnJlZ2lzdHJhdGlvbiwgbGVha2luZyB0aGUgY2VjX25vdGlm
aWVyIG9iamVjdC4KClsgLi4uIF0KPiBAQCAtMjYwOSwxNSArMjYwMCw4IEBAIHN0YXRpYyBpbnQg
ZHdfaGRtaV9jb25uZWN0b3JfY3JlYXRlKHN0cnVjdCBkd19oZG1pICpoZG1pKQpbIC4uLiBdCj4g
LQlub3RpZmllciA9IGNlY19ub3RpZmllcl9jb25uX3JlZ2lzdGVyKGhkbWktPmRldiwgTlVMTCwg
JmNvbm5faW5mbyk7Cj4gLQlpZiAoIW5vdGlmaWVyKQo+IC0JCXJldHVybiAtRU5PTUVNOwo+IC0K
PiAtCWhkbWktPmNlY19ub3RpZmllciA9IG5vdGlmaWVyOwo+IC0KPiAtCXJldHVybiAwOwo+ICsJ
cmV0dXJuIGRybW1fY29ubmVjdG9yX2hkbWlfY2VjX25vdGlmaWVyX3JlZ2lzdGVyKGNvbm5lY3Rv
ciwgTlVMTCwKPiArCQkJCQkJCSBoZG1pLT5kZXYpOwo+ICB9CgotLSAKU2FzaGlrbyBBSSByZXZp
ZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTE2MTgzODM4LjIwMjQ5
OTEtMS1qb25hc0Brd2lib28uc2U/cGFydD0xMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
