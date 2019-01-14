Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA308C43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 16:22:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B6620873
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 16:22:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrg2LHBX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dYY7AyDB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89B6620873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AekvWns8v+qwMFn1VZUd06Rpholv89jKGv43vWRYScU=; b=jrg2LHBXhZuKAt
	/Br7vtFVrfzvr/m/Yzp/mh3d4pOOntgddMXgoZYBJug/OHM7oNbxvQphxVMYMiVkggRDN2cBUQhbd
	/k/u6ID1JUnDfL8SnPHPuQBDYHGgEf/45YG81+oYTVLuWfZ3/xw0j0UKyW/DO9PwEiJWpAN1KZScC
	LK8qMBGI93zNxrW/cOKVXm/vJaX3WJZ5wxb28TGi4Xy69RQW/NuMdV0iG2/0TzluUxiNkAZ2yHuld
	fC+ChowER5oL5wL/dC/JmrXIFF1ETgv/DhoNvw6ZVx1qySmXzqh58YOGX5gGXyYf2lq2rrf88KxlI
	tIc6rgAzK3AZwH85B+9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj50J-0004Nh-3d; Mon, 14 Jan 2019 16:22:23 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj506-0004Do-RM
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 16:22:12 +0000
Received: by mail-pl1-x641.google.com with SMTP id u6so10349900plm.8
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 08:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9MNFaxqH3CflbZ5s7rpd0ZeUglDZvdpg5vhBirm0J7I=;
 b=dYY7AyDBhVtl5De8HJ67C5ln+wkPa5dMlPrHtdHMdagrxvhVy8Nj1DcH7dkV0hMvnA
 5idJFRZZJuxktoG/GXp7VrxaVsZ14uaJRhbCEAAZJIN/Kgaq0WHay9pJxMcLyjiOsvgT
 SjLqAdGSJAU84Mk/5SQZerbJE3mnpEoNyw3NJG/emOoKuB4/++gpg1T2F4BBXSWTPlSK
 kcR6tsdsGbvpVH4xwVcC49ByJ/dI/0ekcyi9+SjTV5PHxr70olNw/ZFqO++0EYW6+UH+
 yJe+Epf3onCwIFsj1lek0nQ5GySrh4fURgP5valnCp83D8I0QH1rcaV1KDf4O7UnK0ik
 3VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9MNFaxqH3CflbZ5s7rpd0ZeUglDZvdpg5vhBirm0J7I=;
 b=HpO4FjlWxKzguX9ReQmzBeEgaiYIW4/QHXVHvcjj3Nn+PnLwpGZLLU38/VxddIRVM+
 reb1wsEYGeDlKcO0G0WXkXrqxjonuHr0s1BTrnL4hKzYWcSg+EefzPsBDF0iPY2EJ9xV
 9gGFiSU+MJfjE5FY28hlXV/Vzcl/6S2v3qXHR5IG+NdO9h6atI98ch+YXUsb0E8JBh5O
 gTwhfPjFRNX6AfP/V4L5f1M+JbfuBolqoS+kFXgDE6XyQyURdJhwju+yJVxSq5kf/WvD
 LWEuagB/QbMd7iPLVKiJvXQzZhmVbhkmfYt3CLONhYeI4RpkCG4QbOq+GBRqKNhFEkaL
 X+Qw==
X-Gm-Message-State: AJcUukdFsRtfnRJkzf7iF0SpA5mV2FU83XwvPIHyJpFcsNgjYWnek95P
 JVA7fnVZaF9NLx8+kFUPKOnfpA==
X-Google-Smtp-Source: ALg8bN7b2KXmWUuHduwsMpk0kpHnttA2FrmcLXWEuFvtF14vQPFByulI97ZKCgEgwzxI9in10JWp8A==
X-Received: by 2002:a17:902:c05:: with SMTP id
 5mr26349611pls.155.1547482929716; 
 Mon, 14 Jan 2019 08:22:09 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:55a3:6ea4:4b91:28a5])
 by smtp.googlemail.com with ESMTPSA id 196sm3864854pfc.77.2019.01.14.08.22.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Jan 2019 08:22:09 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PatchV2 2/2] ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset
 warning
In-Reply-To: <20190113153022.5040-2-linux.amoon@gmail.com>
References: <20190113153022.5040-1-linux.amoon@gmail.com>
 <20190113153022.5040-2-linux.amoon@gmail.com>
Date: Mon, 14 Jan 2019 08:22:08 -0800
Message-ID: <7hy37nky4v.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_082210_886268_4D691CBA 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

Anand Moon <linux.amoon@gmail.com> writes:

> Add missing vin-supply node 5.0V regulator setting to power
> to usb ports, changes help fix the usb reset warning.
>
> [  795.380156] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  798.356073] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  801.331999] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  804.307919] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  807.283844] usb 1-1.2: reset high-speed USB device number 3 using dwc2
>
> Fixes: 5a0803bd5ae (ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes)
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Rebased on Kevin's amlogic/v5.0/fixes branch
> Changes from patch v1 [0] https://lore.kernel.org/patchwork/patch/1031243/
> - Split the patch into two part: new patch
> - Fix the commit message
> - Added Tested by Kevin Hilman

Queued as fixes for v5.0-rc (branch: v5.0/fixes) with Neil's reviewed-by tags.

Thanks for breaking up into two patches, and as Neil said, please add a
cover letter to multi-patch series in the future.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
