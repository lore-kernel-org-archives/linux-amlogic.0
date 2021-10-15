Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EACC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 18:13:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C066861073
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 18:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C066861073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LIqLKGXCosHeLShNVKz6SArDxTEL1EN8Wf/h4eE8WtE=; b=aDoIT3OZs5aA0x
	9RJBrMgI+1USLMtW3FShBhjSA9ctoeuSWRm8uLh8/HoDIdGO8199EL46bsHOZS1Kt1XKK4jXdZHNI
	CK26/JX1Yyueg7sNPSX5sGBdNNaEX0PtIy5o6eajOgvAT22IJxDw9SBqw8n2BEP8ADxDwC/Hx1NnV
	Qzo4AWiGYTr04k/cZ4AF3/GSp7/szr/4rarI+tGXQSEUmBU1a2NPfPjWC7S0K21Ax+H7FEji0i26G
	CPvT8DvymE9V05F8+gt+57O0mcn0BgwDDXGR0kthVeM91zEjlrYA8Z8T2yLLXqPaZesDEUrII2JOD
	hmXsPDpuxWcpcWemTAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbRi9-008OvT-Jd; Fri, 15 Oct 2021 18:13:41 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbRhz-008OtB-2i
 for linux-amlogic@lists.infradead.org; Fri, 15 Oct 2021 18:13:32 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 9571a653-2de3-11ec-9c3f-0050568c148b;
 Fri, 15 Oct 2021 18:13:22 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 51FD9194B53;
 Fri, 15 Oct 2021 20:13:29 +0200 (CEST)
Date: Fri, 15 Oct 2021 20:13:19 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] drm/meson: split out encoder from meson_dw_hdmi
Message-ID: <YWnEv2B26/3XWH/O@ravnborg.org>
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015141107.2430800-4-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_111331_293323_7B82F0AF 
X-CRM114-Status: GOOD (  15.15  )
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

On Fri, Oct 15, 2021 at 04:11:04PM +0200, Neil Armstrong wrote:
> This moves all the non-DW-HDMI code where it should be:
> an encoder in the drm/meson core driver.
> 
> The bridge functions are copied as-is, except:
> - the encoder init uses the simple kms helper
> - the mode_set has been moved to atomic_enable()
> - debug prints are converted to dev_debg()
> 
> For now the bridge attach flags is 0, DRM_BRIDGE_ATTACH_NO_CONNECTOR
> will be handled later.
> 
> The meson dw-hdmi glue is slighly fixed to live without the
> encoder in the same driver.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Looks good,
Acked-by: Sam Ravnborg <sam@ravnborg.org>

With this I have covered this nice series. I am happy to see one more
display driver that embraces fully the chained bridge approach.

	Sam

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
