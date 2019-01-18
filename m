Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1ECC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:34:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE072133D
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EUNt3gqg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tDMMMXak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE072133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZN6o5rwV1GAYM7GL2fOAT32KuC3oj6M1oIMkGGTc82s=; b=EUNt3gqgG8+k75
	bZRlhu+dgdyNuXaXXSIBjmZA/qYh2zVWe0FzIC2oBZbLrzPrCJ1Owlk+O1L0vEYqDHAYgntcVRtQD
	cHAY2tLi40RD8YQ6XDRrYcuUNeQVkV29EOrnE5Ax1jIySIj1F2eYxEXsPDlAI9CwwlapTRWXtAukz
	aSyHATDJuLzfdQ+ZSiVV9gRWQ6APVDKXHBJl9J9I9kI3UKrPsLdw9lRyR7vbk4JXR3xI+wEzhXcci
	07RfwI08al17XnN8P7rvHyt6ZEBErgB2x/xIgNGwYuKw2KYEjAgxuUo+EPviVRdIP4G0SLvoMrF8R
	fUzbtGHBB/ZewyxplFGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkRU7-0007nx-Qh; Fri, 18 Jan 2019 10:34:47 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkRU2-0007i3-7p
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 10:34:45 +0000
Received: by mail-wr1-x444.google.com with SMTP id t6so14361047wrr.12
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 02:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P9AjnAWzF1joho7fIkFSGa6Vz8VBjxoU9IlCRi8abS4=;
 b=tDMMMXakZ2OKycxV63R0kDoca3W+5RsF4yYMPAY5/VGS3twWcTA3vTJYyzqe+6L5OW
 vKmPWUZqYNKtIkoQIyPtvypB4SbGzZDrP037Y16eDj/i0SIlX+5+X75d2bDoPnvuj25F
 igllX71zAQkQFmfbAizRoWOUTVut8TwGbQDtiSX7K3/mVzjmKngqrBklbeduDTHdXETb
 agXdfHF24nAzTqQ9/wem+vRrgSScvmXbPw2DC3S6Qa/uXb4jjGFHGsVe3PIupCyMw+As
 JnNkYftWgnbfqsDoTTkfYPZfft4rtq0styc1YRvVRWVUMm4YlkALzXGa1Cmlk3wYlqj+
 GROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P9AjnAWzF1joho7fIkFSGa6Vz8VBjxoU9IlCRi8abS4=;
 b=Df3hLH7v3a7IP3M7yqQr4iym/J+SuPkYNem3/a3A2ol1CE1nzCPZqiXpByXmT9LTHW
 V08N1AHNgmVkYlKqbRqCB+H9WKDw9c/CmtWRX/+/e9QaKjUryaRs1ftqA6o8FM7PL8QL
 gm7Fyq0FHP6Hp6/14CBUCptSBn3psLIbUFkgdzDmJkyFZBs92pMajN3Zsj0k+vDLphUL
 sTbC5BlfBh4zu5P2wrXgk9ZdLxxKAJxK8I4Qsr4W0Wecw2kTC0UyvNWqM+yjcNw+XyCq
 ZrnSuC8MEbjamSMOYeWXYY6j348FUSGWUQW4/Xmu+SuoiZs/dGdQcRmHLVg8xx8hcFC3
 X2xw==
X-Gm-Message-State: AJcUukeaSPUDgt8P4qGXPfp3jenPlbfBzEyZsNftPfeyMGRdsEglIV3b
 EsGGbYT+A4uh9MWkrpJqw9xp1Q==
X-Google-Smtp-Source: ALg8bN5FfHDfot/9R7M6iyDxWcxTidV/KLl/0YgGRrJ24gZo46Tyte8I3t6T7G36YOBo2J3jgMoILw==
X-Received: by 2002:a5d:4382:: with SMTP id i2mr15808334wrq.172.1547807680464; 
 Fri, 18 Jan 2019 02:34:40 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s16sm67066247wrt.77.2019.01.18.02.34.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Jan 2019 02:34:39 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 3/4] arm64: dts: meson: axg: add clk measure support
Date: Fri, 18 Jan 2019 11:34:22 +0100
Message-Id: <20190118103423.15075-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118103423.15075-1-jbrunet@baylibre.com>
References: <20190118103423.15075-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_023442_592137_BB9EE293 
X-CRM114-Status: UNSURE (   9.09  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock measure device to the axg SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f044473dc7d0..398b7ac1b107 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1610,6 +1610,11 @@
 				status = "disabled";
 			};
 
+			clk_msr: clock-measure@18000 {
+				compatible = "amlogic,meson-axg-clk-measure";
+				reg = <0x0 0x18000 0x0 0x10>;
+			};
+
 			i2c3: i2c@1c000 {
 				compatible = "amlogic,meson-axg-i2c";
 				reg = <0x0 0x1c000 0x0 0x20>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
