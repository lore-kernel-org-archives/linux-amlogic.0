Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B6DC433DB
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:27:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1696A64E39
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 19:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1696A64E39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C8TdpAtn/M0DslSIwYkSUatOk8FgEgaypCMfgK3EEdA=; b=Ob5e7LLvL1IEvEIt3cZOsyLJh
	Guo7Cxt3JcBTgMepo53IK4w6zbWW4CiCnHlOo9gt8bwTBm0w3c+vASaLm+9ZomqhuL3EAu7RXEe2w
	TQ96kuAqtX0ti0b0FhfI4CQTuh5/x8VhB+84/tjdfGLe6KhfSd4MfaZbAIkXVtuqAcjau9yYmhzZD
	kXW24NSGW/XR7EbTHMApjl763Kbp8BnQLcHeSW8RDIBAEorgO9IkNvDlQetA4mRjhiBLA0TNZzdxx
	JVOM4TWDwrtFLyo7RCx5RvvHxExuP4HJV7WMwZDklBHYmpr/y+TvQW4PjH/+96F7OiMiUJddwuJto
	FABHHAiMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7No8-0001G2-BH; Wed, 03 Feb 2021 19:27:20 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7No0-0001Cc-Qw
 for linux-amlogic@lists.infradead.org; Wed, 03 Feb 2021 19:27:14 +0000
Received: by mail-pf1-x42c.google.com with SMTP id m6so486738pfk.1
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Feb 2021 11:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JvxyoG9Ug7rD2/QwyyqWOcJJzbOkgd8c1QabMsrGK+4=;
 b=wbLe/h7fZW5nuvUmAaSsEyaZ7RpzIuLEKRn7oWLXHzPrSJ9gcmGZb6gEsvu7NWUeoh
 M80XTZDflp5g8PLYsyX4tspBLbPJYwnsAjnMUCsik23dF/hObd7Cep5Xt1ylznZj7QON
 RbxTJ+HzscH3wctX+qUSETrlkGHNg9hzMCvly0ZScGMEsC8gG0nOCrqiWrZODTxr9tAf
 GNr/Zoo9aG+SHB0sRr1nsqaCYf9o4avxgAWSiosaYAERhqNlHp9c11G9uNWZWP1J5wUk
 GrkMmGKgsiA22X9Jhgn3KF+bxfgjNzDLNMh8NM+5s7st6zcw4Oh9vzqalzyEhyOFXAjk
 7C+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JvxyoG9Ug7rD2/QwyyqWOcJJzbOkgd8c1QabMsrGK+4=;
 b=BtHXGx0HniHlm9p/0+z/X5yb2UpfRNP5gUai4CcJE0GhZEjMyGrhwo8XgRxI9i6WbC
 bP/gZKxBdmob0xwZN1GSyQYx4aqn6BTJ/zY29T2GJ9crg+tYct894GwLEGQqLp8ucrXf
 vcTPhStRi7M3UuMbHKhUTbuf1C5NyJKsESAEDO/iYz1FPtM/22ZZBLv+ZM2mIWJt+kpB
 wJ5VBLfrJSfYavR6HrLQVOfqIN7pIaVsqgQn6lyR3DEh+8uQpRkWLfOT/MjsX+cA3gj6
 uJOE+fs/r6e83/tatPZG5aGT+BLZlvp0z6ZYeW4l773CrqCzKwQlO36yqFSn9TrLiBQ0
 pk/g==
X-Gm-Message-State: AOAM532Z83jJ9orTfI0EyC1T+d4S0P496uqdPsPDHt1OZ2OK/nXsJkc1
 Ko+QmYEPr05rHW64VXM7OHYV+Q==
X-Google-Smtp-Source: ABdhPJx2eX0AFr/RFnr8uK0lyitK4xaSk/d2OQaMpOV5TL5Wgvs15NKxIjyU70od3pXEKUP6SNmu6A==
X-Received: by 2002:a63:4644:: with SMTP id v4mr5246382pgk.440.1612380430481; 
 Wed, 03 Feb 2021 11:27:10 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q2sm3111565pfg.190.2021.02.03.11.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:27:09 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Artem Lapkin <email2tema@gmail.com>,
	narmstrong@baylibre.com
Subject: Re: [PATCH] arm64: dts: meson: fix broken wifi node for Khadas VIM3L
Date: Wed,  3 Feb 2021 11:27:08 -0800
Message-Id: <161238042310.26843.5846763712461703228.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129085041.1408540-1-art@khadas.com>
References: <20210129085041.1408540-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_142712_964808_B8208CEF 
X-CRM114-Status: UNSURE (   7.94  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 29 Jan 2021 16:50:40 +0800, Artem Lapkin wrote:
> move &sd_emmc_a ... from /* */ commented area, because cant load wifi fw
> without sd-uhs-sdr50 option on VIM3L
> 
> [   11.686590] brcmfmac: brcmf_chip_cores_check: CPU core not detected
> [   11.696382] brcmfmac: brcmf_sdio_probe_attach: brcmf_chip_attach failed!
> [   11.706240] brcmfmac: brcmf_sdio_probe: brcmf_sdio_probe_attach failed
> [   11.715890] brcmfmac: brcmf_ops_sdio_probe: F2 error, probe failed -19...
> [   13.718424] brcmfmac: brcmf_chip_recognition: chip backplane type 15 is not supported

Applied, thanks!

[1/1] arm64: dts: meson: fix broken wifi node for Khadas VIM3L
      commit: 39be8f441f78908e97ff913571e10ec03387a63a

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
