Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5DCC54F54
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2026 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9mOSrWahhu1CxyP5Qe60HWmU443JxZidOYJivAlxXmQ=; b=vkYBS6dMyf5KCx
	pOU0CQ6uGQugM/2exKNL+JMirwxUfyX/OG2RWurOqKcZL6QHObzLisUHiyOxXK1Uw3DCLOyYmGEwK
	azWKN9hpJEyViMMbEkSOIKdD9xmiGF7MIYySlfRhwv2cqpDF8jiHeTZ3XMHuN5nfKQKO7eQ25/J1F
	wA+Ak6eukiwtObEClnLy1uiWWudSNhc8vSFSnDXK0NVP2DE3/E2axFdGEbmmlW6cmvoL8bB8RSvli
	uzyjDQJW5+B425byWGz9iVHN4FEutyiR8r7tUISGZ4ZizYGYEDszRhBKAgeiB2N4IfbTRCSPt7K0B
	1v4SkRxnSmw1MY1RhF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjOy-0000000CAZu-304m;
	Fri, 31 Jul 2026 09:19:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjOx-0000000CAZn-0gc0
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jul 2026 09:19:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C5E54040C;
	Fri, 31 Jul 2026 09:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061EA1F000E9;
	Fri, 31 Jul 2026 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785489574;
	bh=s0LgA4ZggyyRiIGyTRqtWpzT50vbTO1Z5/UaIUJdhXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gmj5KKFdniNE1iPe7RsV9DSU50VD7QG7UiVw+44io9awS1cehGRrGHEtd1VMZFRSF
	 Ks4b1OufMPMtaaUtjGGjlkIvY0th7jk1in+sl0wKv/oq34N8S53+lG8tHVeb3Yfl1f
	 J3Wlh3TDxOYFNLHGTqXZzkCPe6bws0onzOFeQxxW401ROGD9arH07LW8FArQM1v2IN
	 5VC9F0/Mez/ipOeCHQ+pzw01uNAK/0f03dt+itN/PVD4rGiMFWyycZMGvqDRs9CsxN
	 cqxBgItmz7kkBt2TXFyCBqJ7bZohcaEPiAVg/LuF5L8kP+xrxonJ5LTZi9LpM2OVN+
	 jHEHuMmWliSHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] spi: amlogic: spisg: Add support for A9
 controller features
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260731-a9-spisg-v3-4-a15da3f70029@amlogic.com>
References: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
 <20260731-a9-spisg-v3-4-a15da3f70029@amlogic.com>
Date: Fri, 31 Jul 2026 09:19:33 +0000
Message-Id: <20260731091934.061EA1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIElnbm9yZWQgdHJhbnNm
ZXItc3BlY2lmaWMgd29yZF9kZWxheSBjYXVzZXMgaGFyZHdhcmUgZ2FwIHRvIGJlIG1pc2NvbmZp
Z3VyZWQgYnkgcmVhZGluZyBtc2ctPnNwaS0+d29yZF9kZWxheSBpbnN0ZWFkIG9mIHhmZXItPndv
cmRfZGVsYXkuCi0tCgotLS0gUGF0Y2ggWzRdOiBbUEFUQ0ggdjMgNC80XSBzcGk6IGFtbG9naWM6
IHNwaXNnOiBBZGQgc3VwcG9ydCBmb3IgQTkgY29udHJvbGxlciBmZWF0dXJlcyAtLS0KY29tbWl0
IGVjZWUwMGZhNWE2ZGJkOGE1NTNhNmM0ZDllZjliZjIwODlkMWJkZDkKQXV0aG9yOiBYaWFud2Vp
IFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KCnNwaTogYW1sb2dpYzogc3Bpc2c6IEFk
ZCBzdXBwb3J0IGZvciBBOSBjb250cm9sbGVyIGZlYXR1cmVzCgpUaGlzIGNvbW1pdCBleHRlbmRz
IHRoZSBBbWxvZ2ljIEE5IFNQSVNHIGNvbnRyb2xsZXIgd2l0aCBhZGRpdGlvbmFsCmNvbmZpZ3Vy
YXRpb24gb3B0aW9ucy4gSXQgYWRkcyBzdXBwb3J0IGZvciBleHRlbmRlZCBDUyBzZXR1cC9ob2xk
CnRpbWluZywgTU9TSSBpZGxlIG91dHB1dCBjb25maWd1cmF0aW9uLCBhbmQgY29uZmlndXJhYmxl
IHdvcmQgZGVsYXlzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWFtbG9naWMtc3Bp
c2cuYyBiL2RyaXZlcnMvc3BpL3NwaS1hbWxvZ2ljLXNwaXNnLmMKPiBpbmRleCAyZDY2ZjAwZGNj
ZDQ1Li43MjlkYTExYmM1MzllIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1hbWxvZ2lj
LXNwaXNnLmMKPiArKysgYi9kcml2ZXJzL3NwaS9zcGktYW1sb2dpYy1zcGlzZy5jCgpbIC4uLiBd
Cgo+IEBAIC01MjQsMTAgKzU0OCwyMCBAQCBzdGF0aWMgaW50IGFtbF9zcGlzZ190cmFuc2Zlcl9v
bmVfbWVzc2FnZShzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXIgKmN0bHIsCj4gIAkJCWdvdG8gZW5kOwo+
ICAJCX0KPiAgCj4gLQkJLyogY2FsY3VsYXRlIGNzLXNldHVwIGRlbGF5IHdpdGggdGhlIGZpcnN0
IHhmZXIgc3BlZWQgKi8KPiAtCQlpZiAobGlzdF9pc19maXJzdCgmeGZlci0+dHJhbnNmZXJfbGlz
dCwgJm1zZy0+dHJhbnNmZXJzKSkKPiAtCQkJZGVzYy0+Y2ZnX2J1cyB8PSBGSUVMRF9QUkVQKENG
R19DU19TRVRVUCwKPiAtCQkJCXNwaV9kZWxheV90b19zY2xrKHhmZXItPmVmZmVjdGl2ZV9zcGVl
ZF9oeiwgJm1zZy0+c3BpLT5jc19zZXR1cCkpOwo+ICsJCS8qIGNhbGN1bGF0ZSBjcy1zZXR1cCBk
ZWxheSB3aXRoIHRoZSBmaXJzdCB4ZmVyIHNwZWVkICBhbmQgd29yZCBkZWFseSovCj4gKwkJaWYg
KGxpc3RfaXNfZmlyc3QoJnhmZXItPnRyYW5zZmVyX2xpc3QsICZtc2ctPnRyYW5zZmVycykpIHsK
PiArCQkJdmFsID0gc3BpX2RlbGF5X3RvX3NjbGsoeGZlci0+ZWZmZWN0aXZlX3NwZWVkX2h6LCAm
bXNnLT5zcGktPmNzX3NldHVwKTsKPiArCQkJaWYgKGRhdGEgJiYgZGF0YS0+Y3Nfc2V0dXBfZXh0
ZW5kX2N0cmwpIHsKPiArCQkJCXZhbCA9IG1pbl90KHUzMiwgMHhGRiwgdmFsKTsKPiArCQkJCWRl
c2MtPmNmZ19idXMgfD0gRklFTERfUFJFUChDRkdfQ1NfU0VUVVAsIHZhbCAmIDB4Rik7Cj4gKwkJ
CQlGSUVMRF9NT0RJRlkoQ0ZHX0NTX1NFVFVQX0VYVEVORCwgJnNwaXNnLT5jZmdfc3BpLCB2YWwg
Pj4gNCk7Cj4gKwkJCX0gZWxzZSB7Cj4gKwkJCQl2YWwgPSBtaW5fdCh1MzIsIDB4RiwgdmFsKTsK
PiArCQkJCWRlc2MtPmNmZ19idXMgfD0gRklFTERfUFJFUChDRkdfQ1NfU0VUVVAsIHZhbCk7Cj4g
KwkJCX0KPiArCj4gKwkJCWRlbGF5ID0gc3BpX2RlbGF5X3RvX3NjbGsoeGZlci0+ZWZmZWN0aXZl
X3NwZWVkX2h6LCAmbXNnLT5zcGktPndvcmRfZGVsYXkpOwoKW1NldmVyaXR5OiBIaWdoXQpTaG91
bGQgdGhpcyBiZSByZWFkaW5nIHhmZXItPndvcmRfZGVsYXkgaW5zdGVhZCBvZiBtc2ctPnNwaS0+
d29yZF9kZWxheT8KCldoZW4gYW4gU1BJIGNsaWVudCBkcml2ZXIgc3VibWl0cyBhIHRyYW5zZmVy
IHdpdGggYSBzcGVjaWZpYyB3b3JkX2RlbGF5IHNldCwKdGhlIFNQSSBjb3JlIGV2YWx1YXRlcyBh
bmQgcG9wdWxhdGVzIHhmZXItPndvcmRfZGVsYXkuIEJ5IHJlYWRpbmcgdGhlCmRldmljZS1sZXZl
bCBkZWZhdWx0IGRlbGF5IGZyb20gbXNnLT5zcGktPndvcmRfZGVsYXkgaGVyZSBpbgphbWxfc3Bp
c2dfdHJhbnNmZXJfb25lX21lc3NhZ2UoKSwgaXQgYXBwZWFycyBhbnkgdHJhbnNmZXItc3BlY2lm
aWMgZGVsYXkKb3ZlcnJpZGVzIHJlcXVlc3RlZCBieSB0aGUgY2xpZW50IHdpbGwgYmUgaWdub3Jl
ZC4KCj4gKwkJfQo+ICAKPiAgCQkvKiBjYWxjdWxhdGUgY3MtaG9sZCBkZWxheSB3aXRoIHRoZSBs
YXN0IHhmZXIgc3BlZWQgKi8KPiAgCQlpZiAobGlzdF9pc19sYXN0KCZ4ZmVyLT50cmFuc2Zlcl9s
aXN0LCAmbXNnLT50cmFuc2ZlcnMpKSB7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzMxLWE5LXNwaXNnLXYzLTAtYTE1ZGEzZjcw
MDI5QGFtbG9naWMuY29tP3BhcnQ9NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
