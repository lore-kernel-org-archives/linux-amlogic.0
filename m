Return-Path: <SRS0=qkt4=BK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B48C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:21:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AEE42072A
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gkbdFu3Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahMfSYnn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AEE42072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jVZldUjf/eGgQyNJEdn8PdTe+7B3h64nvKnfGn0q5W0=; b=gkbdFu3ZwlNEogRyZWw1XeVi+q
	tP6HWBlCHRt68NCGAk+IQvKHO/E7LehGQYK2Aya5JTWHlU30XSw2o+SjuKf2gPbCPB+y+JMupWIIK
	DOW7ETQKZl0p+X5tAHixXO0XbEfbDeVOLHCrmvtnF9EIx/R7/Lj3s+s/FBwWDCGEPZ3ZEBr29LIH/
	AQxX9B60qm18zUs/ZpVFMw/kHXhMJoGdGFjaHYrlLwsD+Sfk7rpnh6Ii9BHyKA3lb1uxgbqeYOpjj
	7dGh25qfPCjTnce2mKbwv2iateJZ6GD8/GIW1G5QCCBk5vNs1ulokKw47ohVw5epTsxezGkdXkaHB
	jFEw3/7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1QHj-0002Yh-Hm; Fri, 31 Jul 2020 08:20:59 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1QHc-0002V7-JY; Fri, 31 Jul 2020 08:20:53 +0000
Received: by mail-pl1-x641.google.com with SMTP id w19so3735504plq.3;
 Fri, 31 Jul 2020 01:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0M5k1hgIS/4BRGKQ48rck/0wDyqMqHmZifFqKqCzKyM=;
 b=ahMfSYnn7PJx8wZSkiNs0sWm5JvgBZ6cvhTfGt61ysKqt8Y+rTNJUPwMzqJoE6TL2J
 WXHFzGf48AFP6fZVJ1eOtsX4/TQrg4UGkyvE8cIa8nuaiZfAm/GV6AKxpYAkYtZE+dF8
 em6G+3f3Xz/QeSbosd6iddNXYXzc+BWyPcgZph7G/+O4w8FvsbrIrXYPey9rFQxgAUVL
 IPgWPtEgoKTQ/GvNybP8Do98lzLmbF8JYthebcRJcU4PFCQgKXPhyMssvq0LMOoEThCj
 IF8MT3Rz7aVpCikXAbHUuMAWZ1lOtmq+pSeLYgbVK7MSAz0tlJyFQS6LaxbcS3tzAW23
 oa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0M5k1hgIS/4BRGKQ48rck/0wDyqMqHmZifFqKqCzKyM=;
 b=QGzJEu6JDjnIV3prHAmOgMGOVkP2LS7BqB4MOQ1dX92iGDDPaPQefCK8W4v+rt3uIw
 DzePnVwbULeFIxMwX1oDv5XQcxAsRvXzSkGV8Q0d46ULWfi0pj8rMG+qS2J3ESPGRxKx
 ZOkvr+jrOfnd9EBvwTEs5TdTxkWn8w1jpiqAbUAmdSVoQSbbwp+fTFRB1DcsdBZzltxI
 KXNEYBjWvBQSrLr5k+gn8ZVtvw3dAQX6UEaEi6FJTzsbGE1AFaaopq3I4FB+YZBdvIN5
 OkTIDoIwicFxw8y9PaTP0UyoLcsp0MIE3GlZmpYx5CD23KgF6xYfaHSLD05qxlmrD396
 YybA==
X-Gm-Message-State: AOAM533zdzyhf8kPIGOBXZxwM43RLWNrEKi23iba2GylM03CbyOEgigk
 4udNEzv97WCvsFqDlFFga2M=
X-Google-Smtp-Source: ABdhPJw1ENiAY0J4GydlD7exYa4eFVMlQBHwtW1xJL2bzrDvdHI3xnPrNI3CN/jyYE99k3lxqjbDQA==
X-Received: by 2002:a17:902:7246:: with SMTP id
 c6mr2734700pll.17.1596183650726; 
 Fri, 31 Jul 2020 01:20:50 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
 by smtp.gmail.com with ESMTPSA id 202sm5892917pfy.6.2020.07.31.01.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 01:20:50 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/3] Add missing ethernet reset ID for Amlogic SoC
Date: Fri, 31 Jul 2020 08:20:40 +0000
Message-Id: <20200731082043.1682-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_042052_747598_FEAE9347 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add reset id for Ethernet to reset Ethernet IP.

Re-based on linux-next-20200730.
Could not test as their is build failed on linux-next-20200730. 

My observation:
- Sometime the device on upgrade of the kernel
  don't show up in the network.
- My observation that Ethernet interface come up successfully
  but no packet get forwarded.
- This happens some times on my network.

-Anand

Anand Moon (3):
  arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
  arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
  arm64: dts: amlogic: meson-g12: add missing ethernet reset ID

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
 3 files changed, 7 insertions(+)

-- 
2.28.0
:

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
