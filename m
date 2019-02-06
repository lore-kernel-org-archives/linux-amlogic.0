Return-Path: <SRS0=Dt7e=QN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CA7C169C4
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Feb 2019 22:39:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 155E7218D9
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Feb 2019 22:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VQhC7Yvk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 155E7218D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQgcarMfNP5Mz+qAhAhYJPdcwNY8EsdoCJAkdqB1SNQ=; b=VQhC7YvkpVfpDM
	mJJicCle9ll/JHLXYRxm1xC0U0jZxTzNvkLIzeP2ZjAokEqcNiZazXlO3W9mvMSsNsYxaw78huBHg
	t9D4DY9BTR73o0iB2LDgz9pr6kywZC/TWRmx5V86pjeANECjC52gudZgGacIMqu2fI8z6lfPWwzDG
	sTA9rPnZnPrsi7/hQ2yw5+HqHwGC8/v3Djuq8mnbGCyfdx55lVrnnIyCUm9pYLxXA4j1q30YxDvze
	H5clg9cXjB0oC5rO05NU248JQmE3QYuczTbk2DeFn3n/vtAay4+trQjC7beXqeVmBLoEyd8vh+vj5
	F/uIu5nydIUz22dkt3Nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grVqP-0000Hc-0R; Wed, 06 Feb 2019 22:39:01 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grVqM-0000H3-Eu; Wed, 06 Feb 2019 22:38:59 +0000
Received: from localhost (lfbn-lyo-1-149-219.w86-202.abo.wanadoo.fr
 [86.202.231.219])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5BBB7100002;
 Wed,  6 Feb 2019 22:38:55 +0000 (UTC)
Date: Wed, 6 Feb 2019 23:38:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v6 2/2] rtc: support for the Amlogic Meson RTC
Message-ID: <20190206223855.GC4719@piout.net>
References: <20190119144332.11984-1-martin.blumenstingl@googlemail.com>
 <20190119144332.11984-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190119144332.11984-3-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_143858_648923_A8715D46 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, ccaione@baylibre.com,
 linux-kernel@vger.kernel.org, ben.dooks@codethink.co.uk,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 19/01/2019 15:43:32+0100, Martin Blumenstingl wrote:
> +static int meson_rtc_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_config meson_rtc_nvmem_config = {
> +		.name = "meson-rtc-regmem",
> +		.word_size = 4,
> +		.stride = 4,
> +		.size = 4 * 4,
> +		.reg_read = meson_rtc_regmem_read,
> +		.reg_write = meson_rtc_regmem_write,

Not much to add but if those registers are battery backed, you could add
.type = NVMEM_TYPE_BATTERY_BACKED,


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
