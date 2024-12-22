Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79B5E77188
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Dec 2024 09:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHwUDjzB9D7AWZnr5ijFckGbqytJrGv//mRnAHkA8HY=; b=QYfVf+Kh1YOOed
	KwJCTNPnuSWyLdYZYAvRr/JvEB4ay9P1TRge+9iqj4pCmNCbVTFCWWCYFGnPA4aSl/c23dLfILy8f
	RBSQemXc3OGT+FYq5lt1ar754FzhNKCw+Z4Mi9L6OjoKcBYK78vr0IYHs9n2MibI+47JEThnAaBmD
	FRqjpxh0LdubkGJ6GDIRom3k9yJeUsik95kG3TK8VBQxBIeGg8LoUwxdEiJ4k4Blt94saQ2O6GGS4
	AImHiYaPvROkDVaNpRl2f5vX6xmbGG1Y058IKgBJEK7tAu19ADM9//nqCidpfitZ+QpE05SQJoGsT
	cU+4iG7GtyZVHZ4V+pzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHxT-00000008450-3aj6;
	Sun, 22 Dec 2024 09:09:07 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHxQ-0000000844B-0Nk1
	for linux-amlogic@lists.infradead.org;
	Sun, 22 Dec 2024 09:09:06 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-303548a9361so29555231fa.0
        for <linux-amlogic@lists.infradead.org>; Sun, 22 Dec 2024 01:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734858541; x=1735463341; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+SzVktxDB05WNZgU2bzgDj3qvGv7E/lndUr61NmRhc=;
        b=DWuf5vhXw7luB1fMlhyKugRwK3jSjUPpts/3WhGkIllFk9ornoIPRxxgxrrNHAGEUq
         CaC0ZkCHtNedYqaQzS3YDv+pm4iAeISU8kBhyrOrH09BLyysVfjzXGhsOGuhJTR79b7J
         PV7Li99+LXRdGSJpW8mcJXEGglChazW7ixQkRPUM9FLXabo1t/MTqKZb8RFfjQGj07r5
         h2c3v3StwphHUkjM2D4cIvr/ptv2grMuG/ZQf0QixqaiUIkrtLUKrDPnclhx3SJgME+k
         0ZQLeGz8+zHlLQY2KYdQ3vu6jXNaHQdFnJGt+V2Tu3KVvEgJXtjt2xFWvl1qV1kGjwHa
         WGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734858541; x=1735463341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+SzVktxDB05WNZgU2bzgDj3qvGv7E/lndUr61NmRhc=;
        b=jh57pcB5PpCnfWLGZ1AgKCRWPzRUn81DwKRYqt8OF46sMU3ao3iwqp5C76oUM38B2P
         9VREaty7r73ugXjLILZTIdANqGXeEeuD4kO/orW/EXXCrxJbCEJjCt9THjaHMtIX4g8h
         o5+NLGTHA1U4EmZVb+C4Q9Mw58R7F48YQDKfGan9Ld5Y5zjdivkg3l2/vZJz13wU5Qnf
         1rgfpY6fUF892CO0+pNjjmp9W5DdyPzXAAk05M3+tMRT9aCqJt9TsLdcrksvkOJIXt55
         4T3GKJUR7k5HnK3zagyDubF+/W6gxF9yVOrOiqkE++S+SQ0Lk2Kibf02Pglfc7JvOqkR
         YA7g==
X-Forwarded-Encrypted: i=1; AJvYcCUGW59EWeCb6hQAUimxbs4hfI38m1zjj2OxkfKxW9y+mJDMdzC7Zv2qrJ1iju1TH/We4TQYUHqZmNT3nHX0@lists.infradead.org
X-Gm-Message-State: AOJu0YzgLUEuo1poIHyiIOv7+/t+UhE5CMaCIoyHPZUNW/Tm/P4N8Wbr
	6KjG06ntuti26DogONbxvoz5H8kKbzzAHNQET9M5/TN3cO2b1LUq8ywNrDtO2aNsZNb8jEQmhi7
	3e3vN1dGA/c9kiEkMnlVbO5vdgLolj45ZM3IOfg==
X-Gm-Gg: ASbGncumgm5xBjBl/8dtZd1tyZuN7i1+p2S0MKbhpCLuQ0UbUmHd/THW2vK6tp4iEn7
	6vAEKlArwleqnCdikvty6418PkkH5u+HbSEiT
X-Google-Smtp-Source: AGHT+IH187CUQCnfRfnFev/oxx361vRPpnGwZKGEC40JgvkudCId/KMDE/KgqulM/xdtkLXQpR7G1mShXSPT7tAyjMQ=
X-Received: by 2002:a05:6512:104c:b0:541:1c48:8bf6 with SMTP id
 2adb3069b0e04-5422956c531mr2677617e87.53.1734858541379; Sun, 22 Dec 2024
 01:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com> <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
 <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
In-Reply-To: <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 22 Dec 2024 10:08:50 +0100
Message-ID: <CACRpkdZn75ks4Gc7rm8jzkKM6y0JeQmUF3qmbJA+O+cEA9r--Q@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_010904_974547_3A1072A2 
X-CRM114-Status: GOOD (  27.87  )
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

SGkgWGlhbndlaSEKCk9uIFdlZCwgRGVjIDE4LCAyMDI0IGF0IDEwOjM34oCvQU0gWGlhbndlaSBa
aGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+IHdyb3RlOgoKPiBbTWVdCj4gPiBJbiBhbnkg
d2F5IEkgcmVjb21tZW5kOgo+ID4KPiA+IC0gUmVuYW1pbmcgZHJpdmVycy9waW5jdHJsL3N1bnhp
IHRvIGRyaXZlcnMvcGluY3RybC9hbWxvZ2ljCj4gPiAgICBzbyB3ZSBrZWVwIHRoaXMgc29ydGVk
IGJ5IGFjdHVhbCB2ZW5kb3IsIHN1bnhpIGlzIGFwcGFyZW50bHkKPiA+ICAgIHlvdXJzIChBTWxv
Z2ljOnMpIGlzbid0IGl0Pwo+ID4KPgo+IEl0IGlzbid0LiBTdW54aSBpcyBBbGx3aW5uZXIgU29D
cy4KCk15IGFwb2xvZ2llcy4gSSBtaXhlZCBpdCB1cCBjb21wbGV0ZWx5LiA6KAoKV2hhdCBkbyB5
b3UgdGhpbmsgb2YgdGhlIGlkZWEgb2YgYSBzZXBhcmF0ZSBkcml2ZXJzL3BpbmN0cmwvYW1sb2dp
YyBkaXJlY3RvcnkKdGhvdWdoPyBJIHRoaW5rIHRoZXJlIGFyZSBhbHJlYWR5IHF1aXRlIGEgZmV3
IGFtbG9naWMgU29DcyB0aGF0IG5lZWQKdG8gYmUgc3VwcG9ydGVkIGFuZCBtb3JlIHdpbGwgY29t
ZS4KCj4gPj4gKyAgICAgICByZXQgPSBwaW5jb25mX2dlbmVyaWNfcGFyc2VfZHRfY29uZmlnKG5w
LCBpbmZvLT5wY3RsLCAmZ3JwLT5jb25maWdzLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmZ3JwLT5udW1fY29uZmlncyk7Cj4gPgo+ID4gQnV0IGNh
bid0IHlvdSBqdXN0IG1vdmUgdGhpcyBjb2RlIGFyb3VuZD8gZ3JwLT5udW1fY29uZmlncyBnaXZl
IHRoZQo+ID4gbnVtYmVyIG9mIGNvbmZpZ3MsIHNvIHdoeSBkbyB5b3UgaGF2ZSB0byBnbyBhbmQg
bG9vayB1cCBwaW5tdXgKPiA+IGFib3ZlLCBjYW4ndCB5b3UganVzdCB1c2UgZ3JwLT5udW1fY29u
ZmlncyBpbnN0ZWFkIG9mIG9mX3BpbnMKPiA+IGFuZCBucGlucyBhYm92ZT8KPiA+Cj4gVGhleSBh
cmUgZGlmZmVyZW50Lgo+IFRoZSBvZl9waW5zKGdycC0+bnBpbnMpIHNwZWNpZmllcyB0aGUgbXV4
IHZhbHVlcyBmb3IgcGluLW11eCByZWdpc3Rlcgo+IGFuZCBwaW4gaW5kZXggaW4gcGluY3RybC4g
SXQgY2FuIGluY2x1ZGUgbXVsdGlwbGUgcGlucyBpbiBncm91cHMuCj4KPiBUaGUgZ3JwLT5jb25m
aWdzIGFuZCBncnAtPm51bV9jb25maWdzIHNwZWNpZnkgdGhlIGNvbmZpZ3VyYXRpb24KPiBpbmZv
cm1hdGlvbiBmb3IgYWxsIHBpbnMgb2YgdGhpcyBncm91cHMoc3VjaCBhcyBiaWFzLXB1bGwtdXAs
Cj4gZHJpdmUtc3RyZW5ndGgtbWljcm9hbXApCj4KPiB1YXJ0LWQtcGluczJ7Cj4gICAgICAgICBw
aW5tdXg9IDxBTUxfUElOTVVYKEFNTE9HSUNfR1BJT19ULCA3LCBBRjIpPiwKPiAgICAgICAgICAg
ICAgICAgPEFNTF9QSU5NVVgoQU1MT0dJQ19HUElPX1QsIDgsIEFGMik+LAo+ICAgICAgICAgICAg
ICAgICA8QU1MX1BJTk1VWChBTUxPR0lDX0dQSU9fVCwgOSwgQUYyKT4sCj4gICAgICAgICAgICAg
ICAgIDxBTUxfUElOTVVYKEFNTE9HSUNfR1BJT19ULCAxMCwgQUYyKT47Cj4gICAgICAgICBiaWFz
LXB1bGwtdXA7Cj4gICAgICAgICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDw0MDAwPjsKPiB9
OwoKT0sgSSBnZXQgaXQgLi4uIEkgdGhpbmsuIEl0J3MgbmljZSB0aGF0IHlvdSBjb21iaW5lIG11
eGluZyBhbmQgcGluIGNvbmZpZwppbnRvIHRoZSBzYW1lIG5vZGUgbGlrZSB0aGlzLCBpdCdzIHZl
cnkgcmVhZGFibGUuCgpUaGluayBhYm91dCBpZiB5b3UgZXZlbiB3YW50IHRvIGFkZCBnZW5lcmlj
IGhlbHBlcnMgZm9yIHRoaXMgaW4KdGhlIGdlbmVyaWMgY29kZS4KCj4gPj4gK3N0YXRpYyB2b2lk
IGFtbF9wY3RsX2R0X2NoaWxkX2NvdW50KHN0cnVjdCBhbWxfcGluY3RybCAqaW5mbywKPiA+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
KQo+ID4+ICt7Cj4gPj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkOwo+ID4+ICsK
PiA+PiArICAgICAgIGZvcl9lYWNoX2NoaWxkX29mX25vZGUobnAsIGNoaWxkKSB7Cj4gPj4gKyAg
ICAgICAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woY2hpbGQsICJncGlvLWNvbnRy
b2xsZXIiKSkgewo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGluZm8tPm5iYW5rcysrOwo+
ID4+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAg
IGluZm8tPm5mdW5jdGlvbnMrKzsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBpbmZvLT5u
Z3JvdXBzICs9IG9mX2dldF9jaGlsZF9jb3VudChjaGlsZCk7Cj4gPj4gKyAgICAgICAgICAgICAg
IH0KPiA+PiArICAgICAgIH0KPiA+PiArfQo+ID4KPiA+IFRoaXMgbG9va3MgbGlrZSBhIHdlaXJk
IGRlcGVuZGVuY3kgYmV0d2VlbiBncGlvIGNoaXBzIGFuZAo+ID4gcGlucyB0aGF0IEkgZG9uJ3Qg
cXVpdGUgdW5kZXJzdGFuZC4gU29tZSBjb21tZW50cyBhbmQKPiA+IHJlZmVyZW5jZXMgdG8gdGhl
IGJpbmRpbmdzIHdpbGwgYmUgbmVlZGVkIHNvIGl0IGlzIGNsZWFyCj4gPiB3aGF0IGlzIGdvaW5n
IG9uLgo+ID4KPgo+IEEgcGluY3RybCBkZXZpY2UgY29udGFpbnMgdHdvIHR5cGVzIG9mIG5vZGVz
LiBUaGUgb25lIG5hbWVkIEdQSU8gYmFuawo+IHdoaWNoIGluY2x1ZGVzICJncGlvLWNvbnRyb2xs
ZXIiIHByb3BlcnR5LiBUaGUgb3RoZXIgb25lIG5hbWVkIGZ1bmN0aW9uCj4gd2hpY2ggaW5jbHVk
ZXMgb25lIG9yIG1vcmUgcGluIGdyb3Vwcy4KPiBUaGUgcGluIGdyb3VwIGluY2x1ZGUgcGlubXV4
IHByb3BlcnR5KHBpbiBpbmRleCBpbiBwaW5jdHJsIGRldixhbmQgbXV4Cj4gdmxhdWUgaW4gbXV4
IHJlZykgYW5kIHBpbiBjb25maWd1cmF0aW9uIHByb3BlcnRpZXMuCgpPSyBJICBndWVzcyB0aGUg
YmluZGluZyBwYXRjaCBleHBsYWlucyB3aHkgeW91IG5lZWQgc2V2ZXJhbApzZXBhcmF0ZSBncGlv
IGNvbnRyb2xsZXIgImJhbmsiIG5vZGVzIGluc3RlYWQgb2YganVzdCB0aGUgYmFzZQpub2RlIGJl
aW5nIG9uZSBmb3IgYWxsIG9mIHRoZSBwaW5zICh3aGljaCBpcyB0aGUgbW9zdApjb21tb24pLiBJ
biBhIHdheSBJIGxpa2UgaXQgYmVjYXVzZSBpdCBvZnRlbiBoZWxwcyB0byBkaXZpZGUKdXAgR1BJ
T3MgYnkgYmFuay4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
