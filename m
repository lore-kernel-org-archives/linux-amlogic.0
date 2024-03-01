Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE86C5475B
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2024 21:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clDAPUzd1aX1udnBwN5htZpNlC77F0/xFseyp2GgWnw=; b=fcRtBNjBbZlQG/
	FRJY/gkAh0ZvgQkpp8JicfbK01i21gh71KEOwW2fyIfM6amN23Y+ut41c0k8vfuGL+YbC+Ma5QJo9
	/sklXc9ob32sGDa0B3xGhwQ6GUkllPzDMgMJemQ+15/3LTV/PkU2cB//uE5KC9M9J6XD6bo78YRjZ
	JP3PquGsai5DazicbUQOWZ0fp5LD4d3HaEMIr9Ig/Nu9IJJtLPG6iD8w62sw3ME5/2povlRS2BuYS
	W1hXpL7PaDEm2PyjOTEm5Q86vxQelRIN3N03KdSi7vCtKG7YkbYJ1/j2Esm7NDNebIYS7AhehzaZE
	dypH8/9+mwjUTpyr5O7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgAoP-000000024bl-0VeS;
	Fri, 01 Mar 2024 21:53:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgAoJ-000000024ZB-2BSB;
	Fri, 01 Mar 2024 21:52:59 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709329971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7r1ch2QCFOhprkBXp7qfcKOLIETYbzIerJUqrI061g=;
	b=w/6JWsipW/VNMSxnbJX8VayPbqNtoFevsHC0HxJHEM28w+pOSJYMStG5tGBURutPNa4Uv0
	/Cdk7vy072Gsb8Ga/umkx9aOc0YCPdGtWI1uVIW4fHv+cuPTX57Fn0qo5FHPOagxmzEG9H
	wzlTGQ7okWDu7DSN+rXSTJxBaKZOqMEj34b9ZSeN1/2Ya5YReELIZ0xNy+wJyqWYK/osTF
	SKdHBUN0LXR8q46lK6ct0VxQoC8yzA2yVsnvoKAz1ciiQ20MrQdB7ECNOY+ANq+hSsB1Pz
	yKTTBP7wIDSBkwlrFUr/veUFOkNIpEHSiXAXYsBDnZMqq4NtZIqfB495vBRhsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709329971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7r1ch2QCFOhprkBXp7qfcKOLIETYbzIerJUqrI061g=;
	b=U6vXNia4v+kROl9sdz8uXe84USxD/w5gbTSFDQcdI6uy01AQNDumm3pKag2zc2pDX3elqF
	pAsAVrjwYp95xZDA==
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 04/18] serial: meson: Use uart_prepare_sysrq_char().
Date: Fri,  1 Mar 2024 22:45:17 +0100
Message-ID: <20240301215246.891055-5-bigeasy@linutronix.de>
In-Reply-To: <20240301215246.891055-1-bigeasy@linutronix.de>
References: <20240301215246.891055-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_135255_731177_06123A75 
X-CRM114-Status: GOOD (  12.57  )
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

The port lock is a spinlock_t which is becomes a sleeping lock on PREEMPT_RT.
The driver splits the locking function into two parts: local_irq_save() and
uart_port_lock() and this breaks PREEMPT_RT.

Delay handling sysrq until port lock is dropped.
Remove the special case in the console write routine an always use the
complete locking function.

Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/tty/serial/meson_uart.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 8395688f5ee92..6feac459c0cf4 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -220,7 +220,7 @@ static void meson_receive_chars(struct uart_port *port)
 				continue;
 		}
 
-		if (uart_handle_sysrq_char(port, ch))
+		if (uart_prepare_sysrq_char(port, ch))
 			continue;
 
 		if ((status & port->ignore_status_mask) == 0)
@@ -248,7 +248,7 @@ static irqreturn_t meson_uart_interrupt(int irq, void *dev_id)
 			meson_uart_start_tx(port);
 	}
 
-	uart_port_unlock(port);
+	uart_unlock_and_check_sysrq(port);
 
 	return IRQ_HANDLED;
 }
@@ -556,18 +556,13 @@ static void meson_serial_port_write(struct uart_port *port, const char *s,
 				    u_int count)
 {
 	unsigned long flags;
-	int locked;
+	int locked = 1;
 	u32 val, tmp;
 
-	local_irq_save(flags);
-	if (port->sysrq) {
-		locked = 0;
-	} else if (oops_in_progress) {
-		locked = uart_port_trylock(port);
-	} else {
-		uart_port_lock(port);
-		locked = 1;
-	}
+	if (oops_in_progress)
+		locked = uart_port_trylock_irqsave(port, &flags);
+	else
+		uart_port_lock_irqsave(port, &flags);
 
 	val = readl(port->membase + AML_UART_CONTROL);
 	tmp = val & ~(AML_UART_TX_INT_EN | AML_UART_RX_INT_EN);
@@ -577,8 +572,7 @@ static void meson_serial_port_write(struct uart_port *port, const char *s,
 	writel(val, port->membase + AML_UART_CONTROL);
 
 	if (locked)
-		uart_port_unlock(port);
-	local_irq_restore(flags);
+		uart_port_unlock_irqrestore(port, flags);
 }
 
 static void meson_serial_console_write(struct console *co, const char *s,
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
