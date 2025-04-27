Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F17CC369D5
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Apr 2025 04:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlTfa+oKazNkax0n1wJUBeFI1/Ko7oObNJg9BBgQGCo=; b=Wno/lQfZLWkT02
	f/u/owpwJZZeO9i+Tak9/9OgUKhpkmYUOoey/AZkUsg47lYNHPgCjiJrpjVn1L8IUF2vaXjetPZNp
	CF7gu8tkkW8YLkfmgI66xHF4XMHEISRDqkwvBVmZ5UW9uCd2XfvDSlfjW2p7Lc9a79Ie2xGUuAVaA
	8mEDNmoVTdBYx+36A25SH5fhV2I638HqfPGWS3HdF5hNE4rKmhDBVWh3pFi4CHgScFpgfcvBx1xUT
	AeN6Yz6OW8mbPGNfr1AoAeDg3ChsPQ0k3EzSTVVfXP/6avmEDhG+2ELzN1XrIot1OZ+XKc+V52ofa
	iFYOGnM6ixrWj8eC/9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8tnP-00000002sgU-2fn5;
	Sun, 27 Apr 2025 04:39:15 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8tnM-00000002sg4-3oxN;
	Sun, 27 Apr 2025 04:39:13 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b10956398so4128506e87.0;
        Sat, 26 Apr 2025 21:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745728750; x=1746333550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNo7qe9Lz9mlSgoeITrfWOs7/oXxKQcv8brSPsNOFbQ=;
        b=wNGVN7jC53fx5WeRQ0lS+hV0BoMyJf3irvNcUMh0XGfrOo8hB4Tjddg6iehgQXlHx2
         drgxhyJRKLBWrswX189CZCy7QIAFOp7WMghkyu6yxCFgyrlT6Bv4yHWvTiqoSx+29lYN
         ODNOVqV7QdhkfymfrmTT9izPcK9rjkxbVy6DGIVdTuHyXeAQWt2FhYcWe9srX5/M4fuf
         ndIM9uaAra9/0AfpiKMThofpffKlw3D1FYAEGXsQ35tCTy40SVm1nr6mmK0gsALZubhK
         H0/e5hklzsLmFFW5MuBMTrLho78TU+tVyhFozo1ZPrDlBHO7bOtM6a100BtsU3VQ547a
         EL5w==
X-Forwarded-Encrypted: i=1; AJvYcCWoa2jxTRt+f/Ock8gLdsA3aDPiSXPhDND+11G8wL7B6FncORp2QOJH7/q4ppHhKYR4FbSGStWylRoiE40I@lists.infradead.org, AJvYcCXQAvLowUXW1/VwayqXQ+JNiMJp6gIbp0q3b/U8Ncts64tJjQmBxLLQgDbxN99Mok4ckxu2e4Kv7tyxC6jCIs5XLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEaj1TR4AiBjfn9VWiDZEvP04cxBsBGY2wmJUarinlpsPhD8/5
	7R+Gwv8lrpRO5aCDBDNf5tbBfSerSKbXGbYkIqoB8enhvo15rhW584og0bT/
X-Gm-Gg: ASbGncuhqDRHt8FK8C1+xgoX6oHeW4OD/EVjV8ZreCJ7peggIeDQODvlCdbS87eyJvy
	xS1BcyGK3/Qctgf+MslIBAkv4XbdsVsTqdD6CDJH1f1I+e3GemOAeaR21NdiPTcffLpTDfJjWM3
	gHs2J9Ni5txx6dbckCBSc6WazfbPuUKoHSW8zCZJkkpNdO83y8Hs0FYF0vwU2swU7DHmrALq4MC
	fdMvbYYzmSwcstoRU8jV525IHQH/MnzFlzCIhet+zzEWrhwf+6MJV33hpLiwexoH+48QiMrfRmb
	2bSPPdOCHkanl2JFxawFM9ZJb4O1/px5K/ReUj1gX6B7txnuAC1eJOimp7Aip0OopYcJOfI55A=
	=
X-Google-Smtp-Source: AGHT+IHMAdMz74N/iPYvpibEVeXhUesO/X5tupKSgC3C872/ZTlfitZxXGIfU+3QgyoozBc7+OSdZw==
X-Received: by 2002:a05:6512:6288:b0:54e:8189:2eac with SMTP id 2adb3069b0e04-54e81892f7fmr2772840e87.12.1745728749647;
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2595dsm1251560e87.39.2025.04.26.21.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30effbfaf61so41198891fa.0;
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtKOerDi/4CtbiqZgHzbUC3fJv2P0RAXA3yY+uVPzguDXGyhbAqVr4BCw6KZ87uIWjWgdYvu45Uvvp/zTzLIM6Pw==@lists.infradead.org, AJvYcCW2uw212wjbHlV865PtyAsDpXUPAwHCafOUTFH1pFDPvqI1D8EVedd+93Z2PSXGTadfEXJUlCbR8exO/ltz@lists.infradead.org
X-Received: by 2002:a05:651c:12c8:b0:30b:fc16:d482 with SMTP id
 38308e7fff4ca-317cc3b4babmr34833351fa.3.1745728749245; Sat, 26 Apr 2025
 21:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:38:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
X-Gm-Features: ATxdqUFqwWzMoc8bpc0UG6R3aiwwevesO0_bqj7uRg6TeOMZWI1Q6QZaB7zJ9oE
Message-ID: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: sunxi: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_213912_950479_B8E4AEC8 
X-CRM114-Status: GOOD (  16.95  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgNCwgMjAyNSBhdCA3OjU34oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEVuYWJsaW5nIHRoZSBjb21w
aWxlIHRlc3Qgc2hvdWxkIG5vdCBjYXVzZSBhdXRvbWF0aWMgZW5hYmxpbmcgb2YgYWxsCj4gZHJp
dmVycy4gIFJlc3RyaWN0IHRoZSBkZWZhdWx0IHRvIEFSQ0ggYWxzbyBmb3IgaW5kaXZpZHVhbCBk
cml2ZXJzLCBldmVuCj4gdGhvdWdoIHRoZWlyIGNob2ljZSBpcyBub3QgdmlzaWJsZSB3aXRob3V0
IHNlbGVjdGluZyBwYXJlbnQgS2NvbmZpZwo+IHN5bWJvbCwgYmVjYXVzZSBvdGhlcndpc2Ugc2Vs
ZWN0aW5nIHBhcmVudCB3b3VsZCBzZWxlY3QgdGhlIGNoaWxkIGR1cmluZwo+IGNvbXBpbGUgdGVz
dGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9jbGsvc3VueGkvS2NvbmZpZyB8
IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zdW54aS9LY29uZmlnIGIvZHJp
dmVycy9jbGsvc3VueGkvS2NvbmZpZwo+IGluZGV4IDFjNGU1NDMzNjZkZGI3NmMxNjY5YjU3N2Mx
YWMzMzdkYzFiZTYxNmYuLjVlMmY5MmJmZTQxMjA5ODFhYjY4YjE3NWRjZTc5OGFjOGIzMjY4YjAg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvc3VueGkvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMv
Y2xrL3N1bnhpL0tjb25maWcKPiBAQCAtMiwxMyArMiwxMyBAQAo+ICBtZW51Y29uZmlnIENMS19T
VU5YSQo+ICAgICAgICAgYm9vbCAiTGVnYWN5IGNsb2NrIHN1cHBvcnQgZm9yIEFsbHdpbm5lciBT
b0NzIgo+ICAgICAgICAgZGVwZW5kcyBvbiAoQVJNICYmIEFSQ0hfU1VOWEkpIHx8IENPTVBJTEVf
VEVTVAo+IC0gICAgICAgZGVmYXVsdCB5Cj4gKyAgICAgICBkZWZhdWx0IChBUk0gJiYgQVJDSF9T
VU5YSSkKCkp1c3Qgd29uZGVyaW5nLCBzaG91bGRuJ3QgdGhpcyBjaGFuZ2UgYWxvbmUgYmUgZW5v
dWdoPyBUaGUgcmVtYWluaW5nCktjb25maWcgb3B0aW9ucyBhcmUgZ2F0ZWQgYnkgdGhpcyBvbmUu
CgpDaGVuWVUKCj4gIGlmIENMS19TVU5YSQo+Cj4gIGNvbmZpZyBDTEtfU1VOWElfQ0xPQ0tTCj4g
ICAgICAgICBib29sICJMZWdhY3kgY2xvY2sgZHJpdmVycyIKPiAtICAgICAgIGRlZmF1bHQgeQo+
ICsgICAgICAgZGVmYXVsdCBBUkNIX1NVTlhJCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIExl
Z2FjeSBjbG9jayBkcml2ZXJzIGJlaW5nIHVzZWQgb24gb2xkZXIgKEExMCwgQTEzLCBBMjAsCj4g
ICAgICAgICAgIEEyMywgQTMxLCBBODApIFNvQ3MuIFRoZXNlIGRyaXZlcnMgYXJlIGtlcHQgYXJv
dW5kIGZvcgo+IEBAIC0xOSwxNCArMTksMTQgQEAgY29uZmlnIENMS19TVU5YSV9DTE9DS1MKPgo+
ICBjb25maWcgQ0xLX1NVTlhJX1BSQ01fU1VONkkKPiAgICAgICAgIGJvb2wgIkxlZ2FjeSBBMzEg
UFJDTSBkcml2ZXIiCj4gLSAgICAgICBkZWZhdWx0IHkKPiArICAgICAgIGRlZmF1bHQgQVJDSF9T
VU5YSQo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBMZWdhY3kgY2xvY2sgZHJpdmVyIGZvciB0
aGUgQTMxIFBSQ00gY2xvY2tzLiBUaG9zZSBhcmUKPiAgICAgICAgICAgdXN1YWxseSBuZWVkZWQg
Zm9yIHRoZSBQTUlDIGNvbW11bmljYXRpb24sIG1vc3RseS4KPgo+ICBjb25maWcgQ0xLX1NVTlhJ
X1BSQ01fU1VOOEkKPiAgICAgICAgIGJvb2wgIkxlZ2FjeSBzdW44aSBQUkNNIGRyaXZlciIKPiAt
ICAgICAgIGRlZmF1bHQgeQo+ICsgICAgICAgZGVmYXVsdCBBUkNIX1NVTlhJCj4gICAgICAgICBo
ZWxwCj4gICAgICAgICAgIExlZ2FjeSBjbG9jayBkcml2ZXIgZm9yIHRoZSBzdW44aSBmYW1pbHkg
UFJDTSBjbG9ja3MuCj4gICAgICAgICAgIFRob3NlIGFyZSB1c3VhbGx5IG5lZWRlZCBmb3IgdGhl
IFBNSUMgY29tbXVuaWNhdGlvbiwKPiBAQCAtMzQsNyArMzQsNyBAQCBjb25maWcgQ0xLX1NVTlhJ
X1BSQ01fU1VOOEkKPgo+ICBjb25maWcgQ0xLX1NVTlhJX1BSQ01fU1VOOUkKPiAgICAgICAgIGJv
b2wgIkxlZ2FjeSBBODAgUFJDTSBkcml2ZXIiCj4gLSAgICAgICBkZWZhdWx0IHkKPiArICAgICAg
IGRlZmF1bHQgQVJDSF9TVU5YSQo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBMZWdhY3kgY2xv
Y2sgZHJpdmVyIGZvciB0aGUgQTgwIFBSQ00gY2xvY2tzLiBUaG9zZSBhcmUKPiAgICAgICAgICAg
dXN1YWxseSBuZWVkZWQgZm9yIHRoZSBQTUlDIGNvbW11bmljYXRpb24sIG1vc3RseS4KPgo+IC0t
Cj4gMi40NS4yCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
