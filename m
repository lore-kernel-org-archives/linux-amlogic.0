Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A97C25B67
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Oct 2023 11:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H4DxAp/ckrLzJMx2aWBLKXuOzohuNLYJqNai/0LUs6E=; b=jClIKbzMCoHz/I
	n1pf9Aux62tdJVDul6otihEryLR/EGfUw9nuZOK48En2YXDVOe1dqDyIO+uIT2rfgF0Fd5dXLjhMq
	BQo9cxvOCW6qptbiBsJzl5gfyLNTpVrY/TDj5IEGWprC1EbHzVj4X/j9zGpV7RvUZAKWDKaXdtxY0
	oD3Gv9gYvOmzjTzLyqCGO3gi+Godx5nBp/i6xUS/r1ljd1UxsVaVnkA37gZ2RA3ZHnWCYvIwdqXeC
	gOdsuKVpe0YpZfleCaCux+i1CZ2KbwF/dlOyH+BeovtmwMih9u33HJHbxdPw8ZqS6lcYJ2/kcX2t/
	0jqdVZjXqrXMXCERAqUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwKZ9-00GGQa-2J;
	Fri, 27 Oct 2023 10:59:47 +0000
Received: from [58.32.228.44] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwKZ5-00GGP1-3A;
	Fri, 27 Oct 2023 10:59:45 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 27 Oct 2023
 18:44:25 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V3 0/3] Add watchdog support for Amlogic C3 and S4 SoCs
Date: Fri, 27 Oct 2023 18:43:55 +0800
Message-ID: <20231027104358.342861-1-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_035944_016984_7B8D9A0F 
X-CRM114-Status: UNSURE (   5.78  )
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

Amlogic C3 and S4 has the same watchdog controller as Amlogic T7.

Changes since V2 [2]:
- Modified yaml document to ensure that dtbs_check passes.
- Added a patch for watchdog support for S4.

Changes since V1 [1]:
- Added C3 compatibles, with T7 compatibles list as fallback.

[1]: https://lore.kernel.org/all/20230925090641.1185942-1-huqiang.qin@amlogic.com/
[2]: https://lore.kernel.org/all/20230926055512.2355390-1-huqiang.qin@amlogic.com/

Huqiang Qin (3):
  dt-bindings: watchdog: Add support for Amlogic C3 and S4 SoCs
  arm64: dts: Add watchdog node for Amlogic C3 SoCs
  arm64: dts: Add watchdog node for Amlogic S4 SoCs

 .../bindings/watchdog/amlogic,meson-gxbb-wdt.yaml    | 12 +++++++++---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi          |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi            |  6 ++++++
 3 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
