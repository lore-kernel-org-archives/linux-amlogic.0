Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709DCC4361B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 09:54:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D7B22B30
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 09:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D7B22B30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=62jA2fJ2GlnjaI4hPnSVOmsWbhiL/HqLFPGyvMY92Vw=; b=oIVoAMLo9QB6Z59peeqguE2vgK
	hCPuilZLBO7L/ukl6WJAU5bbwP4tEEd7OzbN0+YP2SeoyrtklY6LgpFrwAUIWvguEB7fN7Z9em1Rn
	v2DSphENTJik8X/Jdj4i/DsIisr0Kbn37LnS83PE9BJbPl2CJI8xR+1euKtNUGa6TCvII3xaqhAG7
	G25spJpTKneddM0NcCu34tKhesNAbPJS1JJASW4A6HwkJdqjqzYHVSeFKbbOHs3qIMPO47WDBAGG+
	7SWwB1Y9X1lCsP1QtJonCSb3GQ2O7r9UUgEpGnarWGNFcx+fP0zPf0iwa8bfsvVB8cQlCkBMlFcQx
	xu91QcoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDDd-0001e6-Oy; Mon, 07 Dec 2020 09:54:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDDb-0001ay-GT
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 09:54:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r7so858855wrc.5
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 01:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NDl1SiUqs+tVTq7p6TpRFwWPM2gXn3fAWwGDnQ0ZJLU=;
 b=WU4qUfu46oPI3fbmoBdkehsFavNQIcLZ6Z8f9WKZh8y7/XyV6R5XFUsTZtE8tzBdpX
 /MmV7hdj4l6FNZCQuIDrPCIb0s26w1/M8K1iHtVqVDOhLk1hwL8rrsmCpk/6Vp84Jgro
 JIzhlt47WU53MK7Hr3+VvptTIJzHawkrRDL3UW93QhMdc8qBJOAVn2au0KRb6fa1L/RK
 inZC37yfXxtHHNcdDwlwhIfQ09JI9r9cAqe/yA1SAeA7KisLbQwiZQ1H7e7XSSgJDfwp
 tk02uk5LhGyG70Dqtte5GhLowAqMwr7W+DQiFEwIK1NvR9U529p8ixx8RTKZKw7ZJMls
 Ghbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NDl1SiUqs+tVTq7p6TpRFwWPM2gXn3fAWwGDnQ0ZJLU=;
 b=oTR8jws+r6+9y/NNEvm2H5m2XWjlTWVqQNdaT4TRNjtGleXxRSiAAqlVTimEXzjf+K
 8ehIqDK0B/XTgRq0zaGJhqNtNTanM4Bp/XtRDBZFQDWkYGpox9vw/D9uajs3BU0Z2rxX
 UrA1edLnQiNY2A8dS5Z2JD+Hwl6YdiYex9l2zBUZ59YBPaci+EymdH9sVqbdH6fzTSQL
 Cl9vtEpT89GoXupI9C5OELyLLyyboiII7DwuTzGfN5lhFfun0/XKr+e03h2Al14iy9nD
 wI1jQuZzXih35We9/WGsyA26SCclzMU3F09NqRRoGbCvDl/3k4QK4gzvp3htdlErqOb7
 B0qQ==
X-Gm-Message-State: AOAM532GjMSv2lLzcsgCADN2B/442f5lfa9J3NOeT+IJ6Xvjg08JAkbx
 3dMCa1eSx5BPAREPpb+lmCg2oA==
X-Google-Smtp-Source: ABdhPJzwba7QWJxQRgsk6T64b2mRfYcmawrDO8+x1mYbwtOsc9yi5zyvuvGhVirCO3gg+GM7xSgSRg==
X-Received: by 2002:adf:e490:: with SMTP id i16mr18527870wrm.337.1607334838975; 
 Mon, 07 Dec 2020 01:53:58 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id t188sm13558066wmf.9.2020.12.07.01.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 01:53:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: vim3: enable hdmi audio loopback
Date: Mon,  7 Dec 2020 10:53:44 +0100
Message-Id: <20201207095346.26297-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_045407_610114_CB745656 
X-CRM114-Status: UNSURE (   7.61  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset enable the hdmi audio loopback on the vim3 and vim3l.
I found a few whitespace errors while doing it. This is sent along to
avoid annoying conflicts.

Jerome Brunet (2):
  arm64: dts: meson: vim3: whitespace fixups
  arm64: dts: meson: vim3: enable hdmi audio loopback

 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 60 ++++++++++++++-----
 1 file changed, 46 insertions(+), 14 deletions(-)

-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
