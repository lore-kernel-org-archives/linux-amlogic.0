Return-Path: <SRS0=Pllw=CH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABBFC433E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 14:18:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22654207BB
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 14:18:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AZ/ypRFN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NO0oFEsN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22654207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8SNo0sBsMVd/OpWGto/nlq7piHkmtmr0x/ADX5BU3w0=; b=AZ/ypRFNzX1Qv3iXA3T9eb3tk
	BPOmRJd1AUkj36PgsGVU+BEh7B3I02IhkvbeNDkToP9ELXfJzhdq6mA9opMQlRv0+sJugI0SQKAIl
	8N00ShGP6atPnQBS0qnYSWknuviTRJioO7UN1wWDcRj15o1/+xMtgfFNcUhp6Sc/vTHj0/2E7PiPl
	ahS0YHoewDbzIadImL7rFKPHmttx4LiPP0VkEG3Ddxy3HD3tQWgVTC7SwOFQhNEQ0I8JFLrd4S0Sk
	cUZteHWF4LNaYuGOk0RPTRstvqMX2yzrmK9OTbieBoTVhCB0Vz/ncZMC6FsyZ9zFpBwsGznozXLV9
	yyCZjaMJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kC1fy-0002nN-Gf; Sat, 29 Aug 2020 14:17:50 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC1ft-0002m8-Ul
 for linux-amlogic@lists.infradead.org; Sat, 29 Aug 2020 14:17:47 +0000
Received: by mail-ed1-x541.google.com with SMTP id w14so1643997eds.0
 for <linux-amlogic@lists.infradead.org>; Sat, 29 Aug 2020 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=amOnBJfi9C9nYboXm63qVHBbqoT3lf+3WJlMeeBljmc=;
 b=NO0oFEsNUOIozTzwin7bx10m1QgCrWmLDZCKWZh1Cao9Dg85oDsUq0oQErzGJrnctP
 ai6BUNALGJT3YsdlA+k/yBOFury6vWvHFM9h3OSzVXOGsDn75MQamhTOtU95+LWtKV+/
 NC1o6PUIWzuuZMa2P/WPJ8ifSicQMOzLf9z71T6Yd8NAE3UDSHYpWlNvmvSAeANIMH3h
 cT+FVc3CobbAWvhChigjqtFx7ydvLT9vEll6kA5P7Coxuudv93Q3cpGFjekgO40M9Z6S
 62QI2qZlLfju8YsJx6JBeILkUX/vcJL3sLja7GGON4L/8n++buABK1xf3vNRl+3FmcEh
 64rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=amOnBJfi9C9nYboXm63qVHBbqoT3lf+3WJlMeeBljmc=;
 b=RBeSfNmj1xizjtlSpmXumGgD5DhAUoBBtfVi0DwXWhC5wKSjHvv7kYBS1erXGUsAab
 XbmPVpBM1Ayhp56tufLzgSDygxw0ruADJ0lkc213RI+TpcB4agw/LDGGRGHKJtYJhXKV
 sQvRdAJVi5ufpM73XfKv9dNBwyiQPUEswxN4bhObGAwm96eOrmXvmKF8t5iFZDg6ofVR
 ghE1EGAh8GiiwTtwfs2OKcgC+XW5Fod2D/Ji4sNlBLD7untLQjMDwrG0ZBSW7K1tiN4M
 AjRvjajgfd4yDwR8O63MNIHGu7pd+n+7Cawvwcxz5r7icrzyUgD1vS7N0EF91cIjpM34
 4U2w==
X-Gm-Message-State: AOAM533Yt3BJk3doZ9GKnLyrph3JNbjGiYXqgLt5ru5LyvafWzblrCyK
 /6VSTA+tJi4jB8OdG6K3Uvl5wA==
X-Google-Smtp-Source: ABdhPJwUV7R9h5h3EzhI3+fJWwMDtkF/1M7RjuXWJIl/zWcdObJ3QWm9KpNnDHl+yqcFic4ZVAhXgg==
X-Received: by 2002:a05:6402:6c1:: with SMTP id
 n1mr3661175edy.215.1598710660247; 
 Sat, 29 Aug 2020 07:17:40 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id s11sm2217128edh.17.2020.08.29.07.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 07:17:39 -0700 (PDT)
References: <577e0129e8ee93972d92f13187ff4e4286182f67.1598629915.git.stefan@agner.ch>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stefan Agner <stefan@agner.ch>, narmstrong@baylibre.com
Subject: Re: [PATCH v2] clk: meson: g12a: mark fclk_div2 as critical
In-reply-to: <577e0129e8ee93972d92f13187ff4e4286182f67.1598629915.git.stefan@agner.ch>
Date: Sat, 29 Aug 2020 16:17:35 +0200
Message-ID: <1ja6yd7czk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_101746_159170_31F45824 
X-CRM114-Status: GOOD (  21.58  )
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
Cc: sboyd@kernel.org, khilman@baylibre.com, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 28 Aug 2020 at 17:52, Stefan Agner <stefan@agner.ch> wrote:

> On Amlogic Meson G12b platform, similar to fclk_div3, the fclk_div2
> seems to be necessary for the system to operate correctly as well.
>
> Typically, the clock also gets chosen by the eMMC peripheral. This
> probably masked the problem so far. However, when booting from a SD
> card the clock seems to get disabled which leads to a system freeze.
>
> Let's mark this clock as critical, fixing boot from SD card on G12b
> platforms.
>
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Tested-by: Anand Moon <linux.amoon@gmail.com>

Applied Thx.

> ---
>  drivers/clk/meson/g12a.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index fad616cac01e..6d44cadc06af 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -298,6 +298,17 @@ static struct clk_regmap g12a_fclk_div2 = {
>  			&g12a_fclk_div2_div.hw
>  		},
>  		.num_parents = 1,
> +		/*
> +		 * Similar to fclk_div3, it seems that this clock is used by
> +		 * the resident firmware and is required by the platform to
> +		 * operate correctly.
> +		 * Until the following condition are met, we need this clock to
> +		 * be marked as critical:
> +		 * a) Mark the clock used by a firmware resource, if possible
> +		 * b) CCF has a clock hand-off mechanism to make the sure the
> +		 *    clock stays on until the proper driver comes along
> +		 */
> +		.flags = CLK_IS_CRITICAL,
>  	},
>  };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
