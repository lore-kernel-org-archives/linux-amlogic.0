Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D7CC3F2D9
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 16:23:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04F69222C4
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 16:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p0eHAndp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KaJyPlfL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04F69222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcPSFxQ10tIw0DIbaMb2HI51WxCeT1ueC0ceLDSJF0w=; b=p0eHAndpqkZODs
	R+1btbQuIvJcaCmIoHjrkKwU04l5yiL+r5xaGbP7Bb+/6S/FBKTfM4Eio9MsC+0Bl+52IShj7VcOz
	5fGO6CO4n1TyTpKjK3Um2jbsjiSbzQO7Eb8Pm5x8pELwucpundhj+rEhEGwpQXgF3gfxKervybm0W
	dTkBR8LjBUuvgI0yHI7soKHrJMjND5k8rtwH/r5IVPH2ig6AqSh7cPIvf5C6jwXoPzVmP3gb2eBJf
	Q+aob4FLw4Usp0aFuYM+p2bJiuwa9LJ45hDXa6IUEhnVC/rVK3GE+G+vFMte075KXpBA2fhugWkjm
	+h4MSY+YTWRXhOWaa5AA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8nr2-0001XS-Mk; Mon, 02 Mar 2020 16:23:40 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8nqu-0001Oc-KV
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 16:23:34 +0000
Received: by mail-wr1-x441.google.com with SMTP id v2so399869wrp.12
 for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2020 08:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=7dhtMCeqCCrozUAR7xWCIRbtdQoUsRNHKe3qSBD7eVQ=;
 b=KaJyPlfL/YL/9IzhgPdg7VRoSA7LOYbGnEm5sD16nPwvywgw/HLr/bDtR4FfsNsW/a
 6ASEkqooYQDr/nEMmzqnEbo4tfjQNdWmVrBDJjijwQxIM691mp2AwBM6bTJ1u+JZ+xDE
 GaVEo8Z+dEkN5CvjjpJduUgwMabGNiBqHWb7IhFQ9bN9Nn3wNVuBUtaz/PRNLZUrzDKU
 YNj2bOhLVym29ovWeg+gHxcz4GP2iEzej132wvegafj2QR1PdOIrD9GMvLYX2xSgrLzU
 XZI9V9LQjKtUP1Bz8GFfo1hZ1Ir5mY1RpNrO1be4JpShfuURRfd+GQLG/qI4djgTlmDT
 7FCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=7dhtMCeqCCrozUAR7xWCIRbtdQoUsRNHKe3qSBD7eVQ=;
 b=SJkgg3PfT/oOMTuxT3asjLjLX7obBIkb3dZelfSo8XAVuh0IbQTuC1U4d2b9gDsAWD
 151Es6ezefEMq+J3sJJ5F9gB6fP8Y1wgP36W/NH84wwVOzb05lvkS19jLQ2aBush6Qnq
 tfh6VEUrBHPpcgut1f+kVZ2sqzWVLURCY0zwWFH8gFhbYhw3ajUCr5+js/D4tpyVNudW
 bYCE3nUmWgTiyROW8EVa1m0ro8BRLA7SkTEKB6+CiypxmvRMISek6dd57diaBe3QUQ5Q
 KV3Y9V2e9zkH3vNnp4CbynrM3WwcMMQEXznKifjOXcFB7NXE5999sVo5BlYUmzPN0jls
 k48Q==
X-Gm-Message-State: ANhLgQ3RZ7ODG6yXjjxmXSsg4yViqcj1hzv6sN0QPo0xGkiFjIQ84jjO
 skgfsllJN2qEgNBplLLtx3jPgg==
X-Google-Smtp-Source: ADFU+vs0kNer+mtpZoTW7AZ3bv2U14dkD7HjJHBJ4bHZFfi3uzwaxEhingENvYB1CplhRWLQ9UgEcg==
X-Received: by 2002:a05:6000:14d:: with SMTP id
 r13mr355801wrx.63.1583166210659; 
 Mon, 02 Mar 2020 08:23:30 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n8sm27622995wrm.46.2020.03.02.08.23.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 08:23:29 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
 hans.verkuil@cisco.com
Subject: Re: [PATCH v6 0/4] media: meson: vdec: Add compliant H264 support
In-Reply-To: <20200219140156.22893-1-narmstrong@baylibre.com>
References: <20200219140156.22893-1-narmstrong@baylibre.com>
Date: Mon, 02 Mar 2020 17:23:29 +0100
Message-ID: <7h4kv6sp32.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_082332_677309_8DF77FD3 
X-CRM114-Status: UNSURE (   7.25  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hello,
>
> This patch series aims to bring H.264 support as well as compliance update
> to the amlogic stateful video decoder driver.
>
> The issue in the V1 patchset at [1] is solved by patch #1 following comments
> and requirements from hans. It moves the full draining & stopped state tracking
> and handling from vicodec to core v4l2-mem2mem.
>
> The vicodec changes still passes the v4l2-utils "media-test" tests, log at [5]:
> [...]
> vicodec media controller compliance tests

Tested on meson-sm1-sei610.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
