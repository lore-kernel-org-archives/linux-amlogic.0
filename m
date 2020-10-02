Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED275C35257
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:51:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CDEC206CA
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NV2oKpBF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F5fD4ZkG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CDEC206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I2HNmLTAYia7tr9TWvjSE16prGRrW/gxHHq/1dl3hW8=; b=NV2oKpBF2GhGDp7cMtkcGFmyB
	QaBEXIR6K/paO8xhaU+b7FGL1MnIEVXp/wSNExyxtsC8cXRR3ObAd5RgWzo7aaPBmLXhPQriglvlY
	ROkayN6OF8FQTETITa1+kTz/YOByn656F5HMM1GMT6dKfz+rIZZyp1+9hjZO339dQwZt441xouXBy
	SCKLNa+rnI7uHD1Qe+8+tb7nditXGXEM438cAgtC98HJhOD8JtyV0OYeu5GBbfNX+m+sRxwalc28Y
	z+bSoe6pMOeSFsoHrP5c/mMqyHttsfwIBxS1ZGnmG+GjKEI0qcyMufGechMCzG3gBePKRuuYy1fqC
	44xZkr+cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOQ9h-0004yV-QD; Fri, 02 Oct 2020 18:51:45 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOQ9c-0004wC-LV
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 18:51:41 +0000
Received: by mail-pg1-x544.google.com with SMTP id g9so861384pgh.8
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 11:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C/JZ8cWc5+h5e+BUGdQ43Cb73KI8VxwaPr7JqqaLxKA=;
 b=F5fD4ZkGDx65hHw8Nb2LuTrUl8CWZuTB7UCzAyTaOV6QtgeviCZdL0y2KE52CoUeSm
 k1XlmOLpLdmKnLf8lNMo53vPQmR0nimvAn3/QAZ3TJrfSG2sgOpuUuOqM0qAFgXifGXs
 PfWnkI9I+e5Q5emWpZ+722pPENkQ2ewIn6Ewbxf+VqQLrgkDS5E//cUE27BfZmqYT2b5
 MZQSylxTMAx1zkH34OBA3RhvmZHL9RUJyBT5cUUReBqEpeVdZ3C19UHxb//iAPhuTXGY
 vYtAFr+R3ooUzJu6vZWu/jviT42lE1SV5mq9dpMNmwxdsp1hoY3xuZI8xf8HZJuQUgdu
 Wk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C/JZ8cWc5+h5e+BUGdQ43Cb73KI8VxwaPr7JqqaLxKA=;
 b=fQkryTToKUD6Rn3Y/BmRfe7FIu9xVIRLMcSCbgukCAYw78rMfkm64hoYeanNHy3fMi
 iGkWFAxQDeyXv3liVLc+TKbj7KSAV6kDqSStCjkiQkPDYhBaJSFT6fOVRI8FokC6ulxQ
 NVJto8i4QH7GTRHdHyH0GcysJLJJ6NQdKBVpk4ic4corhzXO6G9XEAy6Tk35w4hIzeSJ
 2/I1I1ezb1j4Z8lt4f2kM0SJ7SOpC+6x7sHxaA8qcsU66aNof/AEI4Yi5DeU5cPNjlkm
 ks6DXEMo9YXRGxAPps9qnk7VHIMldYD7O3ooRmt+iiARoNTvQa4FqXl3Rjmzoo/s0jgJ
 OAFw==
X-Gm-Message-State: AOAM532EBe1SsnK5qacZmafqIYHFprtdZnKgl4Yf/hgODksMCL6QN8D8
 NIth94gQok7/rJkr1sfVB+Dwb1QUlvoBbwB/
X-Google-Smtp-Source: ABdhPJxQoKQ33t7sk+bZ1Ag4VRTYqTyjn6hC99K7WD9QRrdtbRglkEUG1MRu8+uMpnwkb0MJ0HS9Xw==
X-Received: by 2002:a65:410c:: with SMTP id w12mr3483719pgp.411.1601664698391; 
 Fri, 02 Oct 2020 11:51:38 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w23sm2201802pjh.49.2020.10.02.11.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:51:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Scott K Logan <logans@cottsay.net>,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: meson: add missing g12 rng clock
Date: Fri,  2 Oct 2020 11:51:35 -0700
Message-Id: <160166469102.35184.6476260540324145118.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <520a1a8ec7a958b3d918d89563ec7e93a4100a45.camel@cottsay.net>
References: <520a1a8ec7a958b3d918d89563ec7e93a4100a45.camel@cottsay.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_145140_716262_5063C494 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 25 Sep 2020 01:43:53 -0700, Scott K Logan wrote:
> This adds the missing perpheral clock for the RNG for Amlogic G12. As
> stated in amlogic,meson-rng.yaml, this isn't always necessary for the
> RNG to function, but is better to have in case the clock is disabled for
> some reason prior to loading.

Applied, thanks!

[1/1] arm64: dts: meson: add missing g12 rng clock
      commit: 832ee02e6e9d302152d0c130785afc4577ec9641

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
