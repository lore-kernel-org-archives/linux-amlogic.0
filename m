Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78514C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Feb 2022 15:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUXIsMDLTKBStG6Tb2Qnqio0xlLpQMrySDbIZIN08L8=; b=cG9CfAXHlLRZ+I
	HtuMVEe1MM7v3BZwmzs2Tr14Qwlk6doxxOhN7Vkwwebi6RAT5GzeK0g4GZR9rwcpzCSxbfUooDGJY
	hD673sN8dkvof2uwdBNRIYL3EgXOIUO0ocieokC2cocCZ+NJHF5eziaAqRKLkY+UOqSGwFB+dbB3l
	WrTGSAW2x2yzj5sh4XaIMdKC5Jwr5+H8y6mC4AtrLAtBRvb1cFp+xG0Ne53zqj0pyN4BxJiJQCZEV
	HjtWsqTacJ4epkgsrYwCmhKm2tbZshZFOuLGBvqHaL5cX5aIAUPvAhEt99aItku2hSD1G3apcp0AR
	wfj+TKtspkJmnu+G800w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFHjQ-00G1oJ-MU; Wed, 02 Feb 2022 15:39:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFHSR-00Fxqd-0C; Wed, 02 Feb 2022 15:22:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A6CF6159F;
 Wed,  2 Feb 2022 15:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113DDC004E1;
 Wed,  2 Feb 2022 15:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643815325;
 bh=OTLXgwve+GXUKqJgusIix6IvLJEmARJe1ZPe1Wk9IxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UxdeogQjte72mAnF7hRypZPI8xAbel7BrvRvPRlt1nfnufzyW07t/bWcHBqQ+cWPm
 Gfc7wtq1yWuM2Uxpn/bNERIJOeOvPeaoI++xw+q2x8VrjZqBmySMQSBjFDba9IJcW6
 +cwWNGtZFw79R6zllZHcbqxZrAX74luFmU3CzYCl7aa1qHcw4b+lbh8fH1pEj+uRAU
 UT0vNpdnpUacazhAij3sM8PDYaMhN6cYmFT54tdjOiJqYFz5AdKJ3TUpuMoCMpyKBE
 UBR1KsMFehen3PYeGvOFkAHjM8IfDBW3goWi6ZgbHxbfzVlmxlK6r/uhtmXJ5WFkHG
 QBJj61DDUrK7w==
Date: Wed, 2 Feb 2022 20:52:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Wyon Bi <bivvy.bi@rock-chips.com>
Subject: Re: [PATCH v4] phy: dphy: Correct clk_pre parameter
Message-ID: <YfqhmSEL8Jym8FhA@matsya>
References: <20220124024007.1465018-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124024007.1465018-1-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_072207_140767_96926AA3 
X-CRM114-Status: GOOD (  15.95  )
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

On 24-01-22, 10:40, Liu Ying wrote:
> The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
> parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
> kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
> mentions that it should be in UI.  However, the dphy core driver wrongly
> sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
> 
> So, let's fix the dphy core driver to correctly reflect the T-CLK-PRE
> parameter's minimum value according to the D-PHY specification.
> 
> I'm assuming that all impacted custom drivers shall program values in
> TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
> specification mentions that the frequency of TxByteClkHS is exactly 1/8
> the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
> custom driver code is changed to program those values as
> DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE), then.
> 
> Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
> Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
> as I don't have the hardwares.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
