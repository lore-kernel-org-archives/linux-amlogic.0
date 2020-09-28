Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C277C47420
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 09:26:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89D6021D95
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 09:26:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wbM0aE2N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vNqs15Hj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89D6021D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=11Vxk0Sj60BMGLJUEfUXBfsHzuV1HKJyLLCWJEy8AN8=; b=wbM0aE2NxNan5EEymIOZ5MT09A
	29AYvizis6rufI5O3DyzgRpkAzgau1evKE0OL1em4TEEwkm65LbGArx+pDiCvhjsoW13jyI0ZjN+e
	0NOq3Si6QMgPXDrV8LoaciPOgOyZobG5Q68NiFfdgYiCppzDCKV0latriNWFzcEaaQzJ597k8rXXC
	ziVPRyOsiVVE5pOlU6Ir/t7FLE26YQ3iD+FeypxWVPGEwBuUc/Z3QDRbbX1WAl0jjfeZcO0LYydHQ
	ARKKrCfCoFVWKzkBtejDCQSHeLmEBfu8kZEK45WNOPPpCq6+SvBZpB4uZWvgPSqc/TksbfYhVP/oB
	ALx0+HOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMpQW-0005pE-AD; Mon, 28 Sep 2020 09:26:32 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMpQS-0005oG-HG; Mon, 28 Sep 2020 09:26:29 +0000
Received: by mail-pj1-x1044.google.com with SMTP id md22so1964824pjb.0;
 Mon, 28 Sep 2020 02:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OGDzXokaTr5t9IfkNwc6PyW3nW8aWxgsb1wMnm4Xu5E=;
 b=vNqs15Hj21aVyPH7CGzxoqyQlUKY9LLwvWfUkiElc6/oW2ANZ0aGGhD5VHz97Cwvf0
 llOgYV9wZ6DYzBNsCRcf6bKYk9iNdQCLY9ahP5AECSKxjumE3+dWajKv9piDY0z/X+bK
 BYCpLtXbJauwXzK2ZQHP3FNFLgrUYpYcFXOPnBeif0/tBEIpwFl1QaSDxixDxRTQf2HP
 ZoKHXUNpLctmk9T3geArOyImmZ10wYuVH1jZ5PTGYBQjaIFASQEQDjB0nP3y5QvBHGpz
 SFrwEkg1r78EDyRo4JBZAN5hMA5VmzcJnPbGIwAbvqVOl0jT403LPv9FxxtrBKbGP2+N
 iHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OGDzXokaTr5t9IfkNwc6PyW3nW8aWxgsb1wMnm4Xu5E=;
 b=RvQr/Wp6uTWCJ9yq7qaBpkARVbxWrzf8NcXemitkCN1/z+wuTcIL5HL80VjULFmolw
 uWMg+ZDmaupBTBM0RGEUt8V6an1Nzp4rR42RHk/cBHF3VkU88OmjrsaZfezmpexLs6t9
 JCM7O53O2JgNULImbcj//FAD1QAxv2G5SCyKiwByuC2DX+FXGsTMdOr6wNJGTu38vcEL
 6s28SwazbmlPalt/9j3As/O5cPur/8TZ1lEJcloi/WYL+TYVNCBInj8xWC65AZUOGkdR
 7AAY6HKBuEPY+Ur32YXT91tcMK9NhRzAX863hM8iknIkS4MS8r/0m0H7TTugDEuB8jTA
 KYIw==
X-Gm-Message-State: AOAM531MAK8tTRkCfsdFCW3Cp2+UajCN2LqQHXFB6zuJJLdo2xxjTdnM
 xaCqW9pTGYrQoX0qZLiTygc=
X-Google-Smtp-Source: ABdhPJy5FcM+10JX+iYSG9ziQoKTcOlBtcoy9UYP+cmh3/gPtKcrvWvfTS3j1EH6NAecuDwDvVxEjg==
X-Received: by 2002:a17:90a:e015:: with SMTP id
 u21mr493220pjy.33.1601285186073; 
 Mon, 28 Sep 2020 02:26:26 -0700 (PDT)
Received: from localhost.localdomain (80.251.221.29.16clouds.com.
 [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id mt8sm638606pjb.17.2020.09.28.02.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 02:26:25 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH v2 0/2] arm64: dts: meson: VIM2 updates
Date: Mon, 28 Sep 2020 17:26:11 +0800
Message-Id: <20200928092613.273998-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_052628_642070_057A56C0 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

small updates and fixes for Khadas VIM2 board dts

Artem Lapkin (2):
  arm64: dts: meson: rename led name on Khadas VIM2 
    meson-gxm-khadas-vim2
  arm64: dts: meson: change spifc max-frequency on Khadas VIM2
    meson-gxm-khadas-vim2

 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
