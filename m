Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC98BD25023
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jan 2026 20:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yV+YvJVWIzvG5XYzIfJU9iEjNqV6ls6I2wVB1InAQvg=; b=OHVkUHze2XhSUW
	SsjJxQkkRs0gLHpFONvFHh4pT5WX33Qv2oLR01c2TILjKnvo6qisyHQVSzTh45eLBA8VjgDpx5tV2
	v+xfDTyH0Z65UTffSCfRjwrFMtODRfgZ4SRgzlMU9xpDTcgx2xbpUohwgyA8xK6JwfZrFxLuopZR3
	24GaVYR8XxxweMXw5uXnb2Y7YWRfBxNgMQpDHFubutPMB/SwuvR09yEEvHQxQ/SE3ds5fHIvR8ma7
	sase7Vxec7mANkMfTUV33N0xOHGENRiB8QkNf6m1X+UaVgozVUM71Eosh5OiYuyKZNpH20x60npm5
	4s3G3jN2GO/BBq1uRXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCg-00000003efW-23kn;
	Sat, 10 Jan 2026 20:04:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCd-00000003ecH-2qY1
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jan 2026 20:04:52 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-64dfb22c7e4so7022857a12.1
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jan 2026 12:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768075489; x=1768680289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ssjVYpipcbS61pLDGCrSHNTsxktheeQ8WYFF+/B4GU=;
        b=EP8Cui/VusblCZTjgfZrOlGyLbipMM1Gs5DzbQRS/QfU8S8MADDAZsbVgTgyFWXXz+
         mrvgEZ7FqJVdj1mEeI0hEhGYQ6jOM4aJnGecXNGNzT3wICUHpe9G5ZeqGLgis8VJLRQ+
         Gk4Eti4HrecRqQXSwbaLG2xPro+8RLhJ+6ex7fOGRLH7LPugWCCUo+Lv5unuKw9P4iMv
         dqg4bzeo3xqSyCeXErOQueJOO/4aL6VOdcaSySBJyKfT1VwAfy0XCwnsQVgVYUH5z0VB
         ux9rvgjxf1nocaUPOnKAub7B3G5f7ZLU+d0KWhXWs7WLG9I9IFDtpIDwXFCnV/oV4k7/
         EaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768075489; x=1768680289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ssjVYpipcbS61pLDGCrSHNTsxktheeQ8WYFF+/B4GU=;
        b=QCHgSHWY89GKYHKgROm7qk3o4Q+tH+ZI/JxnbdCyJPiEsyLXHoTt1/8F6W1pdhWDwZ
         9Uyl+3g6es1NYMYKK82vXxfI6jaSWsBXF0jsQyyZItYopKk1ORbk5zLwt2H8qGSN1kl7
         jfQa5+xUIBR/Z9ynMf/zu8swAdtpK7LpZSaVMM0I189eVaD3AVgwV+3YfmY/sN0cE54J
         Rdl+gIoTBqYrfa810cjj+UejWB9ZpJOjojOPOc+8SCyCDNLq9FOd48PoHWTx83bq6bTR
         vzmbO1pVDya+Fvh2iuxrTPMUb7k7EoLpnHq2k0TK6rslPidr1muICsQrK0PbshLl8dmU
         ua5A==
X-Gm-Message-State: AOJu0YwVgddwaTbs2Gzu34KSDqVfoDjF5hVHSYSSRcpX/vrGm1XeKzom
	H2/PVJ/2DhJSnpDLu8c1ZEeRJyLOXKX7ZyQy7hfWLlgYav60dyYX/b8ws0DTYA==
X-Gm-Gg: AY/fxX61vFI4HeRRnVjma3YBmaGgQYYE82WbnkI8Nftz1WfobSmgDZwSXKjrMoQj/GE
	LNGR/j1LNxkPq0+xV43bjwK4492gXYkN2G6GFWDVAoBkYZEcHyzlKlv3cNwoseeGxyvYKajHd/Q
	JRZKD6xGt4d7tKpN1NEE3R4D/a1UcMTytkRlSb363RqKvcbKXhEX4dXDXIhLroZT6SQZQGZFF97
	Al94KplrC5HdTxFQNKUj6ccpkehFQOm8eCogbSBVoavB94ITjNd2v1KiBzfb//z3Jme9h8lB4Lu
	I17mzncvm3qsx89pbeLFxR7skpDmLmButtSZPx/KkKbA5rzDacAeMgjJihqrOBio1G7Y41p8tjS
	epiLQVqtg0KyfAGPEJMf5ws9IqjRtLbMFXPsvU1Z5Kz6YQmN/7y2fBPxpTjI3uDWsbEuobU7tkP
	M79mosDQqxHLhI6AMBBEUC//lejDzNVd3JcwIuh5HG7Micxt94yFwxiBhl48Lq97G33BDDEofvO
	NOTtHxsEMYyIzej/Qe0JlaT9NQduS/NVFxwwoMk/1E=
X-Google-Smtp-Source: AGHT+IHgSf4RPCvxj7DEDU0E/KAOwWTEok3li/D8J9Ibm4he0Pm9LnoQAzAl1Hd3E276oW9oZh/Wtg==
X-Received: by 2002:a17:907:744:b0:b3a:8070:e269 with SMTP id a640c23a62f3a-b8444cdaca3mr1447948766b.14.1768075489016;
        Sat, 10 Jan 2026 12:04:49 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-af95-6f00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:af95:6f00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a56c552sm1483591066b.68.2026.01.10.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 12:04:47 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	adrian.larumbe@collabora.com,
	steven.price@arm.com,
	boris.brezillon@collabora.com,
	robh@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/3] drm/panfrost: Add Amlogic Meson S4 integration quirk
Date: Sat, 10 Jan 2026 21:04:25 +0100
Message-ID: <20260110200426.1461575-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
References: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_120451_719324_6F8294B5 
X-CRM114-Status: GOOD (  10.44  )
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

The Mali G31-GPU on Amlogic Meson S4 SoCs requires the same quirk as
previous SoC generations. Wire up that quirk by matching the Meson S4
compatible string with the existing Amlogic SoC data.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7d8c7c337606..431470af0f36 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -1056,6 +1056,8 @@ static const struct of_device_id dt_match[] = {
 	  .data = &amlogic_data, },
 	{ .compatible = "amlogic,meson-g12a-mali",
 	  .data = &amlogic_data, },
+	{ .compatible = "amlogic,meson-s4-mali",
+	  .data = &amlogic_data, },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
 	{ .compatible = "arm,mali-t628", .data = &default_data, },
-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
