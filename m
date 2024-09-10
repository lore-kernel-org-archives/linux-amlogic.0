Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7288ECE58D
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LA+QUIB3DOefQLg21BSZ7J25quNrRAHLDLxEJkurg8s=; b=iXie1r0Xa/dRM5
	I+Xu87HxkR6VDctmsqkHdXaz1HnrZkTEbuYqwWVTQc7t2ZjlTijQQ4w8O2R/UyYF6SoQHchlkKFsk
	MjOa9Pf4LaiCoarvtsVGI+cbfuiitMuowE4FKVKx0Ps3Qf63sopg/SELkQmIfZodNFsUodWZBAlV8
	4n6ZXyDiZpvAV/+H3e1qAkkbLa90whJodXR0GFNl4p2M8UovLBrjh/bR5Py/0y9Ow9pOF9o6xk88j
	2wJLB2Zlrs+/i5g6imXKqWqE8Rl4dN95Tj+We1WoKU1Vrsaxg40wTEqugmwewPahotinWu/J1QMqt
	+ERhuCkEmq3cER+afcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxtI-00000005CN5-3Lg9;
	Tue, 10 Sep 2024 10:14:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxt7-00000005CIY-48ij
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 10:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 93D185C02F0;
	Tue, 10 Sep 2024 10:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AA0AC4CED1;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725963260;
	bh=a/hFCgDZqsbnUBYLjL3wvxEJ7t4hBd6dwDs0Oy9yB58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZuEm+DELevIWXJ2Zf8m1LccFIPt8g/KDhqEfbaH+OzEr6bqRgsCuTapJhl/oByGpc
	 QU3QpNcszCVdA0nND8qzfEFYmIMdsL9rbuKNMN0+KmdDJRDTE7En6rVLknMTvmTCEi
	 Sa7Ef093fWr6xS2hNCaEwmLLu0TSna1E52tSr2oTSNkTIUSLytYtXdMvvuib2Ut7z/
	 IcOCP1cMqdPqkWVycnExTdgDG/4XXRxOeLKJGiW/4bXza7lhIb6HUf5m5jlJDtqKHn
	 DAnNz1MVrmeNuPj4PV+3glV/FOl4kHHmh7pXzzc6YQnnMxiEJ4Bp5BcybB9MCDKy4t
	 iuKHKdJniLeOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840F5ECE564;
	Tue, 10 Sep 2024 10:14:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 10 Sep 2024 18:14:20 +0800
Subject: [PATCH v3 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
MIME-Version: 1.0
Message-Id: <20240910-rtc-v3-3-1fa077a69a20@amlogic.com>
References: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
In-Reply-To: <20240910-rtc-v3-0-1fa077a69a20@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725963258; l=931;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=dltl4Bg5cOWUNAG/8WRhVbXcztZ3rrpVcPR+gcSx/Bg=;
 b=MoifP6YCT9C3dZb9ivv6Aih+92TQ3cZzveLbNoTe8lEriWxZ2A1dOQh8bQFEFlFlAj5pPFVwV
 JabA+WhbHG8AZ2PTY6eI1RzEQcve+obFcYNY4nCd+s5gR5USV5Tdxpy
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_031422_152862_F6A2761D 
X-CRM114-Status: UNSURE (   9.01  )
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
