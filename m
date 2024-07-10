Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CA9C3DA41
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2d/YhKFcdCCR66D7093cTk0v5OfTbjU6s7K5prOUEAc=; b=nd2hjJ/lwkw/05
	iP5r2GZcDTEY7/vZ3b+Y/LGf2qgLx9mgwy0cX7JE/1kFLTTYIar5gAJv3+CDE641uPMzC2EOShPQh
	kE0TNVeDbP+o5NInViFaaTXGT1jTbOJjtMLzq2BzpEcEwztLY5lFH6qBALBMinH7I82Vm6TsyELIa
	qag9H4Tz1n77EmpRxZyTMzE1R8BqErLm+My5EBuddo18oj07wJfWx5jUSQKAZRVj3ta7TVCTQg6Mz
	m36vyhVaHBkhNiV7d8lpb7a9pW7k6jlLEDuyQHt7AC6KVTXixYT271KXWz2wTXnvLep8LGJSuQg7I
	cW4l7qRfWyF75VUqJnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRaZd-0000000BET8-3KNd;
	Wed, 10 Jul 2024 16:53:45 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRaZa-0000000BESE-3evC;
	Wed, 10 Jul 2024 16:53:44 +0000
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea5dc3c79so8505689e87.1;
        Wed, 10 Jul 2024 09:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720630419; x=1721235219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpiULvgBKLSjZABIaTgqmq90IKC/N4ETs7/rDViqHSU=;
        b=gD8/UQI70RlS3/qBF8UdEfE/ycDbkQl2qmKjVHMO5RvomsdTnl6ZuECQccsxq9d9ZV
         bKG5HPXMtr09y0h2dEuzqVrDkgWxDDxWyIodUQQ69S30KZUC/GzdjtUaY3wCAazbCI5j
         5d1gNpwuw+7ct3sfFHYXhyapLPDbbDYvjjwIAxi7uJcfSP+jGMLqSWmAn6F2qy3MnWis
         flbTzQEmUxAHLvFmQhCWNN6/J1GdUz6sl5uMkWmmXhbfgseHy6VK6uX45jEOBi7jojPk
         eoaXK2xKcu2XcSNICwy0x3yQDUDmqtAbu5GRU26UXUONG1JSnj1sAzgQDpPE0LZBgjN6
         42Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVPjHVln5wJlo/kn0y/EneZ0ThsxS4VGlMT0rJl1HfdgkWkqI8GEYr7FbG0m/rPI0MBfRxuUMEfvUC78U1QpkoxP6XY9fGyM2eL7Rw+8eC0FZEr1FJ2nk9/2sJnpSIqKTpLNDrRjQa5MS8xbziDKY+DtM5Jk8sMoQ==
X-Gm-Message-State: AOJu0YzQMJvp1hWFN0nOWh3j3whLvI1FX+sxe1oUPhpdWuN1r4RVa7u0
	Z05GNHQ2nznPZ6yoUS3WLeBfsZ/ka+AXqavUX8B35i1rjEV8vMUl0fhIk7hPeV0=
X-Google-Smtp-Source: AGHT+IHOxtvONVZ6XSgaP5sfMBRwEmkjSZR9a8QQ39Fcehh2UbCMcYD00saiUPBJ1Rx2cI8rxbrLZA==
X-Received: by 2002:a05:6512:31cb:b0:52c:df9b:cf1a with SMTP id 2adb3069b0e04-52eb99d6e12mr4701744e87.66.1720630419228;
        Wed, 10 Jul 2024 09:53:39 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ebe0d48aasm406342e87.179.2024.07.10.09.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 09:53:38 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so32466951fa.0;
        Wed, 10 Jul 2024 09:53:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiuz643+YOJz4HyEypn8v+5Me5T/bUEN30tf1ze1zcsQJ5DEkn0BafLfIS3GZAKdBGL1PIQMikGo7SS8eQOx8eUdWAH3eorF9S9n4NMeRNXpUB61cMWYOt7T5e/ljOMd2cb1OpuP9j5/+KJfIQYHvB6A7c16Lnrg==
X-Received: by 2002:a2e:9016:0:b0:2ee:7a3e:4721 with SMTP id
 38308e7fff4ca-2eeb318a3b2mr39735341fa.39.1720630418140; Wed, 10 Jul 2024
 09:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com> <20240703121750.0dc2eb3a@donnerap.manchester.arm.com>
In-Reply-To: <20240703121750.0dc2eb3a@donnerap.manchester.arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 11 Jul 2024 00:53:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66ox-vu2T=CnBkV70k5E=aVBGm6Sg4pcK5kYB+t9uSvxA@mail.gmail.com>
Message-ID: <CAGb2v66ox-vu2T=CnBkV70k5E=aVBGm6Sg4pcK5kYB+t9uSvxA@mail.gmail.com>
Subject: Re: [PATCH 09/10] clk: sunxi-ng r40: Constify struct regmap_config
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_095342_933375_F8DFD22D 
X-CRM114-Status: GOOD (  19.51  )
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

T24gV2VkLCBKdWwgMywgMjAyNCBhdCA3OjE54oCvUE0gQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnBy
enl3YXJhQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCAwMyBKdWwgMjAyNCAxMTo1MDoyMiAr
MDIwMAo+IEphdmllciBDYXJyYXNjbyA8amF2aWVyLmNhcnJhc2NvLmNydXpAZ21haWwuY29tPiB3
cm90ZToKPgo+ID4gYHN1bjhpX3I0MF9jY3VfcmVnbWFwX2NvbmZpZ2AgaXMgbm90IG1vZGlmaWVk
IGFuZCBjYW4gYmUgZGVjbGFyZWQgYXMKPiA+IGNvbnN0IHRvIG1vdmUgaXRzIGRhdGEgdG8gYSBy
ZWFkLW9ubHkgc2VjdGlvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgQ2FycmFzY28g
PGphdmllci5jYXJyYXNjby5jcnV6QGdtYWlsLmNvbT4KPgo+IExvb2tzIGFscmlnaHQsIHdlIGlu
ZGVlZCBkb24ndCBjaGFuZ2UgaXQsIGFuZCB0aGUgb25seSB1c2VyIHRha2VzIGEgY29uc3QKPiBw
b2ludGVyLiBBbHNvIHRoZSBjb21waWxlciBzZWVtcyBoYXBweS4KPgo+IFJldmlld2VkLWJ5OiBB
bmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KCkFja2VkLWJ5OiBDaGVuLVl1
IFRzYWkgPHdlbnNAY3NpZS5vcmc+CgpTdGVwaGVuLCBjYW4geW91IG1lcmdlIHRoaXMgb25lIGRp
cmVjdGx5PyBJdCBkb2Vzbid0IGxvb2sgbGlrZSB3ZSdsbApoYXZlIGFueSBtb3JlIHN0dWZmIHRv
IHNlbmQgZm9yIHRoaXMgY3ljbGUuCgpDaGVuWXUKCgo+IENoZWVycywKPiBBbmRyZQo+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuOGktcjQwLmMgfCAyICstCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdS1zdW44aS1yNDAuYyBiL2RyaXZlcnMv
Y2xrL3N1bnhpLW5nL2NjdS1zdW44aS1yNDAuYwo+ID4gaW5kZXggOTg0YWQzZjc2YjE4Li4yZjUx
Y2VhYjgwMTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuOGkt
cjQwLmMKPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdS1zdW44aS1yNDAuYwo+ID4g
QEAgLTEyOTIsNyArMTI5Miw3IEBAIHN0YXRpYyBib29sIHN1bjhpX3I0MF9jY3VfcmVnbWFwX2Fj
Y2Vzc2libGVfcmVnKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICAgICAgIHJldHVybiBmYWxzZTsK
PiA+ICB9Cj4gPgo+ID4gLXN0YXRpYyBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBzdW44aV9yNDBfY2N1
X3JlZ21hcF9jb25maWcgPSB7Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmln
IHN1bjhpX3I0MF9jY3VfcmVnbWFwX2NvbmZpZyA9IHsKPiA+ICAgICAgIC5yZWdfYml0cyAgICAg
ICA9IDMyLAo+ID4gICAgICAgLnZhbF9iaXRzICAgICAgID0gMzIsCj4gPiAgICAgICAucmVnX3N0
cmlkZSAgICAgPSA0LAo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
