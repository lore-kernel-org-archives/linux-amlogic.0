Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D6AC468BD
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:07:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A43092146E
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:07:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B8yE9qJT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="WF5dn0oa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A43092146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qUkqTtDPDfZXgAMYPN8L7DT0MH0y40V755ou9hdTdw=; b=B8yE9qJTb4xHFf
	Uyp67HLir98vdGkTAwQ/OcqKI6deAjGitIispYdQRSMUSYiVcKwZprgGr40TPr97vbeoPX8wWc1fu
	Oid3hjgkZRI4R2qiWq0S6tyWn9Z0srqa9LtpDIDY7fo4aAj0pq+jD43vzTrIBM4/3iPwjmqOmnnSc
	IvZo1g9HalNPi1w3sXXsXxi3U/wnOZOGlB8QV/kcv908M9s2roPIQgpNpGF9P0z5myP2qrtOsNGGH
	igFxlKsx+L3WUXruBPioKn5/3hGcfCncHIC8w9tOpJvBqkfG8BaQZnU+4DSW79QjUlENwJW5D8iMs
	DMhWxtvbSt4eWpF+AV7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZfkV-0001Sk-Cu; Sat, 08 Jun 2019 18:07:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjh-0000kQ-F8; Sat, 08 Jun 2019 18:06:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id f9so5193931wre.12;
 Sat, 08 Jun 2019 11:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j4V8vgCJVg/njbmSFVRp0iLM1h1qXkuf92IBeudet/c=;
 b=WF5dn0oasdN+mFWoBOpnUgH/KnarBw3oCbrB3A0idRFqoMs7KQ+opX0vq8msbM7wfy
 SHDsJf2bKShpd021tazmsHMlLvhjsRoylhfo2ourzUpM4MIzrObBvgVSXrDYspTW+HsU
 D7xPWdwBWsgaVhEmud3PS3ChBz2H2g34vm2hoc1DKnVO5qF5iI8GbMHYSH8ul0NkF+dd
 O8kZidm6zeLYKpoz3Xa8Hfyn51G5NfEp2OVGPUrhU5Szyf9Hs6XrCP6iENHYx5OipotD
 HQiscxjatLSMCjeeUFqu04wCnplCwjXI1sVYojj1ZjID7Ag0yt7a60XWO9zWmTcUTp1l
 vxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4V8vgCJVg/njbmSFVRp0iLM1h1qXkuf92IBeudet/c=;
 b=Q2H/r3cv6f8WDu59srWQTO2fPJYcFQOdMV/XoblROcDbrwkYWhrBTI0uI8rbBrVT0L
 gLcZ+akumvd8SkfmrftJlM9lUMTYyfB4L5x30EiaKrkfDZ/+8rdRauj/6TW2EH2stRxk
 E6JwQBeq7EPp/1LlhQej/JchgzD5VUDjX0Qf5+T0g9rQrBR8rbv82JEIjT7kx62LTLug
 k48BUOgpMjUhsaOehrpGqJOoy6ZyGsK0Kr2+o8aUjrp4xkga0nMySQ8DEl7GSFzqxVUj
 npnj5nUWBHkpwHhv3358Nd0sTR5/iZZlWPKLSOJ22Ak/KHTzkkCVEcyWhvBxRhbJcIJO
 209g==
X-Gm-Message-State: APjAAAU/FqDQ3yTrOpIZqlT4HCONVznDLoKOmmq01kb7CrI8GLjWsjyr
 RulLv6XBWqy9PxV9/F5J3AEj7ss/
X-Google-Smtp-Source: APXvYqxpJU5Y5i3iuyLyZt4VfVAQkfSDbpbie+roqNN1I3umOMeAwrV3a0DVRSN0jgq7heZqmsG6Qw==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr36393638wrm.174.1560017195983; 
 Sat, 08 Jun 2019 11:06:35 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:35 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 02/14] pwm: meson: use devm_clk_get_optional() to get the
 input clock
Date: Sat,  8 Jun 2019 20:06:14 +0200
Message-Id: <20190608180626.30589-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110637_507159_943DBF4D 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Simplify the code which fetches the input clock for a PWM channel by
using devm_clk_get_optional().
This comes with a small functional change: previously all errors except
EPROBE_DEFER were ignored. Now all other errors are also treated as
errors. If no input clock is present devm_clk_get_optional() will return
NULL instead of an error which matches the behavior of the old code.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 3fbbc4128ce8..35b38c7201c3 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -474,14 +474,9 @@ static int meson_pwm_init_channels(struct meson_pwm *meson,
 
 		snprintf(name, sizeof(name), "clkin%u", i);
 
-		channel->clk_parent = devm_clk_get(dev, name);
-		if (IS_ERR(channel->clk_parent)) {
-			err = PTR_ERR(channel->clk_parent);
-			if (err == -EPROBE_DEFER)
-				return err;
-
-			channel->clk_parent = NULL;
-		}
+		channel->clk_parent = devm_clk_get_optional(dev, name);
+		if (IS_ERR(channel->clk_parent))
+			return PTR_ERR(channel->clk_parent);
 	}
 
 	return 0;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
