Return-Path: <SRS0=3Avb=UO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C851C31E47
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:44:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1894920861
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l9jEbXET";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MQf6ojqw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1894920861
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+kHXlY281vpl28oKaYbE3lrj93nOaR7FOzAf8qpYPcs=; b=l9jEbXETDvzbG6
	1h6EZBoFXHU2KEk1bqWyyZXCfaZe3kFYSyX1gcKymYL2HPibM83hJDnxdHDFxpQIS60s5/uC1WdrB
	gvDJbtDXo05AMQ1ObBqdjzb89u30y7cWUKlhpn19gn7cdzt4D7lTPRjR0y6X3JR0TVYhTHRTTrPXU
	3XJmLCgz1dnNCundJQftuzeyWdimbTULRWmiDjjNgFuSG3mUl3BmYc1qqvHcG5uDZ7g+a6T0mNbWf
	Zg3ccoxMjwTcxN+gNgdNrmzHnk/cuI4VzH+HKN1MSyyx1luc41udGWWYstJMUBre3t3uM0d1Uh1HO
	0YJAjzDl4lBubmD59R2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hc6AJ-0002se-CW; Sat, 15 Jun 2019 10:44:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hc6AG-0002rf-Ia; Sat, 15 Jun 2019 10:44:06 +0000
Received: by mail-wm1-x342.google.com with SMTP id w9so1090974wmd.1;
 Sat, 15 Jun 2019 03:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S3R0LLQ//2yFv2nqx2NreLb9B1XIfmWQYrxaoZNL4Ck=;
 b=MQf6ojqwu7MV9sf8fWDTviQXFdJqej3YOwrHVJ+F2m/68WDUtAtHzkCB+lHcPCixmr
 tSPH088SJOIAnbJnhxw07fTgiTIR6IhLmQnSdZzn6wksWy2e7G6GV9bDJje8cGjKCNqx
 hckzo6Wi7Xqm1e/a9kQluxyJZvxro9poTdi0DxOUixNPONqjEw9F46KwWbNmfroOpL4M
 ena0Vl2y+0I6wjtMRDT3jTzeubVPcV1U6aRkDe4V0XZgBJ0vWmmUzULR12vdFglChv6j
 FC+7sdl91L888HeoKuNYjFAZwj16J89kS0AfAF+T4jmTDu7Z6BDg4yADViHkRzPsx3BN
 cdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S3R0LLQ//2yFv2nqx2NreLb9B1XIfmWQYrxaoZNL4Ck=;
 b=DhDpZn832rput+rka38bDxW2c3kkt7NL7PJ05a6YCVUdxe7TeDbqPNxRupSy9rh6fh
 3Jxbi2YLCVBvHddicqLEOURm3Ro9Yejv9WeZPvTGm+8syd6Ci4cw86Y5xLH9hM1SLYAS
 2nT+ubv59s6rHfUTreFRx9WAOTpCdjOwuYaLkrQfCUIT8lSnOZCngZnxQh/7Um3eRYhc
 Q87YtayGzuSH1iFD05Yfs2n4mmHX1JJ95goibhxNTSphZASLys+bIKQ7gdVjA7s8I2sd
 LQHaIqiRlRyUEE0YTwXFMdLBppr+ugUHrnubkLVvs0ED8UkLAjIGObZv4cPkn/Qt+qL5
 x39A==
X-Gm-Message-State: APjAAAWnRlPaNRaj5mxS3vuRUKnTcS34Jn4JU6zYJj81LdFoLhoy8Smo
 p2RHc3ovkv7MAkc227Mif2sXPfmGjwo=
X-Google-Smtp-Source: APXvYqz3AGrVhz452+J/j0VdwEw70KSPpUUFJPajmLt/Zzo9mouiFNZ8nzMbqMSyjVK6NYISxyrFng==
X-Received: by 2002:a1c:e709:: with SMTP id e9mr6283589wmh.144.1560595442668; 
 Sat, 15 Jun 2019 03:44:02 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C20E00A9A405DFDBBC0790.dip0.t-ipconnect.de.
 [2003:f1:33c2:e00:a9a4:5df:dbbc:790])
 by smtp.googlemail.com with ESMTPSA id l12sm16761120wrb.81.2019.06.15.03.44.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 15 Jun 2019 03:44:01 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 0/2] arm64: dts: g12a/g12b: add the Ethernet PHY GPIO IRQs
Date: Sat, 15 Jun 2019 12:43:49 +0200
Message-Id: <20190615104351.6844-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_034404_612588_B13CB654 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Avoid polling of the PHY status by passing the Ethernet PHY's GPIO
interrupt line to the PHY node.

I tested this successfully on my X96 Max, but I don't have an Odroid-N2
to test it there. The reset and interrupt GPIO part of the schematics
seems to be identical for both boards (and probably other "reference
design" based boards as well).

This depends on my other series "Ethernet PHY reset GPIO updates for
Amlogic SoCs" from [0]


Changes since v1 at [1]:
- added Neil's Tested/Acked-by (thank you!)
- rebased on top of v3 of my other series
- updated cover-letter since the GPIO interrupt controller support
  is now merged so it's not a dependency anymore


[0] https://patchwork.kernel.org/cover/10997069/
[1] https://patchwork.kernel.org/cover/10985175/


Martin Blumenstingl (2):
  arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY interrupt
    line
  arm64: dts: meson: g12a: x96-max: add the Ethernet PHY interrupt line

 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts   | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
