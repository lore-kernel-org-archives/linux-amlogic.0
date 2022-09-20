Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0C9C54EE9
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Sep 2022 08:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06iSqRB+9WvhsPdElnPdSdsJak5mBE3iVoAZRChBuME=; b=aUoTZ+2Z27cJxE
	qdtW+8vpYQlzLEeKlwhMAXdp0t46vLjdw+flfYatej/Pzza8bcS3HzumKcVV8HvUhRkS3hPypsO2z
	yvV2NWAx23OaAwdF1uMJVf1s6R4Xc5G5OUCNA3c1MlSuIeahOJkESIc6Gdu7HozHrk6jXH6tyuyxB
	npaY6ombM6FQ0w8jD1gYbz7O4QrHZ2cgsr6mchlBvRFowAUNQrBvwlZQ3MClUGhEzKi3dxUY2AQrW
	QimaXbtOXfDga5ZufLckfH3vRnIWfAK0tiHmNal2LoyeDWqCf9rFmri0ZgNapAV78K1cFjoQdlmm7
	QFO+jmukdai5usFKM4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYjD-001sl2-S6; Tue, 20 Sep 2022 08:35:39 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYhF-001r49-MR; Tue, 20 Sep 2022 08:33:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7C078E0018;
	Tue, 20 Sep 2022 08:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSLBEoilakHX+v3OduCSsrPTjI4oube0hzbmRNzZ1YM=;
	b=cpXt22cKdbG7hebzLKDJ1nOdGAZzwpKb0moRRKTC9t12DtMS9OJpCrCUsUocgiTxXrHVmt
	uQGeYCpVfPDWRn//jLWk32o8UKixEMXqb1Ez0cj5qbvBVbCmL81JhP+amJ2qWyjZn840rg
	2jdCRVdo2r9DUwC8KEtrYwI+VkAsRCiIGEN4uWp4Y0EeGh88SKf91gu9ICcHthW67Wo0bk
	EpFnTcYYeSjSSIJq8uB1v4m9iy5V5yl3wJno/Rlwg2O361Lh3QWzED6HKTBjDrNF7Og43s
	3c52lKi1M6pZGcFi3s7SrzJ+W/SI+98A5uqW/4ziizGmheBME2Q4oq9Yg6coTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
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
Subject: Re: [PATCH v9 1/5] dt-bindings: nand: meson: fix meson nfc clock
Date: Tue, 20 Sep 2022 10:33:32 +0200
Message-Id: <20220920083332.600982-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907080405.28240-2-liang.yang@amlogic.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4579bca2056840d60958bd33b68eef6123420111'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013350_038037_E8223EA2 
X-CRM114-Status: GOOD (  10.59  )
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

On Wed, 2022-09-07 at 08:04:01 UTC, Liang Yang wrote:
> EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK'
> which is defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is
> the divider and bit6~7 is the mux for fix pll and xtal. At the beginning,
> a common MMC and NAND sub-clock was discussed and planed to be implemented
> as NFC clock provider, but now this series of patches of a common MMC and
> NAND sub-clock are never being accepted and the current binding was never
> valid. the reasons for giving up are:
> 1. EMMC and NAND, which are mutually exclusive anyway
> 2. coupling the EMMC and NAND.
> 3. it seems that a common MMC and NAND sub-clock is over engineered.
> and let us see the link fot more information:
> https://lore.kernel.org/all/20220121074508.42168-5-liang.yang@amlogic.com
> so The meson nfc can't work now, let us rework the clock.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
