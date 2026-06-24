Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF56CDB481
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2026 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=beZz+sA9FNR20abzZeroSQWmrEssI9j/DHoEMPVhFnc=; b=j4fQQ5WKgnaCnY
	22Nq5jDmjh3mBxf4JrL1FHvmebP1d0VzmtPglzFQgEur514rzzH3/J4jghy67jiJTCzuZtP50O30L
	LK42rN7i8TwQ8wFYaf7zo5suOVd9A+aUpAuLdE5b8xvjVTr1MNtw2umur8r/tikR1I9W1rwIEQ7YO
	e3i93uRJZPhgVkez+hkuI0OSamYHrSz/cYsbKuISlOj2MshI11SRj6XqSlHrw6bPyr5XjQJnMFdxm
	cspVJqyJtthcPEeQp7ruG5PmrnwKpAj31jixV9oBwKtanK8dvThS7UGwBmjDl1Bl7qVpWzQh0BSRY
	ey2lk7mV2z4DM77g03nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6V-00000007riY-28XB;
	Wed, 24 Jun 2026 13:57:23 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6T-00000007riE-1z6s
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 13:57:22 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-966d4da9fa6so334753241.0
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2026 06:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309440; x=1782914240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dK4q1wXB1iEpfa6MKc1INHDEgEytVZ0qx4adNK2kjGo=;
        b=scVMRnhXhoDpcKdAXWxMXbxyjiHMiFqhPqxuykobJizshvgejZt8WhL/dvTYT9ULnb
         Zoi8rwzRLwUtDU5KSP6G2LvhAQEonpX8Ek1JmfYa3vTNW29Enx0Mc9LRaQbvGGflPbZ5
         1zmzyrF6XHwvT9WZOkAUUI1DS/akR9s+VGWXwj0SnJHI1aZghhw1wLsT4XB4kaBVDkHw
         gYvDsNuCWbLuw6Q7agzFZGeClF0jQXKdLwmtAvGa7n3Qy9aKyav93FOlUb/YadDqfuEz
         yB8mOaM8p2mxhrjdePu/PcuHvFdAQbMOxbT3zaQ3gHCsa2qq2aVT0zGkTH7fMJQfpGGO
         eNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309440; x=1782914240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dK4q1wXB1iEpfa6MKc1INHDEgEytVZ0qx4adNK2kjGo=;
        b=BPfWBIaxTQCQ53kghhqBO2o3DmX3tSR3Hd50fUrboHC6dg2OQYB7tH+UGfX15FcYye
         8MMuw1UZmLmubmxSJgepGgEqYSiDrPImsF17jsLTAN2ePYI8uqbFMH+wf6x6i+NXrM3f
         3iCYArqHaMJrOVPS8PZzy0XhZ5RjdShp2pbgfUSWCzJBkYbsxfVXmZ9EAXPRORxJaD7J
         Z01y8e+t9Giv8scyVYimsqXy0yAGXi8yCoIr7QpZK3oGT9JwqGMBvA6tg4v+gqBFFyrE
         mmR2lCOqg4QQNao/KR3Sw66SNiOqUC+YuaQTd7hJa+Gn8+5Rw5+rp/iYR5qMt3GfRSaM
         zmWw==
X-Forwarded-Encrypted: i=1; AHgh+RqHDB5TOvNO4/7evupAdDzQxXQp4+M96TdrD0uUzsJ/8h0MQLlVfmNCbinDOC3pR9MCotPkFFcERAbKgz1T@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8OsCXfwGw9+hq2N2wfx+3B+QKYL4JYBwgh+DgiWtPle4um8lq
	aW6sDBPPBxsHggMDrh8K4r0x2r8okhcvk//Sdd+TwCDnW4/tYTEx1z6V
X-Gm-Gg: AfdE7ckj3XJ96vWaLU08RQSYykE6GKa8/QdI9NAemi383Ht2pnF1dmdwB6u5vrs9saF
	Yvui8a5MkzkK10S1gZk1lMOSEA0iuyNZntwEsp9zQx4Z1kYPGaqh1E4ujliyxBWxaXh/JCcLoCg
	2rBbxPLnRlrXI7+EDuFMXeT6Im2mYfsX01tr/FMjMQjk+GxIdke49Ro9a55G24z/bBF0shmw9DJ
	7ZNtpLibo/oFOWCbiOJOdnktTYZji/H0tkWFEwx2NYq06f+u6iSRv1i9cW8lNpzVy5vjQQaQalf
	TSFmWzpfET1Y7pE+j24xzWpTgq6TNZW4Yq+CW9DOzJwV0C87CqIXdegz39zPJwR41Bv7s5CbrRg
	Fv7wVjzU/b0HlwZnVmXF5AQMOuDM0x1PW22Si3F+/UUKbt9ro+AtB0aF/UNm+0J6hbyeuTOiEsv
	aBB3ddNotteuxGj6nGTsltsbqFUGleP25Yg+w=
X-Received: by 2002:a05:6102:548d:b0:604:f849:462e with SMTP id ada2fe7eead31-72fd815dd92mr4226649137.25.1782309439628;
        Wed, 24 Jun 2026 06:57:19 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:19 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] arm64: dts: amlogic: meson-axg: NAND fix and PCIe PHY adjustment
Date: Wed, 24 Jun 2026 21:56:40 +0800
Message-ID: <20260624135650.727077-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065721_554174_CDAA12B8 
X-CRM114-Status: UNSURE (   8.24  )
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

- Disable nfc node by default ahead of nand_rb0 pin addition.
- Add missing nand_rb0 pin to fix incomplete NAND pinctrl.
- Disable pcie_phy by default to suppress probe warning.
- Re-enable pcie_phy on S400 board to preserve PCIe functionality.
- Enable mipi_pcie_analog_dphy for PCIe on S400 board.

Changes in v4:
- Add patch to enable mipi_pcie_analog_dphy for PCIe on S400 board.
- Link to v3:
  https://lore.kernel.org/all/20260617082239.645562-1-jerrysteve1101@gmail.com/

Changes in v3:
- squash "disable pcie_phy node by default" and "enable pcie_phy in 
  meson-axg-s400" patches
- Link to v2:
  https://lore.kernel.org/all/20260617071604.635627-1-jerrysteve1101@gmail.com/

Changes in v2:
- Add patch to disable nfc node by default.
- Link to v1:
  https://lore.kernel.org/all/20260529140605.1070764-1-jerrysteve1101@gmail.com/

Jun Yan (4):
  arm64: dts: amlogic: meson-axg: Disable nfc node by default
  arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to
    nand_all_pins
  arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
  arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for
    PCIe

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 8 ++++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
