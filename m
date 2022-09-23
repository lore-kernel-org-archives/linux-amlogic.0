Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0630C6FA86
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Sep 2022 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjexbXfC9Hoy7zsZCnOxIB2NqyC+20imbuQiRVa0wV4=; b=N8flrMPToNFUhz
	NWQvECKNgcNWeXImOGjq5HPllAtkIIfROXFvtrS/0T6f/GYTtGJgAoONskJct7GVYWBRdODobglX0
	PFvq2L/CBwDM0lY4Dc9ZLsxl1jmUUXBmcAYdrUHWSyWItCmBeWIJI/vKYcj4dXO9tOPJdJUa2pTFn
	hcKNSQ1gKP7mt1bzw1Gvg7hU3cz6lO26iBk9evFgIX9QFcjkPCZEpB502As/jdyOEQkjyhzubEPZ1
	U5w1tOEmc/ogcN2neLsu+gclE1bKyU54G8+5TFIhWw44OXC4nIUjvwdTcY5gP6n3bOH5vnPcRS5LX
	KO3nLJQYbNy/Jveyrffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obepR-003Fbl-Tj; Fri, 23 Sep 2022 09:18:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obepM-003FZJ-Si
	for linux-amlogic@lists.infradead.org; Fri, 23 Sep 2022 09:18:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DDBF3B828CE;
	Fri, 23 Sep 2022 09:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB55C433C1;
	Fri, 23 Sep 2022 09:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663924709;
	bh=YeIXUIvKYOYKtRkb/Qswfyg+dBvZFn4qcVK5+GCbxFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1oz5zunqpwPuWjTITSmGTfRn8wjkEHZJKU8oA+zOHRVgyLLyS6bCzTisrVkn8yMNb
	 GLpKp3zXKv8zRbAJElEHNKsdYfhAKwAGj+QZA3YroAK7vj64cQ/BQXOICt8sGfYg3Z
	 CJRIwXqpzWFRCvbFghSclGFAN2/N2xw2GtMWKQ4A=
Date: Fri, 23 Sep 2022 11:18:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sasha Levin <sashal@kernel.org>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 5.15 247/779] drm/meson: encoder_hdmi: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <Yy154kHD7PPtj05W@kroah.com>
References: <20220815180337.130757997@linuxfoundation.org>
 <20220815180347.894058731@linuxfoundation.org>
 <892a917454bd0bbfe8a4d34a5170fe50@agner.ch>
 <685b64f60375b69c5c790286f1386be3@agner.ch>
 <YyBoACiWvW1UnfQA@kroah.com>
 <db3b3082-5278-7ed8-4322-2422cec227a5@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db3b3082-5278-7ed8-4322-2422cec227a5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_021833_243660_36B8CB20 
X-CRM114-Status: GOOD (  25.73  )
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

On Fri, Sep 23, 2022 at 11:12:02AM +0200, Neil Armstrong wrote:
> Hi Greg,
> 
> On 13/09/2022 13:22, Greg Kroah-Hartman wrote:
> > On Mon, Sep 12, 2022 at 08:48:24PM +0200, Stefan Agner wrote:
> > > On 2022-09-12 18:08, Stefan Agner wrote:
> > > > On 2022-08-15 19:58, Greg Kroah-Hartman wrote:
> > > > > From: Neil Armstrong <narmstrong@baylibre.com>
> > > > > 
> > > > > [ Upstream commit 0af5e0b41110e2da872030395231ab19c45be931 ]
> > > > > 
> > > > > This implements the necessary change to no more use the embedded
> > > > > connector in dw-hdmi and use the dedicated bridge connector driver
> > > > > by passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to the bridge attach call.
> > > > > 
> > > > > The necessary connector properties are added to handle the same
> > > > > functionalities as the embedded dw-hdmi connector, i.e. the HDR
> > > > > metadata, the CEC notifier & other flags.
> > > > > 
> > > > > The dw-hdmi output_port is set to 1 in order to look for a connector
> > > > > next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> > > > 
> > > > HDMI on ODROID-N2+ was working with v5.15.60, and stopped working with
> > > > v5.15.61. Reverting this commit (and two dependent refcount leak) to be
> > > > the culprit. Reverting just the refcount leaks is not enough to get HDMI
> > > > working, so I assume it is this commit.
> > > > 
> > > > I haven't investigated much beyond that, maybe its simple a case of a
> > > > missing kernel configuration? DRM_DISPLAY_CONNECTOR is compiled, and the
> > > > module display_connector is loaded, so that part seemed to have worked.
> > > > 
> > > > Any ideas welcome.
> > > > 
> > > > FWIW, I track the issue in the HAOS tracker at
> > > > https://github.com/home-assistant/operating-system/issues/2120.
> > > 
> > > It seems that backporting commit 7cd70656d128 ("drm/bridge:
> > > display-connector: implement bus fmts callbacks") fixes the problem
> > > without reverting this commit.
> > > 
> > > @Greg, can we backport this commit as well?
> > 
> > sure, now queued up, thanks.
> 
> Backport of 7cd70656d128 ("drm/bridge: display-connector: implement bus fmts callbacks") is still missing in 5.15-stable.

I see it in the 5.15.68 release as commit 590b4f10e3a4.

What am I missing?

confused,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
