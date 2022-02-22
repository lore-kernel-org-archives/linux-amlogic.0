Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E814C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 08:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9xu4iIHFFrwGv1+JtEbtEX7P7jaXvchsFkiYSTeThQ=; b=Cp8om2nxPpZdPA
	ntcmxtd/GbB+CGn0oI0e39L56XgOg4d7qdmfjE4yP2YdtdvCDxuYnzy9O6uDxP5yyfRBMJ0/KdCRY
	2vLgDmDWBaQG2tpB9xL/Bn0Iji6SEA0XeElxA9l0NrdTYtwJsoI3JkEmA7neECz9DmzFqSQVPCHB3
	HiRUGCb24AkONP+74tX8gF6S83A9Xww5TJNifCvCfZdXQrtT8+gnt3EPqcMrISvOFPh1ziN8zXJ8V
	DBBVMF1cED/G+xJK0p26j7PoyXTmjq9bbCheslyfRowV1OK2OK+1IxVPIooIQCWQCJzYeB3zCoGUa
	DMnL70I8vKGYCTnxncdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMQOy-008UWj-CU; Tue, 22 Feb 2022 08:20:04 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMQOl-008UTR-Dd; Tue, 22 Feb 2022 08:19:52 +0000
Received: by mail-vs1-f44.google.com with SMTP id y4so20205226vsd.11;
 Tue, 22 Feb 2022 00:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jgaRhHslsUBWDtLPmfFYKNjHJ00HZye1jZhaD7+fwG0=;
 b=YQkDYzcEumWb8e0X7EpeGBmMnmFLg5s3suE8oUKX1T6B5/3Tj2GDAm/AJE8us6puj3
 740AAFjEUC3KoYPaVQje7hifVDEo8EQmIlA4KYBbdREZIa6lzJSzfWfuXGQwXlJBm8pP
 9Xk7cdvXfQ+uzHQ4OrhDUKzxoshaLWEzUIVETKFRvYnCzhgTO8rVfFPzoANmiws1mSou
 aTBXIlTDoiB89LX63nMI0mN8UjsA7Lbu94FGYIJXTtDL1sE4lXGv6UQGqtKRqUjCGfDc
 VD9vLBNNSRVsATudynxbvXx4EOSrEpCAVWDJp3BG+hzDs1dRZ6Pq4VYm/wMC+fnq2p6L
 9pHA==
X-Gm-Message-State: AOAM5325YsbXaH0Ythma9xj6gTZvgb2WYkzM++mLOMK3mirJd6K13nYb
 wrQerwD3zaQ7mPHh8/rDxn/zaGAUTV7qvQ==
X-Google-Smtp-Source: ABdhPJyZ3rme2yts5pJmnzhp6s/mygnMHdaiT3GflqllRkIHGAiTTYas5tSw/+43BRfm9LH2L/rj1A==
X-Received: by 2002:a67:d90d:0:b0:31b:7062:74da with SMTP id
 t13-20020a67d90d000000b0031b706274damr9642687vsj.75.1645517988857; 
 Tue, 22 Feb 2022 00:19:48 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id h8sm7218263uag.0.2022.02.22.00.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 00:19:48 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id d11so16230454vsm.5;
 Tue, 22 Feb 2022 00:19:47 -0800 (PST)
X-Received: by 2002:a67:b00e:0:b0:30d:dc98:6024 with SMTP id
 z14-20020a67b00e000000b0030ddc986024mr10305449vse.57.1645517987754; Tue, 22
 Feb 2022 00:19:47 -0800 (PST)
MIME-Version: 1.0
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
 <3facc242-0ce6-9170-1fee-a5ec0a66660a@gmail.com>
In-Reply-To: <3facc242-0ce6-9170-1fee-a5ec0a66660a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Feb 2022 09:19:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUnDQKtGuN+n-t3P8e4nf9VLB+9q8fGyCh643T4Y1Knag@mail.gmail.com>
Message-ID: <CAMuHMdUnDQKtGuN+n-t3P8e4nf9VLB+9q8fGyCh643T4Y1Knag@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] auxdisplay: add support for Titanmec TM1628 7
 segment display controller
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_001951_498679_B225142B 
X-CRM114-Status: GOOD (  30.19  )
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

SGkgSGVpbmVyLAoKT24gTW9uLCBGZWIgMjEsIDIwMjIgYXQgOToyNiBQTSBIZWluZXIgS2FsbHdl
aXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPiB3cm90ZToKPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9y
dCBmb3IgdGhlIFRpdGFubWVjIFRNMTYyOCA3IHNlZ21lbnQgZGlzcGxheQo+IGNvbnRyb2xsZXIu
IEl0J3MgYmFzZWQgb24gcHJldmlvdXMgUkZDIHdvcmsgZnJvbSBBbmRyZWFzIEbDpHJiZXIuCj4g
VGhlIFJGQyB2ZXJzaW9uIHBsYWNlZCB0aGUgZHJpdmVyIGluIHRoZSBMRUQgc3Vic3lzdGVtLCBi
dXQgdGhpcyB3YXMKPiBOQUsnZWQgYnkgdGhlIExFRCBtYWludGFpbmVyLiBUaGVyZWZvcmUgSSBt
b3ZlZCB0aGUgZHJpdmVyIHRvCj4gL2RyaXZlcnMvYXV4ZGlzcGxheSB3aGF0IHNlZW1zIG1vc3Qg
cmVhc29uYWJsZSB0byBtZS4KPgo+IEZ1cnRoZXIgY2hhbmdlcyB0byB0aGUgUkZDIHZlcnNpb246
Cj4gLSBEcml2ZXIgY2FuIGJlIGJ1aWx0IGFsc28gdy9vIExFRCBjbGFzcyBzdXBwb3J0LCBmb3Ig
ZGlzcGxheXMgdGhhdAo+ICAgZG9uJ3QgaGF2ZSBhbnkgc3ltYm9scyB0byBiZSBleHBvc2VkIGFz
IExFRCdzLgo+IC0gU2ltcGxpZmllZCB0aGUgY29kZSBhbmQgcmV3cm90ZSBhIGxvdCBvZiBpdC4K
PiAtIERyaXZlciBpcyBub3cga2luZCBvZiBhIE1WUCwgYnV0IGZ1bmN0aW9uYWxpdHkgc2hvdWxk
IGJlIHN1ZmZpY2llbnQKPiAgIGZvciBtb3N0IHVzZSBjYXNlcy4KPiAtIFVzZSB0aGUgZXhpc3Rp
bmcgNyBzZWdtZW50IHN1cHBvcnQgaW4gdWFwaS9saW51eC9tYXBfdG9fN3NlZ21lbnQuaAo+ICAg
YXMgc3VnZ2VzdGVkIGJ5IEdlZXJ0IFV5dHRlcmhvZXZlbi4KPgo+IE5vdGU6IFRoZXJlJ3MgYSBu
dW1iZXIgb2YgY2hpcHMgZnJvbSBvdGhlciBtYW51ZmFjdHVyZXJzIHRoYXQgYXJlCj4gICAgICAg
YWxtb3N0IGlkZW50aWNhbCwgZS5nLiBGRDYyOCwgU00xNjI4LiBPbmx5IGRpZmZlcmVuY2UgSSBz
YXcgc28KPiAgICAgICBmYXIgaXMgdGhhdCB0aGV5IHBhcnRpYWxseSBzdXBwb3J0IG90aGVyIGRp
c3BsYXkgbW9kZXMuCj4gICAgICAgVE0xNjI4OiA2eDEyLCA3eDExCj4gICAgICAgU00xNjI4Qzog
NHgxMywgNXgxMiwgNngxMSwgN3gxMAo+ICAgICAgIEZvciB0eXBpY2FsIGRpc3BsYXlzIG9uIGRl
dmljZXMgdXNpbmcgdGhlc2UgY2hpcHMgdGhpcwo+ICAgICAgIGRpZmZlcmVuY2Ugc2hvdWxkbid0
IG1hdHRlci4KPgo+IFN1Y2Nlc3NmdWxseSB0ZXN0ZWQgb24gYSBUWDMgTWluaSBUViBib3ggdGhh
dCBoYXMgYW4gU00xNjI4QyBhbmQgYQo+IGRpc3BsYXkgd2l0aCA0IGRpZ2l0cyBhbmQgNyBzeW1i
b2xzLgo+Cj4gVGVzdGVkLWJ5OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdt
YWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2Uu
ZGU+Cj4gU2lnbmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNv
bT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZl
cnMvYXV4ZGlzcGxheS90bTE2MjguYwoKPiArc3RhdGljIGludCB0bTE2Mjhfc2hvd190ZXh0KHN0
cnVjdCB0bTE2MjggKnMpCj4gK3sKPiArICAgICAgIHN0YXRpYyBTRUc3X0NPTlZFUlNJT05fTUFQ
KG1hcF9zZWc3LCBNQVBfQVNDSUk3U0VHX0FMUEhBTlVNKTsKClRoaXMgbWFwcGluZyBjYW4gbm90
IGJlIG92ZXJyaWRkZW4gYnkgdGhlIHVzZXIuICBJcyB0aGVyZSBhbnkKc3BlY2lmaWMgcmVhc29u
IHlvdSBkaWRuJ3QgbWFrZSB0aGUgbWFwcGluZyBjb25maWd1cmFibGUgZnJvbSBzeXNmcywKY2Zy
LiBtYXBfc2VnN197c2hvdyxzdG9yZX0oKSBpbiBpbmNsdWRlL3VhcGkvbGludXgvbWFwX3RvXzdz
ZWdtZW50Lmg/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51
cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
