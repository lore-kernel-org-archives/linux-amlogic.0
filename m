Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F09C48BE3
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 21:39:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B59120657
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 21:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EHzEOlpn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HR7QDXLF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B59120657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLZI69JBlR9qobEp8RsIRtRbN60ECOi4GCC0wRebe4k=; b=EHzEOlpnzFPwPD
	AFeE43cqrmHimVODb1/LUfAeGimULAdcFnuptZeKu9BDt7mwelK9LheAtO/71JOlDeD4eD5FCvCqe
	Q3Q50Ey59chZBa4wlwgoze9lIUbPKbO75Lj1O0XZYx0coq1joYJbNtOKGSEJhTQTQOuwWZAlZzyN4
	7jFJh3BKXsUJCTAdhwP0zZcC6KlxyR5VpeOzcBMrm5UEvbljELNx5eHUNyrDEC+cQGLZ6B0hrtNUr
	LGfrO2ad4eTzjuwN/77pJGpCNqcutqKJBNMm7E/1B7LpOpU8nFJ/Gl0G3X7OwcsFHRk1a/66U/t8A
	byjrviYFAuvTMWhOA+rQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1he4lr-000371-3b; Thu, 20 Jun 2019 21:39:03 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1he4lZ-0002sh-Rm
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 21:38:47 +0000
Received: by mail-pg1-x541.google.com with SMTP id v11so2253880pgl.5
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 14:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=FRa+FTYrUwE5FnAqArVG6ocbHw5r29drxK/7hoYzZjo=;
 b=HR7QDXLF7YhGpHGL9vIVq+IKHpppE33n8uKbIEm8UdnyiHhFldKWoErbW86WxynVZB
 4i4L4LrzxDFCh7MvTNJvhtiMin58jW986U/8DoROWF4VPVnPfevCtaZQt8Uzvz6/6rO/
 Hk1K2d4TVRL6un9PVsnjAGfyCrNnmX2DfItpG9GMkMTr5x4akX/6PGZw4KnwFnPL+ZYV
 wjxcI1mC04550rE3GTltks17N66DE4Ys6GexAO14YEFtKdKK0dcZDvOBQa7WLRy/TeoC
 sttTGsNi7ZMpS+09IYY/opogZcAnSmRWR5Cr1Fcm78Cas4Ro+hh/gbHmTxdNE8P3RsvA
 cSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=FRa+FTYrUwE5FnAqArVG6ocbHw5r29drxK/7hoYzZjo=;
 b=N2AetX4ea4a06tFBuXQvHH5LQmiQxTON9NkA0p4NOBQCfF3SFAU1muZD2BOap8Lz1y
 3NZz9T6jiMRMiDpTMe3xcuguhIubDMdI4yXINqu9/AL8vH60e5qq/z3wmle6HI5JWKoo
 uwYzABvdCGf4jhDs8wfN7IMGpILdqatwC4waNKdds97tT/AkZx2hu6zeaksgC3cUNnP0
 WynrP06A8CssT3N8Sscva0I6L/1HV5pPH5UGnaTdTPWrxSk8jmZsYTQZvGEAwmk1UnBt
 yRtM8QHzWekHaJ0rCyC73LYkW9CGejM7P2Y3EJ/WRa0PVvacGUEYgDvX3rcfZebXQsI4
 ZLDg==
X-Gm-Message-State: APjAAAWfED+YHmb1BMfqW+oDiClRmd2Vzu4tTF2U1NuAwms58KhU/ZGD
 dpWsh5pap3RSseLo1Ye34VXHxg==
X-Google-Smtp-Source: APXvYqxjVkZc9pYQKXqXmi7Q6qEP+iSI2+ZCxr5esPXxOJPjmPJLRPJUnOC0Vw9lcgMFgHRUh0BlRA==
X-Received: by 2002:a62:7d13:: with SMTP id y19mr74181464pfc.62.1561066724568; 
 Thu, 20 Jun 2019 14:38:44 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id r9sm542327pgv.24.2019.06.20.14.38.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Jun 2019 14:38:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, thierry.reding@gmail.com
Subject: Re: [PATCH] pwm: meson: fix the G12A AO clock parents order
In-Reply-To: <20190620144655.2142-1-narmstrong@baylibre.com>
References: <20190620144655.2142-1-narmstrong@baylibre.com>
Date: Thu, 20 Jun 2019 14:38:43 -0700
Message-ID: <7hy31wdjj0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_143845_897382_FBE932F7 
X-CRM114-Status: UNSURE (   7.22  )
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The Amlogic G12A and G12B Documentation is wrong, the AO xtal and clk81
> clock source order is reversed, and validated when adding DVFS support by
> using the PWM AO D output to control the CPU supply voltage.
>
> The vendor tree also uses the reversed xtal and clk81 order at [1].
>
> [1] https://github.com/hardkernel/linux/blob/odroidn2-4.9.y/drivers/amlogic/pwm/pwm_meson.c#L462
>
> Fixes: f41efceb46e6 ("pwm: meson: Add clock source configuration for Meson G12A")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
