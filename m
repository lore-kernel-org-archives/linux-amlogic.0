Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767E2C54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VjNPhOTTDY9Tnt8CQpQOFNjio4NCibcT3pgA0vv7asU=; b=rlo2aidblftxcu
	uyBJSiSx8ygCx40leqBensZov2MKSzyoKDik7Qa8faVrj+dZlGmHDznAbmIrnhCOLJHdZATMk5t73
	98xlEByiaY0rrAA1528WZeu8JTTLkUzSlJU31akM1+AYS3kkOsdgPSkJdK1R2K6pxsM6dge7tS8MR
	KbZuSCoV4Y4IN/78UUkvyXUXbez/eUiTUpqjp5Ufb0r1p5V4Am5F5oWi0jRu9wNBDNYUZzNV5s1gO
	23Yf1qrNQrm/z1I2HrkELDof7JtTAyf0QHwoXt8chhfNchQqEmQdO1NL4LksjMK32OPj9Ga8a988M
	KOyTQzbgGKvcnAE3Rn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLZO-00DpgP-S0; Fri, 27 Jan 2023 10:02:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLZD-00Dpd7-3u; Fri, 27 Jan 2023 10:02:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so5044892wmb.2;
        Fri, 27 Jan 2023 02:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O89v8PjiSY2Ob+iAxk3/FFiEUgZPIgQc0tCql9t2tfI=;
        b=UyXrR+bg1ydL2ojBSqXNvun6Bz+gvr4PWK5WMoIRph5L8gHMc+orGDxqwW47IoOuGc
         ixUV0AOv6PWCjwb5nh4xdfsIgdRyQ/OzndemjD1Vc+kLRK8hMYb+GNjX7v6SmVAhfNiU
         FcnMbja2IboZGMAs2HUiWHM0HYxn7LGHyy4NnUEKpoqsIPVxWDm19FvPonZ2/Ebzl2Mu
         tdCSoc6ZKcAme74+oDq/CiprG9KVW2e4vOe3ZfsmFqsD3WZam1KWzvlSaaFDWyNMdMIB
         e3gYCeNsn0VwqgXqh+3V+qX4TQqe2Rs0DVav52PpFPLtfFZX/2awn1RDh8ciP9NamkW7
         yE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O89v8PjiSY2Ob+iAxk3/FFiEUgZPIgQc0tCql9t2tfI=;
        b=ejuqLblITJ17bRxQOKDs9Aby5pDwXCgwvFOvha/sgkv/MsEGO2thYRox34p4huBPHC
         tWdqWqa5i9yfcUDwBPfhQhdsCV765sqnaSQ9BRmTXZ4VLkvwYHtHKyKxMd+dqYu0gDQ8
         YxTbr6Qk3DGVZmMallwUC0Ayy6YEgakz8I37LV+nbjqEcztLZIPyVyybvmtTTYU6VUJb
         dRbFjy62b/JOIf2jehxLhWWoBlYfef3Re/4R0je+WNBjORCkCyaRvkxy8CyvF2Zef+Ic
         fRfoKqJbugIoRqtVam1Cdt0U632FgGxzDaSSszqGNLVMqF29RhhGo1Jlfdg4q0SaM4u+
         3/tw==
X-Gm-Message-State: AFqh2koamuwL7OvbfrUMXTpFJ8lWNSqK4Kh7WYKIjad9f98hbDNOmm5/
	S+JUR2zRkyjJtUvYbN7cExQ=
X-Google-Smtp-Source: AMrXdXtkWYRA8cMy4G2V+sVUZLnfg2D23SMqOBSXdHG8ruxBWXGvFGzVXu2CIHdbSOkOgSzUvke+yQ==
X-Received: by 2002:a05:600c:4fd3:b0:3cf:7197:e68a with SMTP id o19-20020a05600c4fd300b003cf7197e68amr36864687wmq.18.1674813760868;
        Fri, 27 Jan 2023 02:02:40 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id l7-20020adffe87000000b002bfbe30e8f8sm3493858wrr.98.2023.01.27.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 02:02:40 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: meson: fix BPI-M5 and add BPI-M2-PRO
Date: Fri, 27 Jan 2023 10:02:32 +0000
Message-Id: <20230127100236.3385154-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_020243_173506_66384150 
X-CRM114-Status: UNSURE (   9.47  )
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

The first patch in this series fixes an SD card (re)boot issue on the
BPI-M5. Susequent patches convert the (fixed) dts into a common dtsi
to support the addition of BPI-M2-PRO which is based upon the BPI-M5
board design.

Christian Hewitt (4):
  arm64: dts: meson: bananapi-m5: switch VDDIO_C pin to OPEN_DRAIN
  arm64: dts: meson: meson-sm1-bananapi-m5: convert to dtsi
  dt-bindings: arm: amlogic: add support for BananaPi M2-Pro
  arm64: dts: meson: add support for BananaPi M2-Pro

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-sm1-bananapi-m2-pro.dts |  98 ++++
 .../dts/amlogic/meson-sm1-bananapi-m5.dts     | 427 +----------------
 .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  | 435 ++++++++++++++++++
 5 files changed, 536 insertions(+), 426 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
