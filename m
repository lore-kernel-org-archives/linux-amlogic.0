Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F272C61DA4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Mar 2023 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68yY3lm6M9yR+ky8I1J1pq+K/T8j0qHKizbETZZjc58=; b=fYif0lYOZI+MTZ
	pDVDwhU6dh4UyM3tQwSjcHh40VTUDyKg+Ese7mmpUDOp+wG56h9wyVbJlt1yOvsy2QmyJy0uHQs3P
	ij2XmKht8EC9h5xayciMh2tXGAr3vg9gIjB27fr9Xr7Yjy2uMvcoMdbxrl8oCXuAgVAU02hShCWnm
	VZyxoitXZsT1fMJCbDzpuUtuYFnHajAZ3pDFBMiIsWd96uTGlKdpgdosqOsQElUDl2S3OY1jMv7AP
	/ZgN6wnzizQtIqiwFd0Ebk9LobISC2/IiaOOYMIMc96q2BhfV7XByLirDwzXcBNET2oFXXe33WgQt
	GBbwym3ExRYqvgul2uXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOFH-00D2on-2C;
	Wed, 15 Mar 2023 10:20:35 +0000
Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOFD-00D2nF-1d
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Mar 2023 10:20:34 +0000
Received: from [IPV6:2a02:8428:2a4:1a01:41fa:9273:29e6:e64f] (unknown [IPv6:2a02:8428:2a4:1a01:41fa:9273:29e6:e64f])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8C4F819F59E;
	Wed, 15 Mar 2023 11:20:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678875627;
	bh=nWSEty1byYWo8qP4mOf1GIvttLCcvIlo2/PFs/Pp+u4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GVN6b8pYo2aJTLMoR78vO3Rn+3H8rkkay6KXmr7Yl0Xu8kUvtBAWUU4BXyQMqTYHo
	 OiNhUTrNcXdESVHXgMuDqymD1S3WRe2YoRXxbxjLiUtxtt4jBsLPxYhfMZtzk4TkXY
	 LvJ8lVTLJGqUuZRT7CBrnZzZFJ8DmkS9Tr7HErcshFZ/LgIPiO9WoQbVp37Zfcp0Zg
	 CvMz7edKGP24XdlgFeSquvFFc6ocQ66S2f4IR1Ig4ESLEp49KrKceGow/0Kq7hzF0G
	 4bV54pbhTd8Ib9k6fgblFyI1sQ4KVdKdDoTRT5ZVsfg3AB5DkCF0xremmjMXbSiBHT
	 I4r64/2i6pFug==
Message-ID: <b6971cd6-80f2-522a-64fb-82b126500010@free.fr>
Date: Wed, 15 Mar 2023 11:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] mmc: meson-gx: increase power-up delay
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pierre-Hugues Husson <phh@phh.me>, Rong Chen <rong.chen@amlogic.com>,
 Yang Yingliang <yangyingliang@huawei.com>
Cc: MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>
References: <11a8a0c8-a5b1-8f38-a139-97172ab7be68@free.fr>
 <0696106f-8d70-6410-999a-fcda6c5b39c2@gmail.com>
Content-Language: fr, en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
In-Reply-To: <0696106f-8d70-6410-999a-fcda6c5b39c2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_032031_987735_429A50C5 
X-CRM114-Status: GOOD (  17.04  )
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

On 14/03/2023 20:45, Heiner Kallweit wrote:

> On 14.03.2023 18:24, Marc Gonzalez wrote:
> 
>> With the default power-up delay, on small kernels, the host probes
>> too soon, and mmc_send_io_op_cond() times out.
> 
> Looking at mmc_power_up() and how power_delay_ms is used
> I wonder what you mean with "host probes too soon".

Hello Heiner,

Thanks for your interest in my patch! :)

I should have added a link to the thread that led to the patch.
https://patchwork.kernel.org/project/linux-wireless/patch/c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr/
Start at "I have run into another issue."

Basically, I have an S905X2-based board.
I built a small kernel for it (with only a few drivers), that boots really fast.

mmc2 (SDIO controller hooked to WiFi chip) would not probe at all,
unless I added lots of printks.
Basically, calling mmc_send_io_op_cond() too soon after the controller
has been reset leads to the CMD5 request timing out.


> Are you sure that the additional delay is needed for the Amlogic MMC
> block IP in general? Or could it be that your issue is caused by
> a specific regulator and you need to add a delay there?

The eternal question...

I have only one type of board. (Actually, I have a reference design
that is slightly different, so I should test on that one as well.)

In vendor kernels, they add delays to the WiFi drivers.
Maybe they have run into the issue, and they're just fixing the symptom?

Default value for ios.power_delay_ms is 10 ms.
msleep(ios.power_delay_ms) is called twice in mmc_power_up().
So raising the delay from 10 to 20 adds 20 ms
to the latency of initializing SDIO/SD/MMC controllers.

Would you be willing to test if the problem manifests on your board?

Regards



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
