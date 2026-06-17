Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF2FCD98E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 07:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lkqVs+b4T8Pp3BVe7iXlG1QTu2z7w4T9D3c189p1TrM=; b=QqEVZckrkNzlM0
	xll5R+WEJE736QaIGONbhbkJyDRF5OKFiZt97LSowLLRwEebsWqcgFv1snb+khtLas2bCFJGvDZD8
	NDLMX9VtEM2s8xLrSVddekDmFEkEU/p4Cz00XjZ6z8/NHT7YAktF4Zo8t84C8C6MAwA4/Qy+YmGRz
	+LFOYTpkyQoocSjy6N04h12ti06agddLcoM5D9FhZzBUlolzuPQ+8n5imbV90EVoEwZXuplTGPsEs
	9Nzl1w6+mx0fsTOcqAT6SuzP4CUVHM1v13NWSfyo9oEl2phsUy2GUE73rpVK/LQYj9mrt6SPLsGaF
	DUcVYVGxBSmZBHCityLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVf-0000000GnfO-4Bds;
	Wed, 17 Jun 2026 07:16:27 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVc-0000000GneO-2QO9
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 07:16:26 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c858dc05ee3so3261127a12.2
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680583; x=1782285383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwxdR1W6Z9v5pdo49avh6aIGBoyqUrm81Om04vpO0w8=;
        b=HB09m+qIKIaz4ekzvzAizr+ZvWvF24oX8o+X4oRnDXMbF610KqBK0TVdQTKs9z9bxb
         yiqmpeaFZGLUGohWbuPTRKmvlByBUzqFZ5YNrKHFQC8/g/uDZB4pGcJX8KFm5cYMmHvW
         /bdRlb5mmdkOAvWOZvWrITnHST2HW24EPeTJ80tfuLHqUNLmegK2KaccPIxT1BlZUUUW
         7jenolJHNYswKEQd0PSHJHd8YyQ3ujGSl158uwH7eQjO28YVu+kSdq670WrV8uQXufnL
         7eucFFe2ieOzWYmWpMLGf6ST3+k58k/hzt+S9HY8yOT0A2AskfAVK0nTMxMBtEXTAgnC
         fPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680583; x=1782285383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwxdR1W6Z9v5pdo49avh6aIGBoyqUrm81Om04vpO0w8=;
        b=jNnlgcewR8vNn+aVj0724qnDq6qV28GYTQ8cFWoadBy7bwreB2SvG1/IZySI9KhFBn
         2y3GrkG/h/tC9sJC5ryJb1VM6EWjCevPAgbGjb1UVMwaUM5+uj1QtVf/aKP3nQbinDvB
         cWlk5muWJLIitzf057W7I5pKXtsP0duiAP0YWEbD5kmu5WQr1xEomhi1jUKKV6lbbt7+
         s0SZUDFVrsMIWgaKMY52VQNCiO6T8PIj9YPLI6QpjGvfVneE0cI/yOm07qzbT9yCE9nK
         NPqB10iwY9icTtQiBty7nUZyCRoBi9CFqRFCS8kwsqdUnxXPVIn4eoJvCs+2Q2u4mLgf
         fq8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8GPtifEnY4RkPGUp2i7VVktASfw95HxqTNrMDrGy0moqFOI/k9rNGuIevB5/J5imCax/GyZOv2LeNkUCLL@lists.infradead.org
X-Gm-Message-State: AOJu0YzObk+0rhiXWvNsdJ2FdZDC2mkROdVWjkdSCUa1wX8vpI1sBlID
	eDbKiO3mKyJ39sxli6pnkhFZm+zz2lxep6+PbvWp9ftN39rUeEMRz/C1MlbQECIP
X-Gm-Gg: Acq92OGAwZpL0Ck0of8Wt9PrQXHQ8U4mShLOwI1z8sCAp033ghFAJBDfsftmJqLfm8S
	vkWXFkXVDnTu0lHWXqnQwsFe3A4np39XV71XfmTSsvHQpoXf434e8jBMHjKqBt6MVhxiVJGtRP4
	R8HezVnMCDJ6ORcJJC8+NXjrZ2sK6K/b9G/RJ3UoLrtxy3FpUdiFeB/+qWxKZKpGMlX8+UDZNe6
	MQZpBxK8+lu5MMiNCgiSTaXePxor8UZ3zcA5+7AUSq3VL5Zkfhu7e/ujep+FdHQTsZ2IU7RjFfW
	R3xz7Q8Ig7/PjF1DWCyNFblGGrQuz2m2VqeHTskRoZBBJoBzHH+2fs+WTQ+Zc8RSFQHjrMz8QAS
	UCWHzt8Tt683ldx6l9q4oFp+lRvMJkSRNyMB1Lhu7Ef+HmmF+fY9NoI9wvC8QsR8BKmttfyc760
	TSnT52UNoOng==
X-Received: by 2002:a05:6300:189:b0:3ab:2fa:756c with SMTP id adf61e73a8af0-3b8b572f8bcmr2880117637.1.1781680582948;
        Wed, 17 Jun 2026 00:16:22 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:22 -0700 (PDT)
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
Subject: [PATCH v2 0/4] arm64: dts: amlogic: meson-axg: NAND fix and PCIe PHY adjustment
Date: Wed, 17 Jun 2026 15:15:55 +0800
Message-ID: <20260617071604.635627-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001624_643423_89498D21 
X-CRM114-Status: UNSURE (   7.45  )
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

Changes in v2:
- Add patch to disable nfc node by default.
- Link to v1:
  https://lore.kernel.org/all/20260529140605.1070764-1-jerrysteve1101@gmail.com/

Jun Yan (4):
  arm64: dts: amlogic: meson-axg: Disable nfc node by default
  arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to
    nand_all_pins
  arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
  arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
