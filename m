Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F972C4167B
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Nov 2023 10:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEsFdPqloEIvA048/kh6T0lD7gxoQzR6S0NaFNSwXb0=; b=RADUCAmmF6n9RO
	hneCQDE2D8UT38Oo+7eTilR4YaFz/qPohhU4R6L5jrMwCqdnslcmbIal6TC5aLml1Tf2+s1AxFho6
	CC1X9/OaMvMr76txztcoGFHXrX5VfsWCwy27FzbCIeq1K8PZ+nIwqO3ab7He3dJauGlWpNA3iNJU2
	uhjM29ZJZ5I3+61byW8SPfRHMcctTdfQNDk+H2nkm8QOzTIoTBH/IFUVCWN87eYh774SHvdSrCRMP
	Rc7yEowpziS8eXLC25eFv6+OyWAs+BiA+Q5tWysfZ2UpCuw8YoSAQkuaa3SkEYDGkpaOZ4vS8hkoj
	AU1+B0sFAFFYTc/KqFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ePk-00AT2Q-1l;
	Thu, 30 Nov 2023 10:37:00 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ePf-00ASyN-2o;
	Thu, 30 Nov 2023 10:36:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90CD9FF806;
	Thu, 30 Nov 2023 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701340614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEZ7miS6HTrjZKAV8NWV8so/Cd3xvNaAoPM8VIbL0RE=;
	b=Z8SDxxpkwJC9pJtiiS0ifGleerdoufZGG0zdCezoH0vujHmyWJYFrBsEMC6jbkZeeekZ0h
	1U0gViZL/ps6dk9KwbCwDwOM8m77iW2cudVtpZyMRSPBOwyWj81T5WP/of/gDaMO6radXO
	aF8WQ3m5qtSSsdFolnHOVFgGQtGwEJ5RanGEuOlZRJtuPdvQoGwIcuxHdByTBjipBEtmEX
	aBoJxMiY/Q+9/sgUnrZ8/TmGknbgEtPfeL5YnjTcPqz8szBCDzIAzktu8qp2Gid4EV4J0b
	C7wRzfc+yJvSAIRkZ56Jh5mPl5IDaaacYnEkF1zwPPHiGmb1HXzGnGh9gGB76A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: meson: handle OOB buffer according OOB layout
Date: Thu, 30 Nov 2023 11:36:51 +0100
Message-Id: <20231130103651.715447-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109053953.3863664-1-avkrasnov@salutedevices.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2082b6956ce95b66b03983f3059744f559493d98'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_023656_047802_D9359A06 
X-CRM114-Status: UNSURE (   6.35  )
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

On Thu, 2023-11-09 at 05:39:53 UTC, Arseniy Krasnov wrote:
> In case of MTD_OPS_AUTO_OOB mode, MTD/NAND layer fills/reads OOB buffer
> according current OOB layout so we need to follow it in the driver.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
