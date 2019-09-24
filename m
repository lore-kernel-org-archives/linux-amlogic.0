Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A47EC432C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 18:45:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7EEE207FD
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 18:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GV9UnyKb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1xmupXIp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7EEE207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/05wJlVDLnPLVz1waMfnfx62cDGONTantNl1AXCUR2g=; b=GV9UnyKbDtvjGM
	rEnYrcOqpYiITvnhrKCLxINVCEOfPYPX1r+Bt/YDnTkA01hoeIwpytCgd8b1/O5qvxFAjTJhb2Yjp
	H7eJFjh4I0Evc4g6R0Ft/TlpHXqfFFmn+QuHSyBJ70TG87jNGG8Mvf1Uh1jpGxws4jGbGAbs58VoO
	EcytXI63HOJqwq5B/kH6dutWHWBKlOgOHpSm7H3AImtdhthRxMbuIekTYF1PB48JM70Sp1ApmaIbI
	JMXbc1FPKyolGV8uPZuPda3IDUkq1+koAKtSi5XmODo0j5fmcwVALPhsx3KuU4IG2YF6SueP3g1X7
	dAy60G0CnPq8vdSUV1Vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCpoX-0000ch-QQ; Tue, 24 Sep 2019 18:45:29 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCpoU-0000c1-7g
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 18:45:28 +0000
Received: by mail-pl1-x642.google.com with SMTP id y10so1365562plp.2
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2019 11:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=EhFo8UD0M1x0cqdtAG5xFb+zL2qssucxdSYFDxh8zmY=;
 b=1xmupXIpVn16oiY9jr4zGhx5kz6TQXlcr02odVa8JOgVGMf+tMfTXrZ11PMZaoReLb
 hYj6iOStBNUisW3nFV9mUodYMnQ+78/leA9+rQJOlRfYbseYdFyo0IcTlWvQBjVqHHDv
 +JKCWfmz6kfbILpCdZJRzMhrHeW67Bc1sr3+ScJPF0b5xWb+Rtyz2zWNRR10/AiRL7rM
 UntXuibc/NespIx781IhGF+5Pu16gqIMwG4HKJ1qWCSk5T4jZFN6acjrnUboQ9bPyYBt
 LSCV4cPBKm62JaDU2CpZfMv9WxjrhN5OAdlwUCbNAf7bgInncd727/Kx8+nYtrt/pish
 u5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=EhFo8UD0M1x0cqdtAG5xFb+zL2qssucxdSYFDxh8zmY=;
 b=qNr/AyZ1hucTMkbX+2f0u9YyAsd+N+9wO0QTsgXl11PsE1PDGv74b+Azahz10Nnu9s
 6NlO/dJn6j+7BtFLWcNTYLmMiF49QLNBwpfJnIuEnjP/Y0iBYw5re6HOnFyq54QIaUzq
 rQP7W7RDtLE4sigJp7IpAcez+4EY3leyUhXyjq4P2GMHb+FV9lPCjCWbX/ixuDbf25O9
 xrNtgbpbZw4Ai09oOjsnr2oap3i1bY1M1432yiwSbfYgzvyS6zqfaKNscvUQmyJAR/5H
 uk0R3pDkihMl10ePfnAr9pzmvnbGCptpz9+mpKhrPLfAaPwNYr88uO07i86k2rgcFv7n
 WExA==
X-Gm-Message-State: APjAAAVmDKscB7nB6nwxURV1kdJBdE5U0whWNsViV6vp0kP/XoTSKfDN
 p+d1251gJcw5635NsuEZj4OOTQ==
X-Google-Smtp-Source: APXvYqw2FWysuvyL9JZR1RFnGjKKxyCsFkomx+Lhz60Ys2dpdPvtdduTewdJCStCGhHY/76y4e2YRg==
X-Received: by 2002:a17:902:7282:: with SMTP id
 d2mr4582684pll.140.1569350725045; 
 Tue, 24 Sep 2019 11:45:25 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j128sm4824791pfg.51.2019.09.24.11.45.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Sep 2019 11:45:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, srinivas.kandagatla@linaro.org,
 narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de,
 jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Rework secure-monitor driver
In-Reply-To: <20190731082339.20163-1-ccaione@baylibre.com>
References: <20190731082339.20163-1-ccaione@baylibre.com>
Date: Tue, 24 Sep 2019 11:45:23 -0700
Message-ID: <7hd0fp7cu4.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_114526_351655_C07BBF1B 
X-CRM114-Status: UNSURE (   9.20  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Carlo Caione <ccaione@baylibre.com> writes:

> The secure-monitor driver is currently in really bad shape, not my 
> proudest piece of code (thanks Jerome for pointing that out ;). I tried 
> to rework it a bit to make it a bit more tolerable.
>
> I needed to change a bit the APIs and consequently adapt the only user 
> we have, that is the nvmem/efuses driver. To not break bisectability I 
> added one single commit to change both the drivers.
>
> The remaining commits are cosmetic and DTS/docs fixes.
>
> Changelog:
> - Changed patches order to not break bisect
> - Removed non-functional changes (PATCH 1/5) of the nvmem driver
> - Fix gxbb/gxl DTS
>
> Carlo Caione (4):
>   firmware: meson_sm: Mark chip struct as static const
>   nvmem: meson-efuse: bindings: Add secure-monitor phandle
>   arm64: dts: meson: Link nvmem and secure-monitor nodes
>   firmware: meson_sm: Rework driver as a proper platform driver

Queued for v5.5,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
