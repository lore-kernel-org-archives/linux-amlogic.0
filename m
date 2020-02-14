Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5D3C35242
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 19:51:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 514942073A
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 19:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TKJ9jblO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nxT8uiE/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 514942073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AF495WMIow/Vl24IcKfU59m3JjHkGMyi0aza6aHVYNU=; b=TKJ9jblOzYAW+v
	VDq2hUx30pAqFOXTQYKFKv1A5GDnwd8IiDO31d0l6OGV7XfgeRuXUw2LXirkBFsx0l8bN/wCk6Cw/
	0jK9Hfdb79spO0S0n8kTO3dgIvoXn5H1UWrF3t7DR3VuZeOjDQhAe5xAiXTbVnZkMK96nhcgk87tz
	xX+bj5HhhomTiZ6sWkoVYU/KawTNCA4BllfvPZv3EYroCmxRrtSkhTDlIU/zK8JiVd2DIEVSjKV0S
	yMQzZ8XLI1STE2f5/1QyXqWlQuxMCPZrtocGdNInh90nXCiytg2l1y72s981Yj0lVxeBoiZtoEKfC
	Ms6BsG50BOERGJTPjiLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2gzM-0001nq-1X; Fri, 14 Feb 2020 19:51:00 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2gzI-0001mp-IG
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 19:50:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id t3so12281794wru.7
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2020 11:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=RC5diiaR31GO1rhNQqP799z+UvDMaz6Wswnev5LOZWQ=;
 b=nxT8uiE/z52YUercio9Z5U9t7IR3335+MJiJlP80FZE6VyMExWaZrdmMWfDGExAHJH
 UyKPXipXu0iaHR4UEWlfizHzMWSOaQxyrEdJJR783jkcXSGK9VsyV01m2xMT0Mw8wlbO
 AaGiC16TBHGyAKgukrHgBCtrmcFsmgrF8VJJq46pfS7/biBsMnKlXrp9aIxSIXpEtxtR
 PLM75PKRSTkJnEZE5X9BssKTdQqAQ9xFVsjDPMDtFdM5VT2ICVDPbK3G/1E4QLJcjL04
 PtD8CJCvmor2gmivTA7eV+66UuAsYVEzIRikVpVo0FnB49W3iDElogQ0zRQxZRC0XeSm
 dj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=RC5diiaR31GO1rhNQqP799z+UvDMaz6Wswnev5LOZWQ=;
 b=iEQ8BEIISy9p4Eti7qI85JgUVKsyBB3SsROK8xVeKCcfLu2cQtqLJPguUaZ8QqhSZ+
 dUAy9RSXW+CATGNNKsE15WaRQQX/vbWLHB5EEoFHQFSOgohvh0oku8SM+MuplISqj+PR
 rr6YbfLJdBg+Ku6iDsvyDSVHu4ZnV/1p+FYQnjxe/JNdUnH26mK6Wx+AdgwGaWe+q2GO
 iexdQuj63e/mx2s+NUInrMLHgXWJyhnnzU2PGhwwqx+QM6gFFoziPosGoacfpJmdTaPR
 Ryi94jlXbViCbNA78+04rJBVn9v2BpM4WP/sVwQV8UQm1Q2gW56DyZpaZK39nwnehNLG
 HwRA==
X-Gm-Message-State: APjAAAW2N8ngVCWG9Jb+hxDXMGTX+fPP2Styqi5dO2KH7SKD4KtRshgr
 YwThphyLJp5788HT25sD9Px9Wg==
X-Google-Smtp-Source: APXvYqxJ0lDeRgZFQoYhh/V5X69ykQbrkOdOXgABmMtigig5INOR94v2BGam/S6IxkftSmbnVRCbIg==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr5387293wrv.86.1581709854692; 
 Fri, 14 Feb 2020 11:50:54 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 21sm8793510wmo.8.2020.02.14.11.50.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Feb 2020 11:50:54 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4] arm64: dts: meson-a1: add I2C nodes
In-Reply-To: <20200109031756.176547-1-jian.hu@amlogic.com>
References: <20200109031756.176547-1-jian.hu@amlogic.com>
Date: Fri, 14 Feb 2020 11:50:51 -0800
Message-ID: <7htv3t9cdg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_115056_606345_F69807ED 
X-CRM114-Status: UNSURE (   7.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jian Hu <jian.hu@amlogic.com> writes:

> There are four I2C controllers in A1 series,
> Share the same comptible with AXG. Compared to AXG,
> Drive strength feature is newly added in A1.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>
> ---
> This patch depends on A1 clock patchset at [0][3]

Just FYI, due the dependency, I'm waiting on the clock series to merge
before queuing this.  When the clock series is ready, please repost this
since it no longer applies to current mainline.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
