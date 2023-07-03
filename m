Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91025C001B3
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvxKkE1y9sDiF29lDb92/WToqRvhZf6tRAt3QY/PuNY=; b=eFbp796IMol9Lx
	wWEvSV9++JOmBnDTXP5xOiogQlf4I6ywepnoZjvt8ITUtZNdiqlRcyQp1z01U2mL7fEA8c+zEiWE8
	UBKS2Nm8SI5jJSDl0eS8i4W1V6+7OcVDCM44dNj8itg93z5XvxTE3aeF6wqrqKUenR4buhYMeeRSz
	Fy8j1AkfbZ17QVd02Swug1dCWbzAcAYIkFXLvm9qxEBXjIv914ztqUVTUY0Hl9e2Zs+1JB4iaLR/C
	CwoT6KUGtbt7cB2nO+6VqBjrpm6bE8rOLOA8nXbvPrXeD2MoeV1XaY0oM02bfZ7DGAc7E0A/FRpWO
	Zg5rp7tjx07b3t6DGnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGQAM-00BNrg-2A;
	Mon, 03 Jul 2023 20:28:58 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGQAI-00BNqr-2D;
	Mon, 03 Jul 2023 20:28:56 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991f956fb5aso460078866b.0;
        Mon, 03 Jul 2023 13:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1688416132; x=1691008132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btFntjY0O3IvQAR+9HWAi9QrudxEpvSJmgYuJTKvtTI=;
        b=P/2IY1xgAl3/k1IG0imh55eAHTfrSdB5GD9jlHerOgWmBqtOW+2iTqhMRvaBCZn8bM
         epXKrQtZswPggaRgmebsXPy72F+87TqNgiEOv7/hjwRsf+5xGlkxaj1Cavn29gHcSiir
         8gVjUY3iaDSvWlBwXKP6/N2mfnwyjsdylTfL3N4WXOoeJhBTyksduxZdYRDVPEenxK41
         e7SjW1T+8QA091QNxC3ef3O50hzyAnpO6vn0k2/vxl6IIj/Bt3c9RwPCRhvNAxlURxIC
         CCX37YvD0MP45pfZ65cUCKYZk+mbQiIYMD+R3ij+Bb3zWnHRGCS2HtFxiWVyqej8iNbq
         TAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688416132; x=1691008132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btFntjY0O3IvQAR+9HWAi9QrudxEpvSJmgYuJTKvtTI=;
        b=aR+BlGzdp4JslBV8ucE7FF70xd58R3QPbnDQwHh9lWDkDdsVwbRhEP1T1NS+T9NCqq
         uFRE8kJje2hz3S7QWrg15pL8FHZy6UGgls6eGsj+doLZh3zFVf2tQOi9yXaO0nfPKT2W
         /3QxYPk3eh3IwS6N5mrukjepATZ8rIZA32rlymV12/w7HD7+OAd5LXmaGemX//9TG8NH
         XwG0Vpr3Yuwhz1u+9hOHFNdkSmh9C2mFOwVk2R5WSKuhgWxGEpv1bZZ9Xv/0PApQBR/T
         kwQgdgXw6yGC1nVJA9NDWQMCTHSkFPECiFUxaK7IjBD/EoL5Rm+5g1q6Rs8NHE0sON4m
         T38Q==
X-Gm-Message-State: ABy/qLaxYpjOinw5fFYZhgt7G00JmcNwvHQSRA1pRxVcJYjflrDL0tGg
	T9PoLEEBjHVouMLcL6VxYUTlNjXogqPaXko9p18=
X-Google-Smtp-Source: APBJJlEouvycMaNq7SW8pfQsXaQaCcJyu1kZ1tJurr0d+7z68IgdVSBIE6WLPsH2RfuMtgVa8aYFuKsE0q+6bUbE7lc=
X-Received: by 2002:a17:907:76ab:b0:992:d013:1132 with SMTP id
 jw11-20020a17090776ab00b00992d0131132mr6440806ejc.1.1688416132254; Mon, 03
 Jul 2023 13:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <CAFBinCAJ1E6JKmFTuaJwGpd_MBzHMZ0mMj-1AE3TNeB2_72nZA@mail.gmail.com>
In-Reply-To: <CAFBinCAJ1E6JKmFTuaJwGpd_MBzHMZ0mMj-1AE3TNeB2_72nZA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Jul 2023 22:28:41 +0200
Message-ID: <CAFBinCAWsurgCqxCJMP_xo-uj-FsPpYK-6e_6KAGMdDJB2adFA@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdhc: Fix initialization frozen issue
To: Ziyang Huang <hzyitc@outlook.com>
Cc: ulf.hansson@linaro.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_132854_750694_9DBC9309 
X-CRM114-Status: GOOD (  22.76  )
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

SGVsbG8sCgpPbiBNb24sIEp1biAxOSwgMjAyMyBhdCA5OjUx4oCvUE0gTWFydGluIEJsdW1lbnN0
aW5nbAo8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxs
bywKPgo+IGZpcnN0IG9mIGFsbDogdGhhbmsgeW91IGZvciB0aGlzIHBhdGNoIQo+Cj4gT24gTW9u
LCBKdW4gMTksIDIwMjMgYXQgNzozNuKAr1BNIFppeWFuZyBIdWFuZyA8aHp5aXRjQG91dGxvb2su
Y29tPiB3cm90ZToKPiA+Cj4gPiBDb21taXQgNGJjMzFlZGViZGU1ICgibW1jOiBjb3JlOiBTZXQg
SFMgY2xvY2sgc3BlZWQgYmVmb3JlIHNlbmRpbmcKPiA+IEhTIENNRDEzIikgc2V0IEhTIGNsb2Nr
ICg1Mk1IeikgYmVmb3JlIHN3aXRjaGluZyB0byBIUyBtb2RlLiBGb3IgdGhpcwo+ID4gZnJlcSwg
RkNMS19ESVY1IHdpbGwgYmUgc2VsZWN0ZWQgYW5kIGRpdiB2YWx1ZSBpcyAxMCAocmVnIHZhbHVl
IGlzIDkpLgo+ID4gVGhlbiB3ZSBzZXQgcnhfY2xrX3BoYXNlIHRvIDExIG9yIDE1IHdoaWNoIGlz
IG91dCBvZiByYW5nZSBhbmQgbWFrZQo+ID4gaGFyZHdhcmUgZnJvemVuLiBBZnRlciB3ZSBzZW5k
IGNvbW1hbmQgcmVxdWVzdCwgbm8gaXJxIHdpbGwgYmUKPiA+IGludGVycnVwdGVkIGFuZCB0aGUg
bW1jIGRyaXZlciB3aWxsIGtlZXAgdG8gd2FpdCBmb3IgcmVxdWVzdCBmaW5pc2hlZCwKPiA+IGV2
ZW4gZHVybmluZyByZWJvb3RpbmcuCj4gSSB0aGluayB0aGlzIGlzIHRoZSBleGFjdCBzYW1lIHBy
b2JsZW0gSSByZXBvcnRlZCBzb21lIGRheXMgYWdvOiBbMF0KPiBVbGYgaXMgcXVlc3Rpb25pbmcg
d2hldGhlciB3ZSBwcm9wZXJseSBzdXBwb3J0IDUyTUh6IGNsb2NrcyBjb3JyZWN0bHksCj4gc28g
SSB0aGluayB5b3UncmUgb250byBzb21ldGhpbmchCj4KPiBTbyB0aGlzIGlzIGFuIGV4Y2VsbGVu
dCBmaW5kaW5nISBJIGNhbiBjb25maXJtIHRoYXQgdXNpbmcgcnhfY2xrX3BoYXNlCj4gb2YgMSBt
YWtlcyBteSBPZHJvaWQtQzEgZU1NQyB3b3JrIGFnYWluIDotKQo+Cj4gPiBTbyBsZXQncyBzZXQg
YSBjb21tb24gdmFsdWUgLSAxIGp1c3QgZm9yIGluaXRpYWxpemF0aW9uLiBUaGVuIGxldAo+ID4g
bWVzb25fbXhfc2RoY19leGVjdXRlX3R1bmluZygpIHRvIGZpbmQgdGhlIGFjY3VyYXRlIHZhbHVl
IGZvciBkYXRhCj4gPiB0cmFuc2Zlci4KPiBBcyBmYXIgYXMgSSBrbm93IHVuY29uZGl0aW9uYWxs
eSB1c2luZyB2YWx1ZSAxIGNhbiBuZWdhdGl2ZWx5IGFmZmVjdAo+IG90aGVyIGRldmljZXMuCj4g
SSdtIGFzc3VtaW5nIHRoYXQgeW91J3JlIHRlc3Rpbmcgb24gYW4gT2Ryb2lkLUMxIG9yIHNpbWls
YXIgYm9hcmQgd2l0aAo+IEhTMjAwIGVNTUM6Cj4gT24gdGhvc2UgU29DICsgZU1NQyBjb21iaW5h
dGlvbnMgd2UgZG8gc3VwcG9ydC4gQnV0IG9uIG90aGVyIGJvYXJkcwo+IChmb3IgZXhhbXBsZSBN
ZXNvbjhiIEVDLTEwMCAvIEVuZGxlc3MgTWluaSkgdGhlcmUncyBubyBIUzIwMCBzdXBwb3J0Cj4g
YmVjYXVzZSB0aGUgZU1NQyBpcyBjb25uZWN0ZWQgd2l0aCAzLjNWIElPIGxpbmVzLiBTbyB0dW5p
bmcgaXMgbm90Cj4gZXhlY3V0ZWQgdGhlcmUgKGlmIEkgcmVjYWxsIGNvcnJlY3RseSkuCj4KPiBX
aGF0IGRvIHlvdSB0aGluayBhYm91dCBhZGRpbmcgYSBzcGVjaWFsIGNhc2UgZm9yIHRoZSA1MU1I
eiAiYWN0dWFsCj4gY2xvY2sgcmF0ZSIgYW5kIGFkZGluZyBhIGNvbW1lbnQgdGhhdCBpdCB3YXMg
Zm91bmQgYnkgbWFudWFsIHRlc3Rpbmc/Cj4gRm9yIHNvbWUgcmVhc29uICh0aGF0IEkgZG9uJ3Qg
dW5kZXJzdGFuZCkgQW1sb2dpYydzIHZlbmRvciBkcml2ZXIKPiBtYXhlcyBvdXQgYXQgNDcuMjJN
SHogKHByZXN1bWFibHkgYmVjYXVzZSB0aGV5IGxpbWl0IHRoZW1zZWx2ZXMgdG8KPiB1c2luZyBG
Q0xLX0RJVjMgYXMgaW5wdXQgb25seSAtIGJ1dCBJIGRvbid0IGdldCB3aHkuLi4pLgpEaWQgeW91
IGhhdmUgdGhlIGNoYW5jZSB0byBsb29rIGludG8gbXkgY29tbWVudD8gSSB3b3VsZCBsaWtlIHRv
IGhlYXIKeW91ciBvcGluaW9uIG9uIHRoaXMgdG9waWMhCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
