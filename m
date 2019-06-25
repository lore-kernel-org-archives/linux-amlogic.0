Return-Path: <SRS0=SHiD=UY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FB0C48BD5
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2019 20:27:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A047208E3
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2019 20:27:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oJE8wy7z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGnMUm36"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A047208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:From:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyM7rBM+AyZ74Wp1odc8syCULwzgX/VKJEZiuNwQRek=; b=oJE8wy7zxLrGsL
	s+3F/KP8Kog9NSozHqTGXQi2pL/6iwIfGz/iAGCBHjfBGc725VsFKZ4afN9ma2V95XCPmarLEEtcW
	zmyjdb1NsmIc8heFGFVlqpPvgZTJvj4O96zGTztc7oMAYIbboBMn3tCbeFnHwUeiSE4CZIojdCZRb
	ZY2dQPWKlnUHdhahq93okZ2yiBpgPBPxNS+qEDrvzQKLoPE1OYxAVBzYqubUHh7YmZvVwvHvgLHm2
	7SBanILUHfXdG9DJtOjqtbgEeI474TAYUdBLl/nty+1YbWGb/mPTWl5tdHO7KTckUGZepYP0Z3dFr
	KFpZenbFeult0IHm4xrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfs1y-0001yr-1X; Tue, 25 Jun 2019 20:27:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfs1v-0001yB-8L; Tue, 25 Jun 2019 20:27:04 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9A9B208CB;
 Tue, 25 Jun 2019 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561494422;
 bh=4DjDMXCFMiEPojnFZTh8l0f8w6EVPLy4ezbvE1XggGw=;
 h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
 b=HGnMUm36tBd89ZCYMpakSYGFEW5Ra8p8ujQXGTZBj7wplR2/DDy55cLSCmDONvdHY
 zvRbTWOTcuq+e3106aW7m2laV8C4uUGsBk5uzvJeZKwhWPPPmBSq+savdLyIs9SkPO
 50vQuTR/sLQeXqmcCO0A4QBjA4XFwhvT87/QcdKc=
MIME-Version: 1.0
In-Reply-To: <20190620150013.13462-6-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
 <20190620150013.13462-6-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC/RFT 05/14] soc: amlogic: meson-clk-measure: protect measure
 with a mutex
User-Agent: alot/0.8.1
Date: Tue, 25 Jun 2019 13:27:01 -0700
Message-Id: <20190625202702.B9A9B208CB@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_132703_314974_09C18E43 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-06-20 08:00:04)
> In order to protect clock measuring when multiple process asks for
> a mesure, protect the main measure function with mutexes.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/soc/amlogic/meson-clk-measure.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 19d4cbc93a17..c470e24f1dfa 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -11,6 +11,8 @@
>  #include <linux/debugfs.h>
>  #include <linux/regmap.h>
>  
> +static DEFINE_MUTEX(measure_lock);
> +
>  #define MSR_CLK_DUTY           0x0
>  #define MSR_CLK_REG0           0x4
>  #define MSR_CLK_REG1           0x8
> @@ -360,6 +362,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>         unsigned int val;
>         int ret;
>  
> +       ret = mutex_lock_interruptible(&measure_lock);

Why interruptible?

> +       if (ret)
> +               return ret;
> +
>         regmap_write(priv->regmap, MSR_CLK_REG0, 0);
>  
>         /* Set measurement duration */

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
