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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA32AC47082
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:26:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9576F6121F
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9576F6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlhYaEGTRXTpns5dy/CIKswVU19DIcdWGILSExzoLSA=; b=Lo/iPdc6bX6Nxc
	zw8o9D68kuTJ5aFl0UxTnm5/rtKi8KjLn5zR5zuyAWy9LJwrv+GIqjcMFefAUU1iFZ6Ip8q4PvFdJ
	1OV1U+svGiT5tbZaTVlfId1izfW+O2WYuS2NPl+cRdRH2joKf/2yOZ0tSAh3fe1B2kTPuJKqUXTN7
	3z9dDyo5A3wxf1MoGm1eoBae+WmXmg7jDx5VItRYxsYsounv7aaRCh+LkjEO7DwD7Buaa013GOh5Y
	pelqW09TM7UhlpeDRthroEGLzKkG+9xk2wG4+i148QUBjmX9i8ALWJec03z39F+RrW/PExNBBXW4k
	K6scuM3t9nFwkB1tXe7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpPl6-00G7P0-3d; Sat, 05 Jun 2021 06:26:12 +0000
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpPk1-00G6vl-TA; Sat, 05 Jun 2021 06:25:07 +0000
Received: by mail-pf1-f181.google.com with SMTP id g6so9032938pfq.1;
 Fri, 04 Jun 2021 23:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mRLzIEsUR/L5fTfNptj18L/QHNRpPol1gX/tfrGQ/rY=;
 b=qjR3K7Y6bnavkxQ2PlGFoAdxV2duS8lTe7alKIVqY/p6DtShc2wS3dsn0KCq+JT+KL
 lmmrTHCnXMvlFjqVUu3tJ20Vk9ZWeAA+hIargnOSpHI23KQagmLqbSiUL9CupmiplG9E
 GiBlnRUQCRrLiMASOD76WI949ayVGPPXY0W5FhNxaXnatlhNKRBFbEzSAjuBYA+KoZb3
 h/Q8YBdp3iCUNKEyLOlBDLexkiW++IOZ7OJ8h72kvwr/Xk7w/YpUqMwz0n8EWwq7ub/w
 VYPOOfA0qra99l0gWWFTmmb6XUZcu0VXxz9G9oBpJlB3pA06qCjEvA5vVd09Zf4Fyn3o
 XrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mRLzIEsUR/L5fTfNptj18L/QHNRpPol1gX/tfrGQ/rY=;
 b=X+ceDadlgUlbunV5tUSqsqEarBt+j5scBpFFMwXfuBHL2S4jtmMQGNcIyx8hA5s2MG
 GlmkDVhf0NUstdatgcVW258TkXbfE5Zd9ig6cKs2emQE2iwNhAs/jkFEhZo68VM7nITF
 eQQ5xJS/LLynRG9KWn2bB/a47a5Q4aw1n73+Hu4IoLy1BJVTTJDid4nfwoSS5vJ8kmrN
 mXOz1qMvvO2y9HZgtxU2YCbXLRO/ZBfo/4iOtjXNccF0iYvx/5EgAbmLAtGJUYdF261h
 pTk5EHNmBntqiubrvI6jgFlmJIsrGh+UzL4yLLYaG93pHTkH5uefV8ZkUGNqqHZ8xXe9
 ed4g==
X-Gm-Message-State: AOAM5335ctVhEDCFs4tXS2347yOYGJdOOsvasgg/zBTFF+ApY1coLfSb
 uj1qT6PGUTRQ8U0MVc9Uets=
X-Google-Smtp-Source: ABdhPJyuKkPF0M7qEYRAx+3TGanu2WwwR8XDOK7b9zvGa8OuSNfGhn+gKmyZurDZQtX+VAoFro0tmA==
X-Received: by 2002:a62:2c0e:0:b029:2e9:dcb9:4a09 with SMTP id
 s14-20020a622c0e0000b02902e9dcb94a09mr8027048pfs.75.1622874244454; 
 Fri, 04 Jun 2021 23:24:04 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id v14sm2800870pgo.89.2021.06.04.23.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 23:24:04 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH 5/6] arm64: dts: meson: vim1: add i2c aliases
Date: Sat,  5 Jun 2021 14:23:12 +0800
Message-Id: <20210605062313.418343-6-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605062313.418343-1-xieqinick@gmail.com>
References: <20210605062313.418343-1-xieqinick@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_232505_956115_E3977660 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

Add i2c aliases for Khadas VIM1.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index f116a9d91633..d175d6cae535 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -32,6 +32,8 @@ aliases {
 		serial2 = &uart_B;
 		serial3 = &uart_C;
 		serial4 = &uart_AO_B;
+		i2c0 = &i2c_A;
+		i2c1 = &i2c_B;
 		ethernet0 = &ethmac;
 	};
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
