Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BC1C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jQr6RK/l+lFGMsmWZI4kYcdaH6nhbuAJFYMNXhRpovk=; b=S3+2Ba88slgu2J
	NjyO9COhEnHxcVeJ/wzbRdYvwJBTr4tKIoqjWIP1MkyBGeQRwbIGyJz5ZTS16v9Boa/sJBC9TrWY0
	FJcD5ek6l12Y+DsnYiWEWchCr2cQpo0odxgOdQ9y9QPBF/n6nF5WWAzgCJvz4lKvQzGxuX0O6L4Vc
	Ct39Lqg+N60jaPggf0ZnpKJ4/bFhh7/Z2ABOpDJ9Jk3Yoo3rTmCSK5MaGJ8entz6MARGx1STQc+6Q
	S5RefZb+67tt5em+BuMxb8yRzmwk5xCl/uj4m2FaQwNDu1tIfqOk8eM8r/4hTdsl7Wfuz7SF6Xrfq
	+dioXebpO5Qb6hCLy6kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY3ZH-0047on-Lh; Sat, 26 Mar 2022 10:22:47 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY3Z4-0047li-UU; Sat, 26 Mar 2022 10:22:36 +0000
Received: by mail-wr1-f50.google.com with SMTP id t11so13816566wrm.5;
 Sat, 26 Mar 2022 03:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d3ncUlwyfN23LAHneA+x8RC86+EtUpdCtRwDExYqA3A=;
 b=TkRNjTf0xlMK8XbHp1E+4AfHeFUCPamYYLQGSpklIq8y+Pt6MEs804DGGVB2GEjgj3
 5kUSUd6pjfpo9QjpFY1hsx4EnzDQW1ldM+YtO9m8X7Mu+yrmq3bHeahUk+bR0df4hkIX
 nIOD6oIfOtnZU65ElyflDp+CHG7iWIJyuFXZI/gVYMHarshrfebquqW61wTvgWrgLatO
 yR+CYsVfOo85FgdxlMd1s8NGQlxC0XsQrawebXVPNqk0/Vp7+5iunoBPePmOvIU2dGQJ
 qBvnrkgsqGi8BueNBD/xVCTSOPFAzFn3Tl8G1nWu9ZuV3WfI3h1eqp0SVahaa5CBT80N
 HLxA==
X-Gm-Message-State: AOAM5329MnJbc6IltetK+nwm/XqnXqQ2EzXVcRdQD6d771TqkSLH7A0f
 fZtuVhFHk5ADa/G5fURH1FOQ3r6M9/s80g==
X-Google-Smtp-Source: ABdhPJzdOmzoCWz7kkm5nG90337ILbCEmW8zPe4Ns407o7zoP4CeAmc5ADHNH6TPDEncX+twTvWSYQ==
X-Received: by 2002:a5d:5189:0:b0:205:9c7b:d374 with SMTP id
 k9-20020a5d5189000000b002059c7bd374mr9465343wrv.551.1648290152787; 
 Sat, 26 Mar 2022 03:22:32 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net.
 [82.11.51.62]) by smtp.googlemail.com with ESMTPSA id
 l15-20020a05600c1d0f00b0038c8ff8e708sm6683057wms.13.2022.03.26.03.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 03:22:32 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanure@linux.com>
Subject: [PATCH 0/3] Ensure Low period of SCL is correct
Date: Sat, 26 Mar 2022 10:22:26 +0000
Message-Id: <20220326102229.421718-1-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_032235_008628_9BCB7D67 
X-CRM114-Status: UNSURE (   5.25  )
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

The default duty cycle of 33% is less than the required
by the I2C specs for the LOW period of the SCL clock.

So, for 100Khz or less, use 50%H/50%L duty cycle, and
for the clock above 100Khz, use 40%H/60%L duty cycle.
That ensures the low period of SCL is always more than
the minimum required by the specs at any given frequency.

Lucas Tanure (3):
  i2c: meson: Use _SHIFT and _MASK for register definitions
  i2c: meson: Use 50% duty cycle for I2C clock
  i2c: meson: Remove meson_i2c_data

 drivers/i2c/busses/i2c-meson.c | 104 ++++++++++++++++++---------------
 1 file changed, 56 insertions(+), 48 deletions(-)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
