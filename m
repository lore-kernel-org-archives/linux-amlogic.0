Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FF1EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 18:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MO0HTF5oydt3jlEedlsSbrlbyHd75kxUKkr9ReQGdCY=; b=QZcGpL5MDQfPT3
	0vsNOFfT1AtK1VB3cKgltjVjdI/45l2Ui2QyORf0hnlyJ5V+hVOUnk/q5FJ3uv5yXE3A4YC0W011X
	pqQSa3RwN2f1rITTVzqYiAxW0cpDR7YbZaoEPEhaqYbl5te1CfTviDlOKmF05Zx46+MqM6/j0ClU7
	HIpUpN4GEcZ35oznE08S5C+xEUlc/SNt5xC+UUFZ0YBH5UHTE7AX2ia6Kf00AHUF1Le9iq7nDtALY
	q+C/KZ+xyH/PEMg326mBqTn4s5C9RmCAb+0LJHv+NltMSDRj+AAbqXBrcn3WrFIK2szlZ27nlMH/n
	Usl2MBbhhCUtyhw0tYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIf7-004Ham-0S;
	Fri, 30 Jun 2023 18:16:05 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIf3-004HYH-0f;
	Fri, 30 Jun 2023 18:16:03 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id BEEDA120005;
	Fri, 30 Jun 2023 21:15:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru BEEDA120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688148916;
	bh=+iLch2qAvGn4pfUehxJdtn4vtmFO4jTPo40JbMcUAX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=WxEg/2kvwPreQTg+r2N3XEH3y3Kk07do/xoH4StKlU9Oa5VXbIIkYQ73UKVdxkN3c
	 VwhvBg30btoWcumWDTIu4GceBRikwuxcgG//JVMcSlrXC4kJxDHdYI68czOHSn3tx6
	 TeYHzUa759gNbHKlwHSb+pVhlbharcYmuXlq2ud0f1qsyYd8CSDq2tqNNdPc2VUcVv
	 7uOuQX9kwB+w1Y9LnnPC7hUsSbFWEzQBaa8FKMMRTxAH8xbjl0YluALyhm1MrrUUhk
	 rjdY9P/sk7C58OWnxg1l5OnY+CYl3cHVhBkpKmtz1aIom/Egz8rO3Tu637l3CPmOPj
	 Hzvfnvyy5AdUw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 30 Jun 2023 21:15:15 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 30 Jun 2023 21:15:01 +0300
Message-ID: <c487ed03-0ab2-74fb-91bc-4a773bfdfc5b@sberdevices.ru>
Date: Fri, 30 Jun 2023 21:10:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 5/9] drm/meson: gate px_clk when setting rate
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jagan Teki
	<jagan@amarulasolutions.com>, Nicolas Belin <nbelin@baylibre.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-5-fd2ac9845472@linaro.org>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-5-fd2ac9845472@linaro.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178380 [Jun 30 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/30 14:57:00 #21607376
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_111601_606184_B914BD44 
X-CRM114-Status: GOOD (  17.71  )
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

Hello Neil

On 6/30/23 19:29, Neil Armstrong wrote:
> Disable the px_clk when setting the rate to recover a fully
> configured and correctly reset VCLK clock tree after the rate
> is set.
>
> Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index 57447abf1a29..dc63d2d813a9 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -94,6 +94,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   		return ret;
>   	}
>   
> +	clk_disable_unprepare(mipi_dsi->px_clk);
>   	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
>   
>   	if (ret) {
> @@ -102,6 +103,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   		return ret;
>   	}
>   
> +	clk_prepare_enable(mipi_dsi->px_clk);
probably should be:
ret = clk_prepare_enable(mipi_dsi->px_clk);
> +	if (ret) {
> +		dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
> +		return ret;
> +	}
> +
>   	switch (mipi_dsi->dsi_device->format) {
>   	case MIPI_DSI_FMT_RGB888:
>   		dpi_data_format = DPI_COLOR_24BIT;
>
-- 
Best regards
George


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
