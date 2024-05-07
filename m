Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D133BC10F1A
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2024 08:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRAuQtuIv2phntEtDR1Fv7qQ+O/1YiZ2GC4fxfgXzCY=; b=cDmHpUGXRXECIl
	vixREZC315MOX5Bho2FSgG4jeuaV7ncos02AY++Q5kA2yCjJy3ns7S1l4XKsa0roGvXtBZjb0a68G
	QTwgbDXDwDImVOX+R1r9mhrdYn+feTRWKl+fnES2MRkyYZh2RTuii1c389wKhuiwUVxYTgraKkKRd
	6m4VThCAiRxRMu1oH/v+U3hGzxj4eVNt9A6bu/bGG6numFn+tHs7tLTUiSarLsmDtFLBjg5EpXYUW
	hNACHmUo+nZTpQtj8dQ6Gba9qvqaJXKMqoCIZeaM3WCCiBPLzDMBc11ym5MxRrwWCoTg2Dl+6Omdi
	VA0T2gMy5Xycvdn9T7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4GBs-0000000A8dt-01z4;
	Tue, 07 May 2024 08:28:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4GBp-0000000A8cY-0dEW
	for linux-amlogic@lists.infradead.org;
	Tue, 07 May 2024 08:28:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso19950695ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2024 01:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715070518; x=1715675318; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GVgauUSBhCFoJsX8lOkvxxApBqvEtasgyEBvsQiV6aQ=;
        b=pSzbXZgjtUAlCoZpwgzZ+nqH07DI3IlBjAGEaawjXpwOIBC4FPggtEjdP6HfcaowiM
         qW/3983hHlJZiD/Pgwt+7x1zAElfY8OKDKa69QQqwVtRZSZ1Cl2yYFFoTiT3Ts5Tuz1H
         yqt59yY3Zg50HS23l/GbGzjk0hzL5jBYjTS80jzqVdcUzTRb37Xj6kycCA1Q6+xi5cRn
         0htrA/Y5RN+ke4kPAN2Jhc1V+sWVwQNDmwv3LB4rKEec8wBtAAbp4dkWcnirHvUfLnt3
         auzYHgMYKh0T8PXbTvZRqeTSZrkAqecDCioQpsGJTJS69h23wWED84YHXatjzITQw5Qx
         DBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715070518; x=1715675318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVgauUSBhCFoJsX8lOkvxxApBqvEtasgyEBvsQiV6aQ=;
        b=nM26gOVIcH//DYmM83TsaM1i2TTDZfMtf/gGiJQ6LOfVmapcabYcHnyYe/sDbHCSJk
         jLd1FPkcW8u3qMx+V59J3BT3wAXo8LiqGazxUpDZb8u98LDU/weBiPNInoTkpWEQQeMN
         4uoPdSfCccNJGn12uustY4W3I5bB5ZCwmTWAsTgkJCpz3QGuqwgHJu+yNf8kpS9C6qtx
         ZsDRF9Tsl7H2E/+mYyRqb6K1oqcRngBCAjP8rFLjUCxG4aF45kGjPBQe4mckGlhjG8zu
         4K3XdMeG1ZLbvcSC11dg5bOY824+/fgfZRsVZJiyka9AYaxnlgMGE1+j0RLVNYOBzSbQ
         CGGg==
X-Forwarded-Encrypted: i=1; AJvYcCW6jJdJ0qFA3WhcXvtO8PCzvfhyRe5JEl0q9ZewJpEIxUcUnox0km8vxxnWsNzd7bHt6NCQW+/sySwCRu5TvedzxhvhpAmwBl2zt2OWoSTRdqs=
X-Gm-Message-State: AOJu0Ywdf+AW9PijTAAh4A7iy919pJsjC63slTbVlxT2BQTVpEWNd+J8
	lXzGyRmf7KwAxDHiMybsKCz34s5oyDCTZEsPc/5Vymotz8E8PWFcsJbrmON3/g==
X-Google-Smtp-Source: AGHT+IFkZxsg9zZ8uGCj6F9b96ztkp16VI7pxyk7k4qDQRuZ3fJBvMiqX1TfN7jL1VUt3SzWbyr1LA==
X-Received: by 2002:a17:902:ce8a:b0:1e4:9ad5:a666 with SMTP id f10-20020a170902ce8a00b001e49ad5a666mr15845336plg.25.1715070517573;
        Tue, 07 May 2024 01:28:37 -0700 (PDT)
Received: from thinkpad ([117.213.100.197])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001ec4ed47ddesm9603688plb.86.2024.05.07.01.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 01:28:37 -0700 (PDT)
Date: Tue, 7 May 2024 13:58:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>,
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
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
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
Subject: Re: [PATCH v3 4/5] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <20240507082822.GA6659@thinkpad>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
 <20240507081441.GA6025@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507081441.GA6025@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_012845_342420_5917E617 
X-CRM114-Status: GOOD (  21.58  )
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

T24gVHVlLCBNYXkgMDcsIDIwMjQgYXQgMDE6NDQ6NTZQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDA2LCAyMDI0IGF0IDAyOjEwOjI0UE0gKzAyMDAs
IExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiBPbiBNb24sIEFwciAyOSwgMjAyNCBhdCAxMjoyNeKA
r1BNIEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNv
bT4gd3JvdGU6Cj4gPiAKPiA+ID4gVGhlIG9mX2dwaW8uaCBpcyBnb2luZyB0byBiZSByZW1vdmVk
LiBJbiBwcmVwYXJhdGlvbiBvZiB0aGF0IGNvbnZlcnQKPiA+ID4gdGhlIGRyaXZlciB0byB0aGUg
YWdub3N0aWMgQVBJLgo+ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNp
dmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4KPiA+ID4gUmV2aWV3ZWQtYnk6
IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNo
ZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPiA+IAo+ID4gSSB0
aGluayB0aGVyZSBpcyBhIGJ1ZyBoZXJlLCB0aGUgY29kZSBpcyByZXNwZWN0aW5nIHRoZSBPRiBw
cm9wZXJ0eQo+ID4gInJlc2V0LWdwaW8tYWN0aXZlLWhpZ2giCj4gPiBidXQgdGhlIGNvZGUgaW4g
ZHJpdmVycy9ncGlvL2dwaW9saWItb2YuaCBhY3R1YWxseSBoYXMgYSBxdWlyayBmb3IKPiA+IHRo
aXMgc28geW91IGNhbiBqdXN0Cj4gPiBkZWxldGUgYWxsIHRoZSBhY3RpdmUgaGlnaCBoYW5kbGlu
ZyBhbmQgcmVseSBvbiAxID0gYXNzZXJ0ZWQgYW5kIDAgPQo+ID4gZGVhc3NlcnRlZCB3aGVuCj4g
PiB1c2luZyBHUElPIGRlc2NyaXB0b3JzLgo+ID4gCj4gCj4gV293Li4uCj4gCj4gU28gdGhpcyBi
dWcgaXMgcHJlc2VudCBldmVuIGJlZm9yZSB0aGlzIHNlcmllcywgcmlnaHQ/Cj4gCj4gPiBKdXN0
IGRlbGV0ZSB0aGlzIHRoaW5nOgo+ID4gaW14Nl9wY2llLT5ncGlvX2FjdGl2ZV9oaWdoID0gb2Zf
cHJvcGVydHlfcmVhZF9ib29sKG5vZGUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInJlc2V0LWdwaW8tYWN0aXZlLWhpZ2giKTsKPiAKPiBCdXQgdGhpcyBp
cyBqdXN0IGEgYmFuZGFpZCBJTU8uIFRoZSBmbGFnIGZvciB0aGUgUEVSU1QjIEdQSU8gc2hvdWxk
IGJlIHByb3Blcmx5Cj4gc2V0IGluIHRoZSBib2FyZCBkdHMgYXMgcGVyIHRoZSBib2FyZCBkZXNp
Z24uCj4gCgpIbW0sIG5vLiBJIHdhcyBjb25mdXNlZCBieSB0aGUgcHJvcGVydHkuIEJ1dCB0aGlz
IHF1aXJrIGluIGdwaW9saWItb2YuYyBpcyBnb2luZwp0byBiZSBhcHBsaWVkIHdoaWxlIGNoYW5n
aW5nIHRoZSBHUElPIHN0YXRlIGFsc28gb3IganVzdCBkdXJpbmcgcmVxdWVzdCB0aW1lPwoKLSBN
YW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCu
ruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
