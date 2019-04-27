Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85D1C4321A
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD204212F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dJ22mMho"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD204212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pSVjdjwn8xhkolX/O2cuBPkN37vImJ53p95dR6kxsrA=; b=dJ22mMhooAkGJkdNhoKUteFt47
	Evxrb/9lqTLxLXUokmHEgr3ARjjaH16kOaGMrzMCCNhUBBNUhBhXLcmn2DBoe+VNZ+iUQze7L0UAi
	a1j8ilejsPwTWgImSGY+P6r93QrCHmrY79GS0DCopbcTi2DE48gd13O8KEA2WTOYWxrz7eFvjt6fG
	SKn9ABrqxFDfMukHVQS2ngD6yIpeN8eZZXlK1kKyhyvO87+qsH1kyIM1dpc0WxXoICxS8fBFvLgLK
	/WpyVLMQ/9DoqBaFvNKLT0Y0tOKBz2/GqYIxUV5YsGBZaswnmA11iBSP5o2aRT8+tBT2jj7N942D2
	LjnCFQnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMqP-0002TO-EU; Sat, 27 Apr 2019 12:54:17 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpV-00014R-FT
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:32 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N1fei-1gegIM1SdE-011xhz; Sat, 27 Apr 2019 14:53:06 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 38/41] drivers: tty: serial: xilinx_uartps: fill mapsize and
 use it
Date: Sat, 27 Apr 2019 14:52:19 +0200
Message-Id: <1556369542-13247-39-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:VtPNlXzPCRVCI3k6aUN/2RTDRVtNySvUetW2m1i45Od16fYdx6y
 LS0k0V6K9tTbj9vRmp5ZCjL/mOHH5UpOiIqa//lNidg8lexGQDtGIijbeiQYs9a5ONTZ41P
 /QJB/7RWi0uO5xDMBNsrF+ru49A7jV2roH/XamiBQrb9q1XduKueamQiuyXwbKmDF6vMy65
 SexEhyAOG2uVr2I4z3nnw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vdDn587xvd4=:4RpbDZcbrZSWSyIEGlsv8U
 0K/I8sTnMUV5V0+BjvOPaxxEwIozbULnFUa3IkYA47OU1n2ZzOGt7QzRwMPMuqMALSKhvyuAl
 t6yxt1msPA6kyUDppcf5bgSpylyoQ+W3C3CEite19ArJ0t2AwR6wilppKV3Jh+KUD0mfjD37s
 puKb7aoMCoZdZ9cOEaWpB8YfmHh2SeNm3SKcsAkE7vcrHhkRch80ahpP21xLnNLrzWFwCiTuU
 WSN3vp3JWGFtDHw/p2jQySYFGI9Vvh91eVlMxXKQnLF8yiehURKGk5Y9GEuaj9RXP5HmHyXjL
 lkZ4wlyKfUEpxD3Tl6j6hawA4nl7XcPNysl3Seys3+VcrP/aydSp4ueltBl6mcp8g5r8Iu5uk
 FkL08ODMZnsQE8pOye6cuMetb4LkUBCKcprXMYP3ryPqZt7eZBS2lqFiNuPM8xsH9a6WEgJYl
 I8UzUK30NOx46sp+1PsMg6yTempKzXES5ap5lEgIV0nJrAM21L0mN5/+t0oEjzTtfatOFX5uk
 M8KVoYNe+W+PKDYsTRSESAgizrPxXk4EkwtRVnV0jmEmUaN3alDd8SqnV0Gu3ROymNZhrZzjz
 UqyzBRlfWbCGoVNw2LXOb1DGrDLQx+dvJriCIMgZ17xzGKlGAboXpbywthlWS4UNNov0IADCk
 lffkQK22QhbX1XOmZDBYc2dE7NUMWkmiM2KbFwEs43p6iiUf7jDM/pMtGNBfUfwU5YV9haj7W
 AFEnEYlgHisqoTzmsKB1b9VQMJVErA9QCIapeg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055322_288777_EF58E5C3 
X-CRM114-Status: GOOD (  11.37  )
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
 drivers/tty/serial/xilinx_uartps.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index 74089f5..cf8ca66 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -953,15 +953,15 @@ static int cdns_uart_verify_port(struct uart_port *port,
  */
 static int cdns_uart_request_port(struct uart_port *port)
 {
-	if (!request_mem_region(port->mapbase, CDNS_UART_REGISTER_SPACE,
+	if (!request_mem_region(port->mapbase, port->mapsize,
 					 CDNS_UART_NAME)) {
 		return -ENOMEM;
 	}
 
-	port->membase = ioremap(port->mapbase, CDNS_UART_REGISTER_SPACE);
+	port->membase = ioremap(port->mapbase, port->mapsize);
 	if (!port->membase) {
 		dev_err(port->dev, "Unable to map registers\n");
-		release_mem_region(port->mapbase, CDNS_UART_REGISTER_SPACE);
+		release_mem_region(port->mapbase, port->mapsize);
 		return -ENOMEM;
 	}
 	return 0;
@@ -976,7 +976,7 @@ static int cdns_uart_request_port(struct uart_port *port)
  */
 static void cdns_uart_release_port(struct uart_port *port)
 {
-	release_mem_region(port->mapbase, CDNS_UART_REGISTER_SPACE);
+	release_mem_region(port->mapbase, port->mapsize);
 	iounmap(port->membase);
 	port->membase = NULL;
 }
@@ -1627,6 +1627,7 @@ static int cdns_uart_probe(struct platform_device *pdev)
 	 * and triggers invocation of the config_port() entry point.
 	 */
 	port->mapbase = res->start;
+	port->mapsize = CDNS_UART_REGISTER_SPACE;
 	port->irq = irq;
 	port->dev = &pdev->dev;
 	port->uartclk = clk_get_rate(cdns_uart_data->uartclk);
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
