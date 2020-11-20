Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BE3C5519F
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 10:02:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21DD722240
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 10:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OUBMYD7l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="phr7UZhY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21DD722240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MWinHBG+2eZIRAMJti7+1e2n9M76C8HGfyR5/OzYWsE=; b=OUBMYD7lZaw0BD0iFgsw17aq4
	OdHS9gpEeZA9pmuc3z0M4LnF5TZi3HgvrEnTi0+7DBqkk8E2+iVOKMvAuSo+yqVSrGJuz283ZthmO
	ANpuxtfxJTk4b/RAv6lSe6o54nlK8UuxKeZhFKZcVxSmZgZCTlZMnYGRuSZtWqdLswfrTuveyJ7c7
	KES2JVtivFJ9/h1ZWy1PYjaNhiJ/7RdcXJ/9VX3aqSqQo49OSEv5rrcqVyqYvF4NtxpSxkpIs6uzc
	Zes3LsXM8B0qczGCUt2BNxE7cD+NLgQ384hgztd5An+fuedQWMfX6srOU6bwR7vsKRAQxKIspDFbh
	jYLk5gIXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg3FX-0001ek-3t; Fri, 20 Nov 2020 10:02:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg3Bx-000871-LU; Fri, 20 Nov 2020 09:58:58 +0000
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FD2A22240;
 Fri, 20 Nov 2020 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605866336;
 bh=pwb55qO6JWZ7TpRPh8d8nTkVtoTV/uG6cIMurpYtnlo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=phr7UZhYJQ5Gribf658npeOHcZ2FigibRFeyOJ/EZ3X9grHJDxnEuU9LTiSlfaaf6
 ekRXsSvFdyKhO7NV+C40Z33/urGFtHkCeji4ZlLsKiKBw7Hadf9KQ+E351Kk5C0+OQ
 u7jwMUaL0Orh1rR2cuuElUkGRTbpTatGeIQP10gE=
Date: Fri, 20 Nov 2020 15:28:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RESEND PATCH v3 0/2] phy: amlogic: Add support for AXG MIPI D-PHY
Message-ID: <20201120095842.GE2925@vkoul-mobl>
References: <20201116101315.71720-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116101315.71720-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_045857_832518_5E91E810 
X-CRM114-Status: GOOD (  10.43  )
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

On 16-11-20, 11:13, Neil Armstrong wrote:
> The Amlogic AXg SoCs embeds a MIPI D-PHY to communicate with DSI
> panels, this adds the bindings.
> 
> This D-PHY depends on a separate analog PHY.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
