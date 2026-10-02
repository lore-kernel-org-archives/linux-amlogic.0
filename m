Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ED9CA5FC4
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2026 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7uuvgGJtWj6Dlxr5RgvVfqmUvGwEUp9MwIZg6u90uw=; b=xg6oJ+mPYjh6D0
	Zm99LRPk4h1BgKy9ad7Gwm40WJT33it5xYXIMV6i2GUlTo1v+mLpYQh7TFgPEpNKoz2ErHgy5ZV2d
	0WGmNsH291Aghq+2y5I7sQ6mu42TTqhaq3v8/h+gmvqO01N4oTBX9mpwJ8XFUr7oyMl/xIj3PpYk7
	mTwJ0q3XBgclAq83Fju5e4r7F42hrz3knMWnRphp8ajK6pMcrYN4OuzUf5FkhsejDjarYL/zupOZ1
	I5Rake6DoX3yaF7VjbdTb31Rv8u1Tc8l9MmZaJiUBi9JvdyBFVkeDE9QT5zCAXYvO44iYtGq+rEMf
	ezIDeYCmrOlJAwuyXlUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZZl-0000000B9Io-2RgC;
	Fri, 02 Oct 2026 09:29:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZZk-0000000B9Hv-0B0A;
	Fri, 02 Oct 2026 09:29:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32DED60A79;
	Fri,  2 Oct 2026 09:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687341F000FF;
	Fri,  2 Oct 2026 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790933346;
	bh=SRoWf2wqbfBEbqSEq04DpriXW38jlq2Q9kbJqJbDTBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bpPbd0cMdYcoJq3bPxhGT7iCLiUS2nx4raPNJ3YwvA1/kIlvr1hGOgz8JNkG+uC6c
	 9LzQCfc6HA8X+FOsdJ0YPUAYssWOP9eprWDVQ2g5AMU0AxnyIrgBCDRVKmML9FX/a5
	 frPSwTp6S8qrPLSRI2/DKQgu3lKeFIsLCabbblFE=
Date: Fri, 2 Oct 2026 11:29:00 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
Message-ID: <2026100239-swarm-hacked-015e@gregkh>
References: <20260924110429.1557653-1-lgs201920130244@gmail.com>
 <ar8iVIgFdBpIbCsl@vbox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ar8iVIgFdBpIbCsl@vbox>
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

On Fri, Oct 02, 2026 at 03:18:38AM +0000, Thinh Nguyen wrote:
> On Thu, Sep 24, 2026, Guangshuo Li wrote:
> > dwc3_meson_g12a_probe() enables priv->vbus when the optional regulator is
> > present, but dwc3_meson_g12a_remove() does not perform the matching
> > regulator_disable(). The probe error path already disables the regulator
> > before rearming the reset control.
> > 
> > Disable priv->vbus in the remove path before reset_control_rearm() to
> > match the cleanup performed by the probe error path.
> > 
> > Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
> 
> We should also include Cc stable.

Maybe if the sashiko results are fixed first, this is dropped from my
review queue.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
