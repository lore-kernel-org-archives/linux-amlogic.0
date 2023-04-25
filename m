Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38605C6FD18
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Apr 2023 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9VkYuPbkwEnZbFqFge+eeXiHyixlug3h43s4ZO0SFjM=; b=CizFfVxUjjvfIj
	uf7wsC+cjUyOV4mg5kffsQUqm3Zkcd41PBQOQpgp0PO/w8k6kvBtvl+IwHT9l29SH3V6J7Q4ErW2m
	1QWstkawN5G9GM/OrqgTU5kDxzZuMEfC3f0HWSiZIXZd0II8FCXGia+9P6w8ECRUpmUcnlFXil1H8
	1bct6UYfXRUjyu+Mmte91imrrIbGIZNp46gJ14R2oxWJqe6lyVfVWbFEMUZTND0t3WRphQP6nBbtS
	/6l487PYI026dSuD8igObo9gEbtF7UVuJ6l7Qfj6huAqo41Owyr4ieJSl756DVI02iSXj45XJUluA
	AXVZQTaUYa4FPIjBwzIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prLyc-001jMA-2l;
	Tue, 25 Apr 2023 16:57:14 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prLyZ-001jHI-1v;
	Tue, 25 Apr 2023 16:57:14 +0000
Received: from shark4.inbox.lv (shark4 [10.0.1.84])
	by new-shark9.inbox.lv (Postfix) with ESMTP id 733CA48052F;
	Tue, 25 Apr 2023 19:57:01 +0300 (EEST)
Received: from shark4.inbox.lv (localhost [127.0.0.1])
	by shark4-out.inbox.lv (Postfix) with ESMTP id 5C0C8C018B;
	Tue, 25 Apr 2023 19:57:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1682441821; x=1682443621;
	bh=Qq9ls3B214o+xFbtaX+maHmcXec0gagOLT9ZANiZIxc=;
	h=From:To:Cc:Subject:Date:Message-Id:X-ESPOL:From:Date:To:Cc:
	 Message-ID:Subject:Reply-To;
	b=bERv3ZNQ5JBDYpoXs1JXI1oQ3+XsqTlceOeeOiSKTTDY3Tw3vLNVh1nQS8jyIzlsh
	 8PTiiVwLcCyoT3l1y2hqRmDVd6qfdozIfbZYr1DQe5xUnd1d1tVZsQyPqJ0/pzo/HY
	 G3FsQtnLxGRhks6zbIMFSfDQfzGJ79AmB7zOM5Mw=
Received: from localhost (localhost [127.0.0.1])
	by shark4-in.inbox.lv (Postfix) with ESMTP id 4EBD1C018A;
	Tue, 25 Apr 2023 19:57:01 +0300 (EEST)
Received: from shark4.inbox.lv ([127.0.0.1])
	by localhost (shark4.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id LtyJlcPy_xEg; Tue, 25 Apr 2023 19:57:01 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark4-in.inbox.lv (Postfix) with ESMTP id 05A32C016B;
	Tue, 25 Apr 2023 19:57:01 +0300 (EEST)
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
Subject: [PATCH v5 0/2] arm64: dts: meson-gxl: add support for Xiaomi Mibox 3
Date: Wed, 26 Apr 2023 00:56:22 +0800
Message-Id: <20230425165624.11999-1-exkcmailist@inbox.lv>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: EZeEAiZdmGU/2M26KZpu+eHlxMi6UUZBzir7z6FSnX9YsLvButt3c2iUB/ecFHrCbg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_095711_794469_FD4D6D74 
X-CRM114-Status: UNSURE (   7.23  )
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
