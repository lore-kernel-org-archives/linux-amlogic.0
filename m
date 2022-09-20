Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A415FECAAD8
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Sep 2022 08:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FV3Q6MZhuW+d25LNweC8yTHOAhrLd7bNUQTm/3fgSd0=; b=h3f+NdSBxirarp
	yieYSvuEZcHso//Nfggq/IN56pCVFFq2OVIOjymDGMbyg/RpoDAes3r5MDs+mwUkzvkNGR4j0xy2e
	FUBQAWlvS9lSB7MV5VsGHl8jNZSCzGfyzazVd/bhxPZcsljm0IzrMCcwxCRQkAOngNgY7CkpQEc4y
	kGaG0/xZnJheNeVyVggLqWRyjIEUNzIKx8MBr6XRvSKtuatlBR5IznQAF4BrVztiK54+g8z4qI41I
	BSfmdoSThTmOdzzfMwXNfqfCDFVCaMkYG1FFx/KU2DUuJ8HrENhEqESXQfNQYpgD0MTEOFiDsluG9
	8KslPT8G8ADoERJTfwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYi1-001rde-37; Tue, 20 Sep 2022 08:34:25 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYh5-001qoY-B3; Tue, 20 Sep 2022 08:33:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ABABA2000D;
	Tue, 20 Sep 2022 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CV8RRbNvkUpFnsCo59JCiSq0IUT9sDhM+Ha7hqQT4Cw=;
	b=A8j5LZyLw1iRMxlgBWdc/Mb92p7NEELS3QYTgYX2i4MvquxEuINMCDOLdTs7rZItXi+j6B
	UDwe9KiMbQTPqcTHaGnYBVAxRW6U81E7rLhLuHl0kZfldjKMMTYYTCbejGWj/bSDBiTIUb
	qCTTdPxH9VA/qB4bz0N8npkRF6O1PSSgQHJUR50fZzFYSj+bo4UM56OJR6w9u63yZF/3oT
	ASE6BU2jrEYN4nR1B9lHRajAvy4y9SNtPcdectpLHos5FRYybSbRikgaS8U7qyrdubvWfI
	pxUfwVTJf18JIQwOSjhJ2HSztc2LqSPeuKRzLUYMbDUPTrV6i25EZZ9rB+5hFQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Cc: Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Victor Wan <victor.wan@amlogic.com>,
	XianWei Zhao <xianwei.zhao@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	BiChao Zheng <bichao.zheng@amlogic.com>,
	YongHui Yu <yonghui.yu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 3/5] mtd: rawnand: meson: refine resource getting in probe
Date: Tue, 20 Sep 2022 10:33:21 +0200
Message-Id: <20220920083321.600926-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907080405.28240-4-liang.yang@amlogic.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cca5eedd2a5747bc626e4ab8e560a657cd559e8d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013327_580941_E04712D5 
X-CRM114-Status: UNSURE (   5.23  )
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

On Wed, 2022-09-07 at 08:04:03 UTC, Liang Yang wrote:
> simply use devm_platform_ioremap_resource_byname() instead of two steps:
> res = platform_get_resource(pdev, IORESOURCE_MEM, 0) and
> reg_base = devm_ioremap_resource(dev, res)
> 
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
