Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027C0C10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7AB520869
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jHfXBsYh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Fsk23du8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7AB520869
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ZDI0c1DFX8Tl5Bc/Sj9IujN7ne4F8eTj0QMPoyE6io=; b=jHfXBsYhK45ApU
	5W6L5dme+VtXgMtiPOhMG5fqq9LWrRyjzf3jxU0hSNtQhb/fZvPwTtThUTzgm4s3Dd5+bEQnzuwMl
	vqCGwdIgfPa1RZadgPRmG3n3JOSi9U9EblOtkrew4Up1VkQACoElbcfbKqtiR5CiIYICE93hROmKM
	XzyzDqil0BtpPNAaneqzOTqGw7Nv35druTSN3XZdF0kMGX/i/e/szkGyuP4vMXK7GFkcLmWBgvwcy
	41PUO32jA1neVuT8+Av0fkxrc4AS2aWBUVrbaYGQxwlZjssueNQVzsLptN/naKrGsn4AP8/mEhac5
	wXdJtotbxeArvAKyYDlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHDXq-0005Ta-MY; Thu, 18 Apr 2019 20:22:06 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHDXn-0005QJ-PY; Thu, 18 Apr 2019 20:22:05 +0000
Received: by mail-ot1-x343.google.com with SMTP id s24so2740379otk.13;
 Thu, 18 Apr 2019 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8NyXCn2hweEBBeqsdkxBSMnUdzojOgVlmIn8B5GHpV8=;
 b=Fsk23du8LGXuKxKuzpzfs/RhzEjsl1exJ3f5UvMYYdCy7axHPpswfW9BpYhyw6qkyO
 APgaDq9pxy4PYdGujlG/y5SWczAXvQkmHK+e9sHPJy5ieXrxI9BS+L6+dFGlAytqH+wj
 ngwhr7eRBq3cV+jMCQyOX3MbXXFryEoNSCMVwZUM7Ra5J0G9Ll96OGzte4VxaYtmvTdp
 cZ2VbG064yPCVimAsbWlCNtq/irn+9sLyzCKfHrpcFvzHenGLMOm3EvdswjRarY9aGJw
 vaDDVmi2dxBMkgiazuZjA1BvSN+3ygLScoA6IDdUWMxk7UHcpFzaGZ1WDysApcSH5rrP
 4iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8NyXCn2hweEBBeqsdkxBSMnUdzojOgVlmIn8B5GHpV8=;
 b=HhYc/s5Rgo2cCTwrHn+hVP/RiSsz3i3wVeIo1UdH4OITTTxsR7vcw0/rwxoJymiGjU
 fDPGJ1ixWJjWi9mI23Rl9+joc1H9rXRTwpZxypDGabkDnHYi9611ruxZtSQMg76Mo6ma
 yJN/Qbrq8JxsR4qgg+EjCcT/k0SpYVtwvURIlgGFbtPjrB8U4VVdFUQMwvTKZN9yrD63
 0bZGnVAOcuSt/l5Qzz4Xc7MT/ovIBUvxFf0Wc+GV7vTkyNvu6n++A1Me6iwPJTmFSs95
 RsuVaeTg8giJLBBIqkUDKIP6U6L6lpOUw8tzvYmkjgtvpwgEHwmCy74CNXBc1rwcIJvy
 rt8A==
X-Gm-Message-State: APjAAAW2VRy/DmREXKeCWoozWAsbluORThVZ1wZvKPxywnPa08adY7Mb
 8ni6SaPbGQgzCUZ7pji9MDQrrQi0RUlXb833nvI=
X-Google-Smtp-Source: APXvYqyKXUWtb+XugPJCvDxfsYTlD809nWanYE5hfHIaOLrgXOwoyWMBhv5sIJoqF4p4B8LE0GtKKtKDefYgl3VqXlg=
X-Received: by 2002:a9d:5e90:: with SMTP id f16mr56754297otl.86.1555618919925; 
 Thu, 18 Apr 2019 13:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190418122714.30805-1-jbrunet@baylibre.com>
 <20190418122714.30805-2-jbrunet@baylibre.com>
In-Reply-To: <20190418122714.30805-2-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 Apr 2019 22:21:49 +0200
Message-ID: <CAFBinCBU4hPYTXUBJwiN+mJeqrC_a8aw6kNnUBYaAkBbrC+Uiw@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: meson: libretech-cc: set eMMC as removable
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_132203_829502_C934BFEC 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2019 at 2:27 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> The eMMC on this board is add-on module which is not mandatory. Removing
> 'non-removable' property should prevent some errors when booting a board
> w/o an eMMC module present.
>
> Fixes: 72fb2c852188 ("ARM64: dts: meson-gxl-s905x-libretech-cc: fixup board definition")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
