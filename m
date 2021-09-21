Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E07C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:24:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8EC611C5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 07:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D8EC611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1dcfhElwdSkN+izZQemnFDR3gSFJS67KtHltQ7l2Io=; b=4u4EVXWBcllTb/
	c8SrBGv+gauT6fTQY4/zZul3/Q3SSrWs2LgmmxnJwC+qO5P8n7I3RTErwrRTT7jf8FsIgpjBv3SFU
	3YYo52XO142ulHQeL4z1lcnqQoR9L345Zkhb0ogTN035DQK1hGV8DM7/QMGu7F8kZ10qvpIxf7FC1
	NsfUQk6DsiR0YhSlC6NnNqGYjYIXUR7kH1XNruS3HBmMbFw4Y1oJmiMS5OEj2kdsfrzxnyux+Pa/1
	G/hJEDaPbCyeG/LEZCQRdYGHmU9F0ecsTIaP7TJuODCalVvgouKEq6Z9euzgb3318FfIMxUbZXsb4
	zBtQxZcL0f9Qop6rsdeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSa96-003nPJ-Ud; Tue, 21 Sep 2021 07:24:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSa94-003nNa-KQ
 for linux-amlogic@lists.infradead.org; Tue, 21 Sep 2021 07:24:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u15so36304307wru.6
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Sep 2021 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFVNYM+8ZfBcQi6We1JLgvzVyTGB859WPsLGFEWujhc=;
 b=jYDszma0h/FXRO3om+lag8wn0XZPmRIsfwEhryXv7H/Haj1FaIRANAg/Hp0Z+3xzDQ
 YOLS9eatkHylygVxrY7zlmHZz3cEabPOzh7eGxLOGYMb+DIcEZhpbr/k5w8F03CpTo2p
 hAzc2gBlWuuIvg+/uR3kjc0YYnsIgqP62FteqZRQK72Tev9lqX+Ffda1cQY2xwySLLf8
 oND5XBT1AE8Oh2av5sc8tG9OqCN6ycXMNNUYSxjo/Lh+VN6dpnOksHH5CxGj7MgXZfBq
 1BsgBtHkahLvMJtdY9cGBkWuftposvfbpfWhwYiBy0YA2977T2Vtolu1SyqTxDoFhpAk
 w4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFVNYM+8ZfBcQi6We1JLgvzVyTGB859WPsLGFEWujhc=;
 b=3UzyHukinsiXcx/8QYDF0h3e+lxBci+zyjeAZ0bKX5W7XQepF4Ez+MGFXBAwVwuU7D
 WN4o56uLL4AQTkJc+OMrFizMiNPguhMYRD2Q5beT/Mn3/QEL8ZOEWTd8YtV569bQfBYF
 cbkDSNyy5ZRI4q0JfYF3sf7s6N+obc/3CQ6WUd/CXtNdfp38PdDgWbxznkzWgJx0mKZg
 xWacqlxkNo/vDqAMA4y1UzZo6kEHXhsq1QO3ZktZWXejM4xPkaZnRKb+GjbdfpEdiXvA
 fho1JHe9rf+bkhifjMk5B9OSWzsF+imDaPiqUp5vmoQv5IQld38kRrw+/kfuX/DSxWYs
 pJcw==
X-Gm-Message-State: AOAM533A7DICfEjEXNIACS+5OFO4Lj+ePVgfMDAK9OAi4lCkJJrRyudI
 GwwUCYJlWkteiyhLBVInzzvtNQ==
X-Google-Smtp-Source: ABdhPJxE8aa5yw5kwtoTkIsHabvAITZpO/4otjBhwLWa7UZ7fgQmgf44/eHeAOMVdJugB44yVqeEmA==
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr2954065wmm.142.1632209089293; 
 Tue, 21 Sep 2021 00:24:49 -0700 (PDT)
Received: from localhost.localdomain
 (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
 by smtp.gmail.com with ESMTPSA id b188sm1878316wmd.39.2021.09.21.00.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 00:24:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Anand Moon <linux.amoon@gmail.com>, linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [Patchv2] arm64: dts: meson-g12b-odroid-n2: add 5v regulator gpio
Date: Tue, 21 Sep 2021 09:24:47 +0200
Message-Id: <163220908180.41173.4926821171736077752.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920204739.950-1-linux.amoon@gmail.com>
References: <20210920204739.950-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_002450_716230_95D47BF1 
X-CRM114-Status: UNSURE (   8.87  )
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

On Mon, 20 Sep 2021 20:47:37 +0000, Anand Moon wrote:
> As described in the Odroid-n2 & Odroid-n2-plus schematics,
> the 5V regulator is controlled by GPIOH_8 and in Open Drain
> since this GPIO doesn't support Push-Pull.
> 
> Fixes: c35f6dc5c377 ("arm64: dts: meson: Add minimal support for Odroid-N2")
> Fixes: ef599f5f3e10 ("arm64: dts: meson: convert ODROID-N2 to dtsi")

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.16/dt64)

[1/1] arm64: dts: meson-g12b-odroid-n2: add 5v regulator gpio
      https://git.kernel.org/amlogic/c/ecff7bab5c9c2e2b6f5739b328347e08415879ec

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
