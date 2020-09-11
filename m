Return-Path: <SRS0=cGvQ=CU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E12FC433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2020 08:29:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D70206F4
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2020 08:29:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="il4TGHJE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="CNlsHBhS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30D70206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0XunWgaENR810HPYtwU/rKeY4Ggdcr3u8gzX+XanPPk=; b=il4TGHJEkBny7GwZk4tjnqFw1
	/LbBiUKIEpyfthp/0XyDjIKmblQgwIydFhgNaVg8Wtp1qtH5NVHjuvbvGph4j8kiWj8g1kK+fPw1n
	HJzoHvA3Wc/YedhcUcdy5LDIHKJ7ELIbsAmLYheoQB5xDgyoy3h9z1I0yVSuUMLr1QkWiVNUNnXDP
	D6WZACsrTzDuspWtJ8pHz8ZTXV79epzvnldJzpAf99PcozPBwQ1B2tVL/UDtKLZAsHyGXSmztxq4F
	xKlx1lcUumLcRUZb/+2injmDicu5phrL/GO1ZlQ4Tvumv1nBLO4nuNwsF6osLQSh0Wo97F0DxbNgN
	DYe7NXZsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGeRC-00082f-A6; Fri, 11 Sep 2020 08:29:42 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGeRA-00081B-3M
 for linux-amlogic@lists.infradead.org; Fri, 11 Sep 2020 08:29:41 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08B8S3D7001767; Fri, 11 Sep 2020 10:29:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=NPQB3mzG+KC4r8q2wcOs8xMlMzwaex4jb/8qkinpIxc=;
 b=CNlsHBhSyGwnpGkj2SWWaXCRpwaUROtYzB2TT9dBHLqDdA+JZFHivlYm0ThANbnpaEMT
 74Dy7lamZNKG42XyNUEYz9PRy3qmU1tQZyXTnEhe1+9bWvndHfrbO5SD+01lBy1RSFG4
 6YAMCz65sqM4uExpu2EivULV+jvgb4OhLQKTSecSDeMLn3GQT0BSJPlCf4FRSwTZPopO
 Dv4zwUKvS88IhUuOc7UNmVvS+LmkcY0OLm2HZ5ev13N66+V9vvRRQHc/cYVz7TjifNSK
 IwjoQluegbaufQzOyZYvIvBG3qOwM5BcIDXzLsprZn3ssMDVT359J++omDTbhk1UFtuL XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33byt88mek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 10:29:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF67310002A;
 Fri, 11 Sep 2020 10:29:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA60321E26A;
 Fri, 11 Sep 2020 10:29:27 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Sep
 2020 10:29:27 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 11 Sep 2020 10:29:27 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Neil Armstrong <narmstrong@baylibre.com>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: permit configuring the escape
 clock rate
Thread-Topic: [PATCH] drm/bridge: dw-mipi-dsi: permit configuring the escape
 clock rate
Thread-Index: AQHWgrq0GnmfCHcy9EO3+U4LDjE6p6ljBFQA
Date: Fri, 11 Sep 2020 08:29:27 +0000
Message-ID: <078aae69-936f-cb78-623f-6bdcb1c2630d@st.com>
References: <20200904125531.15248-1-narmstrong@baylibre.com>
In-Reply-To: <20200904125531.15248-1-narmstrong@baylibre.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <C82391012D30F14E973A5E5130F2B86A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_02:2020-09-10,
 2020-09-11 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_042940_329797_45BCB512 
X-CRM114-Status: GOOD (  28.78  )
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
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 "heiko.stuebner@theobroma-systems.com"
 <heiko.stuebner@theobroma-systems.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 9/4/20 2:55 PM, Neil Armstrong wrote:
> The Amlogic D-PHY in the Amlogic AXG SoC Family does support a frequency
> higher than 10MHz for the TX Escape Clock, thus make the target rate
> configurable.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 25 +++++++++++++++----
>   include/drm/bridge/dw_mipi_dsi.h              |  1 +
>   2 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index d580b2aa4ce9..31fc965c66fd 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -562,15 +562,30 @@ static void dw_mipi_dsi_disable(struct dw_mipi_dsi *dsi)
>   
>   static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
>   {
> +	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
> +	unsigned int esc_rate; /* in MHz */
> +	u32 esc_clk_division;
> +	int ret;
> +
>   	/*
>   	 * The maximum permitted escape clock is 20MHz and it is derived from
> -	 * lanebyteclk, which is running at "lane_mbps / 8".  Thus we want:
> -	 *
> -	 *     (lane_mbps >> 3) / esc_clk_division < 20
> +	 * lanebyteclk, which is running at "lane_mbps / 8".
> +	 */
> +	if (phy_ops->get_esc_clk_rate) {
> +		ret = phy_ops->get_esc_clk_rate(dsi->plat_data->priv_data,
> +						&esc_rate);
> +		if (ret)
> +			DRM_DEBUG_DRIVER("Phy get_esc_clk_rate() failed\n");
> +	} else
> +		esc_rate = 20; /* Default to 20MHz */
> +
> +	/*
> +	 * We want :
> +	 *     (lane_mbps >> 3) / esc_clk_division < X
>   	 * which is:
> -	 *     (lane_mbps >> 3) / 20 > esc_clk_division
> +	 *     (lane_mbps >> 3) / X > esc_clk_division
>   	 */
> -	u32 esc_clk_division = (dsi->lane_mbps >> 3) / 20 + 1;
> +	esc_clk_division = (dsi->lane_mbps >> 3) / esc_rate + 1;
>   
>   	dsi_write(dsi, DSI_PWR_UP, RESET);
>   
> diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
> index b0e390b3288e..bda8aa7c2280 100644
> --- a/include/drm/bridge/dw_mipi_dsi.h
> +++ b/include/drm/bridge/dw_mipi_dsi.h
> @@ -36,6 +36,7 @@ struct dw_mipi_dsi_phy_ops {
>   			     unsigned int *lane_mbps);
>   	int (*get_timing)(void *priv_data, unsigned int lane_mbps,
>   			  struct dw_mipi_dsi_dphy_timing *timing);
> +	int (*get_esc_clk_rate)(void *priv_data, unsigned int *esc_clk_rate);
>   };
>   
>   struct dw_mipi_dsi_host_ops {
> 

Hi Neil,
Thank you for the patch

Reviewed-by: Philippe Cornu <philippe.cornu@st.com>

Philippe :-)
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
