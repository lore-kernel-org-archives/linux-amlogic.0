Return-Path: <SRS0=aHUU=WY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3106C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 20:28:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5E2F20856
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2019 20:28:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r4ohjuYK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmauFG49"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5E2F20856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwoqrRwBfSSGkWkTQFFP7FxuX+aoiDWaoTgB7SwBCK0=; b=r4ohjuYK6X8Kwh
	C9oCicJKzZX64nNZEVI+9WzHuTkYh4O8qXGyHPmwrhZFfGgVu/QRTsXRg8E1BhVQK9vizDCfN4Tkw
	a/oUGo0oCbhAtYdb/VV03/aOkgUFIbeIsAh8+yAgxcv3CAxqkxCz+wN2dIP1ivAbH9w3AhyZVRQ9t
	CiMvCacmkOL1XXJJBDeshCjvGN15jghZq59gFS/9WjrcgbXpuV9d3W/AxCMua+n8upOJwQx/NHWWK
	ypx+1KRt1PB807a/dnd2lx0Z+7Tfbs/OMQy+5DqHD6lbRc/Ju3sdBmR5YtqJsrx2fHELsbCq3RcZH
	PjDtxtMw6EeiHNIcbqqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i34Yb-0001S2-1e; Wed, 28 Aug 2019 20:28:41 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i34Xg-0000Vk-Jw; Wed, 28 Aug 2019 20:27:46 +0000
Received: by mail-pf1-x441.google.com with SMTP id g2so530024pfq.0;
 Wed, 28 Aug 2019 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dkXX5TgiTvbmjZ2s48sm4xiTslbHfT/2Tf1RMDcUMM4=;
 b=lmauFG49VNHXeEHXlI8hUJynuUqS3GWxNpN9EIvomJl3C9ApBZzLH/erJcW6rTzdgw
 Lt5iL4SbrD/pv4FYJSvMNDc5RoBBFqvCnChz/nyFqV6jaIhuund/Km4eDj7iZsoa1cmN
 zw3ru34EDUQ7Hb/P8ut5dyDuh8XNHF+4tq/VaNO/GgEHvLSCk6DAK77CBeoS1WOh5Vvg
 /wknMk9qtIbldZ4WMagQ1WgWEQOTyH9bJJNU0kT0m3YbTPS+BN4q+qu1u0I1fsAYP3Uk
 FmgwNwr30tTw6lbv8nhaVxImkRrYqQn0RwsnhBYyXPQSR6aS0EaqFUyHuK6oJ58t9FgV
 dSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dkXX5TgiTvbmjZ2s48sm4xiTslbHfT/2Tf1RMDcUMM4=;
 b=Xdq2BotKxWVun1wDrw2CnCiEPgvMNUxLw6Y0uT0dO/yiDzpC4Qjh2js/TwxQhRqTkT
 fxiSoGB/eCCO7f3+WW9qDRzSCaaMq9krKbUans2NOVTintTikfon3YdBjzXVClKzRYWZ
 gKixo3230yhP31TZPd0sbXJThb4dBOnrrV4MJM2+U/dZWs/C2ih56WB7CptfaFbHIr3j
 z+ErGfoqE5zAmMIzv8IEqmlXkIXjObwyLhYWcF1T5AJMv41JBB/15DXyh6Diy0FUBK6e
 GwynjpC5CEKLxIJvcyU0gpmeMcKbiHbb+4hoTy5IdjJf/NPpMR8YPXCcqSVhsMVoiDHP
 ltmw==
X-Gm-Message-State: APjAAAXfYUZgtuwdUbCmOO61CQAo/W3nxOQkcYS0kJrnSe8hJOIPozG0
 1q90n2z8R2TQH7WmCNPfJhc=
X-Google-Smtp-Source: APXvYqzh2Ahi+YBjudkc/D6a3Rt2lT3vtzWfy3Lwr8zSzRTJ1DJR4wGqglvYhUWpr6KYMJNbz3+Mtw==
X-Received: by 2002:a62:641:: with SMTP id 62mr6804168pfg.55.1567024064309;
 Wed, 28 Aug 2019 13:27:44 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.111])
 by smtp.gmail.com with ESMTPSA id g2sm253373pfq.88.2019.08.28.13.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 13:27:43 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv1 3/3] arm64: dts: meson: odroid-c2: Add missing regulator
 linked to HDMI supply
Date: Wed, 28 Aug 2019 20:27:23 +0000
Message-Id: <20190828202723.1145-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190828202723.1145-1-linux.amoon@gmail.com>
References: <20190828202723.1145-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_132744_771922_EECA97C3 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As per shematics HDMI_P5V0 is supplied by P5V0 so add missing link.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index a078a1ee5004..47789fd50415 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -213,6 +213,8 @@
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	/* AP2331SA-7 */
+	hdmi-supply = <&p5v0>;
 };
 
 &hdmi_tx_tmds_port {
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
