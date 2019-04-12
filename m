Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF4EC10F14
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 09:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E34942084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 09:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AD4fQD3N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HEHJboxb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E34942084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QPwv/WUqzYOSA9wKVv+EmZNa1lnK1QlCaNRW/RMTD0=; b=AD4fQD3N4A327I
	47AMfun5TxKUgeNI6LiVtTkhkDsnD3/MLHkZBsQNI2RB4JnU2Xl3Am2LQs8TcSsYrSXzqKnCqSlOy
	EtWnXNJC28P45FmOOs3d//MciyZM3toYyWS54oKptbxVPBiqCddMmTBNimqucFivS+SRi3cBIF/fp
	QRnrzA/QKMwwu4vinDUxxOcqn17An7EO0tRCB/42RaNYVL42qWxmRDVK4f5QekKyrdIqPtOh3aTTF
	UG5Izk20mlYw4b53uEq+naE73aaox9fizccxak8laI28YXrjTMdoQnN6lRiaMfaIkmNvYn2CHSag5
	RwYkqCQI/h1gRzW6rr6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEsPm-0003fi-Ay; Fri, 12 Apr 2019 09:24:06 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEsPP-0003Af-0p
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 09:23:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id v14so10117424wmf.2
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 02:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VrVpee+f1QzUj1w55U43u2u06qeWlLDZnjDCHCt7aSQ=;
 b=HEHJboxbmey2sK5gsDZ6Bv1s8NO6jixV7xN7iG0VB/XiUbfIsSZ58svig80dxvcOis
 ay5iJHGFSetEs7SBOkVGPW2Ntzx+KVU4Wdg4t35TeYTixLWBQvGfy+oIEaEiWF5edL1U
 gx8ACBpZ7eNR5bXkzqnCZA1gI/E/TQqyPKx/uiw5XqpRvmyo+NdSnROPH1LXlwCvh6Th
 9Fiq0vsVjVXjh7L9NG+kQH/PsWkOXsPIE12R+GdW9vFXHJmxd7w3Z2BR0m/PYDxcj8zi
 GqG9O1IxbggoALYd7RQyaBuJLr5w6TSvlJYta1OTQjzlURJrgIxIR4vanLUfo7CbeoUo
 z0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VrVpee+f1QzUj1w55U43u2u06qeWlLDZnjDCHCt7aSQ=;
 b=KnI1mfEIMfiAhTFPRQg32u1uEvZXi39T/WeU+bhK0CYq8Bb7nPjy58qcghYxdPOD7Y
 UFWWPPZOTcxdn6tRPbi+JVBx5ojTJIYP2bfjX9bV/M0OFKkRhCEsMcyH0bc0n9Uw30g8
 SJOA0VI33XpB/nuLtEtFlABFhr8WfrOcCp4MBxLX4TF3G6udpRYUpcA3RqvXNqHNA9DS
 35D7lq1uY6z4L6fQcCBDTlsYhn+vwWLX45fWXzWSRDKQAujbvzsJhlFZkv/6gNFQgKuw
 fWu7XuSTgnRBCvXpuDqPhZtPoPFOV3AVuV5oNu+1w8LLQf8USrq9xG7AoWQ6Ipl5Jk32
 VbQw==
X-Gm-Message-State: APjAAAXzxKeC0hE6V4VI98loE37PJt5sbvrNtKHAYeGROJuzLZvCiB+L
 O6YfSb3B/MsMXGEx5LreqHyxgA==
X-Google-Smtp-Source: APXvYqzT+1A4+cJ5R6rz0CC94Ba+2nsxQWdqlVcqQeiJQiGhA9HZc4R+uEyff8wJ2WNp95n5AAqVxw==
X-Received: by 2002:a1c:e1c5:: with SMTP id y188mr10395823wmg.39.1555061021412; 
 Fri, 12 Apr 2019 02:23:41 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s21sm6630224wmh.22.2019.04.12.02.23.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 12 Apr 2019 02:23:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com
Subject: [PATCH 2/3] pwm: meson: Add clock source configuration for Meson G12A
Date: Fri, 12 Apr 2019 11:23:36 +0200
Message-Id: <20190412092337.6941-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190412092337.6941-1-narmstrong@baylibre.com>
References: <20190412092337.6941-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_022343_057787_E737E191 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

For PWM controller in the Meson G12A SoC, the EE domain and AO domain
have different clock sources. This patch tries to describe them in the
DT compatible data.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 2b03938039b6..46287cc8a0eb 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -434,6 +434,15 @@ static const struct meson_pwm_data pwm_axg_ao_data = {
 	.num_parents = ARRAY_SIZE(pwm_axg_ao_parent_names),
 };
 
+static const char * const pwm_g12a_ee_parent_names[] = {
+	"xtal", "hdmi_pll", "fclk_div4", "fclk_div3"
+};
+
+static const struct meson_pwm_data pwm_g12a_ee_data = {
+	.parent_names = pwm_g12a_ee_parent_names,
+	.num_parents = ARRAY_SIZE(pwm_g12a_ee_parent_names),
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8b-pwm",
@@ -455,6 +464,14 @@ static const struct of_device_id meson_pwm_matches[] = {
 		.compatible = "amlogic,meson-axg-ao-pwm",
 		.data = &pwm_axg_ao_data
 	},
+	{
+		.compatible = "amlogic,meson-g12a-ee-pwm",
+		.data = &pwm_g12a_ee_data
+	},
+	{
+		.compatible = "amlogic,meson-g12a-ao-pwm",
+		.data = &pwm_axg_ao_data
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_pwm_matches);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
