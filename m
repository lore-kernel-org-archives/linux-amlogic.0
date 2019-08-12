Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C5CC32750
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D182E208C2
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xd2O1eNe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DvTuwoTR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D182E208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLQeUN6utWD7wAJJq80ifVPx9iGMv8lNAF3rtMdR7ck=; b=Xd2O1eNeX5OKMG
	TbjYSmaFcO6v2xvdRzJ4ig70px5nPVQz/l7kVNQjx1mG/gx5osiFYyy45PEirkx8yjyfr5Z/V1Fue
	u4vb4y5mxd5dF5hvDIL3RHvFrMUNcplFHpW5Ugo+MwR/lW8xkJgQkk+Q5SW+YMZ/WY4uvZ2xKhDdZ
	qr2FwWMVoNq+e8qQqtSK9EJAZlk8CDD8l/0YT2UZ50kX7rpCOLzgVi0/ntGz9eUFXhQxW82v3HtMJ
	uJ+7T/XD9vHZb0mmnXhlJBrxRSaelWc46juWcIp2r34uYV4VasuVHYDeTZEScOPk0UPrOd26skwvO
	B1cMXwKmAadEOd2mG0VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx96y-0006gm-P3; Mon, 12 Aug 2019 12:07:40 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx96r-0006b8-Tb
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:07:35 +0000
Received: by mail-wr1-x442.google.com with SMTP id r3so10601831wrt.3
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZGlThzviYa74KjZe20Ku3Xepd8/yx78CuAyvtGlIM58=;
 b=DvTuwoTROuHbVQDxdqWmO0f39ZU0wzX4eGo8P1Qq0wZnKZ7jRQCMZZ/Q0RrCDo8hln
 aqatg2peAcIo1JBQXJUjXd/9raZ7v398jHI1ERa6NAPmzKVUIPIQ+98vi+EEYT0/o1pJ
 Anjes/w6rsqescn13KeKvhzXqbUsd+b9N+rxhNa4xNWcB7tM5rvItjoAXS2BP5m4d+do
 dXoTx1Sz7+XBQCK7TjC1nlEay/35okDkeq7KbV8j4nA9jHROcKJ+JTXqD4qqhFRCf9H1
 cZLxSK3snuiK1FsPN9SijQgW7Ybuwe6e63LvcYiXt0gtnZEUbMV53tL5Cazvny95LWQ6
 cqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGlThzviYa74KjZe20Ku3Xepd8/yx78CuAyvtGlIM58=;
 b=tBypeFcZEik0CoKb72LKRXlY+3iyGHCaywSMm0603pZ5RKCybsCBKlNqEx2OPpPGHN
 G/7tTSKkDjRR0sQM0PpcO0ieoVd1W8v4copuFWMe1OO3JXJVNSkkUwETxCTLqW6mmYRs
 6JA3aFL3YU0MK8JQsxafPsUDh2v9MWPZUZ1dXn0YEfERRT1jaibPR1CCD6q932rAC8R/
 70NZRHAOIEK/IIGrgTMQUYQ1qA1jgHoETVXwHE8oYgHp1uvNnlVWwWMNUbmElIOkb4AU
 SNtbbk6kvW4D94LBf74A43EgP8VtUuanTtBOzhJJHjjp24GamFiGF14/tJOuPYdHI2vz
 cf9Q==
X-Gm-Message-State: APjAAAVmM9Q950i8uvpSgxiuiXdCWmTiMsvOs9n0OWUwCBOTW8NEshMh
 p2OCqNIP25UPv8jtOOlxEOKncA==
X-Google-Smtp-Source: APXvYqwyPz46p57eTysQVwY46wCsT+0OYu9uGaKrclq3p6YfT4lDPfbi5P4UsmaTt2jiysECa6xwjA==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr38067769wrn.311.1565611652662; 
 Mon, 12 Aug 2019 05:07:32 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j9sm1883415wrx.66.2019.08.12.05.07.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:07:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 3/8] drm/bridge: dw-hdmi: set channel count in the
 infoframes
Date: Mon, 12 Aug 2019 14:07:21 +0200
Message-Id: <20190812120726.1528-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812120726.1528-1-jbrunet@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_050733_949194_132185A2 
X-CRM114-Status: UNSURE (   7.39  )
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Set the number of channel in the infoframes

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index be6d6819bef4..bed4bb017afd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -663,6 +663,10 @@ void dw_hdmi_set_channel_count(struct dw_hdmi *hdmi, unsigned int cnt)
 	hdmi_modb(hdmi, layout, HDMI_FC_AUDSCONF_AUD_PACKET_LAYOUT_MASK,
 		  HDMI_FC_AUDSCONF);
 
+	/* Set the audio infoframes channel count */
+	hdmi_modb(hdmi, (cnt - 1) << HDMI_FC_AUDICONF0_CC_OFFSET,
+		  HDMI_FC_AUDICONF0_CC_MASK, HDMI_FC_AUDICONF0);
+
 	mutex_unlock(&hdmi->audio_mutex);
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_set_channel_count);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
