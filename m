Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E371EEB64D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 06:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K4BKtW46q3okx2ZnHKEbIA59fkdpNvflPKOrQUlgGYI=; b=b4C8ckQWG2ac7A
	FE+bb6OIMdWGixFscE+CCb5uCT8K/IsZwVySRNkPfsofoghzMr/t5FyeZnYxAOsQfcjCEEboEeS20
	Z7pipF8FnL/53lCqOD2oIgpP/g5fN7nGM1UIitKaxXTOsDVqwrh5NSaaTZuzJuZpLFMskeRNe/dJ5
	UVlz6ll/VohhbsZGGOjG4uwE6ZplaVsc0Zdq0wtXeuol6ZKxIwZIFq/y36llVygEv4zuHz/IN8dfJ
	WcNcs2O9yhrxPFD2B1DrfR2J8cENu65QC1hkr9MESeiXMceQcSf7uROGquiTarFyErgynQxW7DRxG
	vtgUNmg3rHzy+XmWRSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrJf-00DPiR-2T;
	Wed, 21 Jun 2023 06:27:43 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrJa-00DPga-1J;
	Wed, 21 Jun 2023 06:27:42 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id CCFDA5FD5E;
	Wed, 21 Jun 2023 09:27:29 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687328849;
	bh=N2HRZnWuvFjvEElOdblUUvxZovm+tssABjlPdSEQ1WM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hN0tzJhH2qasFeA6SfHCf7pXBx6CYdMSBhCmy3P2KWknggaeJYEhHsLStd1QZ6uls
	 YlY7D3nEDd/VBXC4oaqaC4hN6ZtxqT870i0f2l47VtClnpoM2O+oliKdQAH9kfDZ+I
	 AHuNX+my6yiqGCW+fcztAMD3crBuEVtHciXbn0FLtRxVLqa/KJPtHPmwSuEGJ1lVQ5
	 2q3raK2F5PpUC7gP9mY4RR9YSCMKsO8UxBfIbPDOXbw2gz8rcGjpiA4wQFw+gXLj+5
	 JpypYdP8j2Ie/V3Jc6InZDvPPD0+E7XMOfilMQmTya6/6hOA5efRk6EEs+bNWysrqM
	 m32OameZJ3d3w==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 21 Jun 2023 09:27:27 +0300 (MSK)
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>
Subject: [PATCH v1 0/3] meson saradc: add iio channels to read channel 7 mux inputs
Date: Wed, 21 Jun 2023 09:26:07 +0300
Message-ID: <20230621062715.455652-1-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/20 23:30:00 #21539802
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_232738_993571_622B9496 
X-CRM114-Status: UNSURE (   7.02  )
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

From: George Stark <GNStark@sberdevices.ru>

In meson saradc channel7 is connected to muxer which allows to measure
inner sources like Vdd, GND, several Vdd dividers. This patch series
adds independent iio channel (with label) for every chan7 mux input.
Mux switch is handled transparent for clients.
This functionality can help debug\test\calibrate adc.
This code is relevant for all supported amlogic soc families

This patch series was created after discussion [1], [2]

[1] https://lore.kernel.org/lkml/20230524000111.14370-1-gnstark@sberdevices.ru/
[2] https://lore.kernel.org/lkml/20230527214854.126517-1-gnstark@sberdevices.ru/

George Stark (3):
  meson saradc: code refactoring
  meson saradc: add channel labels
  meson saradc: support reading from channel7 mux inputs

 drivers/iio/adc/meson_saradc.c | 165 +++++++++++++++++++++++----------
 1 file changed, 115 insertions(+), 50 deletions(-)

-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
