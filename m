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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FB0C47082
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:25:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E81AD6121F
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 06:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E81AD6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kmi1LtN9pwUR3dp9So04rNwn+5xZlbafi2OMtif2RD0=; b=esyYNixSYPCn6H
	/e7ftfdy6yAaAXtd7SA9x62XNtoKZhgAjbG9XAcvtgkrtgHnkU9FamJCuNkHk3CRUe1nLbpzYJ+g2
	BcsQ28gBVPY3s9cBk3QUkQtIHdomxz7E1qG22RXaHXSMwhY3zgqSR7g0VMDpKiyyCboMGH5od178W
	yIw1bB2ihagYBcJvmnH9mttwKrAsG3dBSJsnWrzSZ+ODZjJCpWprkGs5nYfS6qOtBtHCh9D0zy885
	sdboBUMuA5w3pm7zjjRjOXmRJMZVLmB6o7CsYjpDEBICMTeFEcK7rrmjjd5yZYbJspMsDZwpE2egM
	aHP0GYRyzwBjqFdSEFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpPkj-00G7DB-2T; Sat, 05 Jun 2021 06:25:49 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpPjy-00G6ul-1p; Sat, 05 Jun 2021 06:25:03 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso459357pjb.5; 
 Fri, 04 Jun 2021 23:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s/4gtuT3qIireG3x7h44jTs73Upz/ez6wI7xxmdqwiQ=;
 b=MvI5AFzL6iGO30UsE/59Cs+YLshuejKEYHlkyj88RJvsvRZ3OV4I8bH5f+ZREOtFmg
 nGqFM6RyO3pE7v5OgltdJRHJT3CWMdwTrEkNB+o2Q9RnNvP6fV7NJOOp8xaU2Ac8f5vv
 GHaU+8rDLbUV/nLDxfHWp2IlO7DoxWDrYDbCP+UYtvz+H46JLctZCCsVF07hGJ8b0FwU
 Ir4Odo1v9ceIp3hUH5q7s7xoJPl+3JokH5/QXl4aKlFIBcqED5q+UM5e4P4V1G4gFbMv
 SXKgddqkYUFr1OMwfmnNR7wzJiGnlO2fdUouXlD1PvqVGtJm8Y+XbIiOPfMQ5PcMa/CW
 dI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s/4gtuT3qIireG3x7h44jTs73Upz/ez6wI7xxmdqwiQ=;
 b=N5WwjAR5+K7IBrEQcQHdex/pGwwMNLJfCNw+X09ObaUhN4CgiIqsYCcc6QLLXqcFay
 EOA/gR+MX4dBWXQLhrRCBDUdxU9tqhBUIdphQKekf/TsGCBGAfBTIBBNtyF9Y9pAR2l6
 mRaWV/mqT+qTuZuryIVd41dgtb6kjSE2Ke8d8RHP4w+x8dBwSOZM6ArYZy3Sx9VtHpVI
 +HOIO8+peDjYgiNPnTRtYYoVXEnMmz9JNMj1B4beFSlOT7BFDxCXin91CUJo7KLpFmfn
 uBRMiLeWn7KZU2yy1EFT2h5K5nvht/lA8eb1jxsTGVOg5YJ/+736o0y9BMW3f/QScMCd
 i2Ng==
X-Gm-Message-State: AOAM5338yEkoYGavJnQmXwDm7dNH44DdEcngZ2BGHMJ+06fpuL2ScFCx
 CI+PErDyrYKZq9NOmNZ2yTU=
X-Google-Smtp-Source: ABdhPJyxNP+i9W3LDwW41qJsPNepcYBCRaUlnffS990O2KQIQvKXm/1z7tN82cTXDUVcGmtlBgABrw==
X-Received: by 2002:a17:90a:7f81:: with SMTP id
 m1mr20246482pjl.23.1622874241402; 
 Fri, 04 Jun 2021 23:24:01 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id v14sm2800870pgo.89.2021.06.04.23.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 23:24:01 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH 4/6] arm64: dts: meson: vim3: add i2c aliases
Date: Sat,  5 Jun 2021 14:23:11 +0800
Message-Id: <20210605062313.418343-5-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605062313.418343-1-xieqinick@gmail.com>
References: <20210605062313.418343-1-xieqinick@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_232502_109555_281C7A27 
X-CRM114-Status: UNSURE (   8.75  )
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

Add i2c aliases for Khadas VIM3/3L.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 4686ea7abe0b..b285341f862a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -17,6 +17,11 @@ aliases {
 		serial2 = &uart_B;
 		serial3 = &uart_C;
 		serial4 = &uart_AO_B;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c_AO;
 		ethernet0 = &ethmac;
 		rtc0 = &rtc;
 		rtc1 = &vrtc;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
