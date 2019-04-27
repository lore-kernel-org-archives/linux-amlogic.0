Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C1AC43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9AF2087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P2+S2kam"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9AF2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ubnjwNBLPMFyoIvvzSD+tdcKgIDgsdfyP1S0qImOC1g=; b=P2+S2kamFsdwJTmp0qiyKj3sMC
	LX01XJs5V0JSSe8g1l1UlDDiJ9ekQbFwHHVOdW9kvE522L95zR5CTBZLYMUlUgBvWK+1Xfoo/J9z8
	fIKv6cwMWzYyPeG+C5EABn2l+UqU8ujMr/radVIbM4ye5M9DgLhPn/LKAf/q0bXW5FdnsNW7prUrV
	8gw3nyP0fL/gJk7gpwqQXSMAvqb9Vr/KwQ7YsF6TentdjGQOiX1EYc1xAsb/CgtkaC4rRMWfGVeZT
	ToR5Lpromqgg3kx77gnUnGaj5RcPvvmHSLKVMvUe6/Naw5pERVpVUgVSf8ffzJ1Zs/IyBPRLLKMpV
	dKzPuqwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMqF-00029J-Gh; Sat, 27 Apr 2019 12:54:07 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpS-0000yg-2v
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:27 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MrQN5-1gyFsf3szn-00oX3M; Sat, 27 Apr 2019 14:53:03 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 34/41] drivers: tty: serial: zs: fill mapsize and use it
Date: Sat, 27 Apr 2019 14:52:15 +0200
Message-Id: <1556369542-13247-35-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:zrosD3Ctd1aN0WpNLZFdBQRFBUqXoIn/vK59RCWQKALAv5BYyI4
 9kJucz8qp+qIXGcy4ADN10n35GRjp3t1bSz4vEWOCzwTB2XXPf6KteeGAGjUQOXvDMkS0PQ
 658vUta/FNmxhHolnomtYwAm2hVQ/rOsExC3aVbcC7iO/2z6qctqb6KpFVlO6xFHXeNXPYX
 uBsZgE/3Ekcv4Nsi/qZwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KnnLQy5706A=:gIgNJYKZQ0XX/Ytqsc0i9l
 bO959YYz3tQkDcQX9QxnzOyjTiFB/3SnL7a7mJdfscylb4xtGHF8Ca2lF8toEGlTpepvNcD3u
 q/nsSq3YpagbmFV3RJP2FJ/a2wQNOTqtWrSn+Ufbk9PrY32lTsg4mgCiZO9RqXb+brgG0nr2n
 Unu5ZCbwOe1acSlJpHBna7JK0aBs8joJUkEL5bpTEBWeI48Dc8g1QcvV0uqUZe+jJPsvzn1Ce
 Rnsl20iqnyzitjrjZfcx6FuQcgrl90qwOG+9YwdtmHccYrKEwajsy3HckhHj7rku74x5Ywflx
 BR87rv5gnTMhhBsEQzFH5O3difC0EM84nSVZPBYoUuF89P6kZOPb/xIZQ0LsxmK1gsMErE4dQ
 gx+9MlNWwLAXqu3sprHSY4/2xEGB8DHEuwAaXAMrUtor6pjz2Re9KLfccujJOlMajeuIRjpvF
 qo6KNZtJYTmo92CsNrFbLhlfpwe4p9buJtiSD6VKuR7jpSnaSzvsH9ABS+KrwTEXS5bLdcxh+
 KA2vMAnfKXFDjsAYCtwLTRxipwutt02+Mg8cBfkEWgv+zNLGcwuo/nJ5L2sFStzZ/an6FlLZE
 Tzr7OlPZ1IudTpdEBKsseNSAzGMAYrmLd7VO4zG51pJXR1m0v9GkHScPVfPNH/U16MXifWOPE
 tdmwTQgV8IzEHnsE0FAGdgn+4ZTd5KO4C7SjNOnQIrB9ZALsDjCUkquoAbC+GFHLy+BKJngcs
 f9jIJFLQ2qoU1mBkm9+zlp5VRMtCHESx7VgPjQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055318_934593_CA4B3365 
X-CRM114-Status: GOOD (  11.69  )
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

Fill the struct uart_port->mapsize field and use it, insteaf of
hardcoded values in many places. This makes the code layout a bit
more consistent and easily allows using generic helpers for the
io memory handling.

Candidates for such helpers could be eg. the request+ioremap and
iounmap+release combinations.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/zs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/zs.c b/drivers/tty/serial/zs.c
index adbfe79..ab432ba 100644
--- a/drivers/tty/serial/zs.c
+++ b/drivers/tty/serial/zs.c
@@ -986,14 +986,14 @@ static void zs_release_port(struct uart_port *uport)
 {
 	iounmap(uport->membase);
 	uport->membase = 0;
-	release_mem_region(uport->mapbase, ZS_CHAN_IO_SIZE);
+	release_mem_region(uport->mapbase, uport->mapsize);
 }
 
 static int zs_map_port(struct uart_port *uport)
 {
 	if (!uport->membase)
 		uport->membase = ioremap_nocache(uport->mapbase,
-						 ZS_CHAN_IO_SIZE);
+						 uport->mapsize);
 	if (!uport->membase) {
 		dev_err(port->dev, "zs: Cannot map MMIO\n");
 		return -ENOMEM;
@@ -1005,13 +1005,13 @@ static int zs_request_port(struct uart_port *uport)
 {
 	int ret;
 
-	if (!request_mem_region(uport->mapbase, ZS_CHAN_IO_SIZE, "scc")) {
+	if (!request_mem_region(uport->mapbase, uport->mapsize, "scc")) {
 		dev_err(uport->dev, "zs: Unable to reserve MMIO resource\n");
 		return -EBUSY;
 	}
 	ret = zs_map_port(uport);
 	if (ret) {
-		release_mem_region(uport->mapbase, ZS_CHAN_IO_SIZE);
+		release_mem_region(uport->mapbase, uport->mapsize);
 		return ret;
 	}
 	return 0;
@@ -1113,6 +1113,7 @@ static int __init zs_probe_sccs(void)
 			uport->flags	= UPF_BOOT_AUTOCONF;
 			uport->ops	= &zs_ops;
 			uport->line	= chip * ZS_NUM_CHAN + side;
+			uport->mapsize	= ZS_CHAN_IO_SIZE;
 			uport->mapbase	= dec_kn_slot_base +
 					  zs_parms.scc[chip] +
 					  (side ^ ZS_CHAN_B) * ZS_CHAN_IO_SIZE;
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
