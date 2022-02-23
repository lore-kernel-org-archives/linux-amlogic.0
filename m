Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3E6C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 22:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Dt3uaLktl3+mmdO8ayqZeNn+5j4a8oJl1z+lVC+d9k=; b=BD0z/FBqkO3tyb
	w0bX/FaPi964G7g4uX+9T4WH0GnQ/8U4oolBelnbd37u6ae1EEx/5EI+VVHMpB0iFEdivLKEZJNFH
	W7P13qh/vnaWG6FSFkoXZ2u4txUvEjuWaq0DJndpP8UJ+a9svzrjVhVwP2dxEGXvT5JeEgG5R5qHb
	do9n0jcJPlpAcEjWQ5w7EXbbRatOAVwV8MiJE5r3aCe5DR9RtydO1DOV35+G5VaSWs0H/T0yTRkj8
	yHN+SSLk7FWcabNDFzN7eqwqFy3XbdZXwBckW61ND1U10LmBVC9lRFAGQ9uBR233T5kvktqsxfXTu
	IwQv3Jc27mX4SELLXhnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN09r-00GBij-8l; Wed, 23 Feb 2022 22:30:51 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN09e-00GBhv-Oi; Wed, 23 Feb 2022 22:30:40 +0000
Received: by mail-ed1-x536.google.com with SMTP id q17so372633edd.4;
 Wed, 23 Feb 2022 14:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=wkowMWok6XEoIKHqNibOAjVH0L4iPDJn35m1Kvj6PGA=;
 b=hIP8dw+codHbK47eoDosjIYyF1z1RUaqiZivtKde5D7YBr2iSy/VDehVLERsoUQ7OG
 n/JVAZqsQ7MrSLef+sG4pz1ixpHcuxPAGF1nE6hXnEAgJaQ06WYVvhz2cxOBnZETXXhM
 NTcCeTCP9sKX3AayfnD9nyAT5d8LD0/80xecORrNy74HlPbNQJGe7fXPNzFf5mDxBtdl
 Dkg1C+ha2s4QhKJKcaNwowBGL3d+EkFJ5xeqngM32ZSaIW4emZKCdMxEtoNuxaxTrJ6B
 NBA2n9SntFzN3ZpvQsjbPzf4BxiaxDX0icJaXmrTSAwIxCST1XihpcleO5KRgyjYGcbf
 3G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=wkowMWok6XEoIKHqNibOAjVH0L4iPDJn35m1Kvj6PGA=;
 b=CQAjRIDnrY1SqaUgQSrh2Mc16TDXA0zkuQjQlIehbP6qLRcgByApYlHvi39OUwGHSn
 2z7LYhmVletZ/BuFlYa/T/e+76E5csOBScM2Fr6R2cFJQzA6pOPwGapoPk1pQ0gCWwVj
 3+Qy3wRqsfLjHRhii16MRUsrDnSkEsHweuiO226g0e3mw3WKMiTxUB+Sp5OkAGkULVzy
 RPUvrcz2RJkUXPUDP5394p3u0tf1VXsj6KV8rRpw474J3qLd5W5qiVOtx4IqbscYzj8s
 xwtT0tGgXF15IXG8LKSU0xSo/QQu8rn+xn6yU6ODZRgW9Se2yW11BTndLFfCvHUK5Drs
 SnIg==
X-Gm-Message-State: AOAM533NJRxc+nT72YG/l5ICAx+tNZ6wIv6GyXbtqyXGVkaJBLMg/thf
 fbcvTuSa2O1KoajDjZjRJTNM8+5F5To=
X-Google-Smtp-Source: ABdhPJyiEcVd+tnECl8WhcHzlQsi8pEKClO0W1col8AmsEuH73thlYpjX5WwcOIXFyqcX3lsPb2KSA==
X-Received: by 2002:a50:fc05:0:b0:408:4d18:5070 with SMTP id
 i5-20020a50fc05000000b004084d185070mr1433614edr.365.1645655435077; 
 Wed, 23 Feb 2022 14:30:35 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:d12c:c0a:f603:b44d?
 (p200300ea8f4d2b00d12c0c0af603b44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:d12c:c0a:f603:b44d])
 by smtp.googlemail.com with ESMTPSA id hs25sm375759ejc.172.2022.02.23.14.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 14:30:34 -0800 (PST)
Message-ID: <9ae04fdb-7cc1-bea9-e7e1-ebc950bc592e@gmail.com>
Date: Wed, 23 Feb 2022 23:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
 <944317db-b659-cb36-addf-c33623a4ff60@gmail.com>
 <CANiq72kdeuJhaEUOBAB3uYm9SA4Wm0U5=DNgxFMxiGDacUgaBA@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 4/5] auxdisplay: add support for Titanmec TM1628 7
 segment display controller
In-Reply-To: <CANiq72kdeuJhaEUOBAB3uYm9SA4Wm0U5=DNgxFMxiGDacUgaBA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_143038_813895_6C1F935F 
X-CRM114-Status: GOOD (  36.44  )
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

T24gMjMuMDIuMjAyMiAyMToyOCwgTWlndWVsIE9qZWRhIHdyb3RlOgo+IE9uIFdlZCwgRmViIDIz
LCAyMDIyIGF0IDc6MDIgUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4g
d3JvdGU6Cj4+Cj4+IENvLURldmVsb3BlZC1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQx
QGdtYWlsLmNvbT4KPiAKPiBJZiB5b3UgKEhlaW5lcikgYXJlIGdvaW5nIHRvIGJlIHRoZSAiRnJv
bSIgYXV0aG9yLCB0aGVuIHRoaXMgbGluZQo+IHNob3VsZCBub3QgYmUgaGVyZS4KPiAKPj4gKyAg
ICAgICAgIFNheSBZIHRvIGVuYWJsZSBzdXBwb3J0IGZvciBUaXRhbiBNaWNybyBFbGVjdHJvbmlj
cyBUTTE2MjgKPj4gKyAgICAgICAgIExFRCBjb250cm9sbGVyLgo+PiArICAgICAgICAgSXQncyBh
IDMtd2lyZSBTUEkgZGV2aWNlIGNvbnRyb2xsaW5nIGEgdHdvLWRpbWVuc2lvbmFsIGdyaWQgb2YK
Pj4gKyAgICAgICAgIExFRHMuIERpbW1pbmcgaXMgYXBwbGllZCB0byBhbGwgb3V0cHV0cyB0aHJv
dWdoIGFuIGludGVybmFsIFBXTS4KPiAKPiBNYXliZSBhIG5ld2xpbmUgYmV0d2VlbiBwYXJhZ3Jh
cGhzPwo+IApPSwoKPj4gKyAqIENvcHlyaWdodCAoYykgMjAxOSBBbmRyZWFzIEbDpHJiZXIKPiAK
PiAuLi5oZXJlOiBzaG91bGQgdGhlcmUgYmUgZW50cmllcyBmb3IgeW91IChIZWluZXIpIHRvbz8g
SWYgbm90LCBzaG91bGQKPiBBbmRyZWFzIGJlIHRoZSAiRnJvbSIgYXV0aG9yPwo+IAo+IFRoaXMg
YWxzbyBhcHBsaWVzIHRvIHRoZSBgTU9EVUxFX0FVVEhPUmAuCj4gCj4gQWxzbyBpdCBtYXkgYmUg
YSBnb29kIGlkZWEgdG8gYWRkIHRoZSBlbWFpbHM6Cj4gCj4gICAgIE1PRFVMRV9BVVRIT1IoIkFu
ZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4iKTsKPiAgICAgTU9EVUxFX0FVVEhPUigi
SGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4iKTsKPiAKPiAoWW91IG1heSBh
bHNvIHdhbnQgdG8gY29uc2lkZXIgYWRkaW5nIGFuIGVudHJ5IG9uIGBNQUlOVEFJTkVSU2ApLgo+
IAoKTWF5YmUgd2Ugc2hvdWxkIGhhdmUgYm90aCBuYW1lcyBpbiBhbGwgcGxhY2VzIHlvdSBtZW50
aW9uZWQuCkknZCBiZSBmaW5lIHdpdGggYmVpbmcgbGlzdGVkIGFzIG1haW50YWluZXIuCgpAQW5k
cmVhczogQWZ0ZXIgeW91IHdyb3RlIHRoZSBpbml0aWFsIGNvZGUgYW5kIEkgcmV3cm90ZSBiaWdn
ZXIKcGFydHMgb2YgaXQ6IERvIHlvdSB3YW50IHRvIGJlIGxpc3RlZCBhcyBtYWludGFpbmVyIHRv
bz8KQW5kIGFueSByZW1hcmsgb24gdGhlIHF1ZXN0aW9ucyByYWlzZWQgYnkgTWlndWVsPwoKPj4g
KyAgICAgICB1OCBjbWQgPSBUTTE2MjhfQ01EX0RJU1BMQVlfTU9ERSB8IGdyaWRfbW9kZTsKPiAK
PiBDb25zaWRlciB1c2luZyBgY29uc3RgIGZvciBzb21lIG9mIHRoZSB2YXJpYWJsZXMuCj4gCk9L
Cgo+PiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBzLT5ncmlkX3NpemU7IGkrKykgewo+PiArICAg
ICAgICAgICAgICAgaW50IHBvcyA9IHMtPmdyaWRbaV0gLSAxOwo+PiArCj4+ICsgICAgICAgICAg
ICAgICBpZiAoaSA8IG1zZ19sZW4pIHsKPiAKPiBDb25zaWRlciBpbnZlcnRpbmcgdGhlIGNvbmRp
dGlvbiwgZG9pbmcgdGhlIHNldCB0byBgMGAgKyBgY29udGludWU7YAo+IHRvIGF2b2lkIHRoZSBp
bmRlbnRhdGlvbi4KPiAKT0sKCj4+ICsgICAgICAgc3RydWN0IHRtMTYyOF9sZWQgKmxlZCA9IGNv
bnRhaW5lcl9vZihsZWRfY2Rldiwgc3RydWN0IHRtMTYyOF9sZWQsIGxlZGRldik7Cj4+ICsgICAg
ICAgc3RydWN0IHRtMTYyOCAqcyA9IGxlZC0+Y3RybDsKPj4gKyAgICAgICBpbnQgb2Zmc2V0Owo+
PiArICAgICAgIF9fbGUxNiBiaXQ7Cj4gCj4gU3R5bGU6IHNvbWV0aW1lcyB0aGUgdmFyaWFibGVz
IGFyZSBpbml0aWFsaXplZCByaWdodCBhd2F5IHVzaW5nIGEKPiB2YWx1ZSBmcm9tIGFib3ZlLCBi
dXQgb3RoZXIgdGltZXMgdGhleSBhcmUgZG9uZSBiZWxvdy4KPiAKT0sKCj4+ICsgICAgICAgaWYg
KGNvdW50ID4gcy0+Z3JpZF9zaXplICsgMSkgLyogY29uc2lkZXIgdHJhaWxpbmcgbmV3bGluZSAq
Lwo+IAo+IFN0eWxlOiBzb21ldGltZXMgY29tbWVudHMgYXJlIHRyYWlsaW5nIHRoZSBsaW5lLCBv
dGhlcnMgYXJlIGFib3ZlLgo+IEFsc28sIHNvbWV0aW1lcyB0aGV5IHN0YXJ0IHdpdGggdXBwZXJj
YXNlLCBidXQgaW4gb3RoZXIgY2FzZXMgdGhleSBkbwo+IG5vdC4KPiAKT0ssIHdpbGwgYmVhdXRp
ZnkgdGhpcy4KCj4gQWxzbywgYWJvdXQgdGhlIGArIDFgOiBpcyBpdCBwb3NzaWJsZSB0aGF0IHN5
c2ZzIGdpdmVzIHVzIGEgYnVmZmVyCj4gZnVsbCBvZiBgaXNwcmludCgpYD8gaS5lLiBpcyBpdCBw
b3NzaWJsZSB0aGF0IGBncmlkX3NpemUgPT0KPiBNQVhfR1JJRF9TSVpFYCBhbmQgYGNvdW50ID09
IE1BWF9HUklEX1NJWkUgKyAxYCBhbmQgdGhlbiB3ZSBwZXJmb3JtIGFuCj4gb3V0LW9mLWJvdW5k
cyBzdG9yZSB0byBgTUFYX0dSSURfU0laRSArIDJgIGluIGB0ZXh0YD8KPiAKVHlwaWNhbGx5IHRo
ZXJlJ3Mgbm8gaXNzdWUgYmVjYXVzZSBjb21tYW5kIGxpbmUgaW5wdXQgYWx3YXlzIGVuZHMKd2l0
aCB0aGUgKG5vbi1wcmludGFibGUpIG5ld2xpbmUuIEJ1dCBJIGNoZWNrZWQgYW5kIHllcywgaXQn
cyBwb3NzaWJsZQp0byBwaXBlIGRhdGEgdy9vIHRyYWlsaW5nIG5ld2xpbmUgdG8gdGhlIGF0dHJp
YnV0ZS4KSGVuY2UgSSBoYXZlIHRvIGZpeCB0aGUgY29kZS4KCj4+ICsgICAgICAgcmV0ID0gdG0x
NjI4X3dyaXRlX2RhdGEoc3BpLCAwLCBNQVhfR1JJRF9TSVpFKTsKPj4gKyAgICAgICBpZiAocmV0
KQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4gKyAgICAgICAvKiBBc3N1bWUgdGhh
dCBzdWJzZXF1ZW50IFNQSSB0cmFuc2ZlcnMgd2lsbCBiZSBvayBpZiBmaXJzdCB3YXMgb2sgKi8K
PiAKPiBJZiBub3QsIGlzIHRoZXJlIGEgY29uc2VxdWVuY2U/IGkuZS4gd2h5IHdvdWxkbid0IG9u
ZSBjaGVjayBhbmQgZmFpbAo+IHNpbWlsYXJseSBpbiB0aGUgYHRtMTYyOF9zZXRfKmAgY2FsbHMg
YmVsb3c/Cj4gCkknbGwgY2hhbmdlIHRoaXMgY2hlY2sgdGhlIHJldHVybiBjb2RlIGFsc28gZm9y
IHRoZSBuZXh0IGNhbGxzLgoKPj4gKyAgICAgICBpZiAoIUlTX1JFQUNIQUJMRShDT05GSUdfTEVE
U19DTEFTUykpCj4+ICsgICAgICAgICAgICAgICBnb3RvIG5vX2xlZHM7Cj4gCj4gV2hhdCBhYm91
dCBwdXR0aW5nIHRoZSBjb2RlIGluIHRoZSBgaWZgIGJvZHkgKG5lZ2F0aW5nIHRoZSBjb25kaXRp
b24pPwo+IApJIGRpZCBpdCB0aGlzIHdheSB0byBhdm9pZCBoYXZpbmcgdG8gaW5kZW50IHRoZSBm
b2xsb3dpbmcgYmlnZ2VyIGJsb2NrLgoKPj4gKyAgICAgICBudW1fbGVkcyA9IDA7Cj4gCj4gVGhp
cyBpcyByZXVzaW5nIHRoZSB2YXJpYWJsZSBmb3IgYSBkaWZmZXJlbnQgcHVycG9zZSwgbm8/IGku
ZS4gaWYgd2UKPiBkaWQgbm90IGdldCBoZXJlLCB3ZSB3b3VsZCBoYXZlIG5vIGxlZHMsIHlldCB3
ZSB3b3VsZCByZXBvcnQgdGhlCj4gbnVtYmVyIGFib3ZlLgo+IApUaGUgdmFyaWFibGUgaXMgcmUt
dXNlZCBmb3IgYSBzbGlnaHRseSBkaWZmZXJlbnQgcHVycG9zZS4gQXQgZmlyc3QgaXQncwp1c2Vk
IGZvciB0aGUgbnVtYmVyIG9mIExFRCBjaGlsZCBub2RlcyAod2hhdCBtYXkgaW5jbHVkZSBpbnZh
bGlkIGNvbmZpZ3MpLAp0aGVuIGl0J3MgdXNlZCBmb3IgdGhlIG51bWJlciBvZiB0aGUgYWN0dWFs
bHkgY29uZmlndXJlZCBMRUQncy4KQW5kIHJpZ2h0LCBJIGhhdmUgdG8gbW92ZSB0aGUgYXNzaWdu
bWVudCBiZWZvcmUgdGhlIGNoZWNrLgoKPj4gKyAgICAgICBkZXZpY2VfZm9yX2VhY2hfY2hpbGRf
bm9kZSgmc3BpLT5kZXYsIGNoaWxkKSB7Cj4+ICsgICAgICAgICAgICAgICB1MzIgcmVnWzJdOwo+
PiArCj4+ICsgICAgICAgICAgICAgICByZXQgPSBmd25vZGVfcHJvcGVydHlfcmVhZF91MzJfYXJy
YXkoY2hpbGQsICJyZWciLCByZWcsIDIpOwo+PiArICAgICAgICAgICAgICAgaWYgKHJldCkgewo+
PiArICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKCZzcGktPmRldiwgIlJlYWRpbmcgJXMg
cmVnIHByb3BlcnR5IGZhaWxlZCAoJWQpXG4iLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZ3bm9kZV9nZXRfbmFtZShjaGlsZCksIHJldCk7Cj4gCj4gSXMgYSBmYWlsdXJlIGV4
cGVjdGVkPyBpLmUuIHRoaXMgYGNvbnRpbnVlO2BzLCBidXQgc2hvdWxkIGl0IGZhaWwgb3IKPiBp
cyBpdCBPSyB0byBwcm9jZWVkPwo+IAoKU3ltYm9sIExFRCdzIGFuZCBkaXNwbGF5IGRpZ2l0cyBh
cmUgaW5kZXBlbmRlbnQuIFRoZXJlZm9yZSwgaWYgdGhlcmUncyBhIHByb2JsZW0Kd2l0aCBhIERU
IExFRCBkZWZpbml0aW9uLCBJIGNob3NlIHRvIGp1c3Qgc2tpcCBpdCBpbnN0ZWFkIGlmIGJhaWxp
bmcgb3V0IGNvbXBsZXRlbHkuCgo+PiArICAgICAgIGZvciAoaSA9IDA7IGkgPCA3OyBpKyspIHsK
PiAKPiBNYXliZSBhIGAjZGVmaW5lYCBmb3Igc2V2ZXJhbCBvZiB0aGUgYDdgcyBhcm91bmQ/Cj4g
Ck9LCgo+PiArc3RhdGljIHZvaWQgdG0xNjI4X3NwaV9yZW1vdmUoc3RydWN0IHNwaV9kZXZpY2Ug
KnNwaSkKPiAKPiBEb2Vzbid0IGAucmVtb3ZlYCByZXR1cm4gYGludGA/Cj4gClRoaXMgaGFzIGNo
YW5nZWQgcmVjZW50bHkgd2l0aCBhMDM4NmJiYTcwOTMgKCJzcGk6IG1ha2UgcmVtb3ZlIGNhbGxi
YWNrIGEgdm9pZCBmdW5jdGlvbiIpLgoKPiBUaGFua3MhCj4gCj4gQ2hlZXJzLAo+IE1pZ3VlbAoK
VGhhbmtzIGZvciB0aGUgY29tcHJlaGVuc2l2ZSBmZWVkYmFjayEKCkhlaW5lcgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
