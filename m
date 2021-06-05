Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BD7C47082
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:25:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B3B61246
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73B3B61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=grxut53AHn17ZaM55uWFr8kpCDZr/6X6AaDdRFEcZnk=; b=grS3S0B5i+OR9j
	HijHhgIuMNjs03VdJnR0Nie2jmTYAD9De/4BDpcpwcGi8IhBBPz/y8qGRObzrgOR1dZhYx49gD9dm
	ItXrmvtEqIRkoWms5kPGFN4hmhqZqnMZTKYrW3xxz5moYxnKn3i6xmgp8EjOWyW0GzR48+9/CjKhM
	9yWx+iNexdC0U3/oHLPPTB2uWEVm1pwjFRzl5KJyNUIIrTghA+iy6319oOWJjleZi+th9yJQhhnQm
	QnDoYKE6jcI6zjvmb+CI0KIdoz5M5oOO/F99i5IT8YzxyrMI1cDQCI03U+tx1jNg14IkU0MIQqIYQ
	Bqh253rVB4RaYpixhTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpPkT-00G76U-Vh; Sat, 05 Jun 2021 06:25:33 +0000
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpPjv-00G6te-6Y; Sat, 05 Jun 2021 06:25:00 +0000
Received: by mail-pg1-f181.google.com with SMTP id v14so9559037pgi.6;
 Fri, 04 Jun 2021 23:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NaibPNLx+MUOnhnXMB6TkyMyA3F3CqoWfhdvwpm1Q3M=;
 b=PnFCJ0towIX1KYUshsmSxTwwqsLY7pFlpMwp5dzKPTbcQ7zm5s44tn/cIye6xmbDEp
 JvZwe/YpogpiP5cIvwd8FIdi/SXl5B4ojYWKMwmpVA5EZAgxR0fGj3aBS4tHLDn6/db+
 hK6dp7OuBv5dsLbz+WjTjI4dCO+YtK0GIWCtK+fvKASjv/Kk9gmhn+wY6ztyd3n9qx+X
 37o96ECzaa1LSQrFpHFsABNp0uT+UWun8m/VoMnptfAmfG2fj0t6MQPN7g+QkE4Kz9LZ
 vNe/7e2WSjuPSz9susKThd6Txu3zOZzYohji3t5jnSC9nfo/reaTqCvLSRKgxYCgsPTz
 NrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NaibPNLx+MUOnhnXMB6TkyMyA3F3CqoWfhdvwpm1Q3M=;
 b=ghWwG7GQ/nJ/HSt9BViGeTNRw7HTjj6BYmTs5ID3G53TluAZY+dZMbWhe6diPpKl0F
 6v8Hv0OXm6NKcHsre5oO1mgrWVXChEOAeldloHthNiy02opgoUwb6ErMwLRq+TBAdrID
 rS3PS5BGFSqrUenkPhHBhoH19V8yVfG2YZIGT1I3uIZkTYI2vFflaH9FzIYJMRV46KdO
 IdOXsY6FMKwIcyjjRg+cfscQq7gohJ0bJRqVL5ZOinZtF35qXiiwQ8o2jj9uKu8KisaN
 40ZR3GaZDJTAl04daP2NUm8bIqnNLL27Ur7yGaDgl4KL7IuJPsN9q1W8fmXr+Y1BYEba
 MpsA==
X-Gm-Message-State: AOAM530RU2BuJifdC59bRbR8Uv21z+tvoBgUVjSiABxbE+0GxW8lDQD9
 4shAIAxsLrpAdHyIy7XAwIk=
X-Google-Smtp-Source: ABdhPJy+SN/JCW9y73jk7Rv4CeWcqTl+YX031QCi0JX3Fp4CIJ2+LFrGSaYRussS1JVjlMiB/Y0XKQ==
X-Received: by 2002:a65:64c8:: with SMTP id t8mr8403199pgv.96.1622874238348;
 Fri, 04 Jun 2021 23:23:58 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id v14sm2800870pgo.89.2021.06.04.23.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 23:23:58 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH 3/6] arm64: dts: meson: vim2: update serial aliases
Date: Sat,  5 Jun 2021 14:23:10 +0800
Message-Id: <20210605062313.418343-4-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605062313.418343-1-xieqinick@gmail.com>
References: <20210605062313.418343-1-xieqinick@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_232459_251270_D84D7B47 
X-CRM114-Status: GOOD (  10.56  )
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

From: Nick Xie <nick@khadas.com>

Update serial aliases for Khadas VIM2.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 18a4b7a6c5df..70488ae45876 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -17,7 +17,10 @@ / {
 
 	aliases {
 		serial0 = &uart_AO;
-		serial2 = &uart_AO_B;
+		serial1 = &uart_A;
+		serial2 = &uart_B;
+		serial3 = &uart_C;
+		serial4 = &uart_AO_B;
 	};
 
 	chosen {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
