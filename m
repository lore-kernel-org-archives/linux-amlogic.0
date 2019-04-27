Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927E8C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67480212F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cRmDswLi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67480212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=80Ma5CGfVYSHhblpWvUSqq82cdqCwpIQxwpqJMEYHAo=; b=cRmDswLiJaDqN7FROiA4PZqKoY
	UAg1/kPf01XiFy6FqJbO7Lqt0tU70qAhfUf28rfsip3dSGCpw8xJze3aE8fheznfpXgEvARadCZz3
	K3dNNvmYPuSl3zXJblKyfBnnTHRntKcHdhe9V+IH+QH4P8naKtQ03bqDIIolA4Bfc9pigzxd8ZKIX
	vcOQp1ojFjAWa17O7/Ta5tEMuaIsxIWwxT4dty0zlidsuF9s/oawXXP4kjcoDv3kj6OEYHasAmvf/
	PExEc2KtMbhmKoj4ugi4Cg8+Uet/4fy4tTJymdIk4f1h6Da1BiIok4wBBptdrqcDVcSc9HL3vU7S2
	UjXtEnSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMpu-0001cR-01; Sat, 27 Apr 2019 12:53:46 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpH-0000i5-0E
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:13 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MhUDj-1gqW7b2XwJ-00efAG; Sat, 27 Apr 2019 14:52:52 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 22/41] drivers: tty: serial: cpm_uart: fix logging calls
Date: Sat, 27 Apr 2019 14:52:03 +0200
Message-Id: <1556369542-13247-23-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:6aniEe4uJcRcav5vVBfcQ4eLLFWMnqJpVC4vZyHJ9k0A6q/tn4j
 b9DaJRxToUGOhrA8XctR1mPhJ0cf7Ttk2f4rAFWNa3fQjR7YkDeiN3gu2Jkvl9J2LTCqub4
 NvWiLxdxAxFk1k9fhSMKs/EVAw4rvAGYukqY9dkQaz94+MijAkIVPXhEPMgivLXBUM8RACd
 PwxeoNLw6M7rcZKmGYaIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N1DUCAE49ps=:6Bg3z0yKDfbQlfXN15vFTK
 CTXF7meBLhT1JFynkQvUub9OX3IH9Bn32MIrPU8KLGYu6xRSeeA/dv91WkdRSMB7jw5SdnYVU
 fBjG6PFdpn1ZcQEzJLT3TEeYtiWNSTLLl+4olsmK1UCkntdxplgAH0cDkdqmRgBilTze2f7jr
 yBoEZG/TEYQR7XOcNbzuiDrCWD/QGrMzOWGTHHxN6hQnmtCwz+JPrD3eLuSj6f48WAbwJlu1K
 pi/aO1K/KDfh6fTnuKZ0wM3Rb509RDLGyiAS7Cq+EOzAfOuLQxlXxNmBU5uwfoZgNkZxLYXpG
 LPA/VLSRM/do906EdV+T1SaqdwZoEwTB6TVOR/PMF8++fRGUXP3sVtBYfhqAlLOACU03kvhhT
 e/wSlyyyIN8laaJjGbbkdmkScfnBHzxwxJJodWsT5x5MW2YdlWf5dVUI7B1fkpyAn6/3PpqHZ
 ozeZgeiwzfUj7KdmcDro0QCipy3GpQh1Tv0Iq+NqFHBGaR3f3+cWDo3rDMych8CTVLTU1AVkl
 2XBtChbNXe7808yH+6vrzkl8qad8i15gpT2NYBjcGcbsv3Jx9SO4lLao075F0ckBuGvZ+84La
 SuMyHOhs9Ph85GauTE8NUiSCnd851q5KRXd3jTIJoWrjlcnFeyNg6Od4d+LNqplzy1QwNfHER
 tVlWKkonlZQPDNV6mjAqvrxGHz/Dn/JPo8WteDheS37jlKM3nioX2QkQZjoaYGONVb+tRUXJw
 jl1OMAdapLwDVC/umjMb4TaNPso7exnunktkrQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055307_535404_15D4159C 
X-CRM114-Status: UNSURE (   8.60  )
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

Fix checkpatch warnings by using pr_err():

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    #109: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:109:
    +		printk(KERN_ERR

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    #128: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:128:
    +		printk(KERN_ERR

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    +           printk(KERN_ERR

    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
    +           printk(KERN_ERR

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c | 6 ++----
 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c
index 56fc527..aed61e9 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c
@@ -71,8 +71,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
 	dpmemsz = sizeof(cbd_t) * (pinfo->rx_nrfifos + pinfo->tx_nrfifos);
 	dp_offset = cpm_dpalloc(dpmemsz, 8);
 	if (IS_ERR_VALUE(dp_offset)) {
-		printk(KERN_ERR
-		       "cpm_uart_cpm1.c: could not allocate buffer descriptors\n");
+		pr_err("cpm_uart_cpm1.c: could not allocate buffer descriptors\n");
 		return -ENOMEM;
 	}
 	dp_mem = cpm_dpram_addr(dp_offset);
@@ -90,8 +89,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
 
 	if (mem_addr == NULL) {
 		cpm_dpfree(dp_offset);
-		printk(KERN_ERR
-		       "cpm_uart_cpm1.c: could not allocate coherent memory\n");
+		pr_err("cpm_uart_cpm1.c: could not allocate coherent memory\n");
 		return -ENOMEM;
 	}
 
diff --git a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
index 40cfcf4..a0fccda 100644
--- a/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
+++ b/drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
@@ -106,8 +106,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
 	dpmemsz = sizeof(cbd_t) * (pinfo->rx_nrfifos + pinfo->tx_nrfifos);
 	dp_offset = cpm_dpalloc(dpmemsz, 8);
 	if (IS_ERR_VALUE(dp_offset)) {
-		printk(KERN_ERR
-		       "cpm_uart_cpm.c: could not allocate buffer descriptors\n");
+		pr_err("cpm_uart_cpm.c: could not allocate buffer descriptors\n");
 		return -ENOMEM;
 	}
 
@@ -125,8 +124,7 @@ int cpm_uart_allocbuf(struct uart_cpm_port *pinfo, unsigned int is_con)
 
 	if (mem_addr == NULL) {
 		cpm_dpfree(dp_offset);
-		printk(KERN_ERR
-		       "cpm_uart_cpm.c: could not allocate coherent memory\n");
+		pr_err("cpm_uart_cpm.c: could not allocate coherent memory\n");
 		return -ENOMEM;
 	}
 
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
