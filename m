Return-Path: <SRS0=ToB4=FP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929C1C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Dec 2020 07:36:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A8023B26
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Dec 2020 07:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A8023B26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ap94UegXnlFU0apmfbZeyqxt+PkRHI3Uxfb6dxnL3iQ=; b=AZm1y0XaMhmX1wbbEtD7eIRu8
	eTUbQufhnqXQ2jDXsMn9ZdgNRDEjn2TwZQSDLGuJCOtCXR0ICbtzCY8lRuP+XY+ZcT87n+U7N96Uz
	9+WCnl5w9DVR1kBN0WF85sB9fEmP4pn3vOlehYuigxyOMwf3DF20SOFFcIPRVl/PYRPx8MPxjb9MP
	xcv3oTXqVp5qaW9LMPhU0V6qFVQegK4O2Gz3k9cmMfQhAva9GH0sRMrGXWsZwa0VGBDqW/VgCYyss
	Omdn8nHZ+bW5/6/SWsYGSuWWqHSTGscizrIh4d136Rc70/fE1haCvo01NEYrrki8dnxXGij7iilJm
	XH38xpd5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kncy3-0004J1-IE; Fri, 11 Dec 2020 07:35:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kncy0-0004IK-TX; Fri, 11 Dec 2020 07:35:53 +0000
Date: Fri, 11 Dec 2020 08:35:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607672151;
 bh=8AbZCmDfqKDvHxoCuVW4WLU89B01yMKgvgl4yqkgEx4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zh7yM7u5/Q06SZrRs3vMG1jOFlU3XcBMqDgVCWdOHNTwX+Tgfges+wl5RQmzQZ+jc
 ke09Jt6iYZkorOrG3ZYIOa2bBitrNK3J0kAuNvAgqEzVSv4WTb6pwakN2JvI3+P8ii
 kAzfF1xD2wDhqUt1t5RQdkCuxVo1rx36yb5plKok=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] tty: serial: meson: enable console as module
Message-ID: <X9MhUoLt3O12nA5R@kroah.com>
References: <20201211005744.12855-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211005744.12855-1-khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_023553_047274_5C3D733D 
X-CRM114-Status: GOOD (  10.55  )
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
 open list <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 04:57:44PM -0800, Kevin Hilman wrote:
> Enable serial driver to be built as a module.  To do so, init the
> console support on driver/module load instead of using
> console_initcall().
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
> Yes, I'm well aware that having the serial console as a module makes
> devices hard to debug, so I'm not changing any default behavior.  The
> goal is just to enable building as a module for environments where
> serial debug is not available or needed.

It's a good goal, I'm all for it, thanks for the patch!

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
