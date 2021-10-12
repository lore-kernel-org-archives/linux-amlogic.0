Return-Path: <SRS0=tINo=PA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF191C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Oct 2021 05:25:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C208960C40
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Oct 2021 05:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C208960C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wX4sCSbFo8rx8CGpBLFptjgLBWyYe1c2mNor5NoJ2Qk=; b=u79LUbi7py4aLi
	Zc7zIk2SHz3j41T1/iptZwqUNpP9pLXOQl8Twk/ILbzhufD7M+e5MLhbkgeqqB7jgwNTXdr6hra9d
	2gjNZtTTJ2yAf8bTJnOH1/u3/sXYSRKY0+iybQNpyEvQrHOqWLVQXbxb7eTvO2BifdseF0tcnBUa0
	TSQLxXodF2hUk1O3+DzzwnXc+YrU5XZdZtVZ8n6RtfQ/w935laBG3arz6UNs6FIGWX6Si14oPfHS3
	sbpUpyk5enR3LdNz7+dwOssxZzXr/R7EjF8dj1B1g7ctb+g9TOIXAtEbcognaOSvZWS9Fya70COxk
	r+jUJ+nOPw7bA5gUGsNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maAIT-00BbcI-4N; Tue, 12 Oct 2021 05:25:53 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maAI6-00BbXz-5r; Tue, 12 Oct 2021 05:25:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id t16so54431034eds.9;
 Mon, 11 Oct 2021 22:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EfIYXeJXZGZiW3ivY4Dr4sfAITBJZpqWFEr5+h+uazk=;
 b=FkikaIAGibnBtXf1YruYelSe1VDn/+a1ZfsU3doIs3YNmJjGp9NfgsO9Vn4BmmYS2V
 oVuYl2v74k/nniglK23j/gW4g4cFPFDkNjLkk/3+0WnYQDl1rHLQuWjjq2dkRDrb2X8+
 ZR0nWtctwLMLMsn1k49NY5TCee292gs2s29SR8qJbNoc+dw7Osu8ya7EZT5iav1wHAe/
 hhQQkohtsL9zAqJB8dVL5aCmkHWLC8pDs9eeA5fSxFjT8Af0UzeGO9Ol5fzPh4oBjj6I
 P4OP1oC7ovRaj+PHlrKRli7sJxbdRy5CwDktfU6DIUjAOgGZyy0YXfghNiDuSPJYfz+I
 812Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EfIYXeJXZGZiW3ivY4Dr4sfAITBJZpqWFEr5+h+uazk=;
 b=Dh2rzl2znVCmAXb6qGI9GApvwRcx1L7ZzVKpw3LHMtv8tAhFNxt6uDF37etyKYpFbc
 LFF/aSNuRlGEPZDtPaZz60UuRw66PWyM3d+KHBCbQlbkI5mlKkPKLztt+Vl90f16UaG4
 +u5J88cFplaGqaP67zo8awpp0ZFabJfL00x9fxeX7Ww9WZx3tcBAvbH7VDJVSth90psp
 3H2laXqaKG6017+dxG5W4BWQA5KV/4xKTiA/bjHNN33H6dKZ3qZkpeaTLiykXsC1vu+A
 RlENcFWRoIsP043ewOp4FlBBQU1RimSFMWOzp6a7I65vScLrCCUSwR3y+cnb+peRsDgs
 3eXA==
X-Gm-Message-State: AOAM532/jnyGxC0bQQRn7hbEZungRZPL7GIJLjC3ypWJYdSUwLYKvKQ/
 ctTFqMOtB2UkCB3eEIW2w6o=
X-Google-Smtp-Source: ABdhPJw7dW7J940dM5tG5LwCQcRqT8cLbGuZ0nKVV+ekHhAM+MlAlpHtoMFkVZi9fJtQNSAxgq7rSA==
X-Received: by 2002:a05:6402:274b:: with SMTP id
 z11mr48321199edd.151.1634016328734; 
 Mon, 11 Oct 2021 22:25:28 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r22sm4323321ejd.109.2021.10.11.22.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 22:25:28 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/3] arm64: dts: meson-gxbb-wetek: fix HDMI in early boot
Date: Tue, 12 Oct 2021 05:25:20 +0000
Message-Id: <20211012052522.30873-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211012052522.30873-1-christianshewitt@gmail.com>
References: <20211012052522.30873-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_222530_626767_F2F4B697 
X-CRM114-Status: GOOD (  11.87  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Mark the VDDIO_AO18 regulator always-on and set hdmi-supply for the hdmi_tx
node to ensure HDMI is powered in the early stages of boot.

Fixes: fb72c03e0e32 ("ARM64: dts: meson-gxbb-wetek: add a wetek specific dtsi to cleanup hub and play2")

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index a350fee1264d..8e2af986ceba 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -64,6 +64,7 @@
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
 	};
 
 	vcc_3v3: regulator-vcc_3v3 {
@@ -161,6 +162,7 @@
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
 	pinctrl-names = "default";
+	hdmi-supply = <&vddio_ao18>;
 };
 
 &hdmi_tx_tmds_port {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
