Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9D6C25B79
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 May 2024 13:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOS2pj2Oq5COyqrwv9FeiO278xOzckeHPPrXTrBPYT4=; b=yR1gvIT3QgD2C0
	ts1zOLPdypYVM+b70fhkuIDXJMkeNDZFVYSW2Dfl8Z6St6G4ExxPgqQVpsLhSTrIIkkopfrYC6lpk
	B8s4kabThazyZwVdl4axDjsk7CBcOIKJQrdubVQJ8XipB9oVIFkN6s3gSD1SmjB7nda320fgQKUro
	rmRW41Mqri2U7RqJaIsNIVqw4NTNmefCJ/YvdQRWRVxDBzrIDAsbI0ny1KdYl09JAIOVCzdD6gFZ2
	bGtQLFpYvjr3qeWSWo5OurOQTbrJ52qBpqaVuCmzLFyaOYnvY2gaD/YoLSNJmT5NCwNpQASXfYoLM
	c8dfYooS1vZvdxNVXnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7xlC-00000007y8M-2WxH;
	Fri, 17 May 2024 13:36:34 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7xl8-00000007y7J-1XIb;
	Fri, 17 May 2024 13:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715952991; x=1747488991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Jn7zwgtw8zPXbp3XlrdrrybXQAtHJe4Qo6Tf/v8KOUU=;
  b=Z6nUtsfERsjVlv7IyBMavDzvVd045wNyoifPLW0qQ0VLzU95yNJRS1Ra
   25W39pqWcCv73zZSZ4D+iBhFis5ti5NNItlabmYMrfBtwSAceGInFXMXD
   uFEVXqY1RW1weckvEX3I7n7afTERwWGKFWySqPQKa32phf07AABsn0d30
   7oqwudt5kMMvQzkVm01P9e1dzYiuYch7qef77pL36XZYyWvrUXl2pr8ia
   JyUtA3m69acfimJNbbafhIroyRo55firKWGCq2qIK9kz4boFGON1sFNdf
   mlfXZoWTVfjOjWFl0PLkz2M5r8l5+Cn+Bo3c6G4UetjqUwJgytjz6LztZ
   A==;
X-CSE-ConnectionGUID: b9G8hjysQZe0GfgY5lZCKg==
X-CSE-MsgGUID: /QBPpJlBQCm35jv4SsKXZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15956640"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="15956640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 06:36:26 -0700
X-CSE-ConnectionGUID: hv+jf/nYRMKp252TDzhWlA==
X-CSE-MsgGUID: rHPZ9NOjRN2blqqMK8l1iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="55005642"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 06:36:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s7xks-00000008Lkv-21yz;
	Fri, 17 May 2024 16:36:14 +0300
Date: Fri, 17 May 2024 16:36:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
Message-ID: <ZkddTpyC177ZGoMH@smile.fi.intel.com>
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
 <20240517102234.GA333779@rocinante>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517102234.GA333779@rocinante>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_063630_473955_F358FF87 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCBNYXkgMTcsIDIwMjQgYXQgMDc6MjI6MzRQTSArMDkwMCwgS3J6eXN6dG9mIFdpbGN6
ecWEc2tpIHdyb3RlOgo+IEhlbGxvLAo+IAo+ID4gV2hpbGUgYXQgaXQsIHJlbW92ZSBvZl9ncGlv
LmggbGVmdG92ZXIgZnJvbSBzb21lIG9mIHRoZSBkcml2ZXJzLgo+IAo+IEFwcGxpZWQgdG8gZ3Bp
bywgdGhhbmsgeW91IQoKVGhhbmsgeW91IQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNo
ZXZjaGVua28KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
