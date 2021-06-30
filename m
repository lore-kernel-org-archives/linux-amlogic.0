Return-Path: <SRS0=U8YT=LY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02660C11F65
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jun 2021 18:39:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2C8D61424
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Jun 2021 18:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2C8D61424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGpqE8wVVvMgfEG/kX8d61ef06yFjN6IlO6jat3X+7o=; b=Vcstme0Tcle6Dz
	xkJN5Syqlk/z+y5kDNJw35T18ViCiJGfcbBPkpV5ZWUxJDpCgP7kRnoDAKWLEmbYpPIhY4qqKULvg
	wcnK1elWQRCfF3OIXo/LuNBKFl/rwXbQVPAkFOqDZLm5w2jIvWBXVB5PjU0GTJfdNPwvx+twg87aF
	1/bAqZTdZK/H26elYdWMxXaQDARtfUPNg8MYCKxE4B3N6p2O4Six8zcU79DQzFaC/SOe1Y0DW6shb
	sLiN1KAk7kku46roCa+ikTGnOWV+hwj7Y1uTlZlvfg1OqxMkf2Ho3Q9QxcMDde4rcY7bqYtD/Gvxg
	YYG3Wk+/LnmzO+J8mz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyf7j-00F0tm-Am; Wed, 30 Jun 2021 18:39:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyf7K-00F0mV-Hw; Wed, 30 Jun 2021 18:39:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A99261419;
 Wed, 30 Jun 2021 18:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625078362;
 bh=idOYvZck+DrSLfwpxZjyNucc8Z4zRCEV7i4OiE00mHw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OKbcXhEYgw67/4s2FV9HOv4T8VnTrQKK3dsRGn+TQYIg3CFB5kqje78EJd4V9dwqs
 9D8Crg9hgCntA8/lqGvBSHuUNgrsdIdfT1TAoVHDrYnCFJFcX+xMf19ZlC3hTAawbA
 1NVtNNtUOC02KeVztVpkhd0B/tGlzKDANCi/X/IqpfUIHXVaaAv9hqn/V2bmMYu8cq
 K6sgzG3+2wrE7o5NC3WWEcytAnP1tFz4Fh463XuxwKEwmoW5xTDPSEvaPcmMtGyiEm
 2P8BLWStjem4nNFxsGZ/XOf8U9tRG1VfjHKYt0xbjGjx0oRoGY5Z/e/CAw1F02oGi+
 n6oXlha5fVxhw==
MIME-Version: 1.0
In-Reply-To: <20210627223959.188139-4-martin.blumenstingl@googlemail.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-4-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 3/3] clk: meson: regmap: switch to determine_rate for
 the dividers
From: Stephen Boyd <sboyd@kernel.org>
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Wed, 30 Jun 2021 11:39:20 -0700
Message-ID: <162507836069.3331010.6408437361041793201@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_113922_655994_88380DDB 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

Quoting Martin Blumenstingl (2021-06-27 15:39:59)
> This increases the maxmium supported frequency on 32-bit systems from
> 2^31 (signed long as used by clk_ops.round_rate, maximum value:
> approx. 2.14GHz) to 2^32 (unsigned long as used by
> clk_ops.determine_rate, maximum value: approx. 4.29GHz).
> On Meson8/8b/8m2 the HDMI PLL and it's OD (post-dividers) are
> capable of running at up to 2.97GHz. So switch the divider
> implementation in clk-regmap to clk_ops.determine_rate to support these
> higher frequencies on 32-bit systems.
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
