Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C14EC10F0F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:17:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE0B82147C
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XIYKjfZJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="04eKJU8k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE0B82147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lt8ccHsu5I2CB4rTMBexEbPv/V2GW8g3gBveYXKLA3U=; b=XIYKjfZJacMYzy
	uLNP9HeaYjlp3RhnHBUquMkm8/fX0SHPqwzhioZYGruFVaqtKc6gprbqmG5jeZqxB5m98pBPWyNjp
	HI9DU7GKsTnqrn7TiOw6G17oHW6zjPjti9ZtQ11F52xsAyfBCrj4dPTZAjAp0c90y/IWgSo8zv52V
	SPmaj9FfxXykehEooCjRfZzGXnuOFCAAsLMckGdlxvXUNeYTaD06heGh4XOFFvpSxpgTrifwJs/bN
	YbVtAdSSfr3HaF4lPc1h2v1LWL7OjabDS/hhr9AlKmkL25fy3FdXakrwZafVJtT6LvOUgB4E1XVg/
	+e1sz8CmnG993m4Wzt3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC0NR-00042d-VF; Thu, 04 Apr 2019 11:17:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC0NO-00041M-G5
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 11:17:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id 4so2571229wmf.1
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 04:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Odl+BlHOl89gYqbuLHE+EoC/KYuALb6tw6QfepUIT6M=;
 b=04eKJU8kbtEi4rb3BzhbkVfaLESgNx4lIrBGCYD5MKfK6D6p05j831uZ/o+oK+j9Cu
 tLFBXfttZnVixncynWvQoKYHs7OfWMLGB42AfBrSJzQv6aHWNU8YPkGHh2C5SPMh48w4
 RBHvdnhISSY1RmYDmjpXljZc7FrVIgqbCzU+lBDV74HKN6cuWQ9lteSh6+8sEZEc7WOl
 tn+UOUy11egdtiORRIkuS9HMI1V3GU+qudeok3JDJoX5uOpw0RDDcoFvKHaJQLdfIYRP
 fQw4qdRg7KQ7QIuJ/iwIe3FXs9F4kRb3tHf4qT/sva5gOXDKrPBDnOlUmY4AiUARCNT9
 Jszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Odl+BlHOl89gYqbuLHE+EoC/KYuALb6tw6QfepUIT6M=;
 b=LcXSRZFjn0h4nKKHDT6y5q2QiHWC8T1oEv/My2UFJ4MB0UB/aUkTM9qGqN7q+tX62i
 NQdIGTPgZr3obMm7kRM6RMLowF3q9PIpa6dQ9sNDfKLlAw0sPAOSaH3bm8qD5OPgNbSM
 gKqAfhtCOSpw9NweSA+I4lLog3rgqQU/2hPaiYib3AJ1U/ZjV3GBJYGdonntV7OP6TO5
 UO4Wd7uLT59NXVwcWVA8drDt4/r5cOokaEegzWB3xdVLufA7ySGYnH53uDThpHCQ3Z8W
 vraCGsJ/3h9/9D4q4GTNex1aaWGEeyBeBrMQ10LqxExQ2MYb5hc3SIF4Do01/5gdQb8X
 a8XQ==
X-Gm-Message-State: APjAAAWk2EJPzKbnNS2BEieLxe3N8AxtkpCb5yNPdmyAW6Br0m8r//XD
 wcGEHcJiJ0hQO7yhgsEEgrypwQ==
X-Google-Smtp-Source: APXvYqzhk/y2OvfsCjD7gSTW96CXJ2TGczTmODHjJSN87fBXF9s9EitMGeTGHopwjsoXlilycuyFAA==
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr3905707wmt.10.1554376664375; 
 Thu, 04 Apr 2019 04:17:44 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id z23sm9024771wma.0.2019.04.04.04.17.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 04:17:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/6] ASoC: meson: add g12a SoC family support
Date: Thu,  4 Apr 2019 13:17:27 +0200
Message-Id: <20190404111733.28705-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_041746_575817_87A4D650 
X-CRM114-Status: UNSURE (   9.17  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic g12a SoC family audio subsystem derives from the one found
in the axg SoC family.

To add support for the g12a in the existing elements, this patchset deals
with following differences compared to the axg family:
 * fifos must set an initial start address within the buffer.
   The fifo pointer shall be reset to this address on startup.
 * frddrs may now play on up to 3 output interfaces simultaneously.
 * tdmout formatters need a different signal skew offset.

Jerome Brunet (6):
  ASoC: meson: add g12a compatibles
  ASoC: meson: axg-fifo: add g12a support
  ASoC: meson: axg-toddr: add g12a support
  ASoC: meson: axg-frddr: add g12a support
  ASoC: meson: axg-tdm-formatter: rework quirks settings
  ASoC: meson: axg-tdmout: add g12a support

 .../bindings/sound/amlogic,axg-fifo.txt       |   4 +-
 .../bindings/sound/amlogic,axg-pdm.txt        |   3 +-
 .../bindings/sound/amlogic,axg-spdifin.txt    |   3 +-
 .../bindings/sound/amlogic,axg-spdifout.txt   |   3 +-
 .../sound/amlogic,axg-tdm-formatters.txt      |   4 +-
 sound/soc/meson/axg-fifo.c                    |  34 ++++-
 sound/soc/meson/axg-fifo.h                    |   2 +
 sound/soc/meson/axg-frddr.c                   | 143 +++++++++++++++++-
 sound/soc/meson/axg-tdm-formatter.c           |   6 +-
 sound/soc/meson/axg-tdm-formatter.h           |  11 +-
 sound/soc/meson/axg-tdmin.c                   |  16 +-
 sound/soc/meson/axg-tdmout.c                  |  29 +++-
 sound/soc/meson/axg-toddr.c                   |  53 +++++++
 13 files changed, 286 insertions(+), 25 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
