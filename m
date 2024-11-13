Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30243D637BD
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2miniB0PvGnPhYO8idkikJLr94a2bU3VS2zVeAG5PA=; b=1grt8/Um0oK3Il
	Gtp49LEYyXs9iCIjtwqFzhLoHA5HDVm5da/vJBV0SmlRIPhyiI2aeXTWGIn22ReqL3HGfdvgTQ5un
	2t+e1PtNlD6GyV66A98zMK36xVvDUlSVXCJAaZMVhf0X2rolEpTij6CktO23GnnyVgimw6bev/EwL
	AyvWPO29JZ3nI4FDw5dea6oQMnXsxXB3qR/wQrQb7w06zEdfg0kL0ektgJiI0YIJigopaXQDs0iKK
	l1nvITFLSeZX7UzTTK8ojBQO+6I2hA756wTt7TX3kLlSSjXgCWbSPRmDtxXvzxwx3ttzJtoxtYz9H
	9F/7Ux5KKiKGzWfklA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKOg-000000080my-369L;
	Wed, 13 Nov 2024 20:55:30 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKOb-000000080m3-2ZTa
	for linux-amlogic@lists.infradead.org;
	Wed, 13 Nov 2024 20:55:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3170B60006;
	Wed, 13 Nov 2024 20:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731531321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oT6RDAGorrpozc7cGqo0CYW2HsUHLsv4C8N1Q7/mPHc=;
	b=jkMivzI9tJLx3be10oF0crb0Bb77pOao+EmePu6fhmUfJTZTHPa5t68QN8JzG8sdcl+lr3
	lHd0mNpqWtsVrIDfMzW5ENltlS6hASiBIieyGthUau7hgNCuwowYpvw3bRgZt98MwMzn5i
	46u6V1RdF1s43mCyQeuWf8mBnVT6oU2D+Jj64XBZEwb3NLmVuPPIDFw2kXzVxWwpPblgNP
	9FtOPH3jDH+WoE4e3QfMvsacPMDRx1ZidztLF1t7vBMZyEQBwGxIXM2M5oEJPlJkMAkjAq
	peD4koZqIpEZ4o3ebc4HpUu6BiWZI5UBAk3zakSz96oEXD+ODwjNrMwDAYy2sA==
Date: Wed, 13 Nov 2024 21:55:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: amlogic-a4: fix compile error
Message-ID: <173153128691.3601836.5746984703959903174.b4-ty@bootlin.com>
References: <20241113-fix_a4_rtc-v1-1-307af26449a8@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113-fix_a4_rtc-v1-1-307af26449a8@amlogic.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_125526_806363_D96AF5EF 
X-CRM114-Status: UNSURE (   7.72  )
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

On Wed, 13 Nov 2024 13:57:15 +0800, Xianwei Zhao wrote:
> When compile rtc-a4, build error as following:
> ERROR: modpost: drivers/rtc/rtc-amlogic-a4: struct of_device_id is
> not terminated with a NULL entry!
> This commit is to fix it.
> 
> 

Applied, thanks!

[1/1] rtc: amlogic-a4: fix compile error
      https://git.kernel.org/abelloni/c/6cc79a629571

This needed a Reported-by though.

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
