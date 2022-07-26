Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F2FC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 13:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pSCKskX0HKvftTWC2xQsL6ifq6FmWC2qhS5YA6dqWQU=; b=iXxs6cDyafXZbY
	LBmeXFrsr/9E4bnEq98lzj5Xmg0e26JMUpF54lVuFNIF3FFNp/0NogUf7uW7p0r13IGf6CN9et2Ia
	Cyqv171+B2htealw8WvMkAfWKc91BrMr+VX+mkCIsy3aYda1blKFLr3LBwJXmbue99YYAv1GHz2My
	MKQrHw4epIJaxBTfOnXQEnaCaUdfOwvy5PGKDF4gBzCQqlTalj27ybX0XuiPVwNvo8mq2qB+TevTF
	UaLXXKCPbys06UVVwRxbrjqOUpSSWXvexetP3yXu3DPVPiaUUw2YxhlLCa2m+J6AsQ8xiXDXiTTd+
	Fdb1nM5TaS+9vB0Yk1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKPn-00HJ2R-VR; Tue, 26 Jul 2022 13:15:59 +0000
Received: from out203-205-251-59.mail.qq.com ([203.205.251.59])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKPh-00HIws-Ab
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 13:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658841344; bh=FIo+SqMyx18RjZEIAmLZAjP5zqPI0I8yR1Nj0y5yjKQ=;
	h=From:To:Cc:Subject:Date;
	b=xk6eq/UfXnVwEbqFfgoVHkqNiIt5sZq7JnM7q5TljWiqftggn6AiOzal3A9CxJl6h
	 fiIuIP28d+0rhawNKYUKQ4Zu9VVyktUUzYkPkFDC1U6aIxaV/8PoaTzot6VwVoTaXV
	 XdJIBybAjp321Hku6tgtZICSaWFXn9xz8cwLItSE=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 3EA1E4DA; Tue, 26 Jul 2022 21:15:42 +0800
X-QQ-mid: xmsmtpt1658841342tszr81qok
Message-ID: <tencent_59B4863603BE8B94319376559B1BE9C28907@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85Nocj1lYxmGiHrGgGn3kuKLhFc4xoPNizvwonND+i8Ia0meP/nFRW
	 uxrhTertZ/zwMWM870F0rTvD/+8yce6egrIgxC16jOVltc5C7wI2W4AnB9GuC5aemBIUOM9Gb3f8
	 pb1OSIXcTLU7JV6uX8zHhGo5rymfZrR+nlZAPyDXvYGdbTVVQxbp6DjB0SeDo8CGQJ835LnjpFFv
	 R4M81WtD1/lcKGXA3xpfdYhGD1XtripcK9QV/i833hLosflkcDL70vWpWWzab/x+WCE3GI2H4i2v
	 3u63kUyog3cEjn1rf+I/0V6UtQvNiE6FxRVWtgwJ2nxtr1d96ei/NRMyahUES+pFI/xWFnlmmPFz
	 V8yvHwbXLa1LpU4om+0iWNG/TLJ6WDYJ43cddqkOQWVh34YbBVWFBezoZB43ey5UGcU50lVyEZ9p
	 phVb7nu/eSq/J26j1HP7aK+lszVLI23FXZhDhs53AD73e8QYcr65PmkscSWQrixnSPAXH9VPkMry
	 v0/Tt7tUXRI7/VqKDsV2efF0oGRxMSgNhcsMrjpZLkyiVCrBEOtaMLFla2JupGgk1blujxUMIZOz
	 hEpWeu+Man3n5cK28Sk1XRvSFqxsG6DlewpsUABYui4jHh4u6Ls2hd0pLmIle2ekNV37lA4RnVx+
	 nO495MzKunIN6tKxFcTuLPtv8lbWx8CdyQWUPAWjQnVtNpX6kcIFQhtII2VSBB8MOqckQEqY/K2d
	 lSdx99UOdXJHUAEKAFJwlM5C4RPQ1aACpU9MSLrxU7OSYcnXI+1ne17TMnBF6vDJH0vZAsv+PcnD
	 +BK0aJZ1ZqkLKKrNP58ctZxzXpJ9ZoAtjhChR6nN3GtmWzlhVqNgEjpSngfzu7Shqfba3YY8zc0H
	 2Ilii2MORiNfOp4tk7odMIcRZDrQhROc1v12LKI0TPa4IpNDo0ni8+urdZXUkzFBy4iynsI0hr
From: Zhang Ning <zhangn1985@qq.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com,
	martin.blumenstingl@googlemail.com,
	sean@mess.org,
	linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v6 0/4] Add Magicbox M16S support
Date: Tue, 26 Jul 2022 21:15:19 +0800
X-OQ-MSGID: <20220726131523.140581-1-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_061553_687506_D9280E00 
X-CRM114-Status: UNSURE (   8.26  )
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

previouse patchs:
v1: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013022.html
v2: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013051.html
v3: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013054.html
v4: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013060.html
v5: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013067.html

Changes since v5:
update keymap bindings patch title, and commit msg.
fix swapped volume up/down key, find out by my wife.
move rc "M" key description from git log to code.
update board binding patch title.
update gpio key name.
remove gpio-keys address-cells and size-cells, which should be done in
v4.
add 1 blank line before ethmac.
make phandle in alphabet order.

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
  dt-bindings: media: rc: add keymap bindings for MagicBox M16S remote
  media: rc: add keymap for MagicBox M16S remote
  dt-bindings: arm: amlogic: add MagicBox M16S bindings
  arm64: dts: meson: Add MagicBox M16S support

 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 .../devicetree/bindings/media/rc.yaml         |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 39 +++++++++++++
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-magicbox.c        | 58 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 7 files changed, 102 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
 create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
