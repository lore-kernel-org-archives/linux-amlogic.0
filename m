Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AE6CCF9FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Oct 2025 23:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKH08jNUr/CjRobFjbakYOMQgCRZoRAXz4lf1OsF0ZE=; b=QwvxMPF/WkEO6Q
	HzDRAuQnQCAKtPR1OZwIhTzl6IoSLxXeYAWXKIs7xgegB+vIZSni8/s35L0YmbzvONdJecItX33Ff
	SWKvcv4yWfHTzu4uHMZFiR/hyAmM6lYgwUrDuvnfZWBTT/AvSTX+OXpnCVr1kadVwME+oxGmijFN5
	vJalIE1Mcor503BTlDMpzn3f9Eewb34VgT3wp3kbRLRLXPFnWx6k4DZO9W+YTnMceILcCDEDhL0iR
	cwhIUwuJzgQf9XwXkVkgW8micDz3n+WEgpX5pDdjjccHZeNw34c2OqrRODcG7eYbfVKEY8K1CMi8N
	Um5t7tDTJGzKSCmp43BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEy8d-00000006tdC-0AgS;
	Fri, 31 Oct 2025 23:02:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEy8Z-00000006tci-2OsO
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Oct 2025 23:02:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6CBD71A17C8;
	Fri, 31 Oct 2025 23:02:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3855D60704;
	Fri, 31 Oct 2025 23:02:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 764B91181ABA6;
	Sat,  1 Nov 2025 00:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761951743; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=c/QaNAx1tRBSa9Ke44ALpXrcuaXoJLXMTXTJpcGjHng=;
	b=pR43qD0BQgfP2bk4bYk+XmgscS7dA2yTNheJrMQw8mK57QQYyJYxjbTX9JrpdKi++ikKiu
	rixYJlcEDH/0/GQvMh3/w01XOrLwwLeNL0fIkp59kQZljtLsKW7zbSEhf1ixzfuIlgRJ5p
	UC/AjLyR3WvshhamV4AUqGdkgfVhlMRSH0Qy6aIJemH7BlF+O6WMYJpIO2giF60DYV34nv
	6Yyzog30SnzvftR1YaBNEmiGoLbPaOdgxAVFspvSlEKwpUr/NZtDm7NLLIGw3El2YDjPa8
	0TGdm8x3NbuiYUr/n1bG0YPGdW2h6Kuz4o9v6PAQfXGaFqCn5zsIKfI0jzGTIg==
Date: Sat, 1 Nov 2025 00:02:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: yiting.deng@amlogic.com, xianwei.zhao@amlogic.com,
	Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: amlogic-a4: fix double free caused by devm
Message-ID: <176195170903.843198.16395014691314193568.b4-ty@bootlin.com>
References: <20251020150956.491-1-vulab@iscas.ac.cn>
 <20251021103559.1903-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021103559.1903-1-vulab@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_160228_405370_3BF8C399 
X-CRM114-Status: UNSURE (   8.03  )
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

On Tue, 21 Oct 2025 18:35:59 +0800, Haotian Zhang wrote:
> The clock obtained via devm_clk_get_enabled() is automatically managed
> by devres and will be disabled and freed on driver detach. Manually
> calling clk_disable_unprepare() in error path and remove function
> causes double free.
> 
> Remove the redundant clk_disable_unprepare() calls from the probe
> error path and aml_rtc_remove(), allowing the devm framework to
> automatically manage the clock lifecycle.
> 
> [...]

Applied, thanks!

[1/1] rtc: amlogic-a4: fix double free caused by devm
      https://git.kernel.org/abelloni/c/384150d7a5b6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
