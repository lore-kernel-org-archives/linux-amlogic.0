Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CBFC5B543
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jun 2025 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iIJKdg+QgOTzcocNmuqaX5ETpYgE/rxDO8pa24bflc=; b=lZhK4vgGt0laN+
	W5heQxwq98rHBg0GfjMxGqTcxmhStAmwYZw/ODBapQzErd4bMHYwVLO/cwgB2HrlAqosTh2vjq/C7
	imDrJv+QUfJZxumW1DCXihD3u+Z2y8xkbthQSB/a5q5wXjid3SjDdc4+mQnoNUMrlvNnVL0z5JKQE
	a0SmImKS/68P3XzoPe34MzGA9NoHmJu4pUNi/FfM887ZBGWhIxNBabe1FFijxdO50iiqfPox9kGDo
	ULW0cYJFcUCHoVcUj6cgwllZUSFts45bYVniNdGNYjQibGMgHgxWqVaia2dQAwXasbXD/0uhb7VLh
	8bIaYQGogKnBjd/SC0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMik5-0000000Cms0-3Jvx;
	Wed, 04 Jun 2025 07:40:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMik2-0000000Cmq4-315z
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Jun 2025 07:40:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E5FD5C481B;
	Wed,  4 Jun 2025 07:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67E72C4CEF0;
	Wed,  4 Jun 2025 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749022853;
	bh=vHqBtRLv8H0LKoVMxIP6SYKoQOs/9V+tdbYZDQwMuos=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hDluHRf22qyArZZ0Bf4LaeVN5YWL2ILBxAe8nesypxE/FSnVq5LJDAXDUW2M5OosV
	 M5w7cOhYZ8MU/GQ5nVnyLbPXuqZYI3FC9Z3elvWKE62v2i775IZm47Ma0ZR6H/cpOO
	 c2jNBBxDtIQrsDIoCB7IFy3iPnb2AnkoHeoOcaUTDDx6pRrkVYdFCN4y7eWeJcGA+n
	 2HoAZ8c2jvK69e1Vbh8TwiFAknDBEaIVRCQsKbcyfd0Mfofv/lkQyBL6HDWC5FuTYt
	 NVKGSBXwa1jVMD96nU0beturM3usQWcKrAzIkJe+rXryO/OeSyBzd62KFp0V5Jwyy0
	 IoRnkCFQvDf+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC24C61CE7;
	Wed,  4 Jun 2025 07:40:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 04 Jun 2025 15:40:53 +0800
Subject: [PATCH 3/3] MAINTAINERS: Add an entry for Amlogic spi driver
MIME-Version: 1.0
Message-Id: <20250604-spisg-v1-3-5893dbe9d953@amlogic.com>
References: <20250604-spisg-v1-0-5893dbe9d953@amlogic.com>
In-Reply-To: <20250604-spisg-v1-0-5893dbe9d953@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749022851; l=878;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=r4XosHXySa02DQkB3mCCJMHyJ40Hjw6wxKehQsmElKk=;
 b=V4rmS3CzffbGaQiEdobEEU7Z8PraHYH4CYYX3P8e/1YeEZXDgPrue6bxH7exz0FzZ2U8tUDPi
 BOhs5J0HjqVDceFzwk6dNAeM2qJD80EpRdu0UaiwOkr2m42wrmlSQZk
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_004054_805646_F8612DE2 
X-CRM114-Status: UNSURE (   8.28  )
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

Add Amlogic spi entry to MAINTAINERS to clarify the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ff4de47dbd55..8ed6da015668 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1271,6 +1271,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
 F:	drivers/rtc/rtc-amlogic-a4.c
 
+AMLOGIC SPISG DRIVER
+M:	Sunny Luo <sunny.luo@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+L:	linux-spi@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spi/amlogic,a4-spisg.yaml
+F:	drivers/spi/spi-amlogic-spisg.c
+
 AMPHENOL CHIPCAP 2 DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
