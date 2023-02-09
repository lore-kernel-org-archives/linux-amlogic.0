Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89442C05027
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 11:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXDv128yRv9bKEtJoa3JRQ2dAeXGtAMeyvWKefqFYQI=; b=s6YeCaSrFlr0Vu
	D6q0pHy50PTC8OGr6W4dMvsUEhzLdEjZgNTgT8u6XodXjbgf/rTpqPDGk/QoPof4WIVYlqKZmNgXa
	/beLQH8/TkUzbVBcCy8k+4L6Xb8CzUA5WeGB6KnDCFpwzNv9scxZu3WuO8dbYZ85maf25FF3pIXpW
	RQl3tNOcLQKjKYUCP7bIvlKSTeAFt5N9bG0SzmaN6EjXWEX5GQWcYi5Rijd/3SYRmorYTYZLzhIyh
	0+np00mz3n5zuiT6hqX+hEbb4v3ZNvM4Y0gnRQqGAlrWC7dz5a2nuVrtNqS2WBHsgwww1p4Ja192O
	b7KSv0VKwFAPOFfLt5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5Vg-001OeB-1c; Thu, 09 Feb 2023 11:54:40 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5VR-001OXs-SM; Thu, 09 Feb 2023 11:54:27 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 9 Feb 2023
 19:54:14 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: Jianxin Pan <jianxin.pan@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, Chris Healy <cphealy@gmail.com>, Chris Healy
	<healych@amazon.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	<linux-amlogic@lists.infradead.org>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] arm64: defconfig: Add Meson DDR PMU as build-in
Date: Thu, 9 Feb 2023 19:54:03 +0800
Message-ID: <20230209115403.521868-3-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209115403.521868-1-jiucheng.xu@amlogic.com>
References: <20230209115403.521868-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_035425_938402_0AC182BF 
X-CRM114-Status: UNSURE (   6.26  )
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

Add Meson DDR PMU to defconfig so that build errors are caught.

Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06d..9fefe659ade7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1296,6 +1296,7 @@ CONFIG_ARM_DMC620_PMU=m
 CONFIG_QCOM_L2_PMU=y
 CONFIG_QCOM_L3_PMU=y
 CONFIG_HISI_PMU=y
+CONFIG_MESON_DDR_PMU=y
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_IMX_OCOTP_SCU=y
 CONFIG_NVMEM_MTK_EFUSE=y
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
