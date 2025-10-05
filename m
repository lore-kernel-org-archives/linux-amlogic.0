Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4468ACCA472
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Oct 2025 21:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEWCGzJ9yA+sWuJ/fx23LC1bnemr3PR3CxZD3+YyR28=; b=KCqCXV/g9O2uHi
	rWNFMJZ7CWTrGlZSUyu2cYhPo7Uwj6T3iwHx5HjO0mvkxC07Q/SmG5ZC4eilne7SLMlC9DU8tE8Gr
	iq+U/iBRxHtdtHQfIrMEgGQL0CNTgJ5zd0CtIzJtqX3Ohd+Ia6+vkYVB86LrlU610qOYmqYL0SloA
	gZKDE03rjZQODHcfMUSVb3PoE5KklzomfvCzlXvrc1BaqGdoRaZKH5G8n+hqx0fVKgvpsJ/LLgcsc
	z7G6Hax6S5h0clivDY+sokhsUmde1nNLgAb5UZMQtZLgK0Bfkhlpfr1hEvWIqPyNWHEmDRfog5Sjy
	wejuImCt3lWGoSbvCzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5W0y-0000000GeCd-2qEW;
	Sun, 05 Oct 2025 21:11:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5W0v-0000000GeCA-1GIt
	for linux-amlogic@lists.infradead.org;
	Sun, 05 Oct 2025 21:11:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F6424E40EEA;
	Sun,  5 Oct 2025 21:11:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A3F06065F;
	Sun,  5 Oct 2025 21:11:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DA24102F1CFA;
	Sun,  5 Oct 2025 23:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759698682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=xvpGG3K+d4nDU+wbv/MSUXfX+rffXV8mpfkj3ipAZ8U=;
	b=RM1RJk0xzPFdOvGQRBinxhKE+SoVE8BQuxvYDLwROaKu6MWEFMq1omGCSCHu3J10zLSRH2
	3t1HJrfXaaYLBjxlq2/JnJSChLcpMhTId2lnmkOdLnwQd93RpXFAn9jN2mVqzPdY0x8GdR
	BdxBooI/vGgjQj5HPKTAPfmF+Y2C+/U9wiJmTPswnuvCwWmCo7daxEL8KFoHenQpcda5+t
	k9N3S46NuLqIgjE2gpfR72ALTqZLJ7BTlVj6wTCZmK52Uv8cnhaUozwHmXSmdH69EN2OCE
	Vv1/d9qBRZ1KiLEFyz64ZdcJC3MKtL3STbcTgKOqdx7uDVty2tV5OgIJim/LdA==
Date: Sun, 5 Oct 2025 23:11:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: amlogic-a4: Optimize global variables
Message-ID: <175969867390.3794197.7569188236054455488.b4-ty@bootlin.com>
References: <20250722-rtc-regmap-v2-1-58bc17187a11@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250722-rtc-regmap-v2-1-58bc17187a11@amlogic.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_141129_468443_B4608810 
X-CRM114-Status: UNSURE (   5.02  )
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

On Tue, 22 Jul 2025 19:30:48 +0800, Xianwei Zhao wrote:
> Convert a global variable into a local one of aml_rtc_probe().
> 
> 

Applied, thanks!

[1/1] rtc: amlogic-a4: Optimize global variables
      https://git.kernel.org/abelloni/c/f38bdd730914

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
