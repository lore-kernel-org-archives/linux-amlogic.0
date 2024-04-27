Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8A1C4345F
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2024 06:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2aZCAm4xcGCRGLSqEKBxNRBd/iOyrGUWqtLW3KtNcw=; b=utr16o0IY9av3p
	D7HWYLUOJXxFsG/zyb2dvClq8HNsLLSVu5TfWz6l2zHCZZZRBouHD3zu6nnElrxOdp9qZKfVN/cH6
	ncE+d8t5+xZwtfuXDIGkkSIGaHWSJNHiPO3phmuydeTEyA5M71j15pzJwEp7XmFH6jiFb3M133+5Q
	VCj1jg+9MdLINAmXOkZt0HAlQxbND0kvwhEDdKiv9vN78Ox5MZ2vmlBMSc32LMUZ2ACxhTcnB7LT/
	akYERBNsLS0XJkYkVP8w+z/tKJsTNXjMIKj5D80EUcI9hkHDIyjCbCVydGLqjSsFhtTgmi6run858
	qs+a4SVqm7eQ91e1pfTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0bi8-0000000EyZ7-0rIc;
	Sat, 27 Apr 2024 06:39:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0bi4-0000000EyXN-2oyG
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Apr 2024 06:38:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6effe9c852eso2613778b3a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 23:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714199930; x=1714804730; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5BZd/9PlqkZZUs68lDdFcJ5CEc1B68syvKugYGnzVE=;
        b=lZ4rj1dD2zkQMFvcyz0j8WV8a6Xqbj19Ez522zoI1EkmNuPA0AZah/Rr84fQBglVJP
         WH9cs6Et8ds4dtvEfYtKjg4DHZxAFMR+8Zoz5tB6PJi91vzMb6DnbNq5HHU68uXIhxhp
         83kGPN+SVxK/kuSmdupzkAylA/QO5xLXbla6o51+TBzbubHK50q7vFEspCrKW4BwifvN
         VB3pPOIr6TKHF7eLzx8Pt/0QT5U4YugDg+BAvv4ZDcW9ODtKlTLbPocBSwxQ4ZUZRPUj
         6ajs+YzZ3rtI8VNXHXV7AP4qfPMQrmcsI+D7DB5aV1nzWgoy4M5lN4cQ5XRsc6CFNW3N
         uyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714199930; x=1714804730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5BZd/9PlqkZZUs68lDdFcJ5CEc1B68syvKugYGnzVE=;
        b=gP6sC0QTFchL0Fb8CKWWvZy+de0AI2/ah/7eKABolkWf/kFpbAxNcWzHcZGkYPrQ/z
         jYZUsel7U0/6SbhC5DsWdXrk8j+OWs47SuJkWtB1Mmwjjw78U9SB5d6r235Vs9AxJerf
         XxPW3iW2xkasgJoh5iITU7AEHJfd0trNyEISIkzavn18u/HBcCUGIsuncGCVnsX7oRWF
         nv4TSHIgx6W4ROAkKVA3PcXVpv9npjzl8rJ50ChBJjZL3JC15ado6cH/Vh2e8JPFmOJ+
         83Fl6bDzUkghlir8Lq1DclhTenFWn2OLwRS9E90PXWO0TVwLmq/RK1GyizCylV3XN258
         QpsA==
X-Forwarded-Encrypted: i=1; AJvYcCWSYleOLjcpvTwNK9JzlnlCHhDVZ+qtKlmihryf5lX1X2gHmoO4mGH0qHAjo1cQbjhb7UhYq3tC5+WML9qMF6u/HBjFqm35A6azx9vJTbw2jyE=
X-Gm-Message-State: AOJu0YxMiHzqXQKsZE5PMRc3M9Vq0zA2mf2BpoL2MB+gHy7qROG6l/Fw
	XIIf4go+a8xlewMKyfcsOzmyF9FhciV+OnbqLqFCFSN4S8vKKKaJxPzQTEV3jw==
X-Google-Smtp-Source: AGHT+IFOTwYBRJQ6hpSLIlWNvowiugvVRk7RGAo5g37wQTTmlbJt9WKRQxSRhuQmeF2kLwvwvDKZ0g==
X-Received: by 2002:a05:6a20:f394:b0:1a3:55d2:1489 with SMTP id qr20-20020a056a20f39400b001a355d21489mr4790412pzb.7.1714199930233;
        Fri, 26 Apr 2024 23:38:50 -0700 (PDT)
Received: from thinkpad ([120.60.53.237])
        by smtp.gmail.com with ESMTPSA id r18-20020aa79892000000b006ed0c9751d0sm16232311pfl.98.2024.04.26.23.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 23:38:49 -0700 (PDT)
Date: Sat, 27 Apr 2024 12:08:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v2 1/4] PCI: aardvark: Remove unused of_gpio.h
Message-ID: <20240427063832.GA1981@thinkpad>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423172208.2723892-2-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_233856_766324_02CCA0F9 
X-CRM114-Status: GOOD (  13.77  )
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

T24gVHVlLCBBcHIgMjMsIDIwMjQgYXQgMDg6MTk6MDRQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IG9mX2dwaW8uaCBpcyBkZXByZWNhdGVkIGFuZCBzdWJqZWN0IHRvIHJlbW92ZS4K
PiBUaGUgZHJpdmVyIGRvZXNuJ3QgdXNlIGl0LCBzaW1wbHkgcmVtb3ZlIHRoZSB1bnVzZWQgaGVh
ZGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8
bWFuaXZhbm5hbi5zYWRoYXNpdmFtQGxpbmFyby5vcmc+CgotIE1hbmkKCj4gLS0tCj4gIGRyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvcGNpLWFhcmR2YXJrLmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2ktYWFyZHZhcmsuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLWFhcmR2YXJrLmMKPiBp
bmRleCA3MWVjZDdkZGNjOGEuLjhiM2UxYTA3OWNmMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL3BjaS1hYXJkdmFyay5jCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9wY2ktYWFyZHZhcmsuYwo+IEBAIC0yMyw3ICsyMyw2IEBACj4gICNpbmNsdWRlIDxsaW51eC9w
bGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21zaS5oPgo+ICAjaW5jbHVkZSA8
bGludXgvb2ZfYWRkcmVzcy5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPgo+ICAjaW5j
bHVkZSA8bGludXgvb2ZfcGNpLmg+Cj4gIAo+ICAjaW5jbHVkZSAiLi4vcGNpLmgiCj4gLS0gCj4g
Mi40My4wLnJjMS4xMzM2LmczNmI1MjU1YTAzYWMKPiAKCi0tIArgrq7grqPgrr/grrXgrqPgr43g
rqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
