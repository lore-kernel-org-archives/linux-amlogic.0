Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91349C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Mar 2022 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCR31qHqESx354qPnHih5qk4rtGNQfCr4utk9InOyxI=; b=LK/DSTUbZ4tdZq
	HzvaHp74IegRd1hbx2/mk+NF6M7UooZqXMl5VTlUOPo96UxhxA8LFg2YkQZ/z3MwW9mm48X5Y3XF+
	xXOKC/YihE2SwumIM9gPX0u1INx7QKHAcF5yvcKzAhckWhYHvClrY/Fm9EjyAV0AKcWm9Q4HjUl2d
	3PgWQtT1MQ2liw5FeyzMDa1L7N70VEJJ1Io3fHEzsmM12/AGJZGPP8PZyEOGXpV/A0zGAUAnkDkLJ
	11SJUJRYkbVEqW5PSACyJg8WbZ/qdvS+hR+CKeuCU7H+KGfhIM+pMfFxmtbAo1E7tMtFnoQngDBYI
	36Tdm2R2RkAuZohOTXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRedX-005nAf-Ua; Tue, 08 Mar 2022 18:32:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRedL-005n9V-Je; Tue, 08 Mar 2022 18:32:33 +0000
Received: by mail-wm1-x331.google.com with SMTP id r65so7106wma.2;
 Tue, 08 Mar 2022 10:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=uiU2u9h2P4tMLPAe7w64PoUebLSo9Vimwlwo8ylFYLs=;
 b=ZwAztZtFBE9ICDMx0F3PPj7WRyX+tq8A6OHCNCfEmCeJWT7zhe+EVI4u6bK5b+GFhC
 V6pneVKJ7An6d5wgItrBuQO3z5QaOiFe0SNsR/FVwf4cRuNL0/t7gd2dbyjY2rSL7R6R
 TiI/nwlU1ys+gq7vRc1ZAXEpxJTskbtXKadT86cmZGE23w2CLFi0I+4/1+yosFsKnRDa
 Y7gFsEjY2XtdBO0lPHeGaa7hBje3CAE65GU9EoZaa+oJxkTffyUtAAvV2K0803l22451
 sMKweqa53WQugohaSivzRZ/EyY2rajSA8OOpov8Dxhpe+C5PZGSSN79P7lJ8Ny1TXSgV
 7iPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=uiU2u9h2P4tMLPAe7w64PoUebLSo9Vimwlwo8ylFYLs=;
 b=lwoPXd9i4/TuhdSBw5p+BIdM0A/juhVaV6qgsjesA87DzeqU3rvKUZihua9RZCszPh
 NxGunu7rVcon/qvCXQFMpRmofp7EzmNoRL69FU9LhJwCzmohoHRVdyctGeSw6sCe8u+U
 hbAI2SAxhuVPp8QPEq663QjIziRj87KBsIop9rlropgsDo0FT2E7PC4nuZAayMdETCAz
 A1JaYoyzKckh0SkN9/V3E6lBFOLROCYVgSZESL6voZ7STQwEPHbQtM7nE2wC0bv+gryw
 jutThdInrEK6KPhLUdvso1bo3PTL9FhBBr1M4qWSMMoJuWr2e4c0NPpxKBciNtuZVbNE
 z17w==
X-Gm-Message-State: AOAM532n4CpXIAY4WUc/hhgTfupJO5pRqYAn2Nej+3QKI69xLeJx16Ca
 nuVWlDLl1/zQ8B+qaTWX6nE=
X-Google-Smtp-Source: ABdhPJwxxmXjnDwNblhPpgodX9P8Rc2PWUzV6dK2oRmU4xtLcqoNvCsHvmIlKWLEgCvKz5HpP7IARw==
X-Received: by 2002:a1c:acc6:0:b0:380:e35f:ff1f with SMTP id
 v189-20020a1cacc6000000b00380e35fff1fmr4736527wme.52.1646764349476; 
 Tue, 08 Mar 2022 10:32:29 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b54:500:3175:f9ac:af86:a778?
 (dynamic-2a01-0c22-7b54-0500-3175-f9ac-af86-a778.c22.pool.telefonica.de.
 [2a01:c22:7b54:500:3175:f9ac:af86:a778])
 by smtp.googlemail.com with ESMTPSA id
 f8-20020adfb608000000b0020229d72a4esm3032670wre.38.2022.03.08.10.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:32:28 -0800 (PST)
Message-ID: <c3342c4d-85e7-b9dd-7fd5-b84b8fc850a4@gmail.com>
Date: Tue, 8 Mar 2022 19:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
In-Reply-To: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_103231_671951_C71263A7 
X-CRM114-Status: GOOD (  26.06  )
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

T24gMjUuMDIuMjAyMiAyMjowOSwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+IFRoaXMgc2VyaWVz
IGFkZHMgc3VwcG9ydCBmb3IgdGhlIFRpdGFubWVjIFRNMTYyOCA3IHNlZ21lbnQgZGlzcGxheQo+
IGNvbnRyb2xsZXIuIEl0J3MgYmFzZWQgb24gcHJldmlvdXMgUkZDIHdvcmsgZnJvbSBBbmRyZWFz
IEbDpHJiZXIuCj4gVGhlIFJGQyB2ZXJzaW9uIHBsYWNlZCB0aGUgZHJpdmVyIGluIHRoZSBMRUQg
c3Vic3lzdGVtLCBidXQgdGhpcyB3YXMKPiBOQUsnZWQgYnkgdGhlIExFRCBtYWludGFpbmVyLiBU
aGVyZWZvcmUgSSBtb3ZlZCB0aGUgZHJpdmVyIHRvCj4gL2RyaXZlcnMvYXV4ZGlzcGxheSB3aGF0
IHNlZW1zIG1vc3QgcmVhc29uYWJsZSB0byBtZS4KPiAKPiBGdXJ0aGVyIGNoYW5nZXMgdG8gdGhl
IFJGQyB2ZXJzaW9uOgo+IC0gRHJpdmVyIGNhbiBiZSBidWlsdCBhbHNvIHcvbyBMRUQgY2xhc3Mg
c3VwcG9ydCwgZm9yIGRpc3BsYXlzIHRoYXQKPiAgIGRvbid0IGhhdmUgYW55IHN5bWJvbHMgdG8g
YmUgZXhwb3NlZCBhcyBMRUQncy4KPiAtIFNpbXBsaWZpZWQgdGhlIGNvZGUgYW5kIHJld3JvdGUg
YSBsb3Qgb2YgaXQuCj4gLSBEcml2ZXIgaXMgbm93IGtpbmQgb2YgYSBNVlAsIGJ1dCBmdW5jdGlv
bmFsaXR5IHNob3VsZCBiZSBzdWZmaWNpZW50Cj4gICBmb3IgbW9zdCB1c2UgY2FzZXMuCj4gLSBV
c2UgdGhlIGV4aXN0aW5nIDcgc2VnbWVudCBzdXBwb3J0IGluIHVhcGkvbGludXgvbWFwX3RvXzdz
ZWdtZW50LmgKPiAgIGFzIHN1Z2dlc3RlZCBieSBHZWVydCBVeXR0ZXJob2V2ZW4uCj4gCj4gTm90
ZTogVGhlcmUncyBhIG51bWJlciBvZiBjaGlwcyBmcm9tIG90aGVyIG1hbnVmYWN0dXJlcnMgdGhh
dCBhcmUKPiAgICAgICBhbG1vc3QgaWRlbnRpY2FsLCBlLmcuIEZENjI4LCBTTTE2MjguIE9ubHkg
ZGlmZmVyZW5jZSBJIHNhdyBzbwo+ICAgICAgIGZhciBpcyB0aGF0IHRoZXkgcGFydGlhbGx5IHN1
cHBvcnQgb3RoZXIgZGlzcGxheSBtb2Rlcy4KPiAgICAgICBUTTE2Mjg6IDZ4MTIsIDd4MTEKPiAg
ICAgICBTTTE2MjhDOiA0eDEzLCA1eDEyLCA2eDExLCA3eDEwCj4gICAgICAgRm9yIHR5cGljYWwg
ZGlzcGxheXMgb24gZGV2aWNlcyB1c2luZyB0aGVzZSBjaGlwcyB0aGlzCj4gICAgICAgZGlmZmVy
ZW5jZSBzaG91bGRuJ3QgbWF0dGVyLgo+IAo+IFN1Y2Nlc3NmdWxseSB0ZXN0ZWQgb24gYSBUWDMg
TWluaSBUViBib3ggdGhhdCBoYXMgYW4gU00xNjI4QyBhbmQgYQo+IGRpc3BsYXkgd2l0aCA0IGRp
Z2l0cyBhbmQgNyBzeW1ib2xzLgo+IAo+IHYyOgo+IC0gKHJlLSlhZGQgQW5kcmVhcycgU29CIHRv
IHR3byBwYXRjaGVzCj4gLSBmaXggWUFNTCBpc3N1ZXMKPiAtIGluY2x1ZGUgY3R5cGUuaCBleHBs
aWNpdGx5Cj4gLSBhZGQgaW5mbyBtZXNzYWdlIGluIHByb2JlKCkKPiAKPiB2MzoKPiAtIHJlbW92
ZSBwYXRjaCAxIGJlY2F1c2UgaXQgaGFzIGJlZW4gYXBwbGllZCB2aWEgdGhlIFNQSSB0cmVlIGFs
cmVhZHkKPiAtIGZpeCByZW1haW5pbmcgWUFNTCBpc3N1ZXMgaW4gcGF0Y2ggMgo+IC0gZm9sbG93
IE1pZ3VlbCdzIHN1Z2dlc3Rpb24gb24gdXNhZ2Ugb2YgQ28tRGV2ZWxvcGVkLWJ5Cj4gCj4gdjQ6
Cj4gLSBhZGQgcGF0Y2ggZm9yIE1BSU5UQUlORVJTIGVudHJ5Cj4gLSBpbmNvcnBvcmF0ZSBNaWd1
ZWwncyByZXZpZXcgY29tbWVudHMKPiAtIFJlcGxhY2UgQ28tRGV2ZWxvcGVkLWJ5IHdpdGggQ28t
ZGV2ZWxvcGVkLWJ5IChjaGVja3BhdGNoKQo+IHY1Ogo+IC0gYWRkIHZlbmRvciBwcmVmaXggdG8g
ZHJpdmVyLXNwZWNpZmljIGR0IHByb3BlcnRpZXMKPiAKPiBBbmRyZWFzIEbDpHJiZXIgKDEpOgo+
ICAgZHQtYmluZGluZ3M6IHZlbmRvci1wcmVmaXhlczogQWRkIFRpdGFuIE1pY3JvIEVsZWN0cm9u
aWNzCj4gCj4gSGVpbmVyIEthbGx3ZWl0ICg1KToKPiAgIGR0LWJpbmRpbmdzOiBhdXhkaXNwbGF5
OiBBZGQgVGl0YW4gTWljcm8gRWxlY3Ryb25pY3MgVE0xNjI4Cj4gICBkb2NzOiBBQkk6IGRvY3Vt
ZW50IHRtMTYyOCBhdHRyaWJ1dGUgZGlzcGxheS10ZXh0Cj4gICBhdXhkaXNwbGF5OiBhZGQgc3Vw
cG9ydCBmb3IgVGl0YW5tZWMgVE0xNjI4IDcgc2VnbWVudCBkaXNwbGF5Cj4gICAgIGNvbnRyb2xs
ZXIKPiAgIGFybTY0OiBkdHM6IG1lc29uLWd4bC1zOTA1dy10eDMtbWluaTogYWRkIHN1cHBvcnQg
Zm9yIHRoZSA3IHNlZ21lbnQKPiAgICAgZGlzcGxheQo+ICAgTUFJTlRBSU5FUlM6IEFkZCBlbnRy
eSBmb3IgdG0xNjI4IGF1eGRpc3BsYXkgZHJpdmVyCj4gCj4gIC4uLi90ZXN0aW5nL3N5c2ZzLWRl
dmljZXMtYXV4ZGlzcGxheS10bTE2MjggICB8ICAgNyArCj4gIC4uLi9iaW5kaW5ncy9hdXhkaXNw
bGF5L3RpdGFubWVjLHRtMTYyOC55YW1sICB8ICA5MiArKysrKwo+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCAgfCAgIDIgKwo+ICBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKwo+ICAuLi4vZHRzL2FtbG9naWMv
bWVzb24tZ3hsLXM5MDV3LXR4My1taW5pLmR0cyAgfCAgNTkgKysrCj4gIGRyaXZlcnMvYXV4ZGlz
cGxheS9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAxMSArCj4gIGRyaXZlcnMvYXV4ZGlz
cGxheS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvYXV4ZGlz
cGxheS90bTE2MjguYyAgICAgICAgICAgICAgICAgICB8IDM3NiArKysrKysrKysrKysrKysrKysK
PiAgOCBmaWxlcyBjaGFuZ2VkLCA1NTUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1kZXZpY2VzLWF1eGRpc3BsYXktdG0x
NjI4Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9hdXhkaXNwbGF5L3RtMTYyOC5jCj4gCgpIaSBNaWd1ZWwsCgp0aGUgRFQgZXh0ZW5z
aW9ucyBoYXZlIGJlZW4gYWNrZWQvcmV2aWV3ZWQuCkFueSBvdGhlciBmZWVkYmFjayBmcm9tIHlv
dXIgc2lkZT8gT3IgY2FuIGl0IGJlIGFwcGxpZWQgYXMtaXM/CgpIZWluZXIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
