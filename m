Return-Path: <SRS0=Mf/G=L6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC6AC07E96
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jul 2021 06:06:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBB8C61988
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jul 2021 06:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBB8C61988
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xU89DmMZrOaG4/svRFYNy910ck/9plNTVzKkFNI1H+Y=; b=jBw9Gsh5mmYaCF
	ivp4M9dh7Wy1NEQtFERr1cVLt92kp+kyI9mm6d+9R7TuDfcdpU5madepMVSt1STO8dNB9rrK7jwrI
	zOset+Rs6QSabl0s8RTjiXHz3PrdPjK9PYra0yAJwoRCBPfHoEcqu4Quiy1A/XPrXqxPkJP1IhZEv
	w2iLGe1EFps3jMDCT9sA6gvAlduEGloNgibQDqXCSRtqtyt8hCfoI4LarKDHF+UYOZcydig2Neu80
	KX4aBHuqWndypPk3R/xNeCgabF5yKBf9C9ng51EGNSd4SqEoCk0zqwxEGne0TKY4bHeE6B7lwq1Up
	H0boKfmrmSJVzf4S6uVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0eEI-00ANcc-Gj; Tue, 06 Jul 2021 06:06:46 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0eE4-00ANam-MA; Tue, 06 Jul 2021 06:06:34 +0000
Received: by mail-il1-x136.google.com with SMTP id g3so18107114ilq.10;
 Mon, 05 Jul 2021 23:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BicthPpw23y2FsF1UbR3mzfkLh5Y7sZt9zqncg+I7ps=;
 b=sVmzWWAzvnnLrxV6pwBJ7JMhtpIixamWBz1xFudMY62uK7EJSaI+5TNwuKaUsohDX7
 030CmvMQsn7CCRraXAKGB9RkYiZUON6C2fFp6Bff49Hifd8mwey7Cag0kFwcI43Ajg3c
 rKiJxJIr6UGvaKA/u6Y+H0UC3ylveS3s4cc2qXdraJyudJqXPmdWmjDfQB0A+MUjc97B
 efPBZ7mTPNWqaEiiSMyCbmhHbCkWEYpLh0RAPpnzByBREgoC3x/0Lwi6Rh4KuhVIVKhC
 1S9oOCc5ICDX9u9Gi1H0OsfS0AzikQsi3eqSoCIzI6/8dAkA+d5/AYwwgm0bUpYua9+V
 buCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BicthPpw23y2FsF1UbR3mzfkLh5Y7sZt9zqncg+I7ps=;
 b=Ve1X2ca2ACoR1yhBhQFSq6v5XDIqjjhxlxqtVFPUs0++PjMzo5xOqhAPn1MXD2hGE2
 DDwg4Vinc0c6xoMyCMvdIooEc5YB6BiEqiaBTnaegrn1683LMi28EbbK3rvmNb6VzGE1
 4ArRrQBI3T9N3tAKI1vU8s4w2ILSrbf6xN5aelrxQqCGKjzgcZfQeKBkMYSkRDKX4vDB
 i97lwpg55Njl3W+i49C0mm3LlwxIUuFQFDb+J8pf2mzhsSh7Xi1YLV9MUDfPj7mEWFKZ
 l3kvs5Xjq/3liN1u2ZA0QlR8hhHbBluzo+coN6A8bluTgVAF87wICT4oT6Ls932KH/p0
 P9LQ==
X-Gm-Message-State: AOAM532YUqVfzqAw2zXHqI1kaRhW03XJA5WeVFAs6CXCGqwrFkjCyW5u
 FhxdwZ295ppu3vvyCle1FwiZKsfC5dV46WsI/Lk=
X-Google-Smtp-Source: ABdhPJxbRcQORWzcrJgZIlSqssNrhFbRyAgtL2B1hru9OfHsOWeWi4cfZjXFj3cZb6l+Wd71rzJbjvUOVa043ywVeOs=
X-Received: by 2002:a92:d4d0:: with SMTP id o16mr10065139ilm.153.1625551591404; 
 Mon, 05 Jul 2021 23:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210701154634.GA60743@bjorn-Precision-5520>
 <67a9e1fa.81a9.17a64c8e7f7.Coremail.chenhuacai@loongson.cn>
 <CAKaHn9KxRrBsn4b9fSO1eDzM3XdV2GzfwVX+cGw9uS_eKg75dw@mail.gmail.com>
 <CAAhV-H5M5Qf01DTD8ULGGGnv2kc2exRgXCLyNOOaqRL=dZ77xQ@mail.gmail.com>
In-Reply-To: <CAAhV-H5M5Qf01DTD8ULGGGnv2kc2exRgXCLyNOOaqRL=dZ77xQ@mail.gmail.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Tue, 6 Jul 2021 14:06:19 +0800
Message-ID: <CAKaHn9+iHk3UtovWU+WE2mXD9oTZD9UdxrYuLB2Odgbr91Gs-Q@mail.gmail.com>
Subject: Re: Re: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
To: Huacai Chen <chenhuacai@gmail.com>
Cc: =?UTF-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>, 
 Bjorn Helgaas <helgaas@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Wilczynski <kw@linux.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 PCI <linux-pci@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
 Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_230632_791653_0D9B6922 
X-CRM114-Status: GOOD (  23.29  )
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

PkJ1dCwgTG9vbmdzb24gcGxhdGZvcm0gaGFzIG5ld2VyIHJldmlzaW9uIG9mIGhhcmR3YXJlLCBh
bmQgdGhlIE1SUlMKPiBxdWlyayBoYXMgY2hhbmdlZCwgcGxlYXNlIHNlZToKPiBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcGNpL2xpc3QvP3Nlcmllcz01MDk0OTcK
PiBIdWFjYWkKCk9LISB0bnggZm9yIGluZm9ybWF0aW9uICEgbWF5YmUgd2UgY2FuIGNvb3BlcmF0
ZSBhbmQgbWFrZSBvbmUKdW5pdmVyc2FsIHF1aXJrIGZvciBhbGwKCk9uIFR1ZSwgSnVsIDYsIDIw
MjEgYXQgOTozNiBBTSBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBnbWFpbC5jb20+IHdyb3RlOgo+
Cj4gSGksIEFydCwKPgo+IE9uIE1vbiwgSnVsIDUsIDIwMjEgYXQgNDozNSBQTSBBcnQgTmlrcGFs
IDxlbWFpbDJ0ZW1hQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBEb2VzIHRoYXQgbWVhbnMg
a2V5c3RvbmUgYW5kIExvb25nc29uIGhhcyB0aGUgc2FtZSBNUlJTIHByb2JsZW0/IEFuZCB3aGF0
IHNob3VsZCBJIGRvIG5vdz8KPiA+Cj4gPiBMb29rIGxpa2UgeWVzICEgYW5kICBhbWxvZ2ljIGhh
cyB0aGUgc2FtZSBwcm9ibGVtLgo+ID4gSSB0aGluayBzb21lYm9keSBuZWVkIHRvIHJld3JpdGUg
aXQgYWxsIHRvIG9uZSBjb21tb24gcXVpcmsgZm9yIHRoaXMgcHJvYmxlbS4KPiA+Cj4gPiBJZiBu
byBvbmUgaGFzIGFueSBvYmplY3Rpb24sIEkgY2FuIHRyeSB0byByZW1ha2UgaXQgYWdhaW4uCj4g
QnV0LCBMb29uZ3NvbiBwbGF0Zm9ybSBoYXMgbmV3ZXIgcmV2aXNpb24gb2YgaGFyZHdhcmUsIGFu
ZCB0aGUgTVJSUwo+IHF1aXJrIGhhcyBjaGFuZ2VkLCBwbGVhc2Ugc2VlOgo+IGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1wY2kvbGlzdC8/c2VyaWVzPTUwOTQ5Nwo+
Cj4gSHVhY2FpCj4gPgo+ID4gT24gRnJpLCBKdWwgMiwgMjAyMSBhdCA5OjE1IEFNIOmZiOWNjuaJ
jSA8Y2hlbmh1YWNhaUBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpLCBCam9ybiwK
PiA+ID4KPiA+ID4gJmd0OyAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4gPiA+ICZndDsg5Y+R5Lu2
5Lq6OiAiQmpvcm4gSGVsZ2FhcyIgPGhlbGdhYXNAa2VybmVsLm9yZz4KPiA+ID4gJmd0OyDlj5Hp
gIHml7bpl7Q6IDIwMjEtMDctMDEgMjM6NDY6MzQgKOaYn+acn+WbmykKPiA+ID4gJmd0OyDmlLbk
u7bkuro6ICJBcnRlbSBMYXBraW4iIDxlbWFpbDJ0ZW1hQGdtYWlsLmNvbT4KPiA+ID4gJmd0OyDm
ioTpgIE6IG5hcm1zdHJvbmdAYmF5bGlicmUuY29tLCB5dWUud2FuZ0BBbWxvZ2ljLmNvbSwga2hp
bG1hbkBiYXlsaWJyZS5jb20sIGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20sIHJvYmhAa2VybmVs
Lm9yZywga3dAbGludXguY29tLCBqYnJ1bmV0QGJheWxpYnJlLmNvbSwgY2hyaXN0aWFuc2hld2l0
dEBnbWFpbC5jb20sIG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20sIGxpbnV4LXBj
aUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywg
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnLCBhcnRAa2hhZGFzLmNvbSwgbmlja0BraGFkYXMuY29tLCBnb3V3YUBraGFkYXMuY29t
LCAiSHVhY2FpIENoZW4iIDxjaGVuaHVhY2FpQGxvb25nc29uLmNuPgo+ID4gPiAmZ3Q7IOS4u+mi
mDogUmU6IFtQQVRDSCAwLzRdIFBDSTogcmVwbGFjZSBkdWJsaWNhdGVkIE1SUlMgbGltaXQgcXVp
cmtzCj4gPiA+ICZndDsKPiA+ID4gJmd0OyBbK2NjIEh1YWNhaV0KPiA+ID4gJmd0Owo+ID4gPiAm
Z3Q7IE9uIFNhdCwgSnVuIDE5LCAyMDIxIGF0IDAyOjM5OjQ4UE0gKzA4MDAsIEFydGVtIExhcGtp
biB3cm90ZToKPiA+ID4gJmd0OyAmZ3Q7IFJlcGxhY2UgZHVibGljYXRlZCBNUlJTIGxpbWl0IHF1
aXJrcyBieSBtcnJzX2xpbWl0X3F1aXJrIGZyb20gY29yZQo+ID4gPiAmZ3Q7ICZndDsgKiBkcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3RvbmUuYwo+ID4gPiAmZ3Q7ICZndDsgKiBk
cml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1sb29uZ3Nvbi5jCj4gPiA+ICZndDsKPiA+ID4gJmd0
OyBzL2R1YmxpY2F0ZWQvZHVwbGljYXRlZC8gKHNldmVyYWwgb2NjdXJyZW5jZXMpCj4gPiA+ICZn
dDsKPiA+ID4gJmd0OyBDYXBpdGFsaXplIHN1YmplY3QgbGluZXMuCj4gPiA+ICZndDsKPiA+ID4g
Jmd0OyBVc2UgImdpdCBsb2cgLS1vbmxpbmUiIHRvIGxlYXJuIGNvbnZlbnRpb25zIGFuZCBmb2xs
b3cgdGhlbS4KPiA+ID4gJmd0Owo+ID4gPiAmZ3Q7IEFkZCAiKCkiIGFmdGVyIGZ1bmN0aW9uIG5h
bWVzLgo+ID4gPiAmZ3Q7Cj4gPiA+ICZndDsgQ2FwaXRhbGl6ZSBhY3JvbnltcyBhcHByb3ByaWF0
ZWx5IChOVk1lLCBNUlJTLCBQQ0ksIGV0YykuCj4gPiA+ICZndDsKPiA+ID4gJmd0OyBFbmQgc2Vu
dGVuY2VzIHdpdGggcGVyaW9kcy4KPiA+ID4gJmd0Owo+ID4gPiAmZ3Q7IEEgIm1vdmUiIHBhdGNo
IG11c3QgaW5jbHVkZSBib3RoIHRoZSByZW1vdmFsIGFuZCB0aGUgYWRkaXRpb24gYW5kIG1ha2UK
PiA+ID4gJmd0OyBubyBjaGFuZ2VzIHRvIHRoZSBjb2RlIGl0c2VsZi4KPiA+ID4gJmd0Owo+ID4g
PiAmZ3Q7IEFtbG9naWMgYXBwZWFycyB3aXRob3V0IGV4cGxhbmF0aW9uIGluIDIvNC4gIE11c3Qg
YmUgc2VwYXJhdGUgcGF0Y2ggdG8KPiA+ID4gJmd0OyBhZGRyZXNzIG9ubHkgdGhhdCBzcGVjaWZp
YyBpc3N1ZS4gIFNob3VsZCByZWZlcmVuY2UgcHVibGlzaGVkIGVycmF0dW0KPiA+ID4gJmd0OyBp
ZiBwb3NzaWJsZS4gICJTb2x2ZXMgc29tZSBpc3N1ZSIgaXMgbm90IGEgY29tcGVsbGluZyBqdXN0
aWZpY2F0aW9uLgo+ID4gPiAmZ3Q7Cj4gPiA+ICZndDsgVGhlIHRyZWUgbXVzdCBiZSBjb25zaXN0
ZW50IGFuZCBmdW5jdGlvbmFsbHkgdGhlIHNhbWUgb3IgaW1wcm92ZWQKPiA+ID4gJmd0OyBhZnRl
ciBldmVyeSBwYXRjaC4KPiA+ID4gJmd0Owo+ID4gPiAmZ3Q7IEFkZCB0byBwY2lfaWRzLmggb25s
eSBpZiBzeW1ib2wgdXNlZCBtb3JlIHRoYW4gb25lIHBsYWNlLgo+ID4gPiAmZ3Q7Cj4gPiA+ICZn
dDsgU2VlCj4gPiA+ICZndDsgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMDcwMTA3NDQ1
OC4xODA5NTMyLTMtY2hlbmh1YWNhaUBsb29uZ3Nvbi5jbiwKPiA+ID4gJmd0OyB3aGljaCBsb29r
cyBzaW1pbGFyLiAgQ29tYmluZSBlZmZvcnRzIGlmIHBvc3NpYmxlIGFuZCBjYyBIdWFjYWkgc28K
PiA+ID4gJmd0OyB5b3UncmUgYm90aCBhd2FyZSBvZiBvdmVybGFwcGluZyB3b3JrLgo+ID4gPiAm
Z3Q7Cj4gPiA+ICZndDsgTW9yZSBoaW50cyBpbiBjYXNlIHRoZXkncmUgdXNlZnVsOgo+ID4gPiAm
Z3Q7IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS8yMDE3MTAyNjIyMzcwMS5HQTI1
NjQ5QGJoZWxnYWFzLWdsYXB0b3Aucm9hbS5jb3JwLmdvb2dsZS5jb20vCj4gPiA+ICZndDsKPiA+
ID4gJmd0OyAmZ3Q7IEJvdGgga3NfcGNpZV9xdWlyayBsb29uZ3Nvbl9tcnJzX3F1aXJrIHdhcyBy
ZXdyaXR0ZW4gd2l0aG91dCBhbnkKPiA+ID4gJmd0OyAmZ3Q7IGZ1bmN0aW9uYWxpdHkgY2hhbmdl
cyBieSBvbmUgbXJyc19saW1pdF9xdWlyawo+ID4gPiBEb2VzIHRoYXQgbWVhbnMga2V5c3RvbmUg
YW5kIExvb25nc29uIGhhcyB0aGUgc2FtZSBNUlJTIHByb2JsZW0/IEFuZCB3aGF0IHNob3VsZCBJ
IGRvIG5vdz8KPiA+ID4KPiA+ID4gSHVhY2FpCj4gPiA+ICZndDsgJmd0Owo+ID4gPiAmZ3Q7ICZn
dDsgQWRkZWQgRGVzaWduV2FyZSBQQ0kgY29udHJvbGxlciB3aGljaCBuZWVkIHNhbWUgcXVpcmsg
Zm9yCj4gPiA+ICZndDsgJmd0OyAqIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNv
bi5jIChQQ0lfREVWSUNFX0lEX1NZTk9QU1lTX0hBUFNVU0IzKQo+ID4gPiAmZ3Q7ICZndDsKPiA+
ID4gJmd0OyAmZ3Q7IFRoaXMgcXVpcmsgY2FuIHNvbHZlIHNvbWUgaXNzdWUgZm9yIEtoYWRhcyBW
SU0zL1ZJTTNMKEFtbG9naWMpCj4gPiA+ICZndDsgJmd0OyB3aXRoIEhETUkgc2NyYW1ibGVkIHBp
Y3R1cmUgYW5kIG52bWUgZGV2aWNlcyBhdCBpbnRlbnNpdmUgd3JpdGluZy4uLgo+ID4gPiAmZ3Q7
ICZndDsKPiA+ID4gJmd0OyAmZ3Q7IGNvbWUgZnJvbToKPiA+ID4gJmd0OyAmZ3Q7ICogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNpLzIwMjEwNjE4MDYzODIxLjEzODMzNTctMS1hcnRA
a2hhZGFzLmNvbS8KPiA+ID4gJmd0OyAmZ3Q7Cj4gPiA+ICZndDsgJmd0OyBBcnRlbSBMYXBraW4g
KDQpOgo+ID4gPiAmZ3Q7ICZndDsgIFBDSTogbW92ZSBLZXlzdG9uZSBhbmQgTG9vbmdzb24gZGV2
aWNlIElEcyB0byBwY2lfaWRzCj4gPiA+ICZndDsgJmd0OyAgUENJOiBjb3JlOiBxdWlya3M6IGFk
ZCBtcnJzX2xpbWl0X3F1aXJrCj4gPiA+ICZndDsgJmd0OyAgUENJOiBrZXlzdG9uZSBtb3ZlIG1y
cnMgcXVpcmsgdG8gY29yZQo+ID4gPiAmZ3Q7ICZndDsgIFBDSTogbG9vbmdzb24gbW92ZSBtcnJz
IHF1aXJrIHRvIGNvcmUKPiA+ID4gJmd0OyAmZ3Q7Cj4gPiA+ICZndDsgJmd0OyAtLQo+ID4gPiAm
Z3Q7ICZndDsgMi4yNS4xCj4gPiA+ICZndDsgJmd0Owo+ID4gPgo+ID4gPgo+ID4gPiA8L2NoZW5o
dWFjYWlAbG9vbmdzb24uY24+PC9lbWFpbDJ0ZW1hQGdtYWlsLmNvbT48L2hlbGdhYXNAa2VybmVs
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
