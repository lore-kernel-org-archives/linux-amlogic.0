Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CE5C43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6zHztFjZj/TlCXS2LirY4pzZBwkp5T0GXNyrFzQgIY=; b=vNTUiGpz6pVZck
	jW09676ugfLdWL3Xr2R/YtChs7doa6oy/gP78reHqrOrU46XXZdnc4VPxZvIRQQAcZ7XqhBZ6FdF5
	gcF7g8xHGclG1U+yqHrmzMEOHY9ibkeW9w64O360DDgy46157ut8HpObHEkEyWl3cxHPFpvIVfeDR
	Skl5VqzjNA7w7uCnT8KHp4Kag7Ff2DktqUhk/tC7eciMbifurYhhOaSdAopZYP9ajH6zz0J4+YHNt
	5ULWVWLBwalKuiet8+h5w3zEuTGMZGnvakcJOe8I1873c23cQMB1VoQEOXwLun4MvDcwCrQGaGlsi
	SOzIwuBdlaPr4vFHO6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVM-000000099PL-1aoU;
	Mon, 13 Jul 2026 12:11:24 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVK-000000099NJ-3PWA
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:23 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-ca913a601fbso2089039a12.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944682; x=1784549482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nfm5E5YVw8Xk7Gt9ejcJe2nuIHpfZQPsIGFP/AIC7g=;
        b=iZZ2AaI7CV7XMb9/KgpYANe5E44mVn2ftoT5ag5Ctzaq65r7X+gmNi9ey/PENMQm41
         OYua+Hywdz/Uoi6F88EgptRdc0ZSmmWasDgWtebWAxm5q/y8xNdGxfYYG7SRkf1WX2jp
         H1doOwsSDpNqEh821pNL3ie4Qfj9hRd2e1k0w59ItjURYWtsBTo2yXWKC4kQo2fxRFuj
         Z64unMzAnHwIGTzapU4W312/JygVQcTPi/AAY5aHVCTT8Rm6FpeS85gR+V6CdM+LoK9U
         XjxFulA4E5RvJvb2jODMe0I6AkfSsXymx3m0I8bgCWV65QVEdv61u4hI0s32Aos2vffx
         DMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944682; x=1784549482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7nfm5E5YVw8Xk7Gt9ejcJe2nuIHpfZQPsIGFP/AIC7g=;
        b=cKkYqqXSG7Bq00ezp4wW06IgQujaRaWfNICzBdiVCcFXebnTxcUj+H7eCHrNGNFv30
         xsctneWbDb044x5TggJldBu3hScSHOjX+Du69PQ3fqC3Mx/DW3KU7gO6URs4wz9BX8tU
         T0V/Ndvsm3bpVfMaqqc2J4PAKfNLeQU3LyCv4kQhMFwghxT1NQUInUzpCZm3VwGCEC23
         N8YdVqWJiIT+DycZCugSh9eQn0TE47njI5s0zoo9kHYOryIK5z6lHSu+i81tLWA0YhEV
         698mOcY3D8FY4GrfjNR7T8UGGrg+1XCwlWXnVU9C+lwHg+b26wqlJm1jx3KQJRRav6DO
         fSHw==
X-Forwarded-Encrypted: i=1; AHgh+Rpdd1NoXnLGePhwKPkd1qeqAWWhyyIZXZRzASj4m85AZP+OKmJryRoEGsB1pUhWW+Cz7pRu8XZQDb8flwYQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwHgQcfsr3Hoxbqbdqelh4vpw8UT+jQnZcc1Tkj0z8grXY2qpw1
	KqkKmnchB2tZdDE78QkF0udGpFP2zuv0/2hHVOP2eTx9Tbvz726cbV1U
X-Gm-Gg: AfdE7cnREZVQoVNk2Coxp9W+sywVyFK3s8DMEXB+OuVANDbdKCRpOP/f8RPE/ZHVlf4
	7VfJGIpgpOzhKdtDuj9JlYm/a8KPTdhsVv3tID8CaK2hlKGwknPrwPGE6IZ30VFbNy3BCzYMUQ+
	H7/LFePK/yJlQQkbgPjojXwesW+N4hxF5lYjkGjc1SdHf+3q8aMGkrrzTchsXhqOoNn1nkDayBQ
	ZyDwBbFDMyol06rfcWBo9nUOL46dV1a8bAHlCg3A1RMzQgmamTGVXf7y/0msHCPQrEitCBqtQje
	0llXCAlsAKLlCjh1CJs8+mhcBSAszPegjNT7uApbBVXRU1WPpAbS5DptzhHBO3zX+9erSzsATaM
	vvXVFWXVwmS6/gmVOSlzhjuLvDSLHR6GliGmIEbWjo+2puVh8zvncIl6f896nibfL/UfHin4iLa
	UCNVLOXpawBA==
X-Received: by 2002:a05:6300:220a:b0:3bf:aab1:cc8b with SMTP id adf61e73a8af0-3c110b436f6mr8836067637.46.1783944681879;
        Mon, 13 Jul 2026 05:11:21 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:21 -0700 (PDT)
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
Subject: [PATCH v7 14/19] media: meson: vdec: Correct atomic counter placement in dst_buf_done
Date: Mon, 13 Jul 2026 17:37:09 +0530
Message-ID: <20260713120840.17427-15-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051122_847150_6959F1B0 
X-CRM114-Status: GOOD (  12.49  )
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

Fix an end-of-stream (EOS) boundary condition logic flaw in
dst_buf_done() by relocating the atomic decrement helper to execute
after state evaluation.

Previously, decrementing sess->esparser_queued_bufs at the entry point
of the function corrupted the conditional checks for the final video
frame. This premature decrement tricked the driver into flagging the
second-to-last buffer as the final frame (V4L2_BUF_FLAG_LAST) during
teardown sequences, which cut off the true final frame and broke
compliance validation.

Resolve this by moving atomic_dec() to execute immediately after the EOS
conditional tracking block finishes evaluating, right before invoking
v4l2_m2m_buf_done(). This ensures accurate stream termination
signaling.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index f02c21d5a9c18..303236f0647c0 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -314,6 +314,9 @@ static void dst_buf_done(struct amvdec_session *sess,
 	dev_dbg(dev, "Buffer %u done, ts = %llu, flags = %08X\n",
 		vbuf->vb2_buf.index, timestamp, flags);
 	vbuf->field = field;
+
+	atomic_dec(&sess->esparser_queued_bufs);
+
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
 	/* Buffer done probably means the vififo got freed */
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
