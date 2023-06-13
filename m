Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419ECC88CB7
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 12:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEVUASlJazQifginQ2i/HIDxh1QxnSY8uh53zKQR59o=; b=BdBe8IMmt9dIcH
	xx/7aKGWdnuHSVeMlA/t1JrbGoWp8ZuRGOI4OI+KKUTmBQYeZ83UwPPxo9fbXywXeP26ETvByNK+u
	CnwLutSkmEvhaeW2+mwtlYXOR/ngUhilpRFUwLE372WAjLdWaImE2udq9H/1e3fpGisbvF5yoTOEJ
	28RXDlBmz23SGYJET+dKeYy7GKBeWe7J1/4RVLS2ebZah8HqTN6mV99Gln9N8BX5rzEPrhEVYdyOm
	vGyfNlLCO3dy2eHFBU3ZMuPFoqZ+W+kkHF7ChHMA7EPtzAp3t3WnU2Auf7w1vg+9upvUzCLWsCJUH
	6zm1H+T3aMyvaZ9nTnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q93ZC-0086se-35;
	Tue, 13 Jun 2023 12:56:10 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q93Z6-0086rH-2J;
	Tue, 13 Jun 2023 12:56:08 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35DCtlqE086407;
	Tue, 13 Jun 2023 07:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686660947;
	bh=m3aWRYVccVyv3TBm3CQBhQSLQ8Afh0rwU1mPnybKOSM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YbXTTZrIY+UGenKDmM/cnVARAJ7p9b2bkDm1ar7gDhRT7bIkCvpkwibosjYvgjLae
	 63bZObWKZFTzLmbfN45ZlZJrDJ8wPl/j5e2se5bX19Uned4epzQ4Vb8vWd/pz3VDRN
	 bBdHMeZYl0QWiJWF/oAMLaC8k8N6YWMk5xGFlFcU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35DCtlO3121434
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Jun 2023 07:55:47 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Jun 2023 07:55:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Jun 2023 07:55:47 -0500
Received: from [10.250.64.104] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35DCtZPm112555;
	Tue, 13 Jun 2023 07:55:36 -0500
Message-ID: <4ee9c4dc-7dfc-3cb8-089d-c1535ab2531c@ti.com>
Date: Tue, 13 Jun 2023 18:25:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 08/12] thermal/drivers/ti-soc: remove redundant msg in
 ti_thermal_expose_sensor()
To: Yangtao Li <frank.li@vivo.com>, <glaroque@baylibre.com>,
        <rafael@kernel.org>, <daniel.lezcano@linaro.org>, <amitk@kernel.org>,
        <rui.zhang@intel.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <thara.gopinath@gmail.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <anarsoul@gmail.com>, <tiny.windzz@gmail.com>, <wens@csie.org>,
        <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <edubezval@gmail.com>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>, <bchihi@baylibre.com>,
        <niklas.soderlund+renesas@ragnatech.se>, <wenst@chromium.org>
CC: <linux-pm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
        <linux-tegra@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>
References: <20230613114904.15749-1-frank.li@vivo.com>
 <20230613114904.15749-8-frank.li@vivo.com>
Content-Language: en-US
From: "J, KEERTHY" <j-keerthy@ti.com>
In-Reply-To: <20230613114904.15749-8-frank.li@vivo.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_055604_855593_C36AB76E 
X-CRM114-Status: GOOD (  10.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 6/13/2023 5:19 PM, Yangtao Li wrote:
> The upper-layer devm_thermal_add_hwmon_sysfs() function can directly
> print error information.

Acked-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> index 6a5335931f4d..d414a4b7a94a 100644
> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> @@ -182,8 +182,7 @@ int ti_thermal_expose_sensor(struct ti_bandgap *bgp, int id,
>   	ti_bandgap_write_update_interval(bgp, data->sensor_id,
>   					 TI_BANDGAP_UPDATE_INTERVAL_MS);
>   
> -	if (devm_thermal_add_hwmon_sysfs(bgp->dev, data->ti_thermal))
> -		dev_warn(bgp->dev, "failed to add hwmon sysfs attributes\n");
> +	devm_thermal_add_hwmon_sysfs(bgp->dev, data->ti_thermal); >
>   	return 0;
>   }

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
