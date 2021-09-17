Return-Path: <SRS0=Z0aL=OH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD48C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Sep 2021 07:32:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19F9B61056
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Sep 2021 07:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19F9B61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIB+X6hX4cTpBqY2TXu3xWLpTiNmqwbcSHIqfW2dB90=; b=yGbpzfA/SYoHl1
	EagCIM5B/CyyPzKP5HGQIkb+Hf998LN4yGfIHInnrjnyZWHs8PuHJozL9NBjMkZtya1+SFHxGnVIz
	v0RVclUT+trG7YxpYlLCenXXZTxihx/E6FhBZ4DCMb2lsPf8HI94QE4IU5aANpHl0oZqVaOw7Z//t
	3DTDwaJSfhkSCkfYs4OKCxccQ93aetbvMElstFxqhHP8E/FEID0KTng41cKK1Xh55mWd2IMUGAmom
	UhUog0BA1rabccYQwHlxLx1RhsG8hkOaOSwUnIocB8ATGgfdx2UAMqdV884oagBQQRdP4k6FlO74u
	oZkoCoEJt+mWIM7TVxDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR8ML-00DR3M-Ko; Fri, 17 Sep 2021 07:32:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR8M7-00DQyp-5F
 for linux-amlogic@lists.infradead.org; Fri, 17 Sep 2021 07:32:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso6236825wme.0
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Sep 2021 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2THikK+ZWL+RF3hVyz41egxjiPVtWjXYvxUpPXvBXFY=;
 b=5jTefkWXREWF2cGsPQ1xqboI1NOUcMMKqOp5GGGKX00o++JvixQQFdZgiGhbfPztZW
 AWuZRDnm+43FAef/op1HcpXS5j5SaqtpytYaUTTWGt26kR8idjX3hjDIm4xd77FB0yOf
 Zg2uVfTXBQwBb+UVwlX7pkgaC7U3ixigzPp+XHaoyGFnz3Z+NiQe/JeGlrbFf2WhUO1x
 HwGLMSBt8273hll9oKHJOn9F29xiTgehodeF6NF6jCzz46EEzqGDdxK1KrLSAcsB1RXW
 T5PZBO1tvfEfNlGA1jrDFfX5T9SLQsmJ71rhoG0BZFNYdTStf0bJbkfrrKLlEc7BfmlT
 jVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2THikK+ZWL+RF3hVyz41egxjiPVtWjXYvxUpPXvBXFY=;
 b=cj5jxggtUYPSWC1VL0Pm4U3xEjNnMimIs/qsALsoB6MxIC7Mo0bumC1C9EDw8jy+z2
 bzqZLGrXHzEDFTPtDrkO5v+Y5Jh5bAYvdVEVZQuRe1QkaEQqvFe5XN6ymS99CNqgssh2
 2xEylwRfZHD0j30UJNouu6VAxLWxC/Rccz0XvBxIsY4ab20Q9BLIEPRrvISPcBL+Pa87
 JOujEgi4MgB6woFkjKDoO1nP8b9YbX0BfleDr1doiSey3EWsfiPn2SyQIpurAo/fGJw5
 3TTmd7QvKl846Cbv39tDDczGpClANoaS2cdwPq3JL3sYK5L8H2BhUptuLt5fMWjF0Emw
 WqPQ==
X-Gm-Message-State: AOAM532to/Deec7OgpCfzR0uBemMYLkg+jsVej8gjBGS0DKSXJrYmT88
 NaB4xEu4WoSTp/2tY11Zdf1MZA==
X-Google-Smtp-Source: ABdhPJwRGFW/dlw8u8+sISzcx3AX9UykA/D7q41zATuitAWDOLHohqdL50iGXLQcC6es+k30msM6wg==
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr12363412wmh.2.1631863937090; 
 Fri, 17 Sep 2021 00:32:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:7c8c:5a9b:1b6e:1623])
 by smtp.gmail.com with ESMTPSA id d8sm6148326wrv.20.2021.09.17.00.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 00:32:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: add audio playback to rbox-pro
Date: Fri, 17 Sep 2021 09:32:12 +0200
Message-Id: <163186392856.1051643.15826774789936581584.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914151631.2841-1-christianshewitt@gmail.com>
References: <20210914151631.2841-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_003219_228625_56743F67 
X-CRM114-Status: UNSURE (   7.38  )
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

On Tue, 14 Sep 2021 15:16:31 +0000, Christian Hewitt wrote:
> Add initial support limited to HDMI i2s and SPDIF (LPCM).

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.16/dt64)

[1/1] arm64: dts: meson: add audio playback to rbox-pro
      https://git.kernel.org/amlogic/c/9450f63ba4d1915d8d605bad6454fc82522d95d7

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
