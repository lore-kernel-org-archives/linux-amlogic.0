Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4101C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:13:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B6160F0F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98B6160F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pa5K2EXWdyDtKWNNcwqlzTIPZKiPcs6mUdY41YH0Td0=; b=g/c+w7LHcv7vB9
	qXXCwQFvvD1FGWOkr648hOy1Djba6uyExwa4ltEAtguFKoNosVAeVzIHtdVi3pQzsm0PK7lIXGWui
	fdXp7vfI/yfNW68mt2Rd3b+8W0J/Pv7VkkMkfKtp4/vToXWCI+ax4ffboRqMwrvjsdyeguydCQLmX
	iWiQiODNdrcuYg8Qg/y/lvfQIBya52fRTp7AG2yeOLbAftgHyRIurAKK2aqi/cEN21VgUlq0hr4n2
	CRVsoGUhOPeEKt2fTouSzv/qbXdtrhNUj14cjL+43cLVHJ8E2TdgW7SC2fJ9aL4XvT9eVYH5Dj9T0
	DpJCBb7TYl3OEvgV8VDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vjo-00A7L0-Is; Mon, 26 Jul 2021 08:13:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vjG-00A77e-8l
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 08:12:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 9-20020a05600c26c9b02901e44e9caa2aso5663339wmv.4
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yq3/Usg23HBuIMfDTsX3A2d2AdqpGJKmC06vUXWwG8E=;
 b=CzQF+6G19IDqt6+jnnEAWeFDqZiAtBSDlznMfDlFQyG/wd74/mcrVc9W/M883ZGDMs
 lqjUfRd+4wGHVSK7AujVAoZtIosvU1cjF02YuvMeVEzUzuw095/q8Xplw37MXi8EooCl
 R+f9dCokfwFQgLOONjvZ8X6+ykLNn27j4hQlPrzfB0DpL/4GMWGocAzrBfwMYmMWg/RF
 uOeOlA8NKWYqneKCf1LkDkVu9REtd0Letq/7/LSe1oRALiuz71D4n6iQEbknMp5EWyBN
 A555b/ogGegRzFxzW/cciWWFdxh5ue30qlVgvvNxKHpPk89xmIy2D/R5Jh4hym7QChAp
 6Yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yq3/Usg23HBuIMfDTsX3A2d2AdqpGJKmC06vUXWwG8E=;
 b=U3EEI4YbvJvaaehk2lzCmyF6SEhWRFTC5I7rYH8gMM+vHGllNDGKR46MPsND4X5QTl
 V3Red/r8tdYTcw/jxYaov3mi739H+GzrR4wkc2n9fapdl5xdKvixb+0H0jjpUBvH3QS2
 5JP4+K1PkdfqIfqz/lF7Y9v3HG8YK0AZHaB4u8GDP7MUSQjgQINYk3NktkjLwH73EeCp
 CBOpb9VXm92uwKuo9jCdOCP1sEA3jjR8LNtwIhqP1TeeqdmH4l5382sRLHnuinEKoYw4
 pjAowreGJf3BhfwgKm2mcdOZ6PalVeGJAAnLs/75Z8jmW6VtaC052EI2aIvQUVlljXzF
 OR2Q==
X-Gm-Message-State: AOAM530/GgLC8rusxQqppWNcXzjsC7oxLoSVm2XIGEXu4J3T3CfDONdB
 4b4jSMebRNi7QSpkU83CM29Uq44C4qnUA6YU
X-Google-Smtp-Source: ABdhPJxx3eMucSN49AJxrsYAM/bzg6uYgeTTFscxgW1oSmdLnxJP1ucK7mNwiZf31V86inX3IcD/RA==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr1209192wmj.63.1627287168602;
 Mon, 26 Jul 2021 01:12:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id c15sm646762wrx.70.2021.07.26.01.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:12:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Anand Moon <linux.amoon@gmail.com>, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCHv2 0/3] Fix the pwm regulator supply properties
Date: Mon, 26 Jul 2021 10:12:37 +0200
Message-Id: <162728713307.14205.16664284438953464220.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705112358.3554-1-linux.amoon@gmail.com>
References: <20210705112358.3554-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_011250_337065_0EEA053A 
X-CRM114-Status: UNSURE (   8.38  )
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

On Mon, 5 Jul 2021 11:23:52 +0000, Anand Moon wrote:
> Changes PWM supply properties help fix internal link of PWM to
> main 5V supply as per the shematics.
> 
> PATCHv1 below
> [0] https://lore.kernel.org/linux-amlogic/CANAwSgRD9_B7f5UjPrxeL+x-eMMc2MAG3tXLQw36x0ho+ba_Uw@mail.gmail.com/T/#t
> 
> Thanks
> -Anand
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (for-next)

[1/3] ARM: dts: meson8b: odroidc1: Fix the pwm regulator supply properties
      https://git.kernel.org/amlogic/c/876228e9f935f19c7afc7ba394d17e2ec9143b65
[2/3] ARM: dts: meson8b: mxq: Fix the pwm regulator supply properties
      https://git.kernel.org/amlogic/c/632062e540becbbcb067523ec8bcadb1239d9578
[3/3] ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties
      https://git.kernel.org/amlogic/c/72ccc373b064ae3ac0c5b5f2306069b60ca118df

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
