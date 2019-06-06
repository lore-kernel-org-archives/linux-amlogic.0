Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38CBC04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 20:00:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9680208CA
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 20:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LamwVd2s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="azjuJOvh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9680208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/dB5t1CuLcrSbfGN+LP5VOzc7y4wubC2Ip70Z4ZNJw=; b=LamwVd2sYzMZdo
	PvJJwP+FNSIyq2mxPT96deJqSmkDWWgvsMqhyzXVSwmsJE2zSWoldyV3RwXVU2sgqeLbQlAGuBZY3
	d9SFXO0/H2GpPcEc5csd1t4MTCFdGpQmjYs7KCP3eQz5ynCwt9h9VFJy5Sb3rlEDXgJQXh+yJcaF6
	Kt/FMPu9mQ8TkJaHJ+5y3/yE+W+QJMqYh2F3QeP2cLJMtmxEuI3Sn5ed109mteXH3qUJj2I1N6bxD
	fSGMyEcDUKhnC3B4uwV4wJBPPsSkq+CoZVW+d3Qr5H9fJ4pwxfA7o5yYWpI+CSe2zpk4gcgSddcHf
	1amW7eYzUmBK8vpc8ytA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYyZ7-0001on-Gh; Thu, 06 Jun 2019 20:00:49 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYyZ5-0001nL-5T
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 20:00:48 +0000
Received: by mail-pf1-x444.google.com with SMTP id u17so2152265pfn.7
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 13:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=+S2za5E2ysBthBJN8nhvqwmLKKW4lZ4JrfmGBXCW9Do=;
 b=azjuJOvh9vVcco4+dB9mpQHAleMSqSKTlia7Zb76u47A8WR6wIsrbR4J2n43c40KV3
 GSF+MLvTz9qnbY1ZNCfHMS21210wyHO4i+xzLdxCaCXd1mqZv1OoUtxKv+L372BLP+Ke
 hSgFngB1ugHgmfjgMO4YVokX3nADOSAvdKDp8nXZGwELJfVRwMkyWU6ziWl6KmY+mVLH
 GL9PKZVR/LAbYRo85ihbUQFiVjdQsxDrYRVOHfJhSQu7qJd7CAq1Zahsbo6caUycZcJg
 UGHPpkAn55D+E3ujXQGW/Xn2CqdL4L/fipYX8WkD+sBQufCxM3D3sgGC1udlwoZ+MJWT
 40vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=+S2za5E2ysBthBJN8nhvqwmLKKW4lZ4JrfmGBXCW9Do=;
 b=nbQ5P2Oopz3KVnedarYzPBEkZwCTGlkZusl93vpm6aWPBRleSSduAmjNhTK53tlNL0
 lGnBcbGWj/9fzOXBwc0FWfh4MoAGarve/dYk31l7Jop8g0Qb73p0lcMQ9fMIHuYP5VB4
 MQB4LRpfYxW7u9i57/kfsoqWorIH08tDqI+ZW9LXwDqL+Xt1vXC89ueoPBELKv+LU2Yb
 M7M5PVmfLxLQ7Y/RTrttVrSJL+o882JxdL5DhNl49iWmuy0s81lX+cQY3jxxPnsewVqj
 r7+8P8wkckN6rZICMrNdY87uSsUI8SqEPNnbtCRYBh9gkGVSAg5PinSlu08BotDzIyzO
 oDkA==
X-Gm-Message-State: APjAAAU2+hDCaYnbHSp1h6MH/Xh4ox9vFemqyqVJn7IXduV0mrNsmsTR
 BBjTZOljq70WH657nVe28gmy6w==
X-Google-Smtp-Source: APXvYqydS8Cff5YUUoLMVkPtd/Z9+fZKmczr/F25Y/oh1KKo7VIe1z4GFo73+LucbRJ/GmjyBOa0zA==
X-Received: by 2002:a63:fb01:: with SMTP id o1mr251166pgh.410.1559851246224;
 Thu, 06 Jun 2019 13:00:46 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id s42sm3271040pjc.5.2019.06.06.13.00.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 13:00:45 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 01/10] arm64: dts: meson-gxm-khadas-vim2: fix
 gpio-keys-polled node
In-Reply-To: <20190527132200.17377-2-narmstrong@baylibre.com>
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-2-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 13:00:45 -0700
Message-ID: <7hy32ecwlu.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_130047_351500_B4E9CF29 
X-CRM114-Status: UNSURE (   7.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> From: Christian Hewitt <christianshewitt@gmail.com>
>
> Fix DTC warnings:
>
> meson-gxm-khadas-vim2.dtb: Warning (avoid_unnecessary_addr_size):
>    /gpio-keys-polled: unnecessary #address-cells/#size-cells
> 	without "ranges" or child "reg" property
>
> Fixes: b8b74dda3908 ("ARM64: dts: meson-gxm: Add support for Khadas VIM2")
> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

This patch is missing a S-o-B from the author (Christian?)

The From, Suggested-by and Signed-off-by send mixed messages.  Please
clarify if if this is missing a signoff from Christian or if the author
is Neil.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
