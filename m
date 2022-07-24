Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0EACCA48A
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Jul 2022 23:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F2jPJpR1g2ElyjCD+nDTXhu0/zgI8lKxJ99Czy8nX6w=; b=YQxT6qNZR8Sh5r
	ONjxJmjaHZTDBzGFg2DQYCChXncRF6F8GASzs7fsM3RanbxMWjqxazsu9BucqI1NIH4aJXWttXc8J
	UGfIUFPzrXzhxO+vklwzzLWEYKp3SWaLsR+TwDmFtScvJL0ldXNJkTAA+zv+lmGmTTFc/csVOtIPA
	KAnxMYBFQ3VeWHQ+XQ8F8a+QBxqDYJUCcjuxJHJJfjGXRZLJZaNUvMVo7+NYRGk/M6vZAxA2r/qMQ
	FRuATUeMxzRMnelYhZt8PLJjS7Wmyp71E5cfbtiX84g6xxcw+NnTdOFwMKyyzueJgZidVdL0292Hr
	zr/zUlCdaGrz6WcoM9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFkqn-00G79S-NY; Sun, 24 Jul 2022 23:17:29 +0000
Received: from out203-205-221-231.mail.qq.com ([203.205.221.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFkql-00G744-6T
	for linux-amlogic@lists.infradead.org; Sun, 24 Jul 2022 23:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658704634; bh=xwip9YwavcGOofhg5THvnMWszQzYtZsdzuEszxEuK1Q=;
	h=From:To:Cc:Subject:Date;
	b=Krzv8KDF0kItz8Uc26N8N3ALSMPDrZJ3ymdhX97NMiJXIi4MdLwoDQ3OUmQGFFkcf
	 0cea9/6huaEQSyR7lcWVWjBU9B2NmIwwO0VUmd0WJJu3kZEauNpjzQhZO785bw7ib7
	 DhzYxiXxEvfR2ePQL9k+Im3VCwyoV50BKxrmNjrs=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
	id 44B2EEC3; Mon, 25 Jul 2022 07:17:11 +0800
X-QQ-mid: xmsmtpt1658704631t5ybo366r
Message-ID: <tencent_2F17606327ED623646D2AB136D0D0F06FE08@qq.com>
X-QQ-XMAILINFO: NPwOoMPVnumVpMupW1BWN/J5QcB5oCQ7MyAgd8OQxFCTh58SVntQEM4mQEv88i
	 m9iU5Mz69OvBqKpkOZwvk3zX5H+XUKdSu6udqxc1xZrs/qxLe4c7oqwUpuQ5JfoMMcwqUPm57bc/
	 2WwXqMmZALQRUMEiRsU1rbW73REd4z0J0azpbVzDgmfzdOjI3pdht642cWfu8fhOQSmzDp9dp5o5
	 8iri0PTPTWYtTKXZekMegnwNTJDIAfi1dRMl8PsYi9nCGklTzyy1RrP8NY7iXY8WLtd6tGaIcS1q
	 04C5s4i39W+y/mam5fdjwwzQU37msZAoLN663SVePUpwgginlAWwBIQU+jGMEeac1f/RwxJRho9L
	 oNNc2JqkDa7nfweksUYXBwS6n9hjDcRbGq8PeBbKF3L7873lp689ddUydKw2Y3dkiiuUKo+DMJ7g
	 MDAYKUJMGtC6Lbq7cS8/ME8iW0b9aUJzoAZOyEpH7bjOyGKhKreHVU+LNJptEKOvVu+jny48pOXj
	 Fbo0dPvdK13Yv1InFclslbDtr4HW+D1T6d1voX6oY3uu7MdknvLRq5g7XwCECmCcKwzO2dQfGcgk
	 og6SbX5lVCpxETP6SrFbFOQcHWiMWAgpMMLfnKxRyWLFSLbfq41htmrnbkI4AcuREQ5wL2JxrvXj
	 76uNYUZV7gBguf35Zw/rqidsnrD2+pXBT+AUwcjtRJEzUCloR6gEozH25OvsuX3/Gsuk33KhJIup
	 UBgrwJKMSbfjLrtTLmWDgWnM9HOwVTe6car6P/AOGwzLhHIwORjuBVGXdrnQasbUpzYv+Da1W200
	 iQZciETP+emRQoKjRUmdkb9tIWLcGSJSflkzi589ekOMoss2mXqU1pHL8fBpqw54TyjkyuioE9hY
	 Uq9GpERD665OIfcdRXT2C3bJj4JrNvBF+a8brmvtuY
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
Subject: [v5 0/4] Add Magicbox M16S support
Date: Mon, 25 Jul 2022 07:17:00 +0800
X-OQ-MSGID: <20220724231704.132472-1-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_161727_571230_D31F397B 
X-CRM114-Status: UNSURE (   8.00  )
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
v4: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013060.html

Changes since v4:
fix typo in commit msg
remove useless blank line

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
 drivers/media/rc/keymaps/rc-magicbox.c        | 53 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 7 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
 create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
