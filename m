Return-Path: <SRS0=Dvvs=JX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E546FC433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 10:11:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6E761004
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 10:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6E761004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tSGgjE0gdQ1mymxAsxAmmviCqGk1UOGRlihR2PDIfIU=; b=P5d6r4fdyTmF+EmKG6WZMc+rXI
	DKM+IneNpt1cqB2F/kNXk7Q6rwQ/JCGc0dwEmtVF9Dnt4e/p6IfzuMPuiOoPZPyZ6+OB9HmDrlYbD
	J3bj6GAouAC0yeApgwhH0ENYTNHwvqXo2HDgHJjTVnz+88w0MijujjFPU9WDDweHUs8o+RrYvLfLa
	B9MQ8bELtDQZUPXeCbX8TvkqaTzK+kKpp0KNq2INlvXJLSg/oocnw7+D+96mZPJM4s0l9r2m8t86E
	HHGtOq2lfy9Hs2bIYrBXAfUaGkVtvebFD057LE+WTYKufDnKMUX3xJSHf6W5WWq7EyQ1XRcE0nsH7
	Cs/gZrjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1layDJ-007Niy-Uu; Mon, 26 Apr 2021 10:11:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1layCz-007Ngp-4K; Mon, 26 Apr 2021 10:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0Yyic5TCwmThAqHm5s43eI6EE8ERYdk4+eB7ADZJSQU=; b=mXqNOFAuCGmsjtfTi8cc0SziZA
 fxEGNyWostdBCI1O/B2nhIxL6WR4q1y/ixL/o//Zzr6yf6RjoDOYOW3Rrmo08UfN4MkD0iIf71Jpf
 6sHl5CLdTl6LfSUh1kyhlpyVC0foBJU7o0j2hJWH961qR8B5eG+kGRoVvxp0pRv0sSbpJehWZGkgu
 OEqvIun3uwCH0uHrwMwGKsuh2YIRy4lkqvvLcj8rCTqhCpaWi/6mCUfb7wQtKvyEH79EpE+j7G+c3
 D/iiV/+Pdgsuw9I30rufMZ0a8DuAdjyDuvk9MTCc8POL3LIJSsgSK+mZ18RnAQ6MUn9uWVrVR2KzE
 7K0u57Aw==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1layCw-00Ft5E-GP; Mon, 26 Apr 2021 10:11:15 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1layCo-0003XV-9l; Mon, 26 Apr 2021 10:11:06 +0000
From: Colin King <colin.king@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] serial: meson: remove redundant initialization of variable id
Date: Mon, 26 Apr 2021 11:11:06 +0100
Message-Id: <20210426101106.9122-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_031114_702370_E6EB81F9 
X-CRM114-Status: GOOD (  14.07  )
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

From: Colin Ian King <colin.king@canonical.com>

The variable id being initialized with a value that is never read
and it is being updated later with a new value. The initialization is
redundant and can be removed. Since id is just being used in a for-loop
inside a local scope, move the declaration of id to that scope.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/tty/serial/meson_uart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 529cd0289056..d7f55031b2cf 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -716,12 +716,13 @@ static int meson_uart_probe(struct platform_device *pdev)
 	struct resource *res_mem, *res_irq;
 	struct uart_port *port;
 	int ret = 0;
-	int id = -1;
 
 	if (pdev->dev.of_node)
 		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
 
 	if (pdev->id < 0) {
+		int id;
+
 		for (id = AML_UART_PORT_OFFSET; id < AML_UART_PORT_NUM; id++) {
 			if (!meson_ports[id]) {
 				pdev->id = id;
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
