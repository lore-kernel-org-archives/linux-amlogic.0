Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663A5C10F13
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 14:40:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35297206BA
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 14:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iKT1AU2o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gm3ID+U3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35297206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HMMHaHir0BB17uplWpBLmpX1anj7QGDsuPEAuaLEHI0=; b=iKT1AU2o1D78rI98RRz6ylLQM
	z/wpAGCSlVBKktA7BWM7+YbRL+WILeO9hhh+3Cmp8uFAqQA/vaL7+B/LAq6Ilu5pJ56pTxqqlaNYp
	It8TLdKiSTYWRvDdqeL/sgkwtA1DPc+9xMrzXEWXDkrMvPBNDFkAnn/JJZXjNESN+klwl/NS9EhSK
	D5E6e1/BpjDyV0oMDw9JAJ2P5yGx+P74NYi0I3H+LWzV+QKlcTJ9fwq1OehhUizV47wav5kQyiAm8
	xzCTy3qhtBUO1JttABx8diczZf5/S0X39Y6mwn9KDcgAYrkbZeLwoB9kurd0HVp4XIwfZD/T41rdT
	UniHfCBAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEask-000502-IK; Thu, 11 Apr 2019 14:40:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEash-0004ze-I0
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 14:40:48 +0000
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5635D206BA;
 Thu, 11 Apr 2019 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554993644;
 bh=Dd9HOGHBvvXpzM/JRWZwH2XtopWuH21ZF7knrpqj7lE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gm3ID+U3n0meBPrqN4zD68qmjwYIT3lc4/OgdkOG2Zf6eq/zgf6lKBTaEz4lva9Am
 LIA7D8snF8CxTdXVumzjva+gEi2SHPFXlp2qiNTxVKKHddHHZJ0fk7JDlQ//pxB7f7
 kd6LT1uOndDf6z32rwSI/huWEmz6gChENcQ4wM+o=
Date: Thu, 11 Apr 2019 10:40:43 -0400
From: Sasha Levin <sashal@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH stable 5.0] Revert "clk: meson: clean-up clock
 registration"
Message-ID: <20190411144043.GL11568@sasha-vm>
References: <20190411101132.5513-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190411101132.5513-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_074047_620630_F7215961 
X-CRM114-Status: UNSURE (   6.79  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, stable@vger.kernel.org, jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 12:11:32PM +0200, Neil Armstrong wrote:
>This reverts commit 9b0f430450cf230e736bc40f95bf34fbdb99cead.
>
>This patch was not initially a fix and is dependent on other
>changes which are not fixes eithers.
>
>With this change, multiple Amlogic based boards fails to boot,
>as reported by kernelci.

I've queued this and the 4.19 one, thanks and sorry for the breakage.

--
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
