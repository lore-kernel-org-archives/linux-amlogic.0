Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856ADC55ABD
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 09:46:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9907207BC
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 09:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JqFX6nsp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWn7aaXR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9907207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OGajvmeaziBRQoPLeQ/2McTV8twVnB+OQWpdBsORUR4=; b=JqFX6nspt+SKJf4WqWX9dFS/F
	7tqEdw/UL1cUJkyRznaUglDu0qY4hMLV1OnYybWnUoJQeqVdzLi+hcyzaAfbz3csh/mCU4/5OtBw5
	OU4fsfQ9LoUxz5BADZXks5m9r3os/1vykizmgMrifMl//VnFbnmrywEzWY0dhP4nTn52iuqUyMj1L
	AVfd/68mmj/9sQNLjR9tPrHrlUZjwwuGCVh2VudN2Up1JEuM+jE6FKEuPTXX4HYIFOXUyit4I1LjE
	clu8MFx6MjJLyArTkfndX0XUFA5JEp33Jl0UCjwp4wd/otWJo5fGT05csx60jY6n8vZhrLw+8Ryeh
	kuU5UzpbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keb5X-0004tf-OH; Mon, 16 Nov 2020 09:46:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keb5V-0004sz-74; Mon, 16 Nov 2020 09:46:17 +0000
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30AE420782;
 Mon, 16 Nov 2020 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605519976;
 bh=88dgvohs5sFfjwOsI6WM53YIqM3Q3dM9tg6dsFyp4bE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OWn7aaXR7ABabK9+RwFQUlkWeeIKuufY6m2/1e8PiAn4xkpyB9IZ9JqwlM6btiatf
 pObXnDohcXpGz2QYMaRFGqRGOL5glx91V6RQ5XweEqTxUrgsAfqXKFCtv2nVN85nfc
 Su5vBYtQZho8oyUhoP5Q1NdSeweG2J7LoYhW2z6I=
Date: Mon, 16 Nov 2020 15:16:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 0/2] phy: amlogic: Add support for AXG MIPI D-PHY
Message-ID: <20201116094611.GT7499@vkoul-mobl>
References: <20201104134730.1545875-1-narmstrong@baylibre.com>
 <b2aa7b6c-b590-ff4a-d161-364e4e968b26@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2aa7b6c-b590-ff4a-d161-364e4e968b26@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_044617_363074_239E356C 
X-CRM114-Status: GOOD (  12.68  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kishon@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16-11-20, 09:47, Neil Armstrong wrote:
> Hi Vinod, Kishon,
> 
> 
> On 04/11/2020 14:47, Neil Armstrong wrote:
> > The Amlogic AXg SoCs embeds a MIPI D-PHY to communicate with DSI
> > panels, this adds the bindings.
> > 
> > This D-PHY depends on a separate analog PHY.

Am not sure why but these two do not seem to be in my inbox, can you
please resend this and the other one please

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
