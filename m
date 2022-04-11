Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6BBC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqxNU7wvAQiSevYMYOiCj2BUEpCsXVn9kOdmH/N75JQ=; b=jxMf4WxxRcjmIm
	PYqc0wlE7rAOW67KPpjHdCfX6rmCny00RenykhI/JSi1s8LJmj8jo7QKpnfu41Gp2p3KA1GPcc7+M
	8jrZE40+KJT5CDTNQ86/wXy0xzSNxPyzDMH4PbPmJMFkqjXEdSL/kEPaSnzveQK7aPDKNv+LtIq6k
	izg7dEUahiJRwIuQGtt76WRd5f0C/8fM5nL9qtsiSVYUVKcn1v1NdiCDOxWa3IGHeBMwq4Avr2p7b
	DoorSDIVW4X1DfywioNeeFxbhKp+KNnJoKlYBcAeELytj10TjQ/epf7PtoFLWLCDDbi5m1gCiktz/
	TtH8AzjogWYHFmSsHc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndtYD-0092Vs-9N; Mon, 11 Apr 2022 12:53:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndtY0-0092TR-Fh
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 12:53:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id g18so6612176wrb.10
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 05:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H2Wa14/be/MapqwdEwUDQHMWBsanYigO3XT2Lr6Swoc=;
 b=K++AZqOu12JXzZwEh27ZnzSiLauYhZ429z4DGGxRxtltLvCIIPB8hbzu20nV3Lf5IE
 i50tR2SmPpo3vAyoivozenYAKfWdUATC1wpCrn14O4F/6thnVXiLB/4Eergew46a7BlP
 lA1KhCgyXEtoi/0rmgyS7Aco5A3slPKfo5bhMEooe72KmRbJfBcm73Jd8YIfvHQIijJ6
 Ea1xHzXEFjb0Ym+EufbtDsAKYApeaImPJiL0Rj7GYibVhA0jpveCDpOE+u8I5tJte2cU
 fQFk96Ksyn6eLgR6UbCKb1HKxo+zjw1enMfdQVuIszqYUytCrzC9CbPKYI1xrDChKqml
 cExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H2Wa14/be/MapqwdEwUDQHMWBsanYigO3XT2Lr6Swoc=;
 b=rn/w6mYxRp/VEW5lUHDNR0znoa4GDRDbDgu8Z2deYab3+Gz48bWh0wTUnpdY3nXoit
 RF4AKDZ8JzpqTwyiMmL+EIUcvBj4ta1v9xkln0xevX/slczohv0Z65Rrdhmdq6P1svLM
 +Zl0NhuBW3+uU4tBzhtT0gqq5vY3CfneAh4ljiL04cNezNEefmX3ojAh37DOL44kbxI7
 FSe52H3NmZI9N6zMyJ9+cYxqIHbSFB6IRC1VTMOUdLSV+1wKVrkL5UbGTZSuk5I5hQyV
 Gs5kjh9JKb9vCe15QYc/IHp9tRbRk808E7KAKNIge7hR0XmH5n3XuO9zxSS/NQZuYhYs
 t6IA==
X-Gm-Message-State: AOAM5338Wo1EgX3MD1Hl0nnp9R+h8gxBwjXGbMZ+SHNG+qgQT3oI47g1
 YM4QBxGMPl+wzEyo3oj5mb8/Sw==
X-Google-Smtp-Source: ABdhPJyKHLzX422TghnhzNrWqsYIgexNfpxMzJ6eMiGfRQI2foPOm76YuWIKjNXyDCksYKZV0Ft/XQ==
X-Received: by 2002:a5d:6b0b:0:b0:1ef:d826:723a with SMTP id
 v11-20020a5d6b0b000000b001efd826723amr25713546wrw.420.1649681614311; 
 Mon, 11 Apr 2022 05:53:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0038cb8b38f9fsm18613040wmq.21.2022.04.11.05.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 05:53:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-arm-kernel@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: alpa sort the board Makefile
Date: Mon, 11 Apr 2022 14:53:31 +0200
Message-Id: <164968160694.932109.7341549191882617182.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409064257.24453-1-christianshewitt@gmail.com>
References: <20220409064257.24453-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_055336_750024_6FE502FE 
X-CRM114-Status: UNSURE (   7.25  )
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

Hi,

On Sat, 9 Apr 2022 06:42:57 +0000, Christian Hewitt wrote:
> Let's alpha-sort the board Makefile to keep things organised.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.19/dt64)

[1/1] arm64: dts: meson: alpa sort the board Makefile
      https://git.kernel.org/amlogic/c/456733feb0da2dbb1288b9e8f5765df163620c2c

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
