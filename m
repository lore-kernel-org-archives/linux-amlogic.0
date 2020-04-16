Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05103C2BB55
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 18:37:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF30206E9
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 18:37:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tttpUTNy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FG9WLRGe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBF30206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rAc/+hJAUeQ5EZAlQ6b57yGEGp/Td+s9KYgBze8mCO8=; b=tttpUTNyOG8kth
	ZNnzqVvf6YMSXAsDT+wzw8JuRnBRYuaF6YQBtpGkP6ZaRVxXXZUcs+UxReUOcpNwpcp6kREx8M1m/
	V8zDWJidt8DJdNxv+noTuB/9seSclP5axkM63nC9hgrQ1H8Ye9fsrZpyyQT1rwh2Ipwgv4wCqYCKr
	+HYuiIpEnzI+kDyPMEfpHia0oMkXNhm51MjMoN9q880TptjjNKxxgSArylmO1bGXieoXBPQLADebW
	WW+dAUOqrjEUT6e21KfL/WqCIqKgSoAjfm4awIAJ3ca6ehVf91L8tdxqNFYtYtSd7dzv7mV8fpKxS
	VkxanVMUYTD87BTd0AIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP9OA-0003y0-PL; Thu, 16 Apr 2020 18:37:26 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP9O8-0003nv-0F; Thu, 16 Apr 2020 18:37:25 +0000
Received: by mail-wr1-x444.google.com with SMTP id j2so6016551wrs.9;
 Thu, 16 Apr 2020 11:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5aO4xzcD+0wNNf/PxxNiXuB2ikdc6r7QQ2PRhCRC3Yg=;
 b=FG9WLRGecEzt5yeGkGmmEEDa7GQwVbDWiOvSd9qjmkGgeQGFjYkiAo3br+2/TroUip
 dV+Ad4C2oS+YHZWy9GdT2Vxd7rXDbBW5OsT+xcDZqeO7TtT5ml+gbnoFMIkgSzs0sIjc
 jGemJiIb3YzPLELsNskzftGnUhPSnFdbwONV9Cyveq/qWS4XfW9sIwu2VoYz0P/3Gt+P
 AP1gaT/nhrXKaL4caHp6D8jQmY12FHzzSgpscu42dF8gJT/l/NcdTgkxCn/IJgjUwPax
 HdQ0GgaEHjxBjw30yu1v9b+6Xc7u/XM6XAacI/hE8p3JMIgSjwqO7rNjK/BzSqJg1P2J
 pkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5aO4xzcD+0wNNf/PxxNiXuB2ikdc6r7QQ2PRhCRC3Yg=;
 b=W0Ccwbpk+EoXY3945w2+MKZkrC3zuR0HtXRvyNB5kpqC2K7qcIB8HrEOVa1nyVibNG
 78WZ4lP3aFIzq1MFjPhKE6aDVVaasHpF5mKotHpe0Kfv8jcZkFMIsM6RoYm2+nJCv1SS
 VaD3+/JzdBcGj4CJSqqiXcjDdJq5Y4C154EyVaCDoJdIEsfV5F6im0DUWXzB4xbrCYEW
 0x1cWC8Hpkd7rUObKkkt1KO4b6BQXbRBvdrAc/IqsGWEKIyGRCPa1KFGGPxKUkCXklid
 Gq6rz6IKVSTrW3Bk4dXwy+zoORGH3Z9LMZBCpD/mrGwOuJopVpABZcUj6eGV7th1GAdW
 ksrQ==
X-Gm-Message-State: AGi0PuZmKM3gwiWDoUdJUkst5cYZydIw7bj3xuYcH9AwcLPHIlZH4+bP
 +nVcsCWncCbBeAllAgpdV0E=
X-Google-Smtp-Source: APiQypLF69djmNWJQ16igTe3DHck+hJYapQKt6rYlnZf9gHpnpETMKxfUYg/wmGaM5Csx0GhrQ9CWw==
X-Received: by 2002:adf:ee91:: with SMTP id b17mr6072924wro.109.1587062242718; 
 Thu, 16 Apr 2020 11:37:22 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v131sm4626434wmb.19.2020.04.16.11.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 11:37:22 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/2] meson-mx-sdhc card busy detection fixes
Date: Thu, 16 Apr 2020 20:35:11 +0200
Message-Id: <20200416183513.993763-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_113724_088496_9570F085 
X-CRM114-Status: UNSURE (   9.61  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following errors were observed with Linux 5.7-rc1 and an SD card
hooked up to the meson-mx-sdio controller:
  mmc1: Card stuck being busy! __mmc_poll_for_busy
  blk_update_request: I/O error, dev mmcblk1, sector 17111080 op
   0x3:(DISCARD) flags 0x0 phys_seg 1 prio class 0


At least patch #1 should go to a -fixes branch so it can make it
into v5.7.


Changes since v1 at [0]:
- added correct Fixes tag for patch #1
- added a patch which drops the ->card_busy() implementation from
  the meson-mx-sdio driver because this is not working
- special thanks to Ulf for taking the time to provide debug
  patches, explaining things and answering my questions!


[0] https://patchwork.kernel.org/patch/11483621/


Martin Blumenstingl (2):
  mmc: meson-mx-sdio: Set MMC_CAP_WAIT_WHILE_BUSY
  mmc: meson-mx-sdio: remove the broken ->card_busy() op

 drivers/mmc/host/meson-mx-sdio.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

-- 
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
