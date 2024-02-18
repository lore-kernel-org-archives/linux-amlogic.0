Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F766C48BF6
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJJwhu98Tlc08A49/FqCCRTXstCd7XuFPllZDaL13+c=; b=CGBthAkTUy3O+p
	HT79gQe5Inv1lng5skx+ERB01t/3sgx0zKEtrHcg8nOcrSly3ssi0uB+pcNrRjgw6LupUU+8WPXAR
	1fvsBCocJe9JLV56lUbC5UTWuWl1MXUr8knYJhdyUKjZoyeX70CFLP9rW/2NhVRyP/IbqrGjhr0TW
	4XshKNd/G0/egIA+G9mM7mnkWF0HdVlPHcGL+zyjBht7fmyWG9cC4PHOoNVoD8CmzXE1oJFC3zXbc
	cmfj4CbDrK/itAwlsLfRJyCMEIMJLXwg6kzVO149HAIkcstXocU0zX+kejxcC8asUyld0OJPgr6bg
	y74seEIyr/1+TnfEBDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rblB2-000000087RQ-3jtK;
	Sun, 18 Feb 2024 17:42:08 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rblAs-000000087OO-1xIn;
	Sun, 18 Feb 2024 17:41:59 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5639c8cc449so2986351a12.2;
        Sun, 18 Feb 2024 09:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708278116; x=1708882916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzWEspu2HplkFu6tE3sVyn+412Gf0v6f/fBl/plDgWc=;
        b=JaKd8hIgP0LokFFWnBk3cvalApS/77VnS2t2dhB4FwwG4g6fXOxeAfbjMf0MBbwiVq
         jKJTkP1wBKyvm9MfkWnSCO1t8qBaPJCWwGoNEoMG65wOga30NUDGaVhvYUGVQcumvlCn
         9QOAXJTjYkfooL4qCgIwK3b3nHIoHAHCUsOIXAj9kmjzIiFUCkXLb89Ygrt6PFrlOvxC
         RPTVIYr+O8jENUO2T3JXU/AcczYyKnnE7tZiQhMlSC9XJhnG+1czvTdkj0VyxC/CR28M
         0rOJGGr/RWLrUPyLETpTbCDF8bLbDsUogTFN1FeEJ5Ltkywge4ZPkQP+QntYq7N5RjSo
         ej4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708278116; x=1708882916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzWEspu2HplkFu6tE3sVyn+412Gf0v6f/fBl/plDgWc=;
        b=ZGB34aMj/QaKTUu/+eUGM21mCIQ2Mdvl/nQ1yyRKO1VT50IdYc69Eg+TFaWlPcUy0J
         7OwvMe47k9h824D6Wb2Utzymf1G07ggjaSDnXTCv7ULOdwv5bnNXbSHLcgvzPK8xS9LS
         wVKKwKx0KIiXBJbG9nWlkNNT9MJoU30CD1l77PvlhfpXX8qtLawTlLcPCdOxantiB7HI
         +QrJgJYNLzxFZmq0HuDsz1TY8VumcLZ4vc5+NcxYQXy94Ehjqellm3Puf27KQwB/3nvh
         a7uQw2Krn15C6sYztv6DViqNCCXRfCTyRJHyr49P2tvYx7HAAIYBcxFdRJfSv+D3AfOm
         mMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGQqX1NhvFSJ2mHFbxZDFJwO0zH8PweGVPov6p1al9gDHHvX2eVJgO5gFI4cW3ExRuTn5QYK1Vkh5bNRxNDGs/NuP5AZcis531MsL/P0iDdW32k9rNSr8kQPB0uUkHj5q2FqyGr2Ru/lOYVfCrV91QU69HNV/n0A==
X-Gm-Message-State: AOJu0YzXPkrBCoN/gt2dYuouDIjPC71iY7DEW2A55mGVsazzAxhfNfiR
	gnITq7lhZTyoJwDPXlRn7TOE2fjycL9Q0ZPUn9QVR1i0Hys0bQLF
X-Google-Smtp-Source: AGHT+IGhNTsQBS4dMPJuRFOWLIXIEcTc2ZKSxvfkFHLmVfFYQocsVvaDpg5phoZGKWdM8xJAHhMbDg==
X-Received: by 2002:a17:906:7196:b0:a3d:1899:ec3 with SMTP id h22-20020a170906719600b00a3d18990ec3mr7343762ejk.35.1708278116629;
        Sun, 18 Feb 2024 09:41:56 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b37-4900-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7b37:4900::e63])
        by smtp.googlemail.com with ESMTPSA id r16-20020a1709067fd000b00a3e88f99cf1sm412710ejs.149.2024.02.18.09.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 09:41:56 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andrea.merello@gmail.com,
	patrice.chotard@foss.st.com,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/2] clocksource/drivers/arm_global_timer: Fix maximum prescaler value
Date: Sun, 18 Feb 2024 18:41:37 +0100
Message-ID: <20240218174138.1942418-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240218174138.1942418-1-martin.blumenstingl@googlemail.com>
References: <20240218174138.1942418-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_094158_526449_A634C289 
X-CRM114-Status: GOOD (  11.11  )
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

The prescaler in the "Global Timer Control Register bit assignments" is
documented to use bits [15:8], which means that the maximum prescaler
register value is 0xff.

Fixes: 171b45a4a70e ("clocksource/drivers/arm_global_timer: Implement rate compensation whenever source clock changes")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clocksource/arm_global_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index 44a61dc6f932..e1c773bb5535 100644
--- a/drivers/clocksource/arm_global_timer.c
+++ b/drivers/clocksource/arm_global_timer.c
@@ -32,7 +32,7 @@
 #define GT_CONTROL_IRQ_ENABLE		BIT(2)	/* banked */
 #define GT_CONTROL_AUTO_INC		BIT(3)	/* banked */
 #define GT_CONTROL_PRESCALER_SHIFT      8
-#define GT_CONTROL_PRESCALER_MAX        0xF
+#define GT_CONTROL_PRESCALER_MAX        0xFF
 #define GT_CONTROL_PRESCALER_MASK       (GT_CONTROL_PRESCALER_MAX << \
 					 GT_CONTROL_PRESCALER_SHIFT)
 
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
