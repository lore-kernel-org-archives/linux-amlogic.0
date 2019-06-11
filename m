Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F86C43218
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 08:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA7520657
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 08:53:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A8hkIX2f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECA7520657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+ez/rp5iqcVsllYRMN9GKHY2ZCKh1TxfXkBZFpfbdU=; b=A8hkIX2fDiM3oK
	EcJ0iB0FHQlWi9oFd2suOyTG0D2cLLBTjrwTA+i/ZlD0MAWXbPfJXToRSCVYL+ayBpW+DI8/nf1ng
	7IgvhOFb5kPN0U05qneBXT6aVz1sQwIJo68IBQh5gdROY18k5TmobPQen8DUHOds3p/Uc8OHkIer0
	RoWbKLAs7xx3gTCat2OHBRgQ60XvREYFuOdM8NNSBJFGslkTLwJKqPmomqPN44gw0+WT4H5nRoWHr
	WsSMm7LWqYVuPFAlYK9KSWreYB8oB6sWAj9gWAEFacf8xi4XQYDV+Famk6iE9as7t38Ra8l8ZCDql
	Llq3XUfRWHHrv8gYCCaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hacXE-0001FJ-7W; Tue, 11 Jun 2019 08:53:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hacVu-0000GQ-JS
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 08:52:20 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hacVl-0000Hr-C9; Tue, 11 Jun 2019 10:52:09 +0200
Message-ID: <1560243127.13886.3.camel@pengutronix.de>
Subject: Re: [PATCH v7 2/4] media: videodev2: add
 V4L2_FMT_FLAG_FIXED_RESOLUTION
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hans Verkuil <hverkuil@xs4all.nl>, Maxime Jourdan
 <mjourdan@baylibre.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>, Hans
 Verkuil <hans.verkuil@cisco.com>
Date: Tue, 11 Jun 2019 10:52:07 +0200
In-Reply-To: <9731b2db-efd4-87d0-c48d-87adec433747@xs4all.nl>
References: <20190531093126.26956-1-mjourdan@baylibre.com>
 <20190531093126.26956-3-mjourdan@baylibre.com>
 <9731b2db-efd4-87d0-c48d-87adec433747@xs4all.nl>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_015218_839672_F8283A47 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2019-06-05 at 15:39 +0200, Hans Verkuil wrote:
> Hi Maxime,
> 
> I am wondering if this flag shouldn't be inverted: you set
> V4L2_FMT_FLAG_DYN_RESOLUTION if dynamic resolution is supported,
> otherwise it isn't.
> 
> Can all the existing mainlined codec drivers handle midstream
> resolution changes?
> 
> s5p-mfc, venus and mediatek can, but I see no SOURCE_CHANGE event in
> the coda drivers, so I suspect that that can't handle this.
> 
> Philipp, what is the status of the coda driver for dynamic resolution
> changes?

FTR, to my knowledge there is no dynamic resolution change support in
the firmware, as there is no signal (interrupt nor picture run return
value) to indicate that different headers were parsed.

I am planning to add the initial source change event required by the
current decoder API documentation, but I am afraid there will be no
support for source changes due to mid-stream resolution changes due to
firmware limitations.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
