Return-Path: <SRS0=Mf/G=L6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C02C07E99
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jul 2021 01:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 901776141C
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jul 2021 01:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 901776141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jB/F8iGckJtQ1tCmyMs+t6ieEnpu2xkIEU/m0YYpNjk=; b=PFshcY8/BKzttj
	wn8VTdbpkkrUL6SxIbljrUBGvUu6YBQMVm1nkZT3zihSX65Jr7AnQhEzcEVW7325oZx5AVW/BMiNI
	/gbw2DoX+ofOE0Gb028wpM/muFm3gs7Lnk/ctru6P3rcJuVpJjRuiRi3ht1ERoIq4CSlXSOKv7tI7
	ic5Zc2Qs9eUThXc3J5/5f2YMd+hwCO6nH3oaVmBuqLYxkAv6k3oS+n8h1eI347T8Zcwy3aH097pO8
	4UFevr77fcayp7F0FMnms95xH5RTjo05tjP8j5YtikLqb9PeiIQJdP0icI5UStvTNHeVRY8LNEAcq
	nJkj5rsl+OLFLesAm7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0a1A-00A7df-9H; Tue, 06 Jul 2021 01:36:56 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0a0x-00A7bp-GW; Tue, 06 Jul 2021 01:36:45 +0000
Received: by mail-il1-x12c.google.com with SMTP id f12so12622207ils.11;
 Mon, 05 Jul 2021 18:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B582vdrs46kitJpA3JaiMzIr2mncrXCNua47i7ErJFI=;
 b=f+GfAJAAKpgZuIxD67wH2PCJ1VkbUs8feFPpWpgdRr7htZIKUPG+8rxaSQOJoecrVU
 6m4pG8SWFK/Kn/6nX2FtwzENX/6Q4LVwvXVTRSMBM6DtY4lsaGiXqBDRPKwm1ET2R7L1
 GFfnOVpuvkdJA8VoqM+CsGbI+eH4mOajiQrWXTetHW6XmUU3EG77PqC263xKXspOKi4M
 vwuvngSNLXaU+5fC3sEMvi8Nj0AP+6hdGYddVt8TGGDQqxJXQT8SCu3IVCL2xaH/Xxj+
 ZZACC0uWXxnDj5q3BHyRQyB4GnCLhMhR9n0UzmXTu4uKyuPuL27oX44UgrQIDem3IRwY
 V2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B582vdrs46kitJpA3JaiMzIr2mncrXCNua47i7ErJFI=;
 b=nEc3Rhw7ArXtXNX2ikzu5DiD81FNXYP0Iq92z0KV6mvifWm63nVNOTzsv+eb0JplZw
 ivYf64vEu/sEWB81QZMCDB7ky2mJrel+BjtmzeWRvYr7cfC/U2IgcjZ6paF8yNtGpBhO
 3bLmHvU6/D40mofzyxdSlA176trR9FMEySZ0waUH7oR7PkfQu4TNbPva9nhgnA/5s7Qb
 vyRZYdf2M9OHUFSNWMtfHE4u9xp+6e2eB2h9/UIEIycU4H/OVWTx4qyCZ0mKvyNM4vBu
 kGGrQLHz3D8AbEvddmt/JulvmviLq8wgTzKC3zXc6CtMD72hq8WkKK9nldDsbVTYXuTX
 WYxA==
X-Gm-Message-State: AOAM532ydifxm2iTRCJQe9JSh5IyQp/6dvY9LAH8viggzkaUeFn3CTNq
 5ZGnPJ4Re5uEgdEwoRH24iu/m+3lXoHo1bmsmzI=
X-Google-Smtp-Source: ABdhPJxlXOvVM4cC+roK2GgPflu1PaK7vbyn6QRobwuGWJTCMPSrJ2tYUOwj5zNnMiZ1PYgZRVumsAeRiUclsv5Nopg=
X-Received: by 2002:a05:6e02:1d12:: with SMTP id
 i18mr12892359ila.97.1625535400201; 
 Mon, 05 Jul 2021 18:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210701154634.GA60743@bjorn-Precision-5520>
 <67a9e1fa.81a9.17a64c8e7f7.Coremail.chenhuacai@loongson.cn>
 <CAKaHn9KxRrBsn4b9fSO1eDzM3XdV2GzfwVX+cGw9uS_eKg75dw@mail.gmail.com>
In-Reply-To: <CAKaHn9KxRrBsn4b9fSO1eDzM3XdV2GzfwVX+cGw9uS_eKg75dw@mail.gmail.com>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Tue, 6 Jul 2021 09:36:28 +0800
Message-ID: <CAAhV-H5M5Qf01DTD8ULGGGnv2kc2exRgXCLyNOOaqRL=dZ77xQ@mail.gmail.com>
Subject: Re: Re: [PATCH 0/4] PCI: replace dublicated MRRS limit quirks
To: Art Nikpal <email2tema@gmail.com>
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
X-CRM114-CacheID: sfid-20210705_183643_611359_97E880C2 
X-CRM114-Status: GOOD (  21.86  )
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

SGksIEFydCwKCk9uIE1vbiwgSnVsIDUsIDIwMjEgYXQgNDozNSBQTSBBcnQgTmlrcGFsIDxlbWFp
bDJ0ZW1hQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IERvZXMgdGhhdCBtZWFucyBrZXlzdG9uZSBh
bmQgTG9vbmdzb24gaGFzIHRoZSBzYW1lIE1SUlMgcHJvYmxlbT8gQW5kIHdoYXQgc2hvdWxkIEkg
ZG8gbm93Pwo+Cj4gTG9vayBsaWtlIHllcyAhIGFuZCAgYW1sb2dpYyBoYXMgdGhlIHNhbWUgcHJv
YmxlbS4KPiBJIHRoaW5rIHNvbWVib2R5IG5lZWQgdG8gcmV3cml0ZSBpdCBhbGwgdG8gb25lIGNv
bW1vbiBxdWlyayBmb3IgdGhpcyBwcm9ibGVtLgo+Cj4gSWYgbm8gb25lIGhhcyBhbnkgb2JqZWN0
aW9uLCBJIGNhbiB0cnkgdG8gcmVtYWtlIGl0IGFnYWluLgpCdXQsIExvb25nc29uIHBsYXRmb3Jt
IGhhcyBuZXdlciByZXZpc2lvbiBvZiBoYXJkd2FyZSwgYW5kIHRoZSBNUlJTCnF1aXJrIGhhcyBj
aGFuZ2VkLCBwbGVhc2Ugc2VlOgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtcGNpL2xpc3QvP3Nlcmllcz01MDk0OTcKCkh1YWNhaQo+Cj4gT24gRnJpLCBKdWwgMiwg
MjAyMSBhdCA5OjE1IEFNIOmZiOWNjuaJjSA8Y2hlbmh1YWNhaUBsb29uZ3Nvbi5jbj4gd3JvdGU6
Cj4gPgo+ID4gSGksIEJqb3JuLAo+ID4KPiA+ICZndDsgLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQo+
ID4gJmd0OyDlj5Hku7bkuro6ICJCam9ybiBIZWxnYWFzIiA8aGVsZ2Fhc0BrZXJuZWwub3JnPgo+
ID4gJmd0OyDlj5HpgIHml7bpl7Q6IDIwMjEtMDctMDEgMjM6NDY6MzQgKOaYn+acn+WbmykKPiA+
ICZndDsg5pS25Lu25Lq6OiAiQXJ0ZW0gTGFwa2luIiA8ZW1haWwydGVtYUBnbWFpbC5jb20+Cj4g
PiAmZ3Q7IOaKhOmAgTogbmFybXN0cm9uZ0BiYXlsaWJyZS5jb20sIHl1ZS53YW5nQEFtbG9naWMu
Y29tLCBraGlsbWFuQGJheWxpYnJlLmNvbSwgbG9yZW56by5waWVyYWxpc2lAYXJtLmNvbSwgcm9i
aEBrZXJuZWwub3JnLCBrd0BsaW51eC5jb20sIGpicnVuZXRAYmF5bGlicmUuY29tLCBjaHJpc3Rp
YW5zaGV3aXR0QGdtYWlsLmNvbSwgbWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbSwg
bGludXgtcGNpQHZnZXIua2VybmVsLm9yZywgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnLCBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcsIGFydEBraGFkYXMuY29tLCBuaWNrQGtoYWRhcy5jb20sIGdvdXdhQGto
YWRhcy5jb20sICJIdWFjYWkgQ2hlbiIgPGNoZW5odWFjYWlAbG9vbmdzb24uY24+Cj4gPiAmZ3Q7
IOS4u+mimDogUmU6IFtQQVRDSCAwLzRdIFBDSTogcmVwbGFjZSBkdWJsaWNhdGVkIE1SUlMgbGlt
aXQgcXVpcmtzCj4gPiAmZ3Q7Cj4gPiAmZ3Q7IFsrY2MgSHVhY2FpXQo+ID4gJmd0Owo+ID4gJmd0
OyBPbiBTYXQsIEp1biAxOSwgMjAyMSBhdCAwMjozOTo0OFBNICswODAwLCBBcnRlbSBMYXBraW4g
d3JvdGU6Cj4gPiAmZ3Q7ICZndDsgUmVwbGFjZSBkdWJsaWNhdGVkIE1SUlMgbGltaXQgcXVpcmtz
IGJ5IG1ycnNfbGltaXRfcXVpcmsgZnJvbSBjb3JlCj4gPiAmZ3Q7ICZndDsgKiBkcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3RvbmUuYwo+ID4gJmd0OyAmZ3Q7ICogZHJpdmVycy9w
Y2kvY29udHJvbGxlci9wY2ktbG9vbmdzb24uYwo+ID4gJmd0Owo+ID4gJmd0OyBzL2R1YmxpY2F0
ZWQvZHVwbGljYXRlZC8gKHNldmVyYWwgb2NjdXJyZW5jZXMpCj4gPiAmZ3Q7Cj4gPiAmZ3Q7IENh
cGl0YWxpemUgc3ViamVjdCBsaW5lcy4KPiA+ICZndDsKPiA+ICZndDsgVXNlICJnaXQgbG9nIC0t
b25saW5lIiB0byBsZWFybiBjb252ZW50aW9ucyBhbmQgZm9sbG93IHRoZW0uCj4gPiAmZ3Q7Cj4g
PiAmZ3Q7IEFkZCAiKCkiIGFmdGVyIGZ1bmN0aW9uIG5hbWVzLgo+ID4gJmd0Owo+ID4gJmd0OyBD
YXBpdGFsaXplIGFjcm9ueW1zIGFwcHJvcHJpYXRlbHkgKE5WTWUsIE1SUlMsIFBDSSwgZXRjKS4K
PiA+ICZndDsKPiA+ICZndDsgRW5kIHNlbnRlbmNlcyB3aXRoIHBlcmlvZHMuCj4gPiAmZ3Q7Cj4g
PiAmZ3Q7IEEgIm1vdmUiIHBhdGNoIG11c3QgaW5jbHVkZSBib3RoIHRoZSByZW1vdmFsIGFuZCB0
aGUgYWRkaXRpb24gYW5kIG1ha2UKPiA+ICZndDsgbm8gY2hhbmdlcyB0byB0aGUgY29kZSBpdHNl
bGYuCj4gPiAmZ3Q7Cj4gPiAmZ3Q7IEFtbG9naWMgYXBwZWFycyB3aXRob3V0IGV4cGxhbmF0aW9u
IGluIDIvNC4gIE11c3QgYmUgc2VwYXJhdGUgcGF0Y2ggdG8KPiA+ICZndDsgYWRkcmVzcyBvbmx5
IHRoYXQgc3BlY2lmaWMgaXNzdWUuICBTaG91bGQgcmVmZXJlbmNlIHB1Ymxpc2hlZCBlcnJhdHVt
Cj4gPiAmZ3Q7IGlmIHBvc3NpYmxlLiAgIlNvbHZlcyBzb21lIGlzc3VlIiBpcyBub3QgYSBjb21w
ZWxsaW5nIGp1c3RpZmljYXRpb24uCj4gPiAmZ3Q7Cj4gPiAmZ3Q7IFRoZSB0cmVlIG11c3QgYmUg
Y29uc2lzdGVudCBhbmQgZnVuY3Rpb25hbGx5IHRoZSBzYW1lIG9yIGltcHJvdmVkCj4gPiAmZ3Q7
IGFmdGVyIGV2ZXJ5IHBhdGNoLgo+ID4gJmd0Owo+ID4gJmd0OyBBZGQgdG8gcGNpX2lkcy5oIG9u
bHkgaWYgc3ltYm9sIHVzZWQgbW9yZSB0aGFuIG9uZSBwbGFjZS4KPiA+ICZndDsKPiA+ICZndDsg
U2VlCj4gPiAmZ3Q7IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTA3MDEwNzQ0NTguMTgw
OTUzMi0zLWNoZW5odWFjYWlAbG9vbmdzb24uY24sCj4gPiAmZ3Q7IHdoaWNoIGxvb2tzIHNpbWls
YXIuICBDb21iaW5lIGVmZm9ydHMgaWYgcG9zc2libGUgYW5kIGNjIEh1YWNhaSBzbwo+ID4gJmd0
OyB5b3UncmUgYm90aCBhd2FyZSBvZiBvdmVybGFwcGluZyB3b3JrLgo+ID4gJmd0Owo+ID4gJmd0
OyBNb3JlIGhpbnRzIGluIGNhc2UgdGhleSdyZSB1c2VmdWw6Cj4gPiAmZ3Q7IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXBjaS8yMDE3MTAyNjIyMzcwMS5HQTI1NjQ5QGJoZWxnYWFzLWds
YXB0b3Aucm9hbS5jb3JwLmdvb2dsZS5jb20vCj4gPiAmZ3Q7Cj4gPiAmZ3Q7ICZndDsgQm90aCBr
c19wY2llX3F1aXJrIGxvb25nc29uX21ycnNfcXVpcmsgd2FzIHJld3JpdHRlbiB3aXRob3V0IGFu
eQo+ID4gJmd0OyAmZ3Q7IGZ1bmN0aW9uYWxpdHkgY2hhbmdlcyBieSBvbmUgbXJyc19saW1pdF9x
dWlyawo+ID4gRG9lcyB0aGF0IG1lYW5zIGtleXN0b25lIGFuZCBMb29uZ3NvbiBoYXMgdGhlIHNh
bWUgTVJSUyBwcm9ibGVtPyBBbmQgd2hhdCBzaG91bGQgSSBkbyBub3c/Cj4gPgo+ID4gSHVhY2Fp
Cj4gPiAmZ3Q7ICZndDsKPiA+ICZndDsgJmd0OyBBZGRlZCBEZXNpZ25XYXJlIFBDSSBjb250cm9s
bGVyIHdoaWNoIG5lZWQgc2FtZSBxdWlyayBmb3IKPiA+ICZndDsgJmd0OyAqIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jIChQQ0lfREVWSUNFX0lEX1NZTk9QU1lTX0hBUFNV
U0IzKQo+ID4gJmd0OyAmZ3Q7Cj4gPiAmZ3Q7ICZndDsgVGhpcyBxdWlyayBjYW4gc29sdmUgc29t
ZSBpc3N1ZSBmb3IgS2hhZGFzIFZJTTMvVklNM0woQW1sb2dpYykKPiA+ICZndDsgJmd0OyB3aXRo
IEhETUkgc2NyYW1ibGVkIHBpY3R1cmUgYW5kIG52bWUgZGV2aWNlcyBhdCBpbnRlbnNpdmUgd3Jp
dGluZy4uLgo+ID4gJmd0OyAmZ3Q7Cj4gPiAmZ3Q7ICZndDsgY29tZSBmcm9tOgo+ID4gJmd0OyAm
Z3Q7ICogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNpLzIwMjEwNjE4MDYzODIxLjEz
ODMzNTctMS1hcnRAa2hhZGFzLmNvbS8KPiA+ICZndDsgJmd0Owo+ID4gJmd0OyAmZ3Q7IEFydGVt
IExhcGtpbiAoNCk6Cj4gPiAmZ3Q7ICZndDsgIFBDSTogbW92ZSBLZXlzdG9uZSBhbmQgTG9vbmdz
b24gZGV2aWNlIElEcyB0byBwY2lfaWRzCj4gPiAmZ3Q7ICZndDsgIFBDSTogY29yZTogcXVpcmtz
OiBhZGQgbXJyc19saW1pdF9xdWlyawo+ID4gJmd0OyAmZ3Q7ICBQQ0k6IGtleXN0b25lIG1vdmUg
bXJycyBxdWlyayB0byBjb3JlCj4gPiAmZ3Q7ICZndDsgIFBDSTogbG9vbmdzb24gbW92ZSBtcnJz
IHF1aXJrIHRvIGNvcmUKPiA+ICZndDsgJmd0Owo+ID4gJmd0OyAmZ3Q7IC0tCj4gPiAmZ3Q7ICZn
dDsgMi4yNS4xCj4gPiAmZ3Q7ICZndDsKPiA+Cj4gPgo+ID4gPC9jaGVuaHVhY2FpQGxvb25nc29u
LmNuPjwvZW1haWwydGVtYUBnbWFpbC5jb20+PC9oZWxnYWFzQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
