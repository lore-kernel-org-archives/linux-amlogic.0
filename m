Return-Path: <SRS0=7SbI=RU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA31C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2019 10:42:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F8102085A
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Mar 2019 10:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U8GW6IEF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tygwppE9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F8102085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXte9rIyf3RBRn/vXPfvg0EJUiBvr65Z7Vrumm3t2qw=; b=U8GW6IEF/wvh01
	LaXs497aG+im1fBlfUaa59yY6puZN4cnXohbw2MEtAXhH8CCsqZKoGJBFanHHV854txhfXvjYI55G
	I/f/r+pvZOOjN5EZaXRHTrkUJ6zPyB1ffSN1UHYRt77D6SSUu8w5n4+Ck+vu1/vKCcBO7Z99rKg0R
	7ZM6fSQaRs0Xm7hSSUaKvHvKURiEMm8lRwv5Gk/g1KJp6ng/VCHE+2CSVE0CjAbKHdmKpK9Cd9De0
	pZrHlhQrtSyBkbkyyEAFE+UnzHYEwUdUCnmb25pUKV/5vtyfIOt3USL7QKUJyGJN3lYhyxJu9GiNk
	kYcnUYir9TEVsBn724hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5TFA-0008Ce-IX; Sun, 17 Mar 2019 10:42:16 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5TF8-0008C6-EV
 for linux-amlogic@lists.infradead.org; Sun, 17 Mar 2019 10:42:15 +0000
Received: by mail-wm1-x341.google.com with SMTP id f65so10270881wma.2
 for <linux-amlogic@lists.infradead.org>; Sun, 17 Mar 2019 03:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=rr2XQQY0S98IGjtgX/+det4iBMjXVIyqfJdXkkSDzJs=;
 b=tygwppE9atD4qLtfFCN8xcRZcqp/1vei8iMh+v3PTg8wIPiqTn7r7/j+AVCxkYzt9k
 3ntmj+GFQwxE/mQBXTfZk7FQVF0aso6NNCkP3mlBLuFLNZ11i2u2fAyKN1f9i6hmwI69
 JRa9wzSqdCnl8wtEuYHa9ZPaTvSkAwF1fsOnZi8RSdedq1g9v6fgLXKJ7O2LC3BAx8HF
 3og0/uYdJQ+RjBuHTPX0RiCdZfY2CZjRSRrnKuANarXcfMiwsAde7ptYEWJ6SUISg+mF
 F/pj4KRPtciojpNaGl3Jjotrz+Qf01alPaWiVwiXrjss7WVrjL5hQwJZ119HiqefDZdO
 75zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=rr2XQQY0S98IGjtgX/+det4iBMjXVIyqfJdXkkSDzJs=;
 b=aNIlMVh/VuMU4d/aNjH4tsXQQZQDjLm45gYm5gBDPQ6dD7CGH9SiUKawdsIyZsTJOP
 Vg4e0EUiIu95eFXuZIalK0Z2cMPs0ytg0gNQIhLGe5RLkYFh9gNvSXiT6tPShBzvx5CV
 xzVX5UKmUa6Hu22JJdrLkJ1nYDt1OvhytaVMOsxKpB/iFhCUxwhm6eLxQEKmNxD7MedW
 2QqcPSVC8nhxy8VQ7sJrOY0X2MA6CKAdXvZEGBgM6ZPYCpdFthLspTbRLkUee4nx5/lu
 q2kCA57tT2qVBJ9363VyKLYbgjDArHKD0P8lZFH3c1OgPqhtxIBhkQn+eFmcyPL2ciaI
 X9Gw==
X-Gm-Message-State: APjAAAVSRwDYFf6dxXQATeqxpe0m8Kq44T9nYEeqR1o+r8ug1+QLGXg2
 hYqRK8AEMaht7saAxRcL9I6EZw==
X-Google-Smtp-Source: APXvYqz50M+S4xWTYCGyJyiMKK2A1dg1v5QnTQmci14qYM9kvCZigF7n8wzjjF8WBY5l+0UHAOSDvg==
X-Received: by 2002:a1c:4044:: with SMTP id n65mr7997626wma.85.1552819330840; 
 Sun, 17 Mar 2019 03:42:10 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 o8sm8110872wma.1.2019.03.17.03.42.08
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 17 Mar 2019 03:42:09 -0700 (PDT)
Message-ID: <5C8E2480.8020402@baylibre.com>
Date: Sun, 17 Mar 2019 11:42:08 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH 6/9] arm64: dts: meson: g12a: Add UART A, B & C nodes
 and pins
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-7-narmstrong@baylibre.com>
 <CAFBinCAa+ZjxJi491_dG+kvLFPLFoLXHFZToGP8W1ECeeqOYVQ@mail.gmail.com>
 <5C8D099D.5020206@baylibre.com>
 <CAFBinCBHiLjrwXA4jXSg3qnGa925r--Nj_RH7xUFqyTkYzhKGA@mail.gmail.com>
In-Reply-To: <CAFBinCBHiLjrwXA4jXSg3qnGa925r--Nj_RH7xUFqyTkYzhKGA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190317_034214_726444_FFCD2631 
X-CRM114-Status: GOOD (  12.27  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAxNi8wMy8yMDE5IDIzOjE0LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoKPiBI
aSBOZWlsLAo+IAo+IE9uIFNhdCwgTWFyIDE2LCAyMDE5IGF0IDM6MzUgUE0gTmVpbCBBcm1zdHJv
bmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPiBbLi4uXQo+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1YXJ0X2FvX2FfY19waW5zOiB1YXJ0X2Fv
X2FfYyB7Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbXV4IHsKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGdyb3VwcyA9ICJ1YXJ0X2FvX2FfcnhfYyIsCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidWFy
dF9hb19hX3R4X2MiOwo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAidWFydF9hb19hX2MiOwo+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmlhcy1kaXNh
YmxlOwo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IH07Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4+PiBJ
J20gZmluZSB3aXRoIHRoaXMgcGFydCBpZiB5b3UgbWVudGlvbiBpdCBpbiB0aGUgc3ViamVjdCBh
bmQvb3IgdGhlIGRlc2NyaXB0aW9uCj4+PiB1YXJ0X2FvX2FfYyByb3V0ZXMgdHdvIHBpbnMgZnJv
bSBiYW5rIEMgKGZyb20gdGhlIEVFIGRvbWFpbikgdG8gdGhlCj4+PiB1YXJ0X0FPIGNvbnRyb2xs
ZXIgKGZyb20gdGhlIEFPIGRvbWFpbikKPj4KPj4gTm90IHN1cmUgRFQgaXMgdGhlIHJpZ2h0IHBs
YWNlIGZvciB0aGF0LCBJIHRoaW5rIEknbGwgcmVtb3ZlIHRoaXMgdW50aWwKPj4gd2UgaGF2ZSBp
dCBhY3R1YWxseSB1c2VkIHNvbWV3aGVyZS4KPiBJJ20gZmluZSB3aXRoIHRoYXQgYXMgd2VsbAo+
IAo+IFsuLi5dCj4+Pj4gKwo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHVhcnRfQzogc2Vy
aWFsQDIyMDAwIHsKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiYW1sb2dpYyxtZXNvbi1neC11YXJ0IjsKPj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDAgMHgyMjAwMCAweDAgMHgxOD47Cj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgOTMgSVJRX1RZUEVfRURH
RV9SSVNJTkc+Owo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0g
PCZ4dGFsPiwgPCZjbGtjIENMS0lEX1VBUlQxPiwgPCZ4dGFsPjsKPj4+IGRvZXMgdWFydF9DIHJl
YWxseSB1c2UgQ0xLSURfVUFSVDE/IG9uIEdYIHVhcnRfQyB1c2VzIENMS0lEX1VBUlQyCj4+Cj4+
IEl0IHNlZW1zIHNvIDoKPj4gaHR0cHM6Ly9naXRodWIuY29tL2hhcmRrZXJuZWwvbGludXgvYmxv
Yi9vZHJvaWRuMi00LjkueS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb25nMTJhLmR0
c2kjTDEwMjAKPiBpdCdzIHdlaXJkIGJ1dCB3ZSBjYW4gYWx3YXlzIGZpeCBpdCB1cCBsYXRlciBp
ZiBuZWVkZWQuIHNvIGxldCdzIGtlZXAKPiBpdCBmb3Igbm93IHRvIHN0YXkgY29uc2lzdGVudCB3
aXRoIHRoZSB2ZW5kb3Iga2VybmVsIHVudGlsIHdlIGtub3cKPiBiZXR0ZXIKPiAKPiBKaWFueGlu
LCBjYW4geW91IHBsZWFzZSBjaGVjayB3aXRoIHRoZSBoYXJkd2FyZSB0ZWFtIHdoZXRoZXIgdGhl
Cj4gdWFydF9DIGdhdGUgY2xvY2sgKHBjbGspIGlzIENMS0lEX1VBUlQxIG9yIENMS0lEX1VBUlQy
IG9uIEcxMkE/CgpJIHRoaW5rIGl0J3MgYSB0eXBvLCBpdCBzaG91bGQgdXNlIENMS0lEX1VBUlQy
CgpOZWlsCgo+IAo+IAo+IFJlZ2FyZHMKPiBNYXJ0aW4KPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
