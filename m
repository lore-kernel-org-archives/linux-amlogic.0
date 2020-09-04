Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBADC43461
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 08:09:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787BC206B8
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 08:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IL8bzLl8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="yDJZac9Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787BC206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-Reply-To:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h/9uGfrBC1pkX4/fD+0m1hng82yJ2G71B+wnGz+5ab0=; b=IL8bzLl8WpsJ7aNkiDZDxs3pe
	55NJE2Ckb1ZZRU2B9FeTl+ch8rWJVlZ9Nzwx7LtmqqbUpqr14xK+0kxLRtGdm6Uvq1fJV5Umjh7Ep
	k6y/3DFicb3A6DfOjLeaUxJkOAC77goeAcd7XVxCXmtmbLmX6V1gPwXpbYbSZ1fNYMSmZDN9VbJNI
	Jt5y+ri51u9zlz3l9oO2ZHLGgaqpSHBzqgJ905INH8EAHB4rMzzDnBt8mBayVvYFW2l2oaw8JB4yi
	aIDLwP5Hb6YneF2wpmJw1VqwpWc3Z3aIcED9Q6DFVHH21z/bJYAr6NQ898+AybB0Onw+lnrDKtDig
	jy1ZO/pmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE6mZ-0005cj-9n; Fri, 04 Sep 2020 08:09:15 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE6mT-0005bg-Q1; Fri, 04 Sep 2020 08:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1599206949; x=1630742949;
 h=references:from:to:cc:subject:in-reply-to:date:
 message-id:mime-version:content-transfer-encoding;
 bh=8kg7NVGvA/Y4ravBA+Ck9g+ekPrMr/sJwXHN4ceS2DY=;
 b=yDJZac9QpOdSt3v1VxRsKGjTTFcE7TffPn9g+c+0rUa8bzb646NO1shl
 eJOoUl08iP2Jg5mNIvXk+vRzirAolZJb9ZDSQcm/9oSx+jMmxHnGvlxLI
 WJ1LsKZX/W58J9Wy3NjhNyfzCeMVu4AVFXebzG8RONaddOL3SYqzPypLT
 KGyk85FOJD29fFYY6ePj3QC+4G++lxgxM8Us8LOlf4hlurcWMCz6vJBLZ
 6u+P0ZER6rKdO/QZcn8aA5+nn7BZZO6Jo55CqwnmP8fBL1wAOrk6S602R
 JoWw1XGmrm3+zzufdaJ0PluVnwLCNYHxPcaXq2l63QDsG39TSaWl+wF4h Q==;
IronPort-SDR: gFJOOhxnbMekT+gVguHT6+Xjx6sB8n0ubMR5otjKsB+saYnGsOOppBCh+Fj0+R+9J65PTYV2wf
 dGSvHGIUiWDX8mmGYWMD9l5tHBxzEVhOzHkD0xk0VJAyFaqkKnXGuLkFAquFe8OYNFzYg5us/O
 5hPW1xnCuOFYZvDMcr+oFh27Ht4NZ8KdA2fEMvQdWVpXfGghpUjg9s+QOe53DLcVCB3Wk62jPv
 FRF6/hiBOfsRphm+lo3KYSbpidZ+5L8BTG4RFT/HBis8Eclgsv7eK/7BIThzFeFJvMZn81bb0k
 0Ec=
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="90544258"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Sep 2020 01:09:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 4 Sep 2020 01:08:54 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Fri, 4 Sep 2020 01:08:04 -0700
References: <20200902193658.20539-1-krzk@kernel.org>
 <20200902193658.20539-11-krzk@kernel.org>
From: Lars Povlsen <lars.povlsen@microchip.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 10/11] mmc: sdhci-of-sparx5: Use proper printk format for
 dma_addr_t
In-Reply-To: <20200902193658.20539-11-krzk@kernel.org>
Date: Fri, 4 Sep 2020 10:08:48 +0200
Message-ID: <87zh66vu9b.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_040910_071815_CAA10D2F 
X-CRM114-Status: GOOD (  14.34  )
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
 Thierry Reding <thierry.reding@gmail.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
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
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Nicolas
 Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CktyenlzenRvZiBLb3psb3dza2kgd3JpdGVzOgoKPiBkbWFfYWRkcl90IHNpemUgdmFyaWVzIGJl
dHdlZW4gYXJjaGl0ZWN0dXJlcyBzbyB1c2UgZGVkaWNhdGVkIHByaW50awo+IGZvcm1hdCB0byBm
aXggY29tcGlsZSB0ZXN0aW5nIHdhcm5pbmcgKGUuZy4gb24gMzItYml0IE1JUFMpOgo+Cj4gICBk
cml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLXNwYXJ4NS5jOjYzOjExOiB3YXJuaW5nOgo+ICAgICBm
b3JtYXQg4oCYJWxseOKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYbG9uZyBsb25nIHVu
c2lnbmVkIGludOKAmSwgYnV0IGFyZ3VtZW50IDUgaGFzIHR5cGUg4oCYZG1hX2FkZHJfdCB7YWth
IHVuc2lnbmVkIGludH3igJkgWy1XZm9ybWF0PV0KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tbWMvaG9zdC9z
ZGhjaS1vZi1zcGFyeDUuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3Qvc2Ro
Y2ktb2Ytc3Bhcng1LmMgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLXNwYXJ4NS5jCj4gaW5k
ZXggMTRiNWRhZDY1NzVhLi43NDdmMTA4YTBhY2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tbWMv
aG9zdC9zZGhjaS1vZi1zcGFyeDUuYwo+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2Yt
c3Bhcng1LmMKPiBAQCAtNjAsOCArNjAsOCBAQCBzdGF0aWMgdm9pZCBzZGhjaV9zcGFyeDVfYWRt
YV93cml0ZV9kZXNjKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB2b2lkICoqZGVzYywKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBwcl9kZWJ1ZygiJXM6
IHdyaXRlX2Rlc2M6IHNwbGl0dGluZyBkbWEgbGVuICVkLCBvZmZzZXQgMHglMGxseFxuIiwKPiAt
ICAgICAgICAgICAgICAgIG1tY19ob3N0bmFtZShob3N0LT5tbWMpLCBsZW4sIGFkZHIpOwo+ICsg
ICAgICAgcHJfZGVidWcoIiVzOiB3cml0ZV9kZXNjOiBzcGxpdHRpbmcgZG1hIGxlbiAlZCwgb2Zm
c2V0ICVwYWRcbiIsCj4gKyAgICAgICAgICAgICAgICBtbWNfaG9zdG5hbWUoaG9zdC0+bW1jKSwg
bGVuLCAmYWRkcik7Cj4KPiAgICAgICAgIG9mZnNldCA9IGFkZHIgJiAoU1pfMTI4TSAtIDEpOwo+
ICAgICAgICAgdG1wbGVuID0gU1pfMTI4TSAtIG9mZnNldDsKCkFja2VkLWJ5OiBMYXJzIFBvdmxz
ZW4gPGxhcmMucG92bHNlbkBtaWNyb2NoaXAuY29tPgoKLS0gCkxhcnMgUG92bHNlbiwKTWljcm9j
aGlwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
