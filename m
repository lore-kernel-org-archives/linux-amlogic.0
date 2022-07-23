Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2444CC43334
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Jul 2022 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HWDRBW7wxB6HCspxcq3Psj5HubBJJLTG9RQU+1tJ86M=; b=WUUodFDNiRn4ky
	2WZY/ASdSeaF1ckm/3y+zkvWn+lKuxPo7S/bnnzzDkRgE4lH/Py8BYs8TdvGIvLVPToUrtBaGKkS2
	IuGwwBggY6GmW5Gk7Mxp53yfV2gIx2yKrgWWzYarwS3urtF1ZzamlGqY4n2Ju7Wn1+RzLpNvUuu7s
	knJyiOBPRNSGRxG/oVSLyGgHhoLmUEPsaLQ5LsrqpKtuzISCiv40chKAN7QSBzqMdoA//DfZto8ek
	vyrWPuWLV43q+gLuXXdGHzG5yJ7otjl6eIu5CiKd6gSuWA4Ltwxnhy+tyuQIg9GbbPmC6wCNF2Wyh
	72PrfjWeCe28EOLJb2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFHTf-005F0k-AT; Sat, 23 Jul 2022 15:55:39 +0000
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFHTa-005EsC-Pq; Sat, 23 Jul 2022 15:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1658591726; bh=5qSxoo46dXejRlWFhsper1B2HKP7qvbwelsN0IBnvTc=;
	h=From:To:Cc:Subject:Date;
	b=yz4zJjFGRVO3PPf3mgxsu5XyoPdlLVdAvaAQV9gZbwMBoa2404m+oJtrVCAoIznX4
	 z7Eota7MpuyYUUB9oHKYkg8unZDdjTyaD69Wp3I/DAKhqwc+uatO0Heu7DoZoFIICt
	 p9Zmzho2VNGDZbxaalxPRzTo4ydQWzuReMi5RACI=
Received: from TS-551.. ([101.229.115.105])
	by newxmesmtplogicsvrszc13.qq.com (NewEsmtp) with SMTP
	id DD800C3C; Sat, 23 Jul 2022 23:55:24 +0800
X-QQ-mid: xmsmtpt1658591724tabu6zefe
Message-ID: <tencent_D7EF26141A5C0C742EDAC7D6DB396D8AA409@qq.com>
X-QQ-XMAILINFO: NioaTWkRhWwaPD8GECzyWxVtCZpCbuEzS71JSir01E8YrpPabZnVXbMjSPJzFz
	 tq635AoP0WMVhSCqPzQ8i3J4i+Hq/xk8ESGbtKgDkNItMMqZEpScECDTT/0tjay9uv3q4/JPvwd2
	 iq2qM/c0jGmvoxwx3hc9Ffa9nMikBTL+6DgyeffPF8xs/tNVBKd1Z2bOL7VnmQ2meKvoEv4/wKpd
	 iL06WBVthGdDRwIHu3zpjil8ywOfkGcLj4d3bUyHFgE7uNXusUgaysLTl3hzrS/7u8jVF61eowAs
	 9CmbsKZTkft+ItAfeRLmar75+HMlVUqYrmQH0LY9bmqoZFCZ1P0ZaEgHCT8k6IdYlTu68HnTQRqG
	 RaFMrWXzJuTb6naCdkfwDf4p0ENybSAU3g3v8TTFX0IIXHunuG9vebXBcPC66I1Z9+puvu7qgH5+
	 vpl2GcClCJl5EGC4FuT2SxuE46bIm0LevPWbguJxpwRrNOChUJigg37C2wHlHnouZ9LKF0bWp52p
	 Yw4HSZMHTMiXiVY/oZD8yudhRVZEg6ciKUUvT9BTXRvILkiU05XAEMLXvSW3+XiZC7sn0FaQ/hIO
	 2kKaR8eQk7zkI2XxDhKqdZ/dmLAKXUpbOQY1wUQkfIDcamEzmfs2jj2B6pXfQqa9bVPnhqEKX/bX
	 xEATuQmHNEyf7vIPTMbNXxduOgvBRUryhPMx/1uGm/59sdKstP17jIyLdIja4esrN34SQgi+GMd3
	 wHgnLssZ/hNkEve9jwfYMQehabbWr7IGFOJ3OZ/PJLSv0HD1YGemGxbx9A5Y6QUsYniT0VJ8prvb
	 d3fbKdCvoSl9W7zrbXt4Zxb+VaFRnwnLr2F81BYlRoQaKSxf2liE3/LBMzx92EnoiO3XG5/exGvw
	 fMWQXjpT4YdfIGengaUPzQYumGr6nfNtHfNEbtGUmEZ+hBzqNzA90Hl7HP5NpvMQ==
From: Zhang Ning <zhangn1985@qq.com>
To: narmstrong@baylibre.com,
	sean@mess.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Zhang Ning <zhangn1985@qq.com>
Subject: [PATCH 0/2] Add MagicBox M16S support
Date: Sat, 23 Jul 2022 23:55:00 +0800
X-OQ-MSGID: <20220723155502.127404-1-zhangn1985@qq.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_085535_248370_15E4E91B 
X-CRM114-Status: UNSURE (   6.19  )
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

current status with these patches:
HDMI sound and AV out status unknown, others are work.
Wifi/Bt works without DT support.

previouse patch:
v1: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013022.html
v2: http://lists.infradead.org/pipermail/linux-amlogic/2022-July/013051.html

Changes since V2:
add IR keymap.
update patch title.

Zhang Ning (2):
  dts/amlogic: Add MagicBox M16S support
  rc/keymap: add keymap for MagicBox M16S

 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-magicbox-m16s.dts   | 40 ++++++++++++++
 drivers/media/rc/keymaps/Makefile             |  1 +
 drivers/media/rc/keymaps/rc-magicbox.c        | 55 +++++++++++++++++++
 include/media/rc-map.h                        |  1 +
 6 files changed, 99 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
 create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
