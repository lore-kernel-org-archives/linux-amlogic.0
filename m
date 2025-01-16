Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B8C02180
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2025 11:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37/BG2dD5XlTJcx2+y+Q/Kov5fG0c+kaont289hX+6c=; b=5DxxVeasHyrLwL
	G9AeS+GyogWbFAjj3Rv1JmXNLeykY8OgSzozpcd6DUf/oXVKvuXNosPCvHUFsukyhOLypxPGO1RJa
	rYudWsg496SAqIKVjMaD0Ew3li6dvtmvGjhfqDrVHUgRtvAMsc2HdEPsnGOyJ4+6nh/uk7u3G5EBA
	IsNiWVdQYZnpnkateC8u1Lc4bXm4enNUJWU3xrGCJ0+y4oPGX/d+qtp2PZufOf7KGjPhZIXmAWl3Y
	dbqoEyfPGc6XDz4IbOw1Ye9JvcD/uuXmMCaMNg9dnaIRFTf7lFJ3RzUV/KAm+RBuXap7+Fh+AEytT
	/HsnflS7K2gWyVk+CQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNjh-0000000Egkq-1gCS;
	Thu, 16 Jan 2025 11:08:29 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYNjd-0000000Egh4-1OLr;
	Thu, 16 Jan 2025 11:08:27 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CE54C120006;
	Thu, 16 Jan 2025 14:08:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CE54C120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1737025695;
	bh=BES/OhhMKjc97wzSQyQAF2VCFk2eOXC6N60v2GMAZjA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=rNDl0f3M7oNxpb7NiNfBpthMK8j4KKFsrj+eaMvqUIox4qFQcu/xo3u2mjto8das1
	 mqxZ5yzOh61woyAxHGOgL7WQjWVC46pbysSluHzht4kjg+dKJdypJfkyGDcFk1NWK5
	 nrPzuuuT3W6L/W50wgOl+arZ1691QtiT3mkBsebVbskKrl8jqcFYivpqyYN5AKQGzi
	 7Jr1vtJqC1+6F0ngZZa+I6+Grx9Z1fJC5G7wtNSM/73KI1/arZKEsgSCkhSgXuKuWs
	 QUElbFKw19We8rILooyjKJO8JRIT9zQtSrQti6GBkg8pYuJzE1sv9p7XIytVbeAEGJ
	 ZgIGi3yFq2FYw==
Received: from smtp.sberdevices.ru (p-i-exch-a-m1.sberdevices.ru [172.24.196.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 16 Jan 2025 14:08:15 +0300 (MSK)
Date: Thu, 16 Jan 2025 14:08:14 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Jian Hu <jian.hu@amlogic.com>
CC: Jerome Brunet <jbrunet@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: amlogic: a1: fix a typo
Message-ID: <23bwutgliz77mczt3p7iq3kewta2bam5lxnxr2ippvu2ckh6xp@nidq4xejefwq>
References: <20241231062552.2982266-1-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241231062552.2982266-1-jian.hu@amlogic.com>
User-Agent: NeoMutt/20241212
X-Originating-IP: [172.28.162.51]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190369 [Jan 16 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/01/16 07:50:00 #27039546
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_030826_035882_EAA4AACD 
X-CRM114-Status: GOOD (  17.18  )
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

On Tue, Dec 31, 2024 at 02:25:52PM +0800, Jian Hu wrote:
> Fix a typo in MODULE_DESCRIPTION for a1 PLL driver, S4 should be A1.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Reviewed-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

> ---
>  drivers/clk/meson/a1-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 8e5a42d1afbb..d71109b9bbca 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -356,7 +356,7 @@ static struct platform_driver a1_pll_clkc_driver = {
>  };
>  module_platform_driver(a1_pll_clkc_driver);
>  
> -MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
> +MODULE_DESCRIPTION("Amlogic A1 PLL Clock Controller driver");
>  MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
>  MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
>  MODULE_LICENSE("GPL");
> -- 
> 2.47.1
> 

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
