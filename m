Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD72606A319
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2026 07:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ud9QuC+j;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6cSqI/4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWpO/LXQB0+c37rKoY24GmW86mBdortDys9I0ArfHC4=; b=ud9QuC+jZfLEPG
	U6ao+NIP6uRC4s5XsiXFWA1UH+KsilSHlVvvZRih2ajvNfaULPby5b8UD1FzJlRi3zBDbo8dLIrIX
	ddL98xosJQaCOJ7j3Fr5Kx2UeMjsk4IDzA8qNtlQf1q3RsWzdsjJO7LwMatk83e/XPj2WXMFr6til
	DQbAEIdwp42Uu+sOJSKtJLjTGogGeW1lx8b3Nq41K/L/kfOAujWeWmHTNu3aCpbPGGAyst49SFzFJ
	Jc/wlCASgwJ9f72sdf8HFrUiXcutegGyKVn18kMN66zTXBCDzmge97JR9bYSB/CZK/R9VnPrVLE6K
	AZsMT+bVlqiazUIbVKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQkb-0000000BFwI-2LRl;
	Wed, 21 Oct 2026 07:28:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQka-0000000BFw4-2Y5c
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Oct 2026 07:28:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4258040BA3;
	Wed, 21 Oct 2026 07:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14BC1F000CB;
	Wed, 21 Oct 2026 07:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792567720;
	bh=fGLZu5bEdrlOiox76i4MIJ+BnMi35Yr6c+WUvX+zPD0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b6cSqI/4W2uhFKVbrW8n5e2MwNmPTvgBY161gepcBNOVflLre3VqDiMO6hpp5NZb6
	 vTZUjvaqbWFWKd9TO8cXsHr5ct9mXqw3fJX4I+rY49O8j2D0pdag+kJDKXLQydt+72
	 nTsN3qlVyIl/kAoEpQDcJqjEdL51hGdVRXxreBjXoWWYf4kTQ8gHXSlwnqwewllQDa
	 +uMLkQtXo/Qc9PYpZbXqMsigZ5+ASltx+AAW+9ocTedyKbJLR08S5q7jjllxbfD7F3
	 YZ02eYwOjD0LgwK8v+yq9XHddkwc2DEtClIyi5FOL4xf7yHnmDin2OOQkgmNOrJPSq
	 XrnuOugD9hPkA==
Message-ID: <sashiko-outbox-179905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec
 driver
To: "Jiebing Chen" <jiebing.chen@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
Date: Wed, 21 Oct 2026 07:28:39 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gQVNvQzogbWVzb246
IGcxMmEtdG9hY29kZWM6IHdyb25nIG11eCBzaGlmdCBpbiBzNF90b2Fjb2RlY193aWRnZXRzCi0t
Cgpjb21taXQgM2ZkMzVlNTJmZGNhYWEyZWZmZmFiYTA1YjIxZjU4NDA0MzAzZTlkZQpBdXRob3I6
IEppZWJpbmcgQ2hlbiA8amllYmluZy5jaGVuQGFtbG9naWMuY29tPgoKQVNvQzogbWVzb246IGcx
MmEtdG9hY29kZWM6IEFkZCBTNCB0b2NvZGVjIGRyaXZlcgoKVGhpcyBwYXRjaCBhZGRzIEFtbG9n
aWMgUzQgU29DIHN1cHBvcnQgdG8gdGhlIGcxMmEtdG9hY29kZWMgZHJpdmVyLAppbmNsdWRpbmcg
REFQTSBzdXBwbHkgd2lkZ2V0cyBmb3IgdGhlIEJDTEsgYW5kIE1DTEsgZ2F0ZXMsIGFuIDgtbGFu
ZQpMYW5lIFNlbGVjdCBjb250cm9sLCBhbmQgdGhlIFM0IHJlZ2lzdGVyIGZpZWxkIGxheW91dC4K
Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9tZXNvbi9nMTJhLXRvYWNvZGVjLmMgYi9zb3VuZC9z
b2MvbWVzb24vZzEyYS10b2Fjb2RlYy5jCj4gaW5kZXggYTk1Mzc1YjUzZjBhMy4uMTBmMjZiNGJj
OGIwZCAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2MvbWVzb24vZzEyYS10b2Fjb2RlYy5jCj4gKysr
IGIvc291bmQvc29jL21lc29uL2cxMmEtdG9hY29kZWMuYwoKWyAuLi4gXQoKPiBAQCAtMTQxLDYg
KzE0NCwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgc20xX3Rv
YWNvZGVjX3dpZGdldHNbXSA9IHsKPiAgCQkJICAgICZnMTJhX3RvYWNvZGVjX291dF9lbmFibGUp
LAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0IHM0
X3RvYWNvZGVjX3dpZGdldHNbXSA9IHsKPiArCVNORF9TT0NfREFQTV9NVVgoIlNSQyIsIFNORF9T
T0NfTk9QTSwgMCwgMCwKPiArCQkJICZzbTFfdG9hY29kZWNfbXV4KSwKCltTZXZlcml0eTogTWVk
aXVtXQpTaG91bGQgczRfdG9hY29kZWNfd2lkZ2V0cyB1c2UgYSBkZWRpY2F0ZWQgbXV4IGNvbnRy
b2wgd2l0aCBzaGlmdCAxOSBpbnN0ZWFkCm9mIHNtMV90b2Fjb2RlY19tdXg/CgpPbiBTNCwgczRf
dG9hY29kZWNfY29udHJvbHMgZGVmaW5lcyAiTGFuZSBTZWxlY3QiIGF0IGJpdCAxNgooQ1RSTDBf
TEFORV9TRUxfU00xKSB3aXRoIG1heCA3LCBvY2N1cHlpbmcgYml0cyAxODoxNiBvZiBUT0FDT0RF
Q19DVFJMMCwgYW5kCnM0X3RvYWNvZGVjX21hdGNoX2RhdGEgbW92ZXMgZmllbGRfZGF0X3NlbCB0
byBiaXRzIDIwOjE5OgoKCS5maWVsZF9kYXRfc2VsCT0gUkVHX0ZJRUxEKFRPQUNPREVDX0NUUkww
LCAxOSwgMjApLAoKV2hpbGUgZzEyYV90b2Fjb2RlY19tdXhfcHV0X2VudW0oKSB3cml0ZXMgdG8g
cHJpdi0+ZmllbGRfZGF0X3NlbCwKc20xX3RvYWNvZGVjX211eCB1c2VzIHNtMV90b2Fjb2RlY19t
dXhfZW51bSwgd2hpY2ggaGFyZGNvZGVzIHRoZSBzaGlmdCB0bwpDVFJMMF9EQVRfU0VMX1NNMV9M
U0IgKGJpdCAxOCk6CgpzdGF0aWMgU09DX0VOVU1fU0lOR0xFX0RFQ0woc20xX3RvYWNvZGVjX211
eF9lbnVtLCBUT0FDT0RFQ19DVFJMMCwKCQkJICAgIENUUkwwX0RBVF9TRUxfU00xX0xTQiwKCQkJ
ICAgIGcxMmFfdG9hY29kZWNfbXV4X3RleHRzKTsKCldoZW4gc25kX3NvY19kYXBtX2dldF9lbnVt
X2RvdWJsZSgpIG9yIGRhcG1fY29ubmVjdF9tdXgoKSByZWFkcyB0aGUgIlNvdXJjZSIKbXV4IHN0
YXRlIG9uIFM0LCB3b24ndCBpdCBleHRyYWN0IGJpdHMgMTk6MTggKG92ZXJsYXBwaW5nIHRoZSBN
U0Igb2YgIkxhbmUKU2VsZWN0IikgaW5zdGVhZCBvZiBiaXRzIDIwOjE5LCByZXR1cm5pbmcgdGhl
IHdyb25nIGVudW0gc2VsZWN0aW9uIG9yIGFuCnVubWFwcGVkIHZhbHVlIG9mIDMgd2hlbiAiSTJT
IEIiIGFuZCBsYW5lcyA0Li43IGFyZSBhY3RpdmU/Cgo+ICsJU05EX1NPQ19EQVBNX1NXSVRDSCgi
T1VUIEVOIiwgU05EX1NPQ19OT1BNLCAwLCAwLAo+ICsJCQkgICAgJmcxMmFfdG9hY29kZWNfb3V0
X2VuYWJsZSksCj4gKwlTTkRfU09DX0RBUE1fU1VQUExZKCJJMlMgQkNMSyBHYXRlIiwgVE9BQ09E
RUNfQ1RSTDAsIENUUkwwX0JDTEtfRU5BQkxFX1NISUZULCAwLCBOVUxMLCAwKSwKPiArCVNORF9T
T0NfREFQTV9TVVBQTFkoIkkyUyBNQ0xLIEdhdGUiLCBUT0FDT0RFQ19DVFJMMCwgQ1RSTDBfTUNM
S19FTkFCTEVfU0hJRlQsIDAsIE5VTEwsIDApLAo+ICsKPiArfTsKClsgLi4uIF0KCj4gQEAgLTIz
NCw2ICsyNTcsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IHNtMV90
b2Fjb2RlY19jb250cm9sc1tdID0gewo+ICAJU09DX1NJTkdMRSgiTGFuZSBTZWxlY3QiLCBUT0FD
T0RFQ19DVFJMMCwgQ1RSTDBfTEFORV9TRUxfU00xLCAzLCAwKSwKPiAgfTsKPiAgCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgc25kX2tjb250cm9sX25ldyBzNF90b2Fjb2RlY19jb250cm9sc1tdID0g
ewo+ICsJU09DX1NJTkdMRSgiTGFuZSBTZWxlY3QiLCBUT0FDT0RFQ19DVFJMMCwgQ1RSTDBfTEFO
RV9TRUxfU00xLCA3LCAwKSwKPiArfTsKClsgLi4uIF0KCj4gQEAgLTI3Niw2ICszMTQsMTMgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBnMTJhX3RvYWNvZGVjX21hdGNoX2RhdGEgc20xX3RvYWNvZGVj
X21hdGNoX2RhdGEgPSB7Cj4gIAkuZmllbGRfYmNsa19zZWwJPSBSRUdfRklFTEQoVE9BQ09ERUNf
Q1RSTDAsIDQsIDYpLAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBnMTJhX3RvYWNv
ZGVjX21hdGNoX2RhdGEgczRfdG9hY29kZWNfbWF0Y2hfZGF0YSA9IHsKPiArCS5jb21wb25lbnRf
ZHJ2CT0gJnM0X3RvYWNvZGVjX2NvbXBvbmVudF9kcnYsCj4gKwkuZmllbGRfZGF0X3NlbAk9IFJF
R19GSUVMRChUT0FDT0RFQ19DVFJMMCwgMTksIDIwKSwKPiArCS5maWVsZF9scmNsa19zZWwgPSBS
RUdfRklFTEQoVE9BQ09ERUNfQ1RSTDAsIDEyLCAxNCksCj4gKwkuZmllbGRfYmNsa19zZWwJPSBS
RUdfRklFTEQoVE9BQ09ERUNfQ1RSTDAsIDQsIDYpLAo+ICt9OwoKWyAuLi4gXQoKLS0gClNhc2hp
a28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAyMS1h
dWRpb19kcnZpZXItdjctMC0yYjlhZWFlOWNiOGFAYW1sb2dpYy5jb20/cGFydD0zCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
