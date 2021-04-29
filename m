Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07157C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 17:04:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 576086144B
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 17:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 576086144B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qEKwCgdpfoaGiZSZSRTuW9yXC2goVs0FngjFhwVu5Fo=; b=dClJf4d9Iwn4bRDIqHlbnbV8U
	94H+k/JD/UayINGnGQ1oxgf9AZGS2EbwgobxxMhBJyRb/hD8kdSVn5MYl8FOmd6v7D3peS0mrnc9t
	FGFF+/RbRqZ+SGBBqkJFW1X1cjdwhq2+pP/uLQouebjVvJjMKJ5M1HVxkv+UwHFxrisiwTYHNFxrd
	Ys7xlbBJ+/B2cFB4rr9KoDUFzFVmfh4JQ+x2uWZpnLshO7vQY6f5+okH+pelLrG/nNBXhYQu/D+Um
	XKvL4ktk9UizOesyL802vvoVzxGI+YNFm+GunPj8aqndDhRXU70KZs0J8CUuwsu10CRgbKT3vi4a8
	gObL/ZMWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcA5m-0065uq-Dm; Thu, 29 Apr 2021 17:04:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcA5F-0065pD-VY
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 17:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=32w2Q7m8yijPAGRTdtc+coQya5W7483U046vrIEYyIc=; b=AH7xNndj8qAIpgv+fZkHcabfu2
 WdWq9o5TWgfdE0z+PZnxSZtM3z2Qu+nePPaMOzWHiHQS0jE9qH5VQUo43A5BP33OMFYIOBIiZMPGn
 quB1otf5U5z+gkTpj92uE21BJXD8SYmjILo5znb6H1BADurKHonnQdd+oHJLTCQZBWMYZO7WdpN0Z
 CAtwjjRko8qOIi8W2acDpokb4d901IJIWv+2icCPqkmb4BNtdtRbl6CPuOTdctwoLGqoG4s8UuUZG
 YxQ5rn5W4zm2nbMYPNPb9oKUaH1KUdVore3JVsYmgftCuOiiAjkIElr0UhMP0iWUgbHFs32SRkudc
 p8xcC/gQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcA5C-000nK8-81
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 17:04:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 f15-20020a05600c4e8fb029013f5599b8a9so126352wmq.1
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32w2Q7m8yijPAGRTdtc+coQya5W7483U046vrIEYyIc=;
 b=oF+8QqnbhDHQRItmPc4ZBh2F96D0iYG3aFpeuogzRGum89LOTtqeAqspTBpcN0klAN
 KRxZYqrrjF55RkqiOcg10Cpg1SjG5I11ipk1Y7vUYZ4FdDvzswgVL2XuZDscoHHxrEmN
 8anCTN8fdQ1PlS9MulA6soNcEAUPtODLDnfQWthzsKKeBZlJyYjeUEeikiz30VY/1N5r
 doWpeFThPtT8Ag9SesViF4NwIwBCrBhwxBwS4HXRnrv2cd9QMiSC4u3BfCUK99EEm2sL
 JwOFVciNXPfZkFQd/YdmOsvLbSbxaTjofPuJS/5CeQaKz4+0NbPOVAjHhzPXsLqRuYtg
 Nu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32w2Q7m8yijPAGRTdtc+coQya5W7483U046vrIEYyIc=;
 b=dAIKjdBCZutSNcOWCW/HYV4aIvkPJVA9j4A22lZZ0vTmGyn5tFVvBk3stAwMpfopp/
 1UoA61tZZjKGcQUaQ2gPAEAzWXhVA7YHyyx7gk5fUlE5WFbThivRqgBvIwMvhANvE9Tr
 yH/wEp1YVW3AjwGpOi2t+J/GNH2+7oXOof7p9gOKncnqCBuQkxr6TDHYQ+VIbSnLzaY2
 Lxp8puAgUCvH87qEartthQe8AvgulVfmyT8j5gFMi2lnVqm66wqWIOCyyJpv9guxsWta
 4OHOZ5+OZOhnqucO8A9B6hI0DMMu3IJ1Ur6OkTU1lsvnNw3VxjTlZ1Q3GIgllk005LxG
 WVFQ==
X-Gm-Message-State: AOAM532qML9aVbQnDBxFsNGhMPeMa4O1gk9b4FiBM22mZNUZSRnBxz/t
 GHWsXMvKtWM+KPCIG0Ni513lSQ==
X-Google-Smtp-Source: ABdhPJwvyZDj2AsdEejQ2N2ma6Yv+76LnAOXXIcHqSGH+vT/O84zTzIoRTXrZ8SfXd9x8Cu5WUnR/Q==
X-Received: by 2002:a1c:cc0e:: with SMTP id h14mr1228907wmb.4.1619715848583;
 Thu, 29 Apr 2021 10:04:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
 by smtp.gmail.com with ESMTPSA id
 18sm11041275wmo.47.2021.04.29.10.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:04:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/3] arm64: dts: meson-sm1: add toacodec node
Date: Thu, 29 Apr 2021 19:04:02 +0200
Message-Id: <20210429170404.3616111-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429170404.3616111-1-narmstrong@baylibre.com>
References: <20210429170404.3616111-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_100410_312712_F2E96D13 
X-CRM114-Status: UNSURE (   9.68  )
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

Add toacodec node for Amlogic SM1 SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index c309517abae3..2d3a81a188a9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -401,6 +401,17 @@ tdmout_c: audio-controller@580 {
 			status = "disabled";
 		};
 
+
+		toacodec: audio-controller@740 {
+			compatible = "amlogic,sm1-toacodec",
+				     "amlogic,g12a-tohdmitx";
+			reg = <0x0 0x740 0x0 0x4>;
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "TOACODEC";
+			resets = <&clkc_audio AUD_RESET_TOACODEC>;
+			status = "disabled";
+		};
+
 		tohdmitx: audio-controller@744 {
 			compatible = "amlogic,sm1-tohdmitx",
 				     "amlogic,g12a-tohdmitx";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
