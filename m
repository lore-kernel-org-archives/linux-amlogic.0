Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CA5C64EB4
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Dec 2018 16:43:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E6120834
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Dec 2018 16:43:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H3VBkiTn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KteVn27U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E6120834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LaqEm9d6b3o6JW9nRV9x82cRbfELKMCMMpo+FDPCcDg=; b=H3VBkiTnPPQKo3
	yBOFgPGOSlm1xivvjJpXnLqnX6gGc+jTBTQ+L6h5yqU6MmP4+V8UvJ6I9n74hrcDHYJUgh8bsk4dY
	qeaOirZ/isC3DBwjRm2qmIuEa5KrnHr5+I97lZFsa6Rn9kkKm8UcNzriagNwUmD3hrxKskw9nrVsh
	fQW0QG1PJX9kY0tSwcfFXGKucecM/Lfj+VOyiIiVZWfAd4EP/crsth2Ru9IP5NnWS3jGjhoCvZOUn
	INDcOg6+GvUCXVV4FEHGUn3ewDdmWUMLvAYf+/hNiuz6ltmD5ufz0RyB0jg6i6JRyIuf1/LYOZNkD
	CTl6gJ9fORE9xgTNV+BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gT8MV-0006W2-Ra; Sat, 01 Dec 2018 16:43:23 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gT8MT-0006VJ-0w
 for linux-amlogic@lists.infradead.org; Sat, 01 Dec 2018 16:43:22 +0000
Received: by mail-wm1-x344.google.com with SMTP id q26so1786591wmf.5
 for <linux-amlogic@lists.infradead.org>; Sat, 01 Dec 2018 08:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LURxEpFoQpbE01pm5s8u2VhCwkBhrR1RCuFsS9V/51c=;
 b=KteVn27UKVdUq3KI12wGmiicOxGN8+eVErhRRf8F93QdgSkEVQ2M7knInh2Osgv//w
 ycVMqoULoLBLvVKe+5nhm5lIfUAdomZ6sSerIXevptE85GdAEikP+3YLUn421NP1vrx1
 Pf+rx27XiwsSBt7EMOonWBYD8sF1qAMY3WYOq4oGYRno3RX6GKk6IujvVlp8jv1cDBYw
 /lhW4cwbYfpoNSiyZeYZREURTiNNcDAmwQrDw4ZUKoFPm3xxCwq6iexv39RBecXUSp+v
 stEidJGI1Jch4ibKS2RulMuVQsR+5EazzqN9UWSqlsSy7HA72WATo6D5baXPU08eh/fR
 TYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LURxEpFoQpbE01pm5s8u2VhCwkBhrR1RCuFsS9V/51c=;
 b=WQ1bw2WlD7++xwebAjJuZ3j9IphCsON42Yw4bKYKjAji11U2UMB32VWxXdSB1Ae+p6
 Gud+1+Qk2G5N4MBLCV0Z3NJ6E7CRaTuQ0qalCVpk+fR4PZUQuIbEJ4sgVGRH772y1THf
 VjpxXlRvhRG7O55XKDRRHQK4hTz6RJUl0Vb/Sxg/UAWWIZOvASG+d5GZR3PgbaAX/HEH
 fUQ/FAvvlszPOjYm+REEIr0rRuNfze6D93520lcRKSm14nPd8oCC4hOluHHgqFBheG2f
 41gJ/ONAn+EHBzZXN4mFkgh7/99Tpm0LxfmGXJJxVPLt8Z2K0+pUEWBjHIGiIS/UiRof
 otug==
X-Gm-Message-State: AA+aEWbqY+AUr37JvnC742wpLeHKbSa+VAWRK6DuFTiASUz8ivFF0LdG
 unoMBmuo75IoatHJp8+eT4CqDA==
X-Google-Smtp-Source: AFSGD/WFSLxdN5SsvJVkdG9hc9IBop/EabUDv1hDBA+tqbBTaKLr7BQnqRrnrteB9+p/FciDF06vpA==
X-Received: by 2002:a1c:68d7:: with SMTP id d206mr2602270wmc.43.1543682588394; 
 Sat, 01 Dec 2018 08:43:08 -0800 (PST)
Received: from localhost.localdomain ([104.207.76.73])
 by smtp.gmail.com with ESMTPSA id c13sm19832843wrb.38.2018.12.01.08.43.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Dec 2018 08:43:07 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: robh+dt@kernel.org, khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com
Subject: [PATCH v2] arm64: dts: meson-axg: Enable GPIO interrupt controller
Date: Sat,  1 Dec 2018 16:43:01 +0000
Message-Id: <20181201164301.17274-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181201_084321_127202_953B8DA1 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the GPIO interrupt controller for the AXG SoCs.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Tested on a custom board derived from S400.

@Jerome: I know you had problems with this. I tested this on the apollo
board with the PHY IRQ and it seems to work fine. You probably want to
N/ACK this.
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index df017dbd2e57..a7d8219f7373 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1414,12 +1414,12 @@
 			};
 
 			gpio_intc: interrupt-controller@f080 {
-				compatible = "amlogic,meson-gpio-intc";
+				compatible = "amlogic,meson-axg-gpio-intc",
+					     "amlogic,meson-gpio-intc";
 				reg = <0x0 0xf080 0x0 0x10>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
-				status = "disabled";
 			};
 
 			pwm_ab: pwm@1b000 {
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
