Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F19C282CD
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:14:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D9720882
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KhMpIzs/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cTbvSyZi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D9720882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mV7aPuFJTYUbe/+SO2iaP1en5+IZTl6tDdQAIkGtVxM=; b=KhMpIzs/Fafb9z
	hzbd1D3pD4b+VQfcQU77jfiw4M7Tnm6vGm3UrdK7Ilx821oBMwgpawJGALPWyD7E2lHgt+0ilaVyW
	SuA641ekA1lEDekzQ2us8ARZSmOSgSLyazffowF/fYON/Bf95dXxUerr+iovcaybyXogSRhnX9Ech
	7OqYhffr4yChYkSmigtr3apy8ynA5h6oU44L6URln06wVCT6iQmFoThgYG7ZuEDs0X6HSHOu81s/m
	T4UT8Y+u2j7dRHHm0Fp1UMZdrz/1lwS1EK89PdHGwYS05XA2ogmeRulUZOISkJpAUB6SXLOj4Lhkp
	qe3AiGdbTyECP2/nUyDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goBQ5-0003he-3U; Mon, 28 Jan 2019 18:14:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBPX-0003Ba-43
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 18:13:35 +0000
Received: by mail-wr1-x442.google.com with SMTP id l9so19096596wrt.13
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 10:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fNWFoC3BVYguxhRUMdCWIfb/Rl7MMG8+du2R0BO4wEY=;
 b=cTbvSyZi34BO7xbHL7VjC4d2IpWNxC+mgHDwmQWegRazQajEzWNV54xiBuCNp/moMT
 HROWKjnIbA7JvT2vO0syVqfu//FmOgrFwOLFNMtFi8pr8Tq0FtjLa5c9XCQIPsJH+zFD
 O+ZmTWk8/TBzXmYurL45pGsohZ3RAFrIvQfh9yQjOZgoX64mDLyQTZ+BYrlE5eGcpG1/
 TIjagMrZ8OPw/H8XWS4X7b7MGTEqyDLEEV2H1aGaH1KBOtOY9feCWLsSr1mNjaN1I4zt
 JljKvlmlLdzx2ZiYL9oUi/OIsx4xBYVDpM/Z/GP0Dca+swMhlWhhXODudJBAycQKL4RG
 8ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fNWFoC3BVYguxhRUMdCWIfb/Rl7MMG8+du2R0BO4wEY=;
 b=iWmi/QA4iKp+OhrsZgH+/APgyQ7ID9ogR4Hy0jLtk28fk6HNazmsOQ9a/eB0yYW3Pv
 YHMp3FDbjPTsjSIbktPa/6B0Rs2bFII/BYaTPnpT7sQk3xF4TT5CacXPj74fDH1Ma27L
 QtoFUpUpcGkmrcW7PRklAXf1b6PiXw/lSWd5iV+/a1XMSJIjhD0lOnIx0OgxoVyyEj3j
 vDHcUyUE3jPtiUbS5fMJDy+6bLWwcXdDCzWanuRxSIv2ks/SWTLLnXy6xq3i+GLCkD6k
 On+oymcgMoUxWrmQHbop8GrQ9Pqs+wtT/PZxpZXJnn/V34JwK/BWGIqTXgWxj09UjN08
 mBqQ==
X-Gm-Message-State: AJcUukcd50iteICJZg6IbW/Sbl1BRyZpxmCOH3hn3nFoEiHLvyMceYli
 Q50C7IFYMf6aSxaq/eszGNgsPA==
X-Google-Smtp-Source: ALg8bN7PbaATt/necB5hsHVmNzRxYe2SlsqLJaqmZdEnsDm4GHzSTuTL0Th3+7/lHl3HDWA40aHnMQ==
X-Received: by 2002:adf:8323:: with SMTP id 32mr21979595wrd.176.1548699209700; 
 Mon, 28 Jan 2019 10:13:29 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id y185sm110654wmg.34.2019.01.28.10.13.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 10:13:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/2] reset: meson: add g12a compatible string
Date: Mon, 28 Jan 2019 19:13:15 +0100
Message-Id: <20190128181316.30814-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128181316.30814-1-jbrunet@baylibre.com>
References: <20190128181316.30814-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_101331_475486_33FBE750 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a compatible for the new g12a SoC family.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 5242e0679df7..a8f6549b3af4 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -134,6 +134,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson8b-reset" },
 	 { .compatible = "amlogic,meson-gxbb-reset" },
 	 { .compatible = "amlogic,meson-axg-reset" },
+	 { .compatible = "amlogic,meson-g12a-reset" },
 	 { /* sentinel */ },
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
