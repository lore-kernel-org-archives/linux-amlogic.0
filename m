Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3DEC7618B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 18:40:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DFCA206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 18:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bma3uvk5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ljx2SdXO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DFCA206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RotS2ERQiKa6nA9/Be6hklPlpSXiB2AZ+f4lo2Z2Pe0=; b=bma3uvk5StjRTE
	vw52FhQzRu89HAmjqkvypohphJfYCHUJA+Fst7nIg3A7UO5lZfyat17DkJURTmsCL/AjpXp+FswkC
	lgVbAbLqDAl/ChXjeTjcKLoxy8qI3N6Qbdat/ADKN8hEtSHb6+3UYHes4UNiRU8O9fNvK56ZV6Def
	Hlm/KTiEuDysS3V5Ol3TO/FbIeETnGz6Gl9y46DDKmFr5nGSCnpAtjvcBSqKk5uMtO6EJm8w++Yd4
	RePv3fb9iDQV/ScBhAknR5kDzIB3biTfaZA2sjqTlSdCMoJ2TrpEFGOvbi5mTlWrV96w5NTlSFMcT
	GFLvCBsdElB/5k7hZC2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsAZo-0003xz-Cg; Mon, 29 Jul 2019 18:40:52 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsAZQ-0003gi-Qq
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 18:40:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id s3so54755973wms.2
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 11:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NL/5zTQnhohIGaIYxAmHMipqwG7WMic3sqIDS1WvWAs=;
 b=Ljx2SdXOenWk9HylJB0m7+GqCQWJ8bOa7rynX0A+nTLES1zIBX6aYXSnDNk6NU88HP
 itdZ60+0KuP8W8UE4ccMSxtZAaJQYznz+WZHwkdvmxOS6FYBoK7tVBBxlqHPadxw7Mfe
 sGs56zxmzg7avXy+SUU6EMm+nymDm5iY3o91KrfMIhPpG/0GTGbuACRflDKgjB20U+V4
 +QRsX/ob4CoDHyWAs/FJlWN/2JkLP9HI+6H4LWOlroC6dCaHuNlqTTiUlcTHcVNJ/vtn
 w947f/pBV8rHgLFWcRO/lY9rniZisw6PS1b6RKp3gwuSu3Jpx6b/8AWRuAphDf6ZGXN5
 7kJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NL/5zTQnhohIGaIYxAmHMipqwG7WMic3sqIDS1WvWAs=;
 b=awG+GZuuGdn/9a+mrBB1Oe2jJly4H5mJljBfIoHq+z+pwi613J7Tl0MAQIJ512ujhv
 ZjJcc1ctBoa599Rn9Ix3kdTHIlGWtPpguGY7lZxy8a6t0mY3kMBcqQaWVcfrjuxi9wYB
 xY9qo39vtRQ5Wk/UE6qM8gxeZ587W4GUjY5ul2sa66TZj9sWNZj7tLvABHFYNVR53ruT
 3PTs69l4MOuqbgdQh89iM6ulzy856oWVtm+fj0Bagu5sFZ/eMTla4yZ90U31RTH/GuOT
 tZ3A5IiS5wAjzGnykN3uqqQT/6U7Ms2EPaRpDqptULBKp7CLrN4eglt3AWksPAJTw1/z
 mDAA==
X-Gm-Message-State: APjAAAV0maVlx2yaLs9/vzW4pIjMlM9LMj+gr3iDhpejUKpG/C49qjuW
 Cgl9qAU/qFDgKlfpLQaUw4pH7g==
X-Google-Smtp-Source: APXvYqzO8CDDHffNjKGGHAThG+qAQeZSgvJNfczqVERJbnhJ/UQrCuabRFPykRcFcXO0leXZ4ffb5g==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr25140377wmc.33.1564425627289; 
 Mon, 29 Jul 2019 11:40:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:f78c:d00:1570:f96d:dab8:76ae])
 by smtp.gmail.com with ESMTPSA id g8sm60735790wmf.17.2019.07.29.11.40.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 11:40:26 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
To: srinivas.kandagatla@linaro.org, khilman@baylibre.com,
 narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de,
 jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 2/5] firmware: meson_sm: Mark chip struct as static const
Date: Mon, 29 Jul 2019 19:39:38 +0100
Message-Id: <20190729183941.18164-3-ccaione@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729183941.18164-1-ccaione@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_114028_900264_F8A2B02D 
X-CRM114-Status: UNSURE (   9.97  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

No need to be a global struct.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/firmware/meson/meson_sm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 8d908a8e0d20..772ca6726e7b 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -35,7 +35,7 @@ struct meson_sm_chip {
 	struct meson_sm_cmd cmd[];
 };
 
-struct meson_sm_chip gxbb_chip = {
+static const struct meson_sm_chip gxbb_chip = {
 	.shmem_size		= SZ_4K,
 	.cmd_shmem_in_base	= 0x82000020,
 	.cmd_shmem_out_base	= 0x82000021,
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
