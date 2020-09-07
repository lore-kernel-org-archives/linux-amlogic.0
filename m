Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439E8C2BB84
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 10:54:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D567221481
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 10:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GJ7ducoE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D567221481
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7CmkZr11/f/N5Lz+COydbc5DH4PFeNnL7mP2hzvPxUs=; b=GJ7ducoEb0dvOPdn6MghIZKVc
	MV4ejLvLpjZx093ELKnrtmxUUbymrb7nk+HZsn1ibiCSGcN3bJD4QObfIOpM0OblPKEX0yaEtrhLQ
	fU8Fxk51RT9aPCmO36JiCTwB0Lw23l6BpIdWLBTY9gvtrAPUVnfdCy/nh2mUpxT/D/8mZMdjE0yws
	/r7Ux5KpQshBeU/Hn1lC6Xx4GxxuEjpMSKwo8bz7WfqHHejhur+cNw43/jde+dqX4ZcFAgOAVteUX
	mTE9ebJtxxtD8GfVDwLfD9YpXv5Jwzl//k2RyFVcR6jRNhUYZSQZmkIeZZQ59qhjjcSNsH5zdRWQU
	zAGypFSIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFEnJ-0002Ql-VH; Mon, 07 Sep 2020 10:54:41 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFEnG-0002PR-SF
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 10:54:39 +0000
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8F1C620024;
 Mon,  7 Sep 2020 12:54:30 +0200 (CEST)
Date: Mon, 7 Sep 2020 12:54:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] drm: panel: add support for TDO tl070wsh30 panel
Message-ID: <20200907105428.GA523433@ravnborg.org>
References: <20200904161504.23915-1-narmstrong@baylibre.com>
 <7e63abb2-89d1-3047-29c2-d312ba5ce16d@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e63abb2-89d1-3047-29c2-d312ba5ce16d@baylibre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=YRok_seE1VY6wa09Rq8A:9 a=CjuIK1q_8ugA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_065439_040459_1713D9AB 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: linux-amlogic@lists.infradead.org, thierry.reding@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 12:33:41PM +0200, Neil Armstrong wrote:
> Hi,
> 
> Please ignore this serie, the vendors patch is missing and the panel driver
> still has the vrefresh...
> 
> Will repost.

Please fix so DRM_DEV_* is replaced by dev_* logging.
We no longer use the DRM_ based logging for panels.

Drop drm_print.h from includes and fix build.

I did not read the code just noticed this detail.

	Sam

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
