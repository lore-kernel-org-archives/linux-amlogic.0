Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5CCC04AB7
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 11:15:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E12A72168B
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 11:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YR4Dyv2I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Lk/FFnVf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E12A72168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BteybdkgAGOP6zqR1D7qOaTWCUs9JRvejkBz0GIIDgs=; b=YR4Dyv2IuOsEuM
	pD+hHnrg0hZs5GiRL9Eq9pRrDagZYlDkyIwaGgDOVQD8eAxhoGxJqwHBZS0KXZZdmOAVEF/1XtAXl
	g8qhJJRHbiLgHDUjMIjMrFMlpZmDdj521JdUx4bonghyxAQJI4grIhV/UGqcGaW0muAkIQnPzmpxH
	x5LeHqd7mIDo7eUnEJpEZ3YCtjjW+ClR7MwfXpwKKBIycdfPqzRS5Aowmf3IU6zoIcuDPnhHr6BlL
	dZsP7xjMdkpRZogUAA4tKQ00RvETQYlPh5WLSwqVICdrWetAfvSfhiMgtc6sPhU2j43obSg7UAONB
	6hlUJWhV2Mg2OOBhYEfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQVPJ-0001Ss-0W; Tue, 14 May 2019 11:15:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQVP2-0000ap-N6
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 11:15:27 +0000
Received: by mail-wr1-x443.google.com with SMTP id e15so6338054wrs.4
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gae07lBu9X36c//OvWVMnu82pCf/Je6diEnl+g7t/sk=;
 b=Lk/FFnVf/iGSa2v/X1AaSZFnOjN3FFHkOpkDgYsBPzDGLG5fW199Bg6EHKYpQHbvjG
 upN08jO7GvIFe2EFL3qDC2RJqy2TdNrtzIXXiv6xy9UFSgM0jxcIRzdvWI2sWGKsqlIx
 f1FNKOeB8BiZDD13ASg+6nlip0H+I0QRBS3uEKND5i+XYaf1Jvk5Ne2LebHswLDXkVyj
 8Go9ZgiXGSDJqUFQEWVrerJtnmdPyaeYOXDmVdM38EKnIq94sL95YDdWFwi/mjZMzv4A
 YH4CboxUd6ys6wXhor8w5BZchx2mLkGxjbIMSDTvcO+tr1lAszMQFh+mmHz8NZH0K+KL
 3ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gae07lBu9X36c//OvWVMnu82pCf/Je6diEnl+g7t/sk=;
 b=GjEwfUB5z/Cy01b3N8FPkjaCxxPlgR+ek/8CjVw9o1okzMPZNIwmT8OXx3FY6HzfO5
 b7I4bZU533+T0SXKOF1N6kRmzvzsYYnp8XgWyQPHUr9pmkofx1a7fAl0Hbj8vVlaQu+o
 xYzjPyoRbpgdulcAlUCUX7fAwXNxCJO+ORHT4156njoXaBSUUmYdZcgq/x93LHE9dzfp
 MBRdC6f5sAA4BOtIodUZM0GeSJozoGXusqafpADW+VIj3Oyd4LFKqKaVvMJUjU5bNs4P
 e0wHIDlaIVrAtFJGkmml41lrcm+sCY4EYp4Q5udHGZUFHe4SSg+eAzg2MzAdC9Ni5t1P
 KDXQ==
X-Gm-Message-State: APjAAAUKS+ciloZPS24MMS6UAnEp1C5BE3M0x9s3FPw/llH3LpHO4jcE
 7O+btOzJfyYY+Eg9vjGV/QxuSQ==
X-Google-Smtp-Source: APXvYqzlC183SHnKjSaghskfF+EG7B/2w/h+SldZ1DKv2VV2E6PqUDkoF5QXkNsJz67vA4mPDya+rg==
X-Received: by 2002:adf:9221:: with SMTP id 30mr21785833wrj.110.1557832523412; 
 Tue, 14 May 2019 04:15:23 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c130sm7289922wmf.47.2019.05.14.04.15.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 04:15:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 6/8] arm64: dts: meson: g12a: add pdm
Date: Tue, 14 May 2019 13:15:08 +0200
Message-Id: <20190514111510.23299-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514111510.23299-1-jbrunet@baylibre.com>
References: <20190514111510.23299-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_041524_783783_0584CF72 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the pdm device node and the pinctrl definition for this capture
interface g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 177 ++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index fa10d6fbf370..37119564274b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -497,6 +497,170 @@
 						};
 					};
 
+					pdm_din0_a_pins: pdm_din0_a {
+						mux {
+							groups = "pdm_din0_a";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din0_c_pins: pdm_din0_c {
+						mux {
+							groups = "pdm_din0_c";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din0_x_pins: pdm_din0_x {
+						mux {
+							groups = "pdm_din0_x";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din0_z_pins: pdm_din0_z {
+						mux {
+							groups = "pdm_din0_z";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din1_a_pins: pdm_din1_a {
+						mux {
+							groups = "pdm_din1_a";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din1_c_pins: pdm_din1_c {
+						mux {
+							groups = "pdm_din1_c";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din1_x_pins: pdm_din1_x {
+						mux {
+							groups = "pdm_din1_x";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din1_z_pins: pdm_din1_z {
+						mux {
+							groups = "pdm_din1_z";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din2_a_pins: pdm_din2_a {
+						mux {
+							groups = "pdm_din2_a";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din2_c_pins: pdm_din2_c {
+						mux {
+							groups = "pdm_din2_c";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din2_x_pins: pdm_din2_x {
+						mux {
+							groups = "pdm_din2_x";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din2_z_pins: pdm_din2_z {
+						mux {
+							groups = "pdm_din2_z";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din3_a_pins: pdm_din3_a {
+						mux {
+							groups = "pdm_din3_a";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din3_c_pins: pdm_din3_c {
+						mux {
+							groups = "pdm_din3_c";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din3_x_pins: pdm_din3_x {
+						mux {
+							groups = "pdm_din3_x";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_din3_z_pins: pdm_din3_z {
+						mux {
+							groups = "pdm_din3_z";
+							function = "pdm";
+							bias-disable;
+						};
+					};
+
+					pdm_dclk_a_pins: pdm_dclk_a {
+						mux {
+							groups = "pdm_dclk_a";
+							function = "pdm";
+							bias-disable;
+							drive-strength-microamp = <500>;
+						};
+					};
+
+					pdm_dclk_c_pins: pdm_dclk_c {
+						mux {
+							groups = "pdm_dclk_c";
+							function = "pdm";
+							bias-disable;
+							drive-strength-microamp = <500>;
+						};
+					};
+
+					pdm_dclk_x_pins: pdm_dclk_x {
+						mux {
+							groups = "pdm_dclk_x";
+							function = "pdm";
+							bias-disable;
+							drive-strength-microamp = <500>;
+						};
+					};
+
+					pdm_dclk_z_pins: pdm_dclk_z {
+						mux {
+							groups = "pdm_dclk_z";
+							function = "pdm";
+							bias-disable;
+							drive-strength-microamp = <500>;
+						};
+					};
+
 					pwm_a_pins: pwm-a {
 						mux {
 							groups = "pwm_a";
@@ -1164,6 +1328,19 @@
 				};
 			};
 
+			pdm: audio-controller@40000 {
+				compatible = "amlogic,g12a-pdm",
+					     "amlogic,axg-pdm";
+				reg = <0x0 0x40000 0x0 0x34>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "PDM";
+				clocks = <&clkc_audio AUD_CLKID_PDM>,
+					 <&clkc_audio AUD_CLKID_PDM_DCLK>,
+					 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
+				clock-names = "pclk", "dclk", "sysclk";
+				status = "disabled";
+			};
+
 			audio: bus@42000 {
 				compatible = "simple-bus";
 				reg = <0x0 0x42000 0x0 0x2000>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
