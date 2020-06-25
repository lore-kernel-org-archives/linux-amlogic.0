Return-Path: <SRS0=Zj77=AG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848F4C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 06:31:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 507B820706
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jun 2020 06:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u1qzPeqw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cy1rDnlb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 507B820706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xLK5Q0st1mGomf7ut+z1xDk6JczSJOEl+csOSMybDCA=; b=u1qzPeqwTXyv/L5+iuMHAYO/E
	wh/rOGdHkgUHI/O4b/szgTOay1w6+tjtIOEbeWITRn/0RRMmJ6UQv6snZx+VW4SsV6AG6oC+ciIOb
	S2ivxyou1DaYFkKhBqUYAqh980wFL0HnK/mqbG/NtLNwC2z4NaWpDsceeWTEN3e1lNXhOwG+hmHmV
	5t0/b880mTNFicHU7pYJerqrXHgnDaco5j/l6UYZ3kY3FC8Na/KEPutB2xPyazkEIZflehOTXhDvZ
	ZUkFu75XjDpyJtWMvMkcnE3MwdbrldTQJdXcHsttb0LPZTdLo/gDWKw0xfGGXiEoH9RCiiEuY4vvQ
	Ms1xsjBPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joLPS-0005p9-Hb; Thu, 25 Jun 2020 06:30:54 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joLPM-0005o8-Bg
 for linux-amlogic@lists.infradead.org; Thu, 25 Jun 2020 06:30:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id o11so4555906wrv.9
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2020 23:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=/WtZICZPQ7eo9m1fnE4Tuqm/DpL9l1L7AEtdtd4eeLo=;
 b=cy1rDnlb74CJU/MmS8SRaNduOBK/IMcdSw6QZqU53dXfuDSXBWsKhLWPBtpvSq6r7E
 RcO4czMDahxhH46p41SeRgYlbLwMnBq/09SQseikVk4HzykYYbMzM8T6kr+tjRaqkztA
 DnobMe/WEX7kQEUUSio6g4avDlXq0b+zf/HSaZV8MXJLgeUXuo1MZZq5Jc1cBJT5yQxL
 2cchTbSuzrOtQrhyZBe0q0IyZyMktMW+CNZnn+/2BLK+r15tjh3nPdg5/b2y/w0wqpap
 xYq9i4GkjndGAJ1EoiuJ+wymjQLRuIJXw4OhMi9sYHR4MJPw16wMmAc81IBnFu1RlvmK
 IRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=/WtZICZPQ7eo9m1fnE4Tuqm/DpL9l1L7AEtdtd4eeLo=;
 b=Tk2iap4EV2Qj8KxVr0JhgftajNx76EfeoLQlE8ZLgVpyH+JDUSRsbHuZz5v3Mv0OqT
 e9RNdg41bO0MFpHjAnCGtZQXZKCkb11/Tkdi8GNEvaPwW0hx5hp1yK/MPFPq4+pm/nsk
 M18RJ/7/A31TeFSq0Tqpqpo53qBDYEgCU4ahOI9u4VhvlRVtaCpKBPcsDVJCv47muhGu
 b2bTa7SHaS87/LqGSTcg9LYjeohiSFrJ5FSO20pqlp+Li2zOFrG8BOQunRs7kqhrqZvl
 4Sm37MTlvJQ5k2W4LnunVBMFQPs0Jg8nfPU4malQuUXPNpQdTUAhF4MKJqZYpedfXwmr
 /Bog==
X-Gm-Message-State: AOAM533mGUUyZIbUP4YoGFGt3GgO/KX3i+cg4JXREb0NpM4f8dxyFSJi
 OLdze9ZAVWv7HkAqFrEA3njAkQ==
X-Google-Smtp-Source: ABdhPJyO0TdAwSeQKc88VNXDEhojZI+tFVF3RW4T8Yx0Xmn0VI4RIizGBQQrMbVogMt6Ij4FQCU3SA==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr13580708wru.158.1593066647171; 
 Wed, 24 Jun 2020 23:30:47 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p13sm19780863wrn.0.2020.06.24.23.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 23:30:45 -0700 (PDT)
References: <20200620161422.24114-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] clk: meson: meson8b: Drop CLK_IS_CRITICAL from fclk_div2
In-reply-to: <20200620161422.24114-1-martin.blumenstingl@googlemail.com>
Date: Thu, 25 Jun 2020 08:30:45 +0200
Message-ID: <1j366jbqsq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 20 Jun 2020 at 18:14, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Drop CLK_IS_CRITICAL from fclk_div2. This was added because we didn't
> know the relation between this clock and RGMII Ethernet. It turns out
> that fclk_div2 is used as "timing adjustment clock" to generate the RX
> delay on the MAC side - which was enabled by u-boot on Odriod-C1. When
> using the RX delay on the PHY side or not using a RX delay at all then
> this clock can be disabled.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied. Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
