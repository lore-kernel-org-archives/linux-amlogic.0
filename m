Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC51C432BE
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80FAC6054E
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80FAC6054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QUExBKAvXI9p/pbTppzzVaxgXrgJnIm1PjC8u2rVWO4=; b=2LnzU32Fh5SMxh
	rt20/D5JmU5frH069taMZyissGvuvDEDDtqd8imAonCcsllZf5CiC/bl+LgymIaoMlTQ/6yVtKsel
	r7+fssFGfd7eGLziLgXbFnQR6Nw5znupx/YEq2lGW/4c2UireIHV7L4xvMfA1QJX480HzzNv2zH/q
	kl3b3cddmroAx7xNP/shHT3OHVw0VEKXnOLBA759cxxHQeh2e56Q3/B2xQWxED5jd3T9A0r7N7K1U
	TXcrFHdubZyqRd5LD/8ucBpAg0/spv+pcjcXjezd5M7w0PRCUChoY+7WVr3C+biw6YDefhoWxahgt
	dt89192pPngbXlOWrbZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDJCA-002NFh-JT; Tue, 10 Aug 2021 04:16:54 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDJBx-002NDf-DA; Tue, 10 Aug 2021 04:16:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso2478796pjb.2; 
 Mon, 09 Aug 2021 21:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U1ZCxqdGoaf55/CTcj5ISosMneiCtYYe3Xxj887/aoU=;
 b=hHIYpognbzOKWWou01shBFX8B6rVjSPSVv+Vol6SK02fq/32t1tml9z9ug0Yk4tW+3
 n+p2M9J53QpjZd5hPByWcqcdZH7+k1vjAQyL3WnuBJrh8WqcEJ8bkfujqI2DLdxUag9m
 cwtl7OVhQGQxK//bcQ9RIBrqYSjJh+RMnWue4N28F7CSgpjNijvp8CfcMme5wJbfxAmp
 Pb54Q57FyBGlfdBnefH17viiNugtkGHKusaYbZo5fA1SSPhHJDnok9IiPOvb81Zzym67
 Tz1vREtYpsJ433KqyxYF8P5TvlkiOeFJ5a4V43meSC9ZfyS9pRDr0G7f5o5b6gvzjzsl
 T0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U1ZCxqdGoaf55/CTcj5ISosMneiCtYYe3Xxj887/aoU=;
 b=UVQkcj6Se9n5XBp/Bpl90QBsQLzr3VqJ3JkTuEUIjbeD/sulV+rxs60LX3FOdc2tFq
 oglvqEMG+k/XG2Fh/R+BDWaMpkF5zSrfR51jbWkOh7ltatqFZ6B3ZXS/1doHXr2SZPlQ
 Re61VtQnTyp3/HAlFKYBy7HLXqLxokGE23t0jM8tOGQvlHGiguim6vFLEqC07+w0O+5K
 6+vBb1g+2WI8/0eQVwvZrkMMcsXZ+EbK7PFGVcgNTh6sThX3IJE0GNwcaKCBckZgcqEF
 QJ468T57YPUHafDmI7ePFzf+r6Ol54Kf6boH94ibRE0jDPfNHZul2uJXtXg3KNBbrTxc
 mHoA==
X-Gm-Message-State: AOAM532Y1RI8nNPJN4o/Na9kkMwcrP64CY80UVIZEW0zZOiBobjEVzT5
 8sT3BMJdjxg3Jy/8yUj988Q=
X-Google-Smtp-Source: ABdhPJxg0dSgmJwiGBZqXBbjejI1SZjtESI5ts60+1k7XaHzE1ixy6ISeV5GB8zmR8iq4wF/xHl5cA==
X-Received: by 2002:a63:5fd4:: with SMTP id t203mr131411pgb.141.1628569000118; 
 Mon, 09 Aug 2021 21:16:40 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id g22sm12741647pfo.164.2021.08.09.21.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 21:16:39 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH 1/2] arm64: dts: meson: add spdif out to khadas-vim
Date: Tue, 10 Aug 2021 12:16:29 +0800
Message-Id: <20210810041630.3673406-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_211641_506346_D71311CC 
X-CRM114-Status: UNSURE (   9.65  )
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

Add spdif output audio support to khadas-vim

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 60feac0179c0..01f13822a616 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -64,6 +64,13 @@ hdmi_connector_in: endpoint {
 		};
 	};
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	sound {
 		compatible = "amlogic,gx-sound-card";
 		model = "KHADAS-VIM";
@@ -97,11 +104,21 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+		};
 	};
 };
 
 &aiu {
 	status = "okay";
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
 };
 
 &cec_AO {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
