Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A116C02194
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Feb 2025 11:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ot1DstgHj++HCFUkXmKjZXoUI4t00eLVqer6+KutOg=; b=jSAgBEG072Su+w
	AKNf1iiBamvUJFzNlp67V3iSaO3aqxtyUVw9IIUm7rdnRMGXdLEwUUAw7gsBUSauvH8/qnRXy9yIW
	Dq8Kxh/xy0hHIOy9bvaVTla4OYCUb4zQlahUBGeMHew8TSAA3p0ETrWYAqBsU0FOfBWBom6FAu2kw
	IAFcZVOuTeYB2vWyKxdDv05o2mMcnpw1L1ZoVQh3WIT56DNLWjUareGux+yaZ6+1LvGBt5XNeTf7P
	8CPBnbghgXnMSdyP0q4yBNi+/ptB3FapSQvYE3+trBoeonouPFFWNcXGm6LNOjGoVWiYLhL0/sLG8
	SgnBvlnk1/7G3e9m1y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teBGJ-0000000CBW4-1Ira;
	Sat, 01 Feb 2025 11:02:07 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teBG3-0000000CBQQ-3rN9;
	Sat, 01 Feb 2025 11:01:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216426b0865so50158705ad.0;
        Sat, 01 Feb 2025 03:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1738407710; x=1739012510; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgviFgiTRKBQorySpqmLCZcfPI+S5PYXE7dN7JoWph0=;
        b=F57ciNY0DBbW8hW1BfSBkEXBpci1oLA6xhPkl0rhTIkym83cHPfnr46lpvZ5jkwJYG
         +XuiqSFgqFHhBIIb2GnKOf+GQ6jgQrW47bFUfdNUjqqeW26CDLXb4JoLuZ4WKsvvsPPd
         3n9abOqfgD+tiHEKn6CoP+q9eONOIe1U+Si7DKfpMkd7m6YtIEcmw2Uq7KRhqdDtC0yo
         PJ1/I3qo2xtrXB0H+85JgUiVIy7/si+H4jD/YF8xE5P2cR789FWz9zLWaXV6D5ix3juY
         Ivq6bnavsvTZzj9aXEYtrj5tsfZ0rAB8ynastCAhGLp/EleMuPs/LwFdJj7HdMBRy1gx
         dRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738407710; x=1739012510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgviFgiTRKBQorySpqmLCZcfPI+S5PYXE7dN7JoWph0=;
        b=usOamlVn89aD/r+fXG1r9HSHDQDddgJ0o0lN3zZ9BL2Jifyy7sGunKEfDopTOFJgqa
         bGqddSx5RlcrmOm7ZQeKDnZBijLIItYe7mkXMRmXN9hSBUtSqicQx/ikcmWi0SidEk4w
         AIk6aA5p7/7MPCdBMgF13iI2n9w/WWWuFKDelkLYoAi1ablDBrPX3owJiuDRRVTMNpcM
         JFh+L/qXmQ3bHdEDK+sPjniixBUKhgXlDTf/K6HoHrOeHcVSiea8YtCrsTggYB3S0IWX
         RBv/mZYWNADfelKKL3Tzr/A75x+6RkHulGb71jvT8vlBfy0uPm63kIJXOkGVGDu4fQb4
         vxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg5Ypc7gtmbEtOCVJ4hcWXU4Msi9MRkBelyovJWIxFwbyKJL79vAWvlG0mGIGg6C24D7hypwYXvbGNAYtz@lists.infradead.org, AJvYcCWLgtBdegPn5kkoGCqzbDFs+nGzmuRKNF8Nyq1pSQsVAvXqzf8HwIqWqAaUhNZxC5+tcokmKeVWqoazxTZ1nqtugQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbNm14FPKtsEl9f8eFbuZlct5gEhDPd+vmPtrW+HmiTTYgfW2K
	TIrozVN2YqnCcJg05Bf8dHGsqapPaHbqVBa7TL3CO1W+Y3KEVU/LfHzDngpwJKi5CRfIcaR4VNe
	8dQHLGeRwyXNhADTtsVwvkDyljMc=
X-Gm-Gg: ASbGncvKk2lCjfWQpYzkvy1FWOuXGJK4gHOxPoesD0FEDobSXtE87yDamV7b0nczd3d
	lwuyFPcXcu1SCu7z13vtC/U/wFMDIJKQvOjfT3hm4uuTSRsjmzlYFPnbBHwwcLe0kY7gCRwM+ln
	7hyX1tMdL5stM=
X-Google-Smtp-Source: AGHT+IGrcFP3fi7nZj16nCl5OL6FPEPmSqptYgvrx04MREEDcnn7VynJHZBiOuPcwfy53f71XzvVP/oyU5M11jIaiKw=
X-Received: by 2002:a17:902:e84b:b0:215:b087:5d62 with SMTP id
 d9443c01a7336-21dd7deec73mr235159955ad.36.1738407710240; Sat, 01 Feb 2025
 03:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20250131200319.19996-1-funderscore@postmarketos.org> <20250131200319.19996-3-funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-3-funderscore@postmarketos.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 1 Feb 2025 12:01:39 +0100
X-Gm-Features: AWEUYZkXEqHyhsd8L6lSp8TYewHZzKYzaHWOXDWjpy_w3xCcDMFYNnIQJ6qrfB4
Message-ID: <CAFBinCA+=aqE_=eMFtwpHYVX+8CrtecvHexpHNe_7nh_dDhKYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Artur Weber <aweber.kernel@gmail.com>, 
	Karl Chan <exxxxkc@getgoogleoff.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_030151_979176_863DEDD3 
X-CRM114-Status: GOOD (  15.44  )
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

SGVsbG8sCgp0aGFua3MgZm9yIHRoZSBwYXRjaCAtIEkgaGF2ZSBhIGZldyBzbWFsbCBjb21tZW50
cyBiZWxvdy4KCk9uIEZyaSwgSmFuIDMxLCAyMDI1IGF0IDk6MDXigK9QTSBGZXJhc3MgRWwgSGFm
aWRpCjxmdW5kZXJzY29yZUBwb3N0bWFya2V0b3Mub3JnPiB3cm90ZToKWy4uLl0KPiArICAgICAg
IGN2YnMtY29ubmVjdG9yIHsKPiArICAgICAgICAgICAgICAgLyogTm8gQ1ZCUyBjb25uZWN0b3Ig
Ki8KPiArICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPiArICAgICAgIH07Cllv
dSdyZSBpbmhlcml0aW5nICAibWVzb24tZ3hsLXM4MDV4LmR0c2kiIGJ1dCBJIGNhbid0IHNlZSB0
aGF0IHRoaXMgLQpvciBpdHMgcGFyZW50cyAtIGRlZmluZSBhIGN2YnMtY29ubmVjdG9yIG5vZGUg
YW55d2hlcmUuCkNhbiB3ZSBqdXN0IG9taXQgaXQgY29tcGxldGVseQoKWy4uLl0KPiArICAgICAg
IHZjY181djogcmVndWxhdG9yLXZjYy01diB7Cj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAicmVndWxhdG9yLWZpeGVkIjsKPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAi
VkNDXzVWIjsKPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAw
MDAwMD47Cj4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDUwMDAw
MDA+Owo+ICsgICAgICAgfTsKPiArCj4gKwpuaXQtcGljazogc2luY2UgeW91J3JlIHBsYW5uaW5n
IHRvIHNlbmQgYSB2MiBhbnl3YXlzLCBrZWVwIGl0IGF0IG9uZQpibGFuayBsaW5lIGhlcmUKClsu
Li5dCj4gKyZldGhtYWMgewo+ICsgICAgICAgLyogTm8gRXRoZXJuZXQgY29ubmVjdG9yICovCj4g
KyAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICt9OwpTaW1pbGFyIHRvIHRoZSBjdmJzLWNv
bm5lY3Rvcjogc3RhdHVzID0gImRpc2FibGVkIiBzaG91bGQgYmUgdGhlIGRlZmF1bHQgaGVyZQoK
PiArJmludGVybmFsX3BoeSB7Cj4gKyAgICAgICBwaW5jdHJsLTAgPSA8JmV0aF9saW5rX2xlZF9w
aW5zPiwgPCZldGhfYWN0X2xlZF9waW5zPjsKPiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCI7Cj4gK307CndoeSBhcmUgdGhlcmUgRXRoZXJuZXQgTEVEIHBpbnMgaWYgdGhlcmUncyBu
byBFdGhlcm5ldCBjb25uZWN0b3I/Cgo+ICsmaXIgewo+ICsgICAgICAgLyogTm8gSVIgKi8KPiAr
ICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gK307ClRoaXMgaXMgYWxzbyBkaXNhYmxlZCBi
eSBkZWZhdWx0CgpbLi4uXQo+ICsmcHdtX2VmIHsKPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsK
PiArICAgICAgIHBpbmN0cmwtMCA9IDwmcHdtX2VfcGlucz47Cj4gKyAgICAgICBwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwo+ICsgICAgICAgY2xvY2tzID0gPCZjbGtjIENMS0lEX0ZDTEtfRElW
ND47Cj4gKyAgICAgICBjbG9jay1uYW1lcyA9ICJjbGtpbjAiOwo+ICt9OwpQbGVhc2UgZHJvcCBj
bG9ja3MgYW5kIGNsb2NrLW5hbWVzIHRvIG1ha2UgdGhpcyB3b3JrIHdpdGggbGludXgtbmV4dC4K
QmFja2dyb3VuZDogWzBdIGlzIHF1ZXVlZCBmb3IgdGhlIG5leHQgcmVsZWFzZSBhbmQgaXQgbWVh
bnMgdGhhdCB0aGUKUFdNIGNvbnRyb2xsZXIgZHJpdmVyIHdpbGwgbm93IHBpY2sgdGhlICJiZXN0
IiBjbG9jayBvbiBpdCdzIG93biBhbmQKb3ZlcnJpZGluZyBoZXJlIHdpbGwgbGlrZWx5IHJlc3Vs
dCBpbiB5b3VyIGJvYXJkIG5vdCBib290aW5nLgoKWy4uLl0KPiArJnVzYiB7Cj4gKyAgICAgICBz
dGF0dXMgPSAib2theSI7Cj4gKyAgICAgICBkcl9tb2RlID0gImhvc3QiOwo+ICt9Owo+ICsKPiAr
JnVzYjJfcGh5MCB7Cj4gKyAgICAgICBwaHktc3VwcGx5ID0gPCZ2Y2NfNXY+Owo+ICt9OwpJJ20g
Z3VpbHR5IG9mIHRoaXMgbXlzZWxmIGFuZCBJIHRoaW5rIHlvdSBjYW4gYmUgYmV0dGVyIGhlcmU6
ClVzZSB2YnVzLXN1cHBseSA9IDwmdmNjXzV2PjsgaW4gdGhlICZ1c2Igbm9kZSB0byBjb3JyZWN0
bHkgZGVzY3JpYmUKd2hlcmUgdGhlIFVTQiBWQlVTIHNpZ25hbCBpcyBjb21pbmcgZnJvbS4KKEkg
YmVsaWV2ZSB0aGF0IHRoZSBQSFkgaXMgbm90IGludGVybmFsbHkgcG93ZXJlZCBieSA1ViBhcyB0
aGUgU29DCmRvZXNuJ3QgdGFrZSBhbnkgNVYgaW5wdXRzKQoKCkJlc3QgcmVnYXJkcywKTWFydGlu
CgoKWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAyNDEyMjcyMTI1
MTQuMTM3NjY4Mi0xLW1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20vCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
