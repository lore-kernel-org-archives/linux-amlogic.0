Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83335C04AAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:03:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D12320863
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:03:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MIMQp44n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="uwN5cQla"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D12320863
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Dlfwcz8PsgWrDPiX0DJ+Uq82DF9vdzMvCpVMnpORKU=; b=MIMQp44nN85a++
	TH+6KxZ16QpF6bDBWvwM1K2SbQNSx73eo53cQxjUWImX0bXpa5DXsAp4KtiyhOPBCyVi07IMADZgH
	vtABfqo0V2ONF7Wv6pTEKi8vVGhAHcRAuSBzA/Z0uVN0gBBBn2VkHeldKhfjZS7OAej8E7XJlhL7Z
	GSIBLZzMQbNVNbUOrzwvr84t2wGCRBRK28dnWlExQO5T1/DHrOmYmSZy2qe6tTOyscjCsoTC+NrvU
	uZRij8PTu9d4FhP7fB2qADbvRtyg5Tx2Fo6Fmcvg5bW6sdRiYyfsH7DzLZAjqtx4TQInObvm7Emt2
	0NXuPyS3U8QvQBPFO4/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoVR-0001Z1-5O; Mon, 20 May 2019 20:03:33 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoVO-0001Y0-7N; Mon, 20 May 2019 20:03:31 +0000
Received: by mail-wm1-x341.google.com with SMTP id i3so588055wml.4;
 Mon, 20 May 2019 13:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xT9LsbSrOL4FALnwbx2ofAhC4bhcSjUh2MzuU+lqDs=;
 b=uwN5cQla9irCx0v4W2hkNijVJtfeA9waG/LHN1YD0qXyMNu6GkrZbBIb6DJORVeUny
 p4SwwAmj/s6Tj4HNjwS6mDcaXJG6tdz28eSMPFoF3WGcC79XmcN9yp1lNmjdMSEtvAym
 JO8MK4Dy+DaLnsA2jipx5mYqBYM5Qc17fIikbMCnZHOUtRIP35+QZlkEKw7t6TFsUnNg
 KPclioq3Lybqyw3QeeMhLRshNhTo3WWyH47bf6sxkT2Y2n7Qp3A2wY5FJFsm8W+eVv/7
 xBkjhE1lg7ZGH+ff+DDuTdz5Kl3QEc/7Ca7ssZoKkcgyZ0zstqc98b7nUo0HOjglJ1H5
 m0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xT9LsbSrOL4FALnwbx2ofAhC4bhcSjUh2MzuU+lqDs=;
 b=Of3R78EwuMd/yiKYBUpx1QAB2SFr72APH6nf6DmNYh6MBWvlldZ3Cx6/EWuBv1HlHu
 Y5XEt+zNMth/edrJ0eQnp/yMaPBhMp6mujpZJMx9WCL6pujhhKWptZNqU5rLxrQHaQlX
 d7iu70dF5LGC2x9femyPkRx8xgqSVT5pnRXf3bTY4v5eueX//H2cmP/O8YraWFHBXirQ
 CHJVCXsMjH6bdA3IRp9yFKSTLt1ftR3hifd/zYV/fSkYlQ+OvuNEO37DQWl//1NqwxLg
 gOoD9twTamBF6Xens9dqSMcyvLa7lRrAwHtQEfMMCkX81OQM9QsUobzb3E/KU7ggo/0P
 nS6Q==
X-Gm-Message-State: APjAAAWdEbWDShzcebwB718lp7Xn61W6JRnh6vA4QLgwseuDy2ecnjg3
 KeJY9+2yxfZE5hf/GdmRvQ0=
X-Google-Smtp-Source: APXvYqyIBv3ZBYENvn1vZbkmjXYL3k1GAmMzrTiWl9qygnfnwTHVClk1T7WYtr5kFVF0lErt4XfxyQ==
X-Received: by 2002:a1c:c016:: with SMTP id q22mr600345wmf.6.1558382608612;
 Mon, 20 May 2019 13:03:28 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id t7sm23583379wrq.76.2019.05.20.13.03.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 13:03:27 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 0/4] 32-bit Meson: audio clock support
Date: Mon, 20 May 2019 22:03:15 +0200
Message-Id: <20190520200319.9265-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_130330_288341_FF179EAD 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The audio clocks on the 32-bit Meson8, Meson8b and Meson8m2 are
(probably) identical to the ones on GXBB, GXL and GXM.

The first piece of evidence is that Amlogic's vendor kernel is using
the same basic driver (just slightly modified) for the 32-bit SoCs [0]
and 64-bit SoCs [1].

Then there's buildroot-openlinux-A113-201901 which ships
kernel/aml-4.9/drivers/amlogic/clk/m8b/clk_misc.c. It contains the same
registers and bits (just slightly different naming) than the mainline
GXBB/GXL/GXM clock driver.

There is no working mainline ALSA driver for this yet so I am not 100%
sure that everything is correct. However, due to the evidence listed
above I'm sure that the basics are correct so this is a good starting
point.


[0] https://github.com/endlessm/linux-meson/tree/d6e13c220931110fe676ede6da69fc61a7cb04b6/sound/soc/aml/m8
[1] https://github.com/khadas/linux/tree/1bd6972cd0093725c0b1dc87f6546648bbb22452/sound/soc/aml/m8


Martin Blumenstingl (4):
  dt-bindings: clock: meson8b: add the audio clocks
  clk: meson: meson8b: add the cts_amclk clocks
  clk: meson: meson8b: add the cts_mclk_i958 clocks
  clk: meson: meson8b: add the cts_i958 clock

 drivers/clk/meson/meson8b.c              | 154 +++++++++++++++++++++++
 drivers/clk/meson/meson8b.h              |   8 +-
 include/dt-bindings/clock/meson8b-clkc.h |   3 +
 3 files changed, 164 insertions(+), 1 deletion(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
