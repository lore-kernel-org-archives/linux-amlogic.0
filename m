Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA37C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 21:12:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA1ED233FC
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 21:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hVqbkr0r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA1ED233FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMsk1jPl8qIsOBtvbB6vnBmbRRmWoxYt3R5HJG/oss8=; b=hVqbkr0rcnzYjT
	FuP9at2LoXk4LnroIRXyKgcoi5xzWLzkqfljDvc7KvVSBYUhUjK6krjQj1ZFOVTehJ4L6PjS+qf4a
	dMnZ4nF1c1CiiFV7omaSyngCBBIB3yLAiOk0sShEaa45FN1QgIBwkJFWAacxdlv/S2h3uQTff3IcW
	otm10qNOLpn+mGRyzMsAscoTcyFvQBHbXve5/ma/zErofrNAjdU+Cx+Ot07r3WUXitrTWulXV5O6n
	9zp627EGgsaOwRR4G7nHiTn29eXmLp+j4ZvDWFUWtlED/OWns+rS57zgchJ0LpdulW2/cbJaQrp3w
	eeIzAnR9IPGg9WSNHwFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0uNH-0004I9-3H; Thu, 22 Aug 2019 21:12:03 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0uND-0004FI-JZ; Thu, 22 Aug 2019 21:12:01 +0000
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr
 [90.65.161.137])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3AB5D240007;
 Thu, 22 Aug 2019 21:11:48 +0000 (UTC)
Date: Thu, 22 Aug 2019 23:11:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v3 2/2] rtc: Add Amlogic Virtual Wake RTC
Message-ID: <20190822211147.GB27031@piout.net>
References: <20190812232850.8016-1-khilman@kernel.org>
 <20190812232850.8016-3-khilman@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812232850.8016-3-khilman@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_141159_821500_AC19E38A 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 12/08/2019 16:28:50-0700, Kevin Hilman wrote:
> From: Neil Armstrong <narmstrong@baylibre.com>
> 
> The Amlogic Meson GX SoCs uses a special register to store the
> time in seconds to wakeup after a system suspend.
> 
> In order to be able to reuse the RTC wakealarm feature, this
> driver implements a fake RTC device which uses the system time
> to deduce a suspend delay.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> [khilman: rebase to v5.3-rc, rework and modernization]
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/rtc/Kconfig          |  11 +++
>  drivers/rtc/Makefile         |   1 +
>  drivers/rtc/rtc-meson-vrtc.c | 156 +++++++++++++++++++++++++++++++++++
>  4 files changed, 169 insertions(+)
>  create mode 100644 drivers/rtc/rtc-meson-vrtc.c
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
