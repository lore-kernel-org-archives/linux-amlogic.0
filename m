Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B99C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 17:40:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6080E21556
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 17:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jfpVI5QK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MCD49OCi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6080E21556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKHmgmoEcaNdXUBr9+4Hc9kUHNQZZZDlEMujCF1XFZI=; b=jfpVI5QKD7ocRo
	H+MS6YILhddUWkqINZFe+VZSFa7vfj+4r7zfwyxwKljE97iLUIx8KlrGr9gREQQbY19HZAz1YPvvz
	A3jN2TvUid18GdygEi153sSRsIvVRElYoj4dzg+sMePko73qae6YVIKFP6X7AK8sBnlcyqNYF35Fo
	sv6x/eR8LZeuGFYKWcFzc+8G2+idKVq0wCPgyJlmLtFnNBqfYjAMyWZaBzlzpew+8BwmfS4Lj4Jki
	VoJE6bMDlZ2H5btqhMCvWMOog61gG/XaGPGGf2Rj4s3WcjsxayBCXkPZZ99Thesx+hEn+J2YAL02C
	ABxfzLjKdlwofeDG6wUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8p3b-0007gm-3v; Mon, 02 Mar 2020 17:40:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8p3Y-0007fk-Ff
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 17:40:42 +0000
Received: by mail-wm1-x341.google.com with SMTP id 6so180407wmi.5
 for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2020 09:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=K5oqHdhYQsbfwq1JYk39e1I9fjT9r5f+6YhvHb0bQI8=;
 b=MCD49OCiX7UTc2zw7TI6NhGlqWX7Y9VHIk0EDfdExeozCcgciVDPFIH0fd/R1lvBv1
 47evh82+1UHr89jfexA+0pUGgrrkrcWozvZL3nbDc/HB4oXlYJZg4IMGjBw4cQOxf8yH
 vRtckG3qJipaBRkTbNJsxz9XaG9Hazisn3fEh/2BUikhnxMx3Wyp9YMxm/YfCCvP8a1l
 H4IRAUwogSyWctz59D0VCd1sI2lu6JdXgwM3TOk1lQ8BPfTgvMmsZhAD1y1XEcrVSYJ8
 FTkEtknCxWWByrppNDuALB5r+pwuIPmMaHxHgsNGpNRwx/nN4tW5IlNPEN8FZfP26OVv
 zDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=K5oqHdhYQsbfwq1JYk39e1I9fjT9r5f+6YhvHb0bQI8=;
 b=jng/A2zQ4EZsR/om2PI6AX+24k/M2XKWVJMqRMI71VnxFLZji5gZnxWhSEPpZy+EVw
 bGbMhX1hszh/oCiiKjqtlA+zknS/NZcBw1/wCRvc2qoAUeX3VKOSD2OSsMMayWhOFrv3
 xDXwAEyYeLvLguDy2FzoM5Z+xGLne+cVYxeYCMo9t8tOX9H8AigCprExH6lFZYzP4ShZ
 GMmYfMHTsRfBWjUSp37IhiupaMpWonavGc4Hh58C5z2czEKuxbcfboBCpm+R9erG6fA3
 Ur/s6EI7fucOzJ3rHLhAtg3mAdBb2xLQ6zb1GXuFqMj4xN04/FLSLIwa2ZwTWX97i2Te
 sPdw==
X-Gm-Message-State: ANhLgQ3VMDBR1JZHWYrLKn3zZLZvousuir7mgmjTDBacHY7IAIjIzJ/m
 44SPUBW9yOuup+7fr0BOstyaCw==
X-Google-Smtp-Source: ADFU+vu4eyZf264stx6XXEuonL5I+rb48iCgNQ3uaj7b59BY/gStshUsUmb52p8X8SoOhZlTgoxJpg==
X-Received: by 2002:a05:600c:2283:: with SMTP id
 3mr155939wmf.109.1583170835939; 
 Mon, 02 Mar 2020 09:40:35 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u20sm150314wmj.14.2020.03.02.09.40.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 09:40:34 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v9 0/3] arm64: meson: Add support for USB on Amlogic A1
In-Reply-To: <1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com>
References: <1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com>
Date: Mon, 02 Mar 2020 18:40:34 +0100
Message-ID: <7hblper6y5.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_094040_520988_CC020C95 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael
 Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jian Hu <jian.hu@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kishon,

Hanjie Lin <hanjie.lin@amlogic.com> writes:

> This patchset adds support for USB on Amlogic A1 SoCs.
>
> Because of my mistake I fogot to add PHY maintainer(Kishon) to mail list in
> before versions, so I have to send this v8(and lateres) version again(only with dwc3
> bindings and driver patch removed).
>
> This patchset is composed with :
> - bindings of the PHY
> - bindings of the USB Control Glue(already accepted in v7)
> - PHY Driver
> - USB Control Glue driver(already accepted in v7)
> - dts of the PHY and USB Controller
>
> The Amlogic A1 USB Complex is composed of :
> - 1 DWC3 USB controller for USB2 Host functionality
> - 1 USB2 PHY for USB2 Host functionality
>
> The USB Control Glue setups the clocks and the reset about DWC3 USB
> controller, and binds to the USB2 PHY. It also configures the 8bit
> UTMI interfaces for the USB2 PHY, including setting USB2 phy mode.
>
> The USB2 PHY driver initializes the phy analog settings, phy PLL 
> setup and phy tuning.
>
> This patchset is based on A1 clock/power domain/reset series at [0].

Gentle reminder ping.

Once you pick up the bindings and driver (patches 1-2) I'll pick up the
DT patch.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
