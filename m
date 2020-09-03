Return-Path: <SRS0=B1XO=CM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CB8C433E7
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 05:39:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 154842071B
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 05:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XMJc8t1b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 154842071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9/nawTzOFkyuennCWqg0/skx1Jd5/TkQactFLH3KvjA=; b=XMJc8t1bc3WMC4RQxGZC6ytWY
	+jhO3/BgGiPS1BPObetSWTQYWgAyr4j9x5gCWaM4oezezPONBJ3kfmHqfKXe0vLi3ErCKW0Duo2+a
	9cRWm3mQ2r3Nr3qh0sADHdflnTcseUSFj/DEk3B9bBAzdz2RalETO27AYVcOV2r2paVtJevYj6h1X
	6YaSDxU3AsTIU53L72zbDKtXpkG4d5DlmytnU9WxGL8b4G3pK63A4TGhO2WFqPd1aogclr2CfPTGJ
	BdTex6MhGRR2jc9Tw5JeUM0b6VjPdR9QA/WyMH1hbcf08GYOkOdT6gphGUwg+GB+ZallC638GHfic
	1M8QtcwOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhxr-000159-OU; Thu, 03 Sep 2020 05:39:15 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDhxn-00013s-Uv; Thu, 03 Sep 2020 05:39:12 +0000
Received: by mail-wr1-f68.google.com with SMTP id o5so1666218wrn.13;
 Wed, 02 Sep 2020 22:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=cjA1SpxFdTarFmkqi5x6o7EpaRfJ1ZdEWfLV8+qCoTw=;
 b=d7wNueUsxP/GHGfd36AllWrZ0aTD3F3qZBRTf5XxzaA4hz0i5gaXMll30Mo3w0wigy
 brbU9RZzHcA0m/kVqJibBFAPdIVLZmFkELiA4WkURVddUOx9OW6yPczgrPgiVQNZE2/Z
 u6HyFC3JAcIPm6OZOJWtEEtxhlFHTePt+ORrlI5YypIYjEX4GYQCuoDI7/mKhC3sEHkT
 XQ6cEVjHsozeebUejpUr59gmZP30zOHKtH77psa1EkooUFU17OH0RQs9qopggUau401g
 pY/Lptm/bJU0BoB6Eo1+ZgM0tpqXfNWDIiAPBE/YNYl6UvkkPGL5lt0YGzYy23TaA2Fj
 DgUA==
X-Gm-Message-State: AOAM533Lsi6VfmSe65XPx6gopTsZuKvSGrG3KGol2az08VSlKuVp0iaa
 +Prqe0Rq1a3wm96akPiw9x4=
X-Google-Smtp-Source: ABdhPJzzxouJj0AiVAoYVXd6GYxpjH3humJ0K6tdJJ+HM3g/hLmKJVkO4jJwfiALZiApJbZ3FqXwiw==
X-Received: by 2002:a5d:540a:: with SMTP id g10mr377991wrv.138.1599111550768; 
 Wed, 02 Sep 2020 22:39:10 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id q8sm2590564wrx.79.2020.09.02.22.39.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Sep 2020 22:39:09 -0700 (PDT)
Date: Thu, 3 Sep 2020 07:39:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWljaGHFgsKgTWlyb3PFgmF3?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 11/11] mmc: host: Enable compile testing of multiple
 drivers
Message-ID: <20200903053905.GA14577@kozik-lap>
References: <20200902193658.20539-1-krzk@kernel.org>
 <20200902193658.20539-12-krzk@kernel.org>
 <20200902213227.GE1624@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902213227.GE1624@qmqm.qmqm.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_013912_056377_1FDA12B3 
X-CRM114-Status: GOOD (  14.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Scott Branden <sbranden@broadcom.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMDIsIDIwMjAgYXQgMTE6MzI6MjdQTSArMDIwMCwgTWljaGHFgsKgTWlyb3PF
gmF3IHdyb3RlOgo+IE9uIFdlZCwgU2VwIDAyLCAyMDIwIGF0IDA5OjM2OjU4UE0gKzAyMDAsIEty
enlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBNdWx0aXBsZSBNTUMgaG9zdCBjb250cm9sbGVy
IGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgYXMgdGhleSBkbyBub3QKPiA+IGRlcGVuZCBv
biBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgaGVhZGVycy4KPiBbLi4uXQo+ID4gLS0tIGEvZHJpdmVy
cy9tbWMvaG9zdC9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L0tjb25maWcKPiA+
IEBAIC0xNzgsNyArMTc4LDcgQEAgY29uZmlnIE1NQ19TREhDSV9PRl9BVDkxCj4gWy4uLl0KPiA+
ICBjb25maWcgTU1DX01FU09OX0dYCj4gPiAgCXRyaXN0YXRlICJBbWxvZ2ljIFM5MDUvR1gqL0FY
RyBTRC9NTUMgSG9zdCBDb250cm9sbGVyIHN1cHBvcnQiCj4gPiAtCWRlcGVuZHMgb24gQVJDSF9N
RVNPTiAmJiBNTUMKPiA+ICsJZGVwZW5kcyBvbiBNTUMKPiA+ICsJZGVwZW5kcyBvbiBBUkNIX01F
U09OfHwgQ09NUElMRV9URVNUCj4gWy4uLl0KPiA+ICBjb25maWcgTU1DX01PWEFSVAo+ID4gIAl0
cmlzdGF0ZSAiTU9YQVJUIFNEL01NQyBIb3N0IENvbnRyb2xsZXIgc3VwcG9ydCIKPiA+IC0JZGVw
ZW5kcyBvbiBBUkNIX01PWEFSVCAmJiBNTUMKPiA+ICsJZGVwZW5kcyBvbiBNTUMKPiA+ICsJZGVw
ZW5kcyBvbiBBUkNIX01PWEFSVCB8fCBDT01QSUxFX1RFU1QKPiBbLi4uXQo+IAo+IFlvdSBjYW4g
ZHJvcCAnTU1DJyBmcm9tIGRlcGVuZHMgYXMgdGhlIHdob2xlIHRyZWUgaXMgdW5kZXIgJ2lmIE1N
QycgYWxyZWFkeS4KClJpZ2h0LCB0aGFua3MgZm9yIGZlZWRiYWNrLgoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
