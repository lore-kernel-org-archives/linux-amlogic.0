Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD17BC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YP9im7AFInUFG0eSV1ttnCEDU6dKlg74+9dahnaURPU=; b=zDwukq4c4AdoyV
	6/86a97EATp7fCtjtpg32YSF62ugD9vZvLSW94h8rK2GHzz5xnBsquGWYr+7JLZlENr0XCAvMOutc
	Qxa8e90by69C91x0cqHH6Wi9ydK/+/z/g0k/zAULMo/F5QstRDB53c65D1Jt9QBbVfHm7r4/6VV2L
	l9jlFbanTAaEwylzkrnMISg+qZGpPTBjqD1zxtRfWAxQt4X9X5dC0q0XrVsIpOEqR/HodxB/Q8zAP
	UOdDQif/AJS8Bc+6oKy87GDb96Ttl5C9eLKL/ML1dwuYa2UK+8nL7vZz8nBSHX77W2Fqxbhdxb+FT
	96zNrWQpf/8L0jbM6izg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATLO-003wge-Jz; Wed, 28 Dec 2022 10:07:30 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATK7-003vqJ-CO; Wed, 28 Dec 2022 10:06:16 +0000
Received: by mail-pj1-x1031.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso19687585pjt.0;
        Wed, 28 Dec 2022 02:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B70QifF2futZ63jMxA/rA/1s14ICX6BqPGHLhFxdZa0=;
        b=C5LRlCYxs+Yia2f5B39XlmdkJYHY8WTupDIQkic48F5l6WDBaZ/pad1YZYYQvALNg1
         6d2UxERLj5a29ytg7CMPt+IALgNSCrpsWJ9nJSMRcrcwQtdTQkTj1Dl7ob6weS69oUHN
         jZQDgtyDpq0B7ACB2qx1YUJcKhxjAsihYDGNBIX9ulltQdeiEKo3+jjIdO3nXBVls9Y4
         rIdhgpbWhW3KdcmII7viMXmv5IJZhpyP3TnjiLyxA4hjjniMZrChcF8Fr93cOrUKMEEJ
         /5Dr992kKAsNO9g9W20WJ5AZtTheJEh14Van1RNv8e5u4HWL0dPuj1oS8GIh2UQ8lsWi
         VNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B70QifF2futZ63jMxA/rA/1s14ICX6BqPGHLhFxdZa0=;
        b=VChMXoSqigSdIXJ+OkBP+MwD3TAzeSWPPqka58H1H3BKlp6yEyhAyf9ZPXOoskjngf
         RX7d2u6CdbQskPuRw+EXiu/xEOSq7gjSxtjgeK3MeZGMDKG7KKW1t+9/ePUnvaDEbeDT
         9bANzM4VLgUTIUo9ScN0w0AcY4zVUqRP1UUsGfXcLVPJYSHzy44Khg4glzZ9UvNNKXbb
         ofyorJmxd419IarkH+4O2TIFvGPOymh3Jj1FeHxYuvMPFT4TuqL6OurLUIz93TRSEVkO
         4IwfjjIcL2orK5mJJPNqS/Kd6KwAsU29dmk0Yb6UfQymuTYgoWL8YpfJcmP+udPDDQVK
         7aOg==
X-Gm-Message-State: AFqh2kp6J0mJBA/81fWfbb6ioXYkOsVAVPsFhEJDYXRvtRoeF8TjugsN
	yb2KyN7Hgm050ylnrudDn1E=
X-Google-Smtp-Source: AMrXdXt2DmvRUj5RYrhmw0WxMvEch62Z/kg4VaWDUxOSffUKFNhsMcNy+zZq1EU2ixETUe8eh/vO1A==
X-Received: by 2002:a17:902:8ec7:b0:192:4f85:b91d with SMTP id x7-20020a1709028ec700b001924f85b91dmr28793805plo.46.1672221968158;
        Wed, 28 Dec 2022 02:06:08 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:06:07 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/11] arm64: defconfig: Enable USB onboard HUB driver
Date: Wed, 28 Dec 2022 10:03:20 +0000
Message-Id: <20221228100321.15949-12-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020614_900968_C1EAA20F 
X-CRM114-Status: UNSURE (   9.36  )
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

Enable the USB onboard HUB driver, used on Amlogic boards.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06d..42c3528a2473 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -923,6 +923,7 @@ CONFIG_USB_SERIAL_CP210X=m
 CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_HSIC_USB3503=y
+CONFIG_USB_ONBOARD_HUB=m
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
