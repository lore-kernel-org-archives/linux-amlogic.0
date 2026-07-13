Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DF2C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiS3OqDU8Ap0bEq3/FS7UYKRKhJxTzbo37Xo95/gyEE=; b=XKF9/hZJGEODsY
	oowtVMBOo9ePEkWnaQ/BytV2PQ8uwpfX4JYMaV6sK0oq7bRYxUKyZLyYuzhw02/AYRpnjqxfFjJ8w
	5xPokEF85O1pXfg6xjrRulEzbaSdhv5uTr2tQ87Weyx3M3VHC6kk0b8t8TC1NGEFAC7G8O9+7dsc4
	P5k42dBz521iHXF7ilH1XKyrJDNEfnbCaYSeIFh2iFq6IAkXGyX0ZDtNeDj/5leT4Ve4EUj+ozMdS
	WU83hGxj2AKlN4uw/nUfrASPqQUTxilwCvyHYYZkklGn/0BdfwV2/s6gF86THpgQz9F4ErabRCkfX
	L4Ae7YWTQnAh/L4orqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVG-000000099K0-05EN;
	Mon, 13 Jul 2026 12:11:18 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVA-000000099HB-0VEo
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-381018b9375so3450827a91.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944671; x=1784549471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnt3ypfWeNL23UY1KrHNZewux6mQtgVXM5HeMULrIrY=;
        b=jmTHSFhxWLaBI3/sFEYikae/aACqqNvHCHVyB99f/1nfTXhg9nI29il6PtbdxVFGBv
         ZMY+AzCWIpcQCXEe1xWm9WcRxpFGHOJ/jJ7OWdLEK6D8nJdFH5sp+BUjgManyPjPcux7
         y+vkjWneKLFRoJBxuq70+1bni49YISCPivTvUrpL5sID/YSpaOvk0sm0HQ+CgTiRCbRG
         i7CQGenuuBy++tzsWoPvmZFfhc8nxg3J81gEla/4YL0fZgSlku9JPw1AhtyHr3Ajl8Ch
         4wddTNcd31308IX4/CO9Ln6X1kcELwZTiKxJT229HLtXyxBt44lBz8fxLCAdH/iCOP70
         ZBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944671; x=1784549471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnt3ypfWeNL23UY1KrHNZewux6mQtgVXM5HeMULrIrY=;
        b=ryQ0Qd6atx/1QjohHmZ8MdG51+cSpv7TtbOugqVsntSHwTMvz2zk2dm0h+8xcd86Uc
         y0dE2dl8SNfhvGvrFtz1h3NalAHRRfNck6LWjwrRYtTOj91kDkRkb7Az2iFpGAbMK30S
         Bm6eQ+7RwmanWlA2HSHz+MAWRlkvZoiJ5P6wDAbdfnXZ+RQeLC1mM/ELSEMsJ2MYYlK5
         BvkAFov+b9HrJlQWC50ff7LI7RpGDww6zlUxnHCeX/9FArH8gEFtu5KQI2xIWIrwOiTy
         8qg3fhkoa2kBB7EAXIsyFROBB22eOH7WCcmPIjOHnUHCuJcE+dQSlPnxM67quLxsd4Gu
         GdYQ==
X-Forwarded-Encrypted: i=1; AHgh+RryoxSL2LUDVHek/mHAoZk1HQONgVwPzUyGJxBxS0CB+uiuPE8bTKwqIjYfgjxk1BSQRksY9Z/4KaJJ+jBj@lists.infradead.org
X-Gm-Message-State: AOJu0YzKc8DAEA76Q4GkaJEe7LIl0a8ZBVwd4S2CbWyS3ULJXFjcyo9c
	d9BEDTIhM3HE3DZ6AwK1Zk+2b7KG7nzH2nYn4Ai+DJmQfHO2/v+liyjW
X-Gm-Gg: AfdE7cnv7Cj8C1T6Kl7M5gCBJvAPTyBLXxoXhdc9EHOQtQ4sZ+T3XMOv6j+y6q/KkEt
	Tk/SYkxbdsyeLTC+ljh+HAJFi5TrC805M2CDFkqn8gikkb/1FSzNJAjkNT0DtdU7EVbCFGVtcAB
	kKQ1HKVkw1vOpMeaTS19uO+IrnSXKDt4z+b5S9Az31HE65papPtx29u62f+65eGIDp36K9yffaQ
	2E0Yz8Z5Ug/9zprfoA+KlYHNRKqO3umslhtI034EsgCD8WnEJFR5nzPcpooSS7AgQmqyloYTzfY
	HTBwLVglBlkqaoWwegYnXW33wEXIIfY0ElpoFSCfIQVMV1PkAQNSCnPWiJtf8nkI55MGVXzngqK
	keZ5Iv68apkT6rBemXAH59aIIKLdVc8xUpy+PIS8KW2C4MQ4ltFi3uGQP2dTHuFusKjPPVg4Rlv
	5GFGduiCnWpKqRmm1l9xnU
X-Received: by 2002:a17:90b:4990:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-38dc74c4c2cmr9218450a91.7.1783944671501;
        Mon, 13 Jul 2026 05:11:11 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:10 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 13/19] media: meson: vdec: Fix race conditions in job abort sequence
Date: Mon, 13 Jul 2026 17:37:08 +0530
Message-ID: <20260713120840.17427-14-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051114_806269_68A3A449 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Implement proper cleanup inside vdec_m2m_job_abort to safely stop
the hardware job sequence during a streaming abort or teardown.

Without this, if a job is aborted right after being triggered, the
deferred work item (esparser_queue_work) scheduled by device_run
could continue running concurrently. This leads to unexpected behavior
and potential use-after-free bugs if session structures are cleared.

Fix this by flagging the session to stop via WRITE_ONCE, synchronously
canceling any pending parser work, and safely clearing the active core
session pointer under the core lock protection.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index b3e1d99e8889f..ac86a9c4febff 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -167,6 +167,17 @@ static void vdec_m2m_device_run(void *priv)
 static void vdec_m2m_job_abort(void *priv)
 {
 	struct amvdec_session *sess = priv;
+	struct amvdec_core *core = sess->core;
+
+	WRITE_ONCE(sess->should_stop, 1);
+
+	cancel_work_sync(&sess->esparser_queue_work);
+
+	mutex_lock(&core->lock);
+	if (core->cur_sess == sess)
+		/* Safely clear hardware ownership since we were confirmed as the owner */
+		smp_store_release(&core->cur_sess, NULL);
+	mutex_unlock(&core->lock);
 
 	v4l2_m2m_job_finish(sess->core->m2m_dev, sess->m2m_ctx);
 }
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
