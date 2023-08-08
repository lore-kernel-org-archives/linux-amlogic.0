Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0012C04A6A
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 13:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vdpXerMlQ57qF0oBAeSQvi4/2o9kpxzDUGHlKDZH/A=; b=uPh7BxDDNIT+bq
	xmHy0vZKAUGAJpCJgHmnIVa+fDLglhXjDp3KaCXVoXH9iSxG5aNwsULlNt92z6Ma1mhtFvrMC79AN
	qILc+VyoQxCZvcLqQDXjaVsfWdlVLFFbMY0bBJ3W+HHPZcelgqNN+CP0+v2yDfjLlozDtcat6BtxC
	hiHPZoH3X1Rk1RpGe7eithTrIhArUZsjpwix65mqeOLey5yradfe02qEpUUcARu/e96JgFXazZdaP
	OHDuLefvAaccvdeuu4UtbENJT/xXyF5Yu5sjPRLCvTei8I11LoAkIqbIJMxXhlW+yTLIA4ttcVO8r
	TyIm+9QGScBmARSF+/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN3e-002hDw-11;
	Tue, 08 Aug 2023 13:47:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTN3Z-002h9J-18
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Aug 2023 13:47:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qTN3W-0007wV-JR; Tue, 08 Aug 2023 15:47:26 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qTN3V-001zo4-N6; Tue, 08 Aug 2023 15:47:25 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qTN3V-000DX4-0q;
	Tue, 08 Aug 2023 15:47:25 +0200
Message-ID: <8e30ed61bdd8a634a39932c869af76da0cd7687e.camel@pengutronix.de>
Subject: Re: [PATCH] reset: meson: remove unneeded call to
 platform_set_drvdata()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrei Coardos <aboutphysycs@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, 
	khilman@baylibre.com, neil.armstrong@linaro.org, Alexandru Ardelean
	 <alex@shruggie.ro>
Date: Tue, 08 Aug 2023 15:47:25 +0200
In-Reply-To: <20230807105400.11560-1-aboutphysycs@gmail.com>
References: <20230807105400.11560-1-aboutphysycs@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_064729_421673_13DBCCC7 
X-CRM114-Status: UNSURE (   9.46  )
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

On Mo, 2023-08-07 at 13:54 +0300, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Also,
> the private data is defined in this driver, so there is no risk of it being
> accessed outside of this driver file.
> 
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>

Thank you, applied to reset/next.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
