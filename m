Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01415C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C610C2087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gz19xgi/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eKX4+VN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C610C2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/SRPoBCiDczt2cjFJRX0q+KcOAvaK/5+2l5ZSSLnTk4=; b=Gz19xgi/IOwBhwV7ZMFuzbuPsn
	6nuiLFsvz3uDGmnGK18IoNeI4Hb7plv0oxaFQ+Qvlk1k1tB+VE15QGtXLjW44zxxPFpUzDtgZwFEV
	QRoT6WWRMgwraaomGUhFu3dJeqtb6/MHjlmT3AiHw/HQ39VNLlQ+0PYdNjcDvUynB8t7UCfC1bU6U
	bWS3c3mOVrWSAGt2mOOdFeHsYbF2xtsPS92QSomnLKkzzq/Bh6UdSQ9kzvOvGzDV2cFt8S1nd4zW0
	lNTXNCWu5ITL4Dlhfwfj71Uei/09Ai8Cvda5mPI/vBNSpXtnrkjn//8rQp7k7CwlTKr6vVRtzc7bS
	d0431Iug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMqA-00021g-8n; Sat, 27 Apr 2019 12:54:02 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpZ-00019f-Cx
 for linux-amlogic@bombadil.infradead.org; Sat, 27 Apr 2019 12:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NOzag9oMYj9Xp7HY925v11cr0nYMMG/wKDRJlq9qGVk=; b=eKX4+VN339xNwDeRAr7y2F3cG
 to8YgPEScn1EM/ElFVhLDyFLc1TJBQgDJkmS3j907xGDRNywqoL+tmkKeeZCyolVZlRyntY1jgSwZ
 36qqvrcbXbcxtJdLcuL3WO8ztl8cMhSDl1HjOZcIDtIiEDVekXut9D87S6bmFKqjm3hxGFlGgVgQD
 pImcOLbKpXFlef86FNW4QHlJ7Uv8HJZj8sVA1vtnNOWBipk1b4A+kVTnBw4py/cazvov+QztyT9/2
 XnVsuilizCTdWip6YVQ9slRZKjeWfSSmS4h9Xt9yU7eePftyRn3c29m9uUIZNmRpoN/kEQL43rIvy
 5VwOMcCWg==;
Received: from mout.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpW-0007WX-4c
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:23 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MkYkI-1gvnxz13qI-00m5Hh; Sat, 27 Apr 2019 14:53:01 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 32/41] drivers: tty: serial: 21285: define's for address/size,
 use mapsize field
Date: Sat, 27 Apr 2019 14:52:13 +0200
Message-Id: <1556369542-13247-33-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:iEBl2J6aAGLLUc9gogjDel0fwK0zVBbCxPMJri/kbrSvb4JuRHU
 dMsu93FBbFwYR3dVsvSh1GJRRBnAct7RY5hnMruBRe4fpX6nxjKZ9a+FpdnPqRrRM6zajm/
 Zq6YvL7nAO4JNPTwsDDpcQwnA8FjfR6ICxhwBH3BRm3TCq2eoup3NR3iCqD3FNfZx2YoV/8
 V7MKmxrrBIOBo3I5f/tZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:93H1R8MWbBw=:L0iEwc82GdE63pmHfe42UJ
 uQxcquJ3aJJ6XagNGb5FGjO5+Gqe68JZ8HjPmYBjEOz5cxI4FLV/EJb7ZZ4Y1tXzXf5DmiQSC
 jGjsnJLejS63nxXDdr7G7i1Zj87ckczGHw41+SX07w+g0h/OAWEt0Qrpak9E3FGVcyCmOJUga
 hbJqfS4JWsxbQKPw0kI+6ndJ373LfddM/MvpO5ERt4PzWcL0nspeNGet1o9gjCpUiD9nD01IT
 LngnK8dwnJOnWh/L/7tvgAI9bkBVglAvI4stcaTG+KJ02WFNPNQFlNn3tX8C/qqQ5ZoVtoH0o
 YCOtR2V+YpRlbPmvzp/NjwosNMtNg2fr2A4+jp8LVxwHEKx6Mq9rQlCZn48cIitdMCx3u2/8Z
 M7TdoDS9GdEIVYbxytMx9G63q7f34b7N4ovgVOyFqvk3EDR2ExnMQfI79d7+TthEa+OBHcMcP
 hc4ClgExLQpo/LSINaPEy9n00HY/I4d9QypfPIAHCYEnzCXADrc2t7CkhNepxTht+kgBJy1aS
 k+FsfSyCi2AqYiHiKoYXXuhlarg3YviDJeu51x/XK4YxQPvIdXBJG5P2i6KsHaq6UluVDG+QC
 qwQkfxB5GTCJhn4IkC2Um1VQxHSOGPJji3pBLjiV5pKZyGr1odsWyJb3bcwdxoTWDC1A0LmcQ
 VW3zq4vScC/GbUtZRrJdUVGJaF/4tuvZLntHWr9wcbtii+rDlmL0H4rk+Paj3NeMT503X+vXM
 zHbXOUjI7IZVWOStZx9mJyCXuG7NHF8tiIcRnA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_085322_388474_97FA3675 
X-CRM114-Status: GOOD (  10.16  )
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

Instead of hardcoding raw numbers, add define's for the mmio address/size.
Also fill the mapsize field and use it on mem request/release calls, for
more consistency and allowing generic helpers to be used later.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/21285.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/21285.c b/drivers/tty/serial/21285.c
index 32b3acf..90684cd 100644
--- a/drivers/tty/serial/21285.c
+++ b/drivers/tty/serial/21285.c
@@ -27,6 +27,9 @@
 #define SERIAL_21285_MAJOR	204
 #define SERIAL_21285_MINOR	4
 
+#define SERIAL_21285_ADDRESS	0x42000160
+#define SERIAL_21285_SIZE	32
+
 #define RXSTAT_DUMMY_READ	0x80000000
 #define RXSTAT_FRAME		(1 << 0)
 #define RXSTAT_PARITY		(1 << 1)
@@ -305,12 +308,14 @@ static const char *serial21285_type(struct uart_port *port)
 
 static void serial21285_release_port(struct uart_port *port)
 {
-	release_mem_region(port->mapbase, 32);
+	release_mem_region(port->mapbase, port->mapsize);
 }
 
 static int serial21285_request_port(struct uart_port *port)
 {
-	return request_mem_region(port->mapbase, 32, serial21285_name)
+	return request_mem_region(port->mapbase,
+				  port->mapsize,
+				  serial21285_name)
 			 != NULL ? 0 : -EBUSY;
 }
 
@@ -354,7 +359,8 @@ static int serial21285_verify_port(struct uart_port *port, struct serial_struct
 };
 
 static struct uart_port serial21285_port = {
-	.mapbase	= 0x42000160,
+	.mapbase	= SERIAL_21285_BASE,
+	.mapsize	= SERIAL_21285_SIZE,
 	.iotype		= UPIO_MEM,
 	.irq		= 0,
 	.fifosize	= 16,
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
