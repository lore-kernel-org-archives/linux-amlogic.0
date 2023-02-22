Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A80C61DA4
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Feb 2023 21:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H38TvS3Jye0EWjtkzDGycQ4GXaWtWpekviWj6zpucTE=; b=TStUe66/NmO9QS
	XgxabSY0FL+tn8ICguoOMhc9ZQQicAEseZnw468HOdezj2dDBVsJIGsn0SCuYoLMRo06ANpt4wREH
	kxW4Ic8P5gtj74DDcP3hEaQnFMPqG9N3P2DxaAMZj6ek8S8KkZxMmrQvVTJVJU3EC5DZrfc2qJRrB
	9pChFi3SbMFHGeC8/VGKnZkbowP3pkGFPXNppin7Pk0fp1q8XDezyobuIrmkUL1OAbMTl0mCIriS7
	W4FxkAYlaPMn/l8gPIpF89xx4CKdNt3LXNQLdd3pzf/ZUvdepA2+IYfD6IRMynhTwE56jgfk6Xr4a
	CUyXyGksdltFES9WgTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwIc-00E6mf-Do; Wed, 22 Feb 2023 21:05:14 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwIC-00E6WF-50; Wed, 22 Feb 2023 21:04:49 +0000
Received: by mail-ed1-x529.google.com with SMTP id da10so37011608edb.3;
        Wed, 22 Feb 2023 13:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Nq3dzuM0wiV9YMJ/Hk2mSZsANQ6TIPxxTMSVQHPo70=;
        b=TWPmsWEFjsNN4j2Yh8ZCvcl2OCl492GceDA3d6FDXQee/glFHFSD9sb4nRDXS2TPag
         PCbIfhmEWMb2xI9iBATS+tAzWWPeimyQNj/IKESD4/M4TqXUgcMc/bmuT2KIKAkL75Fb
         WRdewXvOKPHgRuZVVaI/d/fIZ1iHEhLbVCv6hvsbz+n3G5B6dhGqLMsEOrjjkDc319pr
         cVDiwNcZm654jVMpmV8wjv3QrDcJFNg/CMUlifLiPxJdWMMg2fbCoSLNlHaSFDSzbHCR
         7RDWM0Yu+z7Kai3U6jH/a/3POr9XIKw/VnlOStAdN5sBc741+e0tp05iejYWAS03q9Nq
         AcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Nq3dzuM0wiV9YMJ/Hk2mSZsANQ6TIPxxTMSVQHPo70=;
        b=PB2rNe8tLwq2Np64uC4saX9u3x4IBmJ0H+g6QnCXzCM5C44u+Cv03a7En2YEsKo06t
         IW/4XWRNpCr6fXyOkM2k7pdc5hldIVYRrBSFARg1bCe1/SiUOQ4mawlhBICkBi6T8qla
         88raPBnMjjQLtAfh9JtXLj6GqmwWwh9mjaDiWKvIPRKNdzET4RrkaOISrh2sFsk6EjSn
         9iaPDDZPUzohc5TdIE3JozZxSQSR/aMKGBPC0Fzo9ZL2NwX+xAL6kjtWe4LL42TpA/2C
         vzMBNZhNinQST/d/wDrPv6o1fG5qY+eH07nhmrGajUh1GhyohPLSntrZihaZOKxD+sP8
         TdsA==
X-Gm-Message-State: AO0yUKW/AiSsub06ejuThf0IRSQWpSX3UMXSaPR2XzopVb44tyJz7IIv
	ce74RRW2Z+8HA3ZDnmPxRcu7thPL6OKbQA==
X-Google-Smtp-Source: AK7set/Pb9SC42yyGyM/okGUSygtWrCURlJ590lWGkYU/8O1YPoP2Jil0ZxAhQvIGGGCwK8dXhMGOQ==
X-Received: by 2002:a05:6402:4007:b0:4ae:eab6:a07b with SMTP id d7-20020a056402400700b004aeeab6a07bmr11290888eda.16.1677099881755;
        Wed, 22 Feb 2023 13:04:41 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-76c9-eb00-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:76c9:eb00::e63])
        by smtp.googlemail.com with ESMTPSA id m17-20020a50c191000000b004af6a840f21sm209208edf.15.2023.02.22.13.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 13:04:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 RFC 2/3] tty: serial: meson: Add a new compatible string for the G12A SoC
Date: Wed, 22 Feb 2023 22:04:24 +0100
Message-Id: <20230222210425.626474-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222210425.626474-1-martin.blumenstingl@googlemail.com>
References: <20230222210425.626474-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_130448_240360_EE2787F8 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: neil.armstrong@linaro.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson G12A (and later) SoCs also have the "divide XTAL by 2" bit
as the S4 UART controllers. Add a new compatible string for these SoCs
and enable the has_xtal_div2 flag for them.

Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/tty/serial/meson_uart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 74110017988a..2501db5a7aaf 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -779,7 +779,7 @@ static int meson_uart_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct meson_uart_data s4_uart_data = {
+static struct meson_uart_data meson_g12a_uart_data = {
 	.has_xtal_div2 = true,
 };
 
@@ -788,9 +788,13 @@ static const struct of_device_id meson_uart_dt_match[] = {
 	{ .compatible = "amlogic,meson8-uart" },
 	{ .compatible = "amlogic,meson8b-uart" },
 	{ .compatible = "amlogic,meson-gx-uart" },
+	{
+		.compatible = "amlogic,meson-g12a-uart",
+		.data = (void *)&meson_g12a_uart_data,
+	},
 	{
 		.compatible = "amlogic,meson-s4-uart",
-		.data = (void *)&s4_uart_data,
+		.data = (void *)&meson_g12a_uart_data,
 	},
 	{ /* sentinel */ },
 };
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
