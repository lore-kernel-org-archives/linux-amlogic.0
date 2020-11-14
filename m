Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4245C61DD8
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 19:13:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F232225E
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 19:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QdUk8Im2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bkZXkOc1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F232225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P4iq6XGCBEFVksayHSznPKf9nJRjjWoNQLrDWOujrTU=; b=QdUk8Im250hdX4suVPOl1DOj/
	Vn5wNIGKB4IBZ7DvOEp15xr4xz1tIjakD33reHM2c6phH9nNXcrY4ZTQGPT/wjlmFh9s741e15yV7
	GY6Ny8EImEHBiDcEJPEQKQDdaPkFCXt8ABmZ2HVXwFgu3YTR6QEEKab1vtYfjdoev+Xsvr3VrlLAs
	ERmZNBBp7BZDudirh2BrDvs2PjCyznhPjrpLIGlHMo09nOUUZW6EtUGYFA0LmPRePDhgpBTuZTgV+
	4iMKMXxtihkO7Qfn9V+OgV6GlHUWeHrjbhQivE3KDwRDwPUScIwfSnYPKFvg11mQezU4DNyZwNW8A
	QropPfhqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke0zM-0001pe-Sk; Sat, 14 Nov 2020 19:13:32 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke0zK-0001oy-C9
 for linux-amlogic@lists.infradead.org; Sat, 14 Nov 2020 19:13:31 +0000
Received: by mail-ed1-x543.google.com with SMTP id y4so8742937edy.5
 for <linux-amlogic@lists.infradead.org>; Sat, 14 Nov 2020 11:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fAmhgd7CFeJ/DRc9/3PIR4VNFnC868K9QnLj6x8FscU=;
 b=bkZXkOc1xXB6QiRCHqLJ6ctJ108itiNUae1xk/gPYOCEvbaNB1CdBZCmo68ChVxtAh
 rBQhwkzJE621CRoQZtGvHfGT/WmSkiq3NfYF3pzEs/jFlLvMkVArZmXN8Bjp0lNq8X9I
 CpLaj8aYzc8fX4aiu4t0QKU+HwqSRZlxMHjATiQmu756NIp2s8KPs9nF90bmBVlET4fs
 HpN/Ik5qj04UxZuqBWdSM90M1f63JJPXD76b7YuKvBclPnXH/+Zcy1layjGGC/q6QBxe
 UTgu63+x8U7/AZK/4bvuDwVsEiPp04+BoVeAvT3xZdWp7kTJyBIbEkESAjK7LN5MWBKx
 JBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fAmhgd7CFeJ/DRc9/3PIR4VNFnC868K9QnLj6x8FscU=;
 b=bunNsswEcBzeeJos0UU6NXXACwbNf0ijMH+6mr/EIHTb7WpR8kHQYTAEec2uxAjADb
 mOpGweWtFQ81XL4TZo8+2fEl00yagnyiaRtbBcrrbsxigqzLvoKslT3bnwZxz4HMM7Yl
 rmgdkWVRYYHxmE4W0nUKvgyXvmi4IU6/FT2G+MXyme2gasuKzq13uVWgn6if3kQpaF4i
 JNKbaZ7oa2CSaKSXBC9vLmX8jLZ5GnObnUO0s+ot6e4Zmk2ntbtU5ZtS3FxXvUPIgJ84
 4J2+LtM668R9v3RcbI+0ptWzor2oxv0xn5g+VjbKrUGr0aTA4BLGssUUW7XbhdrPhQ9f
 BDEQ==
X-Gm-Message-State: AOAM530DtWF3k0qlsXyjlBvaCRs/3O72leuiT2KagDLFoYTnZpr3rH5U
 2iFK6oSmxIOPXz8UZ11ZXdzhsPFNbdJL4xLcMjjJVnoYIQs=
X-Google-Smtp-Source: ABdhPJzjTzrkJMfc06gBXgrdl6yrGT0kmA5LbSTfIvuqgeMBMblV/d8H35XpHEpDdj7dksdJwFOpTy78mWMyApBMsLc=
X-Received: by 2002:a05:6402:30b5:: with SMTP id
 df21mr8473297edb.146.1605381209138; 
 Sat, 14 Nov 2020 11:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20201113000508.14702-1-aouledameur@baylibre.com>
 <20201113000508.14702-2-aouledameur@baylibre.com>
In-Reply-To: <20201113000508.14702-2-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 14 Nov 2020 20:13:18 +0100
Message-ID: <CAFBinCC92FfvFt1aAspkF_Mrrtu_QpS327TN2=9Yc3tWMTcu_w@mail.gmail.com>
Subject: Re: [PATCH 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_141330_433901_C3078B84 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

Hi Amjad,

On Fri, Nov 13, 2020 at 1:06 AM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
[...]
> @@ -124,6 +126,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
>  {
>         struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
>
> +       reset_control_rearm(priv->reset);
please move reset_control_rearm after clk_disable_unprepare as
mentioned on the other patch to clean things up in reverse order of
initialization

>         clk_disable_unprepare(priv->clk);


Thank you
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
