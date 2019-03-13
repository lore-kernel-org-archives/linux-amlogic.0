Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA62C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 14:10:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2717621850
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 14:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urJ13x95";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vdV2+uSo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2717621850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMdFiabGKY2eymbjo9bMYbaH8lTE/eUmEmkIR9ATJnU=; b=urJ13x95M14AxL
	fZzG4v3PHACS8Lp2gz89W4sbvZ1fAaRLn+/+P2E1GA1+n7SaecnUYROpKjXKtdjLCGYSi8befSxGO
	LKhdULdR8fuRL42EHgaHdPpsfxX2Z9Y7zGit+9pDQae+Fj5TMZG8tLVxppHuE2q1AhVHEQD1HWw/m
	OwgZ1aCX37p9RvRisDQjxCE/Ym3kueoo6DZv4WL/OGLfFsqP/uYEKWxCnuCmzcMLi90q//u5r96J+
	UcWXq5Bxqe3pyBW5PGKdTuK0hlkedEkqqOtSn+fsCT3qI92miJHDpC+/wchvMTTCaYKO6bhzmh6yL
	GoPCPSmV694PKvqGuePg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h44ak-00050I-O9; Wed, 13 Mar 2019 14:10:46 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h44aZ-0004nt-Vy
 for linux-amlogic@lists.infradead.org; Wed, 13 Mar 2019 14:10:38 +0000
Received: by mail-wr1-x444.google.com with SMTP id d17so2157902wre.10
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2019 07:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ThcgAgIUY7O9XrYBBGUA2/BNqnwBcO+6XZhgqe7dvP8=;
 b=vdV2+uSoABqhZNGN1NH73leBNm+arX+U7uoFv85P38h3Npfnj01HxniEctHAmIZmAK
 EfAMIZPOzr1BGwG7B9bA807q7AtQsWzSQr2ahSWcF/yJ6K1CRvlXF0/uy6Gdc9C8XMSp
 wQFEeA8x4lje8DpUZfWoMTFmVbLncHtuug3g2gM6MoY/4SibvDPd/Ja//NE4r8dcUJxp
 XkOQlsFI3eHnchhRtaZQZftJ1KSLY7VkUVjW0JEzRWVyTlYObGdGrXnnACPpqTKazINA
 NxAMZb4EX01bEUTHL66bKDtprrxZ+U5OFa16DtRHxye6HlNyqHM+5MY/S6hLaiu/SloT
 2usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ThcgAgIUY7O9XrYBBGUA2/BNqnwBcO+6XZhgqe7dvP8=;
 b=eRQnfMuPVM5+XSkBBT+5k4/I7MG3j8ISH6aDBJyo5fHzOHCIAm5rTc1/xmPUeUgdS3
 UQ5pEZ6AI/LdPLPtk93fT0FQFgMMFF4V6+FCQzTOqric0qnd1YZFBCZwTkUfGyJP/7GG
 ScdLwzRYmvtwDh2xOyliOHe+3y9vQGz0aiwtxVqsawHZIdjO1Vm/f0IOqTFsRvwtp0QO
 ehh8QH4TpsGqcbnoCClevhnIQ9xA0UMAHgzC9IBQAqL/s578kVPnKePfQiF19e+71Dae
 F5Wl0T7iYW5W76vypGr6p0xuBpHgp35e/dZHJ1HiU+CR41On1b4YRqs0ZW0fP/M4yEGc
 Gpjw==
X-Gm-Message-State: APjAAAWIs0k+xu5xsVcNYH900rPOgrruvB99xUtT7QSR8Qiyx+lqD03i
 fMeKIMZZMqxsa0gJfNAHj5B/uQ==
X-Google-Smtp-Source: APXvYqxaEom5QURSmM3fg10ekFXL8LbuNi6nQRx/kLqvUFBGS107JotP3BrddQ8QQ6VnXmt2qRBuGg==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr29214463wrx.128.1552486234424; 
 Wed, 13 Mar 2019 07:10:34 -0700 (PDT)
Received: from localhost.localdomain
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id u17sm37300087wrg.71.2019.03.13.07.10.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 13 Mar 2019 07:10:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: display: amlogic,
 meson-vpu: Add G12A compatible and ports
Date: Wed, 13 Mar 2019 15:10:28 +0100
Message-Id: <20190313141030.5958-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190313141030.5958-1-narmstrong@baylibre.com>
References: <20190313141030.5958-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_071036_024767_7C9EEE1E 
X-CRM114-Status: UNSURE (   8.55  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A VPU is very similar to the Amlogic GXM VPU but with :
- an enhanced plane blender, with up to 3 OSD planes
- support for AFBC 1.2 decoder (for Bifrost GPU)
- support display mode up to 4k60@75Hz

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.txt         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
index 419444e2b4d3..be40a780501c 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
@@ -57,6 +57,7 @@ Required properties:
 	- GXL (S905X, S905D) : "amlogic,meson-gxl-vpu"
 	- GXM (S912) : "amlogic,meson-gxm-vpu"
 	followed by the common "amlogic,meson-gx-vpu"
+	- G12A (S905X2, S905Y2, S905D2) : "amlogic,meson-g12a-vpu"
 - reg: base address and size of he following memory-mapped regions :
 	- vpu
 	- hhi
@@ -83,6 +84,9 @@ corresponding to each VPU output.
  S905X (GXL)	CVBS VDAC	HDMI-TX
  S905D (GXL)	CVBS VDAC	HDMI-TX
  S912 (GXM)	CVBS VDAC	HDMI-TX
+ S905X2 (G12A)	CVBS VDAC	HDMI-TX
+ S905Y2 (G12A)	CVBS VDAC	HDMI-TX
+ S905D2 (G12A)	CVBS VDAC	HDMI-TX
 
 Example:
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
