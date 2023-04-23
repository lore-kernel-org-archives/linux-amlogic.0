Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F0AC77B60
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 21:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ID7Cq911M0/SrEZ8gp0/2F70eLtwSeYR4NAckrwDGdA=; b=vVU/pRPWD32ket
	8Z9/jQP3zeo/MFH1TjuzJY7W4hafF75TE34zwR2l/Nda03nW+skYdpar348MAJf0qV/cfrclyTr0d
	cHGCt5pxVeHthr+dmWcKy7IHozWuEqhz707UqK6KsbHr5HMO+jwM0VayOlOr2VxIA+quv3Eqr5jWx
	A/ltDdCwKdoUIJkvOL7JcNFmMpuykSa/f1ruJfjsVxrdbnSmJfVRMbRzXL0pIPwhC/fF8UOHM16RO
	s26ACXRgJU+K0Fzn8wPSKSqs7HlB/I71WRS4LDvTu8DRSXWtV/xCbPnOmCy7sm4JVJx3E4T6CCPGb
	OKr0OxEjoCxJZQDCrr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqh0m-00Ekui-1z;
	Sun, 23 Apr 2023 21:12:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqh0j-00EkuH-18;
	Sun, 23 Apr 2023 21:12:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-94ed7e49541so524620966b.1;
        Sun, 23 Apr 2023 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682284359; x=1684876359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRKnMw4QG50vnSFwd6Sq3W6Jkn3ZJ2yur8UiF0FgUbM=;
        b=bQs61RS+BXawVW4hK2pXsIzqZif6LIir0t7z6rldZ2pSXl/J7TnR5PH81Xnrjs9rbS
         /l/LyNd7WQrQJrp0egB9ucSZ2q9xJj7TuYqO2XLs1UWnVN6Z1Pl/QRUvcYvYs6tCwKUI
         BtUL+eizagvmjUSMhrnTQXL+mVcYJRSJXaBW5XOlmqrs5Jbsnufir/3QgA5Ym9LjQaMp
         upZwDwTP5dXgWGq5CBi41Rit8LZx5+v1I+eanfKvTGhCdMOcmdRvmYnR4UYz0AMhD+ia
         y43NYxdUmugr+9kM0/w0W9YcrO3IgUYc4gaOjUXbNtgaQJM/nprXEPrC6xjvdBMrmyqC
         0GTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682284359; x=1684876359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRKnMw4QG50vnSFwd6Sq3W6Jkn3ZJ2yur8UiF0FgUbM=;
        b=JKDMXXyM2/HKKdRn5vlBk9HxvrQD0MfgQi+DegY0A8vaXumWeMCLjX2s5pP52n7Sir
         9jKLKS9Jznt4WQiRQrSTkVY0roA4GCljQIF/TENnVX9PsSm6q5Vu+MufRpoPClggcwpQ
         dftIYXfjul79fBAh/+PyRC8SUPUKn01ZsFOyLNKXGz8i/qSAsJ2z2df6VskOGO7ESsIF
         WiargqIRghXCVjAqZBosFwO1lcbHbqoCwIyZvcJLELena23zoyN76wfiePo5D/hqXc8n
         XsHvoy1bEAh6wnVeGFluNsPVr/ei55d9wtE6q/aircpMHGSKoUZsYdlOSTS07GndgRsS
         3aHg==
X-Gm-Message-State: AAQBX9eGXuHBqSCrjcgD/FKYkm9Ijka/DZEi060JvrB/56jrRdcGHPTQ
	AcFrcZbsHCZPn8yS9/qaZsWuxVj/unN1MPXWF/U=
X-Google-Smtp-Source: AKy350a5xYCoNTfH85jnfhrovh3KaFGyGvbTHqG+qrISXQKZrEMxqacX9V1s3QID4AJY4Rh6Ep1iATOzSQZQjOo9zEU=
X-Received: by 2002:a17:906:abd9:b0:94a:5d5c:fe6f with SMTP id
 kq25-20020a170906abd900b0094a5d5cfe6fmr8162781ejb.47.1682284358711; Sun, 23
 Apr 2023 14:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230405195927.13487-1-ddrokosov@sberdevices.ru> <20230405195927.13487-5-ddrokosov@sberdevices.ru>
In-Reply-To: <20230405195927.13487-5-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 23:12:27 +0200
Message-ID: <CAFBinCA3uZXzr3RgnWnKV5Qr-CPaZQX5joDg319i_cgzhLJy2g@mail.gmail.com>
Subject: Re: [PATCH v13 4/6] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	khilman@baylibre.com, jian.hu@amlogic.com, kernel@sberdevices.ru, 
	rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_141241_452422_76DD34CF 
X-CRM114-Status: GOOD (  16.20  )
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

SGVsbG8gRG1pdHJ5LAoKY3VycmVudGx5IEplcm9tZSBpcyBidXN5IHNvIEkgYW0gdHJ5aW5nIHRv
IGNvbnRpbnVlIHdoZXJlIGhlIGxlZnQgb2ZmLgpJIGhhdmUgZm9sbG93ZWQgdGhlIHByZXZpb3Vz
IGl0ZXJhdGlvbnMgYSBiaXQgYnV0IG1heSBoYXZlIG1pc3NlZCBzb21lCmRldGFpbHMuIFNvIGFw
b2xvZ2llcyBpZiBJJ20gcmVwZWF0aW5nIHNvbWUgcXVlc3Rpb25zIHRoYXQgSmVyb21lCnByZXZp
b3VzbHkgYXNrZWQuCgpPbiBXZWQsIEFwciA1LCAyMDIzIGF0IDk6NTnigK9QTSBEbWl0cnkgUm9r
b3NvdiA8ZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKWy4uLl0KPiArY29uZmlnIENP
TU1PTl9DTEtfQTFfUExMCj4gKyAgICAgICB0cmlzdGF0ZSAiTWVzb24gQTEgU29DIFBMTCBjb250
cm9sbGVyIHN1cHBvcnQiClNob3VsZCB0aGlzIGJlICJBbWxvZ2ljIEExIFNvQyBQTEwgY29udHJv
bGxlciBzdXBwb3J0Ij8KTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSAibWVzb24iIG5hbWUg
d2FzIGRyb3BwZWQgZm9yIHRoaXMKZ2VuZXJhdGlvbiBvZiBTb0NzLgoKWy4uLl0KPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYTFfcGxsX2Nsa2NfbWF0Y2hfdGFibGVbXSA9IHsK
PiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxhMS1wbGwtY2xrYyIsIH0sCj4gKyAg
ICAgICB7fSwKbml0LXBpY2s6IHBsZWFzZSBkcm9wIHRoZSBjb21tYSBhZnRlciB7fQpUaGlzIGVt
cHR5IGVudHJ5IGlzIGEgc2VudGluZWwsIG5vIG90aGVyIGVudHJpZXMgYXJlIHN1cHBvc2VkIHRv
IGNvbWUKYWZ0ZXIgdGhpcyAtIHNvIGEgdHJhaWxpbmcgY29tbWEgaXMgbm90IG5lY2Vzc2FyeS4K
ClsuLi5dCj4gKy8qIFBMTCByZWdpc3RlciBvZmZzZXQgKi8KPiArI2RlZmluZSBBTkFDVFJMX0ZJ
WFBMTF9DVFJMMCAgIDB4MAo+ICsjZGVmaW5lIEFOQUNUUkxfRklYUExMX0NUUkwxICAgMHg0Cj4g
KyNkZWZpbmUgQU5BQ1RSTF9GSVhQTExfU1RTICAgICAweDE0Cj4gKyNkZWZpbmUgQU5BQ1RSTF9I
SUZJUExMX0NUUkwwICAweGMwCj4gKyNkZWZpbmUgQU5BQ1RSTF9ISUZJUExMX0NUUkwxICAweGM0
Cj4gKyNkZWZpbmUgQU5BQ1RSTF9ISUZJUExMX0NUUkwyICAweGM4Cj4gKyNkZWZpbmUgQU5BQ1RS
TF9ISUZJUExMX0NUUkwzICAweGNjCj4gKyNkZWZpbmUgQU5BQ1RSTF9ISUZJUExMX0NUUkw0ICAw
eGQwCj4gKyNkZWZpbmUgQU5BQ1RSTF9ISUZJUExMX1NUUyAgICAweGQ0CkhlcmUgSSBoYXZlIGEg
cXVlc3Rpb24gdGhhdCB3aWxsIHBvdGVudGlhbGx5IGFmZmVjdCBwYXRjaCAzLzYKKCJkdC1iaW5k
aW5nczogY2xvY2s6IG1lc29uOiBhZGQgQTEgUExMIGNsb2NrIGNvbnRyb2xsZXIgYmluZGluZ3Mi
KS4KSW4gdGhlIGNvdmVyLWxldHRlciB5b3UgbWVudGlvbmVkIHRoYXQgcXVpdGUgYSBmZXcgY2xv
Y2tzIGhhdmUgYmVlbiBvbWl0dGVkLgpBbnkgZHQtYmluZGluZ3MgdGhhdCB3ZSBjcmVhdGUgbmVl
ZCB0byBiZSBzdGFibGUgZ29pbmcgZm9yd2FyZC4gVGhhdAptZWFuczogdGhlIGR0LWJpbmRpbmdz
IHdpbGwgYWx3YXlzIG5lZWQgdG8gZGVzY3JpYmUgd2hhdCB0aGUgaGFyZHdhcmUKaXMgY2FwYWJs
ZSBvZiwgbm90IHdoYXQgdGhlIGRyaXZlciBpbXBsZW1lbnRzLgpTbyBteSBxdWVzdGlvbiBpczog
ZG8gd2UgaGF2ZSBhbGwgbmVlZGVkIGlucHV0cyBkZXNjcmliZWQgaW4gdGhlCmR0LWJpbmRpbmdz
IChldmVuIHRob3VnaCB3ZSdyZSBvbWl0dGluZyBxdWl0ZSBhIGZldyByZWdpc3RlcnMgaGVyZQp0
aGF0IHdpbGwgb25seSBiZSBhZGRlZC91c2VkIGluIHRoZSBmdXR1cmUpPwpPbGRlciBTb0NzIHJl
cXVpcmUgKHRlbXBvcmFyaWx5KSB1c2luZyB0aGUgWFRBTCBjbG9jayBmb3IgQ1BVIGNsb2NrCnRy
ZWUgY2hhbmdlcy4gVG8gbWFrZSBhIGxvbmcgc3Rvcnkgc2hvcnQ6IEknbSB3b25kZXJpbmcgaWYg
LSBhdCBsZWFzdAotIHRoZSBYVEFMIGNsb2NrIGlucHV0IGlzIG1pc3NpbmcuCgpQUzogSSBkb24n
dCBoYXZlIGFuIEExIGRhdGFzaGVldCBub3IgYSB2ZW5kb3Iga2VybmVsIHNvdXJjZSAoYW5kIGV2
ZW4KbGVzcyBhIGJvYXJkIGZvciB0ZXN0aW5nKS4gU28gSSBjYW4ndCB2ZXJpZnkgYW55IG9mIHRo
aXMgbXlzZWxmIGFuZApJJ20gYXNraW5nIHF1ZXN0aW9ucyBpbnN0ZWFkLgoKCkJlc3QgcmVnYXJk
cywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
