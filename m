Return-Path: <SRS0=wynk=ZJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FD4C432C0
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:01:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325AF20740
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:01:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CNZ0us/K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dozuA7JK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325AF20740
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UPDpucEjFNZybDKGrO0VN04iNFHnCQUwiI95AhZ0Fs=; b=CNZ0us/Kbjcf4w
	50WEQkjF2p0jyY6Y1Q3IQADlVH06gSxmZSPz/Sjnivk+p4zsvy6LlRbKTKFee2xpcd8dBretj147e
	SesWLaY+U2Ayp83yBwwVahYNwLValyywmRpuS3O3uo7iTW8Z9jgpEOHXVutjIAD9v2ENsgvwshjeg
	ryoodMQVh1FCf6746QKoJf4GuZfXVz3+nZ1NuhexYB0e3sxRaMfDTe8JU5Oq3ywaD0UdrWQUr4rN7
	saHIuHoRieO+dI9qls3vzWmsrC+m1TCeF7/kQjMjyfMreXW0LkFgZDoKz9zfBEi4FMBGp1TSpto0x
	HR6yPh8NkTR6swmYww/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWL6y-0002t0-0U; Sun, 17 Nov 2019 14:01:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWL5u-0000oO-Qc; Sun, 17 Nov 2019 14:00:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id t1so16358271wrv.4;
 Sun, 17 Nov 2019 06:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lfb97txnqBkpAAA0tczISRiqax5ID5KyvODmGSMgTQQ=;
 b=dozuA7JKPzxsob1ruenYebX+2uaraYQlCzRTEAu7EPK6gph0AbZCFHA+S/5MyNqBIG
 U3qymAOFS6vWauytLtQCtWkwbdVNdg483jY8NGjUbw9Vw6W2i0UE+ng5vK8J7uklbAfY
 WpJ2q846EfjkIszhGkbvdR6W2GJlSL2qj2t0iTHugUeSESi+20LOwQxSDq0OL22IYVNI
 RPhyRSmev++noqTcud3jT2qZPl2UfunG+/hqqpbUTh/ItsyFRKcqwqNU6cIiIbOBXNfU
 uyCoBtXaQa+BdwjDF9xqHWL14uJnCE/KjTqxl6Cd0kPq5bz40GGkrwvwxjgMUATksylH
 vVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lfb97txnqBkpAAA0tczISRiqax5ID5KyvODmGSMgTQQ=;
 b=tPXtpYPdLdHfc2QYA9W2mBhVLc8ANruxYabRDh61pSDIu9dMeq6nE+Kuyuy1trK0kN
 lVtIKY1gowiL9PhJALa+ftnIYdkg7hxla91Zd+yDzsV4gwMiJa77fjG3QCtwCuOwwQKj
 kW4yxw/BiPyHc5kh5sY31plYqsF11N0K9j+qeXOJq8HTZ47sSHcU5E6NyO+n+otMPL0/
 K8DP00TgfVIf6AyUS4RGrWErRAfJf8PWqnfzto6hdpi91SnKjocPS7vBVWbK1DCrtZfS
 aD2BMOaahFU69J7SzpQy/tiOybrDngRItg1DwembgpGjzUjuSJ+haLAV5wGzJjJfvbgH
 bJ8A==
X-Gm-Message-State: APjAAAWuPY8DYS1G0fgzr7Kgx8zpR2NFhTid2Z4jAVBBUqWZreoUTcCd
 t4eGZAIh94QbjnSjACM0Vac=
X-Google-Smtp-Source: APXvYqxH00nil5ICai5RDo5aD0yjFRhs/HB+0oOEKHsK3hLQUPvOZu3Ej+DTySsb5xf6DaKTR0H2Rg==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr24558469wrv.360.1573999201105; 
 Sun, 17 Nov 2019 06:00:01 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id n65sm18004803wmf.28.2019.11.17.06.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 06:00:00 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v3 5/5] clk: meson: meson8b: use of_clk_hw_register to
 register the clocks
Date: Sun, 17 Nov 2019 14:59:27 +0100
Message-Id: <20191117135927.135428-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117135927.135428-1-martin.blumenstingl@googlemail.com>
References: <20191117135927.135428-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_060003_009802_F7A76417 
X-CRM114-Status: GOOD (  12.41  )
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Switch from clk_hw_register to of_clk_hw_register so we can use
clk_parent_data.fw_name. This will be used to get the "xtal", "ddr_pll"
and possibly others from the .dtb.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 44e97bacd628..3408297bff65 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3701,7 +3701,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 		if (!clk_hw_onecell_data->hws[i])
 			continue;
 
-		ret = clk_hw_register(NULL, clk_hw_onecell_data->hws[i]);
+		ret = of_clk_hw_register(np, clk_hw_onecell_data->hws[i]);
 		if (ret)
 			return;
 	}
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
