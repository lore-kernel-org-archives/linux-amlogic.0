Return-Path: <SRS0=vjaz=ZE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7138FC43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 05:32:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D68D21925
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 05:32:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MKqUD7jd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yREQL2uq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D68D21925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9951Il9Nq5A1wPtXVKdYKjRWWwE1sHj7N6tMnzWGcQ=; b=MKqUD7jdo50tal
	KTcvGFv5Xf/TZ6q2uzbo8GpZMXSxIdAg8KxX8zrrOPC9kU3DzyvXjtJ/J4OKRpMfzAZGUUBSVN076
	z7FvDrAlUoRFUdBKR690FM/Y5pIcR/Ty2fHgED9z/mI5xrcmwCEPwxq7hsHjIbICvb98n78zOws92
	l9xpIoKXlkGtUJxx0WHUkc7TfuF3TDSWU96UskQRiWhG8W6nS4hap2uIXEuvFgwgRIObX+XB93mE4
	kWl7Qy3w4H5BVGjZDuIM2vvhJWWMSNMPieaeVIWw2W8+XgQ3m5qYd46QBziyn9zQ2Ft12Umoc+uK4
	4LDmJZVNosV4Y1bbSThA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUOmz-0004Pj-AD; Tue, 12 Nov 2019 05:32:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUOmw-0004OG-L8; Tue, 12 Nov 2019 05:32:28 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B250821925;
 Tue, 12 Nov 2019 05:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573536745;
 bh=lFiSF9q/Q/xxTvm6x//n2RwUraJ7FAvLWNteiLBYpBo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yREQL2uqzE5jVpRoydpr3hHQWGThJUiK0JZ0VB764etqg9/02wKHrPZaJLYX+Pm6p
 AlK+yReNr0+3NWnc7NhV6aD73Jq2EurGGv0EiauCElNiJrq0zpTMJcddNjCDcS3bgJ
 F67bQ43FkabEisW2tm4HeqUGGioJo2M7CuyHC+jo=
Date: Tue, 12 Nov 2019 06:23:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device() helper
Message-ID: <20191112052347.GA1197504@kroah.com>
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de>
 <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_213226_735483_3DB9D54C 
X-CRM114-Status: GOOD (  19.14  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-realtek-soc@lists.infradead.org, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-omap@vger.kernel.org, Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Nov 11, 2019 at 09:10:41PM +0100, Andreas F=E4rber wrote:
> Am 11.11.19 um 07:40 schrieb Greg Kroah-Hartman:
> > On Mon, Nov 11, 2019 at 06:42:05AM +0100, Andreas F=E4rber wrote:
> >> Hi Greg,
> >>
> >> Am 11.11.19 um 06:27 schrieb Greg Kroah-Hartman:
> >>> On Mon, Nov 11, 2019 at 05:56:09AM +0100, Andreas F=E4rber wrote:
> >>>> Use of soc_device_to_device() in driver modules causes a build failu=
re.
> >>>> Given that the helper is nicely documented in include/linux/sys_soc.=
h,
> >>>> let's export it as GPL symbol.
> >>>
> >>> I thought we were fixing the soc drivers to not need this.  What
> >>> happened to that effort?  I thought I had patches in my tree (or
> >>> someone's tree) that did some of this work already, such that this
> >>> symbol isn't needed anymore.
> >>
> >> I do still see this function used in next-20191108 in drivers/soc/.
> >>
> >> I'll be happy to adjust my RFC driver if someone points me to how!
> > =

> > Look at c31e73121f4c ("base: soc: Handle custom soc information sysfs
> > entries") for how you can just use the default attributes for the soc to
> > create the needed sysfs files, instead of having to do it "by hand"
> > which is racy and incorrect.
> =

> Unrelated.
> =

> >> Given the current struct layout, a type cast might work (but ugly).
> >> Or if we stay with my current RFC driver design, we could use the
> >> platform_device instead of the soc_device (which would clutter the
> >> screen more than "soc soc0:") or resort to pr_info() w/o device.
> > =

> > Ick, no, don't cast blindly.  What do you need the pointer for?  Is this
> > for in-tree code?
> =

> No, an RFC patchset: https://patchwork.kernel.org/cover/11224261/
> =

> As I indicated above, I used it for a dev_info(), which I can easily
> avoid by using pr_info() instead:
> =

> diff --git a/drivers/soc/realtek/chip.c b/drivers/soc/realtek/chip.c
> index e5078c6731fd..f9380e831659 100644
> --- a/drivers/soc/realtek/chip.c
> +++ b/drivers/soc/realtek/chip.c
> @@ -178,8 +178,7 @@ static int rtd_soc_probe(struct platform_device *pdev)
> =

>         platform_set_drvdata(pdev, soc_dev);
> =

> -       dev_info(soc_device_to_device(soc_dev),
> -               "%s %s (0x%08x) rev %s (0x%08x) detected\n",
> +       pr_info("%s %s (0x%08x) rev %s (0x%08x) detected\n",
>                 soc_dev_attr->family, soc_dev_attr->soc_id, chip_id,
>                 soc_dev_attr->revision, chip_rev);

First off, the driver should not be spitting out noise for when all goes
well like this :)

Anyway, just use the pdev pointer here, not the soc dev as that is NOT a
pointer you have control over (as is evident by the fact that you need
this call to try to get it.)

I'll look at your other instances later when I've had my coffee...

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
