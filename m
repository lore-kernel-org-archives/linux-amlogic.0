Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFA6C3F2CE
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 12:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB349246B0
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 12:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGpdssWM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF+PnU8y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB349246B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Hc+hzEf2wYffB3fuDOgJvj2Qj+h2slP+05+XriBuGII=; b=LGp
	dssWMUkFZws7rsnhMniS+2c/YppyDFsS7VFI+AWg0Opu297fath+MGSJdn/EaatTuWv4rsXCcDzID
	GJX3oCKCsNAzf76rYQp3g/+kvSgGv48ZeXYCsaiC3ApwV0id8Y1OI6Ax4UReC6k+7UKkoTf0oYA7O
	BkiuQ1WIMaODW3553YPMnpb+2JXeYtsdKWw+1VUMEnuK7TnEREa0W5MfERtlHfMoVhS2GX9SKhspK
	CfC7QtikKWsw8Sp6zMhKCU6fxfwFSJE/Rhj978T7OjlNv08ry7WVWv07SdetaIOijtM2q9JKMlkje
	i5VKsJBMoqGJahfH4/eK03KVkpfwMjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j813T-0005HZ-GG; Sat, 29 Feb 2020 12:17:15 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j813B-00053u-O6; Sat, 29 Feb 2020 12:16:59 +0000
Received: by mail-lf1-x141.google.com with SMTP id s1so3631626lfd.3;
 Sat, 29 Feb 2020 04:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HUQahJ8jieCI4R4OACtWdxDB3DdcfhrTI/7VNOoaPK8=;
 b=fF+PnU8ypTPRYP2StXGZUT73bB/q0X22+IzS9vRlhTkiVKY2TQ7/D3RIQf809t0GID
 GQyq5z+7IGlHTP+Thu+DJ8pJ8CGEI9MjxzVXX+HsSgS5AeanZ9v5NTafVFIO/62vMLrX
 +OG7rW4w7XmgIyL1aWNB4zfB39z6Rl5IksWRdwjUJI9/rm2wRFxVSqJaA1RCfVVXOXsJ
 zurj3FLrv+kFuR2t+W+KISSdagPuLefEHgmZXbA8bRbLxbAfoaxH7IlcF3/fRm9dFJXx
 MdJ4jxvQ/9gSJplaJV3UEC10zSCWEeyCpP237XfweYQIDD7QoL1FeaqGwjHINgAOpvNn
 iI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HUQahJ8jieCI4R4OACtWdxDB3DdcfhrTI/7VNOoaPK8=;
 b=IJ0X+WL6T7fTO60OZJ24OZ6X3iP7UYBoUO3gw+DQpfMXf+EBxpHYk+FgiJz1jTXtR8
 sWGbJ3OtgRi5wnQ0pUgFwv5ogSzzpVjBr6F/ly7D8TMhqGJI3YQ3ym4lYG3E2L52ihAh
 RH40A12hTSPsbiz/15mLOQDUKtRg6Oa3IO2em78hAggLMv4SphG/3vCBfbQQ1VzU2rPG
 JFt/QTBj0BPLNIraIA/HB+a4WqCz5bAk1ux6ffmJx1wUNlEnptDbk1xyg5YoKJuzv/NR
 pM75ZnbdavYIjCUk2hGrqC5kLxELNsdXjXDAw7p92uptRDR9PcEkx+MaHkJ6OAewvm1o
 B5HQ==
X-Gm-Message-State: ANhLgQ3i2OG9Fcr/src7J7LcAkjHNrOPo/YusON6YTgH6p0Zb+pRTsIf
 st2mAOm5N0ieOowMhyVfdsg=
X-Google-Smtp-Source: ADFU+vsLBJTIEqIzdTzPSw9aHFuC1dvOqRssdzID6BwrYxGJAlETK+qn94/K1264KDgW4nbrqvGOCQ==
X-Received: by 2002:a05:6512:6c7:: with SMTP id
 u7mr5408308lff.176.1582978615322; 
 Sat, 29 Feb 2020 04:16:55 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x1sm6270232lfq.46.2020.02.29.04.16.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 29 Feb 2020 04:16:54 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] arm64: dts: meson: add dts/bindings for SmartLabs
 SML-5442TW
Date: Sat, 29 Feb 2020 16:16:01 +0400
Message-Id: <1582978564-81491-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_041657_810330_152C5A1E 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 =?UTF-8?q?Jer=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds new bindings and a device-tree file for the Smartlabs
SML-5442TW set-top box. The previous v3 attempt [1] was 15-months ago
but nothing has really changed apart from a change to yaml bindings. I
have checked and the hci_qca driver does not provide QCA9377 bindings
so there is no alernative to the gpio-hog for enabling BT support.

It would be good if Jerome would check the audio card config. It looks
correct from dmesg output but the driver is new and there's currently
no upstream prior-art to copy. I've cribbed node details from his WIP
gitlab branches.

v4 - typos/corrections from Andreas
   - add sound node back
   - confirmed gpio-hog is necessary

v3 - change to Smartlabs LLC
   - removed sound node

v2 - removed audio nodes
   - changes soundcard name to "meson-gx-audio"
   - added missing uart-has-rtscts;

[1] https://patchwork.kernel.org/cover/10674939/

Christian Hewitt (3):
  dt-bindings: add vendor prefix for Smartlabs LLC
  dt-bindings: arm: amlogic: add support for the Smartlabs SML-5442TW
  arm64: dts: meson: add support for the Smartlabs SML-5442TW

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts | 386 +++++++++++++++++++++
 4 files changed, 390 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
