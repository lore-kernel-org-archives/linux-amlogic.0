Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18D3EEB580
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iH9DWrMqWtTH7IPo4sZdvaASv5oIw5lBcLU7eGkwtmM=; b=LduQ8+vj8sr9Pz
	ckawI85zLPq7lhldequn9Kjr/mIxC67fUHk8d2NDr6l0EXYVojGi5M0hwYRbG+hB6hCZtONmjGOgZ
	vbFeocGOkmDdpRDcH2z2x+uQKs06F9OUmJ/5eXkcJq5a11RjYArKYMFTb6jQJM1z61muuW1x0BGHi
	SkLzRngsE/87m5K4Bztb/UMKy3imCy7QzBvnZ9jhcacAShSbxUxCuCbGhyAz0LrfqflA6wHUyenQU
	yw18I/gMWHS8IYm6i/IMbQhYL6YZy07OvedqAnZqy4qmRSuRm3PeBq/saNcT5YAkoBhKM2zJlos20
	mV1Cz6km/1btsAFWnZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6u-000vgC-2O;
	Mon, 11 Sep 2023 15:46:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6r-000vdD-2x
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:45:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4018af103bcso29190995e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694447154; x=1695051954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bdQljBM9G3jopTFDsO9g16l4ONvm8vQqmOSRCzAnEo=;
        b=KO0/w19YI+GtO/LmTbOofF09L+xka5p4LNlH8WjhPFnMz/WVzLJWbrtJKlkt7oTyaO
         aKwhimrdAaS+/BspdJ8kkRPpCOWjw83UaO4RJN1n/wtmOq4B6qyzPH8PQtFGzZFC2RZv
         6rtynmoGtaH5epy6rR/J/cR7r3ayauDfDFRs4FdMCPkrakFRQRH5gqENEjcOqwn8TJsR
         usyoXBGJbmIx+IzyoASXvaxZtzLeBVQDc50nIDjpO3FLusE+P1uyAIe6NtwOAQW/BQeQ
         P29ODMWv92I/Insv2Wc0ybun9mJeAV/CdAYOgmwJ9Yz2T/8UoJQQnTh5eQTJljP86ZI/
         Q0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447154; x=1695051954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bdQljBM9G3jopTFDsO9g16l4ONvm8vQqmOSRCzAnEo=;
        b=YiMtWf5yH9mg0mCVnvdQhU4pgLxoHKMfxrlWcw8h68gw5oqKs4/59x63rw2sRLKR5O
         Y12sRLCjkW7247yvrBGM7Vaq6JzyuWPazVs9K6JXaw8tSCaFJoG7ISApfZBP22nX2xtT
         f3ofOV6lgqBWXDWbk7sgjDGLia8zMd2t0eO02vzEQPjBuCo9j0QU1cBND2cSRt/2WCi+
         aufNagSk9bCdckCQ3HCOJHKTbSEhJvp7iqOSjRYeuoIJe5oBtxKlpLIdDN5FA0qJENk8
         E8S1+QLMcC2zcCJnz1faluVxqGQpQt3SjfJQSdt99YY571lmNoEiY1v6JKMX5Kjnm1ZW
         gHhw==
X-Gm-Message-State: AOJu0YwO7oD9/q72X3pZzf7QQyVvyxaYOzUoIOstF4H+5hhuI1qxmPiq
	n3X4DGVk78wG+gRqT2w6980UEw==
X-Google-Smtp-Source: AGHT+IHSlCpiA67RcBqWVu/yNJspToPqKhBDsN+U4vD1E3RtnOz9o0ZpI5rtn7YZWGnKnmMXksiGeg==
X-Received: by 2002:a05:600c:49a3:b0:3fb:f0b2:20eb with SMTP id h35-20020a05600c49a300b003fbf0b220ebmr22361wmp.1.1694447154131;
        Mon, 11 Sep 2023 08:45:54 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:55be:8f7e:5f59:7ed1])
        by smtp.googlemail.com with ESMTPSA id q12-20020a05600c040c00b003fe539b83f2sm13616255wmb.42.2023.09.11.08.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:45:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 2/5] arm64: dts: meson: u200: add missing audio clock controller
Date: Mon, 11 Sep 2023 17:45:38 +0200
Message-Id: <20230911154541.471484-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911154541.471484-1-jbrunet@baylibre.com>
References: <20230911154541.471484-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_084557_982760_B4D224E1 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The audio subsystem will not work if the audio clock controller is not
enabled.

Fixes: cfae4eadb7cd ("arm64: dts: meson: add audio playback to u200")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 8fa17a62534c..2380d237d220 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -286,6 +286,10 @@ &cpu3 {
 	clock-latency = <50000>;
 };
 
+&clkc_audio {
+	status = "okay";
+};
+
 &cvbs_vdac_port {
 	cvbs_vdac_out: endpoint {
 		remote-endpoint = <&cvbs_connector_in>;
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
