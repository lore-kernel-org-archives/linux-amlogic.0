Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E791C7EE25
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jun 2023 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKh8vIoOSVlhGsX7++uX7aFDzSiZSuSCacL93rKx6+I=; b=i3MARm0w72xLjk
	NwgTav2rEX/V/9LyA7V3vTNTnALOZoOU+xF/mPYt1VtAVt1Q1qphbjy7QguZPdSCom2c0OqDxWfcp
	YJgQngwBCLjNojNU1Lw0HHAcVLq8O3430F167xgDSPEIr7hv6XGYtwmzgIRoCwN46sM86Q5zv22Q1
	TXZg+v170UvZZENDPDP0+giYYP/72s5UcjE81Vf+s/4Eiu0/v/FucEaLZvQU4zujJE4jHwUZ7NJcc
	aTnGapMBmhtOowYIdDW2vczGB3ZsrCbJDnPv2b2BVhlEOhB4SkNbGomazaSao5DEis3XN8JEYXXyH
	RJzFfcxofdWvqEGS8JDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dz9-00DQDD-1d;
	Fri, 09 Jun 2023 15:25:07 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dz7-00DQBg-15;
	Fri, 09 Jun 2023 15:25:06 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686324300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jl96cbyDBbKgT3dYhNuqd8N/AXyFx7lY4YyvhcXXQ5g=;
	b=nq1+kzZJSIgUAjoH4SmlnSxSv3rSvvjZO9Q+coXmgGqK7X9eYhgec0LbkaeyxkTn4d8arB
	3Sgc/aHU0wvBrqO3JPD5k7hU4h6alrpnc4HL0gDxFtoBRUzXjKgg9t0PcVEqTwc7esdOrU
	xXcxju1cShwXH0fm/ufotbUyx6aWWrKESBEGNtAyT9nk6S7LzMVP1DOm3Swjt9eaj1F5Kb
	qcbvdV/Z7kxC838y/rL1tn24ihCRD4Jonmy//REE+l+PdQdllfl7vwe/B+HA2XzxPU96Pk
	2XNa13cFwb16+IleNBfGjw49w5Rm34l5xSCt3LtLbmFS+ZVx0RHkOJ5xA6KM2w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F4C7C0002;
	Fri,  9 Jun 2023 15:24:57 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mtd: rawnand: meson: waiting w/o wired ready/busy pin
Date: Fri,  9 Jun 2023 17:24:57 +0200
Message-Id: <20230609152457.1186904-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608044728.1328506-3-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c17a90a46a712b78578dd7156380fdd515a2af9d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_082505_530680_BBD57963 
X-CRM114-Status: UNSURE (   8.16  )
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

On Thu, 2023-06-08 at 04:47:28 UTC, Arseniy Krasnov wrote:
> If there is no wired ready/busy pin, classic way to wait for command
> completion is to use function 'nand_soft_waitrdy()'. Meson NAND has
> special command which allows to wait for NAND_STATUS_READY bit without
> reading status in a software loop (as 'nand_soft_waitrdy()' does). To
> use it send this command along with NAND_CMD_STATUS, then wait for an
> interrupt, and after interrupt send NAND_CMD_READ0. So this feature
> allows to use interrupt driven waiting without wired ready/busy pin.
> 
> Suggested-by: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
