Return-Path: <SRS0=GnnG=FE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0C3C64E8A
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Nov 2020 11:00:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93AF32084C
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Nov 2020 11:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N8k15hjZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xK4SnG+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93AF32084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UiDuaKXZnLomZ6N530mOiUioXKMR5LUfntq1xQe/FjM=; b=N8k15hjZyVdJW0a3d5nxJDh5G
	Hw1Cv3Z7SgcPphDP89/fgMtp/oF9lxLjEfwOqSiCe5SqlGVFJfIS7fUqfYQEmT2MN8nwvTIWpVQ+u
	s+YdVhwli9bNrOqgYDFF1+EtfxmwmewMMB98D+gnJoVTLxkLZ7teXOfH/g8I02yB0JvRAu5DGbhee
	huVbmKlTfSf+K0BjjiwL86QOAOndHy9NSviP9IYOOnp6T2WI47BsjG+LfeUqzHHzKW5YwmMbUoXRf
	wynFZQPpA4zBMPnAdbpz3FALaWJ1AUDPMcUX5tOPSBDkf/EPjtYPFB3TvIh+dqoo3kG8+WPuFbWij
	cFe9RBchA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjgv8-0008I2-Ee; Mon, 30 Nov 2020 11:00:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjgv6-0008Hb-Gv; Mon, 30 Nov 2020 11:00:37 +0000
Received: from localhost (unknown [122.171.214.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95DC4207F7;
 Mon, 30 Nov 2020 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606734035;
 bh=3C6mZOAiilrrDhsn4gHtKKy29/Oth1UBYyR8wF7lPgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xK4SnG+/0O90XbkXzMOQdn+jifYegtaPQL0Ue0QT6Sgm1qem1/94bfm2yUxS4Eru2
 mO8aB2Y+21uaJYK1dpj08GBmkSbD1CP5xJXAZonl9Rlh6vkSVDnGD9eJgLIxZthTcL
 EV5615DQNFyqLrx7PK+6xNCRNkoVqo719wStwLRk=
Date: Mon, 30 Nov 2020 16:30:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] phy: amlogic: meson-axg-mipi-pcie-analog: replace
 DSI_LANE definitions with BIT() macro
Message-ID: <20201130110031.GQ8403@vkoul-mobl>
References: <20201120150347.3914901-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120150347.3914901-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_060036_644130_BF7578F0 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, repk@triplefau.lt,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kishon@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 20-11-20, 16:03, Neil Armstrong wrote:
> For consistency, replace DSI_LANE definitions with BIT() macro and remove the unused
> DSI_LANE_MASK definition.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
