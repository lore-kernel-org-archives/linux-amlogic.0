Return-Path: <SRS0=oWvG=AO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15E0C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 09:08:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9269F207FF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 09:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="paUcC+aX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="baOJ/PJA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9269F207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:From:To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1rN8l5C6spv8xk2zMN94ExE2a1I+iut6HbBMm6PzQE=; b=paUcC+aXmTgprqAInrVTZwsWvj
	ZpXwAmPHjQ/FDT95+twzkCGiHg63C7AEFNYo+YTTaUUofdsJWY8myTscd9lwyqo0ULx6XlSDQxnF5
	1/TUzRR13jLmWcqP6afy1r5xsNDIPUbLCY7lfbm1ZZUwO+0t5jLu/Dw/AG6nD57NxHy40pAhSq/QP
	KZv5jA1AywZwSapMaMWIYbwhhIN8qmbD6nat84iG9cjzq1B6NGFGGnSgS83hOly5BLALlE0AwD341
	CW9q5BOPRmPX4siPqsNruJ2Oxf2zC0CpL1Eq8vT9wQ0XBJRuEMP+UXGVacjFTEoexmqJs4IlA8e8J
	+NjzZhjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrHg8-0004LL-LY; Fri, 03 Jul 2020 09:08:16 +0000
Received: from mail-40133.protonmail.ch ([185.70.40.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrHg5-0004Jd-FU; Fri, 03 Jul 2020 09:08:14 +0000
Date: Fri, 03 Jul 2020 09:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1593767290;
 bh=50Eb/Y0e53WKbt5ES2NNmH1DcrZiBdBBPSjrZRHLhw4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=baOJ/PJAnC9mWvp2rRn7RZGSJ7x8stNUldq45n/lekJ3Xk2iJQMjhL7/3qSoXC1j+
 kO2G4Oamcvt5hEAE4qISxXVg2Hf788uP13ilRKuw4Q7jwcWvGZRqgEzr+6fT7pZA9Y
 tKJPDix3+HTUSS/rw0rMr89vVzymMQ3GrF3MgCsU=
To: Neil Armstrong <narmstrong@baylibre.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v9 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <RRm1buCbVQy5uesUHZhz8cPiCZfllmj0r1HzM7OoBmJBNMo9tuRfs3ju0iFnlPfDqECFq0tVj10h7bboBat7i619uNUN06HbwswBvYaPWMM=@emersion.fr>
In-Reply-To: <20200703080728.25207-2-narmstrong@baylibre.com>
References: <20200703080728.25207-1-narmstrong@baylibre.com>
 <20200703080728.25207-2-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_050813_806603_7A49DC69 
X-CRM114-Status: UNSURE (   2.84  )
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "jianxin.pan@amlogic.com" <jianxin.pan@amlogic.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Thanks for the update!

The driver should also disallow importing a AMLOGIC_FBC_LAYOUT_SCATTER
DMA-BUF from another device, but I guess this is clear enough ("not
transferrable between Amlogic SoCs").

From a user-space PoV:

Acked-by: Simon Ser <contact@emersion.fr>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
