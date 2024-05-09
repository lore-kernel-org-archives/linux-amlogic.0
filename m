Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D3FC10F1A
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2024 04:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oMalT43RBFMpxFx6VXqYjhvgQItq4su1UpI11qIUxk=; b=LypNhkNc5rijDU
	gwlgxiCX9wILKLXgYzqYesnnWIA3y6Zzic6KKU/iJzAxJjRP/M8RasFdVG0A/pGsTUH0c+3SAe/Vj
	pmWKDoMH1V3Zj/ZAmCVxhVKIsAgyaHvCbxCeUeKlvVXfZ4MkypUoT+NI7SZldDgrNjH9VnaSzSVj0
	3nKF10N1xUy368xa28cjHAhjul5j6sMW54w/JvPdPq3LcyWLLHYEpzqisRqmbWHLjh+HWD0dOuH9r
	XG1jGKPt3DKfosNbp/nH5bHY4/2piKMGXbdms2ovSAhrIJAVLIw+4HkbqdKT0HTShNacZ61gsxdAl
	L1tEE7PvSla2SeAEGUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4vL2-00000000IfE-2DPD;
	Thu, 09 May 2024 04:25:00 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4vKy-00000000IdW-2Qkp
	for linux-amlogic@lists.infradead.org;
	Thu, 09 May 2024 04:24:58 +0000
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 14224eb4-0dbc-11ef-b972-005056bdfda7;
	Thu, 09 May 2024 07:24:52 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 May 2024 07:24:51 +0300
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <frank.li@nxp.com>,
	Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kwilczynski@kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: Re: [PATCH v4 4/5] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <ZjxQE8h0-BABxybu@surfacebook.localdomain>
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
 <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
 <AS8PR04MB867668870DD2DC029C8B98048CE62@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8PR04MB867668870DD2DC029C8B98048CE62@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_212456_919785_6298A4AB 
X-CRM114-Status: GOOD (  19.43  )
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

VGh1LCBNYXkgMDksIDIwMjQgYXQgMDE6MjQ6NDVBTSArMDAwMCwgSG9uZ3hpbmcgWmh1IGtpcmpv
aXR0aToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBBbmR5IFNoZXZj
aGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPiA+IFNlbnQ6IDIwMjTl
ubQ15pyINuaXpSAyMjoyMQoKLi4uCgo+ID4gLQlpbXg2X3BjaWUtPmdwaW9fYWN0aXZlX2hpZ2gg
PSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwKPiA+IC0JCQkJCQkicmVzZXQtZ3Bpby1hY3Rp
dmUtaGlnaCIpOwo+ID4gLQlpZiAoZ3Bpb19pc192YWxpZChpbXg2X3BjaWUtPnJlc2V0X2dwaW8p
KSB7Cj4gPiAtCQlyZXQgPSBkZXZtX2dwaW9fcmVxdWVzdF9vbmUoZGV2LCBpbXg2X3BjaWUtPnJl
c2V0X2dwaW8sCj4gPiAtCQkJCWlteDZfcGNpZS0+Z3Bpb19hY3RpdmVfaGlnaCA/Cj4gPiAtCQkJ
CQlHUElPRl9PVVRfSU5JVF9ISUdIIDoKPiA+IC0JCQkJCUdQSU9GX09VVF9JTklUX0xPVywKPiA+
IC0JCQkJIlBDSWUgcmVzZXQiKTsKPiA+IC0JCWlmIChyZXQpIHsKPiA+IC0JCQlkZXZfZXJyKGRl
diwgInVuYWJsZSB0byBnZXQgcmVzZXQgZ3Bpb1xuIik7Cj4gPiAtCQkJcmV0dXJuIHJldDsKPiA+
IC0JCX0KPiA+IC0JfSBlbHNlIGlmIChpbXg2X3BjaWUtPnJlc2V0X2dwaW8gPT0gLUVQUk9CRV9E
RUZFUikgewo+ID4gLQkJcmV0dXJuIGlteDZfcGNpZS0+cmVzZXRfZ3BpbzsKPiA+IC0JfQoKPiBQ
bGVhc2UgY29ycmVjdCBtZSBpZiBteSB1bmRlcnN0YW5kIGlzIHdyb25nLgo+IFRoZSAicmVzZXQt
Z3Bpby1hY3RpdmUtaGlnaCIgcHJvcGVydHkgaXMgYWRkZWQgZm9yIHNvbWUgYnVnZ3kgYm9hcmQg
ZGVzaWducy4KPiBPbiB0aGVzZSBidWdneSBib2FyZHMsIHRoZSByZXNldCBncGlvIGlzIGFjdGl2
ZSBoaWdoLgoKVGhpcyBpcyBteSB1bmRlcnN0YW5kaW5nIHRvby4KCj4gSW4gdGhlIG90aGVyIHdv
cmRzLCB0aGUgUEVSU1QjIGlzIGFjdGl2ZSBhbmQgcmVtb3RlIGVuZHBvaW50IGRldmljZSB3b3Vs
ZAo+IGJlIGluIHJlc2V0IHN0YXQgd2hlbiB0aGlzIGdwaW8gaXMgaGlnaCBvbiB0aGVzZSBidWdn
eSBib2FyZHMuCgpZZXMuCgo+IEknbSBhZnJhaWQgdGhhdCB0aGUgUENJZSB3b3VsZCBiZSBicm9r
ZW4gb24gdGhlc2UgYm9hcmRzLCBJZiB0aGVzZSBjb2Rlcwo+ICBhcmUgcmVtb3ZlZCB0b3RhbGx5
LAoKTm8uIExpbnVzIFcuIGV4cGxhaW5lZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiByZXZpZXcg
cm91bmQgaG93IGl0J3Mgc3VwcG9zZWQKdG8gd29yay4KCj4gYW5kIHRvZ2dsZSB0aGUgcmVzZXQg
R1BJTyBwaW4gbGlrZSBiZWxvdy4KPiAuLi4KPiBncGlvX3NldF92YWx1ZV9jYW5zbGVlcChpbXg2
X3BjaWUtPnJlc2V0X2dwaW8sIDApOwo+IG1zbGVlcCgxMDApOwo+IGdwaW9fc2V0X3ZhbHVlX2Nh
bnNsZWVwKGlteDZfcGNpZS0+cmVzZXRfZ3BpbywgMSk7Cj4gLi4uCgpJdCdzIG5vdCB0aGUgY29k
ZSB0aGF0IHRoaXMgcGF0Y2ggYWRkcy4gSSdtIG5vdCBzdXJlIGlmIEkgdW5kZXJzdGFuZCBzdGFy
dGluZwpmcm9tIGhlcmUgd2hhdCB5b3UgbWVhbi4KCj4gQnkgdGhlIHdheSwgdGhpcyByZXNldCBH
UElPIHBpbiBzaG91bGQgYmUgaGlnaCBhdCBlbmQgaW4KPiBpbXg2X3BjaWVfZGVhc3NlcnRfY29y
ZV9yZXNldCgpIGlmIHRoZSBpbXg2X3BjaWUtPmdwaW9fYWN0aXZlX2hpZ2ggaXMgemVyby4gCgpU
aGlzIHNlZW1zIGEgdGVybWlub2xvZ3kgbWl4dXAuIFlvdSBwcm9iYWJseSBtZWFudCAiaW5hY3Rp
dmUiLgpBbmQgdGhpcyBpcyBleGFjdGx5IHRoZSBjYXNlIHdpdGggdGhpcyBwYXRjaC4KCklmIHlv
dSBzdGFydCB0aGlua2luZyBpbiB0ZXJtcyBvZiAiYWN0aXZlIi8iaW5hY3RpdmUiIHlvdSB3aWxs
IHNlZSB0aGF0IHRoZXJlCmlzIG5vIGNvbnRyYWRpY3Rpb24gYW5kIG5vIGJlaGF2aW91ciBjaGFu
Z2UuIFRoZSBxdWlyayBpdHNlbGYgaXMgbG9jYXRlZCBpbgpncGlvbGliLW9mLmMuLgoKLS0gCldp
dGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
