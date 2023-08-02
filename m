Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22852C001DE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Aug 2023 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LYqr/NizYT3eBC4gY+VNuTGvY6fxo08MtqFlYFa9Uk=; b=hGLs+IBUBFW30N
	vy8mU/TSJHdfhWMObHF7ztHN5jxPsJxrfaG0UrrK0xsa37CpWfod8AnMidiBsD4EUs8BQEfwofpac
	gPu28ncW28ZYK6j78Twe2EselMOwz+ylLBM2VQumtzTgeBobnboFSKvsDalGMI0afhOGmZabQoTQ9
	cLWEbcFg4YzhyNrFzbxRiwWPI0A38zUAUchX/3Fy6RSYNtM/c9WdB64x2mjJDWTA3nruqVnlw8CPm
	tRwFzq6ud6cT+O50+CaIGyJ+VGdd0yn7j+tJznlXbOsUefbMXm0i2Iq50WNybd/36pOhjNEfIJpKO
	omPAF6e4ghT8Zed/XA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6Q5-004Gbs-3A;
	Wed, 02 Aug 2023 07:37:21 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6Q2-004GY0-2u;
	Wed, 02 Aug 2023 07:37:20 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 79C97120008;
	Wed,  2 Aug 2023 10:37:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 79C97120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1690961832;
	bh=ySPKX71AR7ERlZqWHs70b/+0JtWIHCcnxyCVYb0RFag=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=Dj6meVIX3MeqLcmfIkTZqFQG1v3B2SbOMvk9jCr8DhdLYIodSUHINdybqbo6vAOSs
	 DAxPP4bbTkjs+CFCkcTiiG47wKiKv3LhWm5oaLL2N7zhirBDVie/ZYev7hZhPB6Kfj
	 wLkllYRs8A81wk4qWfHF3e3DqR6BPGjOifKJFtlfP43xYUR/kQtGMpQSSqYkzbO0kU
	 NVsIEWf9j6mpsCnQCTNIAr3XPR9Q9Mv0Hlz+nuGYW1by2Uud6JNeiSdd11DhrfH6sA
	 WWmJOxWu1bIQHGf/ilSSS0R+mVoDwMwqdvpFg2+WB2c0vPSRXjATQci5/C/M1IsW1u
	 QYDijZwGYzBVA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  2 Aug 2023 10:37:12 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 10:37:11 +0300
Date: Wed, 2 Aug 2023 10:37:12 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Huqiang Qin <huqiang.qin@amlogic.com>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2 3/4] watchdog: Add support for Amlogic-T7 SoCs
Message-ID: <20230802073712.6gd6jigprlryxstu@CAB-WSD-L081021>
References: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
 <20230802033222.4024946-4-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802033222.4024946-4-huqiang.qin@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178796 [Jul 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/23 10:45:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/23 10:46:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/23 08:49:00 #21663637
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_003719_289393_186F3418 
X-CRM114-Status: GOOD (  19.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 02, 2023 at 11:32:21AM +0800, Huqiang Qin wrote:
> Compared with the previous Amlogic-GXBB, the watchdog of Amlogic-T7
> has a different reset enable bit.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

> ---
> 
> V1 -> V2: Use the BIT() macro to build rst initial value.
> 
>  drivers/watchdog/meson_gxbb_wdt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 18180d91543e..a48622d11ad7 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -147,8 +147,13 @@ static const struct wdt_params gxbb_params = {
>  	.rst = BIT(21),
>  };
>  
> +static const struct wdt_params t7_params = {
> +	.rst = BIT(22),
> +};
> +
>  static const struct of_device_id meson_gxbb_wdt_dt_ids[] = {
>  	 { .compatible = "amlogic,meson-gxbb-wdt", .data = &gxbb_params, },
> +	 { .compatible = "amlogic,t7-wdt", .data = &t7_params, },
>  	 { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, meson_gxbb_wdt_dt_ids);
> -- 
> 2.37.1
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
