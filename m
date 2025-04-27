Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57381C369AB
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Apr 2025 04:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjRVBn/mQWRXSVEf63FepeWAOWqrEhjfTtmDsmODMHQ=; b=HWbKDL1bs/GH3P
	NXeIhL0Xm3JOjYSFsbjyjtY+vNE21nLJOkpBfNhIf+bBECXqFm2CSna0IrGYKz2ItA7St7+iY4BEu
	cfsB3SBLii0ZZynYjFYSkQtnkEHuEiqLpmfn+P6nF6MMFDkkjZa68dLPcfOXNA7UX73YAN3dP0Lod
	bbiCfpHSdi00qsttWib5HbQrbuKYQtQ/17GzqjsS3utTP9DJUPNGWHsDnbCL6utSNvoxE+NSjsigZ
	c8MI4FtBlPuRqDbvx3lrzzCmbkthODsF6a9Zcnb3NJQNHiBMsXSS7Itw9zgbwGSjTOMwmv6OyfnLz
	4KiLa89GkZJt6RhUOOUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8trJ-00000002sv6-3mEm;
	Sun, 27 Apr 2025 04:43:17 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8trH-00000002sug-2eQl;
	Sun, 27 Apr 2025 04:43:17 +0000
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so12112875ab.0;
        Sat, 26 Apr 2025 21:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745728989; x=1746333789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gISrtxFe1XEI3Oi2O6vm+8m4GXkK+giUIqyVFsOJWKk=;
        b=WDxiI/4s0jicrXIoRlkaEUeFKQib0EK6baYkEpNyuPJcubOHM5PEccO6jTtkYtzlAz
         hgjOo4qqnZGUskiHzzkJaJoKs32/PlMcJu/RWLtXbAryMiZ0J2/pvwhLiu36bbZGfaha
         9JGl/2nDZT916V6PI+n09GflM6lLUp/9x/vggynhY2p8o72j2Mqs2bJUS3vLGZb2EJRV
         4U08E7KVy048pXM2/dJs9nIeBOs1AgLQpHt0JKD8NE0wI91W4b0MleOpuAGUuJfgK8ch
         5P/94sG45hUdoY9SnXC6cW0xRg+Iv7E44tl5jPICAOS0Yyb2KhbsDI0DARaNGHkcfVXx
         i76A==
X-Forwarded-Encrypted: i=1; AJvYcCUrQ5SYAa/pOKTYhCyJvv+7StmYqkv3bmMcK1zncGYYGONZ9U9YM9pQKAyDEOCkuGPPZFl0Roimlu01K8zJQ69Vjw==@lists.infradead.org, AJvYcCVqF/wBL79Yfy81gvsJMxM+i7osYtnxU7oFTmfcJGEcIsabeH1zNpjvt+pepZnBpGG3t2m0YswYMGLg1nU8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeb7OZ8o9kcIEsj1DFRnMpEwsWMkpRUWnKcy/c4ysGobJgATEM
	03aNpFO118ZI9x+bFAT4+HVUHYeos9C4oxARr3OaSIq10o3eugLlsrlje2gkWpo=
X-Gm-Gg: ASbGncvppM6q01R3Cv6q4iQrpt92sIOncD0F45yUUkv1WjGjP+sbxYhRuUvktvUWKlP
	FclZjG4VAxur/i1dWHNp/GJRNul33+UySy00WJO26amFSV4XMLDkESKQVtjuXjW3Ncny5i8mHU9
	bRqBhgMoiQms/Vrl1AfW+6xjc5wOosfTzG7kWefdN4XDjnwGpN3N7HRcATJCRtm7ktbIksrDsd1
	uUZqhkNxI8tXg4dUXrwUHJ3MRrQ55LR4TU5RpyK/qTmT8YaakE1H6Nwss/V2fZ+5nEznWcJh14W
	nOUj5+0roB5KorIeYxtDic8fPC0He+ad5QU1QUrBvDu2lS+O/qSRN2i3tpgAtURObfPR8roXXtB
	Ci+J3R84S
X-Google-Smtp-Source: AGHT+IEaO1XLEgCNKAfPkRtxyfdKfImrjm7g1/rpN1YO5BTAvo1iIpeAEaHHlZq2LyQGyyepB2MP0A==
X-Received: by 2002:a05:6e02:e:b0:3d5:d6ad:286a with SMTP id e9e14a558f8ab-3d93b47e2ebmr66641265ab.13.1745728989288;
        Sat, 26 Apr 2025 21:43:09 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824ba34c1sm1596199173.126.2025.04.26.21.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d7f4cb7636so11458945ab.3;
        Sat, 26 Apr 2025 21:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8IMAYErDf5fl3f0OSHCyu+gXqWz5+ikZzW68tZLQWG5H/Klip7HIeHcVyTryO68dB0icec3VFNYPkKjMF@lists.infradead.org, AJvYcCV7+QCvlckqFGI/NDENeCPxXwOiX+yTOHjR5NcfV1q/V/KnsurCiYj5LWM+08/K/kCl6fi0ziyjEzDdGGWve+wNaQ==@lists.infradead.org
X-Received: by 2002:a05:6e02:1847:b0:3d8:1d7c:e197 with SMTP id
 e9e14a558f8ab-3d93b42921bmr71427715ab.7.1745728988001; Sat, 26 Apr 2025
 21:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org> <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
In-Reply-To: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:42:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64WbBnsWRwy_k3BdeDFBqaTH_QpsZN7mxrzvB8inQLyhQ@mail.gmail.com>
X-Gm-Features: ATxdqUGlkS5EQPGwaf23ftJzckW9DcLS2uG0Iv-DsC8_L7KpG4vBmNT4ibxuK1o
Message-ID: <CAGb2v64WbBnsWRwy_k3BdeDFBqaTH_QpsZN7mxrzvB8inQLyhQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250426_214315_678585_A7D5594A 
X-CRM114-Status: GOOD (  19.27  )
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

T24gU3VuLCBBcHIgMjcsIDIwMjUgYXQgMTI6MzjigK9QTSBDaGVuLVl1IFRzYWkgPHdlbnNAY3Np
ZS5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIgNCwgMjAyNSBhdCA3OjU34oCvUE0gS3J6eXN6
dG9mIEtvemxvd3NraQo+IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+
ID4KPiA+IEVuYWJsaW5nIHRoZSBjb21waWxlIHRlc3Qgc2hvdWxkIG5vdCBjYXVzZSBhdXRvbWF0
aWMgZW5hYmxpbmcgb2YgYWxsCj4gPiBkcml2ZXJzLiAgUmVzdHJpY3QgdGhlIGRlZmF1bHQgdG8g
QVJDSCBhbHNvIGZvciBpbmRpdmlkdWFsIGRyaXZlcnMsIGV2ZW4KPiA+IHRob3VnaCB0aGVpciBj
aG9pY2UgaXMgbm90IHZpc2libGUgd2l0aG91dCBzZWxlY3RpbmcgcGFyZW50IEtjb25maWcKPiA+
IHN5bWJvbCwgYmVjYXVzZSBvdGhlcndpc2Ugc2VsZWN0aW5nIHBhcmVudCB3b3VsZCBzZWxlY3Qg
dGhlIGNoaWxkIGR1cmluZwo+ID4gY29tcGlsZSB0ZXN0aW5nLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvY2xrL3N1bnhpL0tjb25maWcgfCAxMCArKysrKy0tLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3VueGkvS2NvbmZpZyBiL2RyaXZlcnMvY2xrL3N1
bnhpL0tjb25maWcKPiA+IGluZGV4IDFjNGU1NDMzNjZkZGI3NmMxNjY5YjU3N2MxYWMzMzdkYzFi
ZTYxNmYuLjVlMmY5MmJmZTQxMjA5ODFhYjY4YjE3NWRjZTc5OGFjOGIzMjY4YjAgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2Nsay9zdW54aS9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL2Nsay9z
dW54aS9LY29uZmlnCj4gPiBAQCAtMiwxMyArMiwxMyBAQAo+ID4gIG1lbnVjb25maWcgQ0xLX1NV
TlhJCj4gPiAgICAgICAgIGJvb2wgIkxlZ2FjeSBjbG9jayBzdXBwb3J0IGZvciBBbGx3aW5uZXIg
U29DcyIKPiA+ICAgICAgICAgZGVwZW5kcyBvbiAoQVJNICYmIEFSQ0hfU1VOWEkpIHx8IENPTVBJ
TEVfVEVTVAo+ID4gLSAgICAgICBkZWZhdWx0IHkKPiA+ICsgICAgICAgZGVmYXVsdCAoQVJNICYm
IEFSQ0hfU1VOWEkpCj4KPiBKdXN0IHdvbmRlcmluZywgc2hvdWxkbid0IHRoaXMgY2hhbmdlIGFs
b25lIGJlIGVub3VnaD8gVGhlIHJlbWFpbmluZwo+IEtjb25maWcgb3B0aW9ucyBhcmUgZ2F0ZWQg
YnkgdGhpcyBvbmUuCgpIYXZpbmcgcmUtcmVhZCB5b3VyIHJlcGx5IHRvIHRoZSBvdGhlciBwYXRj
aCwgdGhpcyBvbmUgbWFrZXMgc2Vuc2Ugbm93LgoKU29ycnkgZm9yIHRoZSBub2lzZS4KCj4gPiAg
aWYgQ0xLX1NVTlhJCj4gPgo+ID4gIGNvbmZpZyBDTEtfU1VOWElfQ0xPQ0tTCj4gPiAgICAgICAg
IGJvb2wgIkxlZ2FjeSBjbG9jayBkcml2ZXJzIgo+ID4gLSAgICAgICBkZWZhdWx0IHkKPiA+ICsg
ICAgICAgZGVmYXVsdCBBUkNIX1NVTlhJCj4gPiAgICAgICAgIGhlbHAKPiA+ICAgICAgICAgICBM
ZWdhY3kgY2xvY2sgZHJpdmVycyBiZWluZyB1c2VkIG9uIG9sZGVyIChBMTAsIEExMywgQTIwLAo+
ID4gICAgICAgICAgIEEyMywgQTMxLCBBODApIFNvQ3MuIFRoZXNlIGRyaXZlcnMgYXJlIGtlcHQg
YXJvdW5kIGZvcgo+ID4gQEAgLTE5LDE0ICsxOSwxNCBAQCBjb25maWcgQ0xLX1NVTlhJX0NMT0NL
Uwo+ID4KPiA+ICBjb25maWcgQ0xLX1NVTlhJX1BSQ01fU1VONkkKPiA+ICAgICAgICAgYm9vbCAi
TGVnYWN5IEEzMSBQUkNNIGRyaXZlciIKPiA+IC0gICAgICAgZGVmYXVsdCB5Cj4gPiArICAgICAg
IGRlZmF1bHQgQVJDSF9TVU5YSQo+ID4gICAgICAgICBoZWxwCj4gPiAgICAgICAgICAgTGVnYWN5
IGNsb2NrIGRyaXZlciBmb3IgdGhlIEEzMSBQUkNNIGNsb2Nrcy4gVGhvc2UgYXJlCj4gPiAgICAg
ICAgICAgdXN1YWxseSBuZWVkZWQgZm9yIHRoZSBQTUlDIGNvbW11bmljYXRpb24sIG1vc3RseS4K
PiA+Cj4gPiAgY29uZmlnIENMS19TVU5YSV9QUkNNX1NVTjhJCj4gPiAgICAgICAgIGJvb2wgIkxl
Z2FjeSBzdW44aSBQUkNNIGRyaXZlciIKPiA+IC0gICAgICAgZGVmYXVsdCB5Cj4gPiArICAgICAg
IGRlZmF1bHQgQVJDSF9TVU5YSQo+ID4gICAgICAgICBoZWxwCj4gPiAgICAgICAgICAgTGVnYWN5
IGNsb2NrIGRyaXZlciBmb3IgdGhlIHN1bjhpIGZhbWlseSBQUkNNIGNsb2Nrcy4KPiA+ICAgICAg
ICAgICBUaG9zZSBhcmUgdXN1YWxseSBuZWVkZWQgZm9yIHRoZSBQTUlDIGNvbW11bmljYXRpb24s
Cj4gPiBAQCAtMzQsNyArMzQsNyBAQCBjb25maWcgQ0xLX1NVTlhJX1BSQ01fU1VOOEkKPiA+Cj4g
PiAgY29uZmlnIENMS19TVU5YSV9QUkNNX1NVTjlJCj4gPiAgICAgICAgIGJvb2wgIkxlZ2FjeSBB
ODAgUFJDTSBkcml2ZXIiCj4gPiAtICAgICAgIGRlZmF1bHQgeQo+ID4gKyAgICAgICBkZWZhdWx0
IEFSQ0hfU1VOWEkKPiA+ICAgICAgICAgaGVscAo+ID4gICAgICAgICAgIExlZ2FjeSBjbG9jayBk
cml2ZXIgZm9yIHRoZSBBODAgUFJDTSBjbG9ja3MuIFRob3NlIGFyZQo+ID4gICAgICAgICAgIHVz
dWFsbHkgbmVlZGVkIGZvciB0aGUgUE1JQyBjb21tdW5pY2F0aW9uLCBtb3N0bHkuCj4gPgo+ID4g
LS0KPiA+IDIuNDUuMgo+ID4KPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
