Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B805AE77198
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2025 21:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPPg1xpe2H1kR4BuP8bgekKj1vd+UlkofPn+sTtGBjk=; b=QW6bLuCwUPdki0
	1oQF9Sjzsc827AHaFCroU8RRykoS40v6AZDvXvGxrrxvOeUvKfphbXC13ySTYmfESI6c5ovpkbiGI
	+/mdYLrsAvaqVi8L5wlwTXSQqZLooz7j8IZfP3ElvRZ0o9GtvETuzfzoY4t377BphB7ItndlKdMyX
	EGFevmSHfCZAj/MchhyCMedPjySYRyk/wsK83ikVMEDpI/Oiv8pG8wQtFdZZ4CGal2rqTNqPiPnEB
	0tHHX3EQuZo4F5j7W3jNOhWS5pFPKyO2xkQ7u+s27zODRZo36PmBUH2S0DEvrDPN0wAiNHQ1U/fFf
	3fax9LzIDuVzk8KOG/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVHA8-00000006Ku8-0kIy;
	Tue, 07 Jan 2025 21:30:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVH8A-00000006KVB-0Wx8;
	Tue, 07 Jan 2025 21:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4837CA41D8D;
	Tue,  7 Jan 2025 21:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D23C4CED6;
	Tue,  7 Jan 2025 21:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736285332;
	bh=9JTWtxmIKmotgWm0DEXNnjWv3paAnOY9Sh2u7jIshgg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lNOREiXxKbHK4i+vCPPcnVixfcgh1t/e5X3+76pI1hEGUuHKnUv/Xino4G6LS7Gua
	 ViW2rEigU8+WOYTgxqI9q6qGUHKQ1voneHucW1nn3vmqFVQ2BckxffK0sbdaD+1V1M
	 1Kj19IsplJWa/LX8+HUGff6OemdkRypvZbRWC+TXY/D4mFRYcAfe/P1a4yOE4tdGFu
	 NWURHNO9Cl6OLMgdfP/sGfWDaUBR5D/t7Uh6pBP5o3bn8RleMDmfx6j5z/r7egtA52
	 KXsu6dEBSE7thmkN/ZPNvPQPvz6HeBleyV+YAagr8Qg6LvcYxTj/nKHyFyJxR59uK1
	 5hl2Fc8y5p9tw==
Message-ID: <697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com> <20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com> <9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org> <1ja5cp8f87.fsf@starbuckisacylon.baylibre.com> <88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org> <1jfrlwb69r.fsf@starbuckisacylon.baylibre.com> <ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org> <1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 07 Jan 2025 13:28:50 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_132854_225924_8BD153C9 
X-CRM114-Status: UNSURE (   6.00  )
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

Quoting Jerome Brunet (2025-01-07 06:46:41)
> 
> So, if it's OK, I'll resend this series with a temporary solution to
> remove tables. Removing the table simplify the other clean-up I have
> already line-up and avoid some unnecessary diffs. I'll circle back to
> reworking the init_data afterward.
> 

Ok, sure. Let's see how it goes.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
