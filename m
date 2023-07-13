Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3125EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jul 2023 07:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pW3wo9G2ZBS/KM67R9GptVT8QxTCcWzuZGfH+DG/XQI=; b=1Yj34quS8CaeIW
	W8S5dc1TijFe+sM0zm9wB+OLsrVnlviCW2akLE1cyVLiwkOPZfPMM662jVlwFTmAyemJbw5pZbHmU
	TlKKjOIIvtaHUth6aO51rGcE5pnroN35hYhLGY0v6OPoqUdV4rHlCDXh7xVwsxM2hQFqRFZd67rq8
	+E4PLewO4s4rspyP4LVrlx7tRbmRQzVEQEwpgFCF0n++FjaJ87HZ6VtK8tsiL0SxKnosWAk+WeMu+
	eX7nrJPYtlN1MXECRET3/IXiC9NCa6LcffXLzODOeV+fAOgGLTEZ9LGWow2I8oRiODhxz5ircSZ0h
	p8d+YX/WBF77SXPWFuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrEL-002KfJ-2M;
	Thu, 13 Jul 2023 07:59:17 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrEC-002KSX-1i;
	Thu, 13 Jul 2023 07:59:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0F21240002;
	Thu, 13 Jul 2023 07:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9bHgahEkdgpUpie4iMYMgevEutUsxc2a6NekUq66V4=;
	b=a2+ZSZ6dYMCshRTzEE8Qww3rpWiUZ7ztiiyMrY3bESKpBt7pC5CX3ptOP8ragBs3JkBBJv
	OrFguyyv1lp76kKsmH2owtjCWBCueBuYEtQVPgC9OLRU8AI1klFaHNhCgFT1fW2KxPWLRD
	wUVXI/tq/zFFVSlRHl4e09e+I/5UZI+xpFIy2X7fYr8jnbIFwbyd4If5mQJnScSBvsLlC8
	dMrlsXa/sWwgJWrT8U9+KuLqUMbay6bLPwDBrtLgaM1lbGuff9UVEPaD/psqCVCF4Mqyad
	cieFprgbQL7QGY2ISie0SYZ0UIzPEMFbDcYAIXJxh5dPF5t5VZTJ55tFX6BqUg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	=?utf-8?b?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	ChenXiaoSong <chenxiaosong2@huawei.com>,
	Adam Borowski <kilobyte@angband.pl>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] mtd: rawnand: export 'nand_exit_status_op()'
Date: Thu, 13 Jul 2023 09:58:58 +0200
Message-Id: <20230713075858.486654-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705104403.696680-2-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'079c8d9da26ed041a54706de68b754337e6df17e'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005908_750550_1F84C9C6 
X-CRM114-Status: UNSURE (   5.03  )
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

On Wed, 2023-07-05 at 10:43:57 UTC, Arseniy Krasnov wrote:
> Export this function to work in pair with 'nand_status_op()' which is
> already exported.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
