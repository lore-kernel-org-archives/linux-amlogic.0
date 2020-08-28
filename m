Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2ECC433E7
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 13:42:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD85720825
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 13:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vRLCJJNV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G5ldVFyP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD85720825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cLpAvvZCxptk8ohaVD2nQapIlRY0r9frB90tugyTwxM=; b=vRLCJJNVEKYdahbWCWq0NCkps
	qZyFFyqFK4DFn3JUZSOFVppXMYNb0ktSvmD6FhOgaUGPOJ1/ISZsj2yAUlxHjjBHY22Eyhy3xtkWW
	keXXhfYCSVm+B9YqT+SU3JThaOawhskh+hkla0lxN311J8FAHZ3+mi3Q5aKOghJdGc+yZlNXqEW7l
	t//cUqSNGoL7u0s9ZB/ZVrJ7DBsWRdAOPo2Em3lgdMdHPv1jnoqjUq2Jk8gPaK2XSUu+0YXoldvrH
	4857GZGlg7UZdBqZZvFkagoFBe2S6EA/Qn3WT9zdfQOwpc0nW6XJ5v3rvvG492odZk97LI1ZQ/gCH
	miNjY8tBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBedk-0000Wn-KE; Fri, 28 Aug 2020 13:42:00 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBedi-0000Vk-Gj
 for linux-amlogic@lists.infradead.org; Fri, 28 Aug 2020 13:41:59 +0000
Received: by mail-wm1-x343.google.com with SMTP id o21so966510wmc.0
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Aug 2020 06:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=PlKhaukYosONnLRa/HMOIn8Ab+6xHhpFAWIiWSmABu4=;
 b=G5ldVFyPK11BLqtsAWgo5XKpAM1Mr5Ov0xHlog/sjfM8VfiVO72KS0bUCXS4s1DGur
 t6NrmCvzCbu80s1bw2iZjCY7Xsmds8d+/fcE12qI8RXSTMIDnJnfANa64sR+cmBH9MBH
 p89rHAqpcEiQ2FeQzSBN6jswn7G5ge+kmPJmfp0dQEwssNxt/OX6YQ12QYp7LekWWnXJ
 JzDewihMOHksjxrXK5v6SRUetqe9jt3VDx+ynzYKW0J5vLT+AmrL0MOZX7IAc7GBQmXF
 RzU0pTTVaS0p+4eAHDufaYbS6wdLpp7cPpkWREChKItwQqY8wflBgsqRLY5BGH3DS8vo
 XFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=PlKhaukYosONnLRa/HMOIn8Ab+6xHhpFAWIiWSmABu4=;
 b=uk/wDlwrHIzfS1/PrEZw1CrYzWu8foYkaLA5pRQP3UYd3LxRn+km4GhpAZ/w28EvmL
 MV+EOttNWQtni3UyhdQOPBjxcvC/QH4D8+cJ9iTaWo5L13kTKZq5ulEHjYNgf2qTV5k2
 smosCzod3jcdnvIz8trdwlMD1vuNR1oGR47nzT2QBxjwXC7xX0XTNEziMVAZBOZ9qTr2
 bEEXDMhjUrLorpZe6I+8xpjZPx2GfJ9hChgx6YXdliJQh75dPBEdIX7gIxLX+1CxTXzM
 T9QdeXKmlBAmB5K7MBIXVJln5yyRDyBVn+IjJHngPZSrgrZHzYYNb/LHmWTnmni3LeNx
 mj/Q==
X-Gm-Message-State: AOAM531QDqz27q4q/mZo+jb7wHdyUSeQ7Vbxr22tdC/uhYjB9mJCPOy0
 Vcb6OvLlZlH/VpasMQC96U9SIg==
X-Google-Smtp-Source: ABdhPJw9rWugJDCUBnw255eYKA2/3pk957bjgTD+s607Bpq7K2FxICIbUOkkHg0aQik7x0lb0qmZXw==
X-Received: by 2002:a7b:cb4e:: with SMTP id v14mr1780898wmj.140.1598622115510; 
 Fri, 28 Aug 2020 06:41:55 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m1sm2224353wmc.28.2020.08.28.06.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 06:41:54 -0700 (PDT)
References: <CGME20200828130714eucas1p26b45e68ee12ca6c31b0ebe62bf699ba7@eucas1p2.samsung.com>
 <20200828130707.9045-1-m.szyprowski@samsung.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: meson: g12a: mark fclk_div2 as CLK_IGNORE_UNUSED
In-reply-to: <20200828130707.9045-1-m.szyprowski@samsung.com>
Date: Fri, 28 Aug 2020 15:41:53 +0200
Message-ID: <1jh7sm7uqm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_094158_692371_F5A45777 
X-CRM114-Status: GOOD (  18.99  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin
 Hilman <khilman@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 28 Aug 2020 at 15:07, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Add CLK_IGNORE_UNUSED flag to the "fclk_div2" clock to fix boot hang on
> the Hardkernel's Odroid N2 board (with bootloader booted from SD card and
> kernel loaded via FTFP).
>
> It looks that this clock is disabled by the generic unused clocks
> scanning code before it gets enabled by the meson-gx-mmc driver.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Without this patch the only way to boot OdroidN2 board with mainline
> kernel is to append clk_ignore_unused kernel parameter. I've build the
> kernel from the default arm64's defconfig. The kernel is loaded via TFTP
> using vendor's u-boot.
> ---
>  drivers/clk/clk.c        | 5 +++++
>  drivers/clk/meson/g12a.c | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 9803d44bb157..4106b6231be4 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -298,6 +298,7 @@ static struct clk_regmap g12a_fclk_div2 = {
>  			&g12a_fclk_div2_div.hw
>  		},
>  		.num_parents = 1,
> +		.flags = CLK_IGNORE_UNUSED,

Hi Marek,

I just received another patch making this clock critical which I'm more
inclined to take. It should solve this problem you reporting as well.

In general CLK_IGNORE_UNUSED is not best way to address these problems as
a particular race condition (with probe defferal for ex) could still
turn the clock off ... which is apparently something we can't tolerate.

Thanks for reporting

>  	},
>  };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
