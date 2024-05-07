Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530FFC25B75
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2024 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X146ZKus8tPtCqRwdwKvI4vaCfYMaHWWBimSRpw+Diw=; b=sx59KyidoXyq2o
	m3L5Ru6DzEQOH5VTSrAGXmq/SSXh9mKvzrA3g99vQFkL5DZBvtuWEZGow8ExZoqoGWQNbXnP24bYU
	bDBM6y9NhrIuGK8TXKIhSlYbLo4CVZQpaXrpqCBfSsO1Ai26dfj0QvjrPFc6vCd5VGtDTQmqFzIHa
	WLJvo/sk3VaXCAdT1A5Db6H3xr0zPBut8jWmXna3/D4fARDt7/9i5I+PP73i006h0gPA+IVBnZ44+
	CdMZ3Nf9EZwUtnHQdDi61m7e8ou8mcBkiInb803937ElpluLJXJbrCFLJFz79EQUPjWPKvKQg77bw
	RC5cWMjMOF0K3PGasA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Kd3-0000000B7dw-3Yvg;
	Tue, 07 May 2024 13:13:09 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Kcq-0000000B7U3-2beK;
	Tue, 07 May 2024 13:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715087577; x=1746623577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a6gSLSNzkB7vq5lvXJKxfEYqY5Zj8C4OuyJc6Y6NlXY=;
  b=V1N6VmycTnyAyagUvhvFtwL8dYYx7PxTan7YBKjiQxAlqQErLNSsIG9q
   Jh4TgYBMHoO23HJCY5IZvcUzP5xOMU1lzLV8BcKiQj1d1mCSZaeLo9hed
   mKCWZ/26t1i3AQZSGNs5zWZ8ViR61BuQFIQbsBqAdS8F+qKu7AlVYwpin
   YKyW3rrbELilY58S5dV79Jbh8IhaXcQ+Gf1FIdqoqsiKN7t52qlCaa9IM
   IH0QKe2rzxYY85g8V8M9+9ghqk3OcgGCvWiLQd2ceL4tY1Tl4WSKCuHPe
   cGYB8hX5oMl+VEW7ay9ZlnI/HcD5niWjG9L5SCz3yKW0WY7jed0NxB8mE
   Q==;
X-CSE-ConnectionGUID: U6BAX8YzRJaRSl/uRcz5lw==
X-CSE-MsgGUID: fsZQTn9ZQLyCXax+Dah1eA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21483951"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="21483951"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 06:12:50 -0700
X-CSE-ConnectionGUID: Fu6nYwQcTgeZWSY044wYqQ==
X-CSE-MsgGUID: MsXTeSYhRgedCqb9bG/apQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="28920705"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 06:12:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s4KcY-000000052fm-0iB8;
	Tue, 07 May 2024 16:12:38 +0300
Date: Tue, 7 May 2024 16:12:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
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
Subject: Re: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
Message-ID: <ZjooxTO3wb2ItvGv@smile.fi.intel.com>
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
 <CACRpkda=a3X=jyZKQoOFrfgzpE2C+rZ9UC1VDnCvGL7QP4x4BA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkda=a3X=jyZKQoOFrfgzpE2C+rZ9UC1VDnCvGL7QP4x4BA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_061256_790238_A66DD27D 
X-CRM114-Status: GOOD (  11.68  )
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

T24gVHVlLCBNYXkgMDcsIDIwMjQgYXQgMTI6MDM6NTBQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBNb24sIE1heSA2LCAyMDI0IGF0IDQ6MjLigK9QTSBBbmR5IFNoZXZjaGVua28K
PiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPiAKPiA+IEluIHY0
Ogo+ID4gLSBhZGRlZCB0YWcgKE1hbmkpCj4gPiAtIGZpeGVkIGEgcG9sYXJpdHkgYnVnIGluIGlN
WC42IGRyaXZlciAoTGludXMpCj4gCj4gTG9va3MgZ29vZCBub3cuIFRoZSBzZXJpZXM6Cj4gUmV2
aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KClRoYW5r
IHlvdSEKCj4gUGVyaGFwcyB0aGUgdXNlIG9mICBfcmF3IGFjY2Vzc29ycyBjb3VsZCBiZSBhdm9p
ZGVkIGluIDUvNSBieSBzb21lCj4gZWxhYm9yYXJ0IHBvbGFyaXR5IHF1aXJrIGJ1dCBJJ20gbm8g
cGVyZmVjdGlvbmlzdCBhbmQgaXQgY2FuIGJlIGZpeGVkIGxhdGVyLgoKQWZ0ZXIgeW91ciBjb21t
ZW50IEkgd2FzIHRoaW5raW5nIHRoZSBzYW1lLCBhbmQgY2FtZSB0byB0aGUgc2ltaWxhciBjb25j
bHVzaW9uLAp3ZSBtaWdodCBmaXggdGhpcyBsYXRlciBhcyBpbiBjb21wYXJpc29uIHRvIGlNWC42
IGNhc2UgdGhpcyByZXF1aXJlcyBhbgphZGRpdGlvbmFsIGNvZGUgdG8gYmUgYWRkZWQgdG8gZ3Bp
b2xpYi1vZi5jLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
