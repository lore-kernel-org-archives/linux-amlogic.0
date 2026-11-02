Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B53F606A324
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2026 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CY6hYZkt;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=AzFW1jds
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HuUpEm+gxzm8BzKSnd2jawBsPcOkL1ahrMalm6ve2xM=; b=CY6hYZkt7KdvLy4Gy7tsuz4HI4
	MFDCvEt/SOu/+7yUVX4HyNSksSg9V5qiA7WDa9FKyI4vnPmLdzk+k/qCL+o8D8G91zYIT7WfBtMri
	Z15fgQRaTCrFyZpGnbbLXrBw6iMIWV3rYJpnHLIA9G9NWktRLJkeCCwQQlxc+m1VEGpcM+Q/aPFvG
	HfHugzFRcM5SuLh+9QnDx/8zFp1KJNsFgc4PR/XqVwF9C7eX3jLppU3TsF+ognyxg0e7AmEu5bVc4
	uOfIfjC7l3XIR3A1DV3iqdFAqx5INh6bNpbzdLBvolSuSTPPsdEN+EYnbQi6/Ypc6FRMw8B3D8D0D
	xL+XPg8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwxb-000000000U5-0mer;
	Mon, 02 Nov 2026 18:40:47 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwxX-000000000T6-0pDw;
	Mon, 02 Nov 2026 18:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793644839; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ZI1w18v9ajwZLxKG63htNilqe0d2mwvjzda/tAdlLQxiC78vodaJrepsFUv0cgqc9FpKflSma0uP8EXUm/ateujJFAyDpAz2pmxClGC2azmYEU0Ix9fo55nRNrjgm3myfmr5GGzNVqjBLRh4zrCa3NBCozXdWL03CJwAW1t4++k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793644839; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x2JYvPAFU2onTnd8tUYxjXC7Nzj85EYDqdqRJ3qq08g=; 
	b=ON9c6+GulNPP/MVg3P1Oyh+Mi0Re5wMo/RnB1hyZBbY4x3s0zP8vHwSOu0pfUsRiwu73CeDvue/6ZeOaMm25qXI9S7d6orhZWawtgQ9SAdmBP8ITItGs9PRdtIUhEFXlA92edkG9aOLWi8REPqkAYb6oNjMchVXoemEsEs7/uVQ=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=AzFW1jdsBWQAQEu6mLS0kkwz/CCkMCivK5e7hQqLegFoHV/g4isoTOvoG2M+ZPpqaqr/GJYb2pB3+O3DU+NI8hDv6nGwOHnmvgy8K8U0FrKCcn93EVCDPorRMaManKiO3+dQoHGBIrbZCHyzkV+f2dFQYYNXBm2gDsNT6yCZn9Q=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=x2JYvPAFU2onTnd8tUYxjXC7Nzj85EYDqdqRJ3qq08g=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793644838477757.940158003217;
	Mon, 2 Nov 2026 19:40:38 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dongjin Kim <tobetter@gmail.com>, Eric Neulight <Eric.Neulight@linuxdev.slmail.me>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card be powered down
Date: Mon, 02 Nov 2026 20:38:31 +0200
Message-ID: <20261102-hc4-sd-hewitt-reply-1@iav.lv>
In-Reply-To: <AD1E9AE8-8FA9-4CC2-AED8-AB2F455FA8E2@gmail.com>
References: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv> <179100548183.3372253.2014593916926884551@iav.lv> <179140715034.293470.4459182430175564610@iav.lv> <AD1E9AE8-8FA9-4CC2-AED8-AB2F455FA8E2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_104043_549604_0A0C9F08 
X-CRM114-Status: UNSURE (   6.62  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Christian,

For HC4 I sent the U-Boot side on Oct 13 [1]: the same idea as your
first patch, plus u-boot,off-on-delay-us = <100000> on TFLASH_VDD.
Without it mmc_power_cycle() keeps the supply off for only 2 ms. With it
HC4 boots from SD after a watchdog reset 3/3 (0/3 before), so the delay
may be worth a try on VIM1S.

On ODROID-N2 the factory BL2 leaves DELAY1/DELAY2/ADJUST at 0, so I
haven't seen your second issue there.

[1] https://lore.kernel.org/r/20261013-b4-hc4-sd-power-cycle-v1-1-cde760a256a5@iav.lv

--
Igor Velkov

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
