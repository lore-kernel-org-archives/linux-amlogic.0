Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E044EC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OPd7oL5nuaRgwHoKI6MYEDA5PmpBj1OuGJ2Vtz6V0Ug=; b=sVh6uXIfzvslde
	ZCotsAGV+T9Tlef0hwlvii9/RoUrCljq3xlFESTaaDjB6QluJeKwhqkW5eG44IcvyAw7cscuSMTcc
	wi0vIKjoPU6QyrnErG3pwWiiujfKJGmFTf5tGEXv8bxyQBbMb/mo+auxvCCi4NN0Z5AdieXjq/WfG
	CCEIY2IfAxGue7E01HVVFAQpnLMjFyBqBOGiAcBbHV41WgjvK4cfMd9DBA9hyjqNDtioQiVmdRgJ4
	aKzKqitd3I8INg48HehziHXszAsxapAOOP7jVLRbPwZtTZ46frunpwElBHngXrYrZ9ue/GjDCbs89
	ZgIvMfoDZ+OIlCLCwouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncikM-00FQ0W-IJ; Fri, 08 Apr 2022 07:09:30 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncikB-00FPxu-TG; Fri, 08 Apr 2022 07:09:21 +0000
Received: from droid04.amlogic.com (10.18.11.246) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 8 Apr 2022
 15:09:11 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>
Subject: [PATCH] arm64: dts: remove cpu compatible "arm,armv8" for s4
Date: Fri, 8 Apr 2022 15:09:01 +0800
Message-ID: <20220408070901.26446-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.18.11.246]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_000919_978323_2E36E742 
X-CRM114-Status: UNSURE (   7.33  )
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

Amlogic s4 device is already applied, but cpu compatible 'arm,armv8'
is only valid for software models, so we remove it.

Fixes: ac4dfd0d1d35 ("arm64: dts: add support for S4 based Amlogic AQ222")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index bf9ae1e1016b..480afa2cc61f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -13,28 +13,28 @@ cpus {
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
-			compatible = "arm,cortex-a35","arm,armv8";
+			compatible = "arm,cortex-a35";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 		};
 
 		cpu1: cpu@1 {
 			device_type = "cpu";
-			compatible = "arm,cortex-a35","arm,armv8";
+			compatible = "arm,cortex-a35";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 		};
 
 		cpu2: cpu@2 {
 			device_type = "cpu";
-			compatible = "arm,cortex-a35","arm,armv8";
+			compatible = "arm,cortex-a35";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 		};
 
 		cpu3: cpu@3 {
 			device_type = "cpu";
-			compatible = "arm,cortex-a35","arm,armv8";
+			compatible = "arm,cortex-a35";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 		};

base-commit: fd86d85401c2049f652293877c0f7e6e5afc3bbc
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
