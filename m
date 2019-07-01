Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A398C0650E
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 11:57:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C360208CA
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 11:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JYMsucnj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SGuzD8+l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C360208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+YJrs4glaIdacleY+VeZQE3VSPxCDWSNU9n6RjXoA+I=; b=JYMsucnjOeALLt
	LG1irQLoW4+a/8GUD00EREZcsjGr7KNpBkLSUek5ooDt1k3UlDQEMGCb+iX64ZrbTvv99D002yeEW
	UVfockHpE3iaI5aQaOYXmsccTriPHcn/s4Npq0YZ7kz1AJAw8EgK+1zgpEfNx5yqPxpNO6wu+gDi5
	XgcRkjTwNWbyRXVi+6pedxSMqrIRMIQLJIkVugDyHkKxULf4+BBCwfUalNZNxJzCudDwzwOD4YSWG
	VcDcdoJkETxGhgj9yDu7399fOghl2ruJ9RsfZ6+/93DIuduxBlTKFyrtGG3xdQ2xA1i9pWDJuNXSM
	J+hHDRSCXpdid26YzIxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhuw8-0001aj-Vj; Mon, 01 Jul 2019 11:57:32 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhuw5-0001Zo-LF
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 11:57:30 +0000
Received: by mail-wr1-x441.google.com with SMTP id p11so2319441wro.5
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OWBpEvn4nRZz1cmchO61KMpCxGabkWCJ3N6fsTIImxE=;
 b=SGuzD8+l7yIVTo4NJFrk5PQLhWUNIRIl+L2MIiLrNt2+dqP7uthb9y+UvZlfRDiShW
 W9SI2QjMio/nGjOHqcbJUrtYFWAYdaar70RuhUzDf9r6paqbgSGD8gdsYZlJYoWKJJye
 spj31of4THSKTqUlWnaUqUFe1Oi1R/mcK84Nes5jYXa16piAAdAAxckeWVeWVRfQU55u
 F3SiwkKDc1lKOO++wQwy9pM4QE7WV6NVWX3zRFpe6pSzHeC8xL/yZPwZr8D2frYayYRT
 gDFGy0aei38sRKxDcgPp/k1TdKS03J5XWlol9PzE0Q3G2sHwFFd8/8q1Ripa5qcoAj2/
 gFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OWBpEvn4nRZz1cmchO61KMpCxGabkWCJ3N6fsTIImxE=;
 b=WgcV7lTwFJAAM5perDryJ63UxTDZmfGG86ua3zeentIlHxEHkAf7W+1i2/x8MKe6G9
 vJE4EK2gUBgVUtsXTtRhm7fTlOKRoxA2E6c8hZLJOsLRchhjeTuC+n/AZHHKOiqKV2Mv
 xubVpePuZr08KLzjkhMo5oOPkPuAuuJfIlP2EmM8MakX/P88IyEffvpTHes3qf+hYOu4
 huGRXxlv3Zwmdc7jZyUAl0CInAcqEUctZxvIpuUe4G95r2X0DIN45tst9ptGIMGNRqSX
 kWdyWyowvSRx5ABKMJrXueIjejfU5qV67QReWcXdVaIhGiUgsKfHBbr3Op3UxAW1qave
 8UdQ==
X-Gm-Message-State: APjAAAWHbwJAWyhwfV3IHzP64Fq1ceMSkssZSNWecpGZYOHhntes2LZ2
 hpY5WAAd889le8wNsrnDteKlgGD5EdQ=
X-Google-Smtp-Source: APXvYqxYE/6Py43lG5VkCd6ZaToMDiKOWJY63MqNtt/xP+N1a4IkXdPwDaoToh3uN/qzhr9j4omYOg==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr18930522wrr.273.1561982248294; 
 Mon, 01 Jul 2019 04:57:28 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id w25sm5660944wmk.18.2019.07.01.04.57.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 04:57:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH RESEND] arm64: dts: meson-g12a-sei510: enable IR controller
Date: Mon,  1 Jul 2019 13:57:24 +0200
Message-Id: <20190701115724.15801-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_045729_703647_CA9146E7 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the IR receiver controller on the SEI510 board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index c7a87368850b..12aa7eaeaf68 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -339,6 +339,12 @@
 	pinctrl-names = "default";
 };
 
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
 &pwm_ef {
 	status = "okay";
 	pinctrl-0 = <&pwm_e_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
