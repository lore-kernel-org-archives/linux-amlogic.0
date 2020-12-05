Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0161C4361B
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 21:53:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E7F423108
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 21:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E7F423108
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0u98pLcL6UPyp7dSIT047JPiTNVMEgxK+fBzGEYwNkM=; b=xSlSUW5Ly3/g/4wrm/Wg+UAhs
	1M4WA6DLGMoi+jWrQAlKZwiwGbgxzp25bvRMGL7gIJ0ZWFSverSoSj9WLhc1IDc2QZxLqz8fohdig
	RTP0Ull2lqM8IkEwUzQE4IC/ELVQLVcBGm13pkKtn/0Rlsm7iGmWifqdhaCUxZ3uFnmizSMXGlDFl
	ZWFLHB+ot0OV2K+Bw5s/OLN7Vlnaje0Z0nRWu9kb5cwvt4lxpBygYJ1jQ0yRR0RdniR4h5eRApi7T
	GllKp4g0xxQK/ubLQ7mddBdpI/PVZDaX8toBJ3KvMvFarrbiHWtoOaHDMI6ozQB5gnRZeTnFz7Dyo
	ZRkIbEAOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klfUy-000703-7A; Sat, 05 Dec 2020 21:53:48 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klfUr-0006zO-WF
 for linux-amlogic@lists.infradead.org; Sat, 05 Dec 2020 21:53:45 +0000
Received: by mail-ed1-x544.google.com with SMTP id i24so1782268edj.8
 for <linux-amlogic@lists.infradead.org>; Sat, 05 Dec 2020 13:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=788XxievPXArbKhvDvDluT6oiya+GFzAh5wtfB7G8D4=;
 b=uks2duSw/rgzSVa0Wy9QZMX4eX1UZD/ObNuA0OnGaaSL7ufLwU0SBIJw9OD0RYE+im
 F9mq/Mev8cTvLquRvwj2voJAknZZ6Rizl+z88koWxj7QBTEUi/MHm70wV1uWqOSAOx71
 S2MPnu0j1qpAzGpT5yXbQ54Ly8AJuHhl8s+dSiSgr/quGRfW9M3zOUV4rvxvn50hjjLw
 iE7fZl22f3ozNklSzh2IdCUjqnZcL+Uu11Y2HA/xVzNYbiVerky32y2LM6TDiDYZ7v0p
 ELAfQbMau+DYi8OYY/9vvbgGi4A7WMaHtJu+ghntJrNVc/sqTPTDuDpYrO9JlFyO/wAM
 +ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=788XxievPXArbKhvDvDluT6oiya+GFzAh5wtfB7G8D4=;
 b=jrLxNj4UUSiEur0AJOw7976vFoSqnS+XY7gtgjkEdFDMsUTHg+PNO7EZe3ZRuihNuL
 +OORRclE9bI+ltEHDvv/DcX5KH2FzLFg6oi7FXgYM+Iv4h8XoYFSR1CPRgTFusvRYRIR
 yJNztChx6NHImdKkWZ2yZFkq1E9BhEjSHqoE4/hfwXDaQXlSWeUNLYJslyGs9WXJDD4g
 Lp3jLYQ6CmZnshuO3OxDvc33HtU+GX4eEyKeRs6+s6lfwRKmDf+UJnAxtdpxHLBeTW+D
 Wz7v/BTARBQaaMq0McgvMbWEc1VRZbjHvin4+ruC8Qh3hOlgMw7ZbT2NEhS4s3mTlVhk
 0Ubg==
X-Gm-Message-State: AOAM533Vz2p8Ro0ZtkgfOv2SVn+8lI2lyCoSjiniJPaQLoS9aWx3iEFL
 Otk8XrRyDIqukXwFyGTlmH1vxIydYKS61Ut9xEA=
X-Google-Smtp-Source: ABdhPJx0u0sr7vJSvKYatDZ6Kj4W2Nxil0cvX0AFnS4Eb9JTemyfn2No/PM91puUzN+wuT5YoYiZj832uifQmVuaNAc=
X-Received: by 2002:a05:6402:3074:: with SMTP id
 bs20mr13697948edb.365.1607205216408; 
 Sat, 05 Dec 2020 13:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20201201190100.17831-1-aouledameur@baylibre.com>
 <20201201190100.17831-2-aouledameur@baylibre.com>
In-Reply-To: <20201201190100.17831-2-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 22:53:25 +0100
Message-ID: <CAFBinCARfW9wtLTA=siqCH_bhF8D_CLHxU9maM+Y6p_6njGOaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_165344_778293_30D29D2A 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 1, 2020 at 8:01 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> Use reset_control_rearm() call if an error occurs in case
> phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
> phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
> and the reset line may be triggered again by other devices.
>
> reset_control_rearm() keeps use of triggered_count sane in the reset
> framework. Therefore, use of reset_control_reset() on shared reset line
> should be balanced with reset_control_rearm().
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
