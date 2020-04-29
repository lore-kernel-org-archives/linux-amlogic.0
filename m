Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564CCC83007
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD392083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F4wLuVYM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TEUDwHug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD392083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5YUsSxKsN1iDtAa+cpybxO1KD0wUvUh60c539Dtu2x0=; b=F4wLuVYM/Ae47M
	gwvWBgLFjPzzCVA3ucoTojMO0oJwCcObYx6ghsH2v3UY9zO8dbibc00IuAAzSkzBoK45MRz8BSCu0
	8ssDvZmESiU+d4CEpVhssU27iuItDlksGSfvq8DLcNJs+x0LvcXcCY+OAlCeoMshZuZak13xsPxLg
	v/qyXqaP+DJlXokjovpmPodObJ4KfM3825wKa/EkR3TXzSJxLNwqjm1JLg8UcGorG8XdOTsUr/b4k
	IzSXOJfy0w88ZNojZ6kxKgmIDr3AISe01fta1VSQuTnKMPxG9qwqRpi36WPTHrSk77fRZivMkZaYF
	w7PoUtOaErsisWidQ/Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTt8u-0006vc-1a; Wed, 29 Apr 2020 20:17:16 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTt8r-0006uK-4e; Wed, 29 Apr 2020 20:17:14 +0000
Received: by mail-wr1-x443.google.com with SMTP id j1so4147989wrt.1;
 Wed, 29 Apr 2020 13:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2QFptVeNUiGucrPStRhcbu3GmH4ZZHPExUVqKC5KTNE=;
 b=TEUDwHugOlDARK5/PgrSs+m57fyUAKQ+ezjCjGVH9wSY5rquCGXEIqz78rbyvz3q+6
 dbfgrfpY1X99iqyx8jG2BgBjErs/kZwKXGi1PmUReZfUn4yFFyzxRdvYqUmueqbx3EDg
 5dmVGY1ReWiJNe6OWCrx3+dJXK0EWA+B76fZmMWa3ASR175qH3TLtUR5QAWDLrK47gz9
 8IXMI/bDfACX2CiY+CHHBvOxD4cv2RJd+Y0SBP61FcUtkvbIOMqYmk6BwthYuyRbHoaq
 vgyf+oG2wzF38C4tpPPlEfTaS99pIyNCdMPZcpyWQuAcbPDYK/O80pLda5dOio39tthB
 Dc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2QFptVeNUiGucrPStRhcbu3GmH4ZZHPExUVqKC5KTNE=;
 b=PN0s6KmEhCmJzVpIeBqo3ykdR0G0mjHk9s99Xcj2Mh84fsaSS1iw+kNh5Gl0qyjSaz
 JP/YM6CcSgpl01vDq75yTgPs+sT+LtTm5UETZDZF+1/RhVN190AmsjND22OTl4ilDODl
 qyJqgZxfNjpoFUMxxpCOrJ3HPUAthEltaJuoxF48Rb+Wbcta0/lkqVtRDI4GWzRHYYcE
 F+AY6ZDtc9brIJ0k4eBh2oep23hITffaU8jEnQF4N7Poq8l4CqccGZ8MG51XTEfYYCzQ
 Zv1ZNCwRoj3mugxsLP4oMhuYPR+fW3anzZVxERc5Nb6as8y/wyU4STegKrCTNYvK9kXm
 wLrQ==
X-Gm-Message-State: AGi0PuaRBI8zZ6mCgFcsYRnPRu6Q14rBgR0VczAosxyncfgL+I2WhVpu
 nMVjnKN3gx17UO5SbdpTVwA=
X-Google-Smtp-Source: APiQypKmWbt8lj9u0K6Q8MSDHiXGVwacgaiLnfiCNuXjDcwsnRsHUXCWXg3gmbfoan5C/msPR1zi9g==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr39007886wrv.87.1588191431421; 
 Wed, 29 Apr 2020 13:17:11 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q143sm9923623wme.31.2020.04.29.13.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 13:17:10 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC v2 00/11] dwmac-meson8b Ethernet RX delay configuration
Date: Wed, 29 Apr 2020 22:16:33 +0200
Message-Id: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_131713_183526_36AD1F97 
X-CRM114-Status: GOOD (  13.37  )
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
Cc: jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Ethernet TX performance has been historically bad on Meson8b and
Meson8m2 SoCs because high packet loss was seen. I found out that this
was related (yet again) to the RGMII TX delay configuration.
In the process of discussing the big picture (and not just a single
patch) [0] with Andrew I discovered that the IP block behind the
dwmac-meson8b driver actually seems to support the configuration of the
RGMII RX delay (at least on the Meson8b SoC generation).

Since I sent the last RFC I got additional documentation from Jianxin
(many thanks!). Also I have discovered some more interesting details:
- Meson8b Odroid-C1 requires an RX delay (by either the PHY or the MAC)
  Based on the vendor u-boot code (not upstream) I assume that it will
  be the same for all Meson8b and Meson8m2 boards
- Khadas VIM2 seems to have the RX delay built into the PCB trace
  length. When I enable the RX delay on the PHY or MAC I can't get any
  data through. I expect that we will have the same situation on all
  GXBB, GXM, AXG, G12A, G12B and SM1 boards


Changes since RFC v1 at [1]:
- add support for the timing adjustment clock input (dt-bindings and
  in the driver) thanks to the input from the unnamed Ethernet engineer
  at Amlogic. This is the missing link between the fclk_div2 clock and
  the Ethernet controller on Meson8b (no traffic would flow if that
  clock was disabled)
- add support fot the amlogic,rx-delay-ns property. The only supported
  values so far are 0ns and 2ns. The registers seem to allow more
  precise timing adjustments, but I could not make that work so far.
- add more register documentation (for the new RX delay bits) and
  unified the placement of existing register documentation. Again,
  thanks to Jianxin and the unnamed Ethernet engineer at Amlogic
- DO NOT MERGE: .dts patches to show the conversion of the Meson8b
  and Meson8m2 boards to "rgmii-id". I didn't have time for all arm64
  patches yet, but these will switch to phy-mode = "rgmii-txid" with
  amlogic,rx-delay-ns = <0> (because the delay seems to be provided by
  the PCB trace length).


[0] https://patchwork.kernel.org/patch/11309891/
[1] https://patchwork.kernel.org/cover/11310719/


Martin Blumenstingl (11):
  dt-bindings: net: meson-dwmac: Add the amlogic,rx-delay-ns property
  dt-bindings: net: dwmac-meson: Document the "timing-adjustment" clock
  net: stmmac: dwmac-meson8b: use FIELD_PREP instead of open-coding it
  net: stmmac: dwmac-meson8b: Move the documentation for the TX delay
  net: stmmac: dwmac-meson8b: Add the PRG_ETH0_ADJ_* bits
  net: stmmac: dwmac-meson8b: Fetch the "timing-adjustment" clock
  net: stmmac: dwmac-meson8b: Make the clock enabling code re-usable
  net: stmmac: dwmac-meson8b: add support for the RX delay configuration
  arm64: dts: amlogic: Add the Ethernet "timing-adjustment" clock
  ARM: dts: meson: Add the Ethernet "timing-adjustment" clock
  ARM: dts: meson: Switch existing boards with RGMII PHY to "rgmii-id"

 .../bindings/net/amlogic,meson-dwmac.yaml     |  23 ++-
 arch/arm/boot/dts/meson8b-odroidc1.dts        |   3 +-
 arch/arm/boot/dts/meson8b.dtsi                |   5 +-
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts     |   4 +-
 arch/arm/boot/dts/meson8m2.dtsi               |   5 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   6 +-
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   6 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   |   5 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   5 +-
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 140 ++++++++++++++----
 10 files changed, 150 insertions(+), 52 deletions(-)

-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
