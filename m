Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF114FD531B
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Feb 2026 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dv1KbT2ZZZnmyNqvgIhnRpX4emQ/+zSgKTwerLP+418=; b=YsSHv4Yo3I0asL
	HCi1Vx6iFRh83qF5qKqFa5z1c28e6+b07/bAG+7X7mrsmhqGag1Oo8AbuakC0Vj+sU1XQpAo6ZT0A
	ExrXOPaTpNzZ5teiicZUXHtSfI1+DMfuzikb0G/VFvfiFF290xEZACEtuSRjKAHFmNu0goTchpfIs
	ze+Z+Q/qN/IliON3htsUoyAQmfcv6UJATr1Wbfx5z8wNac8ZQWyAz9dNSWR/FdONXuEvNfeCJKeri
	vwg8pR/G6yKd82+fpXV+fSt+znTYi6dsTyTBmGaG9OwOl7LROFqQrEptGhWTX2j1CfI8z3jL713nT
	9lRxsD2b1XaUtSh6cg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtzg-000000084CL-3UPt;
	Fri, 27 Feb 2026 09:18:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtze-000000084By-3312
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Feb 2026 09:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE59B41B0D;
	Fri, 27 Feb 2026 09:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A56C116C6;
	Fri, 27 Feb 2026 09:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772183921;
	bh=tiOquXN+Z2n7DVUsWeoujnFyOYIp0Oz9W9Dq52IUj30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N00Hr+qT1p3/4l0FSOCPGBOhwYAqyLTzuSj7hvaFsKLwgUgPf8H2LkdERoSCvNWqU
	 lGau7hW3v+4PA9jTmb8/sdnLNc7aOa/OPeBiSWvq6UswBw1yh0o0rR6j45FRaX4hrW
	 6I439fWLHyHHfbYRdZ0yvjdW7K6vyk2rS0DLKMYr2AXxq63IgCL4BEbNti4SsrjCjB
	 mA4E02f8KpVD1j6bUVOqRRrKra5C04f/WDf3CUDb4dNgIO8TSKztmxDGaHeAvAlCrP
	 8O5wUUVWIzHpVgZOEKzqCAw7oMP2h/plwjypo35eiIlhIu3CO+aiFE1l3C5/v7GDf2
	 1Mg6RMWr77HWQ==
Date: Fri, 27 Feb 2026 10:18:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
Message-ID: <20260227-crafty-just-cheetah-7ef8a2@quoll>
References: <20260227-amlogic-dma-v4-0-f25e4614e9b7@amlogic.com>
 <20260227-amlogic-dma-v4-1-f25e4614e9b7@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260227-amlogic-dma-v4-1-f25e4614e9b7@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_011842_807714_E6ACE299 
X-CRM114-Status: GOOD (  16.28  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgMDc6MjA6NTNBTSArMDAwMCwgWGlhbndlaSBaaGFvIHdy
b3RlOgo+IEFkZCBkb2N1bWVudGF0aW9uIGRlc2NyaWJpbmcgdGhlIEFtbG9naWMgQTkgU29DIERN
QS4gQW5kIGFkZAo+IHRoZSBwcm9wZXJ0aWVzIHNwZWNpZmljIHZhbHVlcyBkZWZpbmVzIGludG8g
YSBuZXcgaW5jbHVkZSBmaWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlh
bndlaS56aGFvQGFtbG9naWMuY29tPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9k
bWEvYW1sb2dpYyxhOS1kbWEueWFtbCAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysKPiAg
aW5jbHVkZS9kdC1iaW5kaW5ncy9kbWEvYW1sb2dpYy1kbWEuaCAgICAgICAgICAgICAgfCAgOCAr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEu
eWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5lZmQ3YjI2
MDJjMzMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sCj4gQEAgLTAsMCArMSw2NSBAQAo+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCj4gKyVZ
QU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kbWEv
YW1sb2dpYyxhOS1kbWEueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogQW1sb2dpYyBnZW5lcmFsIERNQSBj
b250cm9sbGVyCj4gKwo+ICtkZXNjcmlwdGlvbjoKPiArICBUaGlzIGlzIGEgZ2VuZXJhbC1wdXJw
b3NlIHBlcmlwaGVyYWwgRE1BIGNvbnRyb2xsZXIuIEl0IGN1cnJlbnRseSBzdXBwb3J0cwo+ICsg
IG1ham9yIHBlcmlwaGVyYWxzIGluY2x1ZGluZyBJMkMsIEkzQywgUElPLCBhbmQgQ0FOLUJVUy4g
VHJhbnNtaXQgYW5kIHJlY2VpdmUKPiArICBmb3IgdGhlIHNhbWUgcGVyaXBoZXJhbCB1c2UgdHdv
IHNlcGFyYXRlIGNoYW5uZWxzLCBjb250cm9sbGVkIGJ5IGRpZmZlcmVudAo+ICsgIHJlZ2lzdGVy
IHNldHMuIEkyQyBhbmQgSTNDIHRyYW5zZmVyIGRhdGEgaW4gMS1ieXRlIHVuaXRzLCB3aGlsZSBQ
SU8gYW5kCj4gKyAgQ0FOLUJVUyB0cmFuc2ZlciBkYXRhIGluIDQtYnl0ZSB1bml0cy4gRnJvbSB0
aGUgY29udHJvbGxlcuKAmXMgcGVyc3BlY3RpdmUsCj4gKyAgdGhlcmUgaXMgbm8gc2lnbmlmaWNh
bnQgZGlmZmVyZW5jZS4KPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gWGlhbndlaSBaaGFvIDx4
aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGli
bGU6Cj4gKyAgICBjb25zdDogYW1sb2dpYyxhOS1kbWEKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4
SXRlbXM6IDEKPiArCj4gKyAgaW50ZXJydXB0czoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsg
IGNsb2NrczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGNsb2NrLW5hbWVzOgo+ICsgICAg
Y29uc3Q6IHN5cwo+ICsKPiArICAnI2RtYS1jZWxscyc6Cj4gKyAgICBjb25zdDogMgo+ICsKPiAr
ICBkbWEtY2hhbm5lbHM6Cj4gKyAgICBtYXhpbXVtOiA2NAo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAg
LSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAtIGludGVycnVwdHMKPiArICAtIGNsb2Nrcwo+
ICsgIC0gJyNkbWEtY2VsbHMnCj4gKyAgLSBkbWEtY2hhbm5lbHMKPiArCj4gK2FsbE9mOgo+ICsg
IC0gJHJlZjogZG1hLWNvbnRyb2xsZXIueWFtbCMKPiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPiArICAgIGRtYS1jb250cm9s
bGVyQGZlNDAwMDAwewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxhOS1kbWEiOwo+
ICsgICAgICAgIHJlZyA9IDwweGZlNDAwMDAwIDB4NDAwMD47Cj4gKyAgICAgICAgaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDM1IElSUV9UWVBFX0VER0VfUklTSU5HPjsKPiArICAgICAgICBjbG9ja3Mg
PSA8JmNsa2MgNDU+Owo+ICsgICAgICAgICNkbWEtY2VsbHMgPSA8Mj47Cj4gKyAgICAgICAgZG1h
LWNoYW5uZWxzID0gPDI4PjsKPiArICAgIH07Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmlu
ZGluZ3MvZG1hL2FtbG9naWMtZG1hLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2lj
LWRtYS5oCgpGaWxlbmFtZSBtdXN0IGJlIHRoZSBzYW1lIGFzIGJpbmRpbmcgZmlsZS4KCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjAyNWVjYzQyZTM5NQo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLWRtYS5o
Cj4gQEAgLTAsMCArMSw4IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MCBPUiBNSVQpICovCj4gKwo+ICsjaWZuZGVmIF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNfRE1B
X0hfXwo+ICsjZGVmaW5lIF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNfRE1BX0hfXwo+ICsKPiAr
I2RlZmluZSBBTUxfRE1BX1RZUEVfVFgJCTAKPiArI2RlZmluZSBBTUxfRE1BX1RZUEVfUlgJCTEK
CllvdSBzdXJlIHlvdSBuZWVkIEFNTCBwcmVmaXg/IFlvdXIgY2xvY2sgY29uc3RhbnRzIGRvIG5v
dCBoYXZlIEFNTApwcmVmaXhlcy4gV2hhdCBvdGhlciBjb25zdGFudHMgZG8geW91IGV4cGVjdCBo
ZXJlPwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
