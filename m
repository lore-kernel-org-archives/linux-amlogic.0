Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B922C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 02:53:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 276D5207DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 02:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="19jRFIfQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="DGxvlbCv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 276D5207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nrA/H3KqaogkpOKnl71aJ2YU1MidGDlm6xo3nZMOh6U=; b=19jRFIfQVRWD3FdAKemmkNQZG
	WgH39I+6KZVdZJ7wqp1gAtf9nIsesIGS3sHPYQITJYIKlS1VqBK5Fl7y/KBtWXdXU0sKSqFxLOwTc
	xHOaGwtelm01gQPZwLR6OO8Sz6DxTk/P+05e+nfuGPmIazc4ZH/XBMQrX/Ony8VZE0mcddqKpJNsv
	Wud/DULBvpIbfzqNNgWq95PNPdPlTPzgAkPPLCM+dfZjGi+ok8e0yjUpCeP7hO2pMzt1oHLWUqQEt
	01Z5xz+hUPoeGF3eUtKTVzcq81dy8mfglnBzTHyUwCwqfaoVBYhO00AmkzlaAq9tP17NwbEivmON9
	F127wG9PA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8xBK-0007FO-LV; Fri, 21 Aug 2020 02:53:30 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8xBF-0007DT-Lw
 for linux-amlogic@lists.infradead.org; Fri, 21 Aug 2020 02:53:28 +0000
Received: by mail-lf1-x142.google.com with SMTP id s9so207320lfs.4
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Aug 2020 19:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Wzatctpc+FvYoJ99XNB10sH67rwujcIhjY3BuCzGmho=;
 b=DGxvlbCvoNaXKOL43sWgecH+O/rJOe8W4VqpjFTJYxFzJBroPwv6ZW7nKDSZ9cXAE3
 XNV/WYUct8UNPtotuM5AqBb/psyW1ucP/6ChfXPdOyK67XVSz9pLhfkrViLGuRH+6jOs
 G/tFEYlVdK66gecWM6blGG07JniIdL56mxlmkXr2ODHNHAi11yDYQFZI3vuGgc2IFQns
 S/PMahcl3DrE60IYZGBc60MD14C5gbRplDkxJW7B7oS5cjBEshx669zny+WUpzTEe0HX
 1DM0Ib5EXEWOKDWYWaLTSSDjXtV+8r4kaLoQB3MCwPLTeDbdL9IftChcG57HMlOnWTjT
 IezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Wzatctpc+FvYoJ99XNB10sH67rwujcIhjY3BuCzGmho=;
 b=Xcdeaq+7VX7UARVZivg4mDLOT5Y94agHvjuigf8tRvdGJA8sxoVRDQxS7np7IGES8K
 xJKAfYFuyFJ3qo6sC2wKe9BRVkAwLD8eXpAkj6YnfKzbScoeD1gRZgUZjAftEMhIPRwR
 62lfJN+lkaGZDdpWtsUNgaNfS/1F/Oe+iwUF8DI8ZOCNHBHmtfepSXZPp93smO14P54F
 wpfH1B+vnZJyYtp6Cuet1dljYx+gePqOkzlJOoL8CaqiZLNTV0gQv/FcPzOi7q3ZoNXH
 oAR4YM8MJpT2ATte8dSTOUUqHVdEwrMpuWp9XlNbzm+MOSFLn6Ul+XAtxISbbt7OapmO
 K+VQ==
X-Gm-Message-State: AOAM532z4yv042WHFcHC3GPRzNhTUI4Udqm3yYS3lBp1Bs7zBLn/IEwN
 3W0KAoF7s7Mz13aZgTly/yfM2Q==
X-Google-Smtp-Source: ABdhPJx5BACHGdQcQmOu4crig7h0bACuVOhuDxlrNBnorAknrztXwhtNeu8pBf3h5iwfb1sTggzNHA==
X-Received: by 2002:a05:6512:3444:: with SMTP id
 j4mr350206lfr.161.1597978402213; 
 Thu, 20 Aug 2020 19:53:22 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id a12sm89140lfi.83.2020.08.20.19.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 19:53:20 -0700 (PDT)
Date: Thu, 20 Aug 2020 18:12:37 -0700
From: Olof Johansson <olof@lixom.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: Reformat PCI ranges/dma-ranges entries
Message-ID: <20200821011237.GA4527@lx2k>
References: <20200819221750.2055932-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819221750.2055932-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_225325_889337_619E9F42 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
List-Id: <soc.lore.kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>, Wei Xu <xuwei5@hisilicon.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 soc@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Li Yang <leoyang.li@nxp.com>,
 Tero Kristo <t-kristo@ti.com>, Robert Richter <rrichter@marvell.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 04:17:50PM -0600, Rob Herring wrote:
> While bracketing doesn't matter for a DTB, the DT schema checks rely on
> bracketing around each distinct entry. Reformat ranges and dma-ranges
> entries to fix warnings such as:
> 
> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges: [[2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576]] is not valid under any of the given schemas (Possible causes of the failure):
>         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges: True was expected
>         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges:0: [2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576] is too long
>         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges:0:0: 2197815296 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472]

Seems like a bug in your tool? Why would we bother with this churn?


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
