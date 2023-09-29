Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AC5E743DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Sep 2023 04:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpo0e5xYrxLYQ+AISdb/PqdOI/nVE+5gcoNJ7aueJS8=; b=c9THSN6tVZ9bj9
	vgkYObVqQTev1QbBDXZHBRUxAR6Fmbhu79lt0Hh7VVRedHBNtx4aPEOJsB4bKIq6PR5HvHUO77jnA
	g6cllVprGGPN5IkRT2ZBLExUADf11LvBWAUcwXcnFBko8FT037jKFkbrRdMa7LIe1vgr5HwtWj+za
	+1RgyjFleduRBGC3k6d0VXy5ub8xCbFSIwHHwTuRVtZzD5muElmEixOoQ3NoC6GVHZITegSnEg33s
	Ba3P2EZjZzOswJ6SZ7bwAaTMdfM/gJmVAoa/J0eRKOr1xyalox+BKJYZgdG4C4OBYj75dOsdLeDGO
	z7UqoNcsEAF/aIpFCnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm4fl-0075p2-19;
	Fri, 29 Sep 2023 04:00:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm4fi-0075o6-15
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Sep 2023 04:00:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40572aeb673so109448965e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Sep 2023 21:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695960006; x=1696564806; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4ozOJcdMu73UonWYu3Guqxdh+FY56w8y7+K9Ry3OHs=;
        b=oC5jF7mewNGn3Rbx+KrCZOpBps+jeu3x1HOKya5yZFgKpOpF1Z750oAEa+VCYT/aB2
         TC3ugF3DDITcJyusm683rIsnLoIXyO8S/eNua8ObVcI7cWkOhnsmkf1AH8Bl2KnMFwj/
         7cb3PlKpXchuCw4hPDwiom4uJuRGZgHapB6Azlc5B3zHloHtrvPquxQM/nnOEHlKAeKN
         Z2bZMWKP1bOTY8OAtRAd5i/zdDk9cRz7RmSSwMfMbmBj/396yQAmhsc5WyI+kVSSoqrn
         GxvOGRS6neuE5HURe+Mefkj4n8dNAofDXrx22izTpTek0mqCRZAWNYbOJhFODW9II5Zr
         j7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695960006; x=1696564806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x4ozOJcdMu73UonWYu3Guqxdh+FY56w8y7+K9Ry3OHs=;
        b=MJD2RRhhyWTIGRFj1o9fDmo3RAb/82rXm0VBQvI51idw0Fq2C99pP4M+YPHJ+39J3t
         Y0B0GDYJsnnIdz0t3GEPptxRv+wmvOO/1ZyWq7YJqQTKFrCx9rL1+Xf1jmRn/CuJI3S9
         Y3uIoVRA8SLzocTwMGXltSKtXs4mqTcfCEZOaTbd0LJXV+OVq4JG59rTs4HB2kwImjMu
         ErMFeWbb9cxDEKniYxTHc3MUkKevZSieEJGskgs2M2iSP5rD+xNJey5PoQVQC1aQA8T/
         mhEL6mCzs0DlWSY5eAzVH+AE6a+aqzMVQVkS94FWBHj4fpLZ+Sabd/SX2Pd+C9yZ0yCG
         UtlQ==
X-Gm-Message-State: AOJu0Yz2VKME6M62luOa/7xvZb3qROP4ZmeL3zsPa2IhCu1KHa8By6hq
	+43MtRC89uk10vsxjbsSwoUC1i5aMBGMCqhMt04=
X-Google-Smtp-Source: AGHT+IHQ6iymJeshnzKwqTkv5k2s0q41LhTpOenBVGc42AXtYrqcr6dfpaeF3Rspa42aAvKDtkuKYg==
X-Received: by 2002:a7b:c397:0:b0:3fe:3004:1ffd with SMTP id s23-20020a7bc397000000b003fe30041ffdmr2677107wmj.4.1695960005734;
        Thu, 28 Sep 2023 21:00:05 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id n24-20020a1c7218000000b003fefb94ccc9sm532425wmc.11.2023.09.28.21.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 21:00:05 -0700 (PDT)
Message-ID: <5a8422d7-99a0-7c3b-d0ee-ec3f800ceb6b@linaro.org>
Date: Fri, 29 Sep 2023 06:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] arm64: dts: amlogic: Fix IR Controller register area for
 Meson-GX/AXG/G12 series SoCs
Content-Language: en-GB
To: zelong dong <zelong.dong@amlogic.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230922080546.26442-1-zelong.dong@amlogic.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230922080546.26442-1-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_210010_492558_A9ACA2BB 
X-CRM114-Status: GOOD (  23.37  )
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

SGksCgpMZSAyMi8wOS8yMDIzIMOgIDEwOjA1LCB6ZWxvbmcgZG9uZyBhIMOpY3JpdMKgOgo+IEZy
b206IFplbG9uZyBEb25nIDx6ZWxvbmcuZG9uZ0BhbWxvZ2ljLmNvbT4KPiAKPiBBbWxvaWMgTWVz
b24tNiBTb0Mgb25seSBoYXMgb25lIElSIENvbnRyb2xsZXIsIHNpbmNlIHRoZW4sIHRoZXJlIGFy
ZSAyIElSCj4gQ29udHJvbGxlcnMgaW4gZXZlcnkgU29Dcywgb25lIGlzIExlZ2FjeSBJUiBDb250
cm9sbGVyIChzYW1lIGFzIE1lc29uLTYncyBvbmUpLAo+IHRoZSBuZXcgb25lIGlzIE11bHRpLUZv
cm1hdCBJUiBDb250cm9sbGVyIChhYmJyZXZpYXRlZCAiTUYtSVIiLAo+IHdoaWNoIHN1cHBvcnRz
IG1vcmUgdGhhbiBvbmUgSVIgUHJvdG9jb2wpLiBNRi1JUiB3YXMgdXBkYXRlZCBzZXZlcmFsIHRp
bWVzLAo+IHNvIGRpZmZlcmVudCBTb0NzIGNvdWxkIGJlIGdvdCBkaWZmZXJlbnQgcmVnaXN0ZXIg
c2l6ZXMuCj4gCj4gVGhlcmUgYXJlIGFsbCBJUiBDb250cm9sbGVyIHJlZ2lzdGVyIGFyZWFzIGZy
b20gdXBzdHJlYW0ncyBTb0NzOgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBMZWdh
Y3kgSVIgICAgICAgICAgICAgTUYtSVIKPiBNZXNvbi02ICAgICAgICAgICAgICAgICAgfCA8MHhj
ODEwMDQ4MCAweDIwPiB8ICAgICAgIE5VTEwgICAgICAgIHwKPiBNZXNvbi04LzhCLzhNMiAgICAg
ICAgICAgfCA8MHhjODEwMDQ4MCAweDIwPiB8IDwweGM4MTAwNTgwIDB4MzA+IHwKPiBNZXNvbi1H
WEJCICAgICAgICAgICAgICAgfCA8MHhjODEwMDQ4MCAweDIwPiB8IDwweGM4MTAwNTgwIDB4NDQ+
IHwKPiBNZXNvbi1HWE0vR1hMICAJICAgICAgICAgfCA8MHhjODEwMDQ4MCAweDIwPiB8IDwweGM4
MTAwNTgwIDB4NTQ+IHwKPiBNZXNvbi1BWEcvRzEyQS9HMTJCL1NNMSAgfCA8MHhmZjgwODAwMCAw
eDIwPiB8IDwweGZmODA4MDQwIDB4NTg+IHwKPiAKPiBBYm91dCBNZXNvbi1JUiBkcml2ZXIsIE1G
LUlSIHdhcyBzdXBwb3J0ZWQgZnJvbSBNZXNvbi04LCB3aGljaCB3YXMgZGlzdGluZ3Vpc2hlZAo+
IGJ5IGNvbXBhdGlibGUgc3RyaW5nIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCAiYW1s
b2dpYyxtZXNvbjYtaXIiKSksCj4gYW5kIG9ubHkgb25lIHJlZ2lzdGVyIChtYWNybyAnSVJfREVD
X1JFRzInKSB3YXMgYWRkZWQgYmVjYXVzZSBjb250cm9sbGVyIHdvcmtlZAo+IGluIHJhdyBkZWNv
ZGVyIG1vZGUsIGxhdGVyIHJlZ2lzdGVycyBhcmUgdW51c2VkLCBzbyB3ZSByZWNvbW1lbmQgdGhh
dCByZWdpc3Rlcgo+IHNpemUgc2hvdWxkIGJlIDB4MjQgaWYgTUYtSVIgaXMgaW4gdXNlLgo+IAo+
IFRoZXJlIGFyZSAyIHdheXMgdG8gZml4Lgo+IAo+IE1GLUlSIGlzIGluIHVzZToKPiAgICBNZXNv
bi04LzhCLzhNMi9HWEJCL0dYTS9HWEw6IDwweGM4MTAwNTgwIDB4MjQ+Cj4gICAgTWVzb24tQVhH
L0cxMkEvRzEyQi9TTTE6ICAgICA8MHhmZjgwODA0MCAweDI0Pgo+IAo+IExlZ2FjeSBJUiBpcyBp
biB1c2U6Cj4gICAgTWVzb24tOC84Qi84TTIvR1hCQi9HWE0vR1hMOiA8MHhjODEwMDQ4MCAweDIw
Pgo+ICAgIE1lc29uLUFYRy9HMTJBL0cxMkIvU00xOiAgICAgPDB4ZmY4MDgwMDAgMHgyMD4KClRo
aXMgaXMgc2xpZ2hseSBjb25mdXNpbmcsIHNvIHlvdSBtZWFuIHNpbmNlIE1lc29uLTggdGhlcmUn
cyAyIElSIGNvbnRyb2xsZXJzCndoaWNoIGhhdmUgdGhlIHNhbWUgcmVnaXN0ZXIgbWFwcGluZywg
YW5kIGJvdGggd29ya3Mgd2l0aCB0aGUgImFtbG9naWMsbWVzb242LWlyIiBjb21wYXRpYmxlID8K
ClNvIHdoeSBzaG91bGQgd2Ugc3dpdGNoIHRvIHRoZSBNRi1JUiBhZGRyZXNzID8gd2hhdCBkb2Vz
IGl0IGV4YWN0bHkgY2hhbmdlID8KCklmIHdlIHdhbnQgdG8gYmUgY2xlYW46Ci0gYm90aCBzaG91
bGQgYmUgYWRkZWQsIGxlZ2FjeSBJUiB3aXRoIGN1cnJlbnQgYWRkcmVzcyArIHJlZyBzaXplIGNo
YW5nZQotIGEgbmV3IGNvbXBhdGlibGUgc2hvdWxkIGJlIGFkZGVkIGZvciB0aGUgTUYgSVIsIHdp
dGggImFtbG9naWMsbWVzb242LWlyIiBhcyBmYWxsYmFjayB0byB0YWtlIGluIGFjY291bnQgdGhl
eSBhcmUgY29tcGF0aWJsZQotIGEgbmV3IG5vZGUgc2hvdWxkIGJlIGFkZGVkIGZvciB0aGUgTVIg
SVIKLSBEVHMgc2hvdWxkIGJlIHN3aXRjaCB0byB0aGUgTUYgSVIgbGFiZWwgaW5zdGVhZCBvZiB0
aGUgbGVnYWN5IElSCgpXaXRoIHRoaXMgd2Ugd291bGQgYmUgYWJsZSB0byB0YWtlIGFkdmFudGFn
ZSBvZiB0aGUgTVIgSUYgZnVuY3Rpb25hbGl0aWVzIHdoaWxlIGtlZXBpbmcgZHJpdmVyIGZ1bmN0
aW9ubmFsCndpdGggb2xkIERUcyBhbmQgbmV3IERUcyB3aXRoIG9sZCBrZXJuZWxzLgoKVGhhbmtz
LApOZWlsCgo+IAo+IEZpeGVzOiAyYmZlODQxMmM1Mzg4YSAoImFybTY0OiBkdHM6IG1lc29uLWcx
MmE6IEFkZCBJUiBub2RlcyIpCj4gRml4ZXM6IDdiZDQ2YTc5YWFkNTQ5ICgiQVJNNjQ6IGR0czog
bWVzb24tYXhnOiBlbmFibGUgSVIgY29udHJvbGxlciIpCj4gRml4ZXM6IGM1OGQ3Nzg1NWYwMDY5
ICgiQVJNNjQ6IGR0czogbWVzb24tZ3hiYjogQWRkIEluZnJhcmVkIFJlbW90ZSBDb250cm9sbGVy
IGRlY29kZXIiKQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDE2MDgyMDA5
NTQyNC42MzYtNS1tYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tLwo+IFNpZ25lZC1v
ZmYtYnk6IFplbG9uZyBEb25nIDx6ZWxvbmcuZG9uZ0BhbWxvZ2ljLmNvbT4KPiAtLS0KPiAgIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaSAgICAgICAgfCA0ICsrLS0K
PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2kgfCA0
ICsrLS0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpICAgICAg
ICAgfCAyICstCj4gICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWF4Zy5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy5kdHNpCj4g
aW5kZXggNzY4ZDBlZDc4ZGJlLi5kZDhjNThlNzQzMjIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWF4Zy5kdHNpCj4gQEAgLTE3MDUsOSArMTcwNSw5IEBAIHB3bV9B
T19hYjogcHdtQDcwMDAgewo+ICAgCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAJCQl9Owo+
ICAgCj4gLQkJCWlyOiBpckA4MDAwIHsKPiArCQkJaXI6IGlyQDgwNDAgewo+ICAgCQkJCWNvbXBh
dGlibGUgPSAiYW1sb2dpYyxtZXNvbi1neGJiLWlyIjsKPiAtCQkJCXJlZyA9IDwweDAgMHg4MDAw
IDB4MCAweDIwPjsKPiArCQkJCXJlZyA9IDwweDAgMHg4MDQwIDB4MCAweDI0PjsKPiAgIAkJCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMTk2IElSUV9UWVBFX0VER0VfUklTSU5HPjsKPiAgIAkJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAgCQkJfTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2kKPiBpbmRleCBmZjY4YjkxMWI3MjkuLmUx
MmNlYTVmYTg4OSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVz
b24tZzEyLWNvbW1vbi5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLWcxMi1jb21tb24uZHRzaQo+IEBAIC0yMDg0LDkgKzIwODQsOSBAQCBwd21fQU9fYWI6IHB3
bUA3MDAwIHsKPiAgIAkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAgCQkJfTsKPiAgIAo+IC0J
CQlpcjogaXJAODAwMCB7Cj4gKwkJCWlyOiBpckA4MDQwIHsKPiAgIAkJCQljb21wYXRpYmxlID0g
ImFtbG9naWMsbWVzb24tZ3hiYi1pciI7Cj4gLQkJCQlyZWcgPSA8MHgwIDB4ODAwMCAweDAgMHgy
MD47Cj4gKwkJCQlyZWcgPSA8MHgwIDB4ODA0MCAweDAgMHgyND47Cj4gICAJCQkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDE5NiBJUlFfVFlQRV9FREdFX1JJU0lORz47Cj4gICAJCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKPiAgIAkJCX07Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1neC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWd4LmR0c2kKPiBpbmRleCAyNjczZjBkYmFmZTcuLjBjMDRlMzRhMDkyMyAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3guZHRzaQo+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpCj4gQEAgLTUwNiw3ICs1MDYsNyBA
QCBwd21fQU9fYWI6IHB3bUA1NTAgewo+ICAgCj4gICAJCQlpcjogaXJANTgwIHsKPiAgIAkJCQlj
b21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tZ3gtaXIiLCAiYW1sb2dpYyxtZXNvbi1neGJiLWly
IjsKPiAtCQkJCXJlZyA9IDwweDAgMHgwMDU4MCAweDAgMHg0MD47Cj4gKwkJCQlyZWcgPSA8MHgw
IDB4MDA1ODAgMHgwIDB4MjQ+Owo+ICAgCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxOTYgSVJR
X1RZUEVfRURHRV9SSVNJTkc+Owo+ICAgCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAJCQl9
OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
