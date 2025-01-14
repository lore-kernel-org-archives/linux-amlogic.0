Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3710E77188
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2025 14:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQPZlzb6iicWYkEqF47Pg+doksV92kepjLSDS5+ldF8=; b=RnVs2acEOAaKta
	dDVl3kmk/J0j9oPVbuPkl1T7UeObt+ipesteEKOLXerYhROrGNHvvO1MWvjtnOTB6dmgsL10YLPvF
	taK2+WjR6JyVsWDyyjn802o+Jv7QisbJS73KXxCLHmB0XnAx+v8kuz6ctbA8CWSJVruUYSbgqLKfP
	yG67y9+Ggqo5G4ugpYD97sUqKVvnG7sVmGkv+L30eVoCRdYlBh1DDSbNQ7XCZ1m8dMeoEtXiw/Z+8
	d3LpKgVjnt9xaTYucB3ltzDG5XLI6xcQdvjt9+9qlfz4dWPDRmalIgSpa2fAvmNHYkaCvPh1+hNlo
	ljMOBqASkZ7tBjn0RjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhhB-00000008dOF-3EZD;
	Tue, 14 Jan 2025 14:15:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhXr-00000008b9o-3ywQ
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jan 2025 14:05:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so57278535e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jan 2025 06:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736863526; x=1737468326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tKjcpDmSDVi0I0Iymsx6pKq7XeGCNlnh/DkEXq+Kvg=;
        b=J6YPReEyVwhtvPLwoif+nRbUjeWO+1ZHeaGsEUs1VyNPSS4U9g2jjtdVBYeAGNTpBn
         HcUJXv0yxo/97zVMaUXRfmdrorvFPYxvOvKGhIqTnSvmPHOdAdtOcVzdCkRaATLXIUbP
         TNDG3jVdaA6ckTPkjsmaw1pXjNZ420UIPUaGXTdey/EluPcyL55ejNedexYTj5kwIMGT
         DfCkQGNzUBcdXHxSCnLLAf+m5SDE+lm7Ex2A4wtRmWSgB0okTbtFGHL8gjSD7MZMgY+3
         D5pH7ACzKHo8w5lkqJ2HuyFuPMFERuT/Rgqj+Z/IfRthKEfQ4wI2LPJHFcab3gAp44VQ
         QN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736863526; x=1737468326;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tKjcpDmSDVi0I0Iymsx6pKq7XeGCNlnh/DkEXq+Kvg=;
        b=ZwtUi/79MInHy8GmoDhk6dIPjQtJmfWc/Hi6w6jLwB5NShR1ixaC0e33aYYq5mig/N
         EWSAJNhFN9zcSeRZsXMvP1g1g7s79absLK8sZEHoW7Ezp0/lq4BQKavx0f4Y00jMXoKq
         QsliozrAnino7nzFXdM+weuF/Ll9UnsaT2OfXF8GvV4Z82Ov8zEy6W65OKgHAA6yW1ar
         Y4QDFDMZj6CePSyUwdjolwYEH1cS+gt2H52r9HaWqxM4bWVTJs1dFRLI/JGu7+RIEt4t
         YEfj3t/TlveRZcO0J88FvSo2kjIckLGzEABMAHyxC5EEPlpZuUSCPZSMqkLDr4zJVjvX
         7A8g==
X-Forwarded-Encrypted: i=1; AJvYcCVSqBWU5o0c16rWAi3dp7p7bBON7Yox1dZJqRFmhywrrUuR0eE/ZI60RfLQybAo3iyqobS6E+xpgKKv8PI6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2RGpVwPz11F9kO+Kqo5EnbVmXFlegUIROi4eMW0B/JbY8s9Fd
	y+vrQR9qn4cXtMT+ehXFtKC9/IA1v8uCSIQqvCP9evADG3O2zKlCUeA+CucaIRc=
X-Gm-Gg: ASbGncuJjjLzGdLBKnVPXgVeU4fp/VksiLIUiOCMRjpvYCnpbnHNgPsYepTRi7e6HR7
	iP+DB/6ld01py8uDNCKjCxD/OPg19bfAqwwoT8y+FCUF/V5tfpCgZqEmuSw4mE8KQy4SEDC7hgJ
	w69fNdth6MPbKC6jfO5CvP4p3P1calAT1qaQuADw4WERQiFQ1gMXjwJboNDpkYvJyP3h7oE2GpX
	UMBmLWntdNsEF4kZyuZoMbPbXDDVvgqVoLSR36GmKPvjjzqxfuUT8SZ
X-Google-Smtp-Source: AGHT+IGYBCH61RKlTG9lkoFWiyGMe6exY5OKDG7Opi27JjRz3QS+q+QxKENJfYtPEqBwzJBVByTGvA==
X-Received: by 2002:a05:600c:1d03:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-436e2699e91mr225375155e9.9.1736863525942;
        Tue, 14 Jan 2025 06:05:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:317c:3d93:b7d4:96cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddc5f5sm210760595e9.18.2025.01.14.06.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 06:05:25 -0800 (PST)
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
In-Reply-To: <e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com> (Jiebing
	Chen's message of "Tue, 14 Jan 2025 19:20:00 +0800")
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
	<20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
	<1jwmey9451.fsf@starbuckisacylon.baylibre.com>
	<e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
	<e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 15:05:24 +0100
Message-ID: <1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_060527_981175_0C53F574 
X-CRM114-Status: GOOD (  20.12  )
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

T24gVHVlIDE0IEphbiAyMDI1IGF0IDE5OjIwLCBKaWViaW5nIENoZW4gPGppZWJpbmcuY2hlbkBh
bWxvZ2ljLmNvbT4gd3JvdGU6Cgo+Pj4+ICsKPj4+PiArTU9EVUxFX0RFU0NSSVBUSU9OKCJBbWxv
Z2ljIHRvIGNvZGVjIGRyaXZlciIpOwo+Pj4+ICtNT0RVTEVfQVVUSE9SKCJqaWViaW5nLmNoZW5A
YW1sb2dpYy5jb20iKTsKPj4+PiArTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+Pj4+IGRpZmYgLS1n
aXQgYS9zb3VuZC9zb2MvbWVzb24vdDkwMTUuYyBiL3NvdW5kL3NvYy9tZXNvbi90OTAxNS5jCj4+
Pj4gaW5kZXgKPj4+PiA1NzFmNjU3ODhjNTkyMDUwYWJkY2EyNjRmNTY1NmQ0ZDFhOWQ5OWY2Li4y
ZGIxY2QxOGNmMmNlYTUwN2YzZDcyODIwNTRlMDNkOTUzNTg2NjQ4Cj4+Pj4gMTAwNjQ0Cj4+Pj4g
LS0tIGEvc291bmQvc29jL21lc29uL3Q5MDE1LmMKPj4+PiArKysgYi9zb3VuZC9zb2MvbWVzb24v
dDkwMTUuYwo+Pj4+IEBAIC04OSwxMCArODksNyBAQCBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFp
X2RyaXZlciB0OTAxNV9kYWkgPSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAu
Y2hhbm5lbHNfbWluID0gMSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFu
bmVsc19tYXggPSAyLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhdGVzID0g
U05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5mb3JtYXRzID0gKFNORFJWX1BDTV9GTVRCSVRfUzggfAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUg
fAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
U05EUlZfUENNX0ZNVEJJVF9TMjBfTEUgfAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUpLAo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSAoU05EUlZfUENNX0ZNVEJJVF9TMTZf
TEUgfAo+Pj4+IFNORFJWX1BDTV9GTVRCSVRfUzMyX0xFKSwKPj4+IEFnYWluLCBtaXhlZCB1cCBj
aGFuZ2VzIHdpdGggemVybyBqdXN0aWZpY2F0aW9uLgo+Pj4KPj4+IFRoaXMgZHJvcHMgUzggYW5k
IFMxNiBmb3JtYXQgc3VwcG9ydCBmb3IgdGhlIGV4aXN0aW5nIFNvQ3MgKHN1Y2ggYXMgR1hMKQo+
Pj4gd2hpY2ggaXMga25vd24gdG8gd29yayBhbmQgYWRkIFMzMiBzdXBwb3J0IG9uIGFuIEhXIGRv
Y3VtZW50ZWQgYXMgMjRiaXRzCj4+PiBvbmx5LiBDYW4geW91IGV4cGxhaW4gPwo+Cj4gZm9yIGcx
MmEsIHNtMSBldGMsIGl0IGlzIHVzZSBuZXcgYXVkaW8gaXAsIEdYTCBpcyBvbGQgaXAsCgpJZiB0
aGVyZSBhcmUgY2hpcHMgZGlmZmVyZW5jZSB3ZSBkaWQgbm90IGtub3cgYWJvdXQsIHRoZW4geW91
IHNob3VsZAppbnRyb2R1Y2UgdGhvc2UgZGlmZmVyZW5jZSwgd2l0aG91dCBicmVha2luZyBleGlz
dGluZyBzdXBwb3J0IC0KaW5jbHVkaW5nIGZvciBHWEwsIHdoaWNoIGlzIHdoYXQgeW91IGRpZCBJ
SVVDLgoKPiB0aGUgbmV3IGlwIG5vdCBzdXBwb3J0IDI0IGJpdCwKCkFyZSBzdXJlIGFib3V0IHRo
YXQgPyB0aGF0IGNvZGUgaGFzIGJlZW4gdGhlcmUgZm9yIGEgd2hpbGUuCgpJZiBzbTEgZG9lcyBu
b3Qgc3VwcG9ydCBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSwgeW91IHNob3VsZCBhIGZpeCB1cCBw
YXRjaCBmb3IKdGhhdCwgd2l0aCB0aGUgcHJvcGVyICJGaXhlczoiIHRhZywgaG93IHRvIHJlcHJv
ZHVjZSB0aGUgcHJvYmxlbSBhbmQKZXhwbGFpbmluZyB0aGUgZml4LgoKPgo+IHVzdWFsbHkgc3Vw
cG9ydCAxNi8zMiBiaXQgZm9yIG5ldyBhdWRpbyBpcCAsIGZvciBTTkRSVl9QQ01fRk1UQklUX1My
NF9MRSwKPiBpdCB3aWR0aCA9MjQsIHBoeSA9MzIKClllcyBwaHlzaWNhbCBvZiBTTkRSVl9QQ01f
Rk1UQklUX1MyNF9MRSwgc28gbW9zdCBjaGlwIHN1cHBvcnRpbmcgMzIgYml0cwp3aWR0aCB3b3Vs
ZCBzdXBwb3J0IHRoaXMgUzI0X0xFLCB1bmxlc3MgdGhlcmUgaXMgc29tZXRoaW5nIG9kZC4KCj4K
PiBpdCB3YXPCoCB0cmVhdGVkIGFzIDMyIGJpdCB0byBzZW5kIGZvciB0ZG0sIHNvIHdlIGNhbiBv
bmx5IGFkZCB0aGUgUzMyTEUKPiBiYXNlIG9uIGl0ICwgcmlnaHQgPwoKWW91IGFyZSBhc2tpbmcg
bWUgPyBIb3cgYW0gSSBzdXBwb3NlIHRvIGtub3cgPwoKPiBidXQgaWYgdGhlIGd4bCBub3Qgc3Vw
cG9ydCB0aGUgMzJiaXQKCkkgZG9uJ3Qgc2VlIGEgcHJvYmxlbSB3aXRoIGEgREFDIHRha2luZyBp
bnB1dCBvbiAzMmJpdHMgcGh5c2ljYWwKaW50ZXJmYWNlIGFuZCBpZ25vcmluZyBzb21lIGJpdCBv
biBwcm9jZXNzaW5nLgoKSWYgdGhhdCdzIG5vdCB0aGUgY2FzZSwgcGxlYXNlIHNlbmQgYSBwcm9w
ZXIgZml4IGNoYW5nZSB3aXRoIHNvbWUgZXhwbGFuYXRpb24KCj4KPiB3ZSBuZWVkIGFkZCBuZXcg
c25kX3NvY19kYWlfZHJpdmVyIHQ5MDE1X2RhaV9zNCA/Cj4KCklmIEkgdW5kZXJzdG9vZCBjb3Jy
ZWN0bHkgZm9ybWF0IGRlcGVuZHMgb24gdGhlIGNoaXAgYW5kIG5lZWRzIHRvCmFkanVzdGVkIGlu
Y2x1ZGluZyBmb3Igc20xLiAKCj4+Pgo+Pj4+IMKgwqDCoMKgwqDCoCB9LAo+Pj4+IMKgwqDCoMKg
wqDCoCAub3BzID0gJnQ5MDE1X2RhaV9vcHMsCj4+Pj4gwqAgfTsKPj4+IC0tIEplcm9tZQoKLS0g
Ckplcm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
