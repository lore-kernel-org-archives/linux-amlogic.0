Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A7FC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Dec 2021 20:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Eamju5mOFjh1+bUoMU89GsNL3XH6LNbvQYc4PsuZC/c=; b=sbKbxI9CWvv6pm
	UUQZJElyGh5u6m9/NFBpkmPhIMKF4PgQFTyuYz0IB1Uaw9pyV6erGjX0k3qkpGn5hwCPPRa4NgU86
	+lEb8hoo9LEQwLWUygEsjoMK8b6PRWdblJdJeC4iWb5vvOp9co7V1A6Fb1v8TuxaY7PFMClnNasEF
	syiXL0JNILRP1yqFPboueRUQaPpoVh1+okNhB+zKTgelWWbHVZt3HQPbvssZooUvNaG+sjjz7CGkb
	3nh7StX1YtitvJfE825hGSHFEUZNW/amlc+Le24yX0ufe0N43w/XkFgGb4d0mm52Zw7KvyOq8vvZP
	ztdAwEV4PQQljyYTjVPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myJpd-00CH9w-Rq; Fri, 17 Dec 2021 20:27:57 +0000
Received: from mxout01.lancloud.ru ([45.84.86.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myJpE-00CGzV-LE; Fri, 17 Dec 2021 20:27:35 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 5962720CF560
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Ulf Hansson <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>
CC: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH 0/2] Add IRQ check to the Meson MMC/SD drivers
Date: Fri, 17 Dec 2021 23:27:15 +0300
Message-ID: <20211217202717.10041-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_122732_910777_5AB230D1 
X-CRM114-Status: UNSURE (   6.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Here are 2 patches against the 'fixes' branch of Ulf Hansson's 'mmc.git' repo.
The affected drivers call platform_get_irq() but forget to check for the error
case and blithely pass the negative error codes to devm_request_threaded_irq()
(which takes *unsigned* IRQ #). Now stop calling devm_request_threaded_irq()
with the invalid IRQ #s!

Sergey Shtylyov (2):
  mmc: meson-mx-sdhc: add IRQ check
  mmc: meson-mx-sdio: add IRQ check

 drivers/mmc/host/meson-mx-sdhc-mmc.c | 5 +++++
 drivers/mmc/host/meson-mx-sdio.c     | 5 +++++
 2 files changed, 10 insertions(+)

-- 
2.26.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
