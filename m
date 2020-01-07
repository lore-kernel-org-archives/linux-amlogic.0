Return-Path: <SRS0=YAuX=24=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E33C33C9B
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 23:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C4E2080A
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 23:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h4swy9Ur";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Jwsj+YaW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58C4E2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yu8EGnBO+Q6gFsYFk8aGoZ5B5c+FE5u/F2Lzmo9vYBA=; b=h4swy9Ur7CLsHs
	YoRlPklK3srIzi1HR6Nx+CMOBc6WXOKAEAOfuEHHgB9xJuoCnni6nr0dG81IR5G6LMmH5pxPl4XVd
	8DgqZGOtdzIaEmhX/YYcIeDr1lmN79S9ZEXHaATLJLi09FIvhSNKRXxR4vfg33lHz1CCmA5sET1js
	lf9AXWiEHG9swP/R+nY82Wxytu3NEabjBxQ6EMSTaG3swYa7bojX7lnmYG/ns/QQDIjfS3joa75I0
	qR8Ur2HJvFSmWCQBzp1r8Vnv5BPcGf70ZjhJoXpc3PUyVBitfd+5MFf0Nykcd5F/YYpBkG5fDkau2
	gMXWGX3vzH2Zxo4s8w2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioxw9-00044M-Qt; Tue, 07 Jan 2020 23:06:57 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioxw3-0003x4-Q0; Tue, 07 Jan 2020 23:06:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id u2so597310wmc.3;
 Tue, 07 Jan 2020 15:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3OMmRwlsdJ8B0kThVmC1teyeuGIZ28R3SGQmOXkOZCg=;
 b=Jwsj+YaWZljQ8pVmlO9Qg4ZcVd6YTIaUwlN4E6/YRZXVupsZDBCT/IG6YD11LfvIC/
 wjubzJKkd+EnH9ivm1vzUrC9AahftMhox5ChzHfqAmpmu/1Jjf34KITt92zTYh9Ccer4
 BajpuRcy+q5Yr7VOOc3TBrZxGv1yTiSbaMIQQALctcEalMwOrS9YBAk0s6XznaDoa87x
 B+EtRQk5P3BEPsKrIR94ZCh9/aYzCUZ6C4dDGIKIWIH9d0IJnWHyNEmYEODKlcdmyiro
 VIjh7IxwSKbbuUP7LniDN/REatFU3fByJiPTFH/dFD8CG816+WaDRy+1coyGQQZruUOB
 jlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3OMmRwlsdJ8B0kThVmC1teyeuGIZ28R3SGQmOXkOZCg=;
 b=lYYWzihbmdSK9Cj2gVdh5ir22GAc//PmFpJXp3dYiW9KyyYxXPoB0P1yGt/p1IBGq/
 495zay7G1XUtpHBm3J9vuzSYpvCujTNEMt78FfqzuxxB/Io5ZOpSYLVslrZ8DPLtuTgY
 Q6dxe983Bb3WSv4S7jHy4FPXFobVN3R8r8EJTcHS85IO6LnkGWhMnuSVZHG6W0JK6M5L
 8vrrQNYko/VJMDMZhI1USNRcihI/lMZH8hEib6ne++37kMYw/ro4pbouPufBETNoKsFt
 kyfsbSR4r1mWGVhdd3G5XMnbOMOihZ1kCSIWd+YLPrrkA66mI/cORVOLc3Uvu/gIH/vy
 qcog==
X-Gm-Message-State: APjAAAVGUw6KzjwHoLmveqcJrGMi8s3sMbKWRBBADtU0cItQD0WSEcmo
 Ch+hrMxIMUX6nK3oPZSlXGw=
X-Google-Smtp-Source: APXvYqx4pOW8OEjv1gMruzFtuQEsNgeqBVsbKCG8agEZlBX/w/EIHafixJNy4g1otnUEt/LO8xsr3g==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr584150wmb.73.1578438410327;
 Tue, 07 Jan 2020 15:06:50 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g21sm1335912wmh.17.2020.01.07.15.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 15:06:49 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 steven.price@arm.com, tomeu.vizoso@collabora.com, robh@kernel.org
Subject: [PATCH RFT v1 2/3] drm/panfrost: call dev_pm_opp_of_remove_table() in
 all error-paths
Date: Wed,  8 Jan 2020 00:06:25 +0100
Message-Id: <20200107230626.885451-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_150651_840338_9514F0DD 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rockchip@lists.infradead.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, robin.murphy@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

If devfreq_recommended_opp() fails we need to undo
dev_pm_opp_of_add_table() by calling dev_pm_opp_of_remove_table() (just
like we do it in the other error-path below).

Fixes: f3ba91228e8e91 ("drm/panfrost: Add initial panfrost driver")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 1471588763ce..170f6c8c9651 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -93,8 +93,10 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	cur_freq = clk_get_rate(pfdev->clock);
 
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
-	if (IS_ERR(opp))
+	if (IS_ERR(opp)) {
+		dev_pm_opp_of_remove_table(dev);
 		return PTR_ERR(opp);
+	}
 
 	panfrost_devfreq_profile.initial_freq = cur_freq;
 	dev_pm_opp_put(opp);
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
