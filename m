Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34E8C76196
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9bST3MgafM1l/se6sn7KsEs9J+bgKYLZO4eJ4I6/2U=; b=e+FOZWNIv90wiG
	b9Rx4Keb/rYflNq1HxlxB2bXp59M31fjfB8dynG5gGD1DnZMPlZggH+Hry/efUxgTpBelLlefOaFl
	cP9jR9emZhqQQ4hYRnM95hE6naufgDfcUwhujJCVnnWuO5s7StdC9l9zRqZ/DSeC2IMO1p7rD5YwT
	hiXJSCknf/roNk4bRd7+8mz0ZKQ1X1ce7FCEtzGtRyzXywTbp8py/crCAOXKCacBqvGZ47tJ8ACX8
	0hwLvi27oSxmWD1rCIBxF6zUugg0jHToc0A08mWSXT5ahpTOzupLTxd//BXfTm23IcOrS56sjWwhq
	qfKUh0CMUdTJNOTYBKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMaZ-00FtgV-38;
	Mon, 03 Apr 2023 15:59:23 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMaV-00FteV-1O;
	Mon, 03 Apr 2023 15:59:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 08001100005;
	Mon,  3 Apr 2023 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680537553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dp03hIsI/cteiZu/GdKKxTFMnCgcRr2K9r6OCmhzmao=;
	b=RkfJH0jxjTJbojxm6hZEW6QIsItd/M0lbu7oquAWovMfXF9HWSz/5twP19Fqk7EjCBQ4ex
	ppeyUMt7OQYwMYGw2k/vXXASwwhJnarKdxskLhF52jJI+SIbfzCsT5UfNkeOot9CckPMgB
	mRo7UC81lpN01Qm/PiNwGZOkGWzvEGGXtHItWWZRNPLqz1Ftinkj+euD1TGXzpEALwdmwZ
	KP9hb2nWnneCreUVmeGwcrZ6E6mtx80rlmUL5ktn4AKjXD8YlpcCTDe14ip10pEa3zCIUS
	iiFdnId9tEyAcW3dGgWiK2lVIF4extNt8sxnzhstwEiFCUzLVf3WekTfABZqXQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru,
	oxffffaa@gmail.com
Subject: Re: [PATCH v2] mtd: rawnand: meson: fix bitmask for length in command word
Date: Mon,  3 Apr 2023 17:59:08 +0200
Message-Id: <20230403155908.137562-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3794ffbf-dfea-e96f-1f97-fe235b005e19@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'93942b70461574ca7fc3d91494ca89b16a4c64c7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_085919_760627_8FA3A144 
X-CRM114-Status: UNSURE (   7.10  )
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

On Wed, 2023-03-29 at 07:47:26 UTC, Arseniy Krasnov wrote:
> Valid mask is 0x3FFF, without this patch the following problems were
> found:
> 
> 1) [    0.938914] Could not find a valid ONFI parameter page, trying
>                   bit-wise majority to recover it
>    [    0.947384] ONFI parameter recovery failed, aborting
> 
> 2) Read with disabled ECC mode was broken.
> 
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Cc: <Stable@vger.kernel.org>
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
