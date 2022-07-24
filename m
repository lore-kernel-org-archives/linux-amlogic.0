Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804C8CCA47C
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0qKyPgp7I4sq4wWQSs/LJD1VeTH3epmZjXclaj4j7JE=; b=d9/BPkANhUYV3o
	xiwO5Jzhk+rfvhlw5FycgxUCQWW7zVrUohXa6JGXSRZEKrhvrSpNnEQ55UrogE/eQJMuplXhOrkHp
	g+2+odXphrxCNe/Sm3H+wS+WOZh15v0ecPfhlk733lufEXIuK5Do3meUGhxzRcE1M5nrWTJLQHjg6
	t0PVY4tAzdBh8jiGQtSgjRA15NJc9UYi7n4S5iyqMoXFzF9Odurh0o1ilaGH/f+5BETSx9BLOFtC5
	NwTa9pzEpWaGFKjgdmq/MqpurQmlYbhf2l165E/75LZHgfD0ygPesyZQB0ZlPFTbPa7z44YI1X2wf
	nb0Ix5BjbmjmnmGHNHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcQw-006WIx-Iz; Sun, 24 Jul 2022 14:18:14 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFcQt-006WEa-87
	for linux-amlogic@lists.infradead.org; Sun, 24 Jul 2022 14:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658672285; bh=NgI3If1mGDqIugqOUsphsHVnaxjJRfNnV5FrHmEFTk8=;
	h=From:To:Cc:Subject:Date;
	b=bqPQ7UBrdAV1mQtnv76tpFug/ty36yMisd1/1aGsN+aXJ1Fi9QNez17TJ3gXu/2pG
	 bwXJ2DcU1bRJXEXOQh2cy5QaozxHVTMGPpXfPzq1Xyzf1lkz1a2FYXCNLiEPvQtGC8
	 6eI4of2pPyclAGuyWk9uAcESTSwbLp7Y3t2yAsbQ=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrszc13.qq.com (NewEsmtp) with SMTP
	id 48289623; Sun, 24 Jul 2022 22:18:02 +0800
X-QQ-mid: xmsmtpt1658672282t5lfuun3z
Message-ID: <tencent_E18C3DB41BD86448074C8834E41B685C380A@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8EuS0u7RT32TfUeP+kLBDAKk6sr+HKD86du6VFtuwK/c3aeahXI
	 kDR/YMPQdopQrcH/fZHQ9+poam6VVSixDDtiMNaWbxR/7LHr3xETAR1EWmhckCknxb1Lu+dLc9kb
	 ojJd9a25H8mcWzhPReOKIxrVmBCbxXjWkCjFrx/ACa5ToY7rwDlQwywu1slaPIwtnVc7Q6PyFhD3
	 E/EMrpXfRNnRhOHVUN9PzK3gkMDMNOGd0oLf/3Jze0eMIbXPQkcMgbEcNm9dgnHA9dqjQ1w94tx+
	 8cco4HbwZelAfRPCgrrY7CuqLhZgOEZpaOMA+oMSVQDAMfkNkXjeNGEBPHNQ5cgF3AIzY+Y7+WNg
	 9VLIA8k2zhI8b9w++EtIfjnO9CkteURAeo2CHWcaqgwXoznVNsHi+zx/GMrtNndHg9GhKyViqSim
	 lQvUcQFPA6Zfb1zqr7VyZod87FBHIq/S0Y1r/uymEiIgxzZDxWPpDDR291epWwlXzrlCbqipziuE
	 88Y0n175F0bQaQrItv94CKHXgshD6P5EF7FRmsGh+l3OEWQL0aJoUcR80wv3S+yONNBiJCrAoEqW
	 4WG1uwCrRwxk5JOazjeUKDP8vKlDGwu3HqACTFQTG67kZk/l1pBb1qQ6VxRgbQsH8btKzFSvPvda
	 OKluFQlz/NQkysCohRLNbRf4kgV6olwxg4kZ5Q/18bn0egNR9CFvIgVehtqEiDishejC88gCw/BV
	 DBwRF6obMZbQ+mBICEBTf6XuDYCbzXEsE9AqqzJgDzBhaDyvZUWge2VRQ+JMSfw4d74eNeabvolE
	 vNO34bW6X0AgGTzNeoKMccPBBDteAlbgJsUv+mpXTMkdzdvl526ezUDrjR8PAclYdWbmON83ykIO
	 zWYsJfns0EMSi4LoDlU/Bgl0bCVlH47lHJol4B9dkh3j9AhIJYKt8qTn8uhuiygA==
From: Zhang Ning <zhangn1985@qq.com>
To: martin.blumenstingl@googlemail.com,
	narmstrong@baylibre.com,
	linux-amlogic@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	sean@mess.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v4 0/4] Add Magicbox M16S support
Date: Sun, 24 Jul 2022 22:17:45 +0800
X-OQ-MSGID: <20220724141749.131724-1-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_071811_927487_EDAB99C4 
X-CRM114-Status: UNSURE (   7.08  )
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

these patches aim to add MagicBox M16S support.

MagicBox M16S is populor Tv box in China, manufacted by Alibaba at 2016,
with below spec:

Amlogic S912-H (S912 with dolby and dts)
2G ddr3
16G emmc
Marvell sd8897 BT/wifi module
100M ethernet
IR reciever
4K HDMI
AV out
Rest hole
5V2A power input
white LED

current status with these patches:
HDMI sound and AV out status unknown, others work well.
Wifi/Bt work without DT support.
LED pin is GPIO_TEST_N. Depends on Neil's patch. 

previouse patch:
v1: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013022.html
v2: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013051.html
v3: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013054.html


Changes since v3:
split dt bindings to new patches.
change keymap scancode to hex.
move dts changes to single patch.
update commit msg.

Changes since V2:
add IR keymap.
update patch title.

Zhang Ning (4):
  media: rc: add keymap for MagicBox M16S remote
  media: rc: add keymap for MagicBox M16S remote
  dt-bindings: arm: add Magicbox M16S bindings
  arm64: dts: meson: Add MagicBox M16S support

 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 .../devicetree/bindings/media/rc.yaml         |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 40 ++++++++++++++
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-magicbox.c        | 55 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 7 files changed, 100 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
 create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
