Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE75C7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 16:42:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8616D21951
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 16:42:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JS4Itmql";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="umW0sPsi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8616D21951
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CNctDkp0jlTb8DJDiYkl69yDVLzbzf2DLVPY3tNq2fs=; b=JS4
	ItmqlGfejCuAJRf86aFiOuhx+hKldN7gYsJzkvc1gyqEuGqxNBjN1mZOn4xg7eLkw+C48oKYJjIXd
	w0qz6ZCpV8ApeErOGduuUhlkD9mIuJXinFA2a/f0J8u3dyITERvCTVZ4Oy3pS4fw8QUChkSp1b+qO
	oeb8HGHC9nqikk3+Kdmb0gfkcL6xd09wkYoLS3hZV9o8P/+Ef/ZbiYNUa+/SZc80LVY4ZiGLo9a+D
	SxEIgiqr3uwLVrja6x1UGYd1FhNzbtZ96ZGofnKbQykygFxERDvJbf4Gcq6UBnfVvimJZ1jUWQKme
	mXafn4JBKtORYEiZfJS2b+dNfkpwcpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqgog-0003Vv-3L; Thu, 25 Jul 2019 16:42:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqgoL-0003GL-RJ
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 16:41:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id y4so51515240wrm.2
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=k3owj89F9XfdBkrf47dCANR14zVA50NeVSBAUPPeOPs=;
 b=umW0sPsijyVEs9DewxFfVmBnd2sgqpy2A5TDYly45YOZVg+e6lcZGkAsggcArbEi1o
 he4Cg9YBfldmG3hxvat9Naz2uLBE/pRRenuCA6Kddum/X3DPqXkdn999wFqDb0gQ8mnN
 1nQQ12cfttNg0NMX4LGYQ3ejD4bJj67nWPOE9qXxn9eF5otUBqDmqJCFRCxrHQWl7Ufw
 xkRiVOQGhCkI0hiOWyMYBbxltt2IuBW1XihVA42EoN0IcVTYgBAo9qoOydRjP3QvUT9E
 p8mGmfrJ931/M+hbgxFfqwEdwflDVYx7cH1S9yqiydezGJxgIv7bLVg961Cd+y8BySES
 k3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=k3owj89F9XfdBkrf47dCANR14zVA50NeVSBAUPPeOPs=;
 b=ngTUzRUxs0tj0Zj+aCP2vIKOSaYCaUcVpd1vvV/ys42HzKe7H1ZNNjwKn1uaNlhNE0
 qJfD+KwUZ45GAnBpEKqxXQBoYADfKnfPUf+4aYfZpJwN9htnC5oE/Lir1o358EyPmYl7
 RekyGD7roJAyMqVkmXCYmyz3Q1+0gyj8KhF5sAIo+uPIDeRy7rw/NBnJfo1QrA0LcpHy
 ysi+2zf4j0HwfB1+HV8xYBJ50YJKA9o1wXL7Gf89OFutZR8SghqdTxI3oTcARw6YE/ov
 FfVPkiHTAikFyIWOEh2vQZTQMWghCAizSYDRLHmyHablfYh6JOZAXbcQSjAVNq5/pyjI
 NawQ==
X-Gm-Message-State: APjAAAXb7+rITJobFkLuIrVv1XpMPWJck97gQcFAXeOa2HnV2XTQcor8
 7eQqiwu7TIiODbsLzlTv5mneow==
X-Google-Smtp-Source: APXvYqz7o0o69gasiQIG+rfUkpDkVoXb5hycjwGXWhYjF6LgNk/JI9765FCz1bEwLJOV1/QXnPsxmQ==
X-Received: by 2002:a5d:5448:: with SMTP id w8mr95321121wrv.180.1564072904380; 
 Thu, 25 Jul 2019 09:41:44 -0700 (PDT)
Received: from pop-os.baylibre.local ([2a01:e35:8ad2:2cb0:2dbb:fac9:5ec0:e3ef])
 by smtp.googlemail.com with ESMTPSA id
 y16sm102488858wrg.85.2019.07.25.09.41.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 09:41:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 0/4] clk: meson: ao: use the new parent description method
Date: Thu, 25 Jul 2019 18:41:22 +0200
Message-Id: <20190725164126.27919-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_094145_887495_32DC177A 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Meson SoCs clock controllers use the string comparison method to describe
parent relation between the clocks, which is not optimized.

Its also use bypass clock made from device-tree clock to provide an input
clock which can be access through global name, but it still not optimal.

A recent patch [0] allows parents to be directly specified with
device-tree clock name or without string names from localy declared clocks.

This patchset replaces clock string names by clock pointers (as possible),
removes bypass clocks and uses directly device-tree clock names in parent
assignment.

Tested on GXL, GXBB, Meson8b, AXG SoCs by comparing the clock summary
(orphan too) before and after migration.

[0] commit fc0c209c147f ("clk: Allow parents to be specified without string names")

Change since v1:
- Improve clock parent assignment for "fixme" using name instead of fw_name.

Alexandre Mergnat (4):
  clk: meson: g12a-aoclk: migrate to the new parent description method
  clk: meson: gxbb-aoclk: migrate to the new parent description method
  clk: meson: axg-aoclk: migrate to the new parent description method
  clk: meson: remove ao input bypass clocks

 drivers/clk/meson/Kconfig       |  1 -
 drivers/clk/meson/axg-aoclk.c   | 63 ++++++++++++++-----------
 drivers/clk/meson/g12a-aoclk.c  | 81 ++++++++++++++++++++-------------
 drivers/clk/meson/gxbb-aoclk.c  | 55 +++++++++++-----------
 drivers/clk/meson/meson-aoclk.c | 37 ---------------
 drivers/clk/meson/meson-aoclk.h |  8 ----
 6 files changed, 114 insertions(+), 131 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
