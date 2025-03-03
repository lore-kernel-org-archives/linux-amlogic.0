Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B6BC282C5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Mar 2025 08:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJDZV2H3oeW+7OqJ8zc3jOw8CX3szewhYMinWf4XipY=; b=4m1BpWih+g/DgA
	sCbofiG7773l6xat+oTIbiH00YYEoamcn++xAsdevsPLDt96gVgcyrkJsiVMuRswKgJ3MY7xQ7J6Z
	U8Munwk0qBrC7V8y/RX/21xakzD5Y1yg1MsuFjJaodI7Ckyis35d7LusEtVgcKwFacd2uRzcLylHV
	s1N0w4GHxhchFgAFHjCxIQwnZmjT1MhX+Qgwe3Fl86FU4dQreYJBqXMkG96dGDdLwAw8HZzuv/mQs
	Bbe60Hj2iXnv1AZjrKhq1lTARKmDhJk83Uy7aVbk+42kZMpXKW6Aml3zvvrMq2iGlZgDia9w/RL3x
	cI+f5LsjShMaBeYWrD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1bO-000000001Ch-3Sl4;
	Mon, 03 Mar 2025 08:56:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Qu-0000000HZyM-1CuP
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Mar 2025 08:45:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43948021a45so38086395e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Mar 2025 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740991549; x=1741596349; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fg7ScFrpAhGYL1bOoOF2peNB6lfD3/GoDR0u+tz557k=;
        b=NLMAzepTqkC9CgdZ9Og/7SuQRxSyaj3/2vHD5/KbHGwnqo2idD+1uBr45ydahcCFuM
         CWu0YnKJxPoSo7JL9R797BUiHoQU5avx3kQE6pQRyrOsYMApEtJVMk81ke1jMJjNXkgF
         NYOVDSqTyVZOntql7z1d43z7Av04PeKittZy99HYc1azlE+oh8nvp/CcGTrWLmP+gwTb
         s1OsxCvYBgZ7t1LLoVjMyVx/jLMe7WrP0CyH5Na832BKYKHbv5kuK9WA0Rt1I+PzviYZ
         qTSvCh5Qjb8oukJnTYvczSeuyg+4Ob1WDSYA3pAJTotE94rlaPq223ghR56lLFNR/Cko
         yOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991549; x=1741596349;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fg7ScFrpAhGYL1bOoOF2peNB6lfD3/GoDR0u+tz557k=;
        b=rfj/ppYzDVvrduCkqWnQushm3CV25fHNcH3G2/LsU9g7DkopHgjtWXrcZpW1Tdn4PV
         9SxIzZaihGCufKzrwMV2Zw3J8dNYw0GzR7XVHcjTbpVxTCKapm/l/BOcS3811FpyyW55
         ZWolEf2P+ffwwquOS+uvwU95wDybINTEFf6Q0Bo22yTMKGU1JTAid/G+r32ZTkLxtE6A
         RyPwjrF21qVvrcHbXWZ6NM9+TGaseAkW6QMuT7H4w/9lkSKcAb1zHo66p8P96ceRdFNJ
         cy6h+3f+3YAl7/krXoxyo750tR3/Twpgt/2qrW0tU6tR4s4YaKQheza1gZYHyYZ4zE/s
         6N8w==
X-Forwarded-Encrypted: i=1; AJvYcCXRnTK2hJ5EKSsFtvbxn+Qlab2oyv/dJIlsRmG/ZlV882o+HQ3V9HeAeR27WRRfNrtroJ6gwxBmBmlbUKwH@lists.infradead.org
X-Gm-Message-State: AOJu0YwPAlTHZiJ0/inogHAnrYIBgoo+s09pAfQ7Nk07nYP+mFfp8RXG
	v8JLRv+CtVPPtrlzaXnAjzXVikf2d9F0ljWF8mqxwq8lPrjwqZmQBTBXoa7Ddwg=
X-Gm-Gg: ASbGncvXlYD4WLPlwe7WW+mKl+fqvw1PoQd5ZW8z/qaynxQjrESyWZVXeu1M4MhcHa4
	IgjNZwbm4lejJU9i62OBTUGj8rEYg5NYCbxdFJpYUt818EXArAgq05DwBWp0rIW1N3oQwgPQzlz
	cm/ADUb3fAxdkusLR1UObElcNAFjgq56iDkkHAg2XHZu7mIxunjCGu0kyS+NgqzksQwN7BImm06
	8sYT6aBrRfv4R5NLM4oDyTRl8mv0vzYsG9UWw5tXBTCzi7tmD2froFl5DlO7cGs6vtjBoBEYSQZ
	GS0gGUJn5MUxdf/dwYhTTdZ1AELFd1CUiZC0j7FO52ZhkAAi
X-Google-Smtp-Source: AGHT+IEQ5gIerplrLBCNz9iWi2EjC22riC6x2aUD9LPOL3RMv31foO6V/nmZEr2WkFVBKnwbDjXW6Q==
X-Received: by 2002:a05:600c:4e8b:b0:43a:b8ef:4dce with SMTP id 5b1f17b1804b1-43ba67041bamr112726745e9.11.1740991549553;
        Mon, 03 Mar 2025 00:45:49 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f75ebsm153130965e9.3.2025.03.03.00.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:45:49 -0800 (PST)
Message-ID: <4d0042850eb4d9898559b56505291c4e849d44c5.camel@linaro.org>
Subject: Re: [PATCH 00/18] a few rtc driver cleanups
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>,  Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Hans Ulli Kroll	
 <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet	 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  =?ISO-8859-1?Q?T=F3th_J=E1nos?=	
 <gomba007@gmail.com>, Dianlong Li <long17.cool@163.com>, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org
Date: Mon, 03 Mar 2025 08:45:47 +0000
In-Reply-To: <20250301203658839d5482@mail.local>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
	 <20250301203658839d5482@mail.local>
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_004552_322615_5DAE5465 
X-CRM114-Status: GOOD (  19.98  )
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

SGkgQWxleGFuZHJlLAoKT24gU2F0LCAyMDI1LTAzLTAxIGF0IDIxOjM2ICswMTAwLCBBbGV4YW5k
cmUgQmVsbG9uaSB3cm90ZToKPiBPbiAyOC8wMi8yMDI1IDE0OjA3OjEzKzAwMDAsIEFuZHLDqSBE
cmFzemlrIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+IFdoaWxlIGxvb2tpbmcgYXQgUlRDLCBJIG5v
dGljZWQgdGhhdCB2YXJpb3VzIGRyaXZlcnMgYXJlIGtlZXBpbmcKPiA+IHBvaW50ZXJzIHRvIGRh
dGEgdGhhdCB0aGV5J3JlIG5vdCB1c2luZyB0aGVtc2VsdmVzIHRocm91Z2hvdXQgdGhlaXIKPiA+
IGxpZmV0aW1lLgo+ID4gCj4gPiBTbyBJIHRvb2sgdGhlIGxpYmVydHkgdG8gZHJvcCB0aGVzZSBw
b2ludGVycyBhbmQgdGhpcyBzZXJpZXMgaXMgdGhlCj4gPiByZXN1bHQuCj4gPiAKPiA+IFRoZSBs
YXN0IHR3byBwYXRjaGVzIGFsc28gY29udmVydCB0d28gZHJpdmVycyB0byB1c2luZyBkZXZfZXJy
X3Byb2JlKCksCj4gPiBhcyBJIGxvb2tlZCBzbGlnaHRseSBjbG9zZXIgaW50byB0aG9zZSB0d28u
IFRoZXkgZG9uJ3QgZXhhY3RseSBmaXQgdGhlCj4gPiBnZW5lcmFsIHN1YmplY3Qgb2YgcmVtb3Zh
bCBvZiB1bm5lZWRlZCBwb2ludGVycywgYnV0IEkgd2FudGVkIHRvIHNoYXJlCj4gPiB0aGVtIGFu
eXdheSwgc2luY2UgdGhleSdyZSByZWFkeS4KPiA+IAo+ID4gQWxsIG9mIHRoaXMgd2FzIGNvbXBp
bGUtdGVzdGVkIG9ubHkuCj4gPiAKPiA+IENoZWVycywKPiA+IEFuZHJlJwo+ID4gCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BsaW5hcm8ub3JnPgo+ID4g
LS0tCj4gPiBBbmRyw6kgRHJhc3ppayAoMTgpOgo+ID4gwqDCoMKgwqDCoCBydGM6IG1heDc3Njg2
OiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBtYXg3NzY4Nl9ydGNfaW5mbzo6cnRjIG1lbWJlcgo+ID4g
wqDCoMKgwqDCoCBydGM6IHM1bTogZHJvcCBuZWVkbGVzcyBzdHJ1Y3QgczVtX3J0Y19pbmZvOjpp
MmMgbWVtYmVyCj4gPiDCoMKgwqDCoMKgIHJ0YzogYXNwZWVkOiBkcm9wIG5lZWRsZXNzIHN0cnVj
dCBhc3BlZWRfcnRjOjpydGNfZGV2IG1lbWJlcgo+ID4gwqDCoMKgwqDCoCBydGM6IGRzMjQwNDog
ZHJvcCBuZWVkbGVzcyBzdHJ1Y3QgZHMyNDA0OjpydGMgbWVtYmVyCj4gPiDCoMKgwqDCoMKgIHJ0
YzogZXA5M3h4OiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBlcDkzeHhfcnRjOjpydGMgbWVtYmVyCj4g
PiDCoMKgwqDCoMKgIHJ0YzogZnRydGMwMTA6IGRyb3AgbmVlZGxlc3Mgc3RydWN0IGZ0cnRjMDEw
X3J0Yzo6cnRjX2RldiBtZW1iZXIKPiA+IMKgwqDCoMKgwqAgcnRjOiBtNDh0ODY6IGRyb3AgbmVl
ZGxlc3Mgc3RydWN0IG00OHQ4Nl9ydGNfaW5mbzo6cnRjIG1lbWJlcgo+ID4gwqDCoMKgwqDCoCBy
dGM6IG1lc29uOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBtZXNvbl9ydGM6OnJ0YyBtZW1iZXIKPiA+
IMKgwqDCoMKgwqAgcnRjOiBtZXNvbi12cnRjOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBtZXNvbl92
cnRjX2RhdGE6OnJ0YyBtZW1iZXIKPiA+IMKgwqDCoMKgwqAgcnRjOiBwbDAzMDogZHJvcCBuZWVk
bGVzcyBzdHJ1Y3QgcGwwMzBfcnRjOjpydGMgbWVtYmVyCj4gPiDCoMKgwqDCoMKgIHJ0Yzogcng4
NTgxOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCByeDg1ODE6OnJ0YyBtZW1iZXIKPiA+IMKgwqDCoMKg
wqAgcnRjOiBzMzUzOTBhOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBzMzUzOTBhOjpydGMgbWVtYmVy
Cj4gPiDCoMKgwqDCoMKgIHJ0Yzogc2QyNDA1YWw6IGRyb3AgbmVlZGxlc3Mgc3RydWN0IHNkMjQw
NWFsOjpydGMgbWVtYmVyCj4gPiDCoMKgwqDCoMKgIHJ0Yzogc2QzMDc4OiBkcm9wIG5lZWRsZXNz
IHN0cnVjdCBzZDMwNzg6OnJ0YyBtZW1iZXIKPiAKPiBNeSBtYWluIGNvbmNlcm4gd2l0aCB0aGlz
IGlzIHRoYXQgYXMgc29vbiBhcyB3ZSBpbnRyb2R1Y2UgaXJxIHN1cHBvcnQsCj4gd2UgYXJlIGdv
aW5nIHRvIG5lZWQgdGhlIHJ0YyBwb2ludGVyIGJhY2sgaW4gdGhlIHN0cnVjdC4gQnV0IEkgZ3Vl
c3MKPiB0aGF0IG1vc3Qgb2YgdGhlbSBhcmUgb2xkIGVub3VnaCB0byBzYXkgdGhhdCBub2JvZHkg
aXMgaW50ZXJlc3RlZCBpbiBpcnEKPiBzdXBwb3J0LgoKVGhhbmtzIGZvciB5b3VyIHRob3VnaHRz
IEFsZXhhbmRyZSAtIEkgZG9uJ3Qga25vdyB0aGUgaGlzdG9yeSBvZgp0aGVzZSBkcml2ZXJzIGFu
ZCBkb24ndCBtaW5kIGVpdGhlciB3YXkuIEkgY2FuIGRyb3AgdGhvc2UgcGF0Y2hlcwp0aGF0IHdv
dWxkIHJlcXVpcmUgcmVpbnRyb2R1Y2luZyBpZiBpcnEgc3VwcG9ydCBpcyBhZGRlZCBpbiB0aGUK
ZnV0dXJlLiBJIHRoaW5rIG92ZXJhbGwgeW91J3JlIE9LIHdpdGgga2VlcGluZyB0aGVtLCBidXQg
cGxlYXNlCmxldCBtZSBrbm93IGlmIEknbSBtaXN1bmRlcnN0YW5kaW5nIDotKQoKPiAKPiA+IMKg
wqDCoMKgwqAgcnRjOiByeDg1ODE6IGRyb3AgbmVlZGxlc3Mgc3RydWN0IHJ4ODU4MQo+ID4gwqDC
oMKgwqDCoCBydGM6IHNkMzA3ODogZHJvcCBuZWVkbGVzcyBzdHJ1Y3Qgc2QzMDc4Cj4gCj4gSSBn
dWVzcyB5b3UgY291bGQgc3F1YXNoIHRob3NlIHR3byB3aXRoIHRoZSBwcmV2aW91cyBvbmVzIHRv
dWNoaW5nIHRoZQo+IHJlc3BlY3RpdmUgZHJpdmVycyBiZWNhdXNlIHlvdSBhcmUgdGhlIG9uZSBy
ZW1vdmluZyB0aGUgbGFzdCByZW1haW5pbmcKPiBzdHJ1Y3QgbWVtYmVyLgoKV2lsbCBkby4KCkNo
ZWVycywKQW5kcmUnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
