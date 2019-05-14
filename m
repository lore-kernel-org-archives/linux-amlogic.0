Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEC7C04AB7
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 08:27:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC012084F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 08:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HnE00ISB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JI4x7e7O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC012084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RE4BOxKP1He8t86VUtkZ97yssshjyT4fsWuF/Kuy4oo=; b=HnE00ISBZckV3VGhlz16DgoiFk
	gRmQbY2EVOKywNdZ0lYmDQmww4/asMuEbgPks8mzDQLZI4rVfSwWKESz0eXzqWF1L9ecvFCoRdxny
	my2akxeHklvcLEoKddRJEShJzmsgarsQvzOudJjUvBl2QPBVYQFBj0Wd+BQ0j4Dqt3FaJWSJhYjOO
	/7tLx2kkRQzssAZQotAk7HYgpDtlhcRGro3E5H/W8g4hTOqgzd+WLf8K5ZY+46pjpb8Z3IxK/Q9HV
	B/HxAMJbWpPHxKUMJEEJZss2G8MhZ2XLYGzPiFZKNLLYRBgMnKldhOqclXoRA7jPKFx/Zt/2k0Lrl
	/EHkhG5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQSmK-0004sX-5w; Tue, 14 May 2019 08:27:16 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQSm3-0004VD-B0
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 08:27:01 +0000
Received: by mail-wm1-x341.google.com with SMTP id j187so1834252wmj.1
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m6Un7OR1aiu9wrzrl8IRY5GNnopILO3r5dQ0m/pbT10=;
 b=JI4x7e7Oy3ry6mUfW5LiquXDPgzPcSd5zy3s2eWGX8WqMy4EoeoVL09PGiMTzW7OUy
 1zeXMdUAc5rN/k2ekwFxZQjgWsnxfzn+naKQC9NEexCAXDQsCNH5PPNziSSUXRDpJqs1
 OfiuS76sPDL4nxBByqQYJ8ceKziM9y6w6IehCyldMAoDofXEUxCn6pScPIkxOxhiNiUT
 siaJkO0/F1sbzN9mRsGPj0Y/nIBelz87TCjWLLrz3pynDQZ1UbNhYFiv1Zwtv+cuy+H5
 WGYV6ucH77gBg94yuAFVmhA++4wsANAXLf9KcVg6DK/Cz2foMz3t+tbLRKSQ3Y7xoA4w
 TEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m6Un7OR1aiu9wrzrl8IRY5GNnopILO3r5dQ0m/pbT10=;
 b=cXPiXavFQvxWON2nnQxlcNj7DLReqVkQ//GFkxeNC3xkdR9aLdO7NHaOLxypza9+wQ
 0KUUZVs4139rcOKOxwEV3ssRZaLIHv8zQYZvHMBdzccgiLv+LQRcBTg70hDXxc749qNX
 zYoPBHwoMY/jxVnPk6KuQyzFi0LQR8xgVykzDKcG1fPi7CyIdu7TxPiw8B8CwGCh4YrC
 THEccLolGvPQWIZbIs7QThNfZWpgSant7wsOEOI2uhUn7rXHrSzhiIUKnfj8KD42oonT
 NWwH4SRwdw4QcOqc0ZRFOIWmYH3tIaxAy2TE1TLoXaWjefRg+ZGbeBS46NYQWT6QB7oc
 HKWQ==
X-Gm-Message-State: APjAAAUWro94mA5Z5bvs7TnjPFdA6vfGGoWQHCLnkM6nzFgFsLp0tbOk
 GYd2V5+jk03zRnkmFDfQVWVEwA==
X-Google-Smtp-Source: APXvYqwiyL+F34V5oX5aorvsSvFWYQaBw0/Pj5Q1wGOXb7PjKpXDBCJptQeHKQK6h73Y6MwygEhtkw==
X-Received: by 2002:a1c:96c9:: with SMTP id y192mr7711843wmd.75.1557822418092; 
 Tue, 14 May 2019 01:26:58 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:379:8b00:1910:6694:7019:d3a])
 by smtp.gmail.com with ESMTPSA id j190sm2450772wmb.19.2019.05.14.01.26.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 01:26:57 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: linus.walleij@linaro.org,
	khilman@baylibre.com
Subject: [PATCH v6 3/6] dt-bindings: pinctrl: meson: Add
 drive-strength-microamp property
Date: Tue, 14 May 2019 10:26:49 +0200
Message-Id: <20190514082652.20686-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514082652.20686-1-glaroque@baylibre.com>
References: <20190514082652.20686-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_012659_658010_421043C4 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add optional drive-strength-microamp property

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index a47dd990a8d3..a7618605bf1e 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -51,6 +51,10 @@ Configuration nodes support the generic properties "bias-disable",
 "bias-pull-up" and "bias-pull-down", described in file
 pinctrl-bindings.txt
 
+Optional properties :
+ - drive-strength-microamp: Drive strength for the specified pins in uA.
+			    This property is only valid for G12A and newer.
+
 === Example ===
 
 	pinctrl: pinctrl@c1109880 {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
