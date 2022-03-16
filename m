Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5002C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Mar 2022 21:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVSSL00ZQ7Aj5bQzfMHZXR1zMzaZkOkHdiwmxTZn8tE=; b=yZgw5AnBuIKKGz
	gs2BOrGHYPk9yiQQqvt3SJ2iv+6Db7K7JOdLJa4e2Nrgx3YRTu4UKVvuo5ERXmBe5sInQIwDwuCvN
	Q3RZDzrO8iN+WZegUZu4kj8aNi5A/INxg1iMfI1awc0ce3RPAGNysKgJHlfPN5gCSpMkzlq2UYO6Q
	A/cLDQ9Wxy2dVWOpKWOjh7MAXStRRUTmOb1mSU8UH1UxS8UvYLb1iXGyfkSGRFPpNS/CH5D8+H0xI
	yuAW0bbRVu8OJUtB7Yf/O2CEUnQphPdKywnSPFQn+x8GBS2rt06JgMBuP4ZhoNOTMXxbRX5kDI5qv
	XUZ5BWwoBE4g2wZm5zxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUb3Y-00ELjv-9Z; Wed, 16 Mar 2022 21:19:44 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUb3L-00ELhR-E2; Wed, 16 Mar 2022 21:19:33 +0000
Received: by mail-ed1-x530.google.com with SMTP id y22so4326655eds.2;
 Wed, 16 Mar 2022 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=o8rjaWS1kfQZmN1hTJ3APAjZ2xrksFfaFvhOkPsgO/0=;
 b=n1f2rXKXrM7GLXVHcIR9Ey9z1Tpj6D41cpuSOTyWjpX8YONkPMsd2X556MgDIgqq5B
 cisGlxWsn3NSD1MJkOmiHTHrl48s74HCgRgJnmOZIHPBwW9kpo6JDPTnWXhG9g7+F5Uc
 tNVo6qQ1cd8wFOS66TL/z0GqaxfzAUinoAYlcX27MPTM0L/sCUAgP3oUxysoDg5/o8ey
 OsmYj9O3M1UFUFhaVySCodOj1CNmW08UjH5e69GWA4nbYycmk9BIVYXk3UbAWU8v7wP6
 blnfcCijOqb/GmBvQkoVZz1BUoNyOmf8Xw0fV8tlhmly6lL5T3LN5PJmXD5UfTowc8Ca
 2V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=o8rjaWS1kfQZmN1hTJ3APAjZ2xrksFfaFvhOkPsgO/0=;
 b=AZ3K5bHF/wGHMvrYr4d2Cd/wwB+uiDDaEo361i4/VI6NA69AhO+4m5TeS3WDFc08LE
 ZfjQxQqf+tpl4OMhGsaH58N70kTx0+1FUXbtgZaMrxVd46qErn/0N1xWsU64Y/DZ7zqQ
 Vi1agUOAtEj+5GqXPhVR/QcNjiibWJ5mLSJbAveNcS/CNR+lidQU8kPOcLz+ri+xX04n
 arIVC0m/6SENc/UdrHyyjL/JCOB2VTKJVjtZ8DKQ1T5z1J92xMcB2OeNdsEe/T5tt6Em
 AS3Rtt6TO4rR3ywmKyFZL183CP/75D/TeZVA+LDi2HTtTihW2rBH5v/AY2E6iH23kFYQ
 bG/g==
X-Gm-Message-State: AOAM5327Z29JZ3d210sisBSU11MpykoL716e0pZh9kIiFXuNWHUlJW4v
 +aouFLD/xg29seiE91QXV0Y=
X-Google-Smtp-Source: ABdhPJw5w9N6SzTa9alUk6xMWAdxIogVq5xsyUm17wjP374+ZXAH4XG78RNMvKJavxDEKPcpIQH7yQ==
X-Received: by 2002:aa7:d945:0:b0:418:f041:f9bc with SMTP id
 l5-20020aa7d945000000b00418f041f9bcmr1318719eds.305.1647465568992; 
 Wed, 16 Mar 2022 14:19:28 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66?
 (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de.
 [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
 by smtp.googlemail.com with ESMTPSA id
 b19-20020aa7dc13000000b00418eef0a019sm874793edu.34.2022.03.16.14.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 14:19:28 -0700 (PDT)
Message-ID: <84739af1-cbb8-e957-6e30-4121ed0a3517@gmail.com>
Date: Wed, 16 Mar 2022 22:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
 <8d138801-5447-5e88-25d2-3eb13d294530@arm.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v5 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
In-Reply-To: <8d138801-5447-5e88-25d2-3eb13d294530@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_141931_512021_BB7AE25B 
X-CRM114-Status: GOOD (  27.08  )
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

T24gMTYuMDMuMjAyMiAwMTozOCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjItMDItMjUg
MjE6MDksIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0
IGZvciB0aGUgVGl0YW5tZWMgVE0xNjI4IDcgc2VnbWVudCBkaXNwbGF5Cj4+IGNvbnRyb2xsZXIu
IEl0J3MgYmFzZWQgb24gcHJldmlvdXMgUkZDIHdvcmsgZnJvbSBBbmRyZWFzIEbDpHJiZXIuCj4+
IFRoZSBSRkMgdmVyc2lvbiBwbGFjZWQgdGhlIGRyaXZlciBpbiB0aGUgTEVEIHN1YnN5c3RlbSwg
YnV0IHRoaXMgd2FzCj4+IE5BSydlZCBieSB0aGUgTEVEIG1haW50YWluZXIuIFRoZXJlZm9yZSBJ
IG1vdmVkIHRoZSBkcml2ZXIgdG8KPj4gL2RyaXZlcnMvYXV4ZGlzcGxheSB3aGF0IHNlZW1zIG1v
c3QgcmVhc29uYWJsZSB0byBtZS4KPj4KPj4gRnVydGhlciBjaGFuZ2VzIHRvIHRoZSBSRkMgdmVy
c2lvbjoKPj4gLSBEcml2ZXIgY2FuIGJlIGJ1aWx0IGFsc28gdy9vIExFRCBjbGFzcyBzdXBwb3J0
LCBmb3IgZGlzcGxheXMgdGhhdAo+PiDCoMKgIGRvbid0IGhhdmUgYW55IHN5bWJvbHMgdG8gYmUg
ZXhwb3NlZCBhcyBMRUQncy4KPj4gLSBTaW1wbGlmaWVkIHRoZSBjb2RlIGFuZCByZXdyb3RlIGEg
bG90IG9mIGl0Lgo+PiAtIERyaXZlciBpcyBub3cga2luZCBvZiBhIE1WUCwgYnV0IGZ1bmN0aW9u
YWxpdHkgc2hvdWxkIGJlIHN1ZmZpY2llbnQKPj4gwqDCoCBmb3IgbW9zdCB1c2UgY2FzZXMuCj4+
IC0gVXNlIHRoZSBleGlzdGluZyA3IHNlZ21lbnQgc3VwcG9ydCBpbiB1YXBpL2xpbnV4L21hcF90
b183c2VnbWVudC5oCj4+IMKgwqAgYXMgc3VnZ2VzdGVkIGJ5IEdlZXJ0IFV5dHRlcmhvZXZlbi4K
Pj4KPj4gTm90ZTogVGhlcmUncyBhIG51bWJlciBvZiBjaGlwcyBmcm9tIG90aGVyIG1hbnVmYWN0
dXJlcnMgdGhhdCBhcmUKPj4gwqDCoMKgwqDCoMKgIGFsbW9zdCBpZGVudGljYWwsIGUuZy4gRkQ2
MjgsIFNNMTYyOC4gT25seSBkaWZmZXJlbmNlIEkgc2F3IHNvCj4+IMKgwqDCoMKgwqDCoCBmYXIg
aXMgdGhhdCB0aGV5IHBhcnRpYWxseSBzdXBwb3J0IG90aGVyIGRpc3BsYXkgbW9kZXMuCj4+IMKg
wqDCoMKgwqDCoCBUTTE2Mjg6IDZ4MTIsIDd4MTEKPj4gwqDCoMKgwqDCoMKgIFNNMTYyOEM6IDR4
MTMsIDV4MTIsIDZ4MTEsIDd4MTAKPj4gwqDCoMKgwqDCoMKgIEZvciB0eXBpY2FsIGRpc3BsYXlz
IG9uIGRldmljZXMgdXNpbmcgdGhlc2UgY2hpcHMgdGhpcwo+PiDCoMKgwqDCoMKgwqAgZGlmZmVy
ZW5jZSBzaG91bGRuJ3QgbWF0dGVyLgo+Pgo+PiBTdWNjZXNzZnVsbHkgdGVzdGVkIG9uIGEgVFgz
IE1pbmkgVFYgYm94IHRoYXQgaGFzIGFuIFNNMTYyOEMgYW5kIGEKPj4gZGlzcGxheSB3aXRoIDQg
ZGlnaXRzIGFuZCA3IHN5bWJvbHMuCj4gCj4gRldJVyBJIGdhdmUgdGhpcyBhIGdvIG9uIG15IEJl
ZWxpbmsgQTEsIHdoaWNoIGhhcyBhbiBBaVAxNjE4IGFuZCBhIGNsb2NrIGRpc3BsYXkgd2hpY2gg
d291bGQgbWFwcGVkIGxpa2Ugc286Cj4gCj4gwqDCoMKgwqB0aXRhbm1lYyxzZWdtZW50LW1hcHBp
bmcgPSAvYml0cy8gOCA8MSAyIDMgMTMgMTIgNSA0PjsKPiDCoMKgwqDCoHRpdGFubWVjLGdyaWQg
PSAvYml0cy8gOCA8NSA0IDIgMT47Cj4gCj4gKGdyaWQgMyBzZWdtZW50IDIgaXMgdXNlZCBmb3Ig
YSBjb2xvbiBpbiB0aGUgbWlkZGxlKQo+IAo+IElmIEkgYm9kZ2UgYXJvdW5kIHRoZSBsYWNrIG9m
IHN1cHBvcnQgZm9yIG5vbi1jb250aWd1b3VzIGdyaWRzLCBpdCBkb2VzIG90aGVyd2lzZSB3b3Jr
IGZhaXJseSB3ZWxsLCBvdGhlciB0aGFuIGJlaW5nIDYtc2VnbWVudCBkaXNwbGF5cyBiZWNhdXNl
IGl0IG5lZWRzIHRvIGJlIGluIGRpc3BsYXkgbW9kZSAxIHRvIGRyaXZlIFNFRzEzIHJhdGhlciB0
aGFuIEdSSUQ2LiBJIHdvbmRlciBpZiB3ZSBjb3VsZCBiZSBhIGJpdCBjbGV2ZXJlciBhYm91dCBw
aWNraW5nIGEgZGlzcGxheSBtb2RlIGJhc2VkIG9uIHRoZSBncmlkL3NlZ21lbnQgbnVtYmVycyB1
c2VkPwo+IApEZWZpbml0ZWx5IHRoaXMgY291bGQgYmUgb25lIGZ1dHVyZSBleHRlbnNpb24uIEl0
IGNvdWxkIGFsc28gY29uc2lkZXIgdGhhdCB0aGVyZSdzIGEgbnVtYmVyIG9mIG1vcmUgb3IgbGVz
cwppZGVudGljYWwgY2hpcHMgZnJvbSBvdGhlciB2ZW5kb3JzIHRoYXQgZGlmZmVyIHByaW1hcmls
eSBpbiB0aGUgc3VwcG9ydGVkIGRpc3BsYXkgbW9kZXMuCgo+IEkgYWxzbyBoYXZlIGEgY291cGxl
IG9mIHRob3NlIFRNMTYzOCBicmVha291dCBib2FyZHMgd2l0aCA4IGRpZ2l0cywgOCBzaW5nbGUg
TEVEcyBhbmQgOCBidXR0b25zIHRoYXQgSSBtaWdodCBoYXZlIGEgZ28gd2l0aCB0b28uIEhhdmUg
eW91IGdpdmVuIGFueSB0aG91Z2h0IHRvIGhvdyB0aGUgRFQgYmluZGluZyBtaWdodCBzdXBwb3J0
IGlucHV0cyBhcyB3ZWxsPyAoVGhlIGJlc3QgdGltZSB0byBiZSBmdXR1cmUtcHJvb2YgaXMgYmVm
b3JlIGl0J3MgbWVyZ2VkLi4uKQo+IApXaXRoIHJlZ2FyZHMgdG8gaW5wdXRzIGF0IGxlYXN0IEkg
aGF2ZSBubyBwbGFucyBiZWNhdXNlIEkgaGF2ZSBubyBodyBzdXBwb3J0aW5nIGlucHV0LgpTaW5j
ZSB0aGUgZmlyc3QgYXR0ZW1wdHMgdG8gc3VwcG9ydCB0aGlzIExFRCBkcml2ZXIgaHcgdHdvIHll
YXJzIGhhdmUgYmVlbiBwYXNzZWQgdy9vIGFueSB0YW5naWJsZSAobWFpbmxpbmUpIHJlc3VsdC4K
VGhlcmVmb3JlIEkgd2FudCB0byBrZWVwIHRoZSBpbml0aWFsIHZlcnNpb24gYSBNVlAuIFdhbnRp
bmcgdG8gaGF2ZSB0b28gbWFueSBmZWF0dXJlcyBpbiBhbiBpbml0aWFsIHZlcnNpb24KbWF5IHJl
c3VsdCBpbiBsb25nZXIgZGlzY3Vzc2lvbnMgdW50aWwgbWFpbnRhaW5lciBvciBJIGdpdmUgdXAu
CkltcG9ydGFudCBpcyB0aGF0IHVzZXIgc3BhY2UgaW50ZXJmYWNlIC8gRFQgYmluZGluZ3MgYXJl
IGZsZXhpYmxlIGVub3VnaCBzbyB0aGF0IGZ1dHVyZSBleHRlbnNpb25zIGRvbid0IGhhdmUgdG8g
YnJlYWsKZXhpc3RpbmcgdXNlcnMuIEFuZCBJIHRoaW5rIHRoYXQncyB0aGUgY2FzZS4KCj4gQ2hl
ZXJzLAo+IFJvYmluLgo+IAoKSGVpbmVyCgo+PiB2MjoKPj4gLSAocmUtKWFkZCBBbmRyZWFzJyBT
b0IgdG8gdHdvIHBhdGNoZXMKPj4gLSBmaXggWUFNTCBpc3N1ZXMKPj4gLSBpbmNsdWRlIGN0eXBl
LmggZXhwbGljaXRseQo+PiAtIGFkZCBpbmZvIG1lc3NhZ2UgaW4gcHJvYmUoKQo+Pgo+PiB2MzoK
Pj4gLSByZW1vdmUgcGF0Y2ggMSBiZWNhdXNlIGl0IGhhcyBiZWVuIGFwcGxpZWQgdmlhIHRoZSBT
UEkgdHJlZSBhbHJlYWR5Cj4+IC0gZml4IHJlbWFpbmluZyBZQU1MIGlzc3VlcyBpbiBwYXRjaCAy
Cj4+IC0gZm9sbG93IE1pZ3VlbCdzIHN1Z2dlc3Rpb24gb24gdXNhZ2Ugb2YgQ28tRGV2ZWxvcGVk
LWJ5Cj4+Cj4+IHY0Ogo+PiAtIGFkZCBwYXRjaCBmb3IgTUFJTlRBSU5FUlMgZW50cnkKPj4gLSBp
bmNvcnBvcmF0ZSBNaWd1ZWwncyByZXZpZXcgY29tbWVudHMKPj4gLSBSZXBsYWNlIENvLURldmVs
b3BlZC1ieSB3aXRoIENvLWRldmVsb3BlZC1ieSAoY2hlY2twYXRjaCkKPj4gdjU6Cj4+IC0gYWRk
IHZlbmRvciBwcmVmaXggdG8gZHJpdmVyLXNwZWNpZmljIGR0IHByb3BlcnRpZXMKPj4KPj4gQW5k
cmVhcyBGw6RyYmVyICgxKToKPj4gwqDCoCBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBB
ZGQgVGl0YW4gTWljcm8gRWxlY3Ryb25pY3MKPj4KPj4gSGVpbmVyIEthbGx3ZWl0ICg1KToKPj4g
wqDCoCBkdC1iaW5kaW5nczogYXV4ZGlzcGxheTogQWRkIFRpdGFuIE1pY3JvIEVsZWN0cm9uaWNz
IFRNMTYyOAo+PiDCoMKgIGRvY3M6IEFCSTogZG9jdW1lbnQgdG0xNjI4IGF0dHJpYnV0ZSBkaXNw
bGF5LXRleHQKPj4gwqDCoCBhdXhkaXNwbGF5OiBhZGQgc3VwcG9ydCBmb3IgVGl0YW5tZWMgVE0x
NjI4IDcgc2VnbWVudCBkaXNwbGF5Cj4+IMKgwqDCoMKgIGNvbnRyb2xsZXIKPj4gwqDCoCBhcm02
NDogZHRzOiBtZXNvbi1neGwtczkwNXctdHgzLW1pbmk6IGFkZCBzdXBwb3J0IGZvciB0aGUgNyBz
ZWdtZW50Cj4+IMKgwqDCoMKgIGRpc3BsYXkKPj4gwqDCoCBNQUlOVEFJTkVSUzogQWRkIGVudHJ5
IGZvciB0bTE2MjggYXV4ZGlzcGxheSBkcml2ZXIKPj4KPj4gwqAgLi4uL3Rlc3Rpbmcvc3lzZnMt
ZGV2aWNlcy1hdXhkaXNwbGF5LXRtMTYyOMKgwqAgfMKgwqAgNyArCj4+IMKgIC4uLi9iaW5kaW5n
cy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1swqAgfMKgIDkyICsrKysrCj4+IMKgIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1swqAgfMKgwqAgMiArCj4+
IMKgIE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArCj4+IMKgIC4uLi9kdHMvYW1sb2dp
Yy9tZXNvbi1neGwtczkwNXctdHgzLW1pbmkuZHRzwqAgfMKgIDU5ICsrKwo+PiDCoCBkcml2ZXJz
L2F1eGRpc3BsYXkvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxMSArCj4+IMKgIGRyaXZlcnMvYXV4ZGlzcGxheS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPj4gwqAgZHJpdmVycy9hdXhkaXNwbGF5
L3RtMTYyOC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzc2ICsrKysr
KysrKysrKysrKysrKwo+PiDCoCA4IGZpbGVzIGNoYW5nZWQsIDU1NSBpbnNlcnRpb25zKCspCj4+
IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWRl
dmljZXMtYXV4ZGlzcGxheS10bTE2MjgKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1s
Cj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2F1eGRpc3BsYXkvdG0xNjI4LmMKPj4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
