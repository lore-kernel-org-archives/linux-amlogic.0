Return-Path: <SRS0=OcNe=WV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97DDC3A5A1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 04:02:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B0672190F
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Aug 2019 04:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hd9dHZaF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvpEkAdd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B0672190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MPtNaBiFYGCWniCNEs9+tErt1ojbDJdkbfI6wzLvGwI=; b=hd9
	dHZaFFhHMA9hCk7Yo8jvERUGYvu9PXZBmHbfNZMtqA/05c7zrXws3yl/uWaRh50THld73tgjffT2I
	M+uwkzUQisAn4cTrVAjIr2uqZXHPNKmm2xCJFHfMV/aPsTPUZUOYtT0ikFg9OpNRF4pSRBGNe2fkk
	Se5H8jbQe4gGhM/txxw1qgXFRwbrDq6GZKqcEbR+Z/rNoaBz4bnHmtjIoZfvL16pRs+ed1P07rOXr
	XjL4RnHsmSuhHkYsBHUUUOqop3drwT/nsq5HtfK3doWOqpuaXx0NQHq4mymKFEndCKQOSWMvTqx7B
	DNo45x8Lo4dWirWp3CDfCModL+xPNgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1jjn-0005tw-9q; Sun, 25 Aug 2019 04:02:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1jjT-0005er-Kn; Sun, 25 Aug 2019 04:02:25 +0000
Received: by mail-wr1-x444.google.com with SMTP id r3so12121884wrt.3;
 Sat, 24 Aug 2019 21:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nWmRqjrC+TU28eDb3UcDIF7I87vLorA/ZMl1z/jnRWg=;
 b=NvpEkAddyUAnizZzJTz3P6sWKPGBsBTDPTnWKQ484X6BBjODpQL5c00mdXFJmw6q8a
 eba+zk4zJx2Mi2VV3QrELx59CX9y89QXI5dn8NuhinT/TIaKrl/7piYUI3pKSfjVtIaG
 N02e/uQkZ2T1go8wZvX2oSbhs/BBUPnhxtkJtEcFt1mbA0qU+3SJ9tv6G0PWDQr0n6xp
 nAS7EuCZC/YUHpK8A0hLD679Jt9kvLOs6TxwFGkRf47NXbSmRGZZ4TwSkXnECkkPMS4Y
 JnnCmTLXdIv0VOIRpW0efZNpSSUOJMpDVnxtdt+naAC7vGYDkPuiaInwWEEDKXzvwIcs
 bUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nWmRqjrC+TU28eDb3UcDIF7I87vLorA/ZMl1z/jnRWg=;
 b=a79+YkJ7vwUH9PGH3TsTTlBmYqRbKNdg1lUE3yBnLGUKSEni3syyBCfGYLgujH+L5O
 byqjBsOeaV4AEZcFLjDomq2t+CvTh1VSuiLn/YZyCS0axwbFj4TcmbITGO5HXT2Ezj36
 3a4AyaOJ9+G+r1repJme7tnXvfR5zV7ea0UznO+jWYnYYx4LE8jCPyj/5FRiED4F+brF
 S+sA8c0wQ/5dCPc/AM7TuDExAiqsJ7umWJ8ei7eO+mvv4uEoWBEs4861RhRvBJ3uIOGP
 SpU1j3pdrzaWongKrNbsCPbxf/rgcq5+vFnm1961nhH1LlgYV3TAjbxmSprtJ3ZKjvtC
 TyYA==
X-Gm-Message-State: APjAAAVaWyl3dmaS3qu57NgzN7SHuMDzOqN+84L1O7pXh7mcjFUb+0cH
 gZvno+t3bnBnTHbvc7YXOug=
X-Google-Smtp-Source: APXvYqyyGTaMrndxI5ko5zR9b9GuYjLRGxkOVAdm1bHns/2lhqPy7lRlR8gHlGgioXmGtodHRAs/2g==
X-Received: by 2002:a5d:4703:: with SMTP id y3mr14839913wrq.63.1566705739289; 
 Sat, 24 Aug 2019 21:02:19 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id a6sm6820985wmj.15.2019.08.24.21.02.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 24 Aug 2019 21:02:18 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] arm64: dts: meson: ir keymap updates
Date: Sun, 25 Aug 2019 08:01:21 +0400
Message-Id: <1566705688-18442-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_210223_708711_3A0D512E 
X-CRM114-Status: GOOD (  10.11  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds keymaps for several box/board vendor IR remote devices
to respective device-tree files. The keymaps were submitted in [0] and
have been queued for inclusion in Linux 5.4.

The Khadas remote change swaps the rc-geekbox keymap for rc-khadas. The
Geekbox branded remote was only sold for a brief period when VIM(1) was
a new device. The Khadas branded remote that replaced it exchanged the
Geekbox full-screen key for an Android mouse button using a different IR
keycode. The rc-khadas keymap supports the mouse button keycode and maps
it to KEY_MUTE.

[0] https://patchwork.kernel.org/project/linux-media/list/?series=160309

Christian Hewitt (7):
  arm64: dts: meson-g12b-odroid-n2: add rc-odroid keymap
  arm64: dts: meson-g12a-x96-max: add rc-x96max keymap
  arm64: dts: meson-gxbb-wetek-hub: add rc-wetek-hub keymap
  arm64: dts: meson-gxbb-wetek-play2: add rc-wetek-play2 keymap
  arm64: dts: meson-gxl-s905x-khadas-vim: use rc-khadas keymap
  arm64: dts: meson-gxl-s905w-tx3-mini: add rc-tx3mini keymap
  arm64: dts: meson-gxm-khadas-vim2: use rc-khadas keymap

 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts         | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts       | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts     | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts   | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      | 2 +-
 7 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
