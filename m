Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADB7C001B0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 21:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0a5BFoSoA/t34pwPIErnguQTTO2ZQCFwPcFAyfjOl/c=; b=iXfjuymmWNQW4G
	RW7w8ksuRn270esio6LFsigfOrHVtLz1/vLf3WRC3BYK7IFKwzVb6CKnnltuTq0qQj0s/rwBxpBKo
	E091stwLD/5i/aBYTU/6eF+7TJX/A8715Fyk+v1vj2rVMonQFR+kbpFqWeXwuBJJ3faqYFXQ0m933
	GqYvTAMcYT6hQZPLTLju5whq1UUBGn1vTk2YixDqs8Yf0WMyLQJ+KpJwRWgVu8D+iJO3c4Ug9iqEx
	2l/DOw/zHftzJg8KdQCBa4wA0HzHxWXB2pj18cO0hmoUxcrfo36K1DNmljW+yZk6AusSJ+zgs/JQV
	zFsXeWQ0q9igRJybKHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTUaL-003WnW-0b;
	Tue, 08 Aug 2023 21:49:49 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTUaH-003WmJ-2a
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Aug 2023 21:49:47 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9c55e0fbeso95333031fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Aug 2023 14:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691531382; x=1692136182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qYerQWFf1ix5KHtY99MS4jSB8DQAs9co/lnQIZ+dhI=;
        b=FrNaFxjlwpRFm2ZaqTEVKKumXjnd7ComOOWOZmrjXYgDYMvEXazM7CCXphzVh1/C/K
         NP5sjTK0dIQm0/9wGmf7nEwDV7Xk8f+T97AbHbMm4JkjPDfbkskBicWsAACfRTGKUHkG
         zuC69RP3+07PAyZhrHIpT6PPZ98X9xyJu+2DEkSGWP1HRqHeQ1YU8pWInTUVhylbG2g4
         bzAC745EN5wdU3rCMBBBZT6q6cD2O+q2EGddA4xv+55YkHsb2lE90EoPvp2S73b9Wgfa
         bcZc3s1S6HVntugMBSpBUNjQUovF4F1LmIketV9E5WzR9zdf+AT9GddV1aRJ5XYi7wY+
         qtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691531382; x=1692136182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qYerQWFf1ix5KHtY99MS4jSB8DQAs9co/lnQIZ+dhI=;
        b=bxyouSbb2jjdEZ6pV1C7JAK2G6PpahSz+U+ZvdnOIDzUbmXByt5A8L6ZSmXS3mrZta
         gpVuCBNaDtcKiav80VYAw8yaungmyvS01HIex8YFlQUCZrnzwPSTothehAY0hGwGPLNS
         fJvuw6F/T/DsHCswFFA04XlEA7Q452Fli80I03DTt3ZRJUQmTaa/QmNicbyoaUCYjLcE
         aQNyJIHWTYMis5JuiidfMRSxGOrP/pRBcTUWMScAk6RLBpyC7Ic9TIc+Xcb1FZwSGoAY
         5QP5wOKSWHeb7UcaYfAR2mnR2TcNW59xXGOrIP+OKZ+n4nXNV04OxzdJyas5q1yBdnhF
         CqVQ==
X-Gm-Message-State: AOJu0Yzg1FNICF6PuE5qOmj8txoAjSUeuKTSeieC060wXwxETPY+1UNM
	t52hqVdqVMb8MIF3aqiNSuvuV1Q5/VsNwKAiVeGVXA==
X-Google-Smtp-Source: AGHT+IH2g37CljZBjyKryUTqwvcCbghj2op+ujnMBCmtdJr8xIQF/zKIPIsTftv+x+by2YvZLpwCGXHcH4ENvmiFF18=
X-Received: by 2002:a2e:9b86:0:b0:2b9:e501:a6a6 with SMTP id
 z6-20020a2e9b86000000b002b9e501a6a6mr563511lji.30.1691531381689; Tue, 08 Aug
 2023 14:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230808050016.1911447-1-da@libre.computer> <b8931b6c-5b35-8477-d50f-b7a43b13615f@gmail.com>
In-Reply-To: <b8931b6c-5b35-8477-d50f-b7a43b13615f@gmail.com>
From: Luke Lu <luke.lu@libre.computer>
Date: Tue, 8 Aug 2023 21:49:30 +0000
Message-ID: <CAAzmgs75L6Y3PU1SF8Uvh1Z2cqt86HmaRKFn088yzRK73mfnLA@mail.gmail.com>
Subject: Re: [PATCH v3] net: phy: meson-gxl: implement meson_gxl_phy_resume()
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Da Xue <da@libre.computer>, Andrew Lunn <andrew@lunn.ch>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_144945_864022_55F0D0F0 
X-CRM114-Status: GOOD (  28.54  )
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

SEkgSGVpbmVyIEthbGx3ZWl0OgoKT24gVHVlLCBBdWcgOCwgMjAyMyBhdCA2OjQy4oCvQU0gSGVp
bmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiAwOC4wOC4y
MDIzIDA3OjAwLCBEYSBYdWUgd3JvdGU6Cj4gPiBBZnRlciBzdXNwZW5kIGFuZCByZXN1bWUsIHRo
ZSBtZXNvbiBHWEwgaW50ZXJuYWwgUEhZIGNvbmZpZyBuZWVkcyB0bwo+Cj4gVG8gYXZvaWQgbWlz
dW5kZXJzdGFuZGluZ3M6Cj4gWW91IG1lYW4gc3VzcGVuZC9yZXN1bWUganVzdCBvZiB0aGUgUEhZ
LCBvciBvZiB0aGUgc3lzdGVtPwo+CldlIGZvdW5kIHRoaXMgaXNzdWUgZHVyaW5nIHRoZSB0ZXN0
IG9mIHdob2xlIHN5c3RlbQpzdXNwZW5kL3Jlc3VtZShpbmNsdWRpbmcgZXRoZXJuZXQvbmV0d29y
ayksCnNvIGl0J3MgbW9yZSBwcm9wZXIgdG8gaW50ZXJwcmV0IGFzICJ0aGUgc3lzdGVtIiBoZXJl
Cgo+IERlc2NyaXB0aW9uIHNvdW5kcyBsaWtlIHRoaXMgcGF0Y2ggaXMgYSBmaXggYW5kIHNob3Vs
ZCBnbyB0byBzdGFibGUuCkkgYWdyZWUgaXQncyB3b3J0aCB0aGUgZWZmb3J0IHRvIHB1c2ggdGhl
IHBhdGNoIHRvIHN0YWJsZSB0cmVlLCBidXQKZm91bmQgYSBjb25mbGljdCB3aXRoCmNvbW1pdCA2
OWZmNTNlNGE0YzkgKCJuZXQ6IHBoeTogbWVzb24tZ3hsOiB1c2UgTU1EIGFjY2VzcyBkdW1teSBz
dHVicwpmb3IgR1hMLCBpbnRlcm5hbCBQSFkiKQpJdCB3aWxsIHByZXZlbnQgbWFpbnRhaW5lcnMg
ZG9pbmcgYSBjbGVhbiBjaGVycnktcGljaywgd2UgY2FuIHNsaWdodGx5CnJld29yayB0aGUgcGF0
Y2ggYW5kCnNlbmQgaXQgdG8gdGhlIHN0YWJsZSB0cmVlIHNlcGFyYXRlbHkgb25jZSB0aGlzIHBh
dGNoIGlzIGFjY2VwdGVkIGJ5IG1haW5saW5lLgoKPiBTbyBhZGQgYSBGaXhlcyB0YWcuClN1cmUs
IGFzIHRoZSBpc3N1ZSBpcyBpbnRyb2R1Y2VkIHdpdGggZmlyc3QgcmVzdW1lKCksIHNvIHdpbGwg
YWRkCkZpeGVzOiA3MzM0YjNlNDdhZWUgKCJuZXQ6IHBoeTogQWRkIE1lc29uIEdYTCBJbnRlcm5h
bCBQSFkgZHJpdmVyIikKCj4gQW5kIGEgZm9ybWFsIHJlbWFyazogWW91ciBwYXRjaCBtaXNzZXMg
dGhlIG5ldCAvIG5ldC1uZXh0IGFubm90YXRpb24uCj4KTm90IHN1cmUgaWYgd2UgdW5kZXJzdGFu
ZCB0aGlzIGNvcnJlY3RseSwgZG8geW91IG1lYW4gdGhlIG9uZSBsaW5lCnN1bW1hcnkgb2YgdGhp
cyBwYXRjaD8Kb3IgdGhlIGNvbnRlbnQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlIHRoYXQgbmVlZHMg
dG8gaW1wcm92ZSB0byByZWZsZWN0IHRoaXMgaXMgYW4KZXRoZXJuZXQvbmV0IHJlbGF0ZWQgZml4
PwoKSSdkIGFwcHJlY2lhdGUgaWYgeW91IGNhbiBleHBsYWluIGEgbGl0dGxlIGJpdCBtb3JlLCBz
byB3ZSBjYW4gYmV0dGVyCmZpeCB0aGlzLCB0aGFua3MKCj4gPiBiZSBpbml0aWFsaXplZCBhZ2Fp
biwgb3RoZXJ3aXNlIHRoZSBjYXJyaWVyIGNhbm5vdCBiZSBmb3VuZDoKPiA+Cj4gPiAgICAgICBl
dGgwOiA8Tk8tQ0FSUklFUixCUk9BRENBU1QsTVVMVElDQVNULFVQPiBtdHUgMTUwMCBxZGlzYyBt
cSBzdGF0ZQo+ID4gICAgICAgICAgICAgICBET1dOIGdyb3VwIGRlZmF1bHQgcWxlbiAxMDAwCj4g
Pgo+ID4gQWZ0ZXIgdGhlIHBhdGNoLCByZXN1bWU6Cj4gPgo+ID4gICAgICAgZXRoMDogPEJST0FE
Q0FTVCxNVUxUSUNBU1QsVVAsTE9XRVJfVVA+IG10dSAxNTAwIHFkaXNjIG1xIHN0YXRlIFVQCj4g
PiAgICAgICAgICAgICAgIGdyb3VwIGRlZmF1bHQgcWxlbiAxMDAwCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTHVrZSBMdSA8bHVrZS5sdUBsaWJyZS5jb21wdXRlcj4KPiA+IFNpZ25lZC1vZmYtYnk6
IERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0ZXI+Cj4gPiAtLS0KPiA+IENoYW5nZXMgc2luY2UgdjI6
Cj4gPiAgLSBmaXggbWlzc2luZyBwYXJhbWV0ZXIgb2YgZ2VucGh5X3Jlc3VtZSgpCj4gPgo+ID4g
Q2hhbmdlcyBzaW5jZSB2MToKPiA+ICAtIGNhbGwgZ2VuZXJpYyBnZW5waHlfcmVzdW1lKCkKPiA+
IC0tLQo+ID4gIGRyaXZlcnMvbmV0L3BoeS9tZXNvbi1neGwuYyB8IDE0ICsrKysrKysrKysrKyst
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvcGh5L21lc29uLWd4bC5jIGIvZHJpdmVycy9u
ZXQvcGh5L21lc29uLWd4bC5jCj4gPiBpbmRleCBiYjliMzNiNmJjZTIuLmJiYWQyNmI3YzVhMSAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3BoeS9tZXNvbi1neGwuYwo+ID4gKysrIGIvZHJp
dmVycy9uZXQvcGh5L21lc29uLWd4bC5jCj4gPiBAQCAtMTMyLDYgKzEzMiwxOCBAQCBzdGF0aWMg
aW50IG1lc29uX2d4bF9jb25maWdfaW5pdChzdHJ1Y3QgcGh5X2RldmljZSAqcGh5ZGV2KQo+ID4g
ICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW50IG1lc29uX2d4bF9waHlf
cmVzdW1lKHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpCj4gPiArewo+ID4gKyAgICAgaW50IHJl
dDsKPiA+ICsKPiA+ICsgICAgIGdlbnBoeV9yZXN1bWUocGh5ZGV2KTsKPgo+IFJldHVybiB2YWx1
ZSBvZiB0aGlzIGZ1bmN0aW9uIHNob3VsZCBiZSBjaGVja2VkLgo+CndpbGwgZml4IGluIHY0Cgo+
ID4gKyAgICAgcmV0ID0gbWVzb25fZ3hsX2NvbmZpZ19pbml0KHBoeWRldik7Cj4gPiArICAgICBp
ZiAocmV0KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgcmV0
dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gIC8qIFRoaXMgZnVuY3Rpb24gaXMgcHJvdmlkZWQgdG8g
Y29wZSB3aXRoIHRoZSBwb3NzaWJsZSBmYWlsdXJlcyBvZiB0aGlzIHBoeQo+ID4gICAqIGR1cmlu
ZyBhbmVnIHByb2Nlc3MuIFdoZW4gYW5lZyBmYWlscywgdGhlIFBIWSByZXBvcnRzIHRoYXQgYW5l
ZyBpcyBkb25lCj4gPiAgICogYnV0IHRoZSB2YWx1ZSBmb3VuZCBpbiBNSUlfTFBBIGlzIHdyb25n
Ogo+ID4gQEAgLTE5Niw3ICsyMDgsNyBAQCBzdGF0aWMgc3RydWN0IHBoeV9kcml2ZXIgbWVzb25f
Z3hsX3BoeVtdID0gewo+ID4gICAgICAgICAgICAgICAuY29uZmlnX2ludHIgICAgPSBzbXNjX3Bo
eV9jb25maWdfaW50ciwKPiA+ICAgICAgICAgICAgICAgLmhhbmRsZV9pbnRlcnJ1cHQgPSBzbXNj
X3BoeV9oYW5kbGVfaW50ZXJydXB0LAo+ID4gICAgICAgICAgICAgICAuc3VzcGVuZCAgICAgICAg
PSBnZW5waHlfc3VzcGVuZCwKPiA+IC0gICAgICAgICAgICAgLnJlc3VtZSAgICAgICAgID0gZ2Vu
cGh5X3Jlc3VtZSwKPiA+ICsgICAgICAgICAgICAgLnJlc3VtZSAgICAgICAgID0gbWVzb25fZ3hs
X3BoeV9yZXN1bWUsCj4gPiAgICAgICAgICAgICAgIC5yZWFkX21tZCAgICAgICA9IGdlbnBoeV9y
ZWFkX21tZF91bnN1cHBvcnRlZCwKPiA+ICAgICAgICAgICAgICAgLndyaXRlX21tZCAgICAgID0g
Z2VucGh5X3dyaXRlX21tZF91bnN1cHBvcnRlZCwKPiA+ICAgICAgIH0sIHsKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
