Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38923C98311
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKBEfOpYr28DXSJOcciHWqaPbYSRazWNPp6YyJqtF0g=; b=PhnZoRj//JkbEf
	j4K/YDT6oUNLGhuleLOgYpci981d01bmQhJrVPPAKHcLdP5OMWwEddbd/xhmFzKheRUyim7aVuSHC
	rX9d6kPazrSC/DXwyaXau6kGfo8q/O5MGJAQUT1hs5WcqcDOATZ56Q1xtWjKWRzRYcEBGgKZz0+pq
	Axp3eEzMRVj2Th6R/WHBv2GD4KD9MeIQAtUqpw8FIP5ZokIDqooVM2NCakXOGNxv5OdZlX3vh/seh
	yrcTty1SShsB9vhSt/DyAHcBKo+Xf6EnSdeQdqSA/r/8DqsLziIE+4ABgWAplyrk/YAqu9Ff1FeJh
	3RKyc3ovVtXi0jPvIeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9f6O-0000000AU8Y-40TT;
	Thu, 24 Sep 2026 08:46:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9f6N-0000000AU8G-0WGR
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 08:46:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A55B141A89;
	Thu, 24 Sep 2026 08:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489AD1F00893;
	Thu, 24 Sep 2026 08:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790239606;
	bh=XbzuODEB0Bu2IbaiLku6BLr76ZQyHP8jRO4GifzsK40=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpuA5SflKCUlSxvABYw5yEPOYaEWt4cN6o9EfrDABiRz77Y8b+wy4/AqgM22hxdXj
	 3jgbJuTGyTqYNS4d32qkcl5g25bLTFzJad/QGMbNXU6O4D2JMWcKIxQQB/wLvu2fPg
	 hAT5MDNdsxc2qRFOWtpmRmDOTsBYQ8jdikrjLCFY9xy20lvxar7wF7SeaCORCU1IMw
	 fL2yv4YU2E6zs7bDmPY6DXdyr7+Q6eJBoznSmH9Z8aq1dFUbwe04oUSdaDaZzOdmp0
	 zCmVi+ReW8itoRt8EC5YI8XDzAcmE2Y1xAl1jK6VJw+ogLGE7NH25otZcOIPG/gWAC
	 IzWOfVP2EtzTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: add Amlogic A9 I2C controller
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260924-a9-i2c-v1-1-b8ad9b46f4a8@amlogic.com>
References: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
 <20260924-a9-i2c-v1-1-b8ad9b46f4a8@amlogic.com>
Date: Thu, 24 Sep 2026 08:46:45 +0000
Message-Id: <20260924084646.489AD1F00893@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IGky
YzogYW1sb2dpYzogbWlzc3BlbGxlZCBtYWludGFpbmVyIGVtYWlsIGFkZHJlc3NlcwotIFtMb3dd
IGR0LWJpbmRpbmdzOiBpMmM6IGFtbG9naWM6IGludmFsaWQgR0lDIGludGVycnVwdCB0eXBlIGlu
IGV4YW1wbGUKLS0KCmNvbW1pdCAxY2U3ZDcwZjE1N2I1Y2MzZTEwYzdlNzVjNjQyODdjMmRiZTJj
MWJiCkF1dGhvcjogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpkdC1i
aW5kaW5nczogaTJjOiBhZGQgQW1sb2dpYyBBOSBJMkMgY29udHJvbGxlcgogICAgCkFkZCBhIERl
dmljZSBUcmVlIGJpbmRpbmcgZm9yIHRoZSBJMkMgY29udHJvbGxlciBmb3VuZCBvbiB0aGUKQW1s
b2dpYyBBOSBTb0MuCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTJjL2FtbG9naWMsYTktaTJjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaTJjL2FtbG9naWMsYTktaTJjLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAwMDAuLjY4MTI0MWE1MjY4MDYKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hbWxvZ2ljLGE5LWkyYy55
YW1sCj4gQEAgLTAsMCArMSw2MSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pMmMvYW1sb2dpYyxhOS1pMmMueWFtbCMKPiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0
aXRsZTogQW1sb2dpYyBBOSBJMkMgQ29udHJvbGxlcgo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAg
LSBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb2xAYW1sb2dpYy5jb20+Cj4gKyAgLSBKdW55aSBa
aGFvIDxqdW55aS56aGFvbEBhbWxvZ2ljLmNvbT4KCltTZXZlcml0eTogTG93XQpUaGlzIGlzbid0
IGEgZnVuY3Rpb25hbCBidWcsIGJ1dCBhcmUgdGhlc2UgZW1haWwgYWRkcmVzc2VzIG1pc3NwZWxs
ZWQ/CgpUaGUgdHJhaWxpbmcgJ2wnIGluICd6aGFvbCcgY2F1c2VzIGVtYWlscyB0byBib3VuY2Ug
d2hlbiBjb250cmlidXRvcnMKdXNlIGdldF9tYWludGFpbmVyLnBsIHRvIENDIHRoZSBtYWludGFp
bmVycyBvbiBwYXRjaGVzIG1vZGlmeWluZyB0aGlzCmJpbmRpbmcuCgpbIC4uLiBdCgo+ICtleGFt
cGxlczoKPiArICAtIHwKPiArICAgIGkyY0AzYTQ0MDAgewo+ICsgICAgICAgIGNvbXBhdGlibGUg
PSAiYW1sb2dpYyxhOS1pMmMiOwo+ICsgICAgICAgIHJlZyA9IDwweDNhNDQwMCAweDNjPjsKPiAr
ICAgICAgICBpbnRlcnJ1cHRzID0gPDEgMTY0IDE+OwoKW1NldmVyaXR5OiBMb3ddCklzIHRoaXMg
R0lDIGludGVycnVwdCBzcGVjaWZpZXIgaW4gdGhlIGV4YW1wbGVzIGJsb2NrIGNvcnJlY3Q/CgpU
aGUgZmlyc3QgY2VsbCB2YWx1ZSBvZiAxIGRlc2lnbmF0ZXMgYSBHSUNfUFBJIChQZXItUHJvY2Vz
c29yIEludGVycnVwdCksCndoaWNoIGlzIGxpbWl0ZWQgdG8gdGhlIHJhbmdlIDAtMTUuIEEgdmFs
dWUgb2YgMTY0IGlzIGhpZ2hseSBpbnZhbGlkIGZvciBhClBQSS4KClNpbmNlIEkyQyBjb250cm9s
bGVycyBhcmUgdHlwaWNhbGx5IHNoYXJlZCBwZXJpcGhlcmFscywgc2hvdWxkIHRoaXMgYmUgMAoo
R0lDX1NQSSkgaW5zdGVhZD8KCkRldmVsb3BlcnMgY29weS1wYXN0aW5nIHRoZSBleGFtcGxlIHdp
bGwgY3JlYXRlIGludmFsaWQgZGV2aWNlIHRyZWVzIHRoYXQKZmFpbCBhdCBydW50aW1lIG9yIGR1
cmluZyBkdGMgdmFsaWRhdGlvbi4KCj4gKyAgICAgICAgY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMg
MTE+Owo+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsgICAgICAgICNzaXplLWNl
bGxzID0gPDA+Owo+ICsKPiArICAgICAgICBlZXByb21ANTIgewo+ICsgICAgICAgICAgICBjb21w
YXRpYmxlID0gImF0bWVsLDI0YzMyIjsKPiArICAgICAgICAgICAgcmVnID0gPDB4NTI+Owo+ICsg
ICAgICAgIH07Cj4gKyAgICB9OwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkyNC1hOS1pMmMtdjEtMC1iOGFkOWI0NmY0YThAYW1s
b2dpYy5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
