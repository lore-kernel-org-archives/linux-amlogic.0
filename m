Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210D6C4321B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78B72087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k9AmP4lU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78B72087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i2xogtxCdVH75NHLqv/rz1y/3NCL7dF+72Tt5ANGa8s=; b=k9AmP4lU37ch+VTmIbZLdjQUoL
	E0nEaUcYxO54uX9ygMsY3YmR6hmz9WrLtg1u3anIPGcqm7gudIsJeWq/ay0dxJfz1SSyQ/KPFOm3w
	LvKxCgsiuTnKeanXYUQgK0IqcdYQi/2dWAAdycSnK18OQip5z83mkkIKqLOKqNbSHHb2wgFVuptYV
	4vScN579bFAa+vcHhsNBOdeVw+TuMnQJN4j/2wSwp3Nz68rAHwiFwFItJs/c4iS1J+Os3xGbS40Pv
	11SoizqIBf5LErxhF0mFFHzd1C7ePdaovyQtumQyx2e1XWGekjMKhUYtSbo5mvag6brIQY4ufPXM6
	9KkUMOyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMq7-0001x3-BM; Sat, 27 Apr 2019 12:53:59 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpO-0000sW-G0
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:21 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N49Yn-1gckUf0Xp3-0101lS; Sat, 27 Apr 2019 14:52:36 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 03/41] drivers: tty: serial: dz: fix missing parentheses
Date: Sat, 27 Apr 2019 14:51:44 +0200
Message-Id: <1556369542-13247-4-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:DCKi2YoTk5F832OQUdu63uCQyxtOturAok1rJyvr3Cj1aB4PytR
 39oykOLn/6maTSaugkdLtAO+JW6mtXKXNyEKmjf/LfUX+UrtldHzEn6VJRT6Ai5Wmv6fPJu
 zDbdAsnAWjMsVY/Lfxtu7H3H0VD9b6vzG1KkGY93toXvi1amjf/kUGN1jMaJH9MM+TdtJWy
 6Qq+l2SfPMMVa3xrX3Dhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hCaJcuTMeuA=:EB4ux1IA7Tt2VnO5QHlgjW
 pkbxMpPw2nta4CmIKC1kcgXZ8R3PVqr7ziHZCtHeUGvHHk9Qk9raYRBGZaF5IqaPVm6CNMnxr
 9vty1/D38JGFJJSTwt3NFvurWC70JuBjH/BKAB8yESh6+wLopafjQqQPN8l2KX8SGQjfwv2xO
 TyzFvmsYNx3rtFuVJ/pJ1vV56+pzzVMgAzd7E0EpyYgb7DGVVlUR2LG1dxWjJ2Hof/It2Rmfz
 p9izFHquGUwtbxHeqxGGWvM4ijYINTbcCUZVJjV5oJC9/JYWT730WUlA9JIbF2xjIF7PBRVXX
 kASrSTWn7c2M2sc3c6bB50GRDqBH6dH94gztdOwsPoZ4cj+JQkPM6uX86/TUJ8e4WJY2B5iGU
 HP7+HVB4tQVuFWqAHT2uGAz6varlOIJ5yKrTIJx6feesH62tAViO17zmGulcYNIxOP3eNPMOD
 Hmet1YF6m/ZGilYNo9SR/pjTIMz1EyH8o7eL4CQcuBZ9FwhDFRYTxTY15EVLqHyCvQkPg27Rb
 8uO0aVYpOJ/qo2qK8zbTnZCXXNRXdpe5e3F/ivKBz+b1Oa+zghaMw2mbTc4DrgKSeZzP1LTNm
 teKvpXO2ByNWbSgSgXOBtzriQtZsC2TVemyVqTtaDrQpo+R6tvq8EoDpEQZIo8UeRCmxfnM7Q
 CuTeQ7zz0fUVVIk54pr5H16riYLFpjz7OQg7RqO6kuwjj9BxIwYM6AphowGhGxOWdsrYDcB8I
 YsZWUl7WRUQ4eG9segmrTeI0ta1XPj9nf9dvOw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055315_226634_ADBF550B 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix checkpatch warning:

  ERROR: Macros with complex values should be enclosed in parentheses
  #912: FILE: dz.c:912:
  +#define SERIAL_DZ_CONSOLE	&dz_console

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/dz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/dz.c b/drivers/tty/serial/dz.c
index fd4f0cc..b3e9313 100644
--- a/drivers/tty/serial/dz.c
+++ b/drivers/tty/serial/dz.c
@@ -909,7 +909,7 @@ static int __init dz_serial_console_init(void)
 
 console_initcall(dz_serial_console_init);
 
-#define SERIAL_DZ_CONSOLE	&dz_console
+#define SERIAL_DZ_CONSOLE	(&dz_console)
 #else
 #define SERIAL_DZ_CONSOLE	NULL
 #endif /* CONFIG_SERIAL_DZ_CONSOLE */
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
