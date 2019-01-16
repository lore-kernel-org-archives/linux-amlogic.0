Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3799DC43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 10:14:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 022A120840
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 10:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VheKCnXL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zdkih4N3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 022A120840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TZqR6z5j1xqb/XmzXpZU0jbyXzZTwU0o1ifmAAtE0bM=; b=VheKCnXLy/tNgU
	bcHkNDEbBZwShqL9oFDzYqqUCdjtSsS3J/NA5zfZ+eNmaKsIe1xw62Ewy+GScK6CqAVVl+mnG0OWh
	eCLDFnBEaZGXXkeC6NDkjouz5cG8wvtHfn4sf4HYnSWgrpBMwU3FEXyHwzZf/Iuyjb/t6IayzXAmm
	WP7fh3LmsVRKAbrxjb7ci/PI1Gt2riOG63qHSE0rqeaeYjVru/5WSSEHHqKUjva5HhodBvDlc5nJk
	GHwDbe0dlBFPP4R9Hw8hBi9ZK/3alKZxTSb4hVX+2m+FR3I11eJ3HxsAuSAiZet03b5IpSLxi4cwY
	jdm92K7lrUBpXIrmd0pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjiCl-0004cX-Ug; Wed, 16 Jan 2019 10:13:51 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjiCi-0004c4-7n
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 10:13:50 +0000
Received: by mail-ot1-x332.google.com with SMTP id s5so6279222oth.7
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 02:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6cXqpPSFtpCCELbo2yj2D4v0JI99b5NAdZffMfQT1YA=;
 b=Zdkih4N39oW7RXkjXsND17RBBPmjMoeiT3U2t4zHxdpnoALpsl/qMo/8TIIdrLR7Yy
 FO05FWxvIVSO+lv1AFgOeAQ5NQ4wPMYXEwAf78u4mgdqn9UtV8WhWQQdNKIaAdtNJc3j
 u2a+ivbp5jmI2MIkz05He9nkaWe3iyVHIYFF1qo7OaTsLz7hQkXtcMm/RW4qM+oZldPs
 q32pVOgt9D3vIRUeo0jyWe+iiPcNOE6oaDqtcPxS2aUVadFoKmK28xavxBdBpfPffbqT
 1wPRqNc/ghp9cGxraYy2N5X6KY/k8R59/xltfAUZEVkKs7RMOxFs8qMuVhO7kWILAEU3
 gJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6cXqpPSFtpCCELbo2yj2D4v0JI99b5NAdZffMfQT1YA=;
 b=B7r76V+KHAMly1nXIvr3+0a5K0lgEU7/VOG4yYw77NG4FAUmRyjB9jVyemZBzHGljd
 JQDehL+rnpCKELmoo4ZkBValLe3jf8XVGU/DYRodt5jH5ZAhSQuCbJ6UXMyCvnqONDYG
 YNY7l8aOgz6mu3nSHtYtbMP+k5O7WOhGIS/U/w2nf4BAHGdFJZycjF5KDB6NZ7Vze9+U
 0K6itCeqjI9ij1wIwgsWoQvIjUOeh4NR2SSuSJYf+8WrvCBeg7LLn8Z429gglcIpBM4f
 LFllHvguYlYqbzFboyWkNhdOweQd3imuSjw3zG2athG71D2WJXKMxcxZ1WxYPz+dYvKq
 tSYQ==
X-Gm-Message-State: AJcUukc9rMBGE6BxiTS0oK5qfGO6f0f5W8ujkVWtTAThbrXGpiT56Qug
 1WtEeCyaDAYPS/bYMpwcyj+MueRP7AYIT+hAUFo=
X-Google-Smtp-Source: ALg8bN62d61X5Mz9Cltiwv1Tqm55nP3yJY9I9Waf0Y4DqNxNofuNILXT/HEsD6FUiZvRdVjPI8YvleC1bmM/2/N+FxQ=
X-Received: by 2002:a05:6830:1289:: with SMTP id
 z9mr4772854otp.281.1547633627016; 
 Wed, 16 Jan 2019 02:13:47 -0800 (PST)
MIME-Version: 1.0
From: Andreas Fenkart <afenkart@gmail.com>
Date: Wed, 16 Jan 2019 11:13:35 +0100
Message-ID: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
Subject: regression caused by: "amlogic: mmc: meson-gx: add signal resampling"
To: linux-mmc <linux-mmc@vger.kernel.org>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_021348_310838_43842602 
X-CRM114-Status: UNSURE (   2.89  )
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
Cc: krzysztof.michonski@digitalstrom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

failed to initialize builtin emmc device:
"mmc1: error -110 whilst initialising MMC card"

amlogic/meson-gxl-s905x-p212.dtb
linux-5.0-rc2 / 1c7fc5cbc

I bisected the problem and after reverting the following patch, mmc is
found again:

commit 71645e65729f0c5aef8dccf961c97fa766835bd4 (tag: mmc_bad_resable)
Author: Jerome Brunet <jbrunet@baylibre.com>
Date:   Thu Dec 6 16:18:28 2018 +0100

    mmc: meson-gx: add signal resampling

    With some eMMC devices, there is still issues with the new phase
    settings. Enabling signal resampling seems to solve the problem
    for these.

    Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
    Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

/Andi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
