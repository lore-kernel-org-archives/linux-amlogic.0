Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53967C27C5E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xujO/HpYPB7ibB5WNbqUDbc3cZtnSZ/nf58mq1+5CgY=; b=ycRlwbpLVUsRim
	QvR+oIGkpGAKJp6jerf0/A+bwEawkUnLkxlBTb4TZ+LxhihTiEQYA2MsxJnTjgPSKUid95KuK0uRH
	Yk07s/D/6MgQ9L2ivnDg8/p8BPsbXmixS/1Ingceqpba39YyquxJeCQxuMCLdrRx/3EEyqEXK8p7J
	G/veKNefcaucxh5H5Wat9XZjrhqjjg73VUs+EgpzkSxBDDCbr24zIP1ALBg1w9I7c03JYfFk6A4sg
	vqw8Wz4umPuKPWKgMv1xoZhyFgI/EGNryNwQS/skIGjeoDFD1VWAh3ynwoVrZuyxwnoSZpJsyRSz4
	iC3ONP2g9kSZ0ER1mDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGdsw-00000004xYu-2b9v;
	Mon, 10 Jun 2024 12:12:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGdss-00000004xXO-2d1M;
	Mon, 10 Jun 2024 12:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X7eB5tOr4Wtz0yyAy8Xe6lpdiamgY9NpFstiAYK532I=; b=YHTFNpZ6MEWDOBw6od4XW+32LY
	/g5YT6FOwEEanmRB1F8hkWFhzc7UxoWAaWNUjN22xwQCaA7WeDM6BY9MrT77az3W6eRR0DmyNNX5v
	wMvuOHuKyQFDMV4SlH2iHySeYPtyedn7HRUD8Z+PSsQfiVzq4QAJC2hKd3H/ncFauJ84=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sGdsd-00HII0-5t; Mon, 10 Jun 2024 14:12:07 +0200
Date: Mon, 10 Jun 2024 14:12:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] irqchip: add missing MODULE_DESCRIPTION() macros
Message-ID: <91eae7c8-ecb5-4076-9d74-e0f073218875@lunn.ch>
References: <20240608-md-drivers-irqchip-v1-1-dd02c3229277@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240608-md-drivers-irqchip-v1-1-dd02c3229277@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_051222_702634_A00C5F7B 
X-CRM114-Status: GOOD (  12.15  )
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

On Sat, Jun 08, 2024 at 09:14:37AM -0700, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/irqchip/irq-ts4800.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/irqchip/irq-meson-gpio.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().  This includes a 3rd file,
> irq-mvebu-pic.c, which did not produce a warning with the x86
> allmodconfig, but which may cause this warning with other kernel
> configurations.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/irqchip/irq-meson-gpio.c | 1 +
>  drivers/irqchip/irq-mvebu-pic.c  | 1 +

For the Marvell change, but the rest looks sensible as well:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
