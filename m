Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2240C27C53
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2024 09:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KLTvMGG4zMBzVj9BRqDhMu0flIR8UTarSamx5t/SGXM=; b=OTedjSUTVjDZ9G
	8n+HWGXH4HPSm2t1+lH+DVsOEPYK3V2gku3aEUxB9OcW7W9o3tZSm8vBOUgOnz3bhkZ6ppfVWCN9D
	nAwq98sWGF+VPW6I3LiPl0bGjB0Vql32agpnPkj3HlPKOOGO3sqaWBfBOh3oeFC3C2uwbx6W/U97j
	6+U9orWOkrPu6DGxh1KUeimTdtOGP/zgfzZllLPvsdfSor3KQ704ZGPTz4HoLw4Pvbvt5G3UjKtj/
	zWbt8XE9yTtxnrPxz7vM2Azz9DBPVgYZKthUVHV4ajR0VqIHaczG02gej4iODxLDzbI3kz0uVLd6Z
	9hwUW8jVvlkOuyltm6hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKXJ-0000000C3ds-1xcT;
	Wed, 12 Jun 2024 09:44:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKXG-0000000C3d7-1Fep;
	Wed, 12 Jun 2024 09:44:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A731361342;
	Wed, 12 Jun 2024 09:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C15EC32789;
	Wed, 12 Jun 2024 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718185492;
	bh=ipSLKvscIHjvTT9FXo+JM1SUJKLQb0dy1cZ4uZ3Z7jA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LQgXUG9quIv5wypp3e08V2W6wvGCWX+kfLm0SZv7pq0GJq1hJcSQ66g0YbR2FI7i7
	 rnEfm6wPXplRLsb7cr8rsku0rgPb4t5PnUh3SOjkLIIrabut5C1I+2YTi56U9YW7Sh
	 Yc+wZrQoKLCk1uE2KM/HyrXdCxzCauypt4uoQQolBYMrhJn1a4Q7TGIW3A0KC+aC6o
	 NUmdUspwCoAYxwoRbc97zC7hvgjxYxXkhxljB7pp3lptqNm+UBsIvy8ur7uJhSxRjX
	 XN0h/kzCVUpi5puKqiMy3T0Fz/Ivsi/hZd805FjOCjhtdE8Qe/wwD34+hGXLtBycWE
	 Nxeg1jnWVy/OQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE65C27C53;
	Wed, 12 Jun 2024 09:44:52 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 12 Jun 2024 17:44:50 +0800
Subject: [PATCH] spi: meson-spicc: add spicc loopback mode
MIME-Version: 1.0
Message-Id: <20240612-spi_lbc-v1-1-d52e8c8011bd@amlogic.com>
X-B4-Tracking: v=1; b=H4sIABFuaWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0ND3eKCzPicpGRdAwtTy+TUpGRTC4NUJaDqgqLUtMwKsEnRsbW1AOo
 n511ZAAAA
To: Mark Brown <broonie@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sunny Luo <sunny.luo@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718185490; l=1402;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=b+Ry5KyDug4yW2aXOoBaVaLUbknmRYKeqBgQWvQYE0Q=;
 b=scoKl7griElcwsQYJ5MkTT9KMG5KoHWGW0pBIMKlZcXQ0qwTcMxpVklWONNq0cdQQ62ieUpzt
 RN+ICCezNmlD8L7HkC0Z/Dqe3qZrHGu2q7QJievDZcWACky1WpdqNLI
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_024454_523204_A6061F51 
X-CRM114-Status: UNSURE (   9.62  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add spicc loopback mode for debugging convenience.

Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/spi/spi-meson-spicc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 8a4a8ba9dfed..8838a98b04c2 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -514,7 +514,9 @@ static int meson_spicc_prepare_message(struct spi_controller *host,
 	/* Setup no wait cycles by default */
 	writel_relaxed(0, spicc->base + SPICC_PERIODREG);
 
-	writel_bits_relaxed(SPICC_LBC_W1, 0, spicc->base + SPICC_TESTREG);
+	writel_bits_relaxed(SPICC_LBC_W1,
+			    spi->mode & SPI_LOOP ? SPICC_LBC_W1 : 0,
+			    spicc->base + SPICC_TESTREG);
 
 	return 0;
 }
@@ -850,7 +852,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 
 	host->num_chipselect = 4;
 	host->dev.of_node = pdev->dev.of_node;
-	host->mode_bits = SPI_CPHA | SPI_CPOL | SPI_CS_HIGH;
+	host->mode_bits = SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI_LOOP;
 	host->bits_per_word_mask = SPI_BPW_MASK(32) |
 				   SPI_BPW_MASK(24) |
 				   SPI_BPW_MASK(16) |

---
base-commit: ec0d19f2b59699e2e148091debaa0d9d6af5800a
change-id: 20240611-spi_lbc-0859cebc580e

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
