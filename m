Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7496C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 19:23:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABBC8218A3
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 19:23:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JLPS8WKz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C++bXdVV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABBC8218A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/K2A+MJU0OLDnbVpXUSENGApJV4LdBnTCnSmanAjeE=; b=JLPS8WKzmtq0Qe
	kdisDM5Z60REC/xPdMOIiFxuQYhnmHpGwNNuqr/emzU/Ih2j3jukNwleN3NPOswLM95+aJD42N7n7
	GhIUsJc8XSPSb+FeHkibzz/5L07O2ypS2XS3BAPqgYi2i5o+9rFpAyLdQaumNGTS+kWhvVCc+83N8
	+K09y5zRkhADZ+84Xr6U+poqiDTpBtl8St95KiXHsXP8zMWJdA/RYT3JzOx4c7WTH8Tb6HA29CzpN
	l0jU1KhXswJVCmssJpuxpIf2gveJxC+HqzL7i12X9KwzhADjLh7CvfbIoetbPe1tfWzrol4yXQ4Mj
	1MvSaRjBGj4VbuGyS2ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9x5o-0008CA-MC; Fri, 29 Mar 2019 19:23:08 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9x5m-0008Bd-9X
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 19:23:07 +0000
Received: by mail-wm1-x343.google.com with SMTP id q16so3625406wmj.3
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 12:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mE+quAYUTiBPxPD4hMDVHlGR0840XRh3EfzVkflT7e8=;
 b=C++bXdVVDbYcDTB5XHgf9IO7rATmVn863NlR34EciYggfX71xk1F8wzrJHSeWxSIKP
 KYE+FJfxe8hII5ZUThLsXII8RuwcOsGSnZSh6yWdm6x8qHuz5yWnTOeAF6t1fR/NvGGh
 z95PH4RG1wzfySyUTbBWqZWgPfsryvkJ41foJEe8Q45oXguhqDmm8hmbX4zPRb5snlPW
 i5RFDB2NZJNSsdRimAy2D6KPy8UaC0tyr8BBWIjuvTzIoyPYs3CKZQqy3a1QC0W+ESAw
 MuQi83gKsV60zsSvWTiHnX+CE537ztUpHHo+1p05nBnofOLYhxIfQlDW4rC4Cr73/Bl8
 lp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mE+quAYUTiBPxPD4hMDVHlGR0840XRh3EfzVkflT7e8=;
 b=Sbk6eDyVsZpTx9t5XC6v2Nv4d9YQYu0XeL2JRDiXhCj1bQlHQ30/TBVETm80TX2bFe
 oTekkzHmhwUuFqpoK8brtjetItmkXroNgz/U9OnX8AcL/VHGRSGLBTZ/CP1rIobzjCYM
 fWyXLZsz8iwpiFHKlbvuPwFqAcMNuTIEyWWBl2M+wimgrVdTCNM3bcemKpT1LR8LCQ5r
 Y+gMQ2IINw2HY+qckYEpAZiejCdM2o4pXRbUlcdYdj0T8yrhwcNQ4X92ZQzsufWoyqXq
 H8mhR4/LSC8lKMTf84gfevUyI9caWsex4qHjeN1f0QDUnnBEJAIYewMkXs9+zAVGGvHo
 7Qew==
X-Gm-Message-State: APjAAAUsFPE8kTIZjcx5yiayQ7OK9KqrdrC6sGjYTbcViATkmDP24Ot7
 tFyo92AVDNolCkIZzJ2W7N4=
X-Google-Smtp-Source: APXvYqxEMY7NJai9SGMRR0vSHvw9m1wzPYypu73nYVNGaWryR1PG/2y1bY/FUR46j6z2A1d55dVujQ==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr4837410wme.26.1553887384327; 
 Fri, 29 Mar 2019 12:23:04 -0700 (PDT)
Received: from ?IPv6:2003:ea:8be1:dd00:a991:cc44:5157:9e5?
 (p200300EA8BE1DD00A991CC44515709E5.dip0.t-ipconnect.de.
 [2003:ea:8be1:dd00:a991:cc44:5157:9e5])
 by smtp.googlemail.com with ESMTPSA id e16sm3985597wrs.0.2019.03.29.12.23.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Mar 2019 12:23:03 -0700 (PDT)
Subject: Re: [PATCH net-next v2 3/3] net: phy: meson-gxl: add g12a support
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>
References: <20190329141512.29867-1-jbrunet@baylibre.com>
 <20190329141512.29867-4-jbrunet@baylibre.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <0b7df4e8-8db2-a028-bd1d-6d77cac67110@gmail.com>
Date: Fri, 29 Mar 2019 20:22:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190329141512.29867-4-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_122306_355062_FAD91E7E 
X-CRM114-Status: GOOD (  17.11  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 29.03.2019 15:15, Jerome Brunet wrote:
> The g12a SoC family uses the type of internal PHY that was used on the
> gxl family. The quirks of gxl family, like the LPA register corruption,
> appear to have been resolved on this new SoC generation.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/net/phy/meson-gxl.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index 0eec2913c289..49cad0f4c79b 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -237,11 +237,25 @@ static struct phy_driver meson_gxl_phy[] = {
>  		.config_intr	= meson_gxl_config_intr,
>  		.suspend        = genphy_suspend,
>  		.resume         = genphy_resume,
> +	}, {
> +		.phy_id		= 0x01803301,
> +		.phy_id_mask	= 0xffffffff,

Here you could use the PHY_ID_MATCH_EXACT() macro, see realtek PHY
driver for an example.

> +		.name		= "Meson G12A Internal PHY",
> +		.features	= PHY_BASIC_FEATURES,
> +		.flags		= PHY_IS_INTERNAL,
> +		.soft_reset     = genphy_soft_reset,
> +		.aneg_done      = genphy_aneg_done,
> +		.read_status	= genphy_read_status,

genphy_aneg_done() and genphy_read_status() are used automatically
as fallback if no callback is defined. You can omit these two lines.

> +		.ack_interrupt	= meson_gxl_ack_interrupt,
> +		.config_intr	= meson_gxl_config_intr,
> +		.suspend        = genphy_suspend,
> +		.resume         = genphy_resume,
>  	},
>  };
>  
>  static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
>  	{ 0x01814400, 0xfffffff0 },
> +	{ 0x01803301, 0xffffffff },

Also a candidate for PHY_ID_MATCH_EXACT. In the line before
PHY_ID_MATCH_MODEL could be used.

>  	{ }
>  };
>  
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
