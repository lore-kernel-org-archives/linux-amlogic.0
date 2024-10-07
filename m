Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3671CFB43F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPsirzIJS819L6TZHVGTQOkd0WXPX5ghffmI08Ri/nU=; b=oft/LXVwBgVmWB
	xiKmbHwzZSdCEqaivG6K5H8E00DqbzH78Oj0yTS0wKi3jCO8DiDIdBHKTDvBgL8ywk7W/wRaNoCbN
	uNrxsxWKOMjZI0S7QapUakynCvDm/M9skg98HczR74JwqwnotNN85s3mgD6ejNn0LrN3TFdutjPyY
	IEzLayrDzWHtXp5wBebpyfy55Z2ekP/uVeCQvHySLPZDknENcr4nPaCw7J7f4VBwPp1GfDaM2g7Vy
	Vz2/8OxTEWkeF/xU4bytAbFTXVgcEAW9sWliPrE6HCYXwRmpE5RFsGJpDGyTWBXFAcZmyBA7q9hBB
	MLNXVpCK55WSxeEq8Rlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjID-00000001nrB-1ZrF;
	Mon, 07 Oct 2024 08:40:37 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjFd-00000001nAo-0EGz
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 08:38:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sxjFT-00008l-7N; Mon, 07 Oct 2024 10:37:47 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sxjFS-0005N3-9U; Mon, 07 Oct 2024 10:37:46 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sxjFS-000BeK-0i;
	Mon, 07 Oct 2024 10:37:46 +0200
Message-ID: <21c65903b243b677d8e84c84acf89c93a45ab1e5.camel@pengutronix.de>
Subject: Re: [PATCH v5 8/9] reset: amlogic: split the device core and
 platform probe
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jiucheng Xu
 <jiucheng.xu@amlogic.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 07 Oct 2024 10:37:46 +0200
In-Reply-To: <1jsetcro5n.fsf@starbuckisacylon.baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
	 <20240910-meson-rst-aux-v5-8-60be62635d3e@baylibre.com>
	 <8cb81058c8f45e378675e078e296336a2cf74308.camel@pengutronix.de>
	 <1jldzwkpsu.fsf@starbuckisacylon.baylibre.com>
	 <01aff9c0f129f8c1cf41c7ae53dac38048aa34a8.camel@pengutronix.de>
	 <1jsetcro5n.fsf@starbuckisacylon.baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_013757_157978_8A1E6ED0 
X-CRM114-Status: GOOD (  10.47  )
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

Hi Jerome,

On Fr, 2024-10-04 at 15:30 +0200, Jerome Brunet wrote:
> On Mon 30 Sep 2024 at 18:56, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> 
> > I've applied them to reset/next them unchanged, at:
> > https://git.pengutronix.de/cgit/pza/linux/commit/?id=5b93105afcdc
> > and sent a follow-up patch to fix the alignment.
> 
> Thanks Philipp.
> 
> Would it be possible for you to tag it, so I can pull it the amlogic
> without waiting for the next rc1 ?
> 
> We have couple of changes pending depending on this.

Stable tag at

  git://git.pengutronix.de/pza/linux.git tags/reset-amlogic-aux


regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
