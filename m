Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E61C10F13
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 17:15:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBADF20693
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 17:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZzdIHw1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2SfCDTp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBADF20693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Od543djTO/P8A0u3XA1V/DNfNPcdFMTHXKFD+3loXvk=; b=GZzdIHw1rvD0ne
	Ko0ThHtV/AEMLxGxGVeL5hqMxqPTtJ2st5aoJMydGeaMDrfbWiRxxk6+MfmRITgtyNhSPgc7wpioP
	Bmr0OA4y2FhG32/cLSY+AyLuIyhPaoRzmQCWDCdMptci26at+XH0bK3ljYcPeYzOtDy+zwNcJkAOj
	XPVl+r7HanxxHApEvOpxBkdQuxa6YEV8fteY7BnAZbt5Bjjugzy/rOukTX+tXrtDQmDNrTFUJGNr0
	dQ/cplOkvcW0//dmEwmd3bvnbGv9E8+FrGM8qhfFWiYMUbpMpHmb0J8Bths+7UAzRYEjzyAMQumhk
	vW78kJc38ByYGMu3eIiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEdIb-00058J-0D; Thu, 11 Apr 2019 17:15:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEdIY-000582-Mm
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 17:15:39 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C85720693;
 Thu, 11 Apr 2019 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555002938;
 bh=/ZdguX7vhCcwbbq969NUNJC73hqeOwYsaMLqBnL0nks=;
 h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
 b=F2SfCDTpJQomvZVh7IaRn0yoAhOx3q6mJLgUsRPJd/FRF2yAE2OiAs4og1Kyur3aS
 bNC6F2d6XvOAnRMN6+w7333mbpbMz5MQr5uu+d6U5yLEAEb5ABQzLg87fY/ia0j3Vv
 naHZfzM4t5X5eh/+iTM/OjCJy1Ys+alhGL1fLk0g=
MIME-Version: 1.0
In-Reply-To: <e659729f-31a4-76c1-84a0-3fd441aa23b2@baylibre.com>
References: <e659729f-31a4-76c1-84a0-3fd441aa23b2@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: updates for v5.2
To: Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
Message-ID: <155500293733.20095.2204484444156049859@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Thu, 11 Apr 2019 10:15:37 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_101538_767327_42F77761 
X-CRM114-Status: UNSURE (   7.09  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-04-01 04:42:08)
> Dear clock maintainers,
> 
> Below is a request to pull updates for Amlogic clocks.
> 
> It covers essentially new VPU and Video clocks for Meson8b and new
> PCIE, CPU and Video Decoder clocks for G12a.
> The remaining meson8b "ABP" ID is finally removed, and 2 clocks IDs
> of the G12A AO clock controllers are re-exported.
> Thanks,
> Neil
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/meson-clk-5.2
> 

Thanks. Pulled into clk-next.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
