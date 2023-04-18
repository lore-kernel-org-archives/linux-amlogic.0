Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8040C6FD18
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Apr 2023 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9VkYuPbkwEnZbFqFge+eeXiHyixlug3h43s4ZO0SFjM=; b=hUV2SBUoMcMucr
	hs+bijgbIbb4yz9Jr7OdNj/M+wai73F0U34HooKsCN9KWn8adtPMkxcrR2TM6vqTDfgHYGe1D6fyS
	1lOIPYeEBVgNGJ/pqERuhOZBLyXBNIUG1SqzmSlxWYlxhvDJg0jToZyUkyArlE1gTRuICiVb2mOE7
	MTV0Z48VragpgAvazpocIokc66xZUp95dB7fKWbCbqUEOilwETqZnUWJiIVaDAk1ZjDDFjqAu2OJP
	fMqJI6Ry/72ZyheZINEnEHUAvEH6D9N/VwLeq1R1EczoPcUV+J4B3xi9z/SPtxkQkQAM/UvUTPydD
	6bQyTT0HTbWJLKMXvl7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pomkA-002UoF-1M;
	Tue, 18 Apr 2023 14:55:42 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pomk7-002Umb-0R;
	Tue, 18 Apr 2023 14:55:41 +0000
Received: from shark1.inbox.lv (shark1 [10.0.1.81])
	by new-shark9.inbox.lv (Postfix) with ESMTP id CC183480813;
	Tue, 18 Apr 2023 17:55:32 +0300 (EEST)
Received: from shark1.inbox.lv (localhost [127.0.0.1])
	by shark1-out.inbox.lv (Postfix) with ESMTP id BB04E11181B7;
	Tue, 18 Apr 2023 17:55:32 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1681829732; x=1681831532;
	bh=Qq9ls3B214o+xFbtaX+maHmcXec0gagOLT9ZANiZIxc=;
	h=From:To:Cc:Subject:Date:Message-Id:X-ESPOL:From:Date:To:Cc:
	 Message-ID:Subject:Reply-To;
	b=IEFzPkv8YbaQ4afZpB4lgM5UfwYpk3XxcJu5d/3TlbcihvfJYbm28FEfm5ojKZPGa
	 vv4w5F4OgpMMrJEjSCKq55qg3GWgvDLZRuDYHuMrYVFLVleR5KOR5v6O1XfBS7U9PP
	 Y23u45zDuFaMmR4yxUp8hoyCORwkyY5vxBid7LEk=
Received: from localhost (localhost [127.0.0.1])
	by shark1-in.inbox.lv (Postfix) with ESMTP id B56DA11181AA;
	Tue, 18 Apr 2023 17:55:32 +0300 (EEST)
Received: from shark1.inbox.lv ([127.0.0.1])
	by localhost (shark1.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id GIJBX0qtq56Y; Tue, 18 Apr 2023 17:55:32 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark1-in.inbox.lv (Postfix) with ESMTP id 7C61B1118182;
	Tue, 18 Apr 2023 17:55:32 +0300 (EEST)
From: Karl Chan <exkcmailist@inbox.lv>
To: linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Chan <exkcmailist@inbox.lv>
Subject: [PATCH v4 0/2] arm64: dts: meson-gxl: add support for Xiaomi Mibox 3
Date: Tue, 18 Apr 2023 22:55:13 +0800
Message-Id: <20230418145515.19547-1-exkcmailist@inbox.lv>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: AJqEQ3gB+w1Luca2K41p5eDjx8rAJVdbxjuDrrAx6HtHtLDGrdd2bmeUB/eRFELmMmLD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_075539_690080_24058F15 
X-CRM114-Status: UNSURE (   7.47  )
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

The Xiaomi Mibox 3 is a TV box based on the Amlogic S905X chipset.
There are two variants:
- 2 GiB/8GIB
- 1 GiB/4GIB

Both variants come with:
- 802.11a/b/g/n/ac wifi (BCM4345)
- HDMI , AV (CVBS) and S/PDIF optical output
- 1x USB

Karl Chan (2):
  dt-bindings: arm: amlogic: add Xiaomi Mi box 3 binding
  arm64: dts: meson-gxl: add support for Xiaomi Mi box 3

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s905x-xiaomi-mibox3.dts | 138 ++++++++++++++++++
 list                                          |   1 +
 4 files changed, 141 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-xiaomi-mibox3.dts
 create mode 100644 list

-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
