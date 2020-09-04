Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1639EC43461
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 08:14:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0BD8206A5
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 08:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FtVwwnUD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="PNdjsRTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0BD8206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:In-Reply-To:Message-ID:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fl0HpemweVETk5JN6xJZx+aDe5fX/ksNjt1+PI19YEI=; b=FtVwwnUD3HyO5Pu2kBw5xkVbj
	PJYbIFCQ2n7F9Y/tx+YuKq0zI6DCEPU0pid6BI9+AeELzl52k3JSAzrAzdSqX2yDHw16wSL+oc37p
	9BCeSWERo/sEdkfirp1JuvXccOKaTfFNBh3YjBSvr6bczAXwTnoFlCeTsBJsGudl2OQ5zzmx8Nj4C
	xk42mOjsC/vSG8SHumXaldGAR3ug2WOTSdxQ/3c+4LiW7SdpvDKXfGurum3jQAbLO4dWn0hcG3be5
	5xQI9mZKRTUfpe0mRkoi5qv6iv9iSJU/KLUckArGF8WnHF8oQgrAo+aCHctqB7858XPCm0JwKtMTX
	JQAqAZLtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE6rr-00060I-RT; Fri, 04 Sep 2020 08:14:43 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE6rn-0005zH-TT; Fri, 04 Sep 2020 08:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1599207279; x=1630743279;
 h=references:from:to:cc:subject:message-id:in-reply-to:
 date:mime-version;
 bh=C+bBXo0rf5HHX2D82rfzwmnGYsZpnmPVAqTS90P4am0=;
 b=PNdjsRTLIk48M+Gj+8nEMUCOb1LK/oHC+HmRQlKoMN07STom1nKbM3Dg
 fuZloFWtyzVSTl/vTkj79zBb4u/9HcHstKf6FERS+MKyOyMWQ5ppBWvxh
 SI3AhY7L3gbeVTyJayx0gkCNzojynP4ILYSFds+98rbeL3rNFnasA8RbH
 dtwpNvYyxCMNlTVxXL/P4lYXiMa/q4KKLvmoscZhzV6WbzFakxJllEJQP
 1FPoGgKN+Tkum1LPG86dE2hknqW632pyoVXHAhkXo4THV8NEpnk9b2T4G
 avpcZsJjJcWA7s2nEI9Dxvrt1IBYcPWbDZNEF3Wy/i3WZK4+cjAWzDUBm Q==;
IronPort-SDR: 8nv+Um/Ajp+8yrHw100jjMRAOk4Jxm6ZdpjZuFbSFSqzSHVNfarzUTxB4U/zHleMXwKqeSV43E
 nPBHsUvfd8GH4ukaL7bmc21hsu8jj78TFnNccjxmDAJggvvVjdKuxZTG8Z1mZPuOjbMJ9sEhts
 AGUYa4FtxwdKyya67QIctsoP6Sy9a6tLX6b96xzX/ULE3qrv5lpEP10xP5SCsNCbwZy/31TiMl
 lKOqpWkVpu+zgj1+DCdXM8Huxgb0GC19DjdqLZn6dkM/iDU+Dr6VMlGJdc8JpNvqQUdoiZwVpQ
 28w=
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="25333146"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Sep 2020 01:14:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 4 Sep 2020 01:14:33 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Fri, 4 Sep 2020 01:13:42 -0700
References: <20200903232441.2694866-1-dianders@chromium.org>
 <20200903162412.6.Ib121debfb18e5f923a3cd38fe9c36aa086c650c5@changeid>
From: Lars Povlsen <lars.povlsen@microchip.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 6/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 are newer than 5.4
Message-ID: <87y2lqvu0m.fsf@soft-dev15.microsemi.net>
In-Reply-To: <20200903162412.6.Ib121debfb18e5f923a3cd38fe9c36aa086c650c5@changeid>
Date: Fri, 4 Sep 2020 10:14:29 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_041440_081752_EDD70F8A 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 linux-arm-kernel@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-amlogic@lists.infradead.org, swboyd@chromium.org,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Douglas Anderson writes:

> This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> probe") but applied to a whole pile of drivers.  This batch converts
> the drivers that appeared to have been added after kernel 5.4.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/mmc/host/meson-mx-sdhc-mmc.c | 1 +
>  drivers/mmc/host/owl-mmc.c           | 1 +
>  drivers/mmc/host/sdhci-esdhc-mcf.c   | 1 +
>  drivers/mmc/host/sdhci-milbeaut.c    | 1 +
>  drivers/mmc/host/sdhci-of-sparx5.c   | 1 +
>  5 files changed, 5 insertions(+)
>

[snip]

> diff --git a/drivers/mmc/host/sdhci-of-sparx5.c b/drivers/mmc/host/sdhci-of-sparx5.c
> index 747f108a0ace..28e4ee69e100 100644
> --- a/drivers/mmc/host/sdhci-of-sparx5.c
> +++ b/drivers/mmc/host/sdhci-of-sparx5.c
> @@ -255,6 +255,7 @@ MODULE_DEVICE_TABLE(of, sdhci_sparx5_of_match);
>  static struct platform_driver sdhci_sparx5_driver = {
>         .driver = {
>                 .name = "sdhci-sparx5",
> +               .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>                 .of_match_table = sdhci_sparx5_of_match,
>                 .pm = &sdhci_pltfm_pmops,
>         },

Acked-by: Lars Povlsen <lars.povlsen@microchip.com>

-- 
Lars Povlsen,
Microchip

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
