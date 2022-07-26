Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF49C00140
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 14:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9o1EZjNZWlAydedBm4DPBcrcGi43ijImR+WPnoDTEcQ=; b=xzNe5mh3o1bpM2
	ejkZL8Cj0w7P5y3LtPyl6BjYwcaP0qs2MI1sskT6f5dalWxtrUh2SIx+8GgHR83ZGZXmlDsUth9p0
	Az3wBEQSntbpuasWFjIoxZ5GwD4XWu2zYtg9/gKiT8WKs8FU3rVfnnhyOBD3YW0C8mQYzqOoaX1+p
	7npn420qknd5nQTKEBDdECIjLhdrS+IZknNS8ggCG7CKLI9jbc9q/BtlStWjjYpvhW5gDmhfqJlRd
	lS2KB3N+Irh1afkslXNNtw3FIfp4nR5p/MfnllmAOXX0Sud2kN9KzEBkft4wREbJZkvFWHfh7oaF7
	Lgy4e1K214bfnGYaAfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLgP-000GxW-1L; Tue, 26 Jul 2022 14:37:13 +0000
Received: from out203-205-251-27.mail.qq.com ([203.205.251.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLgK-000GtE-Un
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 14:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658846222; bh=GwTPgtL8w/RKgsZs82DPe/CG8DO6PcVTBMflR1Dwb/s=;
	h=From:To:Cc:Subject:Date;
	b=a3K3VZocF3Kp4JnbMt8CaNUc6wqvYDNrJz2TL/ZTTVdWb3uoqPYeda0PwTG/HFllj
	 DUWt5D3wTGRb/wLjyxLAw/MVVQndVdEjExVNPLB1SRvNUHEaYU6vbpBwSHbMm7sM6k
	 1/DWR1B65fE9Wsh5xkEqEynMLrK+4/iAqh01FKjc=
Received: from TS-551.. ([101.229.115.99])
	by newxmesmtplogicsvrsza35.qq.com (NewEsmtp) with SMTP
	id 940102AA; Tue, 26 Jul 2022 22:37:00 +0800
X-QQ-mid: xmsmtpt1658846220twdhgoidj
Message-ID: <tencent_8D1A545CC48CB5B4ABD87448C74D6035280A@qq.com>
X-QQ-XMAILINFO: NqxKgsaVX1mSyCA45hrUZb+9s+3H/QtDO2GtHwEk2jjOzoBz06cALazNWLQ20T
	 sFqVxZPPbDDdQ4ey87hJWcmJ8iI2zVa/s5u4t9XdP0sKFT2fyarYrNLwgx4KmllSplriFu3xI2HN
	 kd87ojOGcTyzFj2T4O7DZW2K/TFkqRqkxY7j6DCxJlWnGZrRI5PneoJe1tY2pnkvWjhc2OzpT7by
	 aYrMGJYr6WLgKOB3YY5BMGdlCT+i/otbjWPduqIUCz9yoMclSE1cl/+ciwsJpucpSwLyPzTRMuOM
	 p6lMPlM/p30LaQTcUDDfTy4KBCBlbroskQZDzuybGWkAbw74qgFlIXS+UvjNjZpwQCoignI0lCVO
	 Z2qUDNeYILbAmf/a6vYRVhjFETOzhSkKTBvc1cEOEptc2ZNDCTWr9pCV07g6QkrsKrs+J8HXGC7K
	 1ZwrxJVJ53hWn4SVnaIRDM8zvIM2eD/4DgF+3brccumtj+/A3A31zXaK/Y+ltgueMKYy7g0g9svv
	 FqcZvbR300NOqVzaj0w0hfjaN3/eNQFy1raqnheyoD99cmRF72qy1qi3c/cLi+OxhP3N3UDRVjxR
	 ZZURWPEuA/T0DIYXpjGr9FO76c8+jeQbhL0zLBrtZswPl51CMplYKAruoVG9w/D0++y4A8jK3Cmx
	 It/CwGT0BhzqM7T8cro1MrBBoVF9tAK+JPM6/HRZjm6CCgMxZFiL2vZDYwS8VZoSfe6MscgBR4qs
	 HjWRyGv22uR6zDsCwyg5CtMb044u7VHsVN1wHinZSFH1tbbWgFu+Q97BsJsJ0WNwKhTlRrCpkIN1
	 AksbuK1ms7Zuls7rowJv4VPHMPfWq3KFoYJSS0la2uVmfBgpuCUldyZlZMWfN8GLIidjmqIVxW8/
	 uL2Ah5C7a15zdVzPaY0VPnZdhn/k9yHwrIJDNFGayRCcWL4EDRp1WLxzNZY6mBG/n6q58KqStQqU
	 zZvWOD04c=
From: Zhang Ning <zhangn1985@qq.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com,
	martin.blumenstingl@googlemail.com,
	sean@mess.org,
	christianshewitt@gmail.com,
	linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [v7 0/4] Add Magicbox M16S support
Date: Tue, 26 Jul 2022 22:36:45 +0800
X-OQ-MSGID: <20220726143649.142574-1-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_073709_311665_39BC4595 
X-CRM114-Status: UNSURE (   8.69  )
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
IR receiver
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
v6: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013094.html

Changes since v6:
add Sean's Signed-off-by
checkpatch error: typo and tab fix  and no error reported.
add manufactor bindings and change device bindings string to
tmall,magicbox-m16s, suggested by Christian Hewitt and checkpatch.

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
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 39 +++++++++++++
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-magicbox.c        | 58 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 8 files changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
 create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
