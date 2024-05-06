Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D66C10F16
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 May 2024 12:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzEUmI+ybQMfW8izTOHiKIJzs5ESp849xNOEOflg5/U=; b=COWoa+MOT8PgNz
	cD0PSSihIYKlhKT5r86QVD7uolYD9FPR7f4BYCm92O0mzJ5ED40JBgj0ZPg1xlAxiVh/GCf0ymhgk
	McDfLtvQAINs+59fQUHNvY1uEZ1vPwZEyEG4TdjW4gJ8GsUQTK67P2kQnc7SKOfcVsn0RaNx+v7R/
	DhjwzxG+jWEgYW9mx+5A9fweon/kNaUI7AAENvQjUg3GmZ9U+n5N2xgfh5FuyRqJU9c5k/KtDuo3a
	xEi5i6+xBKJ7O2xrAbxgZoMyQ0N8k9MYF2qnEwjVtmzDWIxbzyrMW8XmjiahV/Q453xykAxVuHHd+
	aiwP2y61PzSFpoeLTTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xQ1-00000007H6k-3iwW;
	Mon, 06 May 2024 12:26:09 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xPy-00000007H5D-1Ego;
	Mon, 06 May 2024 12:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714998366; x=1746534366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yim39yRqN4bdpfi/yZPkyOfIHeiJsr3OoFhecZ7dSX8=;
  b=ZCvgzkq2FrVYthP2jVKlAfB01bIBcwCDZcUWMke/J9PPTn6+3MnqV9hO
   zeBEoBCM0LvLVsocgxvSzx3CDR4P2JtEbBazL/Hu0RqutrTH1wrMKQyat
   anxDzndHigUmTiiaYQCx59a0PWm6Hx36Vt1qVeZJwsUZ5CeBEIP4hkYxS
   Q9aV/IKi2P7es8Rtx7aqWAyW4vS53IQYbkrR4dB9RHDefxmY39wVtNNGR
   pBR2ikBAjU2vDERWBgVHryGU0LBr4SOreplQKoQ8ICLlfu9iN5oVILQvg
   kZaitMf1A+RPr5OC9/mOM/l7YePioDeTqMU7yGU/2VWcObQTUQL7gvRhp
   w==;
X-CSE-ConnectionGUID: k0dzYja9QsSzFjtMBztkqg==
X-CSE-MsgGUID: KQqWU0kySM2DGK9UIDZWSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21352634"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="21352634"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 05:26:05 -0700
X-CSE-ConnectionGUID: i/6U48ZHSka9s8R3PJyNXw==
X-CSE-MsgGUID: UQissWGdTaOeNacEhtYQ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28116539"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 05:25:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s3xPl-00000004gZr-3aNZ;
	Mon, 06 May 2024 15:25:53 +0300
Date: Mon, 6 May 2024 15:25:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
Message-ID: <ZjjMUSj3cZTI56wE@smile.fi.intel.com>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
 <20240429102510.2665280-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZUsA034L5GjF_-XELX9369PwNjONfsDV-_EC564R0QWg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_052606_369915_43CF6374 
X-CRM114-Status: GOOD (  16.13  )
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

T24gTW9uLCBNYXkgMDYsIDIwMjQgYXQgMDI6MTA6MjRQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBNb24sIEFwciAyOSwgMjAyNCBhdCAxMjoyNeKAr1BNIEFuZHkgU2hldmNoZW5r
bwo+IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gVGhl
IG9mX2dwaW8uaCBpcyBnb2luZyB0byBiZSByZW1vdmVkLiBJbiBwcmVwYXJhdGlvbiBvZiB0aGF0
IGNvbnZlcnQKPiA+IHRoZSBkcml2ZXIgdG8gdGhlIGFnbm9zdGljIEFQSS4KPiA+Cj4gPiBSZXZp
ZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGlu
YXJvLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiA+
IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXgu
aW50ZWwuY29tPgo+IAo+IEkgdGhpbmsgdGhlcmUgaXMgYSBidWcgaGVyZSwgdGhlIGNvZGUgaXMg
cmVzcGVjdGluZyB0aGUgT0YgcHJvcGVydHkKPiAicmVzZXQtZ3Bpby1hY3RpdmUtaGlnaCIKPiBi
dXQgdGhlIGNvZGUgaW4gZHJpdmVycy9ncGlvL2dwaW9saWItb2YuaCBhY3R1YWxseSBoYXMgYSBx
dWlyayBmb3IKPiB0aGlzIHNvIHlvdSBjYW4ganVzdAo+IGRlbGV0ZSBhbGwgdGhlIGFjdGl2ZSBo
aWdoIGhhbmRsaW5nIGFuZCByZWx5IG9uIDEgPSBhc3NlcnRlZCBhbmQgMCA9Cj4gZGVhc3NlcnRl
ZCB3aGVuCj4gdXNpbmcgR1BJTyBkZXNjcmlwdG9ycy4KPiAKPiBKdXN0IGRlbGV0ZSB0aGlzIHRo
aW5nOgo+IGlteDZfcGNpZS0+Z3Bpb19hY3RpdmVfaGlnaCA9IG9mX3Byb3BlcnR5X3JlYWRfYm9v
bChub2RlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicmVz
ZXQtZ3Bpby1hY3RpdmUtaGlnaCIpOwoKR29vZCBjYXRjaCEgVGhhbmsgeW91LCBJJ2xsIHVwZGF0
ZSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLiBDYW4geW91IHJldmlldwp0aGUgcmVzdCBtZWFud2hp
bGU/CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
