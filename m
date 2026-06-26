Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7ACCD4F26
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2026 05:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+kmQR7GwwZldrGZVsmsG2zek5boTDIqXydlskx4UEI=; b=0KKCOzjd1oU5q1
	2hF+i1IO/O7g6WYxuLiVAEPuWxdqqnUyTMuwsQOGsghHl97DR9Pyeu893CJtapXF8eSkmoMeDujJJ
	fECLHojt8TTEY91VyM41EUHzDXue8/KsU9FkZ470GeI+CDxtaTGzXkZyR3DQE8yIZJ7trciygpDwG
	8pYdx8T9fLL9W9eUxL7lS9uy+a/IClfwnMpvTMiTUH4FmEyze9UgyTJamvF2/jSrnwzxQBKfVvC+L
	nE4sCR8pGQS3uhCUuLkljS+w9a3DCPBsuTuynOIXiFhGjFIAzkQWYmBOuWZwv7SNxbMihFhxXergC
	wyWPIlK1aidQa2Pxq7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczSW-0000000AXy5-2M3t;
	Fri, 26 Jun 2026 05:50:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczSV-0000000AXxa-1O43
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jun 2026 05:50:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0093060141;
	Fri, 26 Jun 2026 05:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061BD1F000E9;
	Fri, 26 Jun 2026 05:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782453033;
	bh=fpqguDEqtAYjCGwIjtf7qbbFYvPiXQsaNg2WmGUEkWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lfjnuEidXn2ukIdD7bnTLw2mDS+HxiUP5ADnYTRfDFK1ENv7TV+pRu7A6aYO7bAng
	 elT3Sh1yQxIXWNj5mXbJUm0MDdc2txsoVfJ9+0D1pZ4JKFMBUH+EdTGyWC6Zy53PJJ
	 ioAJBBDnyDC2PvjeeLt3HLPlRQwDATv2xY4mq4k9Z85Dfb7e9d85/OwsGfIoQ05VR8
	 O7IJkuiJYcuE+ZkerdGuly7FNJuowMeR8q7yTTgWdG+R3Q43H+z4IMCg34RGviEYw9
	 DRKED1/T6Pzlh3KXMw9hYLz7a5mn3FP3dVAvCnzedsQYtVj0B0zZsypVLGDrc7gzm5
	 3g2d/ywstPjOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
To: "Xianwei Zhao via B4 Relay" <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: Frank.Li@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, vkoul@kernel.org, linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260626-amlogic-dma-v9-1-558d672c4a95@amlogic.com>
References: <20260626-amlogic-dma-v9-0-558d672c4a95@amlogic.com>
 <20260626-amlogic-dma-v9-1-558d672c4a95@amlogic.com>
Date: Fri, 26 Jun 2026 05:50:32 +0000
Message-Id: <20260626055033.061BD1F000E9@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gR2xvYmFsIGR0LWJpbmRp
bmcgaGVhZGVyIGRlZmluZXMgZ2VuZXJpYyAnRE1BX1RYJyBhbmQgJ0RNQV9SWCcgbWFjcm9zLCBy
aXNraW5nIG5hbWVzcGFjZSBjb2xsaXNpb25zLgotIFtMb3ddIFRoZSBgI2RtYS1jZWxsc2AgcHJv
cGVydHkgbGFja3MgYSBkZXNjcmlwdGlvbiBleHBsYWluaW5nIHRoZSBsYXlvdXQgYW5kIHB1cnBv
c2Ugb2YgaXRzIDIgY2VsbHMuCi0gW0xvd10gTWlzc2luZyBzcGFjZSBiZWZvcmUgdGhlIG9wZW5p
bmcgYnJhY2UgaW4gdGhlIGRldmljZSB0cmVlIGV4YW1wbGUgbm9kZS4KLS0KCmNvbW1pdCBhN2I0
ZjVlNGU2MjA3ZTcxMzRmMGIzOTlhYmM4NTNkYjkyOTA4MzgxCkF1dGhvcjogWGlhbndlaSBaaGFv
IDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpkdC1iaW5kaW5nczogZG1hOiBBZGQgQW1sb2dp
YyBBOSBTb0MgRE1BCgpUaGlzIGNvbW1pdCBhZGRzIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1l
bnRhdGlvbiBmb3IgdGhlIEFtbG9naWMgQTkgU29DCmdlbmVyYWwtcHVycG9zZSBETUEgY29udHJv
bGxlci4gSXQgYWxzbyBpbnRyb2R1Y2VzIGEgbmV3IGhlYWRlciBmaWxlIGNvbnRhaW5pbmcKc3Bl
Y2lmaWMgcHJvcGVydHkgdmFsdWVzIGZvciB0aGlzIGNvbnRyb2xsZXIuCgo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1h
LnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmVmZDdi
MjYwMmMzMzYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sCgpbIC4uLiBdCgo+IEBAIC0wLDAgKzEs
NjUgQEAKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IGFtbG9n
aWMsYTktZG1hCgpbIC4uLiBdCgo+ICsgIGNsb2NrLW5hbWVzOgo+ICsgICAgY29uc3Q6IHN5cwo+
ICsKPiArICAnI2RtYS1jZWxscyc6Cj4gKyAgICBjb25zdDogMgoKW1NldmVyaXR5OiBMb3ddCklz
IGEgZGVzY3JpcHRpb24gbmVlZGVkIGZvciB0aGlzIGAjZG1hLWNlbGxzYCBwcm9wZXJ0eSB0byBl
eHBsYWluIHRoZSBsYXlvdXQKYW5kIHB1cnBvc2Ugb2YgaXRzIDIgY2VsbHM/IFdpdGhvdXQgaXQs
IGRldmljZSB0cmVlIHdyaXRlcnMgd29uJ3QgaGF2ZQpkb2N1bWVudGF0aW9uIGNsYXJpZnlpbmcg
d2hpY2ggY2VsbCByZXByZXNlbnRzIHRoZSBjaGFubmVsIElEIGFuZCB3aGljaApyZXByZXNlbnRz
IHRoZSBkaXJlY3Rpb24uCgo+ICsKPiArICBkbWEtY2hhbm5lbHM6Cj4gKyAgICBtYXhpbXVtOiA2
NAoKWyAuLi4gXQoKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+ICsgICAgZG1hLWNvbnRyb2xs
ZXJAZmU0MDAwMDB7CgpbU2V2ZXJpdHk6IExvd10KVGhpcyBpc24ndCBhIGJ1ZywgYnV0IHNob3Vs
ZCB0aGVyZSBiZSBhIHNwYWNlIGJlZm9yZSB0aGUgb3BlbmluZyBicmFjZSBoZXJlPwpOb3JtYWxs
eSBpdCBpcyBmb3JtYXR0ZWQgYXMgYGRtYS1jb250cm9sbGVyQGZlNDAwMDAwIHtgLgoKPiArICAg
ICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYTktZG1hIjsKPiArICAgICAgICByZWcgPSA8MHhm
ZTQwMDAwMCAweDQwMDA+Owo+ICsgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNSBJUlFf
VFlQRV9FREdFX1JJU0lORz47Cj4gKyAgICAgICAgY2xvY2tzID0gPCZjbGtjIDQ1PjsKPiArICAg
ICAgICAjZG1hLWNlbGxzID0gPDI+Owo+ICsgICAgICAgIGRtYS1jaGFubmVscyA9IDwyOD47Cj4g
KyAgICB9Owo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5
LWRtYS5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEuaAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uYzU5YzJmZDRiOTU2MQo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRt
YS5oCj4gQEAgLTAsMCArMSw4IEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBNSVQpICovCj4gKwo+ICsjaWZuZGVmIF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNf
RE1BX0hfXwo+ICsjZGVmaW5lIF9fRFRfQklORElOR1NfRE1BX0FNTE9HSUNfRE1BX0hfXwo+ICsK
PiArI2RlZmluZSBETUFfVFgJCQkwCj4gKyNkZWZpbmUgRE1BX1JYCQkJMQoKW1NldmVyaXR5OiBM
b3ddCkNvdWxkIHRoZXNlIG1hY3JvIG5hbWVzIGxlYWQgdG8gbmFtZXNwYWNlIGNvbGxpc2lvbnMg
c2luY2UgdGhleSBsYWNrIGEgdmVuZG9yCm9yIFNvQyBwcmVmaXg/IFRoZXNlIG5hbWVzIGFyZSBh
bHJlYWR5IHdpZGVseSB1c2VkIGFjcm9zcyB0aGUga2VybmVsLCBhbmQKZGVmaW5pbmcgdGhlbSBn
ZW5lcmljYWxseSBpbiBhIGdsb2JhbCBkdC1iaW5kaW5ncyBoZWFkZXIgbWlnaHQgY2F1c2UKcHJl
cHJvY2Vzc29yIGNvbGxpc2lvbnMgYW5kIGJ1aWxkIGZhaWx1cmVzIGZvciBhbnkgZHJpdmVyIG9y
IERUUyBmaWxlIHRoYXQKaW5jbHVkZXMgdGhpcyBoZWFkZXIuCgo+ICsjZW5kaWYgLyogX19EVF9C
SU5ESU5HU19ETUFfQU1MT0dJQ19ETUFfSF9fICovCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNjI2LWFtbG9naWMtZG1hLXY5LTAt
NTU4ZDY3MmM0YTk1QGFtbG9naWMuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
