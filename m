Return-Path: <SRS0=MFto=PC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6E9C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 18:16:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70DF6610EA
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 18:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70DF6610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVvwbwmrG7WLC5YlZgtPaNPgIwuS2Vx4Jn23imG37vw=; b=V28UlTYbYeP9NA
	UizqvyL5O4VZ3U2C9HGI8xSRDjeb+sVb9j/MAkX263+hhIX4WF93sVymTvwKV1qumrHOTjYsUDG7d
	nytFvfaLSLooU6/HFD+T3F3LSznXLMHigbIdNtCsE2XOimt75VzkyQr0JRBptrTXcB7dHrX1zlh8Y
	PF70uk/uDJzet7M2moEOMvIeVwibx/5AnlKFeoLLc6rsaavNwrfXKv3O5BRNBTFqsj8laheORafNq
	dkXbhj5IJcXjXzEB+93YnrODQyCMt63wLasflI3tfkkVFOFV31y6D1ZHIcAxvNlookKU0yxVSuNSY
	CzLtM7nNSezCA3lmh9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb5H1-0044m1-LK; Thu, 14 Oct 2021 18:16:11 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb5Gn-0044fB-Tt
 for linux-amlogic@lists.infradead.org; Thu, 14 Oct 2021 18:15:59 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id ca676dd6-2d1a-11ec-ac3c-0050568cd888;
 Thu, 14 Oct 2021 18:16:02 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3EBE4194B6D;
 Thu, 14 Oct 2021 20:16:02 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:15:52 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] drm/meson: rename venc_cvbs to encoder_cvbs
Message-ID: <YWhz2Mgb4Q5OEIyR@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-7-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-7-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_111558_184520_F216E261 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Oct 14, 2021 at 05:26:05PM +0200, Neil Armstrong wrote:
> Rename the cvbs encoder to match the newly introduced meson_encoder_hdmi.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
