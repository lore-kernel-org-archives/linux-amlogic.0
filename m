Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948CDC433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:37:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C06208C7
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 19:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="faxw0tSP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1SQS24JO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68C06208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fd6JAp06k8yz28b1t+2n+cwyc1NusR7mwZY04uqj96M=; b=faxw0tSPQjR7eDVoUzkxA1MSqT
	Mg5cTaBPDfOpjDdMm13piw4zyVtvSLhv4/MCsRK5YAnfDXUO7OBmc3TJlidIxt53fyTym956ALWdJ
	fdi/Y7mz9L9cC8Dbjt/fBQVanK2YV/9t8+D5gFjUWPEAK7ah4EI9mAcR8SfbaUEgO2Phsi5FwxxnL
	1HMa2cV5b40qubqFnRmg2DF3w2b506W1SIRqnIHJL/WSegxLIvJSYTckmHdMycISyxHj1w7cvMgX0
	5pl8NrvFP5XkWwIK6bmrzUTp/rMgwDymdpzZ2sh42BuEdN12na2BDP+YX1b8YvfCh6Zq/EtJ+pwZQ
	dY7hMZVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDYZL-0007tU-43; Wed, 02 Sep 2020 19:37:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDYZJ-0007so-6f; Wed, 02 Sep 2020 19:37:18 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C98D20773;
 Wed,  2 Sep 2020 19:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599075435;
 bh=+D+HnNz+VrpzF30cgOx0/44g3rIEaRFahWzOaAq0owE=;
 h=From:To:Cc:Subject:Date:From;
 b=1SQS24JOeFsx1iasRvSrQ65PxPvLq6dmxeYcepsSK8GUZGbyMelZlNIuhySqBfDi1
 bZnWylzcAirhjbBZDld4bG3srPaamgSu01Z9UN63UVkQ+oyD8xxZqDnIHmEKgpQ6sm
 zRt4WFNvhEsJP72JojS+Lha8JOjX4CQ66Zr6jp9Y=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Jun Nie <jun.nie@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [PATCH 00/11] mmc: Minor cleanups and compile test
Date: Wed,  2 Sep 2020 21:36:47 +0200
Message-Id: <20200902193658.20539-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_153717_393688_7EB48273 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Set of minor cleanups.  Patches requiring more attention:
 - 6/11: Testing and review would be appreciated,
 - 11/11: I build tested multiple architectures but not all and
   definitely no all possible configs. This one could sit on the lists
   for few days so 0-day would try it.

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  mmc: bcm2835: Simplify with dev_err_probe()
  mmc: davinci: Simplify with dev_err_probe()
  mmc: dw_mmc-zx: Simplify with dev_err_probe()
  mmc: jz4740: Simplify with dev_err_probe()
  mmc: meson: Simplify with dev_err_probe()
  mmc: sdhci-brcmstb: Simplify with optional clock and dev_err_probe()
  mmc: sdhci-of-arasan: Simplify with dev_err_probe()
  mmc: sdhci-tegra: Simplify with dev_err_probe()
  mmc: dw_mmc: Simplify with dev_err_probe()
  mmc: sdhci-of-sparx5: Use proper printk format for dma_addr_t
  mmc: host: Enable compile testing of multiple drivers

 drivers/mmc/host/Kconfig           | 42 ++++++++++++++++--------------
 drivers/mmc/host/bcm2835.c         |  4 +--
 drivers/mmc/host/davinci_mmc.c     |  5 ++--
 drivers/mmc/host/dw_mmc-zx.c       | 11 +++-----
 drivers/mmc/host/dw_mmc.c          |  9 +++----
 drivers/mmc/host/jz4740_mmc.c      |  5 ++--
 drivers/mmc/host/meson-gx-mmc.c    | 16 ++++--------
 drivers/mmc/host/sdhci-brcmstb.c   | 12 ++++-----
 drivers/mmc/host/sdhci-of-arasan.c |  7 +++--
 drivers/mmc/host/sdhci-of-sparx5.c |  4 +--
 drivers/mmc/host/sdhci-tegra.c     |  7 ++---
 11 files changed, 51 insertions(+), 71 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
