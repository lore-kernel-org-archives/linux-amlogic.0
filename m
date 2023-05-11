Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07536C77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=To3wGQ5Xk0RXmvjtYD8RgHHhIs6s4V7hjnsy0OXAxcE=; b=IxXQeIs6FLXbYM
	IzAHCv7dBCXmtkejEnUsemyA7kgNS/uYyiLAArp/FzL7QDu045vZTe326ZVckozXp88yOCt7Akj44
	Oz30P1sC9GD4Ssv+wb/vFw2e7GzSX6vAiRkUoq5AjnrqkeP3paK/xHUbdEvHk3ysMhaAYLrEsQirG
	nZN4HKxVACResiT8hflp9TugQ2LhL5B1kcM8TsDENIzD/YnWJ7NjeH6Xj6eMxGa9P/EKMnBxqtNt7
	TjLLu/vXlaOVV3s7zwH2LQmTI08jc9UiycJpCpCYSQplzW8QhBfBZlJ9DHF/jh1qiffLNQJB+edqe
	+s9JQYw4jxhP6jCon1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6gk-008vqg-1n;
	Thu, 11 May 2023 13:50:34 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px6gg-008vpr-3A;
	Thu, 11 May 2023 13:50:32 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 3C47B5FD5F;
	Thu, 11 May 2023 16:50:28 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683813028;
	bh=RMxJjEHJX0J6cuwdy2YgFZf1Gg52m0VezrZJvqOMaY8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=M6GU5ISY3Mv0QEnjh2NKb5xTVGYQYoSeIcRu0VuGPTsEejBDDGUhrGA4rfspJa+T0
	 7oAa8lBpV8UvH3cVvDuf8xotDuykXPT2tDeBgRoz39z+VfTw3Rmkm529NaJ4PZGoG0
	 DUrolTUhKLGN2K5PxUXEkRObkrlvz8zj5U8L7Wu0KQ4p8wTZnH8ES4C3ueCqwFHeZO
	 H1akRIjfHBOaU/8hUfm6NYd12hz56Ate8iIcttopxSTuesYN0aJpW9hrL+TDx7QlTq
	 svJrAC89qTH3UYczt3km/iLdj9cPL3/3TQAGnVlzsXIxrIQEZ18MUDjxmpfXR92dyt
	 EMYvw7TteVwkg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 11 May 2023 16:50:28 +0300 (MSK)
Date: Thu, 11 May 2023 16:50:22 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v14 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <20230511135022.jzkv4un4bbm375aw@CAB-WSD-L081021>
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-6-ddrokosov@sberdevices.ru>
 <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
 <2F9DDB93-5EE7-4B5D-AFB5-052968081E0A@gmail.com>
 <e29a7911-065a-04e2-f04f-027a0646362c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e29a7911-065a-04e2-f04f-027a0646362c@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 10:21:00 #21259776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_065031_371220_8E26E515 
X-CRM114-Status: GOOD (  17.26  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, devicetree <devicetree@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, mturquette@baylibre.com, LKML <linux-kernel@vger.kernel.org>, sboyd@kernel.org, Rob Herring <robh+dt@kernel.org>, jian.hu@amlogic.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@sberdevices.ru, AML <linux-amlogic@lists.infradead.org>, rockosov@gmail.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gS3J6eXN6dG9mLAoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3IQoKT24gVHVlLCBNYXkg
MDIsIDIwMjMgYXQgMDk6Mzk6MTJBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToK
PiBPbiAwMi8wNS8yMDIzIDAzOjM4LCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+ID4+IE9uIDEg
TWF5IDIwMjMsIGF0IDc6NTEgcG0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5z
dGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gSGkgRG1pdHJ5LAo+ID4+Cj4g
Pj4gT24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTE6NTjigK9BTSBEbWl0cnkgUm9rb3Nvdgo+ID4+
IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+ID4+Pgo+ID4+PiBBZGQgdGhlIGRv
Y3VtZW50YXRpb24gZm9yIEFtbG9naWMgQTEgUGVyaXBoZXJhbHMgY2xvY2sgZHJpdmVyLAo+ID4+
PiBhbmQgQTEgUGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxlciBiaW5kaW5ncy4KPiA+PiBNYXli
ZSBhIG5hdGl2ZSBFbmdsaXNoIHNwZWFrZXIgY2FuIGNvbW1lbnQgb24gd2hldGhlciBpdCdzCj4g
Pj4gInBlcmlwaGVyYWwiIG9yICJwZXJpcGhlcmFscyIuCj4gPiAKPiA+IEnigJltIG5vdCBhIGdy
YW1tYXIgc3BlY2lhbGlzdCwgYnV0IEkgd291bGQgd3JpdGU6Cj4gPiAKPiA+IOKAnEFkZCBkb2N1
bWVudGF0aW9uIGFuZCBiaW5kaW5ncyBmb3IgdGhlIEFtbG9naWMgQTEgU29DIHBlcmlwaGVyYWxz
Cj4gPiBjbG9jayBkcml2ZXLigJ0KPiA+IAo+ID4gUGVyaXBoZXJhbHMgaXMgdGhlIGNvcnJlY3Qg
cGx1cmFsIGJ1dCByZWFkcyBiZXR0ZXIgd2hlbiB5b3UgYWRkCj4gPiBjb250ZXh0IG9uIHRoZSB0
eXBlIG9mIHBlcmlwaGVyYWxzLgo+IAo+IERyb3AgdGhlICJkcml2ZXIiIHJlZmVyZW5jZXMgLSBm
cm9tIHRoZSBiaW5kaW5nIGl0c2VsZiBhbmQgZnJvbSBjb21taXQKPiBtc2cuIFRoZSBiaW5kaW5n
cyBhcmUgZm9yIGhhcmR3YXJlLCBub3QgZm9yIHRoZSBkcml2ZXIsIHNvOiAiZm9yIHRoZQo+IEFt
bG9naWMgQTEgU29DIHBlcmlwaGVyYWxzIGNsb2NrIGNvbnRyb2xsZXIuIi4KCk9rYXksIHRoYW5r
IHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24hIEkgd2lsbCByZW1vdmUgaXQgaW4gdGhlIG5leHQKdmVy
c2lvbi4KCi0tIApUaGFuayB5b3UsCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
