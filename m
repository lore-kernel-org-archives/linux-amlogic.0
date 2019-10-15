Return-Path: <SRS0=EyFj=YI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A84AECE58F
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 22:35:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C4D92064A
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2019 22:35:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YdAwXr04";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XE5sn3iX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C4D92064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ZbgTefpHQN20JfbCk8Pp8rziW7XIcnce9XAc3dliZM=; b=YdAwXr04aHcrmH
	cMNh6CdAw4b7A1MBNfQonziHVNIiZ+a12+6/9uqP2JWpML2aDo6At2gNEaZfuqF2aD7ieLP49wuGr
	Ui/E6NvUB81/sb1TJ3Tz0n80IP9S7uBQsi8c3zs4iW9V90U8oWsiLiuwymiysQtXt6Jfh5I+oQaVz
	vYLEtudOdJihuvVt75FXwD/KHYbEN1NBjweftbget6e1zasfSHVhOdXRwVUkPO0yHLBOTsjoRU665
	NtRR0WlaczZ3m7Hy7EL9BTdxUmnF9oEPrXdZKXTiUUhoAcRrR/nQJYp6RXDl/SiZgTluzdefyBwG9
	bsoceH7skLrVrpjhKBng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKVP3-00068Y-5m; Tue, 15 Oct 2019 22:34:53 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKVP0-00067e-9N
 for linux-amlogic@lists.infradead.org; Tue, 15 Oct 2019 22:34:51 +0000
Received: by mail-wm1-x344.google.com with SMTP id 3so649129wmi.3
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Oct 2019 15:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BR/+JcLXGlF7qNlnYNXPVWo3Nql+mobYo3ybFiUKVk4=;
 b=XE5sn3iXKdNmwXYBgSR/Fm7Fn+i5kb49u8oZLnlZNLAqvDO/yQY3vXi0OryQZUyTyz
 1Rqv3gw8NiClH2JJsSE6iIGkl/rPMP9B5ndr7PlbXe8b4bwU8b1Lw9LLhUSqPuL1ATdP
 m0iWdn8fkmAC9HeT8IZWVRJ49WmpPdU44Rb5zGopErJYhidVQlOaOctQ+Fgp9D+kDgHj
 h0zXwqMNPIbo0tzROn/kplccKVmXownn0VSmLlqB3zlxfB/txeQ0L+MOgjN2C6khacyw
 YVtmSb86Uh/LpT6tqbeIkHhVzDHH1hjbX5uTnFE9/0A6QibobxjJqtQd9LSGnkSk954Y
 pRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BR/+JcLXGlF7qNlnYNXPVWo3Nql+mobYo3ybFiUKVk4=;
 b=ZpeHWxx55UMRUvvjMkJmyRXAz2bst7Bi4Zh7XbeuRl+2DtaK4Nh0wZV4zykka5rKOv
 L3Bojjxwfxfoz5UOVcp2WAYysMMtBkHij6gsdM4/F/ZzuuncnAypuylU4j+yeaT9bU1Y
 7pn/few4NtrGznO1n7lJM8UkqPngllAUzmS5EG1RKf066whcLOno3Zj+pHZCzQe11WU5
 qNZjT9oDOKpLDQR8XpJen5W1ELIdO7CIG2zjTvphCa7jZL9/M0fhgz/anoE/X43JZb4+
 s/XTZKFR+kaiQFfOVf0yFH57cEUK0NSIkGeSDWV4rzG9cFMZxWDoesFPaNiQqD3oSqm8
 uiBw==
X-Gm-Message-State: APjAAAVBP5D9xtJiBuYkAPgY7VtEOyhHB+J1ruHJyZQnpFbgN3yRaf3/
 YVLYsLWun/ER+FwwNLdO86YK0mj2eu8tkmY=
X-Google-Smtp-Source: APXvYqzqUGoPSLX+7JYm9yA0K6F9C1MPGaKFQPDRoDB+p/yP/3sBWaNiiSzVRo6x6Tx4Npz6Ljp4fQ==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr543117wmc.33.1571178887899;
 Tue, 15 Oct 2019 15:34:47 -0700 (PDT)
Received: from ninjahub.lan (host-2-102-13-201.as13285.net. [2.102.13.201])
 by smtp.googlemail.com with ESMTPSA id m18sm35667084wrg.97.2019.10.15.15.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 15:34:47 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: meson: add space to fix check warning
Date: Tue, 15 Oct 2019 23:34:33 +0100
Message-Id: <20191015223433.18784-1-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_153450_336502_785870D4 
X-CRM114-Status: UNSURE (   9.10  )
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
Cc: mjourdan@baylibre.com, devel@driverdev.osuosl.org,
 Jules Irenge <jbi.octave@gmail.com>, gregkh@linuxfoundation.org,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix "alignment should mactch open parenthesis" check.
Issue detected by checkpatch tool

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 48869cc3d973..21e93a13356c 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -81,7 +81,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
 	}
 
 	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
-					(u32[]){ 8, 0 });
+				  (u32[]){ 8, 0 });
 	if (ret)
 		goto free_workspace;
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
