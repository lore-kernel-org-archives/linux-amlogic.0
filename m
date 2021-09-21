Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604C6C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:23:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C41A61100
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C41A61100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ms75iequorJXh8/cBJ24Pd8vccNasbmEy7FbQLurDbM=; b=okUrnSRvTqXDpn
	6695o7/s3lA6Vf2gDYd0KP71h4ftRPA42PenQ/w/qjln40y4nszYH0EteoucDa8KIYkP9QfKp2Alh
	DomwpkYsSbwsUKUA22KkaMfKJoTWF5s++kKkTzYt14ywwSpAKYJUL2ncN4ClU3PY+ert3kmWTKn46
	1amOHGenOuoWZaNChbIOTrNUPHvcA5qk71WzMKFH3re99det0ULpR7pjL5AoMQuZb77r+Ayj5vwmm
	dQrvlSsAnCfU9sQykMnxtFJ34WGriuUc99mVYfF4GqNSX1wfza4tg4EyoxC6XQpH5GTMngTXMGaba
	cyFMOoulhQt/bXe669Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSa7n-003mtn-QY; Tue, 21 Sep 2021 07:23:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSa7l-003mrv-A0
 for linux-amlogic@lists.infradead.org; Tue, 21 Sep 2021 07:23:30 +0000
Received: by mail-wr1-x42d.google.com with SMTP id w29so36278124wra.8
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Sep 2021 00:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E97PWu1QJ5hdQHmoBSfMiWuxBrgHJJjYxk0uU7J2ovA=;
 b=yQR5s4TC77kehL4CL25xRK6A5CmqCDmqjYv5vKcOB6OmYAKyKxI1JRGNxNbphDZT1F
 GrORsk46jhreY6HXTXONjFtFKTsgzfDqCMKb+5NW5sW7oX5sqk+X5d177JPd815kS/Oe
 OZXawrXYiXvOYwWTen/fQfO1oJYkzQTFeOi0vsMSFnOrBG9UXARTnK/O13B7S9EOuW78
 IoxSFnl1G1aeo5DkxIJ+e/WuVTqrfKolzZpvpB+Sbgsr3xof3VXLHVTy0QkOU8mXlnW7
 79r9/VZDuh089EymDcemhjWMISOLg94M1OnJiC0krmTBm5XNPoBNsMJaDrMh51FiXWAb
 VP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E97PWu1QJ5hdQHmoBSfMiWuxBrgHJJjYxk0uU7J2ovA=;
 b=mLTuh6lBiAso0XxQGgueRT6pomf3TBZBS2ecoNMvDa3rGSe0hHvkaCYmoYmUIOBvXF
 6ctnSa4qXuwJnCyEx9RdC5g2VGdbuVEG0ULtzd6A3KMNBLxLCdMVYyemU21PAI70wHtG
 maU5i+q45oym8I1eztdy4Uzb3uBaZ2sUSVW7wXMNRP1yN32Hs9LwxkKEoJ3hnuNPTzrC
 nz/KdF9Gazdxj08AkoFb+ztc+rliUzIXC/fjpa29Z8Ghfux0YExITXlaAQmOGu6gBGRZ
 f1fRKWb7YUn2L11LwodnxtJaSZXr9a2EqE0HroY2r1i1ru2Nf9lysXjGeyyTIG/35Iue
 bfmw==
X-Gm-Message-State: AOAM5336OZbTcfHUSXBWdIF3HQaXNDd9i+LrsA1rqjU/hFWp1K/XtbCQ
 Cw/EeAd19RalxpxSXyBA4XpKgA==
X-Google-Smtp-Source: ABdhPJyPP4WobqDOrLMj2ZP+kjgLUqYmCqgy43N+dLV6Id1U1Y3D+Xugng5+ZIAd4qHZ8jUxjMgx4g==
X-Received: by 2002:a5d:4803:: with SMTP id l3mr33269067wrq.61.1632209008019; 
 Tue, 21 Sep 2021 00:23:28 -0700 (PDT)
Received: from localhost.localdomain
 (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
 by smtp.gmail.com with ESMTPSA id o19sm9725878wrg.60.2021.09.21.00.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 00:23:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCHv2 0/3] Fix the pwm regulator supply properties
Date: Tue, 21 Sep 2021 09:23:26 +0200
Message-Id: <163220899063.36285.13600700816269701023.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919202918.3556-1-linux.amoon@gmail.com>
References: <20210919202918.3556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_002329_396135_5EEC87C2 
X-CRM114-Status: UNSURE (   8.13  )
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

On Sun, 19 Sep 2021 20:29:08 +0000, Anand Moon wrote:
> Changes PWM supply properties help fix internal link of PWM to
> main 12V supply as per the shematics.
> 
> V1: https://lkml.org/lkml/2021/6/29/288
> 
> Thanks
> -Anand
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.16/dt64)

[1/3] arm64: dts: meson-g12a: Fix the pwm regulator supply properties
      https://git.kernel.org/amlogic/c/085675117ecf5e02c4220698fd549024ec64ad2c
[2/3] arm64: dts: meson-g12b: Fix the pwm regulator supply properties
      https://git.kernel.org/amlogic/c/62183863f708c2464769e0d477c8ce9f3d326feb
[3/3] arm64: dts: meson-sm1: Fix the pwm regulator supply properties
      https://git.kernel.org/amlogic/c/0b26fa8a02c2834f1fa8a206a285b9f84c4ad764

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
