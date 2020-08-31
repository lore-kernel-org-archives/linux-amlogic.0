Return-Path: <SRS0=yTcF=CJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E29C433E6
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 07:59:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713F92073A
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 07:59:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nxc4zQJt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t8PGo9hD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713F92073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TkZ6yMn3mXDPvM5XpUXHU8pzfSYeBTLuew+baUfJNQQ=; b=Nxc4zQJtLKLAMJD0X3NyXlaDIv
	iSjDCzdhDCMY47fYNbzNMCyh0en+jtC+jTje42ePuhmL+OCqCoSlrN/JQAbCEr9FUxBVC+bj09n6g
	zVKlek2Qxqp/m3ILEDTY8dP/AMO71or7lyWnyxU09+2yY+3HkfFtxOIPZgB6hVtSUjn5xbnDg2lB9
	OrCaI0Z/iZzLcYzqoHQiJCASlMAzfwqzCrjB4JqHT14Jh48OiLA0LhjpJPHygI175FPboNqyYDPq+
	WOFEBTUtt8+K4y4yr8uX063moer4tl2blBUOSDf6ki0EWOic6WGrdnzd9qDQ5L8KoLFS2snfzkIqy
	29BXiVcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCeis-0005Ff-Tp; Mon, 31 Aug 2020 07:59:26 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCein-0005E8-0i; Mon, 31 Aug 2020 07:59:22 +0000
Received: by mail-pj1-x1041.google.com with SMTP id mw10so2556834pjb.2;
 Mon, 31 Aug 2020 00:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=na3UFuH7TTytOpXQ3KYx1BVxrcrylb7OmSszfxLppmk=;
 b=t8PGo9hDLaJoYegclWO2n2rMjgUM5GUoZKYLyQD7FcWmo+NsSr9n5Aa3LQo6vkUfSs
 RcCJGsbxL9HxesbeTlo5T2kjlsaG6PWJ/EL8omqBdtsj2c5x/zRhEZXpouySfY8wG2/T
 Fx7I68lAuS2oHTsY7triY+y2RJ/JUQ9xzosFS/hyhF5o5AVllsVQc/fj3y3G6Wmoh2Q8
 FFFDQmiPTFXiU46NPM4DUHL4ebtCWVOokxzYRPd6PR5i53htQPzHdzsB52oWficuew6y
 BqZlW0NIdRKqiYWCkHGA/x06DNXv5Ypmzg20YMra7XOv/6t3Zu+B1BZZaIh/U1qKUozb
 iOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=na3UFuH7TTytOpXQ3KYx1BVxrcrylb7OmSszfxLppmk=;
 b=dcT+4IPKRtdI1ioJwqjyw3us2FiuN0kr0KUw6qXvgvYUxrTpVebYkUGE06rbmldcIS
 muC4TIsIeJ20c532lLwF418jLXWF+TRtJrnEmLMCsuJr8TT4xBmGcjXPkwOKhtJ4GaLG
 fZj/HEHl7l5nBDayPK8CfJn0FWat025lPW5oQ/UTriA0jku7rIvgahuX/EXzzCfKxAAZ
 tDgSJuCFNQV8+p8sp6vcEL87QHp7SlDo7yIo7nluBjXbHKVmKQ1ceO3CW1Sm56gjXGlc
 Bbp7iR4628xuQjnXCdtZnRunfnS7eU2BBSWNtsTESCYZioyUoehjgXc7I8y7Ob4XRhVn
 XByw==
X-Gm-Message-State: AOAM533ynFUITe2Ybpkfjz41WEm8QMTKrBC+CJpxArpqGU600IgQC5lZ
 ID1kbAQXGURywburlTTZdSs=
X-Google-Smtp-Source: ABdhPJwNYxmGFxgMG+gf5dxSY8LKelnOhQ8jERNzKhgwOYBXzYkPcX6cXh0FkRZYPxqpBZQpiW7xMg==
X-Received: by 2002:a17:902:8344:: with SMTP id z4mr214910pln.15.1598860759050; 
 Mon, 31 Aug 2020 00:59:19 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.190])
 by smtp.gmail.com with ESMTPSA id g19sm6424057pgj.86.2020.08.31.00.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 00:59:18 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v4 0/2] Enable RTC on Odroid N2
Date: Mon, 31 Aug 2020 13:29:09 +0530
Message-Id: <20200831075911.434-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_035921_085786_85C1ADD9 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Inorder for test suspend/resume feature on Odroid N2
we need to enable RTC module on this device.

Changes v4
-Add gpio interrupt for GPIOAO.BIT7 as suggested by Neil. 
Changes v3
-Drop the patch disable on VRTC driver.
-Drop the INT pinctrl for RTC - not required for I2C.
-Add the alias for RTC nodes.
Changes v2
-Fix the missing INT pinctrl for RTC.

Tested on mainline u-boot and odroid u-boot

Note: Now the rtcwake feature works occordingly,
But after resume I have observed a Kernel Opps
Hope some body able to repoduce this.

-Anand Moon

Anand Moon (2):
  arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
  arm64: defconfig: Enable RTC devices for Amlogic boards

 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts   | 17 +++++++++++++++++
 arch/arm64/configs/defconfig                    |  1 +
 2 files changed, 18 insertions(+)

-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
