Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F6BC36011
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Mar 2025 19:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78nFygefeWdfYzsZiFJqev9jJJg7/KYFwLDxclbvMuA=; b=KZeTUoA/JxmWoz
	TlZrT6zSnjRrO0lkL3zW6rLc3APJN0ZdtalHWOjK3oURJD5NjbxQl1JjHOM9YDKrco/cJd/EhH03V
	FK7WeZfuREpnMkoF0YSO45UDEMvB4STQAn2rZvETausRyRv/FrH28LlmbzJe5YCfY2ORqWT7iz43K
	YKlx1duIct8VttjhVP06Syl/FN9lJILiCI+qHy06DQUgc/V0FmmiWmSJPxS/6UZkvIz0rnnH5OD18
	bbHuFTk9sFJfR6WHisOr7YD4guCqFAThLKmHmc0zZ7Q2jhW9+b9+wLJQGJQXLcdzUERkRHCVkyEXy
	2CHJwQgQherCfxK+LmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKjQ-00000001E0u-1WL8;
	Mon, 31 Mar 2025 19:23:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKVT-00000001CLK-2aRe
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Mar 2025 19:09:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224171d6826so63319565ad.3
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Mar 2025 12:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1743448150; x=1744052950; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weaeyc6Iq5KCbkTdB71O6escmnn+pUPOzFfZbmsaj8Q=;
        b=N1i+nDbhCResZyBgGdIVYgNktr/lcCMLWsyOBInT25ITYEFiaKZFIZXBtKT5wFp8oy
         TwZH45STg9iToy6Z3HrRBIEBfkaGkCMM5RJ73DSQKUF74+sqTsiWpLF2ujBmcuIq4wXS
         nMMRTniI8oW2MxPE5O6OvPD4wiCWWAV22VCFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743448150; x=1744052950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weaeyc6Iq5KCbkTdB71O6escmnn+pUPOzFfZbmsaj8Q=;
        b=ObU6eIr9+bbDStczV3qGZB0wJtWrlHhiMKhGSxxccfkejeWA4QzddyHotJS9TU5ecK
         XTX3Cmqnq6DlSWC05TEWeQlyP3IpLTzfZ8FS/TnvSlXsJDvU0ahT/3WkBPtjMXVZfDWd
         j85YjL0IjAuX9g8HH7jT+zGBwGGDIUnBj/FbaYgxWp+9Qv+eUuc9aSpH3SM4Jpti3lYC
         NDczqblxeMMLXmOnAl75Y+0ZqZdn4hPyOLNqkTUQnKMXK93c5S9g0tR7dDWa3Z3KV1+3
         IJOmvtp1DDNaOnr3cZNByD7ViygMvCYhE9OOCztq19GtycVck8dte5eD+fKyg3p8XSMH
         m9ag==
X-Forwarded-Encrypted: i=1; AJvYcCUcHtfGvnwYUBkEkPmgcyrJ/V41dMTEhv7/kJyDgIzT7z17kX3i6mAWbT2jltkWAFNnlzM4fzhfYnfCz46v@lists.infradead.org
X-Gm-Message-State: AOJu0YyTSXWWfQ6HqqJnqvz+cmQgLa6b24Nw6mQzWiuyjvvLBKlTHvNP
	IlPPwaJ8qNlnPYaatoiVQIExgvqx4vXQFp3f5Lg3WZpX1Pr1ceRVwnrtwTir0JlKh+225utds3n
	CPiB9HyV/2/aIGDujtveD5x+MTRNwfq+BJkvAH6XiUb9fWmfjs+Qjy2lE
X-Gm-Gg: ASbGncutmqcGt5KlT7L0OnAzEhUStweY1PQowEBQ/eUOtoZvM47jY9w/6HtDaztgJPA
	paFX98gDttFpB9bRxf67cGRjlHhtKiSYptIh/FuZfnivgVsViqyLpBAyKOoQYjMHX/isywVhxca
	Qub4RzTc/x5TK7MB/McpkE/+w=
X-Google-Smtp-Source: AGHT+IHI9tcVsJv+l9FCmeVZ2DxgRcZQhSRLltSRHjgXul/dSDhc9edkYByshaEyeXpvopZ8spvequ357SvBvqUtWE8=
X-Received: by 2002:a17:90b:5450:b0:2ee:8ea0:6b9c with SMTP id
 98e67ed59e1d1-30531fa13bbmr20311472a91.12.1743448150396; Mon, 31 Mar 2025
 12:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
 <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch> <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
In-Reply-To: <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
From: Da Xue <da@lessconfused.com>
Date: Mon, 31 Mar 2025 15:09:00 -0400
X-Gm-Features: AQ5f1JocGacIomP9QycHriI_2lADeFj1Us7oWxzEiuO6mpCv_sUeGwQrjba2Abg
Message-ID: <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Da Xue <da@libre.computer>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, 
	linux-amlogic@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
	"David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	Heiner Kallweit <hkallweit1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_120911_677824_3502EE78 
X-CRM114-Status: GOOD (  25.84  )
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

T24gTW9uLCBNYXIgMzEsIDIwMjUgYXQgOTo1NeKAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIE1vbiwgTWFyIDMxLCAyMDI1IGF0
IDAzOjQzOjI2UE0gKzAyMDAsIEFuZHJldyBMdW5uIHdyb3RlOgo+ID4gT24gTW9uLCBNYXIgMzEs
IDIwMjUgYXQgMDc6NDQ6MjBBTSArMDAwMCwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiA+ID4g
RnJvbTogRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRlcj4KPiA+ID4KPiA+ID4gVGhpcyBiaXQgaXMg
bmVjZXNzYXJ5IHRvIGVuYWJsZSBwYWNrZXRzIG9uIHRoZSBpbnRlcmZhY2UuIFdpdGhvdXQgdGhp
cwo+ID4gPiBiaXQgc2V0LCBldGhlcm5ldCBiZWhhdmVzIGFzIGlmIGl0IGlzIHdvcmtpbmcsIGJ1
dCBubyBhY3Rpdml0eSBvY2N1cnMuCj4gPiA+Cj4gPiA+IFRoZSB2ZW5kb3IgU0RLIHNldHMgdGhp
cyBiaXQgYWxvbmcgd2l0aCB0aGUgUEhZX0lEIGJpdHMuIFUtYm9vdCBhbHNvCj4gPiA+IHNldHMg
dGhpcyBiaXQsIGJ1dCBpZiB1LWJvb3QgaXMgbm90IGNvbXBpbGVkIHdpdGggbmV0d29ya2luZyBz
dXBwb3J0Cj4gPiA+IHRoZSBpbnRlcmZhY2Ugd2lsbCBub3Qgd29yay4KPiA+ID4KPiA+ID4gRml4
ZXM6IDlhMjRlMWZmNDMyNiAoIm5ldDogbWRpbzogYWRkIGFtbG9naWMgZ3hsIG1kaW8gbXV4IHN1
cHBvcnQiKTsKPiA+ID4gU2lnbmVkLW9mZi1ieTogRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRlcj4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBn
bWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiBSZXNlbmRpbmcgb24gYmVoYWxmIG9mIERhIFh1ZSB3
aG8gaGFzIGVtYWlsIHNlbmRpbmcgaXNzdWVzLgo+ID4gPiBDaGFuZ2VzIHNpbmNlIHYxIFswXToK
PiA+ID4gLSBSZW1vdmUgYmxhbmsgbGluZSBiZXR3ZWVuIEZpeGVzIGFuZCBTb0IgdGFncwo+ID4g
PiAtIFN1Ym1pdCB3aXRob3V0IG1haWwgc2VydmVyIG1hbmdsaW5nIHRoZSBwYXRjaAo+ID4gPiAt
IE1pbm9yIHR3ZWFrcyB0byBzdWJqZWN0IGxpbmUgYW5kIGNvbW1pdCBtZXNzYWdlCj4gPiA+IC0g
Q0MgdG8gc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gPgo+ID4gPiBbMF0gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFtbG9naWMvcGF0Y2gvQ0FDcXZSVWJ4LUtz
ck13Q0hZUVM2ZUdYQm9oeW5EOFExQ1F4PTg9OVZocVppMTNCQ1FRQG1haWwuZ21haWwuY29tLwo+
ID4gPgo+ID4gPiAgZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1tZXNvbi1neGwuYyB8IDMgKyst
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9tZGlvL21kaW8tbXV4LW1lc29uLWd4
bC5jIGIvZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1tZXNvbi1neGwuYwo+ID4gPiBpbmRleCAw
MGM2NjI0MDEzNmIuLmZjNTg4MzM4NzcxOCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQv
bWRpby9tZGlvLW11eC1tZXNvbi1neGwuYwo+ID4gPiArKysgYi9kcml2ZXJzL25ldC9tZGlvL21k
aW8tbXV4LW1lc29uLWd4bC5jCj4gPiA+IEBAIC0xNyw2ICsxNyw3IEBACj4gPiA+ICAjZGVmaW5l
ICBSRUcyX0xFREFDVCAgICAgICAgICAgICAgIEdFTk1BU0soMjMsIDIyKQo+ID4gPiAgI2RlZmlu
ZSAgUkVHMl9MRURMSU5LICAgICAgICAgICAgICBHRU5NQVNLKDI1LCAyNCkKPiA+ID4gICNkZWZp
bmUgIFJFRzJfRElWNFNFTCAgICAgICAgICAgICAgQklUKDI3KQo+ID4gPiArI2RlZmluZSAgUkVH
Ml9SRVNFUlZFRF8yOCAgQklUKDI4KQo+ID4KPiA+IEl0IG11c3QgaGF2ZSBzb21lIG1lYW5pbmcs
IGl0IGNhbm5vdCBiZSByZXNlcnZlZC4gU28gbGV0cyB0cnkgdG8gZmluZAo+ID4gYSBiZXR0ZXIg
bmFtZS4KPgo+IEluZGVlZCwgdGhhdCB3YXMgbXkgdGhvdWdodHMgYXMgd2VsbCwgYnV0IEFuZHJl
dyBnb3QgaGlzIHJlcGx5IGluCj4gYmVmb3JlIEkgZ290IGFyb3VuZCB0byByZXBseWluZyEKClRo
ZSBkYXRhc2hlZXRzIGRvbid0IGhhdmUgbXVjaCBpbiB0aGUgd2F5IG9mIGluZm9ybWF0aW9uIGFi
b3V0IHRoaXMKcmVnaXN0ZXIgYml0LiBUaGUgQW1sb2dpYyBHWEwgZGF0YXNoZWV0IGlzIG5vdG9y
aW91c2x5IGluYWNjdXJhdGUuCgpFVEhfUkVHMiAwWEM4ODM0NTU4CjI5OjI4IFIgMHgxIHJlc2Vy
dmVkCgpJdCBjbGFpbXMgdGhlIGJpdCBpcyByZWFkIG9ubHkgd2hpbGUgdGhlIEJTUCBoYXJkIGNv
ZGVzIHRoZSBzZXR0aW5nIG9mCnRoaXMgcmVnaXN0ZXIuIEkgYW0gb3BlbiB0byBhbnkgbmFtZSBm
b3IgdGhpcyByZWdpc3RlciBiaXQuClRoaXMgaXMgdGhlIG9ubHkgdGhpbmcgaG9sZGluZyB1cCBk
aXN0cm8gbmV0Ym9vdGluZyBmb3IgdGhlc2UgdmVyeQpwb3B1bGFyIGNoaXAgZmFtaWx5LgoKPgo+
IC0tCj4gUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2
ZWxvcGVyL3BhdGNoZXMvCj4gRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERl
Y2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
