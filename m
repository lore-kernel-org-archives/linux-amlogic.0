Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310F7C4321A
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBD3D2087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mi/Wol/U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBD3D2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2FYG5HuX7lrY4L16fv5scbiPc5lY/g1Dr7pt3vaAv7I=; b=mi/Wol/USGcSufD3qEJLG8qtBp
	DpKEHsLw54T+EF6XS80EZaq5Pn7lZVfVRGq9zApyfpIOKUFIEifXZqgIMdBGMuxRyjD9ik9Mc5kex
	l2PpbtAUrDld6bbJDX5TY59XfFmqo2L5fD42QPQvfbM1eluZB/bQmhWul6c4+zKAOfr8T7xAQmN4Q
	1D3Pj7VbpTokCvhk5Phg3aDPbdsw1k7uxDx3ogtjPkPpMll44z5pF8/FfY2c5t2JWqNzt6aA8bzro
	v9gU5pXsA7s6s4nE8lI58YH+H2IctXvpGsRMtMrGN6tZTwvAIAzqbLcs9obn6wL4UjAlYNOVux/Sc
	QonY7RNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpE-0000gT-Iu; Sat, 27 Apr 2019 12:53:04 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpB-0000ce-VJ
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:03 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M26iv-1hMqrC03Wz-002bb0; Sat, 27 Apr 2019 14:52:43 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 11/41] drivers: tty: serial: sb1250-duart: fix formatting error
Date: Sat, 27 Apr 2019 14:51:52 +0200
Message-Id: <1556369542-13247-12-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:+TzVLpdAa88s4dLeOAxWyCsRhuc7KaUZKNLF0uRArPgYGfXSgiH
 Cc2vSSp3JHtH5Dh6TLARezDiIKDVv/NGSmiD/ku3dsWnfWOrtj1Cfj89ntRTXnSvx6PBKgU
 dt1TF7JLIo4mMJjyQ165GdSVmp05k1wOQx9x8rk+vVa9HNdzhgzqFQ2ZALqM5/sIDIRqkKv
 zpE63Uj8QixDSf+H4FfiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7g9mhemK6rI=:1LPea258+vT4cAu97il+UN
 TYKyF9QgPM9xIe6eeQ+jqNe+ggTMLP2Rvkb4j9U9H13Sg9CbVn9iCrF0YTfPvJy7st+0uGM2f
 /PnRFLO51z8114t2VgJaesPsgRavI/NG+JNJ7cfluxQbMaKGaxT6e/dwtJS7cjr1YYOomqA9G
 muP/UMza5Daoz+E60ichje3jvTqidA4lMSrQ9I6Hysh36D1wrMiCAB8NPPvc4nrvaddLXw6wB
 HgP1Z28SnAs7F4M7EpvU2+lQ0OTn37drJgeY/1adD+7p8We3CNEdSVlX/aiCHuYBdhtA0tQwk
 twP7c4eBkXAVXYagsNKW0MBlXlR0YW7fkDWkpusCcqgmZEquGN++8kKA5YtYIXEcg1RQIv5ze
 3sYNpA8wkk3GGqvshvtdRF4i/V07DDAKHjaZS4rViY5umoot7vu2gWZ7lETfiboO5z0AnKiNW
 ArDLwY9233EwB1kTHm54Jg7uCj6lRpmvrGsTo5d38MvHFBdNvTBRnyt2zIMulQmJtFb8kkKio
 L5hyUjTr2yPVMh8mBfg+gFuzlyXZDST0R3Rsxc16FX1n2PRzy15BgDF5VnY6vbekE+syIAUnQ
 CpezAGe8b0r4rC4XtzPF0T9lR/Pa1UWdKJH90iIIxuaLrBDvbaT57qKKbgRo+xkQtguPp6B41
 KnkPQ1UxL/FbNXzdFiuI/RSGrM7xIsl18lv3lduPbUzSCDcj7qPBT1cj99Wx+ndaKrPl0OaXi
 dDx2xwj2GagsyKcjT96JpuA4aPHWH0zLebvvLA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055302_313235_C4F8DD0D 
X-CRM114-Status: UNSURE (   9.57  )
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

checkpatch complains:

    ERROR: space required before the open parenthesis '('
    #659: FILE: drivers/tty/serial/sb1250-duart.c:659:
    +	if(refcount_dec_and_test(&duart->map_guard))

Just add this missing space to make checkpatch happy.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/sb1250-duart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index ec74f09..0023ed0 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -656,7 +656,7 @@ static void sbd_release_port(struct uart_port *uport)
 	iounmap(uport->membase);
 	uport->membase = NULL;
 
-	if(refcount_dec_and_test(&duart->map_guard))
+	if (refcount_dec_and_test(&duart->map_guard))
 		release_mem_region(duart->mapctrl, DUART_CHANREG_SPACING);
 	release_mem_region(uport->mapbase, uport->mapsize);
 }
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
