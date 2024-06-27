Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD900C3064D
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 11:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l4XfVE6Dd866Kzsfg2CPcuHaNxYx9yhnkj3fBN8F0fw=; b=hlhPILheCK0Po0
	je+RsO1slI6ZES2LQTGCf81yOcWIAjnu2kUyWY7luRkLwsDCKCCvurAa+qyrM9QhEekkysgcsuYdz
	1J3IMMkIWJ6fpNUOi+4oK61snxzvnrFsLUwdgr8nH+mYt2HSM4aUY4nif1uN6uYxDkQyPxzuVdHQ9
	d1Sixa0tfwDmlefS2iMAFRjnpMKesIjO/nAvKj9xmU+/yNdely+9YjFC0GlAqfQCLYAQQtEVkhHvp
	e/zsL77GGtbmTh9Q5ecLySfDlLNRviinCJv8PRmt3/v63g0WrKM0gAGD5AC2b6HKX7Esr/rDCGgbu
	EXdQgvXPHWYnbCfHQREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnbe-0000000AD47-3wP0;
	Thu, 27 Jun 2024 11:48:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnba-0000000AD1y-1Pr3;
	Thu, 27 Jun 2024 11:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D8DC61E38;
	Thu, 27 Jun 2024 11:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10092C2BBFC;
	Thu, 27 Jun 2024 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719488875;
	bh=AqD5B1YwKKcyDo3GQkyVkWdvVTiw9+IO2HJ8jhgiwXg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=C+aRYENFOb70zRetwZW4SnFF98c0MplACowYbw9Osk7cHGoATN5z/rwpVhuXly0cm
	 zyeh6LUWGheUe6rdk/9LRtoDRFohVHO1Z0vZP1qnXuYN8D4Ghu/UHmli4COYz8YaN8
	 Bym0jYOdCnrnY4JZg08fceQ+Lua6FE/g25cWVUUV8yyNSNdycnZlRu8GvLsOkfpIWU
	 x1QznlY6k2YW0Ppt5JrBipp8O1EdA1mPjNgpk3Nn8OXx9MtlDtOl36iqjadRZpP7Ve
	 lKuni1Fgfgj35PBPM6zuAm0b73l+LPi5KQEps3UVa+cYRcX8hfbFMuvNeYmvG51c+Z
	 dRguAVdkC3W4A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF043C2BD09;
	Thu, 27 Jun 2024 11:47:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Power: A5: add power domain driver
Date: Thu, 27 Jun 2024 19:47:50 +0800
Message-Id: <20240627-a5_secpower-v1-0-1f47dde1270c@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGZRfWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyNz3UTT+OLU5IL88tQi3aS0RMOkJJOkFMtkEyWgjoKi1LTMCrBp0bG
 1tQCowTXwXQAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Hongyu Chen <hongyu.chen1@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719488872; l=823;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=AqD5B1YwKKcyDo3GQkyVkWdvVTiw9+IO2HJ8jhgiwXg=;
 b=iM+aPix2qzXLnRj/1pDN59/EkAe3QJF+Tz3mKsuS3Hbh+C4AwVDZWkg5pc2ye1/YjyydTBabq
 Kqa0jzqnk6JDSOiEKPf7bPE7bH1eDzABCrpkfF3m06l0LbrPn2cqaIH
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_044758_612433_59EED085 
X-CRM114-Status: UNSURE (   6.06  )
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

Add power controller driver support for Amlogic A5 SoC. 

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: power: add Amlogic A5 power domains
      pmdomain: amlogic: Add support for A5 power domains controller
      arm64: dts: amlogic: a5: add power domain controller node

 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  1 +
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 10 +++++++++
 drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 26 ++++++++++++++++++++++
 include/dt-bindings/power/amlogic,a5-pwrc.h        | 21 +++++++++++++++++
 4 files changed, 58 insertions(+)
---
base-commit: cc647e931a249605e06d3eb3ec89a7e320fc28cc
change-id: 20240627-a5_secpower-bfa1bb4bd9c4

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
