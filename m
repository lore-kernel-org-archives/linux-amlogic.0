Return-Path: <SRS0=vGGV=G4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D69C433E6
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:42:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B1E224B8
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8B1E224B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+yTIlm58QtopcCG8owBXVdenB63gGK19fSk7Iz2k2w=; b=U7WqB3dLtEFZxvxmYuzbiTv6y3
	pULMy3T9ynqLwCVgq4Gi8dktNGc6l90Sbhvb/BGdf55nc6MCSQhYwBOiMKRz7R8LHh3rVf17zuvKO
	HdlBC1r/j/MxNeugojnCZwBwhpEfuIIXObZalh7S0//RMRvPs+cWQmTNP0xXRdsUVPVsF78acqbwp
	6wXZl8K+6lopYOGAbaFHDGfGrIUpLALtse86muYKDB7xCO17ci1J6iDUaV1GS+wGbSuEqhMO3v4X2
	SI49RV7j7hX2/cn7k3WoA1fo5fhTFzedzBq1swkvTtyYeJuVOnpHvcqBpDqfGNzeMgg9siwD2so7N
	mBgBRY5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l46on-0008DU-Gi; Mon, 25 Jan 2021 18:42:29 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l46oj-0008AZ-KR
 for linux-amlogic@lists.infradead.org; Mon, 25 Jan 2021 18:42:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id p15so135780pjv.3
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Jan 2021 10:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tDtRKtyqGRuQ4lrMOTvgY4qxd3EwftJYAalx5ZLkrgw=;
 b=LWMBnxG8unZRG+UvzmG3L24ysojyWa1nwbyH6d5X2gSMoOdo7jRTlPU9f63gUJVVow
 INK6pVue3wFGiqqPvUNILYVDMR1xmvqhJX0AyXN6uwgZlOL6FTpz86FDR9+Z3+/tLnJ8
 STsOPy1cidOwveW/an+09+T76NYMHGv15PXKQgTE8u+q3TKLY4T6POinski4DpBUMDdf
 9EJIZMdS+6DN/fEYdNjzicoxpoxhbV75rwCjJGEo1alCfD3zi5ZGNm2117lnzZYzqO5P
 c6ym1AQyOqX00ZL8F5/Vo8B7pu8VG+oHalQuNPCORjmmvO4Y7m2WCj8fUwENocMamb55
 mEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDtRKtyqGRuQ4lrMOTvgY4qxd3EwftJYAalx5ZLkrgw=;
 b=kLFjcFLBOGtBNgeiJIyBUP43A9CEYwp+1Okym94UtdqI0JGg3XQqovw6nsNor65TQZ
 hRcJzCTA0/BvfJVew1+/2WVom+ano053CKFKEkbAwtNbQ78a1UIU1NKZciqjn7qbnnoA
 idQHgX9fvE8clh2FUK00lBewKpcrJDnmB4AnJDHOFU3s0m31XhoEqFMyegOlfz23jmAb
 lI9q0kEAFZh/yvZObaTKnkwIF2VyarGEJCaWRLvWfGt1pve5JniXUZBkHhjb8/mDcbHJ
 ia2ILEva36LHVOsfuTalbWb+La4q13XzZoHSqeQI2NWZyBt9kYvH+5YldCh+KuD1fpBZ
 GjBg==
X-Gm-Message-State: AOAM531vrcM9cGR6M4C1cJyvN272QZapk10rAXHmK95YjCCWrQlikZ9L
 TA00o8pYuPX8uz/8zpemj8KabA==
X-Google-Smtp-Source: ABdhPJwnuhy5CNoBbZXzCSs0DAq+D4xeeHPD21j5t4GTJrqcAa4QeqDmuq0iTBqWnk9X5ANO56dv5w==
X-Received: by 2002:a17:90a:4088:: with SMTP id
 l8mr1607930pjg.106.1611600143332; 
 Mon, 25 Jan 2021 10:42:23 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id bj18sm88198pjb.40.2021.01.25.10.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 10:42:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: meson: add i2c3/rtc nodes and rtc aliases to
 ODROID-N2 dtsi
Date: Mon, 25 Jan 2021 10:42:18 -0800
Message-Id: <161160013614.17631.15998919281170079054.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111135831.2218-1-christianshewitt@gmail.com>
References: <20210111135831.2218-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_134225_754056_9BD41E17 
X-CRM114-Status: UNSURE (   7.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 11 Jan 2021 13:58:31 +0000, Christian Hewitt wrote:
> Enable the onboard pcf8563 rtc hardware on ODROID N2/N2+ boards via the
> common dtsi. Also add aliases to ensure vrtc does not claim /dev/rtc0.

Applied, thanks!

[1/1] arm64: dts: meson: add i2c3/rtc nodes and rtc aliases to ODROID-N2 dtsi
      commit: 930f424bd8cec154466d7929c10f1ad0525f605f

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
