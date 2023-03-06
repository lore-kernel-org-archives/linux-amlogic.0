Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A287BC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 22:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UotgNbqkXSscldjfTUTLzn+FseKEYmL9f0EWkREKGig=; b=MV1aNVuAQRs/qn
	yIx1N9GtkZ3AZl1uAh2e4uKVgxtQ+FfHdnbi1Ok0WXHF3E3Kn44Fd4rJ3of4TKACGr91vyjUS2m/U
	XysFT5UyZm89kVFpIFiuMFJI+eOVIIOeZq9n88DTjhCLZqrPUY9n9VyEWa9eiNHhGYTVpzI4pJILF
	jwSrY9LY4npvhVV9sOcak8dTtO7guPZFb8/ZKB+BWXR+EGiUBx6hdinorOIL2XxMrKu5sFu7+TeQ4
	jAdcgNy57GV1G9Rw+yX72YYPdC4xhiBIR7GFUL2vAbsU+Vb7/Nl9wEvVF3OLsouc4XHLdsuftZat8
	/Lb2w0uAB0I85BZNY/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJ4A-00FCzJ-E5; Mon, 06 Mar 2023 22:12:22 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJ3x-00FCvB-Tp; Mon, 06 Mar 2023 22:12:11 +0000
Received: by mail-ed1-x535.google.com with SMTP id k10so21049305edk.13;
        Mon, 06 Mar 2023 14:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678140725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqypu7u/BnVkPsWhKgSLQ0HSA3bK6nIuV9PU1Lpb2mg=;
        b=IOci51nlSXuzjieRaUOdqf7r8nrRzsLGJ/+PuVCPOHoreEgDEZb0OVUh/dmsKMFPaC
         4TTD9gY+iKeCKS/boVDNDnoFbXOVcJwNlu+vBC2kWyxnny2n9r9CJb+gFlyLt9+r81Gd
         tnkWyCq9c9Ed1PHIiDgickobAM8wLo8xnIze4aW2JzYLeSG1uCzdu1TUSqzdVrMw4Klr
         O0zBzMPlCcssafaAd2NQ/uJUnfrUel5mz8cPeWW9THB6ob4N0y5assV+n1BaGnHUdrd4
         C+mJ0DIuwBqcGNZdrrj/I14eA3fR1n4QHDqV87U4f4v0jVtndGo11O/b/in7Rl4/qpIj
         VbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678140725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqypu7u/BnVkPsWhKgSLQ0HSA3bK6nIuV9PU1Lpb2mg=;
        b=nGooZm54EObSWlch/32pLwDLS80U5jXi3k7Dtg5b+3QuE2YcH9Dayb/1lMaw35toN1
         pNozb66ednOmGoSOhoLvkvNCyDwfIj+zxVvQpeEirGv+LaiYqojlXZBEBgeuv/lhpvF3
         0OqQkDSRGh4Vny7HKvdKE0VU5NANYbCdKIftvlBAFTDGgohoDLOqDYe2p7/FTpXWImlX
         fN/8zuu8t0b9VQVTa00NrU5DoGqJJ69WkDpc8+/9jiaN5AF5youxJrVLZRGvsO1rgI5V
         6xbvTe6JI/zh6IaFZ46GCr2RIUXNoESKxz7eHd3V3mtrhP8eayRCAnksyGIP7BPyJ+1u
         8+7g==
X-Gm-Message-State: AO0yUKV6vELlt7bfuyTWQfFbrhaTGUGVEEsLyTtJZT+AK/67paxE5zZk
	/2baly7rFXBn1V46zTOVWy/o1jYF4G0DeBOsOWU=
X-Google-Smtp-Source: AK7set/gu/IdXxNN+vChaAZ724dQ1hXdRmX35ADEx87yTxXBbtfBRX0aQ7h1uHAQ4a7LHZMaz7nsO3/goggYA0FGMcM=
X-Received: by 2002:a17:906:3002:b0:8dc:6674:5bac with SMTP id
 2-20020a170906300200b008dc66745bacmr6146850ejz.4.1678140724700; Mon, 06 Mar
 2023 14:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20230303-topic-amlogic-upstream-bpi-cm4-v2-0-2ecfde76fc4d@linaro.org>
 <20230303-topic-amlogic-upstream-bpi-cm4-v2-2-2ecfde76fc4d@linaro.org>
In-Reply-To: <20230303-topic-amlogic-upstream-bpi-cm4-v2-2-2ecfde76fc4d@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Mar 2023 23:11:53 +0100
Message-ID: <CAFBinCDSWHg1uc8+c_QwoQy2j8K5Ny6xfMfXm-zp67eYH_Zxdg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: Add initial support for
 BPI-CM4 module with BPI-CM4IO baseboard
To: Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_141210_003782_76DFEED6 
X-CRM114-Status: GOOD (  14.70  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTmVpbCwKCk9uIE1vbiwgTWFyIDYsIDIwMjMgYXQgOTozMeKAr0FNIE5laWwgQXJtc3Ryb25n
IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEFkZCBzdXBwb3J0IGZvciBi
b3RoIHRoZSBCYW5hbmFQaSBCUEktQ000IG1vZHVsZSBhbmQgdGhlIEJhbmFuYVBpCj4gYmFzZWJv
YXJkIHdoaWNoIGlzIGNvbW5wYXRpYmxlIHdpdGggdGhlIFJhc3BiZXJyeVBpIENNNElPIGJhc2Vi
b2FyZC4Kcy9jb21ucGF0aWJsZS9jb21wYXRpYmxlLwoKPgo+IFRoZSBCYW5hbmFQaSBCUEktQ000
IG1vZHVsZSBmb2xsb3dzIHRoZSBDTTQgc3BlY2lmaWNhdGlvbnMgYXQgWzFdLAo+IGJ1dCB3aXRo
IGEgc2luZ2xlIEhETUkgcG9ydCBhbmQgYSBzaW5jZSBEU0kgb3V0cHV0LgpzL3NpbmNlL3Npbmds
ZS8KCj4KPiBUaGUgY3VycmVudCBDTTRJTyBiYXNlYm9hcmQgRFQgc2hvdWxkIHdvcmsgZmluZSBv
biB0aGUgUmFzcGJlcnJ5IENNNAo+IGJhc2Vib2FyZCBhbmQgb3RoZXIgZGVyaXZhdGl2ZXMgYmFz
ZWJvYXJkcywgYnV0IHByb3BlciBEVCBzaG91bGQKPiBiZSB3cml0dGVuIGZvciBvdGhlciBiYXNl
Ym9hcmRzLgo+Cj4gVGhlIHNwbGl0IGlzIGRvbmUgc28gaXQncyBlYXN5IHRvIGRlc2NyaWJlIGEg
bmV3IENNNCBiYXNlYm9hcmQsIGVuYWJsaW5nCj4gb25seSB0aGUgbmVjZXNzYXJ5IEhXIHVzZWQg
b24gdGhlIGJhc2Vib2FyZC4KPgo+IFsxXSBodHRwczovL2RhdGFzaGVldHMucmFzcGJlcnJ5cGku
Y29tL2NtNGlvL2NtNGlvLWRhdGFzaGVldC5wZGYKPgo+IFRlc3RlZC1ieTogQ2hyaXN0aWFuIEhl
d2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBB
cm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+CldpdGggdGhlIHR5cG9zIGFib3Zl
IGZpeGVkOgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0
aW5nbEBnb29nbGVtYWlsLmNvbT4KClsuLi5dCj4gKyZleHRfbWRpbyB7Cj4gKyAgICAgICBleHRl
cm5hbF9waHk6IGV0aGVybmV0LXBoeUAwIHsKPiArICAgICAgICAgICAgICAgLyogUmVhbHRlayBS
VEw4MjExRiAoMHgwMDFjYzkxNikgKi8KPiArICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+ICsg
ICAgICAgICAgICAgICBtYXgtc3BlZWQgPSA8MTAwMD47Cj4gKwo+ICsgICAgICAgICAgICAgICBp
bnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvX2ludGM+Owo+ICsgICAgICAgICAgICAgICAvKiBNQUNf
SU5UUiBvbiBHUElPWl8xNCAqLwo+ICsgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDI2IElS
UV9UWVBFX0xFVkVMX0xPVz47Ckl0IHdvdWxkIGJlIGdyZWF0IHRvIGhhdmUgdGhlIHJlc2V0IEdQ
SU8gKEdQSU9aXzE1KSBkZXNjcmliZWQgYXMgd2VsbC4KQnV0IHRoaXMgY2FuIGJlIGRvbmUgaW4g
YSBmb2xsb3ctdXAgcGF0Y2guCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
