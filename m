Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8776C433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:37:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A83D23F2C
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:37:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DNWticdu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UH5336yA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A83D23F2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvEIPAx5lfH4J4wqVGID+pHG8qnLvqLqMoNVN8+L1C8=; b=DNWticdujiIRe0
	xZiF9Xcc3c4JCY6ldnervvSYRrvBiKHTCg9jHrJLhjHPpn0qR7SIVAhAe/aGYRnDzyZNi+SeR5FwD
	YG+Koh00qKdCX/Lh01zVnQ44nYx1IHquIG1cop7EwKSljYehiUALkme4tfetZr/A/dIJvf1gc2upY
	DwaU3RUnjddLZutBUkau/rlLgqZZh+Hs26fC4TMnOUAQPF+9AAz1+ouIcsnzGkmz7CpZKd3FkyMTs
	sHM7ZI+JyxNp+BTCt9BFUspXq8sKZmVO4Uvoo+UKScxHSw8fCT6nNomO4dGG5ZnXp0GgLCcmDxzCq
	n/bn9uqapISv3EJefEdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmgUz-0000CH-T2; Sat, 20 Jun 2020 16:37:45 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmgUL-00084z-V8; Sat, 20 Jun 2020 16:37:07 +0000
Received: by mail-ej1-x642.google.com with SMTP id k11so13582849ejr.9;
 Sat, 20 Jun 2020 09:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TahxZALJaLCxgLMRboEQz5AGrY5Y2MzITJGz48oy1vw=;
 b=UH5336yAihXpFlkaEJC0dTEyZT1X7gcIiuPL59QjIZbud6sSevhkZmAz4bLSCjj7eg
 KReF9sbxXno8m/FJlmfAcBi75MsdGkDRBzvPSJVm7iba4+Bbb37rOlqxkrX/d3VTntgM
 6U97hcKOC/sTO5HcD23Y553Be53z8r3Ed2FPebpONe+NCIv+KlhUn3/4MDYmeK1ugxl5
 m8jhTUKs9Rz6t7b+om8YymoapMbjPBZNkiICG8Z7TgZ+Jp09F87WTR+2/H/iypz0ycVj
 NbZY9rLg9OLN8EvZat+E42wTx0FZhv/bA2N6jHl9j+6BGY4omPOu2E5e2RhuP0WbVr/9
 RYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TahxZALJaLCxgLMRboEQz5AGrY5Y2MzITJGz48oy1vw=;
 b=sglf1B/ufFUXE4EGSQgJ3LJeGN6Bz/igQIWK0AIBLSGnMWO0NYvdE3/FV5VEZp1FmY
 nf1HHdXWFk9/ZaT2E2OxOwezILklZuDh9PCWG/e6zetmS0cYzfctqxdweZRvPmQQWMfQ
 JFFOk3h2tabH5c5jeHupHyfWD3/dQ56E42eo0MmtHyDOpq7GbJ9NQZ4ClJBZ3VD0BmQx
 YTINkL9D4kJXDviPFaZrj3Oe/Wtl0eTPIP0WZFYtF17dqYJ3/iWeVH5Z10/+eBO+Eoy0
 jNHhROVfVBR4nfarp/AtiuneFYctcuGZIHJbFgA6lzEDkTvilWPmOfECVbH92xjDNx/z
 pKDA==
X-Gm-Message-State: AOAM530pGSSuNCLcS7AB6NTL99M8lg5zcw3ggy/OXUtK1RQNN8mDH5hI
 JuMl//xmkXxqWGqjeCjd1kVYYN+P
X-Google-Smtp-Source: ABdhPJx0Dr2mn9vLEyJDZKufVycnesKdKOX9+R36cGvaO02+1LnNq2V8x4wzWWxYO8jTTr6PFT+5/Q==
X-Received: by 2002:a17:906:1386:: with SMTP id
 f6mr8642098ejc.66.1592671024588; 
 Sat, 20 Jun 2020 09:37:04 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id o90sm7839442edb.60.2020.06.20.09.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 09:37:03 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/3] ARM: dts: meson8b: ec100: enable the SDHC controller
Date: Sat, 20 Jun 2020 18:36:53 +0200
Message-Id: <20200620163654.37207-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620163654.37207-1-martin.blumenstingl@googlemail.com>
References: <20200620163654.37207-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_093706_000090_74035AEC 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

EC-100 has built-in eMMC flash which is hard-wired to 3.3V VCC (which
means it's limited to high-speed MMC modes). Enable the SDHC controller
to access the contents of the eMMC flash.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-ec100.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 163a200d5a7b..ed06102a4014 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -27,6 +27,11 @@ memory {
 		reg = <0x40000000 0x40000000>;
 	};
 
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys-polled";
 		#address-cells = <1>;
@@ -299,6 +304,26 @@ &saradc {
 	vref-supply = <&vcc_1v8>;
 };
 
+&sdhc {
+	status = "okay";
+
+	pinctrl-0 = <&sdxc_c_pins>;
+	pinctrl-names = "default";
+
+	bus-width = <8>;
+	max-frequency = <50000000>;
+
+	cap-mmc-highspeed;
+	disable-wp;
+	non-removable;
+	no-sdio;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_3v3>;
+};
+
 &sdio {
 	status = "okay";
 
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
