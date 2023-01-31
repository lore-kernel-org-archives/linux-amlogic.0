Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D751C38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Jan 2023 21:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gPuk6Ir9HZwoy3dteD9esxz3j0gRTB7ePD/xqMM/fA=; b=aUogRpqdmuLN3v
	WA5/3AA3NIPqNFUU50wKH8YSPj7ajZIIdp+kMH3a/ZnRgbupJmgZyJUmgBmmfhAZHlpDHLosnW2e0
	8Aj1fYl07fR8vJwumKeKXF8g1YeAXM+xNdIqHNDukkRsfkcaj0dcegMNetdWzBagq6YGBSYagUBCX
	y2QhKfaxOA099ehZWWzNMBvEIsxLCOR9cM66xZiV8tnnLf/OHvwFvifGotp3pUt2Lla4J5fNvuSJN
	f1Hhy6xH58eKzox6XJpfOCwhoA6MJBbR7G0Qkh1ns0eN5gLtsyIfTb/6iue79ccqQ0nUkSrtW8n43
	JZi6O7Fo4pehOd8gJehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMxqi-009M1v-T1; Tue, 31 Jan 2023 21:07:28 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMxqX-009Lwe-IS; Tue, 31 Jan 2023 21:07:18 +0000
Received: by mail-qt1-x834.google.com with SMTP id bb40so7331477qtb.2;
        Tue, 31 Jan 2023 13:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/KqgwUuD6mK0GVS8xfEzdupirXdhuWEOYQhCcJjWt0=;
        b=EqWGHeWRFp8XjnLvnazZTVEUTHPSWL0ARQAYn3yYMsrF3mQBidAAymu1ITaNd0iqmy
         6qxPKawzm39shUAFkotz6jLJUidSTV8vH7izshr0aL6x1mcp6efUo0DZ3LVuV67SplnQ
         jDRc6RJCZqnz4sMj7OcSH7EsHoiu7wNt7rrEMxJ287wIQxn8NveeLaQO60fPk4USs6dp
         b1bHi96heuYwHo1Gkwtw+fPdIByopbC6jWKuMDjmwHj91L3Q6pfkpr6OjqsL1yT9kpSi
         3Ews9e1Yoq6hpYug7pfS5+WlbCH3BbrAvbA6Rkr/9szg1tfeHWxNPbRhWKNhVl4ZyXmt
         VSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/KqgwUuD6mK0GVS8xfEzdupirXdhuWEOYQhCcJjWt0=;
        b=weOuHPfgxE0GF67tejSmVxPp9Aj1myeWC4bgUU8z5I2DPyWYJWqxohxI5Jfyvr1w4c
         SpsXjJxbK6kVtnpipLweKzqYvtgBuMMUEY2oCMlB8x3+tnLEheBA+8qf1W8le9KorlWU
         zFhiToCjtuMQYvNCdnCJq5K4h+cYwjjRnf2SvMb/wowLKenMPG7qTbKLq1yi0DZPBS/G
         HbDXqOrBR01cPZuVRh2KBJZ79Q8p7IzFyZmvrPjGcw3mTkvTVG4DvOsgAxxmE6uyzK+3
         rk85dPqoFtmFNPAc6A9NvNCahz873/s7ycVD1IX6UUxTphEsLI5LCFEuCp4gotHO2Agu
         tVLA==
X-Gm-Message-State: AO0yUKXU2QnZSofyviMutmT/ArHPt6kSaD+xpphfxE2fwLheCOGl/sgk
	tW1YZ2CXfEiFhyPdY8oOuBoEgaPu2RtGjKqpf4Y=
X-Google-Smtp-Source: AK7set+Ss5s/7XhPJzclS8DScwaEh2tHZ/WCC6FLbKvN+95Wi0oqZfK6+WbRLftp8YhzEzeGGUF6Iqv4RqVS/i7KtWk=
X-Received: by 2002:ac8:5e10:0:b0:3b1:c62b:c140 with SMTP id
 h16-20020ac85e10000000b003b1c62bc140mr9670qtx.313.1675199234580; Tue, 31 Jan
 2023 13:07:14 -0800 (PST)
MIME-Version: 1.0
References: <23ecd290-56fb-699a-8722-f405b723b763@gmail.com>
In-Reply-To: <23ecd290-56fb-699a-8722-f405b723b763@gmail.com>
From: Chris Healy <cphealy@gmail.com>
Date: Tue, 31 Jan 2023 13:07:03 -0800
Message-ID: <CAFXsbZpUdfkxxnH3Ex5BUmvnxJYP-4wQ2Ai7Wrvf-O7KaPF-aw@mail.gmail.com>
Subject: Re: [PATCH net] net: phy: meson-gxl: use MMD access dummy stubs for
 GXL, internal PHY
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King - ARM Linux <linux@armlinux.org.uk>, 
	David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_130717_666254_F3337A4A 
X-CRM114-Status: GOOD (  15.10  )
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

Reviewed-by: Chris Healy <healych@amazon.com>

On Tue, Jan 31, 2023 at 1:03 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Jerome provided the information that also the GXL internal PHY doesn't
> support MMD register access and EEE. MMD reads return 0xffff, what
> results in e.g. completely wrong ethtool --show-eee output.
> Therefore use the MMD dummy stubs.
>
> Note: The Fixes tag references the commit that added the MMD dummy
> access stubs.
>
> Fixes: 5df7af85ecd8 ("net: phy: Add general dummy stubs for MMD register access")
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/net/phy/meson-gxl.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index c49062ad7..fbf5f2416 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -261,6 +261,8 @@ static struct phy_driver meson_gxl_phy[] = {
>                 .handle_interrupt = meson_gxl_handle_interrupt,
>                 .suspend        = genphy_suspend,
>                 .resume         = genphy_resume,
> +               .read_mmd       = genphy_read_mmd_unsupported,
> +               .write_mmd      = genphy_write_mmd_unsupported,
>         }, {
>                 PHY_ID_MATCH_EXACT(0x01803301),
>                 .name           = "Meson G12A Internal PHY",
> --
> 2.39.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
