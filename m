Return-Path: <SRS0=naQK=AN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAABC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 09:23:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1FE20702
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 09:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RP/Vv1YR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="IkR8+okl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1FE20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:From:To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFt7Av2ZXguwuEevkQ2qpyjbW5IMooyDCNuPo/KuW/E=; b=RP/Vv1YRnmBVls4PPgJJxcHuRH
	H/k322ZreOePmNiHrGvWGhwGqelkhrgnclYYVvubM7hYigNx7OoT7tIBuoHtCsJmTizUaE3cJgyAW
	rtlO2ZBsT2E31FkHDwL4sH7/SYXM/lvhw9wl9DDTCR2VrhUTbCPli0Fkg+IFjFCxS3Fgwz/qdNVp3
	czDBUQfaeX8DI36QGx6vlGOcghM2xocJNWDOTnVvkgmF1y3une+ku5OiAXqqXAAvfnyNu0lYfLXo4
	ZvpowmLVS58awZqgwRs4h8qmDUGIT4WcvVdFFsfaY+nJUOaoNOHPRIZuJB1+zhoB0/sH61XlPmiSs
	qbS+GlBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqvRG-0007xF-Fn; Thu, 02 Jul 2020 09:23:26 +0000
Received: from mail-40133.protonmail.ch ([185.70.40.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqvRD-0007vK-5d
 for linux-amlogic@lists.infradead.org; Thu, 02 Jul 2020 09:23:24 +0000
Date: Thu, 02 Jul 2020 09:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1593681797;
 bh=EJT6kTJtM5+ySWMxszu/DdczoOnQv320IEAHL8sPdNc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=IkR8+okl82HMk6lp5WbqQwPg9K6uTi/dg5MMRhR4Z/MD+mZZPmbDoyFVQR0AO5EG/
 VZLs2hswaYP7yUFHs9BiS8G17VKFJd2qzNBVUPjYzKAopjWi4E7QYG2hCTYXRHXMQG
 MyjLWVdZt2RZNMAsei9VKX8pZOHdsWdolpxoD+0M=
To: Neil Armstrong <narmstrong@baylibre.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v8 1/6] drm/fourcc: Add modifier definitions for
 describing Amlogic Video Framebuffer Compression
Message-ID: <8cBfZpkc4pHBLhihlvJMD_Hq1DEsNRcSY4Y8JaGwklMWcxiYzUMVEx7wH9f_DuCBMVUhXvOR0PcHVslILtKI2wdw79Nfih0N3VnrxfMQd08=@emersion.fr>
In-Reply-To: <20200702074759.32356-2-narmstrong@baylibre.com>
References: <20200702074759.32356-1-narmstrong@baylibre.com>
 <20200702074759.32356-2-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_052323_357882_72C420E1 
X-CRM114-Status: UNSURE (   3.71  )
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
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thursday, July 2, 2020 9:47 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Finally is also adds the Scatter Memory layout, meaning the header contains IOMMU
> references to the compressed frames content to optimize memory access
> and layout.
>
> In this mode, only the header memory address is needed, thus the content
> memory organization is tied to the current producer execution and cannot
> be saved/dumped neither transferrable between Amlogic SoCs supporting this
> modifier.

Still not sure how to handle this one, since this breaks fundamental
assumptions about modifiers.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
