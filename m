Return-Path: <SRS0=Q7B6=2D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8349C2D0C9
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 00:07:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9758B206E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 00:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kG4qaIYo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.b="QiGJQwcg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9758B206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=arista.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B1kKjbfLWWIW9F/oXAeiI61hsxaVkIDmq6/+DjBMkKU=; b=kG4qaIYo/Cwb3q
	ZCYYJeuesOZPTjOkk9qJ9EpLnZ8XbMJHXHedJ6ZBPI8PzlQCipCgaeLtrWtBojHdFCKYJRYt1tVJD
	PhOYjj0fLh8hcafn8DTAvNgd7dcABSBztna5IHwUfxexNuw1jWPrTo4QF+NzmMjceGGHHidEC7d/D
	MEMJxzH1uY64lGYNoYbbiN6wDiWy9dJLitb8dwt7kw5UDZe6G+0SlyrEiSN7t5BS+xpESaE1KijWS
	9TOr/H1vkK8TaFAlYweNmaX7rgZTuwfBKu5DEjJ2KuTXrvm+HXpIWsM1juXAwb9w6DSElg99ZAoAR
	mELQgTQRAQvkMy4jrOSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifYUI-0003eN-Kd; Fri, 13 Dec 2019 00:07:18 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifYUF-0003df-Tw
 for linux-amlogic@lists.infradead.org; Fri, 13 Dec 2019 00:07:17 +0000
Received: by mail-pf1-x441.google.com with SMTP id l127so398483pfl.1
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Dec 2019 16:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iu0ZHHpoa2S/s6q/AtXMlnqWAKo36xS0Mhh784bJZYw=;
 b=QiGJQwcgFjSO13uljrEjqqU+gpfX3BearZe4cm0Fxz712OWJLfhV+4r3S4IUDdWe3q
 jUzW78JOYK/SejZUC83GaY+As3EQc2QE6jEMaRVazPojdNRbpnNI1BDGsdQSBZUNTLIf
 l42Fn7f++Ak+1t/Eso6neZ1309/jr9t/hERGHDFs3hJ4VPixZQ7WRmV7HwqQCtGGK8/M
 ZKoNcqnpS08Pt/533IO03qs9PMh6saC3HiQpwVwJ8CEJ/8KH7x+2mU1loULtGwAV7VT1
 4+B9pU9gbNIVphVxkpEsZjw3pEtNKf160OHo1klwj3oEy7rWBaxYyHGHQoEMvkKrGnMy
 piQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iu0ZHHpoa2S/s6q/AtXMlnqWAKo36xS0Mhh784bJZYw=;
 b=rUS+aPssO1q8RKRKfzoD+3B/KLToreEgB87Y4ZOxDRenocGoVyUtH/ui03/+UqUyzy
 hzNCfI5aYEH4XyYrlhFPxQ+CYtSWgJOuiro6teiQzMENQMvDkuNmThf6/xtxcLVqnY35
 4/LQDjfcsY32fHMX7xQrnAmjMo2i5LRHVSOqT6TwN9+4mGaLZDa4gdvLD+cH94/hHnkA
 eP9ZU/0ZeW1XhFZfb/MXUP4Ki75k4c6vRFLKYEZGJgRPkVaKHtdcfZ1oUm3eAvV5rUrd
 mO7E+EfDQjxqR33jZciwct7d3gKGzenGuWtadKgSL3cMiTC0thLFKi10O0BHetBKMkGp
 AzEQ==
X-Gm-Message-State: APjAAAVSEsUVnv/Qyc7t0cM+D7PcpfyTqFtIThWjZ7B0tlKwIL76nWFw
 mjziZWy6Kh5eUixbsMz4BohtWQ==
X-Google-Smtp-Source: APXvYqzCsSFyDW1VNoPiCFbPpjDPM2JXmKeMPce+jSVN1BtS0JF+BuC7yZV1+AcEYKFQ0q0Fv4jYJA==
X-Received: by 2002:a62:e50d:: with SMTP id n13mr5086768pff.201.1576195634578; 
 Thu, 12 Dec 2019 16:07:14 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j38sm8317647pgj.27.2019.12.12.16.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 16:07:13 -0800 (PST)
From: Dmitry Safonov <dima@arista.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/58] serial/sysrq: Cleanup ifdeffery
Date: Fri, 13 Dec 2019 00:05:59 +0000
Message-Id: <20191213000657.931618-1-dima@arista.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_160715_977618_EDDA2B71 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>, "Maciej W. Rozycki" <macro@linux-mips.org>,
 sparclinux@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Kees Cook <keescook@chromium.org>, Vasiliy Khoruzhick <vasilykh@arista.com>,
 Alexander Shiyan <shc_work@mail.ru>, Dmitry Safonov <dima@arista.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Russell King <linux@armlinux.org.uk>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Joel Stanley <joel@jms.id.au>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Orson Zhai <orsonzhai@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Kevin Hilman <khilman@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Michal Simek <michal.simek@xilinx.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Timur Tabi <timur@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Patrice Chotard <patrice.chotard@st.com>, Tony Prisk <linux@prisktech.co.nz>,
 Richard Genoud <richard.genoud@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vineet Gupta <vgupta@synopsys.com>, Baolin Wang <baolin.wang7@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The original purpose of the patches set was to add a way to enable
sysrq on a uart where currently it can be constantly either on or off
(CONFIG_MAGIC_SYSRQ_SERIAL), see the last patch:
  "serial/sysrq: Add MAGIC_SYSRQ_SERIAL_SEQUENCE"

But to do that, I had to add uart_try_toggle_sysrq() and I didn't want
to bloat serial_core.h even more. So, I did cleanup by removing
SUPPORT_SYSRQ resulting in a nice diff-stat and lesser ifdeffery.

Most patches are one-liners, I decided to keep them separated per-driver
to let reviewers easier follow the purpose.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Vasiliy Khoruzhick <vasilykh@arista.com>
Cc: linux-serial@vger.kernel.org

Dmitry Safonov (58):
  sysrq: Remove sysrq_handler_registered
  serial: Move sysrq members above
  serial_core: Un-ifdef sysrq SUPPORT_SYSRQ
  tty/serial: Migrate aspeed_vuart to use has_sysrq
  tty/serial: Migrate 8250_fsl to use has_sysrq
  tty/serial: Migrate bcm63xx_uart to use has_sysrq
  tty/serial: Migrate 8250_omap to use has_sysrq
  tty/serial: Migrate 8250_port to use has_sysrq
  tty/serial: Migrate amba-pl01* to use has_sysrq
  tty/serial: Migrate apbuart to use has_sysrq
  tty/serial: Migrate arc_uart to use has_sysrq
  tty/serial: Migrate atmel_serial to use has_sysrq
  tty/serial: Migrate clps711x to use has_sysrq
  tty/serial: Migrate cpm_uart to use has_sysrq
  tty/serial: Migrate dz to use has_sysrq
  tty/serial: Migrate efm32-uart to use has_sysrq
  tty/serial: Migrate fsl_linflexuart to use has_sysrq
  tty/serial: Migrate fsl_lpuart to use has_sysrq
  tty/serial: Migrate imx to use has_sysrq
  tty/serial: Migrate ip22zilog to use has_sysrq
  tty/serial: Migrate meson_uart to use has_sysrq
  tty/serial: Migrate milbeaut_usio to use has_sysrq
  tty/serial: Migrate mpc52xx_uart to use has_sysrq
  tty/serial: Don't zero port->sysrq
  tty/serial: Migrate msm_serial to use has_sysrq
  tty/serial: Migrate mux to use has_sysrq
  tty/serial: Migrate mxs-auart to use has_sysrq
  tty/serial: Migrate omap-serial to use has_sysrq
  tty/serial: Migrate pch_uart to use has_sysrq
  tty/serial: Don't check port->sysrq
  tty/serial: Migrate pmac_zilog to use has_sysrq
  tty/serial: Migrate pnx8xxx_uart to use has_sysrq
  serial/f81534: Don't check port->sysrq
  tty/serial: Migrate pxa to use has_sysrq
  tty/serial: Migrate qcom_geni_serial to use has_sysrq
  tty/serial: Migrate sa1100 to use has_sysrq
  tty/serial: Migrate samsung_tty to use has_sysrq
  tty/serial: Migrate sb1250-duart to use has_sysrq
  tty/serial: Migrate sccnxp to use has_sysrq
  tty/serial: Migrate serial_txx9 to use has_sysrq
  tty/serial: Migrate sh-sci to use has_sysrq
  tty/serial: Migrate sprd_serial to use has_sysrq
  tty/serial: Migrate st-asc to use has_sysrq
  tty/serial: Migrate stm32-usart to use has_sysrq
  tty/serial: Migrate sunhv to use has_sysrq
  tty/serial: Migrate sunsab to use has_sysrq
  tty/serial: Migrate sunsu to use has_sysrq
  tty/serial: Migrate sunzilog to use has_sysrq
  serial/ucc_uart: Remove ifdef SUPPORT_SYSRQ
  tty/serial: Migrate vr41xx_siu to use has_sysrq
  tty/serial: Migrate vt8500_serial to use has_sysrq
  tty/serial: Migrate xilinx_uartps to use has_sysrq
  tty/serial: Migrate zs to use has_sysrq
  serial_core: Remove SUPPORT_SYSRQ ifdeffery
  usb/serial: Don't handle break when CONFIG_MAGIC_SYSRQ is disabled
  serial_core: Move sysrq functions from header file
  sysctl/sysrq: Remove __sysrq_enabled copy
  serial/sysrq: Add MAGIC_SYSRQ_SERIAL_SEQUENCE

 arch/powerpc/kernel/legacy_serial.c         |   4 +-
 drivers/tty/serial/8250/8250_aspeed_vuart.c |   5 +-
 drivers/tty/serial/8250/8250_fsl.c          |   4 -
 drivers/tty/serial/8250/8250_of.c           |   4 +-
 drivers/tty/serial/8250/8250_omap.c         |   5 +-
 drivers/tty/serial/8250/8250_port.c         |   5 +-
 drivers/tty/serial/amba-pl010.c             |   5 +-
 drivers/tty/serial/amba-pl011.c             |   6 +-
 drivers/tty/serial/apbuart.c                |   5 +-
 drivers/tty/serial/arc_uart.c               |   5 +-
 drivers/tty/serial/atmel_serial.c           |   9 +-
 drivers/tty/serial/bcm63xx_uart.c           |   5 +-
 drivers/tty/serial/clps711x.c               |   5 +-
 drivers/tty/serial/cpm_uart/cpm_uart_core.c |   9 +-
 drivers/tty/serial/dz.c                     |   5 +-
 drivers/tty/serial/efm32-uart.c             |   5 +-
 drivers/tty/serial/fsl_linflexuart.c        |   8 +-
 drivers/tty/serial/fsl_lpuart.c             |   9 +-
 drivers/tty/serial/imx.c                    |   7 +-
 drivers/tty/serial/ip22zilog.c              |   7 +-
 drivers/tty/serial/meson_uart.c             |   5 +-
 drivers/tty/serial/milbeaut_usio.c          |   5 +-
 drivers/tty/serial/mpc52xx_uart.c           |  11 +-
 drivers/tty/serial/msm_serial.c             |   5 +-
 drivers/tty/serial/mux.c                    |   5 +-
 drivers/tty/serial/mxs-auart.c              |   5 +-
 drivers/tty/serial/omap-serial.c            |   5 +-
 drivers/tty/serial/pch_uart.c               |  12 +-
 drivers/tty/serial/pmac_zilog.c             |   5 +-
 drivers/tty/serial/pnx8xxx_uart.c           |   7 +-
 drivers/tty/serial/pxa.c                    |   5 +-
 drivers/tty/serial/qcom_geni_serial.c       |   5 +-
 drivers/tty/serial/sa1100.c                 |   7 +-
 drivers/tty/serial/samsung_tty.c            |   5 +-
 drivers/tty/serial/sb1250-duart.c           |   5 +-
 drivers/tty/serial/sccnxp.c                 |   5 +-
 drivers/tty/serial/serial_core.c            | 123 ++++++++++++++++++++
 drivers/tty/serial/serial_txx9.c            |   5 +-
 drivers/tty/serial/sh-sci.c                 |  10 +-
 drivers/tty/serial/sprd_serial.c            |   5 +-
 drivers/tty/serial/st-asc.c                 |   5 +-
 drivers/tty/serial/stm32-usart.c            |   5 +-
 drivers/tty/serial/sunhv.c                  |   5 +-
 drivers/tty/serial/sunsab.c                 |   5 +-
 drivers/tty/serial/sunsu.c                  |   5 +-
 drivers/tty/serial/sunzilog.c               |   6 +-
 drivers/tty/serial/ucc_uart.c               |   2 -
 drivers/tty/serial/vr41xx_siu.c             |   5 +-
 drivers/tty/serial/vt8500_serial.c          |   5 +-
 drivers/tty/serial/xilinx_uartps.c          |   5 +-
 drivers/tty/serial/zs.c                     |   5 +-
 drivers/tty/sysrq.c                         |  16 +--
 drivers/usb/serial/f81534.c                 |   6 +-
 drivers/usb/serial/generic.c                |  10 +-
 include/linux/serial_core.h                 |  92 ++-------------
 include/linux/sysrq.h                       |   1 +
 kernel/sysctl.c                             |  41 ++++---
 lib/Kconfig.debug                           |   8 ++
 58 files changed, 238 insertions(+), 346 deletions(-)

-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
