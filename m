Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23FDF43680
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2026 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIKRDWFx3ol8Ow7mbyqxEIIwBA8rbvFNdm7Qn5c6sds=; b=GcyN1X4PyL+JmO
	8yDUu2scodq6rfrL28jeH4xFChwzZLiTHSzFnKiH6S+HuhAsmwJUOli6h0PCNJYgiTRRhfLngk98/
	JxHdEDN+GQTY/NVj4fG+03uf4AwoO84naNNc6NLgkJz8lRfXGKSA6jla2oEU7PLyyLsQPGlguerf1
	dkoTodVk4fwaQrEguSC4ubRUsgrpjhiuSkWleQZewxf0EFNfjv4C7D/RkwWxjGhShv/IDtZN69jIi
	GxPpVU/MUhKKwCvK8hXB93mU8Z2UmWbnGgaQP5Xg3RM9Le9k3BSJndlNh9UDBwrf73eKUqHvwQ5GL
	FNWfc6K8+G/QfCx0wbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfaN-00000003q2S-3pGX;
	Fri, 17 Apr 2026 09:34:04 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfaJ-00000003ptq-3pIh;
	Fri, 17 Apr 2026 09:34:02 +0000
Message-ID: <5514acb2-f4cd-499d-aabd-8f5d7a311be0@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776418310;
	bh=k2/NtjpEqjtp2ZMPsfxKYGQQDyh1+0ETw/LyMjy9rUk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=tLkFPJYlW4M7Y+rvGQG9WBzFs13d68haPvQJ2LRKkkR/r5yeZdVM953uDuGHwnlky
	 FXxNU8iXJ26PB2EBBuzXfCF0KMhhYWBcsHlmtVA8KBa+FEO7Crv69u8/mLOcwjzoWT
	 KKtDdFdd+ts0aTqVaEGF2HTGwIjAYuwvZ59WyfWs=
Date: Fri, 17 Apr 2026 11:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 1/8] dt-bindings: mfd: khadas: Add new compatible for
 Khadas VIM4 MCU
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
 <20260403-add-mcu-fan-khadas-vim4-v2-1-70536b22439a@aliel.fr>
 <20260415214815.GA602572-robh@kernel.org>
 <6fc8ddeb-d54d-473d-94d2-49dc78a07154@aliel.fr>
 <6758aaa2-ac1a-4751-aece-2b445b84f2bc@linaro.org>
Content-Language: en-US
In-Reply-To: <6758aaa2-ac1a-4751-aece-2b445b84f2bc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_023400_412594_E55C8A23 
X-CRM114-Status: GOOD (  14.95  )
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

T24gNC8xNy8yNiA5OjUzIEFNLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBPbiA0LzE2LzI2IDEw
OjI1LCBSb25hbGQgQ2xhdmVhdSB3cm90ZToKPj4gT24gNC8xNS8yNiAxMTo0OCBQTSwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4+PiBPbiBGcmksIEFwciAwMywgMjAyNiBhdCAwNjowODozNFBNICswMjAw
LCBSb25hbGQgQ2xhdmVhdSB3cm90ZToKPj4+PiBUaGUgS2hhZGFzIFZJTTQgTUNVIHJlZ2lzdGVy
IGlzIHNsaWdodGx5IGRpZmZlcmVudAo+Pj4+IGZyb20gcHJldmlvdXMgYm9hcmRzJyBNQ1UuCj4+
Pj4gVGhpcyBib2FyZCBhbHNvIGZlYXR1cmVzIGEgc3dpdGNoYWJsZSBwb3dlciBzb3VyY2UgZm9y
IGl0cyBmYW4uCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBSb25hbGQgQ2xhdmVhdSA8bGludXgt
a2VybmVsLWRldkBhbGllbC5mcj4KPj4+PiAtLS0KPj4+PiDCoCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWZkL2toYWRhcyxtY3UueWFtbCB8IDUgKysrKysKPj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9raGFkYXMsbWN1LnlhbWwKPj4+PiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQva2hhZGFzLG1jdS55YW1sCj4+Pj4g
aW5kZXggMDg0OTYwZmQ1YTFmZC4uNjc3NjllZjVkNThiMSAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2toYWRhcyxtY3UueWFtbAo+Pj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQva2hhZGFzLG1jdS55YW1s
Cj4+Pj4gQEAgLTE4LDYgKzE4LDcgQEAgcHJvcGVydGllczoKPj4+PiDCoMKgwqAgY29tcGF0aWJs
ZToKPj4+PiDCoMKgwqDCoMKgIGVudW06Cj4+Pj4gwqDCoMKgwqDCoMKgwqAgLSBraGFkYXMsbWN1
ICMgTUNVIHJldmlzaW9uIGlzIGRpc2NvdmVyYWJsZQo+Pj4KPj4+IFRoZSByZXZpc2lvbiBpcyBu
byBsb25nZXIgZGlzY292ZXJhYmxlIGFzIHdhcyBjbGFpbWVkPwo+Pj4KPj4KPj4gVGhlIGZpcm13
YXJlIHJldmlzaW9uIGlzIHN0aWxsIGRpc2NvdmVyYWJsZSwgYW5kIHZpYSB0aGUgc2FtZSByZWdp
c3RlciwKPj4gYnV0IHRoZSBWSU00IE1DVSBoYXMgYSBkaWZmZXJlbnQgcmVnaXN0ZXIgbGF5b3V0
IChlZzogbm8gREVWSUNFX05PCj4+IHJlZ2lzdGVyKS4gVGhlIG5ldyBjb21wYXRpYmxlIGlzIG5l
ZWRlZCB0byBkZXNjcmliZSBhIGRpZmZlcmVudCBNQ1UKPj4gdmFyaWFudCwgbm90IGEgZGlmZmVy
ZW50IHJldmlzaW9uIG9mIHRoZSBzYW1lIE1DVS4KPj4gSSB3aWxsIHJlbW92ZSB0aGUgY29tbWVu
dCBhcyBpdCBpcyBjb25mdXNpbmcgd2l0aCBuZXcgYm9hcmRzLgo+IAo+IFllcyBiYXNpY2FsbHkg
aXQgd2FzIGRpc2NvdmVyYWJsZSBmb3IgZWFybGllciBNQ1UgdmVyc2lvbiwgYnV0IGlzIG5vdAo+
IGZvciB0aGlzIHBhcnRpY3VsYXIgYm9hcmQgdmVyc2lvbi4KPiAKPiBLZWVwIHRoZSBjb21tZW50
LCBidXQgYWRkIGEgY29tbWVudCBvbiB0aGUgdmltNCBlbnRyeSBzYXlpbmcgdGhpcyB2YXJpYW50
Cj4gaXMgbm90IGRpc2NvdmVyYWJsZS4KPiAKPiBOZWlsCj4gCgpPayBtYWtlIHNlbnNlLCBJIHdp
bGwgZG8gdGhhdC4KCj4+Cj4+Pj4gK8KgwqDCoMKgwqAgLSBraGFkYXMsdmltNC1tY3UKPj4+PiDC
oCDCoMKgwqAgIiNjb29saW5nLWNlbGxzIjogIyBPbmx5IG5lZWRlZCBmb3IgYm9hcmRzIGhhdmlu
ZyBGQU4gY29udHJvbAo+Pj4+IGZlYXR1cmUKPj4+PiDCoMKgwqDCoMKgIGNvbnN0OiAyCj4+Pj4g
QEAgLTI1LDYgKzI2LDEwIEBAIHByb3BlcnRpZXM6Cj4+Pj4gwqDCoMKgIHJlZzoKPj4+PiDCoMKg
wqDCoMKgIG1heEl0ZW1zOiAxCj4+Pj4gwqAgK8KgIGZhbi1zdXBwbHk6Cj4+Pj4gK8KgwqDCoCBk
ZXNjcmlwdGlvbjogUGhhbmRsZSB0byB0aGUgcmVndWxhdG9yIHRoYXQgcG93ZXJzIHRoZSBmYW4u
Cj4+Pj4gK8KgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFu
ZGxlCj4+Pj4gKwo+Pj4+IMKgIHJlcXVpcmVkOgo+Pj4+IMKgwqDCoCAtIGNvbXBhdGlibGUKPj4+
PiDCoMKgwqAgLSByZWcKPj4+Pgo+Pj4+IC0twqAKPj4+PiAyLjQ5LjAKPj4+Pgo+Pgo+Pgo+IAoK
Ci0tIApCZXN0IHJlZ2FyZHMsClJvbmFsZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
