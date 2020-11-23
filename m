Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7234DC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 09:29:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DECA2078E
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 09:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gSWH7CNT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tc2FSCMk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DECA2078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TIUXen9Z+Cnta+dxpuJMf38rChz5zLbnsiP6gDi6PQs=; b=gSWH7CNTNKMeQN6gRegD/eWCr
	E3cJqbNZPgUd4xIwd9H2itok83d/eOOwYTvhur8L8NzzoMPpgVjhM+wiTm28onX/UwgjFjOTaNrZe
	+LoBx0KbV7eoWLQjywVH0TV+9Y4OpIF7aIoBIO2WlYe55rTN0AKcosebzYjCdzSmeyUUHVZLW1QW7
	n5m8INCAa7nHW6QerWSBmp1QvKPGnD6NMtkOnHHyPlCvyQ+8PQOsG+SFfYv8g6zRUmn1UUMpcSq3d
	cnX3kmaim9AoiaSjnRzqJ20TM56hySQf2rOuh54OOh8ClTCknhGvOw4BvH5nnY8pSDdOktHgWAcFn
	054aUYKnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh89o-0004on-7o; Mon, 23 Nov 2020 09:29:12 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh89l-0004o7-Nx
 for linux-amlogic@lists.infradead.org; Mon, 23 Nov 2020 09:29:11 +0000
Received: by mail-wr1-x442.google.com with SMTP id p8so17876877wrx.5
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2020 01:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oP064/YoSybWWI1ICcTHgnGH1OvAg15H5I+x0Ai9JRM=;
 b=tc2FSCMksV59M4EtjiNWL8jYvxSmVR5HwDIE2Tr71m7qnAClPF0WfZkK6l1j/v1pgg
 x3DTXnv21DuT7mxGXmNG95HWVVpIqYllKM/ceX8Fk8RbADMKqK3EGw2NAn20RT50uLx9
 vzqySDtlWJF3MoZCG8RGUDaaMsLff8t+PiO1O6H5/57hg3Vi6lG8UYMjV9YhVpj6JKhA
 Xue3Hp163rBm56BqB6SfMRrGA/D/n14zLO0EG3XGCEnzGT3vvfVEHtAYk+vH8n8i6VFR
 Zj6MDGOiEXGasq1wZNU2vR5zQxf9gHNLRMH3CaCTrxQ8shv8EmDqwRwN7OUX8Jc+XDCG
 2/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oP064/YoSybWWI1ICcTHgnGH1OvAg15H5I+x0Ai9JRM=;
 b=sgUbXn5Wwpc0HAxIJsVa48OVm4qmSjaTnOx52Me1aZ0ec07M+iuNZFHK1adpiknWlt
 rE0UddDQSZ/rK8hLCiZgTkiGxLig0dlv4IbUK3RtENgNMWF8UamyDeF4TNrQlGWWyUSO
 D7veV399fYSAl25Je6hvQMohS6Z4tMntsY0QVAf9kNDrJDm1AezsjjIfQ/VGcOv5GlKl
 tiBygpOwbKL0LHwJUeMGZZNyCtK6nDLYkn+l5iGmNWh5hw3UnCA801D04jUEGWuKuvcU
 83mbTAycEU3dF2pDCVOt3d8GD4rBTZ7Rh7KiFa8Bty7VyfkvxsNYzvH+XF+PQMHHXvLi
 DHaA==
X-Gm-Message-State: AOAM533ygF66bb0Doe1dGGReuFC+KWf5I5kHosUh9ihl5tf88+Z9PB9I
 LeW9tLt/zqDBp4svkORNg4yXoA==
X-Google-Smtp-Source: ABdhPJze2Z5hY7lJwWf2ixUnWns3PM39g8MYfbp1DWWbev6ip3HKIrUgxapU+GPCk1Cbcjffb3NKdA==
X-Received: by 2002:a5d:6743:: with SMTP id l3mr29498818wrw.82.1606123747181; 
 Mon, 23 Nov 2020 01:29:07 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:8466:ae5d:28e6:8c59?
 ([2001:861:3a84:7260:8466:ae5d:28e6:8c59])
 by smtp.gmail.com with ESMTPSA id a15sm18441848wrn.75.2020.11.23.01.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 01:29:06 -0800 (PST)
Subject: Re: [PATCH 0/3] usb: meson: fix shared reset control use
To: Kevin Hilman <khilman@baylibre.com>, Felipe Balbi <balbi@kernel.org>
References: <20201113000508.14702-1-aouledameur@baylibre.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <093933fc-eac5-de56-d314-a1348de348af@baylibre.com>
Date: Mon, 23 Nov 2020 10:29:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113000508.14702-1-aouledameur@baylibre.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_042909_896482_9BF1BB72 
X-CRM114-Status: GOOD (  17.98  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Felipe and Kevin,


Could you please review this patchset ?

Thank you in advance.

On 13/11/2020 01:05, Amjad Ouled-Ameur wrote:

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
> Important:
> Please DO NOT merge before this patch [0] is merged, it adds
> reset_control_rearm() call to the reset framework API.
>
> [0] https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylib
> re.com/
>
> Amjad Ouled-Ameur (3):
>    phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
>    usb: dwc3: meson-g12a: fix shared reset control use
>    phy: amlogic: meson8b-usb2: fix shared reset control use
>
>   drivers/phy/amlogic/phy-meson-gxl-usb2.c |  5 ++++-
>   drivers/phy/amlogic/phy-meson8b-usb2.c   |  4 ++++
>   drivers/usb/dwc3/dwc3-meson-g12a.c       | 19 +++++++++++++------
>   3 files changed, 21 insertions(+), 7 deletions(-)
>
>
Sincerely,
Amjad


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
