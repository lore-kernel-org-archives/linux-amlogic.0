Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4405AC77B6F
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 19:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hht/BmsWUFiH3K6N5HiQi+tw3FRl2aBlREmewCOPLyY=; b=2YE0y+tIz/zE4G
	JCyWPpc5D+wbzRt6gpMjOQpCDB8iy71ppFeM8BEvgVHtotPN/BubcPQHQRahs+PIgFWP3fRyf3+je
	A53SXLtYlPYloY8q3Lr2YZtNeUY9h6bkn3Y6Gi/Ur5bdtDzWeIn8en7kk8+Q14CsMd5vD43dMamST
	iKf+UPHMrs3L3MjlqiO4HnuOFsSgeOGlteglAIVK1/8vJpznFXi8u6vd3i8HyC+ZWyNxu9vnZMPPq
	M1OcKmKBHdwwFRGUt48SmMudblLRNDjKa7Evqn+MdggAfzsQB6XwI6rgfzv+fMOnR+Y4YaqU0KtvP
	S2T63tu/CnQDyvkJjS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plxEM-00Fq0b-21;
	Mon, 10 Apr 2023 19:31:10 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plxEI-00Fpzr-2e;
	Mon, 10 Apr 2023 19:31:08 +0000
Received: from shark3.inbox.lv (shark3 [10.0.1.83])
	by new-shark9.inbox.lv (Postfix) with ESMTP id 14C39480813;
	Mon, 10 Apr 2023 22:31:02 +0300 (EEST)
Received: from shark3.inbox.lv (localhost [127.0.0.1])
	by shark3-out.inbox.lv (Postfix) with ESMTP id 04D7E28011D;
	Mon, 10 Apr 2023 22:31:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1681155062; x=1681156862;
	bh=y1ChjUCMzQii6EhLRKMmO6a7digcuovwd1kw7u2N5go=;
	h=From:To:Cc:Subject:Date:Message-Id:X-ESPOL:From:Date:To:Cc:
	 Message-ID:Subject:Reply-To;
	b=b8/+X0kVBkN+NnL5f6VRTEEd30foFRYqlJNbWABLBnv0SMEd7O4IDlgSl8ocyOuYj
	 UsH2kwt439meqcAkEvK7EEbqKF6Cubqc6TwrrDDbDqYLBJibi3TFXbKDG3ZnH0aOPQ
	 ifRbkADm8x53gz+DnEqok4BN91w904WXNxXqu1dQ=
Received: from localhost (localhost [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id F2CE0280111;
	Mon, 10 Apr 2023 22:31:01 +0300 (EEST)
Received: from shark3.inbox.lv ([127.0.0.1])
	by localhost (shark3.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id WS_P8YAKAwja; Mon, 10 Apr 2023 22:31:01 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id B31882800F5;
	Mon, 10 Apr 2023 22:31:01 +0300 (EEST)
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
	"Karl Chan" <exkcmailist@inbox.lv>
Subject: [PATCH v3 0/2] arm64: dts: meson-gxl: add support for Xiaomi Mibox 3
Date: Tue, 11 Apr 2023 03:30:46 +0800
Message-Id: <20230410193048.31084-1-exkcmailist@inbox.lv>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: G4mEQ3gUh3tFv963KJpk5v+XtdvLLUZQwyq6kf0x9RAtu7LHu958dW2WHIXze3G0c2LD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_123107_028693_EBF5577C 
X-CRM114-Status: UNSURE (   6.15  )
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

From: "Karl Chan"  <exkcmailist@inbox.lv>

The Xiaomi Mibox 3 is a TV box based on the Amlogic S905X chipset.
There are two variants:
- 2 GiB/8GIB
- 1 GiB/4GIB

Both variants come with:
- 802.11a/b/g/n/ac wifi (BCM4345)
- HDMI , AV (CVBS) and S/PDIF optical output
- 1x USB (utilizing both USB ports provided by the SoC)

Karl Chan (2):
  dt-bindings: arm: amlogic: add Xiaomi Mibox 3 binding
  arm64: dts: meson-gxl: add support for Xiaomi Mibox 3

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s905x-xiaomi-mibox3.dts | 142 ++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-xiaomi-mibox3.dts

-- 
2.40.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
