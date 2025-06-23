Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B6AC7EE32
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jun 2025 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tzc7czwI1cYLeg9uT0G8M/+BBK7zhVU15b7tPSeYz0g=; b=fK/ItsHdECE8Wg
	QonPPWgIbS+wMLqh1QgG6gYX7eceWOKRlnXLsKAu0Lmi4UMsGi1GVTNv7b2vHT0Enkc5YzuyXC+mB
	IdVwlWimZVINfQJkSwqaiCqK/iu6bLnseO5Tii7L/rNVFMH+Z6+XRGeatsFCEp/a1EDf+X3J7i5qx
	hA2r9CZqZ28F51kzpbfXQmkuOLZhPFd0i0cLiP2vRgsLinanmEW5pySCCYgenXM/3r2q7+FnFxVIC
	t/WsL6GBQ3qpwmrF7rrO+yq77+5zQxnrtWSMqkmPSTbQ+jIrbfP8daibvduiGkiPyqlK4UEigAQ2L
	K9LnrftYmwgt40oXlJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdAM-000000027E4-0CsM;
	Mon, 23 Jun 2025 09:08:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcvi-000000024SJ-2VU6
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Jun 2025 08:53:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D58CEA50C47;
	Mon, 23 Jun 2025 08:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 759C6C4CEF4;
	Mon, 23 Jun 2025 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668809;
	bh=ZG2hqHecU73ektMlHLBv3zCPSuuwC64rbg9ypuyirdM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lAuG8w8zsWKuOyp8AmaMM6+OqHC3KhZcUdoPMvWc3KrgHgyp6cAdpGlSpU1VbZXib
	 DEVSzbNkEjnQk0CsiLXK9EgS2eVsNkUmp+zF2cDsda16uuJaEXutduV8PfttNMlXYh
	 OD9fhrqDb5ZA4LFKySzSISuVfN6Kxf8VLLLndbppiWIYhuUCeIRjyP8v3zf0wTP0xn
	 p3rzaRYq7xrgehcNtTulZuvo5XaLIxhbUKFhImuNU/BXQl7tfO/bu8Y/NGxiet1zLv
	 VrwNDmvR39i+bmwlbvJB2c0IZpLW01zeTJ/I+TJjtPT2P+sGjHpfi0F9D1DoW6kho2
	 Zp93oNFGtoH6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625F7C7EE32;
	Mon, 23 Jun 2025 08:53:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 23 Jun 2025 16:53:29 +0800
Subject: [PATCH v3 3/3] MAINTAINERS: Add an entry for Amlogic spi driver
MIME-Version: 1.0
Message-Id: <20250623-spisg-v3-3-c731f57e289c@amlogic.com>
References: <20250623-spisg-v3-0-c731f57e289c@amlogic.com>
In-Reply-To: <20250623-spisg-v3-0-c731f57e289c@amlogic.com>
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750668807; l=878;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=d96hwpa3CUOhnffR2RHeVgOJAkVgtVaxxsoYbBLIdso=;
 b=4zDUnHtNAHIpCUEIX5b7lnyH7hDVO3RkXJbLgp3LOzeCh7QDJ7oOGgR1lSeDrgJ5LEixoYhJ/
 iejxfCgZwUTAB5p3k9Iw3EToazbUDOq0B1r4pAqNnHkEnGdhash8RKP
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_015330_721929_19B31AFB 
X-CRM114-Status: UNSURE (   8.42  )
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
index a92290fffa16..8225df5ede74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1307,6 +1307,15 @@ S:	Maintained
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
