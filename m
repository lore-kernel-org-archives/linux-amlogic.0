Return-Path: <SRS0=vGGV=G4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFCEC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:44:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 352D122460
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 352D122460
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SCYS/kCbHzrlDlchgLWvw5NlmzmQYNUGB/Vi+9maOpc=; b=iOiYWTSmeoI9qLGKQ8AmcpO9B
	9sju3/AqJ5CQ/YmfyXp4ximfr7Xoh+Ytc/wAzW+M/u0kJGgVz9nCXKYu3PfsBYnxpwaILQ1wYsLlF
	wXMDHHGwauPJjnFeMjvWOMtG8nDS8JWfwt1VklZG6lBd21nX0t1VUV3JT8ve9o5wkrjTeFeofB7ua
	x05xpfRCatjH7DGcw2e5qbnrDoU3onI+WBy68IEV9scjj2k8GKPQBrfa6KBst1eikLKoXFa0RIqRx
	BFIXuTMiECipwj36WWOUcEsejLHEumx70ih2aqs//a+jhVZrdh0CEN88ByGMPtNMtZ3MZ+5Unmpy8
	UW8DtoQ7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l46qC-0000HK-TF; Mon, 25 Jan 2021 18:43:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l46oo-0008DF-9X
 for linux-amlogic@lists.infradead.org; Mon, 25 Jan 2021 18:42:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id t6so8229094plq.1
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Jan 2021 10:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrpnZCUbozEfGIxovyWegSL2iDBOBOEkB9CAIPmTQjI=;
 b=Z01yBkBd8lv3PpNWrzlI/SNDtHmy/aH5TQnESkYpYpsGbLxQgEpfIlgluQrHIW9+Pk
 le5YvE8HZKfwVTcQe68Dr38UrgiUQGXiujdO0Sb2H7ACSJByouDnNK9o9TH9I8PrjLYq
 9aWH0j29dbNmixZni7EDsISiNjvogLYSl3MNM+coHAte79N4hHIX0QCrcxeWxwU6d2w1
 73wtJJ0IPF2E0d1M3weyq/4QaduOCvOkog2FBz7RotEMQ+f+kCkWyEqjvk2KBYYpWw3d
 HpGEjKEry+jAtKnH1xtdYFiMDKYSID623ev19DBLQShF58tw2cd/1deNFSJksqu7zGT9
 0n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrpnZCUbozEfGIxovyWegSL2iDBOBOEkB9CAIPmTQjI=;
 b=op22CEHCjN30SKh73oSJguatco/qRoEMaMYwnbLDZ2Y2Ve7S0FEybkFKuFGDLmobvg
 8imKJY7ZVhzE5D7G8UZ0IQClGo8sYhp7F4lhMbi6D3dYdh0luCtVaHneTIUHy1W/9mda
 eu7uelV2OsBXu/zeakPWUt2/KOyZes8ylQ5PSU0N8fqsvXR3nqXk67n5PoH5WQ2ju/2L
 XbeJusFJAvlxhCnvn4nL8sOkcNBt05HJ8SoFqyC6wYBxCsr4NJJL2QL8xd7lEYvjA9Fw
 YI1jHvjjR2iy2xn63yyYHwvryF0RfTCkqMJpziqtmYVJ/pNB6QrC1CBEqI1qKEJIg1BG
 6anQ==
X-Gm-Message-State: AOAM532ytHnZ5FBSfXIBZphcrZdUo8mURcAfkzU5CZKLkdY0oCc+qcjM
 arJ2oJdFuRSjpCOio+/o+vTfRvgGrVYsBBIpopQ=
X-Google-Smtp-Source: ABdhPJzZQCuc9RXUU+fxTF1ebRHHVBoVrZEqZFVDzH+92iBJeHzYPNA4GFXx3s3v4jg7XzgwgrNYZQ==
X-Received: by 2002:a17:902:ba15:b029:df:f346:eac6 with SMTP id
 j21-20020a170902ba15b02900dff346eac6mr1843563pls.44.1611600147770; 
 Mon, 25 Jan 2021 10:42:27 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id c73sm15930853pfb.77.2021.01.25.10.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 10:42:27 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/5] Thermal zone configuration for Meson8/Meson8b/Meson8m2
Date: Mon, 25 Jan 2021 10:42:21 -0800
Message-Id: <161160013613.17631.16811353695468732000.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
References: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_134230_407648_8593EE97 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 21 Dec 2020 19:13:01 +0100, Martin Blumenstingl wrote:
> This adds the thermal zone configuration on Meson8/Meson8b/Meson8m2
> SoCs. The thermal sensor reading is taken from SAR ADC. With
> "generic-adc-thermal" it is then used to configure the thermal zone.
> 
> CPU and GPU frequencies can both be managed. The vendor kernel also
> manages the number of active GPU pixel processor cores. This is not
> supported yet so we skip it.
> 
> [...]

Applied, thanks!

[1/5] ARM: dts: meson: move iio-hwmon for the SoC temperature to meson.dtsi
      commit: e9ced25e41588a2ff95280b4d3dabf3a0865513b
[2/5] ARM: dts: meson: add the ADC thermal sensor to meson.dtsi
      commit: c8559511107120403f7810428f50fc68fd77ed5a
[3/5] ARM: dts: meson8: add the thermal-zones with cooling configuration
      commit: ecdb744b1f819949f783508331ff6ff8a6a45730
[4/5] ARM: dts: meson8b: add the thermal-zones with cooling configuration
      commit: 9073f694efd8733b0e7c97d3396d81161bd05582
[5/5] ARM: multi_v7_defconfig: Enable support for the ADC thermal sensor
      commit: 726731566a862fa375de44313f601e49c4d40377

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
