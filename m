Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAC3C02183
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2025 08:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FR4y/4TT0fnHAp8lPwBTSWlk8QZD0+oQ3W1TZ8J5jwI=; b=5BUWYjrpovl5yP
	aMZpYsBU4hqKCca3hztHJeCCbPvnybNwdFBL/hXW72d4ll9spjSrU/A/Me7Ntbc8iNqv5/vd5/Qb0
	nDJQWKfa1szDk0VTR6853BzJ11p9EDMlcTQeHmPJuq6x5siSc7q2rMZAdcWxPydv3vmAX53+HVHp+
	/Njp6JvugaSoTL5wZwrenIbGXSvQwPPMAUz1E/7cIz2ko/IJCjOU6G5kq8XqPWJDbpen3IY/f0Iu8
	jTbfN6hNQwmLeqzTJMorGTowU70iYkAd95ERkVooGd3huGx479+X1kAGQ6ocd5lRpkMXxofR5LdXu
	rcgfeXLYC2VhCPex55uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyuO-0000000B7Y6-27nA;
	Wed, 15 Jan 2025 08:37:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyt8-0000000B7N1-09O2
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Jan 2025 08:36:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-436a03197b2so45121345e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Jan 2025 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736930192; x=1737534992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lB3rHXjrUs5AJYYMIbdtSlreS8MQ74B9bY+rKil3MA8=;
        b=rK5ITrOdXqBKDLHq4/HDJB1NPIr1c2vjRN76MwSXAA+KArTwOQrL6QVETLgNEXpUEh
         rOcfcHOD5+hCeCCjdZcvLWZxP+CPaU3Fk64WudhBoZu1Lvf9soii6jhNq108Kowlelik
         ybWc6VinNdt2nMQp0wXD5Vm+LFKpwNqkszxhdeI09UPQOXipynQDbEEiNn9JO/6VGx+5
         G4tmFUlTZWv3Gn41CN/LfpuEJR1K6UvGUaD9O3wMeyk3JFiwTaJ1hck6L6ae/r0Hpmiu
         ON2fEAhHD/ZNYtdBLAXlqTrwvOALiLwLcEKHO+bTUh9oNLFdd6h+2lwsE0quiH2WOnvm
         UQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736930192; x=1737534992;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lB3rHXjrUs5AJYYMIbdtSlreS8MQ74B9bY+rKil3MA8=;
        b=Ui8HXfaiAJApP02wPQDq5CApWUo+wCKsPtJdKv2feXhzM8LTKZwFImvvXiB6bG/Nq4
         ABnvdSUIIYR9edeQjRzYzmWSS22/sQHYDcrLlMpJX7HdrO+eIuBhtPpN7qvuxun6/mXh
         2/xpvEpysuu7MvxZm+NMQKoBZl4Ij+DUO2AI4SDTKM/+0YI/E7vNxt7UHyIf0NbpVTQR
         Y5fGqgtMU/sxcDsGEWQU3/nCrVILB4D2OPDJ/wLiToOsnrQybicpVeHzl06nHTs2kFok
         0L/yv8QZyf1BmPl1pv0sDnYM1sEn+b6yXwjVCe9AlaD7X15fVNAs7VYaabCGTogxmz8k
         4How==
X-Forwarded-Encrypted: i=1; AJvYcCX9rhtoFPszTqE05LHY/AVDwiB74veuag7cGBVYACrFiHy5Po0SUiR+2pvccaPu88PQ0WqxPeuTvycx1uhY@lists.infradead.org
X-Gm-Message-State: AOJu0YxxeQwl6vmvM0sk7aFQaT0OaFDtwVw6gba4imVK95P9DfzZLb7C
	Lld/KsPVpsN35ojrDOcd/Qfy6B9vkAnWpU9+caTyrqok2EhSGlD7NUZqHI4QuKw=
X-Gm-Gg: ASbGncskeGwNCe5/vJwIa8hRgPJpt3oxzusFtQ+6MkgG+e6mNWsO49bgPzXiJghavsr
	+p5sa4kOqNIwxEJez6aGTMP8p4PhF0ygumuZ4gdxFM6GAt/ip4BDF1EbtNfrrWeLHK/yT5/ty9c
	O6Z+jqKZppdfNG6zwT6SUL2oABoxBIUDJj1n35RDOODLXiAwQJbemkhJYI2UvtEMAWgfQg/bknp
	VDSlMPBGwdILE4aMnu6j1WczKTCAqLEXqTOD6QAlcb/CQqqT5cwz6ro
X-Google-Smtp-Source: AGHT+IGHLV3oniHk2tCYLxFndHHL9KG5RVtJRTDpiO1CMzyqcEywc4SzfBdAV2UjsP92dEf3xkAv9g==
X-Received: by 2002:a05:600c:3554:b0:436:1be4:c9b4 with SMTP id 5b1f17b1804b1-436e26ff1b2mr227264435e9.27.1736930192380;
        Wed, 15 Jan 2025 00:36:32 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e7b8:6186:fc23:f678])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d447sm16644404f8f.4.2025.01.15.00.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:36:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
In-Reply-To: <e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com> (Jiebing
	Chen's message of "Wed, 15 Jan 2025 10:56:17 +0800")
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
	<20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
	<1jwmey9451.fsf@starbuckisacylon.baylibre.com>
	<e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
	<e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
	<1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
	<e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 09:36:31 +0100
Message-ID: <1jr0545v8w.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_003634_067114_3BE5AAC4 
X-CRM114-Status: GOOD (  30.88  )
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

T24gV2VkIDE1IEphbiAyMDI1IGF0IDEwOjU2LCBKaWViaW5nIENoZW4gPGppZWJpbmcuY2hlbkBh
bWxvZ2ljLmNvbT4gd3JvdGU6Cgo+IOWcqCAyMDI1LzEvMTQgMjI6MDUsIEplcm9tZSBCcnVuZXQg
5YaZ6YGTOgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4KPj4gT24gVHVlIDE0IEphbiAyMDI1IGF0
IDE5OjIwLCBKaWViaW5nIENoZW4gPGppZWJpbmcuY2hlbkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+
Cj4+Pj4+PiArCj4+Pj4+PiArTU9EVUxFX0RFU0NSSVBUSU9OKCJBbWxvZ2ljIHRvIGNvZGVjIGRy
aXZlciIpOwo+Pj4+Pj4gK01PRFVMRV9BVVRIT1IoImppZWJpbmcuY2hlbkBhbWxvZ2ljLmNvbSIp
Owo+Pj4+Pj4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPj4+Pj4+IGRpZmYgLS1naXQgYS9zb3Vu
ZC9zb2MvbWVzb24vdDkwMTUuYyBiL3NvdW5kL3NvYy9tZXNvbi90OTAxNS5jCj4+Pj4+PiBpbmRl
eAo+Pj4+Pj4gNTcxZjY1Nzg4YzU5MjA1MGFiZGNhMjY0ZjU2NTZkNGQxYTlkOTlmNi4uMmRiMWNk
MThjZjJjZWE1MDdmM2Q3MjgyMDU0ZTAzZDk1MzU4NjY0OAo+Pj4+Pj4gMTAwNjQ0Cj4+Pj4+PiAt
LS0gYS9zb3VuZC9zb2MvbWVzb24vdDkwMTUuYwo+Pj4+Pj4gKysrIGIvc291bmQvc29jL21lc29u
L3Q5MDE1LmMKPj4+Pj4+IEBAIC04OSwxMCArODksNyBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2Nf
ZGFpX2RyaXZlciB0OTAxNV9kYWkgPSB7Cj4+Pj4+PiAgICAgICAgICAgICAgICAgLmNoYW5uZWxz
X21pbiA9IDEsCj4+Pj4+PiAgICAgICAgICAgICAgICAgLmNoYW5uZWxzX21heCA9IDIsCj4+Pj4+
PiAgICAgICAgICAgICAgICAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+
Pj4+IC0gICAgICAgICAgICAgLmZvcm1hdHMgPSAoU05EUlZfUENNX0ZNVEJJVF9TOCB8Cj4+Pj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFIHwKPj4+
Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgU05EUlZfUENNX0ZNVEJJVF9TMjBfTEUgfAo+
Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSks
Cj4+Pj4+PiArICAgICAgICAgICAgIC5mb3JtYXRzID0gKFNORFJWX1BDTV9GTVRCSVRfUzE2X0xF
IHwKPj4+Pj4+IFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFKSwKPj4+Pj4gQWdhaW4sIG1peGVkIHVw
IGNoYW5nZXMgd2l0aCB6ZXJvIGp1c3RpZmljYXRpb24uCj4+Pj4+Cj4+Pj4+IFRoaXMgZHJvcHMg
UzggYW5kIFMxNiBmb3JtYXQgc3VwcG9ydCBmb3IgdGhlIGV4aXN0aW5nIFNvQ3MgKHN1Y2ggYXMg
R1hMKQo+Pj4+PiB3aGljaCBpcyBrbm93biB0byB3b3JrIGFuZCBhZGQgUzMyIHN1cHBvcnQgb24g
YW4gSFcgZG9jdW1lbnRlZCBhcyAyNGJpdHMKPj4+Pj4gb25seS4gQ2FuIHlvdSBleHBsYWluID8K
Pj4+IGZvciBnMTJhLCBzbTEgZXRjLCBpdCBpcyB1c2UgbmV3IGF1ZGlvIGlwLCBHWEwgaXMgb2xk
IGlwLAo+PiBJZiB0aGVyZSBhcmUgY2hpcHMgZGlmZmVyZW5jZSB3ZSBkaWQgbm90IGtub3cgYWJv
dXQsIHRoZW4geW91IHNob3VsZAo+PiBpbnRyb2R1Y2UgdGhvc2UgZGlmZmVyZW5jZSwgd2l0aG91
dCBicmVha2luZyBleGlzdGluZyBzdXBwb3J0IC0KPj4gaW5jbHVkaW5nIGZvciBHWEwsIHdoaWNo
IGlzIHdoYXQgeW91IGRpZCBJSVVDLgo+Pgo+Pj4gdGhlIG5ldyBpcCBub3Qgc3VwcG9ydCAyNCBi
aXQsCj4+IEFyZSBzdXJlIGFib3V0IHRoYXQgPyB0aGF0IGNvZGUgaGFzIGJlZW4gdGhlcmUgZm9y
IGEgd2hpbGUuCj4+Cj4+IElmIHNtMSBkb2VzIG5vdCBzdXBwb3J0IFNORFJWX1BDTV9GTVRCSVRf
UzI0X0xFLCB5b3Ugc2hvdWxkIGEgZml4IHVwIHBhdGNoIGZvcgo+PiB0aGF0LCB3aXRoIHRoZSBw
cm9wZXIgIkZpeGVzOiIgdGFnLCBob3cgdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVtIGFuZAo+PiBl
eHBsYWluaW5nIHRoZSBmaXguCj4KPiBtYXliZSB0aGVyZSBhcmUgc29tZSBnYXAgLCB3ZSBzdXBw
b3J0IFNORFJWX1BDTV9GTVRCSVRfUzI0LCBub3Qgc3VwcG9ydCB0aGUKPgo+IFNORFJWX1BDTV9G
TVRCSVRfUzI0XzNMRSzCoCBmb3IgU05EUlZfUENNX0ZNVEJJVF9TMjQKPgo+IGl0IGlzwqAgU2ln
bmVkLCAyNC1iaXQgKDMyLWJpdCBpbiBtZW1vcnkpLCBsaXR0bGUgZW5kaWFuICwgdGhlIGF1ZGlv
IGRtYQo+IGJ1c3J0IGlzIDY0Yml0CgpJdCBtYWtlcyBhYnNvbHV0ZWx5IG5vIHNlbnNlIHRvIGRp
c2N1c3MgbWVtb3J5IGxheW91dCBmb3IgdGhlIGNvZGVjLgoKPgo+IGl0IGNhbiBnZXQgdGhlIGZ1
bGwgZGF0YS4gd2Ugc2VuZCB0aGUgMzIgYml0IGRhdGHCoCBtY2xrID0gMzJiaXQqIDQ4ayAqNCzC
oAo+IHVzZSB0aGUgY2xrIHRvIHNlbmQKPgo+IHRoZcKgIFNORFJWX1BDTV9GTVRCSVRfUzI0LMKg
wqAgdGhlIGhhZHdhcmUgYWx3YXlzIHNlbmQgdGhlIDMyYml0IGRhdGEKCk5vIGl0IGRvZXMgbm90
LiBJdCBzZW5kIDI0IGJpdHMgb2YgZGF0YSBvdmVyIGEgMzIgYml0cyBwaHlzaWNhbCB3b3JkIHdp
dGgKOCBiaXRzIGlnbm9yZWQuCgo+Cj4gc28sIGkgdGhpbmsgd2Ugb25seSBhZGQgdGhlIFNORFJW
X1BDTV9GTVRCSVRfUzMyIGJhc2Ugb24gaXQKClRoYXQncyB3cm9uZyBpZiB0aGUgY29kZWMgZG9l
cyBub3QgYWN0dWFsbHkgdXNlIHRoZSBmdWxsIDMyYml0cyAuLi4gYW5kCkkgaGF2ZSBjbGVhciBp
bmRpY2F0aW9uIHRoYXQncyB3aGF0IHRoZSBjb2RlYyBpcyBkb2luZywgb24gR1hMIGF0IGxlYXN0
LgoKPgo+IHdlIHRoaW5rIHRoZSAyNCBiaXQgaXMgdGhlIFNORFJWX1BDTV9GTVRCSVRfUzI0XzNM
RSwgaXQgaXMgMjRiaXQgaW4gbWVtcm95LAo+Cj4gZHVlIHRvIHRoZSBkbWEgYnVzcnQgNjQgYml0
IGxpbWl0LCBpdCBjYW4ndCBhbGlnbiB0aGUgc2FtcGxlIGJpdCwgaWYgaXQgaXMKPiAyNCBiaXQK
CkFnYWluLCBtZW1vcnkgbGF5b3V0IG1ha2VzIG5vIHNlbnNlIGhlcmUuCgo+Cj4gc28gdGhlIGNs
b2NrIGNvbmZpZ3VyZSBjYW4ndCAyNGJpdCBjbG9jaywKCkkgZGlzYWdyZWUgYW5kIHRoaXMgaGFz
IGJlZW4gdGVzdGVkLiBJZiB5b3UgaGF2ZSBhIHRlc3QgY2FzZSBzaG93aW5nCm90aGVyd2lzZSBw
bGVhc2Ugc2hhcmUgaXQuCgo+IGJ5IHRoZSB3YXksIFdlIGRpc2N1c3MgaW50ZXJuYWxseSBmb3Ig
Z3hsLAo+Cj4gaXQgYWxzbyBzdXBwb3J0IHRoZSBTTkRSVl9QQ01fRk1UQklUX1MzMgo+CgpEb2Vz
IGl0IHJlYWxseSA/IElmIGl0IGlzIGp1c3QgdG8gaWdub3JlIHRoZSA4Yml0cyBMU0IsIHRoYXQg
bm90IGEgc3VwcG9ydC4KCj4KPj4KPj4+IHVzdWFsbHkgc3VwcG9ydCAxNi8zMiBiaXQgZm9yIG5l
dyBhdWRpbyBpcCAsIGZvciBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSwKPj4+IGl0IHdpZHRoID0y
NCwgcGh5ID0zMgo+PiBZZXMgcGh5c2ljYWwgb2YgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUsIHNv
IG1vc3QgY2hpcCBzdXBwb3J0aW5nIDMyIGJpdHMKPj4gd2lkdGggd291bGQgc3VwcG9ydCB0aGlz
IFMyNF9MRSwgdW5sZXNzIHRoZXJlIGlzIHNvbWV0aGluZyBvZGQuCj4+Cj4+PiBpdCB3YXMgIHRy
ZWF0ZWQgYXMgMzIgYml0IHRvIHNlbmQgZm9yIHRkbSwgc28gd2UgY2FuIG9ubHkgYWRkIHRoZSBT
MzJMRQo+Pj4gYmFzZSBvbiBpdCAsIHJpZ2h0ID8KPj4gWW91IGFyZSBhc2tpbmcgbWUgPyBIb3cg
YW0gSSBzdXBwb3NlIHRvIGtub3cgPwo+Pgo+Pj4gYnV0IGlmIHRoZSBneGwgbm90IHN1cHBvcnQg
dGhlIDMyYml0Cj4+IEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbSB3aXRoIGEgREFDIHRha2luZyBpbnB1
dCBvbiAzMmJpdHMgcGh5c2ljYWwKPj4gaW50ZXJmYWNlIGFuZCBpZ25vcmluZyBzb21lIGJpdCBv
biBwcm9jZXNzaW5nLgo+Pgo+PiBJZiB0aGF0J3Mgbm90IHRoZSBjYXNlLCBwbGVhc2Ugc2VuZCBh
IHByb3BlciBmaXggY2hhbmdlIHdpdGggc29tZSBleHBsYW5hdGlvbgo+Pgo+Pj4gd2UgbmVlZCBh
ZGQgbmV3IHNuZF9zb2NfZGFpX2RyaXZlciB0OTAxNV9kYWlfczQgPwo+Pj4KPj4gSWYgSSB1bmRl
cnN0b29kIGNvcnJlY3RseSBmb3JtYXQgZGVwZW5kcyBvbiB0aGUgY2hpcCBhbmQgbmVlZHMgdG8K
Pj4gYWRqdXN0ZWQgaW5jbHVkaW5nIGZvciBzbTEuCj4+Cj4+Pj4+PiAgICAgICAgIH0sCj4+Pj4+
PiAgICAgICAgIC5vcHMgPSAmdDkwMTVfZGFpX29wcywKPj4+Pj4+ICAgIH07Cj4+Pj4+IC0tIEpl
cm9tZQo+PiAtLQo+PiBKZXJvbWUKCi0tIApKZXJvbWUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
