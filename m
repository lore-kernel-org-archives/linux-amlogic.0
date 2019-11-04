Return-Path: <SRS0=GwWn=Y4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BBDCA9EA0
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Nov 2019 11:48:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B75321D7F
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Nov 2019 11:48:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vsyl0z0I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B75321D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tg8frQIGBH9PovuufZrspIpNLAjQ/MDSWHzwuPQDCVU=; b=Vsyl0z0IKPu+Cs
	qebCemclpYoDcrVNUUz+RbmZDsPWOkGBFhiouUfNdO+HQ5bVnv3r80FmaHqNO0+D98vdZiawD9K1K
	d4jH0wbDcwO3sCUcQLRDPGfDmlJzOCe6azmtE9W1jWyqoEh7dJ/FNJqsmEzuhPp8c1Mcc2KlomgI2
	2sS26u96YvjnwN9d0GLMaRiOaeB2w7tqLjq22Yn/WNIJy0lCQIq3ekCQRcGO/YxPcOfm6lJgzilLY
	SYJ4YtVUs5Mi71q2Y1WjUmtM0SjQzOUbvCeQ63mlmOqrw84fd7fVBEO61c0i62WQsnbT4pL8dETyw
	USoJHDYIrEZSg18uHUGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRapw-0003Wh-Is; Mon, 04 Nov 2019 11:47:56 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRapX-0002yJ-CQ; Mon, 04 Nov 2019 11:47:32 +0000
Received: from droid13.amlogic.com (116.236.93.172) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Mon, 4 Nov 2019
 19:47:37 +0800
From: Jianxin Pan <jianxin.pan@amlogic.com>
To: Kevin Hilman <khilman@baylibre.com>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH v4 2/4] firmware: meson_sm: Add secure power domain support
Date: Mon, 4 Nov 2019 19:47:06 +0800
Message-ID: <1572868028-73076-3-git-send-email-jianxin.pan@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572868028-73076-1-git-send-email-jianxin.pan@amlogic.com>
References: <1572868028-73076-1-git-send-email-jianxin.pan@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [116.236.93.172]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_034731_460350_5C840FA2 
X-CRM114-Status: UNSURE (   7.31  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic Meson A1/C1 Secure Monitor implements calls to control power
domain.

Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c       | 2 ++
 include/linux/firmware/meson/meson_sm.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 1d5b4d7..7ec09f5 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -44,6 +44,8 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_EFUSE_WRITE,	0x82000031),
 		CMD(SM_EFUSE_USER_MAX,	0x82000033),
 		CMD(SM_GET_CHIP_ID,	0x82000044),
+		CMD(SM_PWRC_SET,	0x82000093),
+		CMD(SM_PWRC_GET,	0x82000095),
 		{ /* sentinel */ },
 	},
 };
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 6669e2a..4ed3989 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -12,6 +12,8 @@ enum {
 	SM_EFUSE_WRITE,
 	SM_EFUSE_USER_MAX,
 	SM_GET_CHIP_ID,
+	SM_PWRC_SET,
+	SM_PWRC_GET,
 };
 
 struct meson_sm_firmware;
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
