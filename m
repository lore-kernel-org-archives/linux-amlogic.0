Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843BFD1CDAE
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Oct 2024 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHL9geeZknicKoSTLghsSMItMgguvesf3px8amlOMvM=; b=wTSqCNlCy/ZPsD
	zXYR1MJWO6Bq0Kvk7ZMRagVyTjk8zlkkXC4u4iTXCCOHa+RjDFTMHJtrpJ07O+GcBY8rdZtA/7d2E
	ziP37iZSrF4tZyBvsj5iP1icNipYWXPtnkALgdXPlS2yZApMz9bvdd11p5mvsV+Zu+KVslbB/9nCs
	0ndBL3fvO45E8X6XaG0l1o8g/uht3SO3SwLuC/qk2AufJmp7L2euNMLb/l502lKVx9FXfj0SbGmaO
	VS5kltmjYT8uQpOYThlUaofwyeFN5J1An4KT0ZGiGCvkA9m3ijDruvKOCUwt884uJMhFoymLKKpRH
	v/XfCPtrnGitwFWIYWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3A9J-0000000A9C5-05YX;
	Tue, 22 Oct 2024 08:21:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3A7A-0000000A8kg-28BX
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Oct 2024 08:19:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so44971655e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Oct 2024 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729585178; x=1730189978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL7mVxMp+9R/aCr51mmHchZz4EvxpV8Oo1TSu+Ak7HI=;
        b=r0MTi1lMHscz5LhUNS++Ts5D2v2JiZK9NZVkSga1pE2BTlXHJDCBcGnBXET6GpQeTl
         a6hK5l52nSNNyH1eJ24/kryMW5q5PH47rNjlCTWBVXTSahMXPbczX7dhmvlbqI5t82s+
         zuOpofmdG2HlvT07yAZox0eLLfwwf34ovm46Wii8CcJSc+zzd36PSwj20XdxPhH2oxMm
         //HQg0MiDgGA+oEvCloezefrNA75s0NUHhDuPtsUvS2LXcduFt7HC6WrJSciI7hYft70
         D5/PuiI5FIW5I/l2BhChqhOZFI3kC+KPg4UYXt9H/N3ISSzaIiNgigeKa+YGtN9C+UaB
         hWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729585178; x=1730189978;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FL7mVxMp+9R/aCr51mmHchZz4EvxpV8Oo1TSu+Ak7HI=;
        b=BxvRffzT4CoTDN9wgNKk5ai1mvefQB1hEIf5G4MSYK5WFLbh10RDQXuXaeWBddhusQ
         9jF5N6v6qZVjA+BRYPhkRydybi48I/xNBi8qTcFTuwUIQ0j5UvtJfLxC/TbEyQUjXb3s
         PsHqZSbGjsCT3IDOGpuhrvwZmX/X2levwyufqlXV9ihyDaBsw7/VgF38Twp9/Otb4Pde
         tyuCH7prnRpqSD9FQRNalwp0Oz59XjD+MQVw58UAe1CcZsZ9kmrC9roZNk/6SXrfTTYW
         s+OMx9pKyRK0qEc9blxKUjT5E1MDJfLQDAo+AmCbGg5H72NeyoETHIbEZ4+PKbruJem6
         SgEw==
X-Gm-Message-State: AOJu0Yzbk940T62T7luvpAETXp3hpqMJqUqv8Pjt5jB3p+vREIRZpiBe
	xcU5BlqMVQ+cARn8PkOP5exAtcPUAfdiZKDnyGJj10IPwtbEqFcwfAvUsZWgCqQ=
X-Google-Smtp-Source: AGHT+IE5vRD2Vte+CM4kdc57GSfq9BMFWtI/WIUONZMXx/Kfa0SAtSqvVmqF0g9m0UTtA9qWK+DO7w==
X-Received: by 2002:a05:600c:4fcd:b0:431:6060:8b16 with SMTP id 5b1f17b1804b1-4317cb09538mr14288875e9.30.1729585178324;
        Tue, 22 Oct 2024 01:19:38 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:ef1c:ae40:1300:20c6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37ee0a4b26dsm6074261f8f.45.2024.10.22.01.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 01:19:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241008-meson-clk-rst-aux-v2-1-682ab9151f4f@baylibre.com>
References: <20241008-meson-clk-rst-aux-v2-1-682ab9151f4f@baylibre.com>
Subject: Re: [PATCH v2] clk: amlogic: axg-audio: use the auxiliary reset
 driver
Message-Id: <172958517664.9195.129752834617236997.b4-ty@baylibre.com>
Date: Tue, 22 Oct 2024 10:19:36 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_011940_582828_E70CC2C6 
X-CRM114-Status: UNSURE (   4.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: amlogic: axg-audio: use the auxiliary reset driver
      (no commit info)

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
