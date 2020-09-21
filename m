Return-Path: <SRS0=01f4=C6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06F3C43463
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 09:17:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 686DB214F1
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 09:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NRxQhVW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 686DB214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kYHAlPd3ZupLaVZWj33pzAFU02w5WtZBCWElr3E5HnU=; b=NRxQhVW3zE/335OTdTqYFTKco
	W+lKfi0tndPiQjBncS1onRMwl4kIJ2jrx3sW3lv5gecCyMk4FbRPvyN6WTSQ/3pWHfN0sKyUf2jJt
	1Y0wEXtmaAGCLSoN8X26LbG5Sggv/yuR4Gdq/2I94DFkrx+p9IDXpvJKW+mbj05Q4z9yv48eKw8ct
	sAbFrQ3AGp1+qqTzdMtGu91gSvY7XaZzhLEOKOV2Pz01QkDAQRFVi+KpQouR3P+6qbmGUynCrKDQI
	/mwm7wg/XUmJ3kAYdW0T8rO96EZuZ715anDcgn96rip4pLKlkOYPJ/pEvQUosFSuzFV2XeWe+oX5q
	hw/ToGEaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKHwl-00063m-T3; Mon, 21 Sep 2020 09:17:19 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKHwb-00060E-Va; Mon, 21 Sep 2020 09:17:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A35C330E;
 Mon, 21 Sep 2020 02:17:07 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FB763F718;
 Mon, 21 Sep 2020 02:17:06 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] drm/panfrost: add Amlogic integration quirks
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200916150147.25753-1-narmstrong@baylibre.com>
 <842c31f7-3b59-6442-d4ca-c5dcc2317a04@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <119253ab-a677-8f1c-75c2-2005ca38dbee@arm.com>
Date: Mon, 21 Sep 2020 10:17:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <842c31f7-3b59-6442-d4ca-c5dcc2317a04@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_051710_098647_0B1FC578 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 21/09/2020 08:52, Neil Armstrong wrote:
> Hi Steven, Rob,
> 
> Should I send a v3 with the commit log fixes ?

No need, I've fixed it up and pushed to drm-misc-next.

Thanks,

Steve

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
