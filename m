Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B00C98302
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Sep 2026 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mokEpK4QsPczerBw3pz1Oh/+Q9+leCN/msbD8LfkfsQ=; b=PEe1UTWyxUfBaH
	YmJ5JdCafFWPhB7RSpIMf5tVMjyl/Vk1wa42CsrhwXOtAUph8feFTKz4QDZK1t3RhSRSn9LA/Y6AL
	hcrBGbK5aYk+Z0z/a9RNbdoxayQcU3tFzdw8PObv+Enbm2GUrnXF5vaqcBy4RYOhSRO2BD4uy2/Ne
	4rQw1goswfUs5j9UNtwLhmaPi+L1SD8pdzchgrHHy1k7AziYL3IsJhizRbjT2FDMxsLzbXfiN90+5
	p0Ri3eG+sWHA7s1lmvialbsKeou6IavERaX5LZVdWQhRDWPentPsm1xtMtxqsmYP9PDqEmSzPgMMh
	EbCfydMLU4wrmnMpOSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93BC-000000061jw-0VFf;
	Tue, 22 Sep 2026 16:17:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93BA-000000061ji-2QWF
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Sep 2026 16:17:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1C966024D;
	Tue, 22 Sep 2026 16:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596B61F000FF;
	Tue, 22 Sep 2026 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790093831;
	bh=7SCACIMkovCAQWYJ3tWhlfrEAq98q3CMl/z7bMnXMb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BrFJTaDO3mR17/hKsGYBsCLmkp6civzOArLa0w0GGIl1BhQ01wig/m0wKG05VMyKc
	 CjN8Tpp5LdKCiEVFGf6oY3feB7A2/czWMRbUOfmgUPXavTgKFlzvbkvpiXYR11I6q0
	 pTBjSiZOaPS1fBx9xd5l+4YK7AuJB/sLF5RzOB/bhh0qxzVOzx/hOsYAdD+5vjG8Yh
	 ix3PhNI9LtfMGiLqQ3B/mTiLvv4VrHiVQikDbNCVpSYQF8Q2iHIpzgAG/qe6z+aLoN
	 rmeplLX5iO8J7K4olnTBCmpXIx/8NgF+GlzrT5FtSkgJkbKnls52g6gzAgM4lEgyiH
	 eAcKb/2q6L1jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] ASoC: meson: add AUDIN driver
To: "Valerio Setti" <vsetti@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260922-audin-v3-4-a760312c076c@baylibre.com>
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
 <20260922-audin-v3-4-a760312c076c@baylibre.com>
Date: Tue, 22 Sep 2026 16:17:10 +0000
Message-Id: <20260922161711.596B61F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gc291bmQ6IHNvYzogbWVz
b246IGRhdGEgcmFjZSBkdWUgdG8gZ2xvYmFsIHN0YXRlIG1vZGlmaWNhdGlvbiBpbiBwcm9iZQot
LQoKY29tbWl0IDE5ZjBiZTQ5MWQxODFhY2NlMWRhMGJkZDg1ZmQzN2I5NTQ5ZmEyNWMKQXV0aG9y
OiBWYWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGlicmUuY29tPgoKQVNvQzogbWVzb246IGFkZCBB
VURJTiBkcml2ZXIKClRoaXMgY29tbWl0IGFkZHMgdGhlIEFVRElOIGRyaXZlciB0byBwcm92aWRl
IGF1ZGlvIGlucHV0IHN1cHBvcnQgZm9yIEFtbG9naWMKR1ggYmFzZWQgcGxhdGZvcm1zLiBJdCBp
bmNvcnBvcmF0ZXMgRklGTyBoYW5kbGluZyBhbmQgYW4gSTJTIGRhdGEgZm9ybWF0dGVyIHRvCnJv
dXRlIGF1ZGlvIHN0cmVhbXMuCgo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvbWVzb24vYXVkaW4u
YyBiL3NvdW5kL3NvYy9tZXNvbi9hdWRpbi5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAwLi4xNTgyNDM1NGFiZWRlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Nv
dW5kL3NvYy9tZXNvbi9hdWRpbi5jClsgLi4uIF0KPiArc3RhdGljIHN0cnVjdCBzbmRfc29jX2Rh
cG1fd2lkZ2V0IGF1ZGluX2RhcG1fd2lkZ2V0c1tdID0gewo+ICsJW0FVRElOX1dJREdFVF9JMlNf
Rk9STUFUVEVSXSA9Cj4gKwkJU05EX1NPQ19EQVBNX1BHQV9FKCJJMlMgRm9ybWF0dGVyIiwgU05E
X1NPQ19OT1BNLCAwLCAwLCBOVUxMLCAwLAo+ICsJCQkJICAgZ3hfZm9ybWF0dGVyX2V2ZW50LAo+
ICsJCQkJICAgKFNORF9TT0NfREFQTV9QUkVfUE1VIHwgU05EX1NPQ19EQVBNX1BSRV9QTUQpKSwK
PiArCVNORF9TT0NfREFQTV9NVVgoIkZJRk8wIFNSQyBTRUwiLCBTTkRfU09DX05PUE0sIDAsIDAs
Cj4gKwkJCSAmYXVkaW5fZmlmbzBfaW5wdXRfc2VsX211eCksClsgLi4uIF0KPiArc3RhdGljIGlu
dCBhdWRpbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7ClsgLi4uIF0K
PiArCXJldCA9IGd4X2Zvcm1hdHRlcl9jcmVhdGUoZGV2LCAmYXVkaW5fZGFwbV93aWRnZXRzW0FV
RElOX1dJREdFVF9JMlNfRk9STUFUVEVSXSwKPiArCQkJCSAgJmF1ZGluX2Zvcm1hdHRlcl9pMnNf
ZHJ2LCByZWdtYXApOwoKW1NldmVyaXR5OiBMb3ddCklzIGl0IHNhZmUgdG8gbXV0YXRlIHRoZSBz
dGF0aWMgYXVkaW5fZGFwbV93aWRnZXRzIGFycmF5IGhlcmUgaW4gYXVkaW5fcHJvYmUoKQp3aXRo
IGEgcGVyLWRldmljZSBhbGxvY2F0ZWQgcG9pbnRlcj8KCkNhbGxpbmcgZ3hfZm9ybWF0dGVyX2Ny
ZWF0ZSgpIG1vZGlmaWVzIHctPnByaXYgd2hlcmUgdyBwb2ludHMgdG8gdGhlIHN0YXRpYwpnbG9i
YWwgYXVkaW5fZGFwbV93aWRnZXRzIGFycmF5LgoKV2hpbGUgQVNvQydzIHNuZF9zb2NfZGFwbV9u
ZXdfY29udHJvbHMoKSB1c2VzIGttZW1kdXAoKSB0byBjbG9uZSB3aWRnZXQKdGVtcGxhdGVzLCBt
b2RpZnlpbmcgc2hhcmVkIHN0YXRpYyBnbG9iYWwgc3RydWN0cyB3aXRob3V0IHN5bmNocm9uaXph
dGlvbgppbnRyb2R1Y2VzIGEgc3RydWN0dXJhbCBkYXRhIHJhY2UgaWYgbXVsdGlwbGUgaW5zdGFu
Y2VzIGFyZSBwcm9iZWQKY29uY3VycmVudGx5LiBUaGlzIGFsc28gYXBwZWFycyB0byB2aW9sYXRl
IGRyaXZlciBkZXNpZ24gcHJpbmNpcGxlcyBhZ2FpbnN0Cm1vZGlmeWluZyBzdGF0aWMgdGVtcGxh
dGVzLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDkyMi1hdWRpbi12My0wLWE3NjAzMTJjMDc2Y0BiYXlsaWJyZS5jb20/cGFydD00
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
