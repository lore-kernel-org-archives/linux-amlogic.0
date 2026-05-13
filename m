Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905B2CD4F24
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 May 2026 10:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nem5vR3dWTMqRTUfX8ilQhEkLeEDmsEwCzzl40WNKQY=; b=MC4xS4XT2mD0r4
	LhT1WAzYiM6L4MZZ+WjJp3xDJ/M9r2sclmmllzzFx2kHKkm5/CgcmZNJoCg5e/vWsrybDiwrN9RiG
	vOqDKTHFniL56EY0Un5QshFdUgoCcru2Pq9qmvW42fSxl/+D4F0EJORgG4AZp5L6TkYEbfB/ctmES
	/qKZFVBKrr40GP79B3c/UrdB/bG01gLYijclPLXXw8o5YsFVWv9Rs9X+cY+R7CI7681YJHgkgDKho
	xmyGz9EBacSLnW9RZ3zNNIsmV8u1pkvqTQFSqnxeersd2JYx5hNH+VRurU28nfulv/8lQgtw7x2Ln
	ZBrAbK89HHeooG18F+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6nB-00000002BBs-1kRh;
	Wed, 13 May 2026 10:26:17 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6n8-00000002BAJ-1PHf;
	Wed, 13 May 2026 10:26:16 +0000
Message-ID: <2615455d-4b4b-43cb-a0eb-ee8ea3cd68fb@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1778667966;
	bh=ddoblNZZsz5wNrt8mpoM1PIZNDv3RgKjfvpiPYWJsIE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=ZDlNcLmEyrJkfsm2aHLedDxwtuIP7EhBNioKD/ISmamJpI9nQKIEDEn8F8AeWr9F/
	 f6dy6/7uwEyQYJKbRolYQfamFmrh62d2PiO1M8/tJWfiY4A9e0f7mTMUX+H0X7gFRj
	 urzcLDclRrXioe82NiKuzrOO4hSSAdTqr4kA2kVo=
Date: Wed, 13 May 2026 12:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven
 status LED
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
 <20260512-add-kvim4-sysled-v1-2-7178719a43e7@aliel.fr>
 <7ad282ae-fffa-4d0a-9cec-65d8f6b40544@linaro.org>
Content-Language: en-US
In-Reply-To: <7ad282ae-fffa-4d0a-9cec-65d8f6b40544@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_032614_809084_EBC0837C 
X-CRM114-Status: GOOD (  12.63  )
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

T24gNS8xMy8yNiAxMDowNSBBTSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gNS8xMi8yNiAx
OTo0NywgUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJlbGF5IHdyb3RlOgo+PiBGcm9tOiBSb25hbGQg
Q2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPj4KPj4gVGhlIFZJTTQgYm9hcmQg
ZXhwb3NlcyBhIHN0YXR1cyBMRUQgd2lyZWQgdG8gdGhlIFBXTV9BT19DX0Qgb3V0cHV0Lgo+PiBF
bmFibGUgdGhlIHB3bV9hb19jZCBjb250cm9sbGVyIHdpdGggaXRzIHBpbm11eCwgYW5kIGRlY2xh
cmUgYQo+PiBwd20tbGVkcyBub2RlIHdpdGggYSBoZWFydGJlYXQgdHJpZ2dlci4KPj4KPj4gQWxz
bywgbW92ZSB0aGUgeHRhbC1jbGsgbm9kZSB0byByZXN0b3JlIGFscGhhYmV0aWNhbCBvcmRlcmlu
Zy4KPiAKPiBQbGVhc2Ugc2VuZCBhIHNlcGFyYXRlIHBhdGNoIGZvciB0aGF0Cj4gCgpUaGFua3Mg
Zm9yIHlvdXIgcmV2aWV3LCBJIHdpbGwgYWRkIGEgbmV3IHBhdGNoLgoKPj4KPj4gU2lnbmVkLW9m
Zi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cj4+IC0tLQo+
PiDCoCAuLi4vZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzwqAg
fCAzMCArKysrKysrKysrKysKPj4gKysrKystLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjMg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtCj4+IHZpbTQuZHRz
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12
aW00LmR0cwo+PiBpbmRleCA2OWQ2MTE4YmE1N2U3Li5jNDE1MjVhMzRiNzIxIDEwMDY0NAo+PiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFz
LXZpbTQuZHRzCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3
LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKPj4gQEAgLTQ1LDEzICs0NSw2IEBAIHNlY21vbl9yZXNl
cnZlZF9ibDMyOiBzZWNtb25ANTMwMDAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PiDC
oMKgwqDCoMKgIH07Cj4+IMKgIC3CoMKgwqAgeHRhbDogeHRhbC1jbGsgewo+PiAtwqDCoMKgwqDC
oMKgwqAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4+IC3CoMKgwqDCoMKgwqDCoCBjbG9j
ay1mcmVxdWVuY3kgPSA8MjQwMDAwMDA+Owo+PiAtwqDCoMKgwqDCoMKgwqAgY2xvY2stb3V0cHV0
LW5hbWVzID0gInh0YWwiOwo+PiAtwqDCoMKgwqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+
PiAtwqDCoMKgIH07Cj4+IC0KPj4gwqDCoMKgwqDCoCBkY19pbjogcmVndWxhdG9yLWRjLWluIHsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHJlZ3VsYXRvci1uYW1lID0gIkRDX0lOIjsKPj4gQEAgLTYwLDYg
KzUzLDE2IEBAIGRjX2luOiByZWd1bGF0b3ItZGMtaW4gewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVndWxhdG9yLWFsd2F5cy1vbjsKPj4gwqDCoMKgwqDCoCB9Owo+PiDCoCArwqDCoMKgIHB3bS1s
ZWRzIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAicHdtLWxlZHMiOwo+PiArCj4+
ICvCoMKgwqDCoMKgwqDCoCBzdGF0dXMgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaW51
eCxkZWZhdWx0LXRyaWdnZXI9ImhlYXJ0YmVhdCI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1heC1icmlnaHRuZXNzID0gPDI1NT47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB3bXMg
PSA8JnB3bV9hb19jZCAwIDMwMDQwIDA+Owo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gK8KgwqDC
oCB9Owo+PiArCj4+IMKgwqDCoMKgwqAgc2RfM3YzOiByZWd1bGF0b3Itc2RjYXJkLTN2MyB7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCByZWd1bGF0b3ItbmFtZSA9ICJTRF8zVjMiOwo+PiBAQCAtMTU1LDYg
KzE1OCwxMyBAQCB3aWZpMzJrOiB3aWZpMzJrIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2Nr
LWZyZXF1ZW5jeSA9IDwzMjc2OD47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB3bXMg
PSA8JnB3bV9hYiAwIDMwNTE4IDA+Owo+PiDCoMKgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoCB4
dGFsOiB4dGFsLWNsayB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImZpeGVkLWNs
b2NrIjsKPj4gK8KgwqDCoMKgwqDCoMKgIGNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAwMD47Cj4+
ICvCoMKgwqDCoMKgwqDCoCBjbG9jay1vdXRwdXQtbmFtZXMgPSAieHRhbCI7Cj4+ICvCoMKgwqDC
oMKgwqDCoCAjY2xvY2stY2VsbHMgPSA8MD47Cj4+ICvCoMKgwqAgfTsKPj4gwqAgfTsKPj4gwqAg
wqAgJnB3bV9hYiB7Cj4+IEBAIC0xNjMsNiArMTczLDEyIEBAICZwd21fYWIgewo+PiDCoMKgwqDC
oMKgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+IMKgIH07Cj4+IMKgICsmcHdtX2FvX2Nk
IHsKPj4gK8KgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+ICvCoMKgwqAgcGluY3RybC0wID0gPCZw
d21fYW9fY19kX3BpbnM+Owo+PiArwqDCoMKgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+
ICt9Owo+PiArCj4+IMKgIC8qIFNESU8gKi8KPj4gwqAgJnNkX2VtbWNfYSB7Cj4+IMKgwqDCoMKg
wqAgc3RhdHVzID0gIm9rYXkiOwo+Pgo+IAoKCi0tIApCZXN0IHJlZ2FyZHMsClJvbmFsZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
