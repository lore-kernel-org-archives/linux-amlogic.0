Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A563C4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2024 05:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eu9wDYiNcW+Y5/NN0HF6m7UsEfW2gRHgdu3RGcFCKmg=; b=h90GFhu1Y1s4I8
	WK76roztSDUl7s8RKFGfPFuvqgbXVx3fUjJDoXKPYEn2kK0xR9jtXFnH5hqaRXho8TQamvkWSgp2Y
	hHhXl/uvxsnaOcUXlWDph/9dI3r1MAVJEXCN+gOHzWuAC3wNe8EjQiuDXkqxtX62GEngJ4CwdMJVA
	9U4Sbg5gC9BovYxPohDnyPvoQHGG7YUCdM208QjfO/Id6NdH9CauJnx6NjPFcbPcBHuDtL83Nw45I
	FXP4Lz5p0SZpgX3XQyy5BUevlZFzN2zOWqb2NVMq+hPWssESEYQTTBa9P7jf3FL/AYZGkJV1u+cVW
	R583L92HPAk3POVBghZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1fra-000000058a4-1saz;
	Tue, 30 Apr 2024 05:17:10 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1frX-000000058Yx-0I8o
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Apr 2024 05:17:08 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6f28bb6d747so4476003b3a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2024 22:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714454223; x=1715059023; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V0avMUsDc59rYN7coX7sm9Yp5eSnR9Q04mgQzckQ9lw=;
        b=yKjIx7biRX3nxtBcDi+0F10fhXCANAy6UgTbomtwtwVSJ84UYkNNh9mDZ8gt7bs0F3
         NoXHIaDOfXoltRcg49s2X1VAxYymhxvD0L1sr6eksbhQSL/fXEemtDDhuOzg6HM6aP+d
         mxC9qebGwiFS+SGg5eyE+derAR1rU3ZyCPe2Cr6QY3XosnV3cCUfeIoCCB1JXUe/n7o7
         7PDo3PHSvzJi7aK+8Jaa24rL5iDMW8sSAwX+cOb0ybgXmVTxs+qO1HEaHZJR9kgj3AGe
         23yz+pEeStyyExbtcZS4psaEdN/sAbPmhDAym2lB0AdGLd1edxpjeR6Ren+FLFp8sZtL
         djyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714454223; x=1715059023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0avMUsDc59rYN7coX7sm9Yp5eSnR9Q04mgQzckQ9lw=;
        b=B6drsGmCywILMiovr8YQ7wUh7SKXvF81k3Sr84bLeaBk3Nvnvtt1Rl92vlj9k2A1Bt
         ngq3GWfOhP+z4V1cJLm4iCi1IWctW2dfenz4yPPflYKuVxphxUu6WvrGfKCIZ0xaUdnw
         BoxsOGpx0r93bGKut55/OL93ts2EvFszAkWL2f99zlFZz9+FJAj7fUYvSN3+whtSBXpJ
         STjM5GZ4FpO4fymMz6a1TLlMnduU8pxmOtNVjwwx2RrrFWucmy5LoRT1hvjtFSk5KUdx
         0lpa0wOaRMrnD5xTXZT8BvSSFghLcq68NrnyStw5IFzgH3bzhFLWNgV4SQB082DWQ8cQ
         zMJA==
X-Forwarded-Encrypted: i=1; AJvYcCUoVTUJz983UKKFjEumORP98HvY6ndtyn+DUK3MUAqcHmlSa7xHEe60PTNf3HYGKBKYFh5NEPnMCfMkfwk7jQI22HVyszwx5hXLFAIMq0pLIQc=
X-Gm-Message-State: AOJu0Yxd4+1mDVOoP33lAt0BJLV9weDfIk02Y2xUoyCMqJjtDnGTeqdQ
	akIcUIwOPBVYCIzn3WhVYYs2NuFkXJD2dBolHG4oQ5itkM0GeeHA/LeCxeNEaw==
X-Google-Smtp-Source: AGHT+IFWRZGQxckWXPNLxXAG7MGt/iJLdvfO4+V6xpas6sXD4xSC0z15Fh9sptvi1twg0sW4mfipRw==
X-Received: by 2002:a05:6a20:72a0:b0:1aa:59ff:5d31 with SMTP id o32-20020a056a2072a000b001aa59ff5d31mr14465799pzk.0.1714454223164;
        Mon, 29 Apr 2024 22:17:03 -0700 (PDT)
Received: from thinkpad ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id su11-20020a17090b534b00b002b27eb61901sm602961pjb.21.2024.04.29.22.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 22:17:02 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:46:53 +0530
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
Subject: Re: [PATCH v3 1/5] PCI: dra7xx: Add missing header inclusion
Message-ID: <20240430051653.GB3301@thinkpad>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429102510.2665280-2-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_221707_255032_5F1C1B37 
X-CRM114-Status: GOOD (  12.83  )
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

T24gTW9uLCBBcHIgMjksIDIwMjQgYXQgMDE6MjM6MThQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IERyaXZlciBpcyB1c2luZyBjaGFpbmVkX2lycV8qKCkgQVBJcywgYWRkIHRoZSBy
ZXNwZWN0aXZlIGluY2x1c2lvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBNYW5pdmFu
bmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgoKLSBNYW5p
Cgo+IC0tLQo+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktZHJhN3h4LmMgfCAxICsK
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1kcmE3eHguYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaS1kcmE3eHguYwo+IGluZGV4IGQyZDE3ZDM3ZDNlMC4uYjY3MDcxYTYzZjhhIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1kcmE3eHguYwo+ICsr
KyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1kcmE3eHguYwo+IEBAIC0xMyw2ICsx
Myw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVy
cnVwdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvaXJxLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pcnFj
aGlwL2NoYWluZWRfaXJxLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pcnFkb21haW4uaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gLS0g
Cj4gMi40My4wLnJjMS4xMzM2LmczNmI1MjU1YTAzYWMKPiAKCi0tIArgrq7grqPgrr/grrXgrqPg
r43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
