Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871C5C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 May 2023 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snaU7ID6ilbJZWXpIYY1Pq4fhoUX7NEemIFUEByjfDM=; b=tWWQNA5Ver2ZR1
	QDkoyyuLYHDmfMQlsqPvCd+onefDluP1GX/FBLsliaB/b/u/PNucBk3OxvGACx9XFlDU5vOcqkKBP
	QkyfUTlZ7ON4PfISteVuIFtS6ceK4AG8ar5n/egtfDH/hprm25mwLLM92VwS40ERMam9z42Cw5zo6
	cuHPsHSATQhRlEkBj594XprNLsZRlgA3FesOYsc9uKCvBQmmC+l33rPbGz7fAaO641sMhksl5e6S8
	/qzC6NhCW9uqzHalWglKqBQUVN1qBvW03TkI9JwHP3nXcQYanysBtUDFQQMguienvK9xhTpdaHjtC
	9SyouUd9XqX0gsWl1nlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dG7-00AeYN-1r;
	Mon, 29 May 2023 13:50:03 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dG3-00AeVT-0w;
	Mon, 29 May 2023 13:50:02 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 0756D5FD0A;
	Mon, 29 May 2023 16:49:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685368191;
	bh=THwSTiUgcfU0pN7hOf4QtxshefiF8YvUMoTpottLmWg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=mddf9/y8v6hAkp68ikcDPDEEZPFmcm9XfJgm/d/pBwXY7Tnrz9IJCEJl5RorF9lki
	 Ss2Hje9CJuNmumleXd+y9THp7TpXjfmScVhtEKAPtqeh5VlHHWpUKIha7S3OgwMMHo
	 JtcHoeLzZ81xVgpo2CabIB4th5WCdbc9HW6/c4nW4Lihra0ozcL/fJf+OQCwTgOiuC
	 eTW/Noa0ZWB/YB4eTZAGTD7qua/4yoG4g4BlJ72F5BqwnCNSi6x3kOmqBpkJqLdYGc
	 LiC6yZgLICBN8DiAblqAdXsEP19n/RS8RC14rFy1TNPtyOaYQjGMUEA0jmqd34hH/z
	 yNMiW6geR5ZbQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 29 May 2023 16:49:49 +0300 (MSK)
Date: Mon, 29 May 2023 16:49:44 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v13 4/6] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
Message-ID: <20230529134944.dh7isqg5ontfbtpa@CAB-WSD-L081021>
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru>
 <20230405195927.13487-5-ddrokosov@sberdevices.ru>
 <CAFBinCA3uZXzr3RgnWnKV5Qr-CPaZQX5joDg319i_cgzhLJy2g@mail.gmail.com>
 <20230425123304.xjmrkraybp2siwdw@CAB-WSD-L081021>
 <CAFBinCCqx1oHf+PcXBkeRYHnGQChbTTPRyD8SJU+ait+TG+AjQ@mail.gmail.com>
 <20230511132606.vk52yorf43alwgew@CAB-WSD-L081021>
 <CAFBinCCmNLQF_qV3k4kgDEAsemEsjL-GQtPex7Pmxrc2sHx30A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCmNLQF_qV3k4kgDEAsemEsjL-GQtPex7Pmxrc2sHx30A@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/29 07:59:00 #21367693
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_065000_042797_B7EC99EC 
X-CRM114-Status: GOOD (  43.62  )
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

SGVsbG8gTWFydGluLAoKQXMgSSBwcm9taXNlZCBiZWZvcmUsIEknbSBub3cgYmFjayB3aXRoIHRo
ZSB2ZW5kb3IncyByZXBseSByZWdhcmRpbmcKQVVERERTLiBUaGUgaW5mb3JtYXRpb24gaXMgc3Rp
bGwgaW5jb21wbGV0ZSwgYnV0IEkgaGF2ZSBwcm92aWRlZCB0aGUKYXZhaWxhYmxlIGRldGFpbHMg
YmVsb3cuIFBsZWFzZSB0YWtlIGEgbG9vay4KCk9uIFN1biwgTWF5IDE0LCAyMDIzIGF0IDEwOjUz
OjUzUE0gKzAyMDAsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gSGkgRG1pdHJ5Lgo+IAo+
IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDM6MjbigK9QTSBEbWl0cnkgUm9rb3NvdiA8ZGRyb2tv
c292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPiBbLi4uXQo+ID4gPiBJZiB5b3UgYWdyZWUgd2l0
aCBteSBzdGF0ZW1lbnQgZnJvbSBhYm92ZSBJJ2xsIGJlIGFibGUgdG8gbWFrZSBteQo+ID4gPiBv
cmlnaW5hbCBxdWVzdGlvbiBtb3JlIHNwZWNpZmljOgo+ID4gPiBTaW5jZSB3ZSBrbm93IHRoYXQg
d2UgaGF2ZSBhbGwgdGhlIHJlcXVpcmVkIGlucHV0cyBmb3IgZml4ZWRfcGxsLAo+ID4gPiBzeXNf
cGxsIGFuZCBoaWZpX3BsbCAtIGRvIHlvdSBrbm93IHdoYXQgQVVERERTIGlzIGFuZCB3aGV0aGVy
IGl0Cj4gPiA+IHJlcXVpcmVzIGFueSBzcGVjaWZpYyBjbG9jayBpbnB1dHMgKG90aGVyIHRoYW4g
ImZpeHBsbF9pbiIgYW5kCj4gPiA+ICJoaWZpcGxsX2luIik/Cj4gPiA+Cj4gPgo+ID4gVG8gYmUg
aG9uZXN0LCBJIGhhdmUgcHJlcGFyZWQgQTEgcGVyaXBoZXJhbHMgYW5kIEExIFBMTCBkcml2ZXJz
IGJhc2VkIG9uIHZlcnkKPiA+IHBvb3IgQW1sb2dpYyBkYXRhc2hlZXRzIGFuZCBjdXN0b20gNC4x
OS1iYXNlZCB2ZW5kb3IgZHJpdmVycy4KPiA+IFRoZSB2ZW5kb3IgZHJpdmVyIGhhcyBhbiBBVURE
RFMgY2xvY2sgaW4gdGhlIFBMTCBjbG9jayBwYXJ0LCBidXQgaXQgaXMgbm90Cj4gPiB1c2VkIGFu
eXdoZXJlLiBVbmZvcnR1bmF0ZWx5LCBhcyB1c3VhbCwgdGhlIGRhdGFzaGVldCBkb2Vzbid0IHBy
b3ZpZGUgYW55Cj4gPiBpbmZvcm1hdGlvbiBvciBleHBsYW5hdGlvbiBhYm91dCB3aGF0IGl0IGlz
LiBIb3dldmVyLCB0aGUgZHJpdmVyIGhhcyBhIGZldwo+ID4gbGluZXMgb2YgY29tbWVudHMgdGhh
dCBpbmRpY2F0ZToKPiA+Cj4gPiAgICAgLyoKPiA+ICAgICAgKiBhdWQgZGRzIGNsb2NrIGlzIG5v
dCBwbGwgY2xvY2ssIG5vdCBkaXZpZGVyIGNsb2NrLAo+ID4gICAgICAqIE5vIGNsb2NrIG1vZGVs
IGNhbiBkZXNjcmliZSBpdC4KPiA+ICAgICAgKiBTbyB3ZSByZWdhcmQgaXQgYXMgYSBnYXRlLCBh
bmQgdGhlIGdhdGUgb3BzCj4gPiAgICAgICogc2hvdWxkIHJlYWxpemUgbG9uZWx5Lgo+ID4gICAg
ICAqLwo+ID4KPiA+IEFkZGl0aW9uYWxseSwgdGhlIHZlbmRvciBkcml2ZXIgc3RhdGVzIHRoYXQg
QVVERERTIGhhcyBhIDQ5TWh6IGNsb2NrLAo+ID4gYnV0IEkgZG8gbm90IHNlZSBhbnkgcmVsYXRp
b25zaGlwIHdpdGggb3RoZXIgY2xvY2tzIChpbmNsdWRpbmcgdGhlIGV4cG9ydGVkCj4gPiBHRU5D
TEspLgo+ID4gSmlhbiBkaWQgbm90IGluY2x1ZGUgaXQgaW4gdGhlIGZpcnN0IHZlcnNpb24gb2Yg
dGhlIFBMTCBkcml2ZXIsIGFuZCBJIGhhdmUKPiA+IGRlY2lkZWQgbm90IHRvIGNoYW5nZSBpdCBl
aXRoZXIuCj4gPgo+ID4gSSBhbHNvIG5vdGljZWQgYSBmZXcgbGluZXMgb2YgQVVERERTIGluaXRp
YWxpemF0aW9uIHNlcXVlbmNlcyBpbiB0aGUgdmVuZG9yCj4gPiBkcml2ZXIsIHdoaWNoIG1heSBh
ZmZlY3QgQ1BVIGNsb2NrIG9iamVjdHMgKGZyb20gbXkgcG9pbnQgb2YgdmlldykuCj4gPiBIb3dl
dmVyLCB0aGV5IGFyZSBjdXJyZW50bHkgdW5kZXIgZGV2ZWxvcG1lbnQsIGFuZCBJIHdpbGwgdHJ5
IHRvIGZpZ3VyZSBpdAo+ID4gb3V0IHdpdGggQW1sb2dpYyBzdXBwb3J0Lgo+ID4KPiA+ID4gPiBI
b3dldmVyLCBJIGRvIG5vdCBiZWxpZXZlIHRoaXMgdG8gYmUgYSBzaWduaWZpY2FudCBpc3N1ZS4g
VGhlIGNsb2NrIERUCj4gPiA+ID4gYmluZGluZ3MgYXJlIG9yZ2FuaXplZCB0byBzaW1wbGlmeSB0
aGUgcHJvY2VzcyBvZiBpbnRyb2R1Y2luZyBuZXcgYmluZGluZ3MsCj4gPiA+ID4gd2hldGhlciBw
dWJsaWMgb3IgcHJpdmF0ZS4gRm9yIGluc3RhbmNlLCB3ZSBtYXkgYWRkIG5ldyBiaW5kaW5ncyB0
bwo+ID4gPiA+IGluY2x1ZGUvZHQtYmluZGluZ3MgYXQgdGhlIGVuZCBvZiB0aGUgbGlzdCBhbmQg
aW5jcmVhc2UgdGhlIG92ZXJhbGwgbnVtYmVyLAo+ID4gPiA+IHdpdGhvdXQgZGlzcnVwdGluZyB0
aGUgRFQgYmluZGluZ3MgQUJJICh0aGUgb2xkIG51bWJlcnMgd2lsbCByZW1haW4KPiA+ID4gPiB1
bmNoYW5nZWQpLgo+ID4gPiBZZXAsIHRoaXMgcGFydCBpcyBjbGVhciB0byBtZS4gSSBzaG91bGQg
aGF2ZSBiZWVuIG1vcmUgc3BlY2lmaWMgdGhhdCBJCj4gPiA+IHdhcyBhc2tpbmcgYWJvdXQgdGhl
IGlucHV0cyB0aGF0IGFyZSBkZXNjcmliZWQgaW4gdGhlIC55YW1sIGZpbGUsIG5vdAo+ID4gPiB0
aGUgY2xvY2sgSURzLgo+ID4KPiA+IEFjdHVhbGx5LCBBVURERFMgaGFzIGFuIHh0YWwyZGRzIHBh
cmVudCBjbG9jaywgYW5kIGlmIHdlIG5lZWQgdG8gaGF2ZQo+ID4gdGhlIEFVREREUyBjbG9jayBp
biB0aGUgUExMIGRyaXZlciwgd2Ugc2hvdWxkIGFkZCBvbmUgbW9yZSBsaW5rIGJldHdlZW4KPiA+
IHBlcmlwaGVyYWxzIGFuZCBQTEwgZHJpdmVycy4KPiA+Cj4gPiBMZXQgbWUga25vdyBpZiB5b3Ug
aGF2ZSBhbnkgcXVlc3Rpb25zLgo+IEkgaGF2ZSBubyBxdWVzdGlvbnMgLSBhbGwgSSBjYW4gc2F5
IGlzIHRoYXQ6Cj4gLSBJIGxpa2UgeW91ciBhcHByb2FjaCBvZiBjbGFyaWZ5aW5nIGRldGFpbHMg
b2YgdGhlIEFVREREUyBjbG9jayB3aXRoIEFtbG9naWMKPiAtIGFuZCBJIGZ1bGx5IGFncmVlIHdp
dGggeW91ciBjb25jbHVzaW9uIHRoYXQgKGRlcGVuZGluZyBvbiB3aGF0Cj4gQW1sb2dpYyBzYXlz
KSB3ZSBuZWVkIG9uZSBtb3JlIGxpbmsgZnJvbSB0aGUgUExMIGRyaXZlciB0byB0aGUgQVVERERT
Cj4gY2xvY2sKPiAKPiBUaGFuayB5b3UgZm9yIHlvdXIgcGVyc2lzdGVuY2Ugd2l0aCB0aGlzIHNl
cmllcywgSSdtIHN1cmUgaXQgd2lsbCBwYXkKPiBvZmYgaW4gdGhlIGxvbmcgcnVuIQoKQVVERERT
IGlzIGEgZGlyZWN0IGRpZ2l0YWwgc3ludGhlc2l6ZXIgdXNlZCBhcyBhIGNsb2NrIHNvdXJjZS4g
IEl0IGlzCm5vdCB1c2VkIGFzIGRlZmF1bHQuIFlvdSBuZWVkIHRvIG1vZGlmeSBzb21lIGNsayBy
ZWdpc3RlcnMgaW4gZHRzIHRvCmVuYWJsZSBpdC4gQmFzaWNhbGx5LCBpdCBpcyB1c2VkIGZvciBh
dWRpby4KCkluIEExIGRlc2lnbiwgeW91IGNhbiB1c2UgQVVEIEREUyBhcyBhIGNsb2NrIHNvdXJj
ZSBhbmQgaXQgaXMgbm90Cm5lY2Vzc2FyeS4gSXQgaXMgbm90IHVzZWQgaW4gdGhlIEFtbG9naWMg
ZGVmYXVsdCBzZXR0aW5nLgoKQWNjb3JkaW5nIHRvIHRoZSB2ZW5kb3IsIGl0IGlzIG5vdCBuZWNl
c3NhcnkgYW5kIGlzIGN1cnJlbnRseSBkaXNhYmxlZApieSBkZWZhdWx0LiBXaGlsZSB3ZSBkb24n
dCBoYXZlIG11Y2ggaW5mb3JtYXRpb24gYWJvdXQgQVVERERTLCB0aGUKdmVuZG9yIHN1Z2dlc3Rz
IHRoYXQgaXQncyBub3QgYSBjb21tb25seSB1c2VkIGNsb2NrIG9iamVjdCBpbiBBMQpwcm9qZWN0
cyBhbmQgaXQgbWF5IGJlIHNraXBwZWQgaWYgbm90IG5lZWRlZC4KCkJhc2VkIG9uIGFsbCBhYm92
ZSBpbmZvcm1hdGlvbiwgSSBzdXBwb3NlIHdlIGNhbiBza2lwIGl0IG5vdy4KCi0tIApUaGFuayB5
b3UsCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
