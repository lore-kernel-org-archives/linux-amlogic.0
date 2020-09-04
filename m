Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D77C43461
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:02:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5A12074D
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 16:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fmqE1vxK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OkpOrPJZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5A12074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WQ+nf6SfZLkeIiC0tBglC3F047LYAWIrNGSHW5hKmsk=; b=fmqE1vxKxJ5UGqmip5xUxzHhxa
	FDyYzkcuuhuekZ6MgMqQaXpQs6fsYsKcSiWZVeeV1/xHjt5Zy9vMjtfr3O8rpnbeKVs9QU8/JVtU4
	zSGFuTZmCqzMzKG3r086pdJJ4DLhFA0dT6mpPMI0qpeAMc9+hxkDBWbV+nb45rCwJ5vj1h9QgLOVP
	N9/UMHtCCFY+VZa7JouXFViwKf8xq5BbawyPUeMb8KxOqKusZIoIUDGhLfUQfMtddCLrX/dhilvcw
	bUhSomaCLFZEAIx8J9kpQodwUDYJGV+0FwXXStEMv2pjRROecudrcn/YH7SgeAj/2Y+NL8CRA07mk
	rxpFkCew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEEAX-0004Mq-EO; Fri, 04 Sep 2020 16:02:29 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEAE-0004Cr-Fe
 for linux-amlogic@lists.infradead.org; Fri, 04 Sep 2020 16:02:21 +0000
Received: by mail-wm1-x343.google.com with SMTP id e11so7815336wme.0
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Sep 2020 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPWs6+bNAsvF0rvAc3yDkiD79Fr0V6X4UpT2H9wqL9w=;
 b=OkpOrPJZjs2Y0PihfJ7PKAOhPKi+QXL4WLgx95wnrgwebxFXuZPO471OqXLrfRoYPw
 W88jgdiC3dytG8y7rSPSpp+QNgisq043YZXmCVQ9dBEcxIN9ABSt5YaSUwE/K0puhnZ4
 CjEXXPkmqV9ZhBsRr/uZvM9BAmbPYn54nsjTtrqnRA0v9oBqkuCyGS8+D3cz5nub6xIo
 gURl08C/czURvIgKQ9TOxjZbmJ/xgAyJ/75NW3bXcO9xX6el1jKLTxNRAaH8F4XFcPlS
 l+Z8a+Hy7DpKDllQBV4TVm4MXt4XfwcwCSmg7/jR7/k+LHRQ/52KMId1KfaVH9M5MHWl
 qkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPWs6+bNAsvF0rvAc3yDkiD79Fr0V6X4UpT2H9wqL9w=;
 b=FFwAsum/kYTtsNtugjMP/5KwwQktoSGjJYY9sW8vsmHgfsPTOsAepMuVQMeLadi1LS
 Eci8FKN3GWKf1QLs1++5wYr5y2lE+Y3IEeBl07J9yNH156phjnW+B8j0awNqYQDrO6Fz
 YghkHx3wvGVj7UaB6/1ZMJOolS2QABUdpmTuAwTGTkBeYDF+WQIOXztocfypdLpQyz8N
 ZW3QX2KprcV4Siifv799H/Do7YSe2et5+14f60iWAD5mr9QHaxT/K1t81/2cLh3QN+Pe
 CAVTR/bdef6Ws99UhXJMNt3AS2/4PAyqKBR+T9srtvPkUPJXlUF9w8sE4C69ayep2A3Z
 Af1Q==
X-Gm-Message-State: AOAM531cHNsScUKBEUyGePhKk+Axq0AenA0bIO5pGnICedbkflTismrr
 IPjKeV7Wnxw/FBLmyiLPn+MAtA==
X-Google-Smtp-Source: ABdhPJxqrPj4FqwNvFmd29r1spI/ZIQGafj/o4jzYrlvzXdLjkT+3k5breq2rCLBzbh5/WkV2rdDrQ==
X-Received: by 2002:a1c:ab55:: with SMTP id u82mr8388426wme.139.1599235328834; 
 Fri, 04 Sep 2020 09:02:08 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id i3sm11938627wrs.4.2020.09.04.09.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:02:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/2] soc: amlogic: add support for the Meson AXG Power
 Controller
Date: Fri,  4 Sep 2020 18:02:04 +0200
Message-Id: <20200904160206.22570-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_120210_695824_57FEABC4 
X-CRM114-Status: UNSURE (   9.14  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the bindings and support for the Power Controller found in the
Amlogic AXG SoCs.

The Power Controller in the Amlogic AXG SoCs is similar to the GXL one
but with less VPU memory domains to enable and a supplementary Audio
memory power domain.

Neil Armstrong (2):
  dt-bindings: power: amlogic,meson-ee-pwrc: add Amlogic AXG power
    controller bindings
  soc: amlogic: meson-ee-pwrc: add support for the Meson AXG SoCs

 .../bindings/power/amlogic,meson-ee-pwrc.yaml | 23 ++++++++++++++--
 drivers/soc/amlogic/meson-ee-pwrc.c           | 26 +++++++++++++++++++
 include/dt-bindings/power/meson-axg-power.h   | 14 ++++++++++
 3 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/power/meson-axg-power.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
