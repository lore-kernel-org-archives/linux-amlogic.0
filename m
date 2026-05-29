Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F30CD6E4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eHwVp32SKUrdWbUlK6Fficjm99EAR7xIGXLbJLmX2rI=; b=xUYMZJsTnssAsT
	2UcVv52F8J38kuuhYknHGkGSfwpkQzLKQaJswCq9e10uxC/iiq+KIAU4q4QacVFPKdJHv4wEO4Rbd
	qBg/Iqa2bRSiUOSM+2vl2Jd5qAfxJ6NNXC48Fubm7JY/3qG9GnafdmM1G8qdbRtRDjs+NnTN2DmPr
	h0Bbk42HXtQJ4jrFIC00rCmyMHPL7qAGuOmLK7g+uzt7nXXsV58sUxmozo2Za6I6j1nUG4l5Gphss
	2I5JlUs1nH6Imgy1d2AVqYNV4vozNnn3+zfTdGpMQvVmOoqwP3FoVHHR1vs+4H/77G4xO8HSgNunu
	zrPSoOpTZtWvJj4nXqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxqr-00000007UFB-1bi6;
	Fri, 29 May 2026 14:06:17 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxqp-00000007UEW-0DBc
	for linux-amlogic@lists.infradead.org;
	Fri, 29 May 2026 14:06:16 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ba4a1a0325so94404555ad.0
        for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2026 07:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063574; x=1780668374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YeqM+miLLQz/iilbW/aMNZ8W2aMIAVim2TI81LDeOXw=;
        b=q1lKa4+l1Iit05ocZgxRNbcAotoSMoitCrN7dsAfxjs0AHaWred7xASsmxBDkwhBEc
         fR0uPODhs5RR01Qj4085qA8ZVPuq3nR4AfAxYbT+cPJXO8V2aQqzsgUoMHG6St0gfjl3
         TF7Tde7Ld9pE7MK+uY2tZYhzVUonvEj+jCDxWm4d8SzZ7gPsY8g+8Nkx9x880lbGWBQ9
         mG0F/rblfrfcPlnGpQkvA39Ew13K+norfwcVyVJR5I6OXwQPDASWhTFcHtvu+0rMDAG6
         0+N/732mwMYzChdHuQr/ThX8NDwliejI5EvRnHYCyLGr1Btt2FzOqMVqWZE+y8NUk2iG
         UuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063574; x=1780668374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeqM+miLLQz/iilbW/aMNZ8W2aMIAVim2TI81LDeOXw=;
        b=UgMbR5jtpdFwGInov8rkbnz8d+45N//HwmLb+bI7E62kKcsXoMR6Crt8lRpn9RdIPf
         xJ/TXncyOIG1Un+999Oh9kfUWI26lfYLpSgDKrcNIEij1hwe4nAnuQX5uEGjocBo20rZ
         1EFlSaTMaMjhj1JP/L/e3PctaZ/l/jAyjfepUpfQ+RnBXHJULC4E0QewfqZgW4x18DhE
         0cIyqoV20M+PXVKB75H05fyyH8F+YhC0e6ZAwpmehuL2QGN2PG+l2SDSsDqmxcC3m9+F
         gE3CqBs/g5bI5Ejoue0yzwvxlHyVdIoARyuuyCbUFhRZwYKq7o8b9olTfhp/r7rnK7IK
         iTLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aKwaP01LkcJig9IGfp2vrlOx8aELiQmcgLPpSUSzoFAgjWCpSUHuld+i+PWA1QwYNUCh1DPJEL7Z7E8ti@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5vADuu25ByaAa4TCFxUaAN5eWyfjf9uo6k+tJlCMuJoyNcsdA
	ch6yH8cVutjXS6kXdl3XYHDTVe9DKguc2DoeRsECskDs6OzrkUhUqKQj
X-Gm-Gg: Acq92OEM9LkItpkLd0cG0O2T0T+QZQ+vKa9nymGnUH1kJCi23s6Bq9zhRTH24h9dHVM
	a7EzD5DxQqD9uDVfEmYIlKWfmTzF8nEm7IGq7qxZ74eOxOCmh8g5hBMxzAOSOQCsjM1w9EcSnRc
	GiQoQ8D/PjPrt6B3IyBbT+KdmlIWkz6zU8fG6S8Qj4sc0YfIm4ZE7cXviYzfoKo8QP//N4b1DKN
	BD6Q9nazq/OQ2bqhVwcihePXCdKojXJRncqubK4ValnykV7EhEpSNV/fl+y3fH2XfIlgNY2jLMB
	vZAcYt6RJ4HSpcWgXPRSbWL4FIL5bCP8eID3+yHTXypm6OnunRfTvzLCPvFeeRFU2z1qkgVnNlE
	3ykpuUSlhViB3I3QYd7LwgHaSWVjpyhlYQyMmtsCv115DjL782RPmeFnAmGwk7QhbBWqk5QhLtQ
	qzdhu3iBHa0/pGlF9gW1MShZE/5bnkomuMrk865JQVfnLtl8f7dQ==
X-Received: by 2002:a17:903:9cc:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2bf204fd8f7mr40348705ad.9.1780063573773;
        Fri, 29 May 2026 07:06:13 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:13 -0700 (PDT)
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
Subject: [PATCH 0/3] arm64: dts: amlogic: meson-axg: NAND fix and PCIe PHY adjustment
Date: Fri, 29 May 2026 22:05:56 +0800
Message-ID: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_070615_079757_DC788C3B 
X-CRM114-Status: UNSURE (   7.80  )
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

- Fix NAND pinctrl by adding missing nand_rb0 pin.
- Disable unused pcie_phy to suppress probe warning.
- Re-enable pcie_phy on S400 board to keep PCIe working.

All changes have been tested on real hardware.

Jun Yan (3):
  arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to
    nand_all_pins
  arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
  arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
