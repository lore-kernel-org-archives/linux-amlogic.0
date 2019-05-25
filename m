Return-Path: <SRS0=XJ9a=TZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75D7C07542
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 18:48:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D6D20862
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 18:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zwoc/qQd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vLwneUV9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OyX8MuNv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D6D20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StQpvhFqpuQRQDpZfc+GGS/yDmdTJNB9CnQj/awTpnc=; b=Zwoc/qQdr53BOw
	ByriWNhkY4DAeJmgRBvqIsVXJ5NRt6RkduCTeOzXqBFi0rLF8GzrCRZLS88wbTjcdfqa8PruAMv4U
	md4x/JkV+hlCaZCMZdqF70AkqBhCWFh1EkbMRuVJHwntKwiMgtbeObXVWKhZoKVt1KzwgO80Or4eK
	OcepJGB3QBKkVas8snr/O0FN9jVxfyw/oP2rFZLvA54d/BvtFB7m/xGwv64hIgX446l8uwWNNDSO/
	iJ5U78zqgJhnSC08pGHCup/dZSkSBgLZUgRtP1opSt8bTiKloRU20KJvLGIqlehggy6eEUKkwha87
	Ni3tGzuxMOBKVvGOa7Tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUbir-0003yR-Vj; Sat, 25 May 2019 18:48:49 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUbir-0003sf-1m; Sat, 25 May 2019 18:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3846hpA0VZMszmYc1Od49f4w97KJgiyEWxP34Iw+ZOI=; b=vLwneUV9M945KNL/VIgvrBXVic
 mAas2ML2KK/cyvkneb+JyFd0LEoiQ1cYIjfxWUmEEwaXruGz9y2u1hzP+JfXxVsk1ifX84XD1F1yj
 3qYVmw6VZ7WUGQnrRhl+TjZG+m21JJ1hnQrjIKBuHEBuM1l27lqb7MP2uS+JlXxLgqGQXu6DXfABp
 WsTyfs3JJhV1ZCK/GDj5MxgibY0C8Yhsu6ceOEPIVSo08FsyOwgTSXKLTGicTbqkWgFLkhaevmkUU
 M02MR7sqDNl1ORL7l00Ga8P+Z5Su4I7HIeDiDCvWP0L+kmiEOwClEfN+UEgPQvCutVT6MCYeb/mOW
 CIn8qnoA==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUb93-0006e5-LR; Sat, 25 May 2019 18:11:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id w13so4590548wru.11;
 Sat, 25 May 2019 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3846hpA0VZMszmYc1Od49f4w97KJgiyEWxP34Iw+ZOI=;
 b=OyX8MuNvfMozqpjcWk85AijY5aGyCBnJ+ElHglWl19+arEUmY2zSi/hOQI73ILV5/c
 hM/vKqcAfRjelxp/tfzddetGO8gSlXmfEgrYICHsyxLFBtLDNwCy6jyTtLF4maK8Y2Ox
 637QHArHJeamZp7+cQheJX5gnLcrUnK694X5vJPQzKHqkD3tKHUGkyqtCPWAyoIe0/m3
 PyVMzInd+JWvTSQa9Plw/HRaAwwPH214WBhQnkgXPn8VQBZuYdtXgIYqxmsI8XaeobH5
 EVGFcPq4Z6PybieiNqHuEmGfkGXi/8gSd/aQuyTzJ14SQWy8d5xauxyDA4+hUOZeO3i9
 qUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3846hpA0VZMszmYc1Od49f4w97KJgiyEWxP34Iw+ZOI=;
 b=Rmtzu9bww502rz6Ry3CBvzaWy2ynSArmr7CYMzRGOA0sc+4NhI0Fk5jgyOw/+y5sXh
 Y9F3/ZTEly59zQjj6kStNTKqNx18fO8IrBSBCUmn6hxqXmO8NGVMl0gmcYrONF/dAmqx
 HPBiIuWDjMXlgl0FOIF33evxHrILuZ9I5dYgKkYFZahdkd7D0BujnN76+HgZVY4tXgOm
 sVbSOMGCmR6X6e4il8zabD7NtFXXG8opqoCPOcdsI3kL0odWLXhsYG9xU7/XQqJsIefF
 CiqANMPs5U7h4T5iXtiW8/Pgg/VHhOR0ZFlF30DGo07g6LHUsCNQYCj+X5S/LriPY6dU
 EDUg==
X-Gm-Message-State: APjAAAWxE9y53kyImwh5eF7LtnGBD3E2BhqkFmaqNUNaxshEWVPqkD8F
 Qduf6Oy9K7+ie+Qpuz5hH/U9tdoD
X-Google-Smtp-Source: APXvYqxiEfQUfycp8WtTaBUuBjs1RcNwjRJBotfEUd51P4MlDVWY5N1voIp3VdWZ9thnCsPEH/s33g==
X-Received: by 2002:a5d:6189:: with SMTP id j9mr3534497wru.151.1558807905134; 
 Sat, 25 May 2019 11:11:45 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA4007CB8841254CD64FD.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:7cb8:8412:54cd:64fd])
 by smtp.googlemail.com with ESMTPSA id o8sm12794540wra.4.2019.05.25.11.11.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 11:11:44 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
Subject: [PATCH 01/14] pwm: meson: unify the parameter list of
 meson_pwm_{enable, disable}
Date: Sat, 25 May 2019 20:11:20 +0200
Message-Id: <20190525181133.4875-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_141149_705072_7A0884C5 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a preparation for a future cleanup. Pass struct pwm_device
instead of passing the individual values required by each function as
these can be obtained for each struct pwm_device instance.

As a nice side-effect the driver now uses "switch (pwm->hwpwm)"
everywhere. Before some functions used "switch (id)" while others used
"switch (pwm->hwpwm)".

No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pwm/pwm-meson.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 5fef7e925282..3fbbc4128ce8 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -183,15 +183,14 @@ static int meson_pwm_calc(struct meson_pwm *meson,
 	return 0;
 }
 
-static void meson_pwm_enable(struct meson_pwm *meson,
-			     struct meson_pwm_channel *channel,
-			     unsigned int id)
+static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
 {
+	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
 	u32 value, clk_shift, clk_enable, enable;
 	unsigned int offset;
 	unsigned long flags;
 
-	switch (id) {
+	switch (pwm->hwpwm) {
 	case 0:
 		clk_shift = MISC_A_CLK_DIV_SHIFT;
 		clk_enable = MISC_A_CLK_EN;
@@ -228,12 +227,12 @@ static void meson_pwm_enable(struct meson_pwm *meson,
 	spin_unlock_irqrestore(&meson->lock, flags);
 }
 
-static void meson_pwm_disable(struct meson_pwm *meson, unsigned int id)
+static void meson_pwm_disable(struct meson_pwm *meson, struct pwm_device *pwm)
 {
 	u32 value, enable;
 	unsigned long flags;
 
-	switch (id) {
+	switch (pwm->hwpwm) {
 	case 0:
 		enable = MISC_A_EN;
 		break;
@@ -266,7 +265,7 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -EINVAL;
 
 	if (!state->enabled) {
-		meson_pwm_disable(meson, pwm->hwpwm);
+		meson_pwm_disable(meson, pwm);
 		channel->state.enabled = false;
 
 		return 0;
@@ -293,7 +292,7 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	if (state->enabled && !channel->state.enabled) {
-		meson_pwm_enable(meson, channel, pwm->hwpwm);
+		meson_pwm_enable(meson, pwm);
 		channel->state.enabled = true;
 	}
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
