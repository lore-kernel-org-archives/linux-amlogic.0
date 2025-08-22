Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA70CA0FEB
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QSDpN6hcmDsNeOGVlRo9Uu84mjJyzaXVKocAVI8nqb4=; b=c0Tv/k1aG0zERw
	onuznDFs/It0x2bq1tAKbolkXTzTuF6mlbV5IAEBEH4oecibrPLhoUEsJcfeJcvHkW3GuMUYAXr2x
	FhqZ1pJcMkx5vk1eub/7eICSn7o00tVxbtIR1QIS9GRc/4oAhcWtZEfgFkYvFMN9vO76dbhAjwm1Q
	J4mlLivV8dXyUbXVfsqRGBjKkFm2YhzCTBLsJvrtuypBOio7rPWXNNwA79oF3LdOe/DFE5vS+tG/q
	SPr8U5rmGY5D92IrhcvdxvKgORmWhDhVaTEBcy27FkJQuatb59vYNphkYIL2Ea3uMn3IaC9TJBlAE
	KvNOnud8Ms3j401MaIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSae-00000002jz9-0nNH;
	Fri, 22 Aug 2025 14:18:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKWo-00000001bnM-0Z6S;
	Fri, 22 Aug 2025 05:41:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FBB643DAC;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4FA4C4CEF1;
	Fri, 22 Aug 2025 05:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755841289;
	bh=SWllvQUuWXUiZ37XKVOHkxwQQPRk+5jHJR1X7QQbqWU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=C5j435qr4Pj8VO0GCMmm/0ypKQMl7HSaVhfYN5xCQH/qpPo9DacK5T5F9oS+M0TKp
	 8H1h8ty/DB1Zkz7xbceBqro39/dRNmgI69ehsKsG3CnUmUpYBejhyMkrChVkcAkJA6
	 eGCVhz+jMl42iemjHiz3QytcNtmJq6AJvRuKAyFbKo7keecwUaG89HqysDFknHZxuc
	 Adet3E4iRgKeRl4k+aFHRnSoMYYQnj7pEJeBZD+xU8KStkZDQ/ypOf9D72AlvSzUIk
	 p+fGI6tNeTGH1Crq4/TXoZAYkjXD72DBKG28qb8qC9krbAhf9PzJgUr5EbCwQV2+XF
	 DsqzeK65yyBEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9EFCA0EFF;
	Fri, 22 Aug 2025 05:41:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/5] Power: Add power domain driver for S6 S7 S7D
Date: Fri, 22 Aug 2025 13:39:54 +0800
Message-Id: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKoCqGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMD3YJc3WIz3WJzIErRtTQ1SDM3MkhMTDZLUQJqKShKTcusABsXHVt
 bCwC3esbIXgAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 "hongyu.chen1" <hongyu.chen1@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755841286; l=1213;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=SWllvQUuWXUiZ37XKVOHkxwQQPRk+5jHJR1X7QQbqWU=;
 b=v6zP1X1MiyNWQVfGhjRcfGOC0lt9iG/FSAbPc+2Df+zqZf0YLjimp7/DcF5ze+DfN5jFWSfkw
 C5A8U4wNBWFDDsajqvt6DFrIfF7N0vlKPmgrOvHh1HqITJru5NZz9yJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_224130_196870_0FF5E5E9 
X-CRM114-Status: UNSURE (   6.88  )
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

Add power controller driver support for Amlogic S6 S7 S7D SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
hongyu.chen1 (5):
      dt-bindings: power: add Amlogic S6 S7 S7D power domains
      pmdomain: amlogic: Add support for S6 S7 S7D power domains controller
      arm64: dts: amlogic: s6: add power domain controller node
      arm64: dts: amlogic: s7: add power domain controller node
      arm64: dts: amlogic: s7d: add power domain controller node

 .../bindings/power/amlogic,meson-sec-pwrc.yaml     |  3 +
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 10 +++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 10 +++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 10 +++
 drivers/pmdomain/amlogic/meson-secure-pwrc.c       | 95 ++++++++++++++++++++++
 include/dt-bindings/power/amlogic,s6-pwrc.h        | 29 +++++++
 include/dt-bindings/power/amlogic,s7-pwrc.h        | 20 +++++
 include/dt-bindings/power/amlogic,s7d-pwrc.h       | 27 ++++++
 8 files changed, 204 insertions(+)
---
base-commit: ffeebf7587f518a3717fad308cf735adbbcaba97
change-id: 20250820-pm-s6-s7-s7d-950f720aac6d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
