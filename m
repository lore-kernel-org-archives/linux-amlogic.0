Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450F2EF48E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Feb 2026 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/oH2nFZVM6ccNN7vP3Pf2cU6cppO871ZAGysmrg0ud8=; b=YdYCmdQDa3OGrW
	J5e2i0pj+k5/smZXSw5oa7W5vW1JDKwvLIY6YMUOdyLOMof+kyT9qu2iaSJK9wkgXDMb1P7dm+2+c
	/p+WzxLIwbOYMQlyX2xJI1B/9IRSYeZziI0t/N3SYY6xtFrEQRUTsbqfRyy2I4Y9bsjZgGgBJI5yf
	nQkVTTEfRCEvNYHz/m/blGlMOYDZe8faq8oZgTkHqpjRiZsFLOD5qZpY2RtEdSTAP4hxbMXdHPt0j
	oSSf+SHzk12Duthj4d7M59VsshhpcPykPOZhTgAsMpMEJfPFBaLXyfq8OCGICCyUs51idR91IrNVQ
	m4lkty3dwO+o+lpbly/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoML-000000039es-1UpP;
	Fri, 13 Feb 2026 08:17:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoMK-000000039ei-2elp;
	Fri, 13 Feb 2026 08:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 049546001A;
	Fri, 13 Feb 2026 08:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB68C116C6;
	Fri, 13 Feb 2026 08:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770970623;
	bh=hbYAQt6TNDZ/qXSwhJHkgExQTtHCoS7ggq1824ovTnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sz+4oPuwy6Y0e3rrzOZBPH52OtlvC18v6Q17Tg/0qckunMalGdoOMAKPS5BvhWe0t
	 E4XmiXd7zeq3gP8n6EJbjnWlMIh/kcAmlTPfX1oViwtfCtJkPYHif3MKg87/BnLhmn
	 H0lo1MtX65GWK640lVwPj32jkNsBZb1TkxlNoFuOgpIT5swr6mWpIZBgSc6aNR+YOU
	 zNJ1WZJ5nLj/JBh7IzaM6ILk7wvcEfk+q3CvzLjGl8zbLmMndKlw3RAOBoTtlhCWsI
	 flAX+O9Cxh9tBV18rzv2V8XYRTUvbPKPlBZU8lnpl1TiiZVMQaIh6L/nNjh/GuA3x0
	 kti5SGsXOxbmg==
Message-ID: <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
Date: Fri, 13 Feb 2026 09:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Zhentao Guo <zhentao.guo@amlogic.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
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

T24gMTMvMDIvMjAyNiAwOTowMiwgWmhlbnRhbyBHdW8gd3JvdGU6Cj4gSGkgS3J6eXN6dG9mLAo+
IAo+IAo+IOWcqCAyMDI2LzIvMTMgMTU6MzUsIEtyenlzenRvZiBLb3psb3dza2kg5YaZ6YGTOgo+
PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4KPj4gT24gMTMvMDIvMjAyNiAwNjoxMiwgWmhlbnRhbyBH
dW8gdmlhIEI0IFJlbGF5IHdyb3RlOgo+Pj4gRnJvbTogWmhlbnRhbyBHdW88emhlbnRhby5ndW9A
YW1sb2dpYy5jb20+Cj4+Pgo+Pj4gRGVzY3JpYmUgdGhlIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhl
IFY0TDIgc3RhdGVsZXNzIHZpZGVvIGRlY29kZXIKPj4+IGRyaXZlciB1c2VkIHdpdGggdGhlIEFt
bG9naWMgUzQgKFM4MDVYMikgcGxhdGZvcm0uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWmhlbnRh
byBHdW88emhlbnRhby5ndW9AYW1sb2dpYy5jb20+Cj4+PiAtLS0KPj4+ICAgLi4uL2JpbmRpbmdz
L21lZGlhL2FtbG9naWMsczQtdmNvZGVjLWRlYy55YW1sICAgICAgfCA5NiArKysrKysrKysrKysr
KysrKysrKysrCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxv
Z2ljLHM0LXZjb2RlYy1kZWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9hbWxvZ2ljLHM0LXZjb2RlYy1kZWMueWFtbAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uODg3ODA1MTRkMDZjCj4+PiAtLS0gL2Rldi9udWxs
Cj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dp
YyxzNC12Y29kZWMtZGVjLnlhbWwKPj4+IEBAIC0wLDAgKzEsOTYgQEAKPj4+ICsjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4+ICsjIENv
cHlyaWdodCAoQykgMjAyNSBBbWxvZ2ljLCBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQKPj4+ICsl
WUFNTCAxLjIKPj4+ICstLS0KPj4+ICskaWQ6aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
bWVkaWEvYW1sb2dpYyxzNC12Y29kZWMtZGVjLnlhbWwjCj4+PiArJHNjaGVtYTpodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4+ICsKPj4+ICt0aXRsZTogQW1s
b2dpYyBWaWRlbyBEZWNvZGUgQWNjZWxlcmF0b3IKPj4+ICsKPj4+ICttYWludGFpbmVyczoKPj4+
ICsgIC0gWmhlbnRhbyBHdW88emhlbnRhby5ndW9AYW1sb2dpYy5jb20+Cj4+PiArCj4+PiArZGVz
Y3JpcHRpb246Cj4+PiArICBUaGUgVmlkZW8gRGVjb2RlciBBY2NlbGVyYXRvciBwcmVzZW50IG9u
IEFtbG9naWMgU09Dcy4KPj4+ICsgIEl0IHN1cHBvcnRzIHN0YXRlbGVzcyBoMjY0IGRlY29kaW5n
Lgo+Pj4gKwo+Pj4gK3Byb3BlcnRpZXM6Cj4+PiArICBjb21wYXRpYmxlOgo+Pj4gKyAgICBjb25z
dDogYW1sb2dpYyxzNC12Y29kZWMtZGVjCj4+IFdoeSBkbyB5b3UgcmVwZWF0ICJkZWMiIHR3aWNl
PyBjb2RlYyBtZWFucyBkZWNvZGVyLCBzbyB3aGF0IGlzIHRoZSBsYXN0Cj4+ICJkZWMiIGFib3V0
Pwo+IEluIGZhY3QsIGNvZGVjIG1lYW5zIGVuY29kZXIrZGVjb2RlciwgYW5kIGRlYyBpcyBzaG9y
dCBmb3IgZGVjb2Rlci4KClllcywgdGhhdCdzIHdoYXQgSSBtZWFudCwgc28gd2h5IGRvIHlvdSBy
ZXBlYXQgZGVjb2Rlcj8KCj4+PiArCj4+PiArICByZWc6Cj4+PiArICAgIG1heEl0ZW1zOiAyCj4+
PiArCj4+PiArICByZWctbmFtZXM6Cj4+PiArICAgIGl0ZW1zOgo+Pj4gKyAgICAgIC0gY29uc3Q6
IGRvcwo+Pj4gKyAgICAgIC0gY29uc3Q6IGRtYwo+Pj4gKwo+Pj4gKyAgaW50ZXJydXB0czoKPj4+
ICsgICAgbWF4SXRlbXM6IDMKPj4+ICsKPj4+ICsgIGNsb2NrczoKPj4+ICsgICAgbWF4SXRlbXM6
IDMKPj4+ICsKPj4+ICsgIGNsb2NrLW5hbWVzOgo+Pj4gKyAgICBpdGVtczoKPj4+ICsgICAgICAt
IGNvbnN0OiB2ZGVjCj4+PiArICAgICAgLSBjb25zdDogY2xrX3ZkZWNfbXV4Cj4+PiArICAgICAg
LSBjb25zdDogY2xrX2hldmNmX211eAo+PiBOYW1lIHRoZW0gYmFzZWQgb24gdGhlaXIgcm9sZS9u
YW1lIGluIHRoaXMgZGV2aWNlLiBXaHkgdGhpcyBkZXZpY2Ugd291bGQKPj4gY2FyZSB0aGF0IGl0
IHJlY2VpdmVzIGEgbXV4PyBOb3QgYSBkaXY/IG9yIG5vdCBhIGdhdGU/Cj4gT2ssIHByZXZpb3Vz
bHkgd2Ugb3Zlcmxvb2tlZCB0aGlzLiBXZSB3aWxsIGltcHJvdmUgaXQgaW4gdGhlIG5leHQgdmVy
c2lvbi4KPj4+ICsKPj4+ICsgIHBvd2VyLWRvbWFpbnM6Cj4+PiArICAgIG1heEl0ZW1zOiAyCj4+
PiArCj4+PiArICBwb3dlci1kb21haW4tbmFtZXM6Cj4+PiArICAgIGl0ZW1zOgo+Pj4gKyAgICAg
IC0gY29uc3Q6IHZkZWMKPj4+ICsgICAgICAtIGNvbnN0OiBoZXZjCj4+PiArCj4+PiArICByZXNl
dHM6Cj4+PiArICAgIG1heEl0ZW1zOiAxCj4+PiArCj4+PiArICBhbWxvZ2ljLGNhbnZhczoKPj4+
ICsgICAgZGVzY3JpcHRpb246IHNob3VsZCBwb2ludCB0byBhIGNhbnZhcyBwcm92aWRlciBub2Rl
Cj4+IFdoeT8gV2hhdCBmb3I/Cj4+Cj4+IFdoYXQgaXMgY2FudmFzIHByb3ZpZGVyPwo+IAo+IFRo
ZSBjYW52YXMgcHJvdmlkZXIgaXM6IGRyaXZlcnMvc29jL2FtbG9naWMvbWVzb24tY2FudmFzLmMK
CldoYXQgaXMgdGhpcyAiY2FudmFzIiBkZXZpY2UuCgo+IAo+IEluIHNob3J0LCBjYW52YXMgaXMg
YSBoYXJkd2FyZSBJUCBpbnNpZGUgdGhlIEFtbG9naWMgU29DLiBUaGUgZGVjb2RlciBJUCAKPiBu
ZWVkcyB0byBhY2Nlc3MgRERSIHRocm91Z2ggY2FudmFzIElQLCBzbyB3ZSBuZWVkIHRvIHJlZmVy
ZW5jZSB0aGUgCgpXaHkgZGVjb2RlciBjYW5ub3QgYWNjZXNzIEREUiBkaXJlY3RseT8KCgpCZXN0
IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
