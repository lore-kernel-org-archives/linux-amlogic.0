Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B6CC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Nov 2021 23:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzWPiBZjT7nmoOWCQDL35Mjz0x/PYXWbfpKvAxDYtUo=; b=i8ohtoviCW9V8z
	BAM9sB5u+gqDvQ5eDVdHXStRI1BdceIod4y9GVj+AQeT4H0vxRuOzmPzF0O1pVoqvrV6AZtXuu3/r
	bXyxj4s3NoBhfYTE71jr9ROXH71c1hQPK7dxRUVIw2NB8NqiLbHNURvUwd3xJXAdY2uN74YNKcNJx
	TEvsQyWZqvi1odg4wwEV9Y6IqojdN92FoWAVxGyd2IORvDdepJy5Ou/lBth3TkTjVkThUJvjlQp+N
	QUcKqOHfkyXv6oPqYwiRz4NLcGu1mmB23f5d/d4w9Q+PYaGIhnwvFeHz72kIX5PgUnpSywsTUrt52
	aBNgomArU7eocYyFxHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moZxr-00D4NC-T2; Sat, 20 Nov 2021 23:40:11 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moZxp-00D4Mo-9o
 for linux-amlogic@lists.infradead.org; Sat, 20 Nov 2021 23:40:10 +0000
Received: by mail-ed1-x52a.google.com with SMTP id w1so59210693edc.6
 for <linux-amlogic@lists.infradead.org>; Sat, 20 Nov 2021 15:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=65MbiCirE9d1cqOS3f7OshdK8GTlWYGnLliUJ1JW4TI=;
 b=PeubQnk3Yfliv//Bdzq5DZVf8lnujLcLRhwLW4YrU04aspNKB8vxK0JhVry3TVWcLh
 LTJrgAyP9buv4LG+ijX8Oc8qVHhEh+1ogkviZodLZhZbOVVf7Et+1p2CrvuKEaniEVyJ
 SNt28yBZ0lCbHgWdd5/eFNPyH3LrjGxGPf76Dw+whk9IUb5Fz8zAgLzwgU0uev0eiePi
 G1CIR98OPctQI3DVtKs4dHSY/IS3NAOBYo4VTcJ3kP6bxg2JPeBDS1vEVPt+2URjxDcF
 CTIWBfX1oqfbyPLnE0nSXzdIfN+PU/pcO6d0Vc/BjLei3r0okEPDOyDcRMOCzk2SflDX
 aZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65MbiCirE9d1cqOS3f7OshdK8GTlWYGnLliUJ1JW4TI=;
 b=HwFm7fa/S+JXbvhTSbCzPKMheLn5R132nDnUm80/z/LpwAa1Z2MEICOAPJluJHOFYQ
 43YRSBFL+eCIq3Qv1uopofbz7VS8DlMm6qCs6oNARh5BCvKI8NRIkJLplUTrtHrnzwbH
 RIlX2oniFKk+HL/yXrGS4fGI9NQDbim1Qr0kofKRuWNtGPgrRW/+WC/tXq+Oeor5gs1x
 tGMICOZh4X8NupHUJ/AorL3xGYIrRmwLSkYH28twgeCeS7B3kpJXD8LSY6vTuKFnznOr
 uioKP8yMXirTEyQ32XuzIEY0wILqfTWiFexUnhmI36icegwkNZHHHh6rhNsMv//03ZO3
 uHJQ==
X-Gm-Message-State: AOAM530q47roAOzdJ8RUIktoZHmTrFlOZsAWOTDMf0+EQcAbxzgI1zZd
 OToDFHitullQyZ2zpwQiw298UQN4Ic8jTbpRLa0=
X-Google-Smtp-Source: ABdhPJyuw2LGnZSgNbwuV6TKKfWCPeJ20W180C+o72+JnsmMFpFls0G1soAIz58Nf2hd7ZCeO9tiOHQuwjurfIHDNI8=
X-Received: by 2002:aa7:cb41:: with SMTP id w1mr44250205edt.327.1637451607740; 
 Sat, 20 Nov 2021 15:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20211112162827.128319-1-aouledameur@baylibre.com>
 <20211112162827.128319-2-aouledameur@baylibre.com>
In-Reply-To: <20211112162827.128319-2-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Nov 2021 00:39:57 +0100
Message-ID: <CAFBinCA4UHybSkKX=yRvEE3k7oSwFEzYADkZdsMxfMsp-Cmodg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: khilman@baylibre.com, p.zabel@pengutronix.de, balbi@kernel.org, 
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_154009_404490_164C890A 
X-CRM114-Status: UNSURE (   8.64  )
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

On Fri, Nov 12, 2021 at 5:33 PM Amjad Ouled-Ameur
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
