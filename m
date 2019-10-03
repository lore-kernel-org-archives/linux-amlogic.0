Return-Path: <SRS0=WwkR=X4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16573C10F14
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 17:35:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD6E520865
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Oct 2019 17:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W4swaElP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LcL/9uRR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD6E520865
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lkrb7N/+VOAZCRdd9I5hGhyFdaWpkktoAkm7L2Un4Bs=; b=W4swaElPcPwtHx
	+diijZ0K5LDF2j+gD+oBcPF3gCZ49ZGqJ0KhQy1rskjjzKJHmhhAQbePnuovAE5COHLDHhjQZXFED
	gBgLA+M+o4ZZW7QppyeVkbN/GgUNmNKDMqokSd3x0/ftmz8DFi5iGPYz2DMrfqFNT6Sv1EBkRTf8i
	Ht/PPI5zmbGk3Q3jhyrIi90X/RTHCIxt9JmieH/5cfkHHCagdKyl5g0iZlJgJQdcr4z2U5vwtoV85
	CU3wy4lGKDBBmjXjCbOSSaP2cwc5qdCgHAq0aYGBPveQMqE3Ai06KTXC8ae6DmlPT0TJpvkSA3BhI
	OiEBp9I38eDow81SzM9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG50g-0002Xb-SI; Thu, 03 Oct 2019 17:35:26 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG50d-0002WY-Dd
 for linux-amlogic@lists.infradead.org; Thu, 03 Oct 2019 17:35:25 +0000
Received: by mail-pl1-x644.google.com with SMTP id s17so1839177plp.6
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Oct 2019 10:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=fXED1acjUYEy8AfTXY9uzTTHkmVKjak7JTmjU0uqyWA=;
 b=LcL/9uRRNdFh8s3yJ34zvuzwmAlYXY+5NtkUJo19unLkx0Vd/qr8WqTEZBan/qftZr
 P1bDgtC07qIqLSSGqeYoL0rj7rNRyavq3OPtZDp6QIfTcfUnqZ+qT1ZIDz5oFqaOGbrS
 bddhgK6RC6JawtQgHzHSJ7Dfcme+1rlZvKUh4SWJKBwzlcEPHfrq1RqtyYZSNIc7wZF6
 k7Duu2DYf/TEpibED84bxJD7NVZ2H2gVwF7PoM7jleGKOPhQ6d24sdBI+M2QemqnvXWn
 En+88TQN7gWRurqwAw27hQo3eVf/lu+2dWPwg7zvpOquykRuQTYhtNH9Wpud+t2sW8qy
 zMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fXED1acjUYEy8AfTXY9uzTTHkmVKjak7JTmjU0uqyWA=;
 b=bEK3V4RJ8gGSuAWskfItIuJGTHqhOmS2+jFOGTnCiTpUz1R+Kd8r3/xGtfqJ0F12l2
 wNE0DD9nLwnoHGWWjdMV/5zjhkGLklwco+RqwWl+pIu7SvL2FSWbDjB7aViDaDetxqy4
 Fbd+FkTFp67pnuOjJCAjSvlDo3q/8d9tNrplgyHTmRp0zGC6URFYLJw4TEgZbbOc6bDs
 DNpyqSOcHuI4al9g5Kuq4Sda1UE9r8DB8pnse8qfo2Pvbo/5YdGRDaXUGHMwDemVr2P6
 4dlUa5sCF9Fsdi80uhgQiMna4mc6FXRrVmNr+vZfCJ+iKmBeDfVtHSBmaklxtf5OnNDf
 lIkQ==
X-Gm-Message-State: APjAAAXrEabEjHAyKYS/JcOnlhazRPsqkJa3Q/t0CKBflHoPdch++Bha
 AZTEwexlZ6/2o8SGSougiGx8Pbv8V/8=
X-Google-Smtp-Source: APXvYqy05X9Caox3UXihsMlUZMERys06g8z7Vx5e9Y0f2nZLZLrsuuT/5m6q6Rg/jEuE7VX9C6qJXw==
X-Received: by 2002:a17:902:b7ca:: with SMTP id
 v10mr10149938plz.54.1570124122276; 
 Thu, 03 Oct 2019 10:35:22 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:a084:116f:9da0:2d6c])
 by smtp.gmail.com with ESMTPSA id l21sm2835389pgm.55.2019.10.03.10.35.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Oct 2019 10:35:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Xingyu Chen <xingyu.chen@amlogic.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] watchdog: meson: Fix the wrong value of left time
In-Reply-To: <1569754429-17287-1-git-send-email-xingyu.chen@amlogic.com>
References: <1569754429-17287-1-git-send-email-xingyu.chen@amlogic.com>
Date: Thu, 03 Oct 2019 10:35:20 -0700
Message-ID: <7hy2y1vijr.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_103523_511903_802AD084 
X-CRM114-Status: UNSURE (   8.75  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, linux-watchdog@vger.kernel.org,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Xingyu Chen <xingyu.chen@amlogic.com> writes:

> The left time value is wrong when we get it by sysfs. The left time value
> should be equal to preset timeout value minus elapsed time value. According
> to the Meson-GXB/GXL datasheets which can be found at [0], the timeout value
> is saved to BIT[0-15] of the WATCHDOG_TCNT, and elapsed time value is saved
> to BIT[16-31] of the WATCHDOG_TCNT.
>
> [0]: http://linux-meson.com
>
> Fixes: 683fa50f0e18 ("watchdog: Add Meson GXBB Watchdog Driver")
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
