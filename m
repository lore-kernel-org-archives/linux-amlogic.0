Return-Path: <SRS0=WwkR=X4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323DCC32792
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 18:03:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0123C20862
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 18:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VPlPr9mL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0123C20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkT+GnR42c6sqDPljvnudSFuoUvtlZgEJMWWpUZihxg=; b=VPlPr9mLt2M/+V
	6V4aaqJ7H+OIS3Q4OTF62xJzXanMZ8E3zW9D3pDApnYvSWg51If21lrp+i4lwYsjxcqiHCImXs2Wa
	o+h9HLbq60w39tmHL+corraANwAzXwqPIi/xWvdcUVv+CbPJUjt/PWfeagmqHkTZHsN2TmWwsFrSB
	EGJmV21q03HnTqXypp4u8WwTuSX4jk5qbL5/JB8rWotqL2FMNn9VNvDqwiqTSpIBC/pvM9K935FRu
	PKU7DAhaX6/8QxoCCvobW+PQWqSdOTUPznFKfegPGxS3GX8pBL2af54ZUomPDiYf6Jl+VtR1NjByu
	Xi0uoRDGmELtvLhMVMfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG5Rh-0006KP-Ug; Thu, 03 Oct 2019 18:03:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG5Re-0006JZ-SD
 for linux-amlogic@lists.infradead.org; Thu, 03 Oct 2019 18:03:20 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1iG5Rb-000388-4I; Thu, 03 Oct 2019 20:03:15 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <pza@pengutronix.de>)
 id 1iG5RX-0006fI-4j; Thu, 03 Oct 2019 20:03:11 +0200
Date: Thu, 3 Oct 2019 20:03:11 +0200
From: Philipp Zabel <pza@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/2] reset: meson-audio-arb: add sm1 support
Message-ID: <20191003180311.hlv7s32twzcaxj3x@pengutronix.de>
References: <20190905135040.6635-1-jbrunet@baylibre.com>
 <1567693618.3958.4.camel@pengutronix.de>
 <1jk19oregr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jk19oregr.fsf@starbuckisacylon.baylibre.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 20:00:35 up 88 days, 10 min, 55 users,  load average: 0.43, 0.19,
 0.15
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_110318_912124_CA07C0EE 
X-CRM114-Status: UNSURE (   7.60  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Tue, Oct 01, 2019 at 11:40:20AM +0200, Jerome Brunet wrote:
[...]
> Looks like this patchset missed v5.4-rc1.
> Could you provide a tag with the bindings to Kevin so we can use the IDs
> in DT until the next merge window ?

Does

  git://git.pengutronix.de/git/pza/linux.git reset/meson-sm1-bindings

work for you?

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
