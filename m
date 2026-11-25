Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63822606A326
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2026 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ac+qZgb+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QpjZ6tOI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L1SP4UHIYkN44++iO+udiit6ouxuxC1MfVtcubGBSVo=; b=ac+qZgb+6s8yO2xLBatlrJ4aHX
	KD5yD3W6Te0SO3qdcul1zAtubQsXekl+QpScSs/3ZzOQLFoxKGqfLlmZpda7LL1qVQjAdaTIhkGB2
	nnInx3nf8l11ZDeMD2doohppZz4a4wFyfeT8JbC5D918M6uT4KewM+wGV49SpDaqtFHvHXX9gwdtT
	q8q0w162jlvq+t7i3arSumKqEmrQuPrTa25CYvgoX3JMkve4Yhbf180rvXnbheWvmtShZQCiaTrH8
	aGqAAY0ipNHEFH2qBaSQWJKBToEfnnyjveDyrEhqIUcaQktGQeEEL+Gx145y0HFPX3fDPlZCcwEsX
	JWSkaRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEMo-0000000AFXa-09Ov;
	Wed, 25 Nov 2026 14:53:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEMm-0000000AFX1-2Q7T;
	Wed, 25 Nov 2026 14:53:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55F9844E00;
	Wed, 25 Nov 2026 14:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B54D1F000F2;
	Wed, 25 Nov 2026 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618380;
	bh=Noo/1qHPis8a4ZHqIhQBRWowzWTBe2fSXWZTT6D4Yww=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QpjZ6tOIlUhf+kQlKZgHLxYc2XlcmBaIfPkRV1LIW1ys2U5rcZAujgkg2H5gV/4AM
	 UrnSWvJXDyp/05FTYBkD9R9jSI3uzxxh9YOuNivFJe0w7W4t6HFQzQGxwS1sueI2/e
	 4A3X09csZMChHfVemR3ARVz9gcosJmopth4sAp3aDEvljqiwounqI5SC7WIDvOYSwc
	 Qn4XBn15u+NExx01d+6LUqzqVNOFUvXhpDPZAUnPMI3R/RT/mioKPLRiCmBFRif1mW
	 ZP5DYr/p68hTyp5g61kQA0opzo3ZwejEk3aS4qyAk1hxceeC2doZsic7/j0nI3KZJK
	 yZJ7PrxiCOEsg==
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
From: netdev-bot+sashiko@kernel.org
To: tanure@linux.com
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 14:52:58 +0000
Message-ID: <179561837863.3135.7453763060716815613@kernel.org>
In-Reply-To: <20261121213102.143130-5-tanure@linux.com>
References: <20261121213102.143130-5-tanure@linux.com>
X-sashiko-severity: Medium
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUocykgdG8gY29uc2lkZXIuCgpDcml0aWNhbDogMCDCtyBIaWdoOiAw
IMK3IE1lZGl1bTogMSDCtyBMb3c6IDAKCklmIHlvdSBiZWxpZXZlIG5vbmUgb2YgdGhlIGlzc3Vl
cyBhcmUgbGVnaXRpbWF0ZSwgcGxlYXNlIHJlcGx5IHRvIGVhY2gKaXNzdWUgb2YgTWVkaXVtIHNl
dmVyaXR5IG9yIGhpZ2hlciBhbmQgZXhwbGFpbiB3aHkgdGhlIEFJIGlzIHdyb25nLgpJZiBhbnkg
b2YgdGhlbSBhcmUgbGVnaXRpbWF0ZSBhbmQgeW91IHBsYW4gdG8gcmVzcGluLCBwbGVhc2UgbGV0
IHBhdGNod29yawprbm93IGJ5IGluY2x1ZGluZyAicHctYm90OiBjciIgYXMgYSBzZXBhcmF0ZSBs
aW5lIGF0IHRoZSBlbmQgb2YgeW91ciByZXBseQoob25lIHN1Y2ggcmVwbHkgcGVyIHNlcmllcyBp
cyBlbm91Z2gpLgoKLSBbTWVkaXVtXSBUaGUgY29tbWl0IHNheXMgaXQgZW5hYmxlcyB0aGUgS2hh
ZGFzIFZJTTQgZXRoZXJuZXQgcG9ydC4KCi0tCgphcm02NDogZHRzOiBhbWxvZ2ljOiB0Nzoga2hh
ZGFzLXZpbTQ6IGVuYWJsZSB0aGUgZXRoZXJuZXQgcG9ydAoKVGhpcyBwYXRjaCBlbmFibGVzIHRo
ZSBUNyBldGhlcm5ldCBNQUMgYW5kIHRoZSBNRElPIG11bHRpcGxleGVyIG9uIHRoZQpLaGFkYXMg
VklNNC4gSXQgYWxzbyBkZXNjcmliZXMgdGhlIFJUTDgyMTFGIFJHTUlJIFBIWSBhdCBhZGRyZXNz
IDEgb24gdGhlCmV4dGVybmFsIE1ESU8gYnVzLCB3aXRoIGl0cyBpbnRlcnJ1cHQgb24gR1BJT0hf
Ni4gV2l0aCBwaHktbW9kZSA9CiJyZ21paS1pZCIsIHRoZSBQSFkgYWRkcyBib3RoIFJHTUlJIGRl
bGF5cy4KCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2lj
LXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCj4gaW5kZXggMGZhODMzNjJiNDE3OS4u
N2I4NmFiMjU3OWFhYSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12aW00LmR0cwoKWyAuLi4gXQoK
PiBAQCAtMjU2LDYgKzI1NywyOCBAQCB4dGFsOiB4dGFsLWNsayB7Cj4gIAl9Owo+ICB9Owo+ICAK
PiArJmV0aG1hYyB7Cj4gKwlzdGF0dXMgPSAib2theSI7Cj4gKwlwaW5jdHJsLTAgPSA8JmV0aF9w
aW5zPiwgPCZldGhfcmdtaWlfcGlucz47Cj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+
ICsJcGh5LW1vZGUgPSAicmdtaWktaWQiOwo+ICsJcGh5LWhhbmRsZSA9IDwmZXh0ZXJuYWxfcGh5
PjsKPiArfTsKPiArCj4gKyZldGhfcGh5IHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArfTsKCltT
ZXZlcml0eTogTWVkaXVtXQpDYW4gYW55IGRyaXZlciBhdCB0aGlzIHJldmlzaW9uIGJpbmQgdG8g
dGhlIGV0aG1hYyBub2RlIHRoaXMgZW5hYmxlcz8KClRoZSBub2RlIGluIGFtbG9naWMtdDcuZHRz
aSBoYXM6CgphcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpOgoJCWV0
aG1hYzogZXRoZXJuZXRAZmRjMDAwMDAgewoJCQljb21wYXRpYmxlID0gImFtbG9naWMsdDctZHdt
YWMiLCAic25wcyxkd21hYy01LjEwYSI7CgpUaGUgYW1sb2dpYyx0Ny1kd21hYyBzdHJpbmcgYXBw
ZWFycyBvbmx5IGluIGFtbG9naWMtdDcuZHRzaS4gVGhlIEFtbG9naWMKZ2x1ZSBkcml2ZXIncyBt
YXRjaCB0YWJsZSwgbWVzb244Yl9kd21hY19tYXRjaFtdIGluIGR3bWFjLW1lc29uOGIuYywgZW5k
cwphdCBnMTJhOgoKCXsKCQkuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWcxMmEtZHdtYWMi
LAoJCS5kYXRhID0gJm1lc29uX2cxMmFfZHdtYWNfZGF0YSwKCX0sCgl7IH0KCmR3bWFjX2dlbmVy
aWNfbWF0Y2hbXSBpbiBkd21hYy1nZW5lcmljLmMgZW5kcyBhdCBzbnBzLGR3bWFjLTQuMTBhLCBw
bHVzCnNucHMsZHdtYWMgYW5kIHRoZSBzbnBzLGR3eGdtYWMgZW50cmllcy4gVW5kZXIgZHJpdmVy
cy8sIHRoZSBvbmx5IHBsYWNlCnRoYXQgbmFtZXMgc25wcyxkd21hYy01LjEwYSBpcyBzdG1tYWNf
Z21hYzRfY29tcGF0c1tdIGluCnN0bW1hY19wbGF0Zm9ybS5jLiBUaGF0IGxpc3QgZGV0ZWN0cyB0
aGUgY29yZSB2ZXJzaW9uLiBJdCBpcyBub3QgYW4Kb2ZfbWF0Y2hfdGFibGUuCgpJZiBub3RoaW5n
IHByb2JlcyBldGhtYWMsIGl0cyBtZGlvMCBjaGlsZCBidXMgaXMgbmV2ZXIgcmVnaXN0ZXJlZC4g
VGhlCmV0aF9waHkgbXV4IGVuYWJsZWQganVzdCBhYm92ZSBiaW5kcyB0aHJvdWdoIHRoZSBhbWxv
Z2ljLGcxMmEtbWRpby1tdXgKZmFsbGJhY2sgYW5kIGhhcyBtZGlvLXBhcmVudC1idXMgPSA8Jm1k
aW8wPi4gU28gbWRpb19tdXhfaW5pdCgpIHdvdWxkCmRlZmVyIG9uIGV2ZXJ5IGF0dGVtcHQ6Cgpk
cml2ZXJzL25ldC9tZGlvL21kaW8tbXV4LmM6bWRpb19tdXhfaW5pdCgpIHsKICAgIC4uLgoJCXBh
cmVudF9idXMgPSBvZl9tZGlvX2ZpbmRfYnVzKHBhcmVudF9idXNfbm9kZSk7CgkJaWYgKCFwYXJl
bnRfYnVzKSB7CgkJCXJldF92YWwgPSAtRVBST0JFX0RFRkVSOwoJCQlnb3RvIGVycl9wYXJlbnRf
YnVzOwoJCX0KICAgIC4uLgp9CgpXb3VsZG4ndCB0aGF0IGxlYXZlIGV4dF9tZGlvIGFuZCBleHRl
cm5hbF9waHkgdW5yZWdpc3RlcmVkLCBzbyB0aGF0CnBoeS1oYW5kbGUgbmV2ZXIgcmVzb2x2ZXM/
CgpBbHNvLCBub3RoaW5nIHdvdWxkIHByb2dyYW0gdGhlIFBSR19FVEggZ2x1ZSB3aW5kb3csIHdo
aWNoIGlzIHRoZSBzZWNvbmQKcmVnIHJlZ2lvbiBhdCAweGZlMDI0MDAwLiBUaGF0IHdpbmRvdyBo
b2xkcyB0aGUgUkdNSUkgbW9kZSBzZWxlY3QsIHRoZQpjbGtpbjAvY2xraW4xIFRYIGNsb2NrIG11
eCBhbmQgdGhlIE1BQy1zaWRlIGRlbGF5cy4KCk5vdGhpbmcgd291bGQgY2xhaW0gdGhlIHBpcGVs
aW5lIGNsb2NrIChDTEtJRF9TWVNfQU1QSVBFX0VUSCkgZWl0aGVyLiBUaGUKcHJldmlvdXMgcGF0
Y2ggaW4gdGhlIHNlcmllcywgImFybTY0OiBkdHM6IGFtbG9naWM6IHQ3OiBhZGQgdGhlIGV0aGVy
bmV0CmNvbnRyb2xsZXIiLCBzYXlzIHRoaXMgZ2F0ZSBpcyBvdGhlcndpc2UgdHVybmVkIG9mZiBh
cyB1bnVzZWQuIEl0IGFsc28Kc2F5cyB0aGUgcG9ydCBrZWVwcyB0aGUgYm9vdGxvYWRlcidzIGRl
bGF5cyB1bmxlc3MgdGhlIGNvbnRyb2xsZXIKcHJvZ3JhbXMgdGhlbS4KCmFtbG9naWMsbWVzb24t
ZHdtYWMueWFtbCBkb2VzIG5vdCBkb2N1bWVudCBhbWxvZ2ljLHQ3LWR3bWFjLCBzbwpkdGJzX2No
ZWNrIHdvdWxkIHJlcG9ydCB0aGUgbm93LWVuYWJsZWQgbm9kZSBhcyB1bmRvY3VtZW50ZWQuCgpE
b2VzIHRoaXMgcGF0Y2ggZGVwZW5kIG9uIGEgc2VwYXJhdGUgZ2x1ZSBkcml2ZXIgYW5kIGJpbmRp
bmcgc2VyaWVzPyBJZgpzbywgY291bGQgdGhlIGNvbW1pdCBtZXNzYWdlIG5hbWUgdGhhdCBwcmVy
ZXF1aXNpdGUsIG9yIGNvdWxkIHRoaXMgcGF0Y2gKYmUgc2VudCB0b2dldGhlciB3aXRoIGl0PwoK
WyAuLi4gXQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vbmV0ZGV2LWFpLmJvdHMu
bGludXguZGV2L3Nhc2hpa28vIy9wYXRjaHNldC8yMDI2MTEyMTIxMzEwMi4xNDMxMzAtMS10YW51
cmUlNDBsaW51eC5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
