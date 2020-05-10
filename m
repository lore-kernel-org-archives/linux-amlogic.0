Return-Path: <SRS0=YblX=6Y=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB94C38A2A
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2020 12:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 129632080C
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2020 12:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PrhncCTO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoPU/c2q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 129632080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8J2hvy4T+plfsqBGv0KbjkpCa1jjdj7DFP8Aqf289gQ=; b=Prh
	ncCTOKS1T8YUjsB8tsC/n3S4zD+9w4AkVSb0VTvOgjQxe2ld7xpyYYyvk5jfkeYxAUxQ00bUA0oE6
	NhHitUd7m7DmE/NmsyEl3oxHOAeBebr9G0QAa4ARVSdQ1x5KgH8zZXfrdW/X1Ty8dvFKd4xUiGyUD
	qg6T+Yjmqb57m4V/TCWT4X/dxucT3ecU8DZXiR0Nwr01jqlsNZ7zytGsZbKqhBMSQvHElK5bf0C6j
	DxsnosYUjtDCBCrkhzGWW9oooaA/oWknh3kQCLHKUBB65pascbKy0M22F4cFvIUHBId8UV9yQ3+gl
	/zftY9lJVDTzIvpC8k3EUI+4mgMAtFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXlHS-0003nV-Gn; Sun, 10 May 2020 12:42:06 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXlH1-0003Lu-Cj; Sun, 10 May 2020 12:41:40 +0000
Received: by mail-lf1-x143.google.com with SMTP id r17so2031701lff.9;
 Sun, 10 May 2020 05:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0AyjPmU7cn4BL2KfMfomHiNoXCghCD471CVQpZJ9/fA=;
 b=VoPU/c2qR6kaasYGmq75epVPaJ7EX1CNYybYsdh1EZdTegUmWKOsLBAQKv7hp6p7aU
 ulB/CtLmA4KHX72RDM+ppAU1bq9rQr9aqgmhYCavrPhj3B0nrQ0t0HLkW+a0aKTdqmWd
 Ot9Os80PYnd6NTDwshKerDa9nsLLwr9P+eyTda6LWBOXCqLkd6txcB8VjCgiJGm5h2V2
 IbgTmoNcN1B78SzcOKwSUaeCe6ue9Ly/NBeqD0nrKgHG8mnBQm7ZhJZ6oS/SbY2D0XX4
 /7AxTN6barEYBGFroWlHEEndwZrCbn1udU55wkNcInSwI3UlOkFym/99parkpzIqmchB
 exgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0AyjPmU7cn4BL2KfMfomHiNoXCghCD471CVQpZJ9/fA=;
 b=K8V74CqoXpGxptBOhewBXtKE1qnYbm4MAFHcE8Tt3Zc/GUU/TGQwuU2vrR6gPMaOVi
 h+wxfmLnLITLQqxmA5ElNwy97w03KTU2eEu7dH2tg0BaeV6qWD0V4kq+lmDwJ9JegKO9
 PftAgX5TP45D0YPN4dRf+XI73VAQgUeOZlmufkbivYq/7sPKXN4pFMQFGHN9gvlg1uop
 nadRZCokfkYQfynvSFPymbDxqX3gjF0PhQRWTZ0WiLmw63eFdAtGkP3yIVrXjEppmlni
 zszCX9BJWQRVdNXcmayPzHhA70+QhTyOp2OHmNTc9C2gUojX6J2Zp3yygQ35E03aS/7N
 H5tQ==
X-Gm-Message-State: AOAM530QSS7MRD5BzvirI9hPD66GHTbAkag3dCyETxw757kolCxMWU8J
 BjNhee2ECReHcdC8rWyZApY=
X-Google-Smtp-Source: ABdhPJxmyYroaExtRfpqTEZIzCVhUi16AUhZ0f52+ranCiNyS1GYl1IwuOIihO9UzZuRtWlWB9vIiQ==
X-Received: by 2002:ac2:57cd:: with SMTP id k13mr7748654lfo.104.1589114494913; 
 Sun, 10 May 2020 05:41:34 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m11sm7136611lfo.55.2020.05.10.05.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 05:41:34 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/3] arm64: dts: meson: add dts/bindings for SmartLabs
 SML-5442TW
Date: Sun, 10 May 2020 12:41:26 +0000
Message-Id: <20200510124129.31575-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_054139_461607_C9A8B195 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds new bindings and a device-tree file for the Smartlabs
SML-5442TW set-top box which is based on the P231 reference design.

As requested, I have reworked the device-tree on the p23x-q20x dtsi. I
have also re-added the BT device with new bindings that have now  been
merged in bluetooth-next for inclusion in Linux 5.8. See [1].

v8 - reworked on p23x-q20x dtsi
   - add BT module

v7 - update gpio-led nodes
   - remove gpio-hog for BT enable
   - add bindings acks from Rob

v6 - removed audio nodes again

v5 - typo in card name

v4 - typos/corrections from Andreas
   - convert to yaml bindings
   - add sound node back
   - confirmed gpio-hog is necessary

v3 - change to Smartlabs LLC
   - removed sound node

v2 - removed audio nodes
   - changes soundcard name to "meson-gx-audio"
   - added missing uart-has-rtscts;

[1] https://patchwork.kernel.org/cover/11504823/

Christian Hewitt (3):
  dt-bindings: add vendor prefix for Smartlabs LLC
  dt-bindings: arm: amlogic: add support for the Smartlabs SML-5442TW
  arm64: dts: meson: add support for the Smartlabs SML-5442TW

 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxl-s905d-sml5442tw.dts | 80 +++++++++++++++++++
 4 files changed, 84 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
