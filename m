Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43699C77B7A
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 May 2023 20:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=by0qvdOku6UAWeK2GKNze57c4dxYw2q4LskqxPijygU=; b=kZkTREz1A1Q5Ht
	KjqPv7plQSkWYFk2QyHJFAs3hKcnW/MbEMhDEa60RT6+zpKY38QVL2I/c0alo5CZdAONl3dKLHYe4
	ur918mJOwZU9dHO6NVLy4Bg2KhwR47JUzAl0Xe0ivwNXIDYcZ9XlWT+O/htTJaofpd5/Du0eJecvM
	ie0p4TpmFY77kvHxS5tpcScverkuK3AZxcaUcO8o2ZyI8TLNUWXl/KkAt9E6aBWe5g4ls2CEo446f
	/oah9yL5wD1oo3yuelfBlSG1JojPOVdOpsdkWmf1x6xpOaXcQBCLTOqjIe3VPMOXbQryDktJBqnTZ
	hj8AJeFBxnmU8k0HoM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjrx-00E3CM-0r;
	Thu, 18 May 2023 20:05:01 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzjru-00E3Ad-1U;
	Thu, 18 May 2023 20:05:00 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-96f5d651170so12177366b.1;
        Thu, 18 May 2023 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684440293; x=1687032293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dz/8MS7Lj7KmoyyTrLm++CyIRlPD4x/waiNz5/meCus=;
        b=NjGtnN1Mekg/KnyMcY5xayEbV0Y4bnlTPJhsEXA6VcI6P1h2dUq5mFbFxefAdSmz9c
         caEhSKdDftvK2RWaQDpqdQTFAiPGq/QLm5zOlJRFTm1webNMRCKbCUAenPBxlONPShHy
         iomEz7YWfFklxSutSM2/3llf6xWuUglUNsSMj1uMYfZg3N/N7BdDOsnbBBASeQOj57pD
         iTLgABWiJ+S/cfvIrPvTwPCbEfPNC0/AMGHTu1B8P2E88NHkSTjVOzUbQrvGvTrllBTV
         9u8VVLx+IgiK8uQZepaIs5+Cu0hr5Ctu5A0pVJhvpae8XiFBx488/OCWC8QHsyQLXpEr
         qEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684440293; x=1687032293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dz/8MS7Lj7KmoyyTrLm++CyIRlPD4x/waiNz5/meCus=;
        b=ZnAHzAdlHpkbFk4na6f/RwsRPjauZ+912exBwqU9x48Cow7Bk3rTA2V0bpqjkrvlQJ
         wJFRwmcPpyviiLvZ0Z8ntoG3SJ8TUmyboeTTCd8aXHwoOzlYdKn6AXpN0XK6TIbo+tki
         jB5r0GlIvuYfnO2xA567wCWxT0yobO1rOFpkrV4Tnf65fo4x/QnbZXumen39frPSBhMD
         YxNHjSwvYwd+iylL0vWOypmZh90rsGJgWDtzZkotRqRBCQvVUEWylWLkMeen3sX6+h2f
         m11X09Ixqdb4WXpK2p010DwH/30oSJp5o0GvlCJmvInH7/qx6rswoqzxXgQh5u9pqIah
         Mfqg==
X-Gm-Message-State: AC+VfDxsw9D+5QhJMGWBZIRYCrkJqBe7pWYxmq17h73Y9NSzh7ps+y3j
	ndHamwPavxXGHeNBHSjsBsSASRvvoBku4tO+Uk8=
X-Google-Smtp-Source: ACHHUZ4EBOtGVUrAip758uCZF+1h1aLN/sSTVQIUSACMMRvnCSHys6SxptJuy+0OrMe//0KPdz+gDV+lTDKBFqM4vWU=
X-Received: by 2002:a17:907:3f17:b0:94f:1d54:95d2 with SMTP id
 hq23-20020a1709073f1700b0094f1d5495d2mr7161796ejc.15.1684440292615; Thu, 18
 May 2023 13:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-7-ddrokosov@sberdevices.ru> <CAFBinCA2OhtVaCJDi8ZfAFLSE4oUgxYBDScaP_WW63curEK8Mg@mail.gmail.com>
 <20230512140630.qd33rwzaalmadpmk@CAB-WSD-L081021> <CAFBinCA8e9evk+9hTEgoNOD_+3DBst6vYDcradmr2c996jdUmw@mail.gmail.com>
 <20230517103456.p3sjxzbepvg7cr2r@CAB-WSD-L081021>
In-Reply-To: <20230517103456.p3sjxzbepvg7cr2r@CAB-WSD-L081021>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 May 2023 22:04:41 +0200
Message-ID: <CAFBinCCPf+asVakAxeBqV-jhsZp=i2zbShByTCXfYYAQ6cCnHg@mail.gmail.com>
Subject: Re: [PATCH v14 6/6] clk: meson: a1: add Amlogic A1 Peripherals clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_130458_500966_6E159F34 
X-CRM114-Status: GOOD (  30.30  )
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

SGkgRG1pdHJ5LAoKT24gV2VkLCBNYXkgMTcsIDIwMjMgYXQgMTI6MzTigK9QTSBEbWl0cnkgUm9r
b3Nvdgo8ZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKWy4uLl0KPiA+ID4gQWRkaXRp
b25hbGx5LCB0aGUgQ0NGIGRldGVybWluZXMgdGhlIGJlc3QgYW5jZXN0b3IgYmFzZWQgb24gaG93
IGNsb3NlCj4gPiA+IGl0cyByYXRlIGlzIHRvIHRoZSBnaXZlbiBvbmUsIGJhc2VkIG9uIGFyaXRo
bWV0aWMgY2FsY3VsYXRpb25zLiBIb3dldmVyLAo+ID4gPiB3ZSBoYXZlIGluZGVwZW5kZW50IGtu
b3dsZWRnZSB0aGF0IGEgY2VydGFpbiBjbG9jayB3b3VsZCBiZSBiZXR0ZXIsIHdpdGgKPiA+ID4g
bGVzcyBqaXR0ZXIgYW5kIGZld2VyIGludGVybWVkaWFyaWVzLCB3aGljaCB3aWxsIGxpa2VseSBp
bXByb3ZlIGVuZXJneQo+ID4gPiBlZmZpY2llbmN5LiBTYWRseSwgdGhlIENDRiBjYW5ub3QgdGFr
ZSB0aGlzIGludG8gYWNjb3VudC4KPiA+IEkgYWdyZWUgdGhhdCB0aGUgaW1wbGVtZW50YXRpb24g
aW4gQ0NGIGlzIGZhaXJseSBzaW1wbGUuIFRoZXJlJ3Mgd2F5cwo+ID4gdG8gdHJpY2sgaXQgdGhv
dWdoOiBJSVJDIGlmIHRoZXJlIGFyZSBtdWx0aXBsZSBlcXVhbGx5IHN1aXRhYmxlIGNsb2Nrcwo+
ID4gaXQgcGlja3MgdGhlIGZpcnN0IG9uZS4gRm9yIG1lIGFsbCBvZiB0aGlzIGhhcyB3b3JrZWQg
c28gZmFyIHdoaWNoIGlzCj4gPiB3aGF0IG1ha2VzIG1lIGN1cmlvdXMgaW4gdGhpcyBjYXNlIChu
b3Qgc2F5aW5nIHRoYXQgYW55dGhpbmcgaXMgd3JvbmcKPiA+IHdpdGggeW91ciBhcHByb2FjaCku
Cj4gPgo+ID4gRG8geW91IGhhdmUgYSAocmVhbCB3b3JsZCkgZXhhbXBsZSB3aGVyZSB0aGUgUlRD
IGNsb2NrIHNob3VsZCBiZQo+ID4gcHJlZmVycmVkIG92ZXIgYW5vdGhlciBjbG9jaz8KPiA+Cj4K
PiBZZXMsIGEgcmVhbC1saWZlIGV4YW1wbGUgaXMgdGhlIG5lZWQgZm9yIGEgMzJLaHogY2xvY2sg
Zm9yIGFuIGV4dGVybmFsCj4gd2lmaSBjaGlwLiBUaGVyZSBpcyBvbmUgb3B0aW9uIHRvIHByb3Zp
ZGUgdGhpcyBjbG9jayB3aXRoIGhpZ2gKPiBwcmVjaXNpb24sIHdoaWNoIGlzIFJUQyArIEdFTkNM
Sy4KPgo+ID4gSSdtIHRoaW5raW5nIGFib3V0IHRoZSBmb2xsb3dpbmcgc2NlbmFyaW8uCj4gPiBQ
V00gcGFyZW50czoKPiA+IC0gWFRBTDogMjRNSHoKPiA+IC0gc3lzOiBub3Qgc3VyZSAtIGxldCdz
IHNheSAxNjYuNjdNSHoKPiA+IC0gUlRDOiAzMmtIego+ID4KPiA+IFRoZW4gYWZ0ZXIgdGhhdCB0
aGVyZSdzIGEgZGl2aWRlciBhbmQgYSBnYXRlLgo+ID4KPiA+IExldCdzIHNheSB0aGUgUFdNIGNv
bnRyb2xsZXIgbmVlZHMgYSAxTUh6IGNsb2NrOiBpdCBjYW4gdGFrZSB0aGF0IGZyb20KPiA+IFhU
QUwgb3Igc3lzLiBTaW5jZSBYVEFMIGlzIGV2ZW5seSBkaXZpc2libGUgdG8gMU1IeiBDQ0Ygd2ls
bCBwaWNrIHRoYXQKPiA+IGFuZCB1c2UgdGhlIGRpdmlkZXIuCj4gPiBCdXQgbGV0J3Mgc2F5IHRo
ZSBQV00gY29udHJvbGxlciBuZWVkcyBhIDMya0h6IGNsb2NrOiBDQ0Ygd291bGQKPiA+IGF1dG9t
YXRpY2FsbHkgcGljayB0aGUgUlRDIGNsb2NrLgo+ID4gU28gaXMgeW91ciBpbXBsZW1lbnRhdGlv
biB0aGVyZSB0byBjb3ZlciBsZXQncyBzYXkgMWtIeiB3aGVyZQo+ID4gbWF0aGVtYXRpY2FsbHkg
MjRNSHogY2FuIGJlIGRpdmlkZWQgZXZlbmx5IHRvIDFrSHogKGFuZCB0aHVzIHNob3VsZAo+ID4g
bm90IHJlc3VsdCBpbiBhbnkgaml0dGVyKSBidXQgUlRDIGdpdmVzIGJldHRlciBwcmVjaXNpb24g
aW4gdGhlIHJlYWwKPiA+IHdvcmxkIChldmVuIHRob3VnaCBpdCdzIG9mZiBieSAyNEh6KT8KPiA+
Cj4KPiBJIGRvbid0IHRoaW5rIHNvLiBUaGUgaGlnaGVzdCBwcmVjaXNpb24gdGhhdCBSVEMgY2Fu
IHByb3ZpZGUgaXMgZnJvbSBhCj4gMzJLSHogcmF0ZSBvbmx5LiBIb3dldmVyLCBJIGJlbGlldmUg
dGhhdCBhIDFrSHogZnJlcXVlbmN5IGNhbiBhbHNvIGJlCj4gYWNoaWV2ZWQgYnkgdXNpbmcgeHRh
bCAyNE1IeiB3aXRoIGEgZGl2aWRlciwgd2hpY2ggY2FuIHByb3ZpZGUgaGlnaAo+IHByZWNpc2lv
biBhcyB3ZWxsLgpUaGFuayB5b3UgYWdhaW4gZm9yIHRoZSBncmVhdCBkaXNjdXNzaW9uIG9uIElS
QyB0b2RheS4KSGVyZSdzIG15IHNob3J0IHN1bW1hcnkgc28gSSBkb24ndCBmb3JnZXQgYmVmb3Jl
IHlvdSdsbCBmb2xsb3cgdXAgb24gdGhpcy4KCkluIGdlbmVyYWwgdGhlcmUncyB0d28ga25vd24g
Y2FzZXMgd2hlcmUgdGhlIFJUQyBjbG9jayBuZWVkcyB0byBiZSB1c2VkOgphKSBXaGVuIHVzaW5n
IHRoZSBHRU5DTEsgb3V0cHV0IG9mIHRoZSBTb0MgdG8gb3V0cHV0IHRoZSAzMmtIeiBSVEMKY2xv
Y2sgYW5kIGNvbm5lY3QgdGhhdCB0byBhbiBTRElPIFdpRmkgY2hpcCBjbG9jayBpbnB1dCAodGhp
cyBzZWVtcwp1c2VmdWwgaW4gbXkgdW5kZXJzdGFuZGluZyBiZWNhdXNlIHRoZSBSVEMgY2xvY2sg
cHJvdmlkZXMgaGlnaApwcmVjaXNpb24pCmIpIFdoZW4gdXNpbmcgdGhlIFBXTSBjb250cm9sbGVy
IHRvIG91dHB1dCBhIDMya0h6IGNsb2NrIHNpZ25hbC4gSW4KdGhpcyBjYXNlIG15IHVuZGVyc3Rh
bmRpbmcgaXMgdGhhdCB1c2luZyB0aGUgUlRDIGNsb2NrIGFzIGlucHV0IHRvIHRoZQpQV00gY29u
dHJvbGxlciByZXN1bHRzIGluIHRoZSBiZXN0IHBvc3NpYmxlIHNpZ25hbAoKVGhlIHNlY29uZCBj
YXNlIHdvbid0IGJlIHN1cHBvcnRlZCB3aXRoIEhlaW5lcidzIHBhdGNoZXMgWzBdIHRoYXQgdXNl
CkNDRiAoY29tbW9uIGNsb2NrIGZyYW1ld29yaykgaW4gdGhlIFBXTSBjb250cm9sbGVyIGRyaXZl
ci4KSW4gdGhpcyBzZXJpZXMgdGhlIHBhcmVudCBjbG9jayBpcyBjYWxjdWxhdGVkIHVzaW5nOgog
IGZyZXEgPSBkaXY2NF91NjQoTlNFQ19QRVJfU0VDICogKHU2NCkweGZmZmYsIHBlcmlvZCk7CgpB
IDMya0h6IGNsb2NrIG1lYW5zIGEgUFdNIHBlcmlvZCBvZiAzMDUxOG5zLiBTbyB3aXRoIHRoZSBh
Ym92ZQpjYWxjdWxhdGlvbiB0aGUgUFdNIGRyaXZlciBpcyBhc2tpbmcgZm9yIGEgY2xvY2sgcmF0
ZSBvZiA+PTJHSHouCldlIGNvbmNsdWRlZCB0aGF0IGxldHRpbmcgdGhlIGNvbW1vbiBjbG9jayBm
cmFtZXdvcmsgY2hvb3NlIHRoZSBiZXN0CnBvc3NpYmxlIHBhcmVudCAobWVhbmluZzogcmVtb3Zp
bmcgQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5UIGhlcmUpIGNhbgpiZSBhIHdheSBmb3J3YXJkLgpC
dXQgdGhpcyBtZWFucyB0aGF0IHRoZSBQV00gY29udHJvbGxlciBkcml2ZXIgbXVzdCB0cnkgdG8g
ZmluZCB0aGUKYmVzdCBwb3NzaWJsZSBwYXJlbnQgc29tZWhvdy4gVGhlIGVhc2llc3Qgd2F5IHdl
IGNhbWUgdXAgd2l0aAoocHNldWRvLWNvZGUpOgogIGZyZXEgPSBOU0VDX1BFUl9TRUMgLyBwZXJp
b2Q7CiAgZmluX2ZyZXEgPSBjbGtfcm91bmRfcmF0ZShjaGFubmVsLT5jbGssIGZyZXEpOwogIGlm
IChmaW5fZnJlcSAhPSBmcmVxKSB7CiAgICBmcmVxID0gZGl2NjRfdTY0KE5TRUNfUEVSX1NFQyAq
ICh1NjQpMHhmZmZmLCBwZXJpb2QpOwogICAgZmluX2ZyZXEgPSBjbGtfcm91bmRfcmF0ZShjaGFu
bmVsLT5jbGssIGZyZXEpOwogIH0KClRoZSBpZGVhIGlzOiBmb3IgYSByZXF1ZXN0ZWQgMzJrSHog
c2lnbmFsIHRoZSBQV00gcGVyaW9kIGlzIDMwNTE4bnMuClRoZSB1cGRhdGVkIGxvZ2ljIHdvdWxk
IGZpbmQgdGhhdCB0aGVyZSdzIGEgbWF0Y2hpbmcgY2xvY2sgaW5wdXQgYW5kCnVzZSB0aGF0IGRp
cmVjdGx5LiBJZiBub3Q6IHVzZSB0aGUgb3JpZ2luYWwgbG9naWMgYXMgc3VnZ2VzdGVkIGJ5Ckhl
aW5lci4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKClswXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1hbWxvZ2ljLzlmYWNhMmU2LWI3YTEtNDc0OC03ZWIwLTQ4ZjgwNjRlMzIzZUBnbWFp
bC5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
