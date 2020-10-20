Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A437C4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 14:50:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 003F721534
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 14:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KGjG7N4Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="s5HEKF5Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 003F721534
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p+fHmirHOjwHntXcDDK90OugNtoTXePqL0bdB0Au2As=; b=KGjG7N4QoPplzHgHh7seh8xpk
	/eg29JsSMYWd0T1V/QLAmvtjO90LpW0+BJn0fHTC5moIayTpZigkV6NcY79sr56yIA+Ax2D+ZvcuI
	CQEB0JtpYD55Q2nE4UH61WMjLR/lGi512Bvc9xidnMDpQZEkYH9lc8N+ZtKac8K2c4eYdVj7O9dWU
	aMLoau/qzq+jbADEOfbWdFTC/XQboMaoNZBlCBZnbMvuwDk6zlBjZ2gBNtw/rO1gNGnqynqDvnAGE
	5F1lSIDRW5NtpTiTV74oZAClTkMTem1tZzrOlQ1vySueEOjtIu3sWmQvMYHt7Vb+2ohsNkadhiqNb
	YLHrMYOHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUsxb-0001L5-Hb; Tue, 20 Oct 2020 14:49:59 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUsxZ-0001KM-Eb
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 14:49:58 +0000
Received: by mail-pl1-x642.google.com with SMTP id y1so1143841plp.6
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Fg6pNbj6ALE21jJQou7VGOk/llHej9K+3C1jIB5kjaI=;
 b=s5HEKF5YDQgHaPTun57X+Qrt1B3vtLMKSsqq+t3SWWhZ18Xiq1hyvXrUGb6YkModH2
 bLg9eQViAONwRN/GttLbHK3reudUxphCoxnSjBdLJ0nSkNbfzeISraprjopY+7fgVld6
 X6X7AdX7Y0ZdG3ECdBCboFnAA/XOXtvBMkSWtdNIK4EEQ+988LUer+A/dNQzB33Qbpzr
 U06DX9SrMSi8jPGBZuQf9QYP0i65I1qUW+AL88fGzqwmvdByofbtEOp+QxL/eg+EUyM6
 uGFag4kQTmY0N0v2j/6Ik0YfonjPH3gmkejGLie8L0B6mYhDm0G8ub10g5S8KyJN4yyL
 WnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Fg6pNbj6ALE21jJQou7VGOk/llHej9K+3C1jIB5kjaI=;
 b=pSIl/PlmaFXvntcN1nzhbijIosbjmFJWxsCnb8Tzvbx2tj5YgRbxzF4uw4G1mYybh+
 lHiZZJxm3hybI/WgQA/aMP9FqlaDEhnwbcLvqkG2CiktfZwPXNe/A5dQLMaW3eNQiaJ/
 0cUsQA9jMWbFRbCkG3FymYLDFlVlvHJlpwFZbfwOBR8qnGztxM1a01GXWNBppmEEJLHK
 nKcOxcNEsF+RiQEe2AKsq77Jhgxi44qNsGbDP/yATXiytwDS4/UBJOmaOzwSWNO20dqB
 D9WRzdRoraevpcNDoXctEMyJAoNH+Hhn+7T5/wkJqUMoadXsv2YtJkurrlccHIXdasLX
 OPVw==
X-Gm-Message-State: AOAM532AFVspDIfc6KcviXXxjDtFliTa6XzAoM/XL6sbBXgTBkznDJww
 xLY+Zfo9Rfy/Rwn+9nYEUSmIhQ==
X-Google-Smtp-Source: ABdhPJzxJ1bssrjG06M7ZqnzU+aSs+/Cyuw10gkAHVZv9CuVKhvM3uNw+Zbvn2KmqaYehwh3HQQRMg==
X-Received: by 2002:a17:90a:e697:: with SMTP id
 s23mr2996501pjy.16.1603205393066; 
 Tue, 20 Oct 2020 07:49:53 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y22sm2706794pfr.62.2020.10.20.07.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 07:49:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: amlogic: add missing ethernet reset ID
In-Reply-To: <68ee4022-df9b-c36e-b828-bc93d6507473@baylibre.com>
References: <20201020120141.298240-1-jbrunet@baylibre.com>
 <68ee4022-df9b-c36e-b828-bc93d6507473@baylibre.com>
Date: Tue, 20 Oct 2020 07:49:52 -0700
Message-ID: <7hft69kl4f.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_104957_508276_6A4B9611 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: Anand Moon <linux.amoon@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 20/10/2020 14:01, Jerome Brunet wrote:
>> From: Anand Moon <linux.amoon@gmail.com>
>> 
>> Add reset external reset of the ethernet mac controller
>> 
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

[...]

> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Neil, do we need this in u-boot also?  I seem to have network issues in
u-boot on board with external PHY running mainline u-boot.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
