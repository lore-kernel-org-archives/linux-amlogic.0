Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9753C352AA
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 07:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DD4E21783
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 07:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d6mJmSMV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZCCL6Wv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DD4E21783
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4r2QNS4wrccgTr8vwbUI1+ItoHCxhOMX9W856JsW9pw=; b=d6mJmSMV146NMT
	N+skD6UjF3N2OO1VnjXaWnXy8CUz/6S7hUywXBPk3YbTZyeOsYcR7x7a+ACayF72hnNPmhIro6e5P
	bWTzYL1AEgL8f2QQ+ddLJKYXcaGwLpW3wPMoK1DphQSfpjXnAdLpZjTY/BsC6hjK7YLsmDnphQyrf
	sa6A35jCPwonOEzmwXLROWtU0nBDSFldvXCZWzrW3gBAu3Zx3zniA1nV3+7OI3Qo3Pwkyx0ost3Zh
	cqx5kzrtfEyotgccr3zKP0CuUQuOdhLLwoLoFNOj4GMk/9T4wWbiRl7R5IOKi3uVo5A0IDeIQs9lR
	DcTOZbnDV2yBKJC2aSMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFCkh-0001if-Nu; Tue, 01 Oct 2019 07:39:19 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFCka-0001cG-Na; Tue, 01 Oct 2019 07:39:14 +0000
Received: by mail-pg1-x541.google.com with SMTP id q1so981377pgb.0;
 Tue, 01 Oct 2019 00:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d+XFVlqmdczgfds1Dy3o5Q1n0UPcPm7FLBJVkbS1FRI=;
 b=kZCCL6Wv6ckxpsHQfP+jMu5n4JpfOYT7ga47pCoO6uutcU6zZrOm55rBGFlhH9x5zO
 x8Iwi3y9n+iUUObpezPF57bsLFwJcXhgmKd0JCEjTZ3Mgta7i4vx3+eh+ac9CIWMFdGU
 P+k8VHxMK7iG0ka/iHqUkv1dug5WK2tQEtbN+rJcMEZ2q4w8OcJl5239zu3Amrxm8ZRP
 EwKcuShpZ85tg2suVwzZ8lDLUjsmZetUDc+LWuiIcM4B7mowdLHNONz1qMc0+pFxi8Kk
 YesWe/Y3LQxpfw2FeJrVpb9eUF9Wb/2a5EkQody0trLjgKnQFkQuiH5HiPbbRpRybzfW
 pYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d+XFVlqmdczgfds1Dy3o5Q1n0UPcPm7FLBJVkbS1FRI=;
 b=TN+DXyk3uS4/6/F1wrEInrwItlbS/z04yHZKSnXQjGDj0RDHRdhekMHbe70lH4m7vW
 xZAsexG0MrViG+JABxSqrxiNtWeHFL0GLoU3+bIoy6EFMU9XPP9HpNIrtTPxyU/QooA7
 iYV6W7IrX+2RiAZKuBu7/kYreTqkux2ibCMYd0Vjr4rGVhxclo1cCkNz7v4qb4RS+he+
 zsxJhTNuuy/BMukdv3+1XVFXlcn2fAp1hxbEi4Frx2/sC2twRbvp1spSkxo9RcnOVDDr
 swTRlhNMXsrWcTRPypvjqLpCIQY8UdLoEfuHFgwhz89Pivg4pN8zq5kyCm6ly/sv1Pz2
 c+/g==
X-Gm-Message-State: APjAAAUh1T+nxWTNSjXTa4Lr2wS4SU+mRNO4InEKT04FqKm5grDB3ryF
 xmDNg1+TJZ4TmPUhrW7i5kHE50ce
X-Google-Smtp-Source: APXvYqyS/slV7GS5YvJ7kRHM3s6Z948KYm85VVT9ES4WvZ/YOhx/a+DDOUToG0ox75TZC06wlRzJew==
X-Received: by 2002:a17:90a:7bce:: with SMTP id
 d14mr3979423pjl.96.1569915551132; 
 Tue, 01 Oct 2019 00:39:11 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.191])
 by smtp.gmail.com with ESMTPSA id g19sm23133024pgm.63.2019.10.01.00.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 00:39:10 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv3 RESEND-next 0/3] Odroid c2 missing regulator linking
Date: Tue,  1 Oct 2019 07:38:58 +0000
Message-Id: <20191001073901.372-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_003912_768332_A926B3A3 
X-CRM114-Status: UNSURE (   7.11  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Looks like this changes got lost so resend these changes again.

Below small changes help re-configure or fix missing inter linking
of regulator node.

Re-based on *next-20191001*
Changes from previous patch's series.
Build using Cross Compiler.

Added missing Reviewed-by Neil's and Martin.
Added few suggestion from martin for rename of node.

Changes for previous changes.
Fix some typo.
Updated few patches as per Martin's suggestion.

Best Regards
-Anand

Anand Moon (3):
  arm64: dts: meson: odroid-c2: Add missing regulator linked to P5V0
    regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to
    VDDIO_AO3V3 regulator
  arm64: dts: meson: odroid-c2: Add missing regulator linked to HDMI
    supply

 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 53 +++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
