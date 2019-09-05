Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E319C3A5A5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 11:49:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FAE32145D
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 11:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EM8nBgkL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FAE32145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:To:Subject:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GCqbbqkFk3FWOX3fMpLZQf/dBQCBd2n6TdlF4fijSJk=; b=EM8nBgkLoIXqsbG0ofOp1H2Xh9
	jQfYPGrn1CoreUZOxJ73X6A+CwvbBGgfQtWxtV0Uq+FsWSF08zUn/koO44/XlgAv8sZQVU6RiZrfh
	o8GNxhX8gRkMjHdhPNjk7ch4iqnaDdRP3aKyJKBZEalaxeVoEQLqzuqsmxwLzRCGt0NisXbybDiI0
	2EMJnxCRbhtJXPeqZ0BwM2hpQyS6dT2g+IZNjZx3gffbp9AEcLIW4quPgGG/lUZjV3VN2G/X2dQw4
	fpoaaFedEJ2jXFwOaB0pQQzHCPd+AU7nyOOEPuDoLiqPOvHFv9OK1tNf5RBjjeM+iIad3WgaBTs1m
	X5tqqDYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5qG1-0000vn-VP; Thu, 05 Sep 2019 11:48:58 +0000
Received: from dd10532.kasserver.com ([85.13.133.80])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qFz-0000vQ-FI
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 11:48:57 +0000
Received: from odsus.home.arpa (p57B0B64C.dip0.t-ipconnect.de [87.176.182.76])
 by dd10532.kasserver.com (Postfix) with ESMTPSA id 0B54F1F42CE8
 for <linux-amlogic@lists.infradead.org>; Thu,  5 Sep 2019 13:48:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by odsus.home.arpa (Postfix) with ESMTP id AFE363C97F
 for <linux-amlogic@lists.infradead.org>; Thu,  5 Sep 2019 13:48:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at home.arpa
Received: from odsus.home.arpa ([127.0.0.1])
 by localhost (odsus.home.arpa [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9cvBvc7gY1M for <linux-amlogic@lists.infradead.org>;
 Thu,  5 Sep 2019 13:48:47 +0200 (CEST)
Received: from [192.168.201.4] (unknown [192.168.201.4])
 by odsus.home.arpa (Postfix) with ESMTP id EDD7C3C5BF
 for <linux-amlogic@lists.infradead.org>; Thu,  5 Sep 2019 13:48:46 +0200 (CEST)
From: Otto Meier <gf435@gmx.net>
Subject: [BUG] wrong pinning definition or uart_c in pinctrl-meson-gxbb.c
To: linux-amlogic@lists.infradead.org
Message-ID: <b99e39ce-30b9-4def-3b98-eb463e5ae57d@gmx.net>
Date: Thu, 5 Sep 2019 13:48:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------041CDF05EEF079D144992B22"
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_044855_672000_21326196 
X-CRM114-Status: UNSURE (   6.29  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.
--------------041CDF05EEF079D144992B22
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi i tried to use uart_C of the the odroid-c2.

I enabled it int the dts file. During boot it crashed when the
the sdcard slot is addressd.

After long search in the net i found this:

https://forum.odroid.com/viewtopic.php?f=139&t=25371&p=194370&hilit=uart_C#p177856


After changing the pin definitios accordingly erverything works.

Uart_c is functioning and sdcard ist working.

Patch attached

Bye Otto






--------------041CDF05EEF079D144992B22
Content-Type: text/x-patch;
 name="uart_c_pins.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="uart_c_pins.diff"

Hi i tried to use uart_C of the the odroid-c2.

I enabled it int the dts file. During boot it crashed when the
the sdcard slot is addressd.

After long search in the net i found this:

https://forum.odroid.com/viewtopic.php?f=139&t=25371&p=194370&hilit=uart_C#p177856


After changing the pin definitios accordingly erverything works.

Uart_c is functioning and sdcard ist working.



--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c        2019-08-26 18:24:45.450089334 +0200
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c        2019-09-05 13:07:38.518637214 +0200
@@ -192,8 +192,8 @@ static const unsigned int uart_rts_b_pin
 
 static const unsigned int uart_tx_c_pins[]     = { GPIOY_13 };
 static const unsigned int uart_rx_c_pins[]     = { GPIOY_14 };
-static const unsigned int uart_cts_c_pins[]    = { GPIOX_11 };
-static const unsigned int uart_rts_c_pins[]    = { GPIOX_12 };
+static const unsigned int uart_cts_c_pins[]    = { GPIOY_11 };
+static const unsigned int uart_rts_c_pins[]    = { GPIOY_12 };
 
 static const unsigned int i2c_sck_a_pins[]     = { GPIODV_25 };
 static const unsigned int i2c_sda_a_pins[]     = { GPIODV_24 };
@@ -439,10 +439,10 @@ static struct meson_pmx_group meson_gxbb
        GROUP(pwm_f_x,          3,      18),
 
        /* Bank Y */
-       GROUP(uart_cts_c,       1,      19),
-       GROUP(uart_rts_c,       1,      18),
-       GROUP(uart_tx_c,        1,      17),
-       GROUP(uart_rx_c,        1,      16),
+       GROUP(uart_cts_c,       1,      17),
+       GROUP(uart_rts_c,       1,      16),
+       GROUP(uart_tx_c,        1,      19),
+       GROUP(uart_rx_c,        1,      18),
        GROUP(pwm_a_y,          1,      21),
        GROUP(pwm_f_y,          1,      20),
        GROUP(i2s_out_ch23_y,   1,      5),

signed off Otto Meier gf435@gmx.net


--------------041CDF05EEF079D144992B22
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--------------041CDF05EEF079D144992B22--

