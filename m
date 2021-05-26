Return-Path: <SRS0=o2l2=KV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E05C2B9F7
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 May 2021 03:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEDAF6128B
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 May 2021 03:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEDAF6128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8M6Y7qnm0AFfw6VTWwPWkFgJQtU76OEBPtuufE6NSWQ=; b=tPv54+XaLeZiqR
	aunf8Ke0K/JPoaELSGdDx10RUGV4kKj1zD+26dxqhnxzzpBXt+HsXxIXCAyzgh0GjpjxA7Uo0A8BY
	teCSsZU0tNwfyno4dMRcmA/agqMDEL1tyd6JOAWVj8cIxX/ZGWP9EPs/45QU7IK89ms37SaluPWFd
	ZbTfBOb7wGpFYbrOPM3lGM0prcDwmdszRucAeS+ZD5sxtureHkVBgsu58gexlSnURZitA241IlV45
	PUM4rr0cb1WGAFlgBXUHAUX+VcxQltHkOlzjiNEaS5EOmtefHOjxQpZwrY49eyt26RL342wQXT8VS
	WXQsKO5P4XUNeF8BB+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lljwp-00AS8T-T5; Wed, 26 May 2021 03:11:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lljwn-00AS6Y-2i
 for linux-amlogic@lists.infradead.org; Wed, 26 May 2021 03:11:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BEEC6128B;
 Wed, 26 May 2021 03:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621998664;
 bh=N1BEo7o5BMwvjE2r9zfHshQckEwcjvZTPgSGzqrrPRY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=b4XMcUAQNqX3fNnW+EL660emzIgWN64xRm13uFVpFC2UMMY+5UAGsttpeT5X4tagr
 WaPUgIuAe+pDaP7uA3Rxc1lUeqNkmigzRJQ9a6VlCAYBeyQRRT122pVduD2dBHYFm9
 7QfwULBcj4w0zxlqA8gbrdBZP8seNPYts5xo/t+koIOy1fHGsgpiaRCtmCKUAS5KHd
 kaoUkl5PmWSD/CYHdJ800zLD69QL0fz2+52bCZvCYie+YHSUnQROkaJPti56aqjC8d
 ja/HlepTk2ujFouMhyBr6yCQWhrZUxJeiiUH+0s5F1HWFENbgbaa5PhUeMWsFlF/kP
 vGnugrkUMs3IA==
MIME-Version: 1.0
In-Reply-To: <20210520073136.272925-1-jbrunet@baylibre.com>
References: <20210520073136.272925-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: meson: axg-audio: improve deferral handling
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 25 May 2021 20:11:03 -0700
Message-ID: <162199866348.4130789.1317470297014925785@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_201105_171679_512DD8E3 
X-CRM114-Status: UNSURE (   3.73  )
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

Quoting Jerome Brunet (2021-05-20 00:31:36)
> Use dev_err_probe() for clock and reset resources to indicate the deferral
> reason through sysfs when waiting for the resource to come up.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
