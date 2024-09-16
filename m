Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4DFC3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 05:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8vqIFFnqY2dhS52AB4Ktl2r7d74WdeGN7T3bfPmTi0=; b=DeooUMKYUOCzvK
	d4bDgC/RxIaLWY8Nx4d2JJQJwO7PLVCqsaGusf4UU/xO03W6/FZGDDxk42tHiLB6sVa8DJPzKr7Lp
	6isVk8l4b4/Ci6RmQKUAUoLiI8cr8BXZEGJaumDNQSbDLGzFQtLqH/X1JgmcM4bTsAUgEwoFLrrZ6
	DvwtdkjzXq0UZDTw4HjMHpUwBKvJo5dVv5H7mEGKkimT2AjiRfuRtks8myqW3w2Eq9o9lXo7NYjwE
	dz8/+hSbC425HWGRempdVO4okuyDwrr/6+oYSkgQDZOrxZ+1Uk5ipVsRoA2v+Mzxf/IIvd9wfc5Lu
	Sxd8K3uMhePgwKqrtNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq4kl-000000039hO-2YA0;
	Mon, 16 Sep 2024 05:58:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq4je-000000039ca-36iJ;
	Mon, 16 Sep 2024 05:57:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so39776325e9.3;
        Sun, 15 Sep 2024 22:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726466237; x=1727071037; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl+2AAWYETldwVjUaHiUK47kWu/JCIO2jHwLCtQuXp4=;
        b=Gti8VE6jEw12p/NLvWOMJDExYdqXI/yQctUHkb3W2uPl/z9adb4XiUkUhU5s7DcWxS
         VHpeRt9sQ0RUaXNJt4RsbL1YT4efUTkn3+tN5HE2X6GWVGGDmjuMb+d7gNR2fEzfzc8b
         FoPA/DCAIQJMokvrnVmvIXhli2r8nvKZcJqjvyAEEimLVePyqBuRJaiZKDYjELTJaER0
         9rQpNBz3XfppYaiGgZGH2WUQeMg56m7ipayWwvqIYMVSryvoRl9PyHxBkrluLFKCv4eP
         fengTUKwJmT1tWyrsjR19IdxWzikbZL9y7Dpe/8StETUABn95nK3/Nycj4d+WiKS2AGZ
         7jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726466237; x=1727071037;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl+2AAWYETldwVjUaHiUK47kWu/JCIO2jHwLCtQuXp4=;
        b=fvIh+Ld60Dz56VE390v3jUDaPomVUQa///r/17zzj3AmODBwSUsFFFeDBrQDXNatxq
         1D59Beh4ko5JAM3NPEtfLLARbwcBMO3FhxmRtpzDXHU7Pw5g0w6l4p2bDZoFz94cfVH7
         8DEMhyZzXx11bhqWq9fMIoijJCoFzo7aTSezPYrwPWe5lEfl2SwiKfiV8zXprjsi7IOE
         +92l3+xR+uI5LwFaRdqGdSIFeoKwBVanGC84Z/ijbDjAu4b3jT99qjDJJITWPJMKHvM1
         cD4xkNIJZWn5uhYhM5DlmjOYtgfxzpEt756eeR/D1BR6CVk+ldzGUV9ghuup9fnHoTbW
         uOCA==
X-Forwarded-Encrypted: i=1; AJvYcCWJiCh8aos95uS0GXMOvjaqbst2pjL/xZ/ATGgZ4lhKuVSP+Ix8FxKxWX7Ye75zEKCW6ChVGlbWd+aficfu@lists.infradead.org, AJvYcCXatuRN1ZKPB5Xp4tR+yZVZ7kq5VlRrvoKDOzQxOttB8eGOO909VtQTPK3RU86ZHm55ybdUMS4dhcAkCuQgOTuAYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRpKua67RmdKTRxkOsPaO1Jzios72VTAlUg6s2hq2qQAecdWZu
	EB9h5EaYzfMXFhwzwJUtmUoG1Z7wX/uf83FTmyP8kM92j33h90x7
X-Google-Smtp-Source: AGHT+IEUrSWUGDZnMQIILFOWp5/d6rroNjHBe56J1xM6fccQhg4po9Tmf6aYuU2sa0K/wdKqgsJ0sw==
X-Received: by 2002:a05:600c:5248:b0:42c:de6e:7f4d with SMTP id 5b1f17b1804b1-42cde6e8056mr96239625e9.34.1726466235893;
        Sun, 15 Sep 2024 22:57:15 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm193612195e9.1.2024.09.15.22.57.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Sep 2024 22:57:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH 4/7] ARM: dts: amlogic: meson6: delete undocumented nodes
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCD+txhz0x20LXhydZpLk=u4d9FT4=1sOX1bKuDeQqsMjQ@mail.gmail.com>
Date: Mon, 16 Sep 2024 09:57:01 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AML <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-Id: <DAFA9AA0-F51E-438E-A486-389164C043CE@gmail.com>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
 <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-4-feaabb45916b@linaro.org>
 <CAFBinCD+txhz0x20LXhydZpLk=u4d9FT4=1sOX1bKuDeQqsMjQ@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_225718_812554_E7AEE2EA 
X-CRM114-Status: GOOD (  17.88  )
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

PiBPbiAxNSBTZXAgMjAyNCwgYXQgMTE6MTLigK9QTSwgTWFydGluIEJsdW1lbnN0aW5nbCA8bWFy
dGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gSGkgTmVpbCwKPiAK
PiBPbiBXZWQsIFNlcCAxMSwgMjAyNCBhdCAxMjoxOeKAr1BNIE5laWwgQXJtc3Ryb25nCj4gPG5l
aWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+PiAKPj4gRGVsZXRlIG5vZGVzIGluIG1l
c29uNi5kdHNpIHRoYXQgYXJlIGNsZWFybHkgdW5kb2N1bWVudGVkICYgdW51c2VkIGZvciBtZXNv
bjYsCj4+IGZpeGluZyB0aGUgZm9sbG93aW5nIGNoZWNrIGVycm9yczoKPj4gYXVkaW8tY29udHJv
bGxlckA1NDAwOiBjb21wYXRpYmxlOjA6ICdhbWxvZ2ljLGFpdScgaXMgbm90IG9uZSBvZiBbJ2Ft
bG9naWMsYWl1LWd4YmInLCAnYW1sb2dpYyxhaXUtZ3hsJywgJ2FtbG9naWMsYWl1LW1lc29uOCcs
ICdhbWxvZ2ljLGFpdS1tZXNvbjhiJ10KPj4gICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQvYW1sb2dpYyxhaXUueWFtbCMKPj4gYXVkaW8t
Y29udHJvbGxlckA1NDAwOiBjb21wYXRpYmxlOiBbJ2FtbG9naWMsYWl1J10gaXMgdG9vIHNob3J0
Cj4+ICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L3NvdW5kL2FtbG9naWMsYWl1LnlhbWwjCj4+IC9zb2MvYnVzQGMxMTAwMDAwL3B3bUA4NTUwOiBm
YWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnYW1sb2dpYyxtZXNv
bi1wd20nXQo+PiAvc29jL2J1c0BjMTEwMDAwMC9wd21AODY1MDogZmFpbGVkIHRvIG1hdGNoIGFu
eSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOiBbJ2FtbG9naWMsbWVzb24tcHdtJ10KPj4gcGh5QDg4
MDA6IGNvbXBhdGlibGU6ICdvbmVPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBm
aXhlZDoKPj4gICAgICAgIFsnYW1sb2dpYyxtZXNvbi1teC11c2IyLXBoeSddIGlzIHRvbyBzaG9y
dAo+PiAgICAgICAgJ2FtbG9naWMsbWVzb24tbXgtdXNiMi1waHknIGlzIG5vdCBvbmUgb2YgWydh
bWxvZ2ljLG1lc29uOC11c2IyLXBoeScsICdhbWxvZ2ljLG1lc29uOGItdXNiMi1waHknLCAnYW1s
b2dpYyxtZXNvbjhtMi11c2IyLXBoeSddCj4+ICAgICAgICAnYW1sb2dpYyxtZXNvbi1neGJiLXVz
YjItcGh5JyB3YXMgZXhwZWN0ZWQKPj4gICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvcGh5L2FtbG9naWMsbWVzb244Yi11c2IyLXBoeS55YW1sIwo+
PiBwaHlAODgyMDogY29tcGF0aWJsZTogJ29uZU9mJyBjb25kaXRpb25hbCBmYWlsZWQsIG9uZSBt
dXN0IGJlIGZpeGVkOgo+PiAgICAgICAgWydhbWxvZ2ljLG1lc29uLW14LXVzYjItcGh5J10gaXMg
dG9vIHNob3J0Cj4+ICAgICAgICAnYW1sb2dpYyxtZXNvbi1teC11c2IyLXBoeScgaXMgbm90IG9u
ZSBvZiBbJ2FtbG9naWMsbWVzb244LXVzYjItcGh5JywgJ2FtbG9naWMsbWVzb244Yi11c2IyLXBo
eScsICdhbWxvZ2ljLG1lc29uOG0yLXVzYjItcGh5J10KPj4gICAgICAgICdhbWxvZ2ljLG1lc29u
LWd4YmItdXNiMi1waHknIHdhcyBleHBlY3RlZAo+PiAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waHkvYW1sb2dpYyxtZXNvbjhiLXVzYjItcGh5
LnlhbWwjCj4+IC9zb2MvYnVzQGMxMTAwMDAwL21tY0A4YzIwOiBmYWlsZWQgdG8gbWF0Y2ggYW55
IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnYW1sb2dpYyxtZXNvbi1teC1zZGlvJ10KPj4gbW1j
QDhlMDA6IGNvbXBhdGlibGU6MDogJ2FtbG9naWMsbWVzb24tbXgtc2RoYycgaXMgbm90IG9uZSBv
ZiBbJ2FtbG9naWMsbWVzb244LXNkaGMnLCAnYW1sb2dpYyxtZXNvbjhiLXNkaGMnLCAnYW1sb2dp
YyxtZXNvbjhtMi1zZGhjJ10KPj4gICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvbW1jL2FtbG9naWMsbWVzb24tbXgtc2RoYy55YW1sIwo+PiBtbWNA
OGUwMDogY29tcGF0aWJsZTogWydhbWxvZ2ljLG1lc29uLW14LXNkaGMnXSBpcyB0b28gc2hvcnQK
Pj4gICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
bW1jL2FtbG9naWMsbWVzb24tbXgtc2RoYy55YW1sIwo+PiByZW1vdGVwcm9jQDFjOiBjb21wYXRp
YmxlOjA6ICdhbWxvZ2ljLG1lc29uLW14LWFvLWFyYycgaXMgbm90IG9uZSBvZiBbJ2FtbG9naWMs
bWVzb244LWFvLWFyYycsICdhbWxvZ2ljLG1lc29uOGItYW8tYXJjJ10KPj4gICAgICAgIGZyb20g
c2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmVtb3RlcHJvYy9hbWxv
Z2ljLG1lc29uLW14LWFvLWFyYy55YW1sIwo+PiByZW1vdGVwcm9jQDFjOiBjb21wYXRpYmxlOiBb
J2FtbG9naWMsbWVzb24tbXgtYW8tYXJjJ10gaXMgdG9vIHNob3J0Cj4+ICAgICAgICBmcm9tIHNj
aGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3JlbW90ZXByb2MvYW1sb2dp
YyxtZXNvbi1teC1hby1hcmMueWFtbCMKPj4gCj4+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ry
b25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+IEdlbmVyYWxseSBJJ20gZmluZSB3aXRo
IHRoaXMuIEknbSB3b25kZXJpbmcgaWYgd2Ugc2hvdWxkIGdvIG9uZSBzdGVwCj4gZnVydGhlciBi
eSBkZWNvbW1pc3Npb25pbmcgTWVzb242IHN1cHBvcnQ/Cj4gVG8gYmUgc3BlY2lmaWMgaGVyZSwg
SSdtIHRoaW5raW5nIG9mIHJlbW92aW5nIE1BQ0hfTUVTT042IGZyb20KPiBhcmNoL2FybS9tYWNo
LW1lc29uL0tjb25maWcgYW5kIGRlbGV0aW5nIG1lc29uNnsuZHRzaSwtYXR2MTIwMC5kdHN9Cj4g
Cj4gSSBkb24ndCBoYXZlIGFueSBib2FyZHMgd2l0aCBNZXNvbjYgU29DLCB0aGVyZSdzIG5vIHVw
c3RyZWFtIEdQSU8sCj4gcGluY3RybCwgY2xvY2ssIE1NQywgPHlvdSBuYW1lIGl0PiBkcml2ZXIg
Zm9yIHRoYXQgU29DIGVpdGhlci4KPiBTbyBhbGwgd2UgaGF2ZSB1cHN0cmVhbSBpcyB0aGUgYWJp
bGl0eSB0byBib290IHRvIGluaXRyYW1mcyBhbmQgdXNlCj4gc2VyaWFsIGNvbnNvbGUocykuCj4g
SWYgc29tZW9uZSBpcyBpbnRlcmVzdGVkIGluIE1lc29uNiBzdXBwb3J0IHRoZXkgc2hvdWxkIGJy
aW5nIGl0IGJhY2sKPiBhbG9uZyB3aXRoIGEgZmV3IG1vcmUgcGF0Y2hlcyBmb3IgdXBzdHJlYW0g
c3VwcG9ydCBvZiBmdXJ0aGVyCj4gcGVyaXBoZXJhbHMuCgpJIHRoaW5rIHRoYXTigJlzIGEgc2Vu
c2libGUgbW92ZS4gTGlicmVFTEVDIHdhcyBvbmUgb2YgdGhlIGZldyBkaXN0cm9zCnRoYXQgc3Vw
cG9ydGVkIE1lc29uNiBoYXJkd2FyZSBpbiB0aGUgcGFzdCAodmlhIHRoZSB2ZW5kb3Iga2VybmVs
KQpidXQgd2UgZW5kZWQgc3VwcG9ydCBpbiAyMDE4LiBNZXNvbjYgZGV2aWNlcyBhcmUgbW9zdGx5
L2FsbD8gY2hlYXAKQW5kcm9pZCBib3hlcyBkYXRpbmcgZnJvbSAyMDExLTIwMTMgYW5kIHRoZXNl
IGhhdmUgZWl0aGVyIGJlZW4gYmVlbgpkaXNjYXJkZWQgYnkgdXNlcnMgdGhyb3VnaCB1cGdyYWRl
cyBvciB0aGUgYm94ZXMgZGllZCBsb25nIGFnby4gVGhlcmUKaXMgc3RpbGwgY29tbXVuaXR5IGlu
dGVyZXN0IGluIHN1cHBvcnRpbmcgTWVzb244IGJvYXJkcyAodGhlIDh4IGNvcmUKZGV2aWNlcyBh
cmUgdXNlZCBmb3IgcmV0cm8tZ2FtaW5nKSBidXQgbm90IHRoZSBlYXJsaWVyIE1lc29uNiBvbmVz
LgoKQ2hyaXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
