Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B2CC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:22:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D84FC20859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbR2oq2+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EXy5Jch2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D84FC20859
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+uAeDTTXWmx8m+r2nMJvxMsgfQENy8asE3/7rI6Fj2Y=; b=CbR2oq2+hYcqzI
	D8Lma0zf6ME+L9sQ0aNnTQIQyqgDk3NQe0fxhFSQtH0DqzUpiIP02ANfEs+HAIXXFRvHn2vT3Cqhs
	npqHuwR4QglpqRsgrRZv70oYDlKx4Ob2vj3v7PtQobC1qQNkGHvKWyMpA+R48GclEloGGWLQznvgj
	sQA0au4KhyjIdZhEudK7FihoSdG9hGlqzYspZesLPb5PJwt8A89juRRZSlsRqrBgQBOyri6z6DXY8
	hSOdJctpvdOu940ToBi1hxpzj1gj5AiO4TFd/xpbK2GxK2av5JBDZEwrzAunOkE99vpVDbFNsQUeJ
	HB/iMLqgdY11Oqaew4GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVKG5-0004ju-3d; Mon, 27 May 2019 18:22:05 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVKG1-0004j9-P2; Mon, 27 May 2019 18:22:02 +0000
Received: by mail-oi1-x243.google.com with SMTP id t187so12446788oie.10;
 Mon, 27 May 2019 11:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+FiXAOea0Da36+0fuzZTMwOJ1pKxmssdqT24E7Ljks=;
 b=EXy5Jch2r8lQ3wOHylrAfl7aymelwxSm5mLv4h/iH5tNR53XBcL5lLzx9umgiSt9jr
 x+edbQ/1lz+Ng26bcE1uw+teKoot6ROIIFb/85pZhhunR1RVKiAUevyFHYz7RO96Nrb8
 bKB5Kp8E4KRko2n/NMEnx/+Yb0Qb1idYbLIEMsb1w4vy5G1wJvC3azYd067ucdcDBTCW
 9s/lxR8Xgri+cLcUwhES1GChPO3L84gYbXFOHGYHLMHgXYtq8VrmHYTQUMl36nPj+VV+
 PuaOm+d3Tw2r/30Chj68qN2MUI4hhxVmofs8auot6ag7PtUQKEyPZCI6il86U/XEjlHf
 3chQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+FiXAOea0Da36+0fuzZTMwOJ1pKxmssdqT24E7Ljks=;
 b=IUv1jR9ta9i0Z5/VwAgnbHu58Db2z2R//QUswnKwL0snHMHC54agyZfDRIC8kQ+yV4
 ZryxKLiB03TwGQKSqsLqeSlRNKL4i/zzwEBpmqTpoj0vE9TVAzKsyXxVsosGcFnj8Kt/
 TIbsjgMrQVT113qJsVPqm9ndMpgvIUTWp+8kuhT011838AZI27RrLziVf8JPaYnZItDC
 upicxeD0OM+UidV7PkwQeK+33zUE9f5ZPHsPftL0Pf/x1VMvQuL2uhbVaXDsIKebd2sQ
 kBfPcsoeWieCoQQ1QtMxDOzfD74emZhWgV8wigQiWFamSExsnIBsYiJcqsjzTYHPjaQ7
 vaUw==
X-Gm-Message-State: APjAAAXneqO2/dvPAWwDwBUWxSFjOq+kZqhZ1N2+2VAlR5oEViFkdzd6
 pzkjZ0vsgZ2nroPMpbpBvXuhJz+wjI+BpqsBiOo=
X-Google-Smtp-Source: APXvYqxFnHFi0FhTyZznpUbIgThLVqlOOxZ5b60t+J3xjXTJRBUFohr7MpkWLfXXloofSw0ZHtPTxVALCpnakESKsDQ=
X-Received: by 2002:aca:ed0a:: with SMTP id l10mr188186oih.39.1558981320657;
 Mon, 27 May 2019 11:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-6-narmstrong@baylibre.com>
In-Reply-To: <20190527132200.17377-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:21:49 +0200
Message-ID: <CAFBinCCO3gx1d4pjOaHK0VPoYp0z4cPx3_YsTOpzFtmJSYQZYg@mail.gmail.com>
Subject: Re: [PATCH 05/10] arm64: dts: meson-gxbb-vega-s95: fix regulators
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_112201_810960_90C4CFCF 
X-CRM114-Status: UNSURE (   7.40  )
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
Cc: khilman@baylibre.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:23 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Align the regulator names with other GXBB SoCS for upcoming
> SARADC support and SDIO/SDCard fixes.
> Also fix how regulators are passed to MMC controllers & USB.
if I understand this last sentence correctly then the usb_pwr
regulator should be moved to &usb1 and passed as vbus-supply there

> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
apart from that:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
