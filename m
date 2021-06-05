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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE57C4743C
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:48:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47883613DE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47883613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grxut53AHn17ZaM55uWFr8kpCDZr/6X6AaDdRFEcZnk=; b=1I0XHDLUrJz5Og
	N8oVF58mXNA7hMUOhWD6nc/6Nfj2JVJvUgbvM9pnA8YDGtPLLKHmn7CvwTT+hl5Wzo1hF2ATTYlYz
	FH+ereRul/7BO4LUgbjIUtxKEVuIfpbVivJyMMTLceODe4D9C9o77Sjvlr75k4lfCyasp7fL2NGhu
	H09xaMJTmRGAJhbwkZEwTAbDRJLqWLcSZs1JVR2TqotLpLXPQ8gzRk33ZIFmhMJ+lFV8TFM4UGnBB
	k+4iLtlMd/DeZ0YiR0qwnwxGk28vO+VYFYvUEhdm9ex2TkvHO0Xal4ItQ4f1tQKrqVKHgcOqrZkH/
	TvegdCevLBZ+eI707/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpMMP-00Frp6-6j; Sat, 05 Jun 2021 02:48:29 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpMMB-00Frmc-NV; Sat, 05 Jun 2021 02:48:16 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so8459098pjz.3; 
 Fri, 04 Jun 2021 19:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NaibPNLx+MUOnhnXMB6TkyMyA3F3CqoWfhdvwpm1Q3M=;
 b=mSjrZfI8xos2jWzsimSw4G704XuV+i6qr0GEa8uz8Sx3fNuO+CK7eueQWtDdv0fc7F
 8Gh0s7K+KC0T7/Z67nIC23LxKAGksIKl251nu1IsxB90+4H28qpmKe8ZClxJ48geXokS
 gnQ/0K+7/xuH+PHFCtOe59lPdQbQl5+HVbmwU1rQgNzuVIAW7H6AeUx0h5+dnjZDVhkZ
 kA/K+RYd/yog+OHhV6vfEEM/QlXwRw9q61eLqDuPh3vXEK81VQ0ODNny5DNdYadLkBsu
 i7k3TNKGZtJHFoyPlJiRrBp9UXK2SXFNcx9IR+NQFk3nFcd+zgJT/NYycMRn51WdmbvS
 SpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NaibPNLx+MUOnhnXMB6TkyMyA3F3CqoWfhdvwpm1Q3M=;
 b=ZMemi7Jy3WL+E5NNMDw7+hCBMq3UjtoSTR8j45sp+0zgDBMAgSVaUBr9tjcsDIMFRW
 uAlOVy2GGG1nJUZIkZso9lSJvziVQTvJ2iTAAXbpkjVNc6AjDiWqYBudMzmW++zKlPeG
 +TMRIbJjJC0DyofmSZKD0Im9LrPCNVXMLeDi/btER9JSxjDU0GSO7K0ZLzDNYDQp4UY2
 sp+xNYlq5A0LFXpYDMmT9vK1ZvZOqZjRgDbyELejktpQO4r1VJ+kSIaVvqVHo+mcC3we
 dTrkMJvzbDvOh0CuRkSfTv2YA2JPIzGf8IjQSDAEhLXR5qm3erhZoYMQpQvwbg2yMbjE
 s+ng==
X-Gm-Message-State: AOAM5325FR7NA32F2GsV2c5KvpPA0xD+eMf+g59zim/0V8ozrjWU2QjM
 eawELfy/8Q0d6uJbL6Sz3Js=
X-Google-Smtp-Source: ABdhPJyObhqFEKZnaTSeLMJ4m1IVf/fWP+oz8VhowQVA0kbY0aAg0pQqYfwr9p3pLXBUE0h20Mk4Jw==
X-Received: by 2002:a17:902:cec6:b029:10e:e6d8:8fba with SMTP id
 d6-20020a170902cec6b029010ee6d88fbamr7345175plg.61.1622861294941; 
 Fri, 04 Jun 2021 19:48:14 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id k1sm2683741pfa.30.2021.06.04.19.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 19:48:14 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH] arm64: dts: meson: vim2: update serial aliases
Date: Sat,  5 Jun 2021 10:48:02 +0800
Message-Id: <20210605024802.409823-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_194815_788281_FC0CC9B8 
X-CRM114-Status: UNSURE (   9.64  )
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
