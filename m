Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FABEB64DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 16:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dv9nmW+Mf+07pWD3Dkx/ePFofV1VdjK3kXj2JknlQKs=; b=GtQr7OJAzEauZy
	R84+j21DTkihQWWYLkTTK1aGMUEKr5RC23+Q3RfBJ7sS+eOYBsRH7XoNe3chAYDFJEzS/etR6mf8Q
	e3eIjDo2BxWD57P7iP1FEWwkx9sn7uZhf3PmWSVnMHeqNJzH2wOJVOIT2ZBttGtAsFXOalU24CMOc
	Nc80pjXluiQLs1c5tvrT5k0MQnTsc7uZm3gADoBlDKS3IlurPSSapJIcKfKPiK5HoE9VQsz7/6WBl
	wyQ7vznyq+nLtzGx+buojF7U7nHNxwXd+mhz0W44F2PRcwZ9cI5Q7EA0Ss5LFB0mP15Xt5j5jdIGr
	e8TAb3hhOvzXMhoXzPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGY2-0040MA-2q;
	Fri, 30 Jun 2023 16:00:38 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGXy-0040K7-1p;
	Fri, 30 Jun 2023 16:00:37 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 51004120008;
	Fri, 30 Jun 2023 18:59:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 51004120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688140782;
	bh=AiyUTaQfmfU+3VE/gItxQHz0hqpdNFW3IG8wVLoP4yk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=TDONc09uuAn5/UWTB1FWrYRyUvL7jmXbwYuwdSAbrBmKMbb1wfcUI9HyPEb6CBcIw
	 5LUEv9RmIIhvKc4ksj8gBqOdg0g9+KqzND3XXG52kUcLFjkcEMBiHL8SOpTO6jiolP
	 A/TNfVr7MHf+JBxqmmkKDADHkOpBSftaEMXpiCfZVxKOawYCJ3Z1aO+TmvBhhiAXpK
	 T9PBrLPKMapUG06U6iocsPHobeuSntZx1QIQrgXjJFyGLVi1tiYaN+bQfjkaMfXSwc
	 gLe+QxkogBIFGURQWDO2lq+J+oB7yITkG37w591xO4UaNJGFPvUpsxRXjDkk+m2F5m
	 On1WGeqxGffFA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 30 Jun 2023 18:59:41 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 30 Jun
 2023 18:59:26 +0300
Date: Fri, 30 Jun 2023 18:59:39 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: zelong dong <zelong.dong@amlogic.com>
CC: <narmstrong@baylibre.com>, <p.zabel@pengutronix.de>,
	<khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
	<martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<jbrunet@baylibre.com>, <devicetree@vger.kernel.org>,
	<kelvin.zhang@amlogic.com>
Subject: Re: [PATCH 2/3] reset: reset-meson: add support for the Meson-C3 SoC
 Reset Controller
Message-ID: <20230630155939.l2natpf5nbusjoq6@CAB-WSD-L081021>
References: <20230630121059.28748-1-zelong.dong@amlogic.com>
 <20230630121059.28748-3-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230630121059.28748-3-zelong.dong@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178380 [Jun 30 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;lists.infradead.org:7.1.1;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/06/30 14:28:00
X-KSMG-LinksScanning: Clean, bases: 2023/06/30 14:28:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/30 12:24:00 #21606311
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_090035_377044_C26F4B5A 
X-CRM114-Status: GOOD (  19.68  )
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

On Fri, Jun 30, 2023 at 08:10:58PM +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add a new compatible string to support for the reset controller
> on the C3 SoC. The count and offset for C3 Soc RESET registers are
> same as S4 Soc.
> 
> Change-Id: I65113f6a90545cd46015abf60b4bcb63fa148267
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

> ---
>  drivers/reset/reset-meson.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 13878ca2779d..ee1d5caf0ee4 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -109,6 +109,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
>  	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
>  	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
>  	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
> +	 { .compatible = "amlogic,meson-c3-reset",   .data = &meson_s4_param},
>  	 { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
> -- 
> 2.35.1
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
