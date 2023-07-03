Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EF0EB64DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0gbyC0yMEL9KfkOecQYYcfhKm9yZRuHFLmf8EWIO2Y8=; b=ixpT1RKtyZCddx
	cf3EkXisAFufXSAqiMNgNBK/ONzSqtCeg2HWwBmdFMmaWZKTOdnx6Ug8etUEEWG/ZFDHBN8IWjMy8
	4ysGb8CF3PIPPdm3lUOjvf4R8+tuXRMl0QkAe/DtqXUPptZ977m9om15o0EoBBdtWnraAAZyGIN4W
	2jfaacR29eyPStg4vXIbjmMDFAHP2SGQKh9Y5yyh3i/O4ATXxlHhhA5Ciq9jUxB6tCcgqKnxNF0lI
	3Samg4fK/ieve26GyhvmAZpbp4+j6j26p3S6AzLWcdb++ljig1UGXPRgAo7gDvVXRnBunI6x4lAPr
	CQ9EiqFz2ZuAQgEcz2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFuS-009wPx-24;
	Mon, 03 Jul 2023 09:31:52 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGFuQ-009wNg-18;
	Mon, 03 Jul 2023 09:31:51 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 3 Jul 2023
 17:31:44 +0800
From: =Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH 0/3] Power: C3: add  power domain driver
Date: Mon, 3 Jul 2023 17:31:39 +0800
Message-ID: <20230703093142.2028500-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_023150_384783_68B6D73F 
X-CRM114-Status: UNSURE (   7.44  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

This patchset adds power controller driver support for Amlogic C3 SoC.
The power domains registers can be accessed in the secure world only.

Xianwei Zhao (3):
  dt-bindings: power: add Amlogic C3 power domains
  soc: c3: Add support for power domains controller
  arm64: dts: add support for C3 power domain controller

 .../power/amlogic,meson-sec-pwrc.yaml         |  3 +-
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi   | 10 +++++++
 drivers/soc/amlogic/meson-secure-pwrc.c       | 28 ++++++++++++++++++-
 include/dt-bindings/power/amlogic-c3-power.h  | 26 +++++++++++++++++
 4 files changed, 65 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/power/amlogic-c3-power.h


base-commit: 057889cb4244096ea5abcbe76ffd4d311c3078fe
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
