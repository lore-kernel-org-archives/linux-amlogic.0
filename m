Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AF1CD6E45
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 06:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+4s4PhyTG6YYk43cD7D2XizhE+RV2IVEjDfv3HBcyqs=; b=v4zXUPvb1g3vzR
	x+na6phRxhNKczjFPb8DEz8iT33JppctUmKsd5yDVrQPgl1r+DqKWBhBVDE5wLKzC0lLiTtPzhaNx
	oQe6ehBj9jZ/IAuJ+Swe5RfEZcbI48dgUM54sIczuI6oulX3WN0BkPx9wr0LTFfhlF5cviN5ijS2e
	w2m2jDw4EZ1cTaUPdDzTVpPVZ9b9jjANzZTYaeJtrHaE7e5Bg1gi8L1fw6F79eiQm+NRlQT9J/M4h
	NpfcYV3pPJ+ZLZdqfrf7Jc0xGyiva3XLQK9UGoLlpo8BE8en2d5xkSAX+210gay4IH/OnX9tWctuI
	hOe0z7vZgtC8juwzpbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqGx-00000006mY4-2Pzb;
	Fri, 29 May 2026 06:00:43 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqGu-00000006mXL-3q7Y
	for linux-amlogic@lists.infradead.org;
	Fri, 29 May 2026 06:00:42 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2f0ad52830cso17563108eec.1
        for <linux-amlogic@lists.infradead.org>; Thu, 28 May 2026 23:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780034439; x=1780639239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3n5bXyy99k9iyvx4lY1kMjVmlRsiOyGImOOHuWaZn0k=;
        b=QOJA61qzK3LxWtZ68baPe2x+RxGgSK+01XZ+iAL97cQT8kS1Hj6jfGzD+1GNL46C55
         andENd99kZtt7+JSntPBEcrAUwZUPt4OhCbZzmqbVhXalU4aA5crZBNDvYr3DmZ9zKwT
         Tz6/q121/r30+xkfX9ssP5f8E6u0kqGtI7pLk6+Y9aivfqm8Nf/7bTIDolNIRixEcYgF
         3gb8/eQe6kVtcQHdmYBXG5AVlCcCuuAmUHhkwc9b+MlslgLCyEHNlX3d4ezMNDRcNU9v
         zk3gcs11htTVMkTqQcG+Wku/Phm7rSn0JgkrNVe3TcSGURBasRSBmqTmTL1iLMTG5wRA
         4ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780034439; x=1780639239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n5bXyy99k9iyvx4lY1kMjVmlRsiOyGImOOHuWaZn0k=;
        b=Cxh+kIFJWSok6gHAsCAlTjFEiFhQgWVuHzl0VOu4tMgF6wKP+AvgqPUnKiN6i/q7tZ
         /FU2Ffg1uMEZt5ZtGjv26QftvvSrLCN39YhFnDMfhupekKrTaR4Y208hgsjR5dmi0JYI
         YqFcqjMjRqro3D5XgUsmMrVX+YY9FUDg7HuujHjJ5xGVaAVssL7XTBF+fhAgSut6P4ms
         XF4zZGFN59KBNJd66Fvg66t1ukCxofMh9uPmwyJgIpZVOiHHKloLhTWAOAnkiJMZK3Cg
         bMAlnpQ73QjH6mnxYWkAxsFpwbp64cxB9vQntgZi12dvHPR0u/mpSqadYeLihILTvcp/
         WdDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jfxWeH2wvscEwSBMs7CyWcipLXbw3d6o7t6+To4rGctAVHmSIDvm66b9kltWKHnzE3gkz6QOMkMML0L2/@lists.infradead.org
X-Gm-Message-State: AOJu0YzwKden9SezGUZ7/xZ56UPHv3XGMnc3bXwF6pk+g/TSpt2f9EFa
	Nh5pbfa6UY1QXCjmr7CWsirBqF1ZbEIkps8aZYx5jVVxjifNtrMWhcx+
X-Gm-Gg: Acq92OFMYfsmqR9GLL6fKXoE0bpxXcoAb63EshlD95DNyUAlS8cXqczz7+yySQtlqRD
	rSXjL1EVDw3/RjNmEA3AD/FTOXhtvlCGf1mxGpvPLL4gNmWbyvSiQ7vDmpReF2q5b3v0zVXUB5d
	uMflBr75MJqknGaiVOyPbRa+I7HP4ftbtvddvIUiPEB8+qaT+SbHxqCrjcg/RtL+ONIBTM00L29
	Mu5ZpE8JzSPK0BZdUgDSKWX/e6eDHwq77c5t0NLLeFammiksh+jr45LG1zL5Wj/DhGbRjxFRNth
	vcyuXeQUv3/M/3gHezJGSQ7AUtzIsTHqw1VGzZx+UiChiHNs1VfyS7UEPwgxKF+RZ576L30TZPi
	y3Kt2EqLCfMcU1awEkN0AxtG0hNC+oiwEaJgHr9du5w6EXYaEDvphgkwkil2lqA+eUTJ9cw3RX6
	pWJCYITHP6y3vZU76lPWeBye1846USU9q6cj5ANx8e6JmkqMvgwNc3E61aWT3mpXvpHq5/Ls9b6
	ks7XNSuKZymxXEu1Xo8ZQJiUQtrH28uSB/U1Wuksx/bzkq1y3fs/4MkspsaDwz7wuwk/7dcfuIk
	vOLXASJUqyFNliOZOUcDjg3k/04QA1wAq5jB/JJSMOGxVSDVCrx2BXtAQZFvD51RQJk=
X-Received: by 2002:a05:7300:7f9f:b0:2da:44ac:6d17 with SMTP id 5a478bee46e88-304eb0d738fmr636180eec.17.1780034439290;
        Thu, 28 May 2026 23:00:39 -0700 (PDT)
Received: from odroidn2.. (c-67-180-34-11.hsd1.ca.comcast.net. [67.180.34.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c120csm674689eec.4.2026.05.28.23.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:00:38 -0700 (PDT)
From: Yi Ding <yi.s.ding@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yi Ding <yi.s.ding@gmail.com>
Subject: [PATCH] media: cec: meson: ao-cec-g12a: name the CEC core regmap to avoid debugfs clash
Date: Thu, 28 May 2026 23:00:05 -0700
Message-ID: <20260529060005.94700-1-yi.s.ding@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_230040_950859_55879F49 
X-CRM114-Status: GOOD (  10.63  )
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

The driver registers two regmaps on the same platform device: an MMIO
regmap for the AO CEC registers, and an indirect regmap (using
reg_read()/reg_write() callbacks) for the CEC controller core registers.
Neither regmap_config sets a .name, so both default their debugfs
directory to the device name and collide:

  debugfs: 'ff800280.cec' already exists in 'regmap'

Because of the clash the second regmap's debugfs directory fails to
register, so its registers can no longer be inspected via debugfs.

Give the indirect CEC core regmap a distinct name. The two debugfs
directories then become "<dev>.cec" and "<dev>.cec-core". This only
affects debugfs naming; register access is unchanged.

Tested on an ODROID-N2 (Amlogic S922X): the warning is gone and both
/sys/kernel/debug/regmap/ff800280.cec and ff800280.cec-core are present.

Fixes: b7778c46683c ("media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driver")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yi Ding <yi.s.ding@gmail.com>
---
 drivers/media/cec/platform/meson/ao-cec-g12a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
index 41f5b8669..2c914f000 100644
--- a/drivers/media/cec/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/cec/platform/meson/ao-cec-g12a.c
@@ -405,6 +405,7 @@ static int meson_ao_cec_g12a_write(void *context, unsigned int addr,
 }
 
 static const struct regmap_config meson_ao_cec_g12a_cec_regmap_conf = {
+	.name = "core",
 	.reg_bits = 8,
 	.val_bits = 8,
 	.reg_read = meson_ao_cec_g12a_read,
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
