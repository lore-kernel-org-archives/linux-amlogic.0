Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D14CA5FFF
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=scHwvUUIZPWlsq4U6lUBTeahdcBMbLbb2ZIUITjQdyg=; b=epX+cVoYHoPcbz
	SzV8nw/pZfyLc7tx8KBMd/6n1H7TzwzzZL3Krk4gaBRIC7IASXFZBMdHQYWkRoqlQWCtHkZTOQu41
	4RutToiWZYerFBON7vQlLCF+U29e7Su5lXVFk90slyRe5GgGYcj5UllJqDagQb2YtqzNd60wfOl5U
	BqvVN276ySWDo/PM/rhPMh/KUYMpfVhoNRb5/A/UQ9bJIueKWmatyzqnPopW74OzoI2UjaZkTk63z
	u7FafHDcjfNN/Jwajjvv8N0UnsjnqJPQF+kDWR2jKX3gml5yTSaG8YE++e7turPoeRthK8TDmAOkw
	43RflIHU0xuBdtE0YryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyv-00000001wQI-1qid;
	Wed, 07 Oct 2026 08:26:33 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyt-00000001wOV-0ALb
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:32 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3111082f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361589; x=1791966389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBaPp0u4Tgsx6RoTaJszoIAhk3SQlcR8pT28TWFVYik=;
        b=ZJly37b4JCEdfcd91cUn0e/W+cOUx2WtLAIj3mjpv52NL/kgYvXeOyF2hSta0nv08E
         tSttrmIY71rsldEwFbsIoPQTpnKQzalwCo0l88c8qspVxq6gTPGCth32dszLUtdZjIZp
         Nokoa9OmsoAXgFUfeu4uVrUxrUmeSXzGVSmVxaeGeQYh9z7Wr1quX/q+hL429Uh5AGct
         Kv89NGGxxWg9khBAjKeDCqpO6JNQ6mhzhZy7Y/JGW9oJENRGG/8j44Nj+hsFe67P9lxk
         9WcC2bHLAgjqfFOTyVSbMeG2DPH1Nl9LxQT6UBVKtLx1gqqnkPbeUvcqe/EwqjDtTi7L
         ptrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwR1z7eoY9UcczV1WA42CTK1GQtY3+l8TzS9qttjVfPqX+JR2F4CogfkIVzRWdtzu8+PCpywIhwFK9C3tsj@lists.infradead.org
X-Gm-Message-State: AFq9FYJLZLG6lmHzqxbtlI6bBGNn9RHqbdOF7vfxUG4NqQsg0RI6rhz6
	SVFh2/HNfDL2RwanG6GHCk1jcC66DGlj/26LyZiUy8pVvpzzulX4xL7bTMFndNfuhmMNYA==
X-Gm-Gg: AYBFou2adOqQZc2VunO97WJ0LfGmW97azE1j6nMD1QH2fJFsjacp+A9naDpWokHB72E
	zq+67MailpyP3rDXaCJHavmsONDWLWRPnORifJmY+82FXVZF7kxuaoox3nWiaY4iT+JYnABmfDN
	vERj6ZnTL6Uzg6cuFLw09d1fkoXwTSgZHDC8cytqNpw1sqxmdQWTfoVu1jWkqZdOm6vcq98vjgm
	Z9IqxEU32lFJBYdyXA9iowGNes4oYIS0FiFL4WSoMFSsLr63Y3wDbumhhpaS4j2JoqIMG8WkXid
	tUQAvestOJuVKO4M5Zl18hiFUe6nOKM/xiKUWTlNYpNgTacADXzcjfdIfbNQ7UBp0PSAp0VTG19
	VLq484kyKdemfCwnEFYdivPSf+ltzwkDTtJyfs7IGvGM0t1Qct02fZ7Q4uyQPJH1DcJfJqsRhXb
	NhUnmOmAOvt1OMivEMOKtyod5kKhcZ5p3J0cGSc1b0XPZQ2DgE/CXDAIL6ItZ6mIAziBxRI3+pV
	hotkwNyNud7U+4+Xx3vCKVuSy6UWUiTyrtSWPsWcX9xBg==
X-Received: by 2002:a05:6000:178e:b0:48c:5358:f999 with SMTP id ffacd0b85a97d-48c7289d900mr2748455f8f.37.1791361589094;
        Wed, 07 Oct 2026 01:26:29 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:28 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
Date: Wed,  7 Oct 2026 09:26:20 +0100
Message-ID: <20261007082627.63807-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_012631_122507_CBCC732F 
X-CRM114-Status: GOOD (  14.04  )
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

The T7 pairs a Synopsys gigabit MAC with the same glue registers the
G12A has, but nothing described it. This adds the binding, the driver
support and the device tree nodes, and enables the port on the Khadas
VIM4.

Unlike the G12A, the controller reaches DRAM through a pipeline stage
with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
clk_disable_unused switches it off and transfers stop.

v2 changes the RGMII delays, after review. phy-mode describes the
board, not which chip adds the delay, so this board is rgmii-id.
dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
properties. Patch 1 fixes that. The VIM4 needs it because the RTL8211F
transmit delay does not work here. Boards declaring neither property
are unaffected.

Tested on next-20261002 with "clk: meson: t7: keep the memory fabric
clocks running" (clk-meson-next) on top, needed before any DMA on this
SoC works: 935Mbit/s both ways for 30s, no CRC error in 2.59M frames.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7.", which defines amlogic,t7-dwmac with the axg fallback and
three clocks. My board reports Synopsys ID 0x51, DWMAC_CORE_5_10, and
does not survive the clock sweep without the pipeline gate. I will drop
or rebase whatever overlaps once we agree. Patch 2 is the oneOf rewrite
Conor asked for there.

Changes since v1:
 - new patch 1: honour tx-internal-delay-ps and rx-internal-delay-ps in
   the rgmii-*id modes, and pass the PHY whatever delay is left over
 - vim4: phy-mode rgmii -> rgmii-id, and amlogic,tx-delay-ns plus
   rx-internal-delay-ps replaced by tx-internal-delay-ps = <2000>.
   Neil's Reviewed-by dropped from this one, the change is not cosmetic

Lucas Tanure (7):
  net: stmmac: dwmac-meson8b: let the controller apply the RGMII delays
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 77 ++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 22 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 87 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 65 +++++++++++++-
 4 files changed, 234 insertions(+), 17 deletions(-)

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
