Return-Path: <SRS0=/1bK=BN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580E9C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 07:17:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2682F206D7
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2020 07:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u9GWLJXk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=axis.com header.i=@axis.com header.b="KZB3D32+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2682F206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RhYkcxZ3Nl7ifoVLgH/lEcLvrRw7kusotH4jKxotPSw=; b=u9GWLJXk0G4WFKdv7lKSqS5Qz
	HDfpxorLEt89zJSOFXwEja+P5xzcJHB5FSy8eIwZ2wnUDXIJfZlndaSE9pr9ega2MbtQ+JqJxvlC9
	V5sExTtTrwlMZiUBEOh0KDzxeBakjYeGcJ99ffilcOs3yX1VHGTlgz/YysblY7K+4kNGD6lvNqaiq
	xWqRMlxzoqO+mRUgJ2yZQAr/ACvX3Nu+OW8if1nq3knvlj4t+04htAzE3tB+E/Ag4Y2/w8Z95IX9P
	6/sM+ZdEKw2I91Dt4H/jsdm+D0ryyya58K/kRbVj2RHF3+153bOfyGRCC0G37FmWdFQmN8F+PzWx2
	WZikqGlQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2UiO-0007sc-9X; Mon, 03 Aug 2020 07:16:56 +0000
Received: from smtp1.axis.com ([195.60.68.17])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2UiJ-0007qc-09; Mon, 03 Aug 2020 07:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=2377; q=dns/txt; s=axis-central1;
 t=1596439011; x=1627975011;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4eB+iWowqFuffEwqVhdlrnC6nMcvTTjY/U9qdPMCwa8=;
 b=KZB3D32+ztQy5TnNG0irLdJXBhed+ltGgrdnCO30HFxczhWmMktGa4YI
 CcXsjmQx31laNNOth4PlgdGEutbIdgkqjXPtasJPewVgURxG6LpOQotsZ
 AXLDnmTe9+xNaMXFPoAyGeeozzdfz72vyTlzDR9WuZwz1eQIxuG6BLh/D
 hSZqbO2gLycDsBzIKUCV3lTykWKv0Nm+04ZnAKAHnN0Au3eZp770AVViN
 N3Z2K6kciDdioUg6JLV+6keD2uk0UV5U4CWADgzpp7XU8TfM6DGh80Su8
 YMHQpdF6lSUvK+e68Wa+TfYwHSeLLx8mRD6krQLdwyC4UVqXP1+X/gFJ3 g==;
IronPort-SDR: UaNM9T7tIvhQ2yXPgIs4QcPcTkk/tfeHxx4jq1y9AeEkV586tSbCWZGo0H5qrtreyMPTjbFCDP
 Y+y01J24Qk+f1muOB9+jFlUTw/GiCYD6ZO6oqr3An7Wu5oBT/li8icS7SKZKOzsDp1RSGVRN/P
 JHFVLeyn+a3oH1VPQGhXBUvrV08tJXL9Wa8+LfCSxrQA1U3yNOiSmezqWk0BLNTfFwG1BhdbMz
 FL4tYFSx1r3MfsJ5/LVbLSSS2e7SbjJdVyXnLyuR9Epo7K9M2bAPofd6CFKML9itofxnvwJFEr
 Bac=
X-IronPort-AV: E=Sophos;i="5.75,429,1589234400"; d="scan'208";a="11438926"
Date: Mon, 3 Aug 2020 09:16:42 +0200
From: Jesper Nilsson <Jesper.Nilsson@axis.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH 01/10] PCI: dwc: Remove dev_err() when handing an error
 from platform_get_irq()
Message-ID: <20200803071642.7qgua4qnwrre4s3v@axis.com>
References: <20200802142601.1635926-1-kw@linux.com>
 <20200802142601.1635926-2-kw@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802142601.1635926-2-kw@linux.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_031651_383704_3C0E33AA 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Binghui Wang <wangbinghui@hisilicon.com>,
 linux-arm-kernel <linux-arm-kernel@axis.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>,
 Jesper Nilsson <Jesper.Nilsson@axis.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 Richard Zhu <hongxing.zhu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 "rfi@lists.rocketboards.org" <rfi@lists.rocketboards.org>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBBdWcgMDIsIDIwMjAgYXQgMDQ6MjU6NTNQTSArMDIwMCwgS3J6eXN6dG9mIFdpbGN6
ecWEc2tpIHdyb3RlOgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gY2FsbCB0aGUgZGV2X2VycigpIGZ1
bmN0aW9uIGRpcmVjdGx5IHRvIHByaW50IGEKPiBjdXN0b20gbWVzc2FnZSB3aGVuIGhhbmRsaW5n
IGFuIGVycm9yIGZyb20gZWl0aGVyIHRoZSBwbGF0Zm9ybV9nZXRfaXJxKCkKPiBvciBwbGF0Zm9y
bV9nZXRfaXJxX2J5bmFtZSgpIGZ1bmN0aW9ucyBhcyBib3RoIGFyZSBnb2luZyB0byBkaXNwbGF5
IGFuCj4gYXBwcm9wcmlhdGUgZXJyb3IgbWVzc2FnZSBpbiBjYXNlIG9mIGEgZmFpbHVyZS4KPiAK
PiBUaGlzIGNoYW5nZSBpcyBhcyBwZXIgc3VnZ2VzdGlvbiBmcm9tIENvY2NpbmVsbGU6Cj4gCj4g
ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWFybWFkYThrLmM6MjUyOjItOTogbGlu
ZSAyNTIgaXMKPiAgIHJlZHVuZGFudCBiZWNhdXNlIHBsYXRmb3JtX2dldF9pcnEoKSBhbHJlYWR5
IHByaW50cyBhbiBlcnJvcgo+IAo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1r
aXJpbi5jOjQ1OTozLTEwOiBsaW5lIDQ1OSBpcwo+ICAgcmVkdW5kYW50IGJlY2F1c2UgcGxhdGZv
cm1fZ2V0X2lycSgpIGFscmVhZHkgcHJpbnRzIGFuIGVycm9yCj4gCj4gICBkcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2ktaW14Ni5jOjg3MjozLTEwOiBsaW5lIDg3MiBpcyByZWR1bmRhbnQK
PiAgIGJlY2F1c2UgcGxhdGZvcm1fZ2V0X2lycSgpIGFscmVhZHkgcHJpbnRzIGFuIGVycm9yCj4g
Cj4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWFydHBlYzYuYzozOTE6My0xMDog
bGluZSAzOTEgaXMKPiAgIHJlZHVuZGFudCBiZWNhdXNlIHBsYXRmb3JtX2dldF9pcnEoKSBhbHJl
YWR5IHByaW50cyBhbiBlcnJvcgo+IAo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1zcGVhcjEzeHguYzoyMDI6Mi05OiBsaW5lIDIwMiBpcwo+ICAgcmVkdW5kYW50IGJlY2F1c2Ug
cGxhdGZvcm1fZ2V0X2lycSgpIGFscmVhZHkgcHJpbnRzIGFuIGVycm9yCj4gCj4gICBkcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3RvbmUuYzoxMjU0OjItOTogbGluZSAxMjU0IGlz
Cj4gICByZWR1bmRhbnQgYmVjYXVzZSBwbGF0Zm9ybV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMg
YW4gZXJyb3IKPiAKPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1leHlub3MuYzo0
MDY6Mi05OiBsaW5lIDQwNiBpcyByZWR1bmRhbnQKPiAgIGJlY2F1c2UgcGxhdGZvcm1fZ2V0X2ly
cSgpIGFscmVhZHkgcHJpbnRzIGFuIGVycm9yCj4gCj4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9wY2ktZXh5bm9zLmM6NDE5OjMtMTA6IGxpbmUgNDE5IGlzCj4gICByZWR1bmRhbnQgYmVj
YXVzZSBwbGF0Zm9ybV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMgYW4gZXJyb3IKPiAKPiAgIGRy
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYzoyMTkzOjItOTogbGluZSAy
MTkzIGlzCj4gICByZWR1bmRhbnQgYmVjYXVzZSBwbGF0Zm9ybV9nZXRfaXJxKCkgYWxyZWFkeSBw
cmludHMgYW4gZXJyb3IKPiAKPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlz
dGIuYzo0MDY6My0xMDogbGluZSA0MDYgaXMKPiAgIHJlZHVuZGFudCBiZWNhdXNlIHBsYXRmb3Jt
X2dldF9pcnEoKSBhbHJlYWR5IHByaW50cyBhbiBlcnJvcgo+IAo+ICAgZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpLW1lc29uLmM6NDkyOjMtMTA6IGxpbmUgNDkyIGlzIHJlZHVuZGFudAo+
ICAgYmVjYXVzZSBwbGF0Zm9ybV9nZXRfaXJxKCkgYWxyZWFkeSBwcmludHMgYW4gZXJyb3IKPiAK
PiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1kcmE3eHguYzo2MzM6Mi05OiBsaW5l
IDYzMyBpcyByZWR1bmRhbnQKPiAgIGJlY2F1c2UgcGxhdGZvcm1fZ2V0X2lycSgpIGFscmVhZHkg
cHJpbnRzIGFuIGVycm9yCj4gCj4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktZHJh
N3h4LmM6ODc1OjItOTogbGluZSA4NzUgaXMgcmVkdW5kYW50Cj4gICBiZWNhdXNlIHBsYXRmb3Jt
X2dldF9pcnEoKSBhbHJlYWR5IHByaW50cyBhbiBlcnJvcgo+IAo+IFN1Z2dlc3RlZC1ieTogQmpv
cm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0
b2YgV2lsY3p5xYRza2kgPGt3QGxpbnV4LmNvbT4KCkxvb2tzIGdvb2QsCgpBY2tlZC1ieTogSmVz
cGVyIE5pbHNzb24gPGplc3Blci5uaWxzc29uQGF4aXMuY29tPgoKL15KTiAtIEplc3BlciBOaWxz
c29uCi0tIAogICAgICAgICAgICAgICBKZXNwZXIgTmlsc3NvbiAtLSBqZXNwZXIubmlsc3NvbkBh
eGlzLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
