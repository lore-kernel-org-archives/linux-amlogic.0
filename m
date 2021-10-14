Return-Path: <SRS0=MFto=PC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BD2C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 18:19:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47748611C2
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 18:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47748611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JAaJQ5+hlTw/96lV3RSQQy42zoMv1J6RfFIP9coKxQ=; b=oZwWQiFGSqjGOB
	aA7/52gETKQSpnSgzlkNUy1yY+E/yg6p68dSaSWP0CJzMJYYYW5xfKgMoXOzZRkvs3881EeaLolqR
	NdztpBHhjiftJRUlBprrb9pA4GyJNPs1iQh4GKwp0Qdp92W5uU8oT2m/KMMzGyADWeFM5/Uu+VFh2
	/pvdTXF/P5BkQtZby+aq3jk2Nf2LLWJaJSTqdxllOmc7d3OJEEWB7bIkk5J1U0NnvVKGACsVx/0Y1
	I7A7YKDQRSKdk9juRATsfhpdtdPd0yS935jeAn9nHIz0GsaWPFxpJ8pz1WBD1O34XdVM1IiT6QW/g
	Y6zpz732K/hW1k2qlmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb5KX-0045wO-Qg; Thu, 14 Oct 2021 18:19:49 +0000
Received: from mx2.smtp.larsendata.com ([91.221.196.228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb5KV-0045v6-Bh
 for linux-amlogic@lists.infradead.org; Thu, 14 Oct 2021 18:19:48 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 53e6d408-2d1b-11ec-ac3c-0050568cd888;
 Thu, 14 Oct 2021 18:19:53 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E13B9194B6D;
 Thu, 14 Oct 2021 20:19:52 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:19:43 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/meson: encoder_hdmi: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <YWh0vzsWFO4omDJ7@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-6-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-6-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_111947_565539_7FC6A32E 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Neil,

On Thu, Oct 14, 2021 at 05:26:04PM +0200, Neil Armstrong wrote:
> This implements the necessary change to no more use the embedded
> connector in dw-hdmi and use the dedicated bridge connector driver
> by passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to the bridge attach call.
> 
> The necessary connector properties are added to handle the same
> functionalities as the embedded dw-hdmi connector, i.e. the HDR
> metadata, the CEC notifier & other flags.
> 
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Look fine,
Acked-by: Sam Ravnborg <sam@ravnborg.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
