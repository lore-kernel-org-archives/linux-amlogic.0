Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FE3C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jan 2022 19:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izi3c2nn38E02UQbO7QxXawqHsvT4UY3V8sEXH9usHg=; b=Wya9o4tTMTclm1
	UsGysJGehuOr8LNty5ULu6CjEqdI2tgRO+uRw5AWAizBu+/oKcDJew76F1/NtndlgpMTHXqE1TCrn
	oPvRSOF9p6tXk3R0QxkFW7jsNOSUkZbWhQhs6mnfFN2ztfzPx/8CUu/eDgoVcHNqc9gJFWweuWfte
	JKnZnRO3NPcVQUdjVIVMWP2oUeCn8JIcc91Qbm3bALJkhICbegxlHsCN32ZBWuZPZ7bdLOOBM+P7O
	jgrFWH3SFVwVcQbTT01IAJtJrHSE/yPeeWz/pT3ZNPKyGVdSWgsF2+RgvsOP5HzrIvxW6jw6VajKw
	fPGPYXLPJJ8C6PD+gZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Y5Z-001ApK-8P; Thu, 06 Jan 2022 19:06:17 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Y5V-001An9-EF
 for linux-amlogic@lists.infradead.org; Thu, 06 Jan 2022 19:06:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id s15so3095071plg.12
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jan 2022 11:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Zsjxxw6pd4DdvZ9ARrFvDZnuIXFpfJxLz7WO0wCernQ=;
 b=aPDN54U5pkO5HHNN6o/d+Wa46jM8wSiiODG4x4hx33hrw4OfsqihQg6zGV32Nj2zax
 JanNwsFLN7TQup4lMAwYXzxS84trjw6x7/2pIIngpus6+Hssuuj1jxFjOt1qcbui6bpZ
 6AmUuehvcx4mr6QOG8ewp7Cb1IlOODwTu/hDVjZ4VR9tvO5+MY+aNXQ0Fo730QUdACHZ
 Yow2dzJLGzg4AcMPAWd4xVEUGzJVD6GxhcxA90amuZ5C5hseVYIVuBRtwS00ZZe/bpWb
 lAY4zAiuU3op47BJHysCARxVDHEyM4Xy+uuTB+N6Qiz2ZVnKNLkTCZe7ks1VM2zVWO8x
 D8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Zsjxxw6pd4DdvZ9ARrFvDZnuIXFpfJxLz7WO0wCernQ=;
 b=XlNRSHHB/nHQEUkHnmQmtvXEI2NsFr2dcRtt7vsukcq0/gIohybucDnaI0RO4uwjXb
 oGo+so78BZgZT7jlIKrmCKNrsYxaRdwCH4cu8+sEZLIHc9GhtfnvhVhpwz+dITbNwVA3
 tY2495Kf7ADRy5Ah3mCY4FVGyhnE9qo3lVV2LXM5rLCFKD1jrRK657pP4OmCMrvBp+se
 k5XIt9WyHD1qiitU/1f7W7ZIjy52lF1/ZrB91f0lFWfAalDS1FwmDXaUVGt5YNRCsiM+
 vh60u0nSXPK5EHMDVlOnbm4OqGGLh32hxEkoHjBmwU+QS5PFBkLcOrlfu5prmZ6rGPg4
 nJKw==
X-Gm-Message-State: AOAM531CFyxdrVk7Ael6lLgzthk8MKl/oFea4zktxHY+HeymXJzzDLRj
 IYtHaZNfgYEJXkMJLbUCpcflyQ==
X-Google-Smtp-Source: ABdhPJyxOxZKTJqgzSxRXlJWQk0gUdFo548NlJxlwKKYwpOb8FAbfo+BhY8W4Pz7mnZZ/bRCO95gCA==
X-Received: by 2002:a17:903:24d:b0:149:b68f:579 with SMTP id
 j13-20020a170903024d00b00149b68f0579mr24075313plh.1.1641495971463; 
 Thu, 06 Jan 2022 11:06:11 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id z18sm3468833pfe.146.2022.01.06.11.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 11:06:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 0/3] usb: meson: fix shared reset control use
In-Reply-To: <20211212201844.114949-1-aouledameur@baylibre.com>
References: <20211212201844.114949-1-aouledameur@baylibre.com>
Date: Thu, 06 Jan 2022 11:06:10 -0800
Message-ID: <7hv8ywr8f1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_110613_577455_932FDE95 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Amjad,

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
>
> changes since v4:
> - call reset_control_rearm() after clk_prepare_enable() fails
>
> Amjad Ouled-Ameur (3):
>   phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
>   phy: amlogic: meson8b-usb2: Use dev_err_probe()
>   phy: amlogic: meson8b-usb2: fix shared reset control use
>
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
>  drivers/phy/amlogic/phy-meson8b-usb2.c   | 9 +++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)

The cover letter prefix is "usb: meson" but all the patches are for
drivers/phy.

Could you collect the reviewed-by etc tags and resend to the PHY
maintainers and linux-phy list?

Thanks,

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
