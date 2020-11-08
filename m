Return-Path: <SRS0=B07/=EO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD402C388F9
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2020 22:13:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B28D206A5
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2020 22:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XGgkpx4V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZS3/RrmU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B28D206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2wQDwybH5TXGmvmppe0pnpGBfeKIAwzyO91RqUHe5uw=; b=XGgkpx4Vp54LjWtKynOdyrpKF
	KsuYBaVGp/kF9+Jc+5X0LlhZBBAO1xDjqlTXQ7788QDwyXeDwgZFQ+QXjmJh3SzJo2NdmgBKVLexs
	tfIUCXiw+nPGgHlVsBccS3d5Zrfg/pU5rZ5gBKUmhZaP97pnFX7ynJKI2zH25krM4uzEXPPvTcF0U
	UbeQe4Ti6wpc4flUbHukFb934A9/dMzTGyKznQ0bK7Zcg9LfIiZJTRiCXwyRxuDgcyg1QU5SWoQr3
	aIH4DZvLQBzAuD1s2L1tFM2pGbGY8Gp0FcUh+znKnEdinXIygZ0ALS8y4aeJqcO+m6S2H/W8D9nGG
	38eVxmCng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbswW-0008UW-LO; Sun, 08 Nov 2020 22:13:48 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbswS-0008Tl-U1; Sun, 08 Nov 2020 22:13:45 +0000
Received: by mail-ed1-x542.google.com with SMTP id cq7so6537385edb.4;
 Sun, 08 Nov 2020 14:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zadr8S1exGYvbFBWcZYnrHIH74MhDue7HE7SBukcCYU=;
 b=ZS3/RrmUsyd26siknMWP9hBPyVlLToCszbcuKFgMMGb025nOIQgZWIQ6ZwJ147RqaH
 EKVpCGvfVXt9vXH/lM3kDv0NtYdy1S6MI12zDiuRr0rVSNKGgf7cA1IFP9WPqA3/WHhx
 Dq+e+OjQNM/qG1dGk4wPK9vKSG1IzXd3qhMRJ81vTVOvM9pFMeX6R7RtUKJlV7uONu7p
 xkW5CszwYqBngjyOQYp9KF1GlmFQuRrMu/lMpSDz7COpme/4Iw55FU4vLI98hvShL9CG
 /MqttJcFkHzxYOyF3d0ZSScmtMENwrknzgD/6v/7Vh48w332cTfu8sGP67VKtNTMqF2S
 P1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zadr8S1exGYvbFBWcZYnrHIH74MhDue7HE7SBukcCYU=;
 b=fW4KHu0hbwCQoySe5ZDO/1bNnpX8BKbMBRwRK/U3PKzhld+1qafPVfrjNwiFLK2Bke
 X+t6ewLw/cQBdWh8z0z2zPio7sJN5kcJJ1VIEYVCuLBuQfuP6GUgLDxfpvfjFpfgXIfJ
 i2yUVZP4nm9Zs8a37ythwpto6MxQa+MdYyuC/dN/oNZkbQdXJJnMo70d/+5Q3GB+AuvM
 19m2xfn8J81TXP9Li1/+AxzBhgRXgwOpABvJ1hF+gnWcbYK8DXKngRgvjkdrqbFdLjkH
 rN4wpgYuSKiTZ3M98DaRJHCBIffVpnJ7ShfsXQxuttgQR7LwctHUBK1+ZDRqNgNwn1yH
 0HMQ==
X-Gm-Message-State: AOAM530lVevm0kWpclcy9CTgb2vHTAK0wm0C5tozsdu19jW8PFRf53BP
 tVgHV44X6rQthHn+947Yl+2VX4IhtGnsRzBAmTZ2NTA3ueo=
X-Google-Smtp-Source: ABdhPJx7xBHJqmrYHCq3KgX31T0CG77X4kaGHcuM6zY+ZJ7+918xPieTS3Ydr8/NkwE08ivM14/Nv10OkaOKTkqFQAU=
X-Received: by 2002:aa7:c889:: with SMTP id p9mr12160883eds.110.1604873623378; 
 Sun, 08 Nov 2020 14:13:43 -0800 (PST)
MIME-Version: 1.0
References: <1604378274-6860-1-git-send-email-yejune.deng@gmail.com>
In-Reply-To: <1604378274-6860-1-git-send-email-yejune.deng@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2020 23:13:32 +0100
Message-ID: <CAFBinCDjzt7jjEgTcxc+dMLojmnhMzm=1FX3bEcyDC7RGu0MTA@mail.gmail.com>
Subject: Re: [PATCH] phy: amlogic: Replace devm_reset_control_array_get()
To: Yejune Deng <yejune.deng@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_171344_989544_ADC4B7BD 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: lorenzo.pieralisi@arm.com, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, kishon@ti.com,
 vkoul@kernel.org, repk@triplefau.lt, p.zabel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 5:38 AM Yejune Deng <yejune.deng@gmail.com> wrote:
>
> devm_reset_control_array_get_exclusive() looks more readable
>
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
