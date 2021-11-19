Return-Path: <SRS0=1mM9=QG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C633C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Nov 2021 19:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E0D561AED
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Nov 2021 19:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E0D561AED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVGPQGbXHko4Vjf5i+XZZpYjj4lTpQ/wqwY1JQJly58=; b=1o2qhPpUQYedjq
	9s7jEa5sQTLVTG1p3AXMRoR/CLMxMimARHyTAiM5626YBRox3BzhnqKeAGEu7QW+97ytAwt8KWn4Y
	GIH5VgJYKKhTg4DDzRRnIXReRERubQp/VnTeiwtP8Sp4v3gVLKND/EwjgSJgg1sNh+LV+uWHaYeiE
	Pj7MheGy5tLn9n25uX8UNZdKBkQBMzC9k1RtUV2d1aZgKjjdw45JyFRuuJAFG56pdUMUQJ//15Vmr
	GCumTguO8j/+b9MOPuwHTjF/Ngzj6/1Q3ibxKOp0Zdbz69O1sPh8aQguC/Oa4Aj1Smo7z7skxgMnI
	NOuCy2HrJbsG2iA671Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo9Xv-00BSmr-M8; Fri, 19 Nov 2021 19:27:39 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo9Xr-00BSlJ-AN
 for linux-amlogic@lists.infradead.org; Fri, 19 Nov 2021 19:27:37 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso9615118pjo.3
 for <linux-amlogic@lists.infradead.org>; Fri, 19 Nov 2021 11:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=lsppzZdzu+Waonf7w8q0N1vP3OgbHGJj0JhrjEEHC0w=;
 b=sdsdx0ECSB96vcQ3k2RO6euUeTaYzHNHHySgOi1TWAYLU6aP/1JhKuvNFr7RTpC6wb
 ZJOhnbwQv7hWRqgvDpkXlLfamAhJgZRNEFrqcS7JYOSsCOKUbiJFsxNpTCLytXXsrH8l
 vjkAxpXsYiBZ6XgtI6NKAP8v2xXKyXzwrJD8j847Oq4q/LAUB2G8I3JOah1ktjceP/YP
 skeEwcTQ0ANnl6g8jWvtd0oRXQ8o53eGfB/hAYUkotB719+ftf1/zbRFnqM1nfjxzC9V
 r93Vmx+P5JJ2uT6DMdMHE15dVCbRsEzDYMgS+fZjbP1F5z3/fvnxr5hzvkg1Bw1myizB
 rE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=lsppzZdzu+Waonf7w8q0N1vP3OgbHGJj0JhrjEEHC0w=;
 b=61TvjMYJaPgtqgMe90z6+kRDD3TL8+GxgpktXn7BxJhGcvV4CVeQvPHAABhvYDGxVz
 hZTS2/ynVVQEZzVeZar/PikSlO9PkR3A4+PajkklqqdFGWJA8LLG5JDOq41HoZsoGetj
 AXQwcJe28IfPLp4sKb5v/TfyE1yDURi7z5umPG9bzk+z1mNrvFBlFesPByfn7fnG7Bkw
 bPxOeirv6Gz+tX03Rznekrp5ajPCgvKgU5zROJvIiEe67NtSjx8hC3oelOUyKRQJjZZL
 N8S3JilBXFqfWpFk6HTr5VMEea8zsHh58+b8ROdpUtTZEdZhPx77MMldTartVURJ/1lZ
 79Yg==
X-Gm-Message-State: AOAM531CyBdoRf17heODO7DCPkwMUdjynqXC5jVtkk5NeDSPpLgi76DI
 V32nMi+kLo3rhMe86bQiq2czyQ==
X-Google-Smtp-Source: ABdhPJxOo/o7SIb2aVYrZEfxQvdQltW4IlVreuuhSwTq9VHRSiasfHQpkb2LnTZ+qwuAmLwg8QEVFw==
X-Received: by 2002:a17:902:b28a:b0:142:3e17:38d8 with SMTP id
 u10-20020a170902b28a00b001423e1738d8mr80719122plr.56.1637350053331; 
 Fri, 19 Nov 2021 11:27:33 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id mp12sm11291688pjb.39.2021.11.19.11.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 11:27:32 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 0/3] usb: meson: fix shared reset control use
In-Reply-To: <20211112162827.128319-1-aouledameur@baylibre.com>
References: <20211112162827.128319-1-aouledameur@baylibre.com>
Date: Fri, 19 Nov 2021 11:27:32 -0800
Message-ID: <7htug854kb.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_112735_452409_A1761163 
X-CRM114-Status: UNSURE (   9.88  )
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

Amjad Ouled-Ameur <aouledameur@baylibre.com> writes:

> This patchset fixes a usb suspend warning seen on the libretech-cc by
> using reset_control_rearm() call of the reset framework API. 
> This call allows a reset consummer to release the reset line even when 
> just triggered so that it may be triggered again by other reset
> consummers.
>
> reset_control_(de)assert() calls are called, in some meson usb drivers, 
> on a shared reset line when reset_control_reset has been used. This is not
> allowed by the reset framework.
>
> Finally the meson usb drivers are updated to use this new call, which
> solves the suspend issue addressed by the previous reverted 
> commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
> use").

Tested-by: Kevin Hilman <khilman@baylibre.com>

Tested suspend/resume on Khadas VIM3 and confirmed that the reset
warnings are gone.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
