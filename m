Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD6AE67496
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Nov 2024 02:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LA+QUIB3DOefQLg21BSZ7J25quNrRAHLDLxEJkurg8s=; b=ePXiOtvAnyLg0Q
	x9m+PsdNf6RVE+h8/T19E6F+nnLv7hUGO5FnGfmdgMjyYIBKkyPs2SeJAw61MzzTnLMEHtsEdkWAA
	bSqrP0MOUdB4ukzcduJFoOGn2LLr8yd11ntR/w3Ya+ccJP/0xPlvTmTN3F48zaQNf1FHbmOpOnWsj
	IYa8UYxTKhEXVHOTs/1bQ1AjhJtaVvNwQPqsPz6F4k/9zFuo72pAA6YAj5nI9+7CssaK2m3b3+wnj
	OKfpYkLLy1Vcqnv/B2RBR4rtde5fKjkSxkvEN5cdjH2JIOGEIPgSoKgALCsMMXYfNs6PDj+CepkJP
	taVGs25mdL3Cjh25lMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6h43-00000005W1L-33ns;
	Fri, 01 Nov 2024 02:07:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6h41-00000005W0J-1ZJb
	for linux-amlogic@lists.infradead.org;
	Fri, 01 Nov 2024 02:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B225A43282;
	Fri,  1 Nov 2024 02:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D4CBC4CED7;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730426819;
	bh=a/hFCgDZqsbnUBYLjL3wvxEJ7t4hBd6dwDs0Oy9yB58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fUg32nlVkfFHvxMTs/wTO79y1W3ZgfW5c2+DBISY/VyM/SoS+bCeVXDu7LEkSlj26
	 ZWLZORcBXV6TzkHiS7Vzh0Jvlm5Dhqu9LWZwD+KXYF1f1xBzJU12reP6Y4sloUVhgT
	 QUuwnxYVb3qaNi4db3osbnLiyVocIYEDz819F7vvv87F1CWD4fNJwrEw0xbzaV+XXB
	 BTA0Sl62SWuCdU+kvNocl3P8xnr+L3GDqsdcIYHMRauW2d6exdOupY3XWh+MB8DXpH
	 LPFTeAN6aMPdt9OLnPwwGi18XfWeD+tdlQNBlEe5yXgMpYE803uISxMmwR0L0kP28B
	 giE5LSG3usvxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DD7E67498;
	Fri,  1 Nov 2024 02:06:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 01 Nov 2024 10:06:49 +0800
Subject: [PATCH RESEND v4 3/3] MAINTAINERS: Add an entry for Amlogic RTC
 driver
MIME-Version: 1.0
Message-Id: <20241101-rtc-v4-3-14e1ed486ed8@amlogic.com>
References: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
In-Reply-To: <20241101-rtc-v4-0-14e1ed486ed8@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730426817; l=931;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=dltl4Bg5cOWUNAG/8WRhVbXcztZ3rrpVcPR+gcSx/Bg=;
 b=HzHLxTTw3Lvqis+Z3qX6pmogtTEP9P67Vk8W6UTuNcUXd4MPJzBuKmmzn7hAnoT3wuiKDrJzW
 ziXW2peqiFCAlmF8lRtOzry7v2EWMaUDThQBl64psRiYIiXIkr+HV5C
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_190701_518414_FE37A853 
X-CRM114-Status: UNSURE (   7.91  )
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

From: Yiting Deng <yiting.deng@amlogic.com>

Add Amlogic RTC entry to MAINTAINERS to clarify the maintainers.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..f595715eb3e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1163,6 +1163,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC RTC DRIVER
+M:	Yiting Deng <yiting.deng@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
+F:	drivers/rtc/rtc-amlogic-a4.c
+
 AMPHENOL CHIPCAP 2 HUMIDITY-TEMPERATURE IIO DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
