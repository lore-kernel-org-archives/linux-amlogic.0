Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE677C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 14:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9Ec0GHk7VUZ29pJOldj00W2kWZmFckIEVJaehB7/58=; b=CTt3O/QxZ1jpJq
	PEmli5Fi07wUE/VlfiTdl8LtP0IkIaGqR+eX7MlMCiRxD6El9/qSKOppSCnDzDbuP9nPp+PqVOamT
	7PU/BM/Tx+2LCq+qYZLZt3oqbWAWo9M2Bcn8Od/XexijVZM+XuDE21D04IDAxCCfSdwq5ogquY6Ab
	022eWUsf9qMTFiH6UAN+v8Yrhj2FsIgq5vWry+ecUJAQM3+QiUzp31FDH23OupWjUjup3G/f1CZsr
	IClUy8Fwd8niFCpu4EJa7Z4cqxdrMl4OAIUudmMTZdGi+/rWXcjKQfUlg/FWtiecusHY8iGmBRLkd
	0VfiZnXMTDT4WaMmvYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWTJ-009xaW-3O; Tue, 22 Feb 2022 14:48:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWT4-009xY2-IZ
 for linux-amlogic@lists.infradead.org; Tue, 22 Feb 2022 14:48:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id i20so1333840wmc.3
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Feb 2022 06:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tnceEeGnrcuJoNr0+Cgdwzi8bAtUJ8PrVOXTOsxGiv8=;
 b=BLNhsgYEBr+ldXVFFu/RqMuSdMknUikmOnh+8PhlpuW1sex7DrIgwqFbS79lt+/9Fj
 eXInu65RHdP9/RaAHHicAaBN23Jee6z4YfIKtTIt5jhBGbqSiH7zL35GymIk22sC0g08
 xHnyW1O0Im9gXYw7vKouOD2AAfu9LV+0K8noU24UdxG4szvFdJUX2OduZ/J4gioREeSO
 rGi4r5uVVa5HGCmYasymCdXYxR8jfWbRpPEcq1o2WuKlizofX49G9sUG9u8gG2zzYnje
 o4Ls8K10TAvHE/L/3CEwzT4fE5T6Z0tH/BQ0dAQMzo9dYX/eGOUmj6BUbtKHQO3073vD
 /DQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tnceEeGnrcuJoNr0+Cgdwzi8bAtUJ8PrVOXTOsxGiv8=;
 b=lg5WiakC3p6JAkHB92/eqJT+uiuCz5TMxOSoVWtAjBOI5NYmpXbw+uFr/H8jBKkMs7
 lIGsWGLP+p9/DC/RSI3efKQlIZkTBatBEUS90VdFoh0J8v6oCkMtFSJQbhiZrotlESeu
 VYLt+7AWZETT7hjp974Zz1eFiUSRCiMrHnaVSm5hm1lFPNIoBwjLNhGGhhN8Th1oUvgC
 GOftlK1n6XK5bBH/mKY033ANsE+p3Ze2hj0THF8ref4qpkWmIIi4PP7DLuO0INnoA5ME
 bxvT+94S5WpFLIs89oQUWOIzaMNXbqqNRO3+BMCrnKMtu3x0vRl6m7Y+e6AcSL+0xOze
 /PFA==
X-Gm-Message-State: AOAM5315l4uG9Whhhlp8QsMOpinz3d/q0AAGf62su/BwYrSkge+kRcQ7
 zH5lLIBbbrgz8jUGU1qAGlYWyQ==
X-Google-Smtp-Source: ABdhPJzHLE6QCDQn+Ao6ARDEbUXD14NHh4L6o7VCIBQ8a6PNAyJ3LeVtt+yRC0QvCiQEGnMDHYR1+Q==
X-Received: by 2002:a05:600c:3217:b0:380:e2a3:18cf with SMTP id
 r23-20020a05600c321700b00380e2a318cfmr1613415wmp.129.1645541319974; 
 Tue, 22 Feb 2022 06:48:39 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:8df:a253:2751:6a9c?
 ([2001:861:44c0:66c0:8df:a253:2751:6a9c])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c0b4400b0034a0cb4332csm2514284wmr.10.2022.02.22.06.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 06:48:39 -0800 (PST)
Message-ID: <1530c337-22b5-b20d-27ae-50696344e80f@baylibre.com>
Date: Tue, 22 Feb 2022 15:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
Content-Language: en-US
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
 <CANiq72mi5fj07cfo6T4jPmp=EiRtE_uDeHHCqjG9h+duPrUMKg@mail.gmail.com>
 <ecdbfb3a-e214-a059-95b9-1ebf2f625295@gmail.com>
 <862fc0e3-6c76-8dea-6725-a6c45ade1ecd@suse.de>
 <09bf3d8a-2902-723b-80d2-0c4d1c24f53d@gmail.com>
 <a890337b-39e4-f796-2d53-05edd2d69c80@suse.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <a890337b-39e4-f796-2d53-05edd2d69c80@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_064842_705301_657FA48B 
X-CRM114-Status: GOOD (  34.42  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjIvMDIvMjAyMiAxMzoxMiwgQW5kcmVhcyBGw6RyYmVyIHdyb3RlOgo+IE9uIDE5LjAyLjIy
IDE4OjE2LCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6Cj4+IE9uIDE5LjAyLjIwMjIgMTc6MDcsIEFu
ZHJlYXMgRsOkcmJlciB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDE5LjAyLjIyIDE0OjM3LCBI
ZWluZXIgS2FsbHdlaXQgd3JvdGU6Cj4+Pj4gT24gMTkuMDIuMjAyMiAxNDoyNywgTWlndWVsIE9q
ZWRhIHdyb3RlOgo+Pj4+PiBPbiBTYXQsIEZlYiAxOSwgMjAyMiBhdCAyOjEzIFBNIEhlaW5lciBL
YWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IFRoaXMg
c2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFRpdGFubWVjIFRNMTYyOCA3IHNlZ21lbnQgZGlz
cGxheQo+Pj4+Pj4gY29udHJvbGxlci4gSXQncyBiYXNlZCBvbiBwcmV2aW91cyBSRkMgd29yayBm
cm9tIEFuZHJlYXMgRsOkcmJlci4KPj4+Pj4+IFRoZSBSRkMgdmVyc2lvbiBwbGFjZWQgdGhlIGRy
aXZlciBpbiB0aGUgTEVEIHN1YnN5c3RlbSwgYnV0IHRoaXMgd2FzCj4+Pj4+PiBOQUsnZWQgYnkg
dGhlIExFRCBtYWludGFpbmVyLiBUaGVyZWZvcmUgSSBtb3ZlZCB0aGUgZHJpdmVyIHRvCj4+Pj4+
PiAvZHJpdmVycy9hdXhkaXNwbGF5IHdoYXQgc2VlbXMgbW9zdCByZWFzb25hYmxlIHRvIG1lLgo+
Pj4+Pgo+Pj4+PiBDb3VsZCB5b3UgcGxlYXNlIGxpbmsgdG8gdGhlIGRpc2N1c3Npb24gYW5kL29y
IHN1bW1hcml6ZSB0aGUgcmF0aW9uYWxlCj4+Pj4+IGJlaGluZCB0aGUgTkFLPwo+Pj4+Pgo+Pj4+
Cj4+Pj4gK1BhdmVsCj4+Pj4KPj4+PiBJIGRpZG4ndCBmaW5kIGFuIGV4cGxpY2l0IHJlYXNvbiwg
YnV0IEkgc3VwcG9zZSBQYXZlbCBzZWVzIHRoaXMgZHJpdmVyIGFzCj4+Pj4gb25lIHRoYXQgbWFr
ZXMgdXNlIG9mIHRoZSBMRUQgc3Vic3lzdGVtLCBidXQgZG9lc24ndCBiZWxvbmcgdG8gaXQuCj4+
Pj4gSW4gdGhlIGZvbGxvd2luZyBtYWlsIGhlJ3MgZXhwcmVzc2luZyBoaXMgb3BpbmlvbiB0aGF0
IHRoZSBkcml2ZXIgc2hvdWxkCj4+Pj4gYmUgYmVzdCBwbGFjZWQgdW5kZXIgYXV4ZGlzcGxheS4K
Pj4+Pgo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMDAy
MjYxMzAzMDAuR0IyODAwQGR1by51Y3cuY3ovCj4+Pgo+Pj4gQW5kIEkgZGlzYWdyZWVkLiBJdCBk
b2VzIG5vdCBmaXQgd2l0aCB0aGUgb3RoZXIgZHJpdmVycyBpbiBhdXhkaXNwbGF5Cj4+PiB0aGF0
IHdlcmUgb3BlcmF0aW5nIG9uIGEgbXVjaCBoaWdoZXIgbGV2ZWwuCj4+Pgo+Pgo+PiBXZSBuZWVk
IHRvIGZpbmQgYSBwbGFjZS4gQW5kIGlmIFBhdmVsIGhhcyBnb29kIHJlYXNvbnMgdGhhdCBpdCBk
b2Vzbid0Cj4+IGZpdCBpbnRvIHRoZSBMRUQgc3Vic3lzdGVtLCBhbmQgTWlndWVsIHNob3VsZCBi
ZSBmaW5lIHdpdGggaGF2aW5nCj4+IGl0IGluIGF1eGRpc3BsYXksIHRoZW4gSSdkIHNlZSBubyBy
ZWFzb24gdG8gbm90IGdvIHRoaXMgd2F5Lgo+Pgo+Pj4gSSdkIGFsc28gbGlrZSB0byBwb2ludCBv
dXQgdGhhdCBJIGRpZCBpbXBsZW1lbnQgdGhlIG1hcF90b183c2VnbWVudCBBUEksCj4+Cj4+IExv
b2tpbmcgYXQgdGhlIGhpc3Rvcnkgb2YgaW5jbHVkZS91YXBpL2xpbnV4L21hcF90b183c2VnbWVu
dC5oIEkgc2VlIG5vCj4+IGNvbW1pdCBmcm9tIHlvdS4gU2VlbXMgSSdtIG1pc3Npbmcgc29tZXRo
aW5nIGhlcmUuCj4gCj4gWW91J3JlIHJlcGx5aW5nIGlubGluZSB0b28gZWFybHk6Cj4gCj4+PiBh
cyB3YXMgc3VnZ2VzdGVkLCBhcyB5b3Ugd2lsbCBmaW5kIGluIG15IHRyZWUKPiAKPiBBcyBJIHNh
aWQsIEkgaW1wbGVtZW50ZWQgaXQgaW4gbXkgZHJpdmVyOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9hZmFlcmJlci9saW51eC9jb21taXQvYmJlY2Y5NTEzNDhjN2RlOGJhOTIyYzZjMDAyYTA5MzY5
YjcxN2Q4Mgo+IAo+IFRodXMgbWUgc2F5aW5nIHlvdSBhcmUgdW5uZWNlc3NhcmlseSBkdXBsaWNh
dGluZyB3b3JrIHRoYXQgSSBhbHJlYWR5Cj4gZGlkLCB3aXRob3V0IHBpbmcnaW5nIHRoZSB0aHJl
YWQgb3IgbWUgYW5kIGNsYWltaW5nIHRoZSBjcmVkaXQgZm9yIGFuCj4gaW1wbGVtZW50YXRpb24g
Y2hhbmdlIHdoaWNoIEkgYWxyZWFkeSBkaWQgbXlzZWxmLgo+IAo+Pj4gLSB3aGljaCB5b3UgbWF5
IGhhdmUKPj4+IG1pc3NlZCwgcmVmZXJlbmNpbmcgb25seSB0aGUgUkZDIHBhdGNoc2V0IGFuZCBw
dXR0aW5nIHlvdXIgYXV0aG9yc2hpcCBvbgo+Pj4gaXQgZXhjbHVzaXZlbHk/IEEgbW92ZSBmcm9t
IG9uZSBkaXJlY3RvcnkgdG8gYW5vdGhlciBzaG91bGQgbm90IHdhcnJhbnQKPj4+IG15IGF1dGhv
ciBhbmQgU29CIGdldHRpbmcgcmVtb3ZlZCBmcm9tIHRoZSBhY3R1YWwgZHJpdmVyLgo+Pj4KPj4g
VGhlIGRyaXZlciBpbmNsdWRlcyBtYWpvciBjaGFuZ2VzIGFuZCBJIG1lbnRpb25lZCB5b3VyIHdv
cmsgaW4gdGhlIGNvbW1pdAo+PiBtZXNzYWdlLiBBbHNvIHlvdXIgc3RpbGwgbGlzdGVkIGFzIE1P
RFVMRV9BVVRIT1IuIE15IGludGVudGlvbiBpcyB0bwo+PiBnZXQgYSBkcml2ZXIgdXBzdHJlYW0s
IG5vdCB0byBlYXJuIGNyZWRpdHMgZm9yIHNvbWV0aGluZy4KPj4gU28gc3VyZSwgeW91ciBTb0Ig
Y2FuIGJlIChyZS0pYWRkZWQuCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2FmYWVyYmVyL2xpbnV4
L2NvbW1pdHMvcnRkMTI5NS1uZXh0Cj4gCj4gQWxzbyBub3RlIHRoaXMgNS1pbi00IG9wdGltaXph
dGlvbjoKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vYWZhZXJiZXIvbGludXgvY29tbWl0L2ZmODI4
NGI2ZWQ5ZGMxZTM1NGMzNTg0MGFmZGFmNTBiMWNkOTdmZWEKPiAKPiBBbmQgc2V2ZXJhbCBtb3Jl
IGNoaXBzZXRzIGJlaW5nIGNvdmVyZWQuCj4gCj4+PiBHaXZlbiB0aGF0IHdlIG5lZWQgdG8gbWFu
YWdlIGEgYnVmZmVyIHdpdGggYml0cyBwZXIgc2VnbWVudCBvciBMRUQKPj4+IHN5bWJvbCwgb25l
IGlkZWEgdGhhdCBJIGhhdmVuJ3QgZm91bmQgdGltZSBmb3IgeWV0IHdhcyB0byBpbXBsZW1lbnQg
aXQKPj4+IGFzIGZyYW1lYnVmZmVyIG9yIGRybSBkZXZpY2UgaW5zdGVhZC4gKEFuZCBtb3N0IFJl
YWx0ZWsgcGxhdGZvcm1zIGdvdAo+Pj4gYnJva2VuIGJ5IHJlbW92aW5nIHRoZSBhZGp1c3RhYmxl
IHRleHQgYmFzZSBkZWZpbmVzLikKPj4+Cj4+IEknbSBub3QgYXdhcmUgb2YgdGhlIFJlYWx0ZWsg
cGxhdGZvcm0gaXNzdWUsIGRvIHlvdSBoYXZlIGEgbGluayB0byBhCj4+IHJlbGF0ZWQgZGlzY3Vz
c2lvbj8KPiAKPiBSZWFsdGVrIGhhcyBhIGJvb3QgUk9NIGF0IHRoZSBiZWdpbm5pbmcgb2YgbWVt
b3J5IHNwYWNlLCB3aGljaCBoYXMgYmVlbgo+IGEgcHJvYmxlbSBmcm9tIHRoZSBmaXJzdCBSRkMg
YW5kIGZvciBtb3N0IGJvb3Rsb2FkZXJzIHJlcXVpcmVkIHRvIHR3ZWFrCj4gdGhlIGtlcm5lbCdz
IHRleHQgb2Zmc2V0IGZvciBzdWNjZXNzZnVsIGJvb3QuIChTb21lIG5vdCBPcGVuIFNvdXJjZSAo
TEspCj4gYW5kL29yIG5vdCBvcGVubHkgZmxhc2hhYmxlLikKPiAKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtYXJtLWtlcm5lbC8yMDE3LUZlYnJ1YXJ5LzQ4Nzcx
OC5odG1sCj4gCj4gSW4gMjAyMCB0aGF0IGFybTY0IGZlYXR1cmUgZ290IHJlbW92ZWQgd2l0aG91
dCBhbnkgZnVydGhlciBkaXNjdXNzaW9uOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDIwMDgyNTEzNTQ0MC4xMTI4OC0xLWFyZGJAa2VybmVsLm9yZy8KCk5vdGUgdGhlIFRFWFRf
T0ZGU0VUIGlzIG9ubHkgYW4gaXNzdWUgd2l0aCBBbWxvZ2ljIHZlbmRvciBib290bG9hZGVyLApp
dCBoYXMgbmV2ZXIgYmVlbiBhbiBpc3N1ZSB3aXRoIG1haW5saW5lIFUtQm9vdC4KCk5laWwKCj4g
Cj4gSSd2ZSB0cmllZCB0byByZXZlcnQgaXQsIGJ1dCB0aGF0J3MgYmVlbiBhIHBhaW46Cj4gCj4g
aHR0cHM6Ly9naXRodWIuY29tL2FmYWVyYmVyL2xpbnV4L2NvbW1pdC8wZDJjNjQ3NzgxYmM4OWVl
OTViZmE3YjgwZDcxMjM3YzdlYmVhMjMwCj4gCj4+IEFuZCB3b3VsZG4ndCB5b3UgdGhpbmsgaXQn
cyBvdmVyZW5naW5lZXJpbmcgdG8KPj4gd3JpdGUgYSBEUk0gZHJpdmVyIGZvciBhIDcgc2VnbWVu
dCBkaXNwbGF5IHdpdGggNCBkaWdpdHM/Cj4+IEZyYW1lYnVmZmVyIHNlZW1zIHRvIGJlIGRlcHJl
Y2F0ZWQgYmFzZWQgb24gbXkgZXhwZXJpZW5jZSB3aXRoCj4+IHB5Z2FtZSAvIFNETDIuCj4gCj4g
SXMgdGhlcmUgYW55IG90aGVyIEFQSSB0aGF0IHdvdWxkIGFsbG93IHVzZXJzcGFjZSB0byB3cml0
ZSB0byB0aGUgYnVmZmVyCj4gYW5kIGJpdGJsdCBwYXJ0cyB0byB0aGUgU1BJIGRldmljZT8KPiAK
PiBUaGlua2luZyBvZiBzb21lIG9wdGltaXphdGlvbnMgSSBpbXBsZW1lbnRlZCBpbiBteSBkcml2
ZXIgdG8gYXZvaWQKPiB1bm5lY2Vzc2FyeSBTUEkgdHJhbnNmZXJzOgo+IAo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9hZmFlcmJlci9saW51eC9jb21taXQvNDZjNDAyMDlkYjE2M2E4MTQ3NGM2ODk0ZWJi
ZDkwYjVlMjM4Y2U2MAo+IAo+IFJlZ2FyZHMsCj4gQW5kcmVhcwo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
