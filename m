Return-Path: <SRS0=O/xb=RI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE96C43381
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:03:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 550B02082C
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:03:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NnG9p1Rn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="NtPbMt7Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 550B02082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WoTuCijF+gZRUZIS4AOtkuk7NJVohgo05So/VDBClno=; b=NnG9p1RnJ7dq76
	eNLGmVAJ6eXtkNmlFYanZh3M8J7b8HbTgV06kLSw8W3etHJYiFwmVn+4beJmmAVrTfql0UNFKSuyG
	ib1uzdCAewVmuyfRtp/eSDN6SQgjcwqammaATeC1xr1ljIk0/Pb2EzJvlBvshnknYGQG2PPqBnE1e
	i4TAyu4GWARFTA8e82lN9eCaCRZ6rEUZLHoMdruLUdaGv79V3xXs5+IRp6NxbYtgquBtboFnJ+V5g
	1SJiZ5VBtwrQyQCIc49mqmqQ15SfnpinOJQsXCXVmILN+4yxuVINLTCOp1AaSUY1P6CvcCKs+K2tc
	V13rYea8RBKMMf2nc9xA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1HDm-00030r-UO; Tue, 05 Mar 2019 21:03:30 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1HDk-00030D-Lu; Tue, 05 Mar 2019 21:03:29 +0000
Received: by mail-ot1-x341.google.com with SMTP id z19so8715916otm.2;
 Tue, 05 Mar 2019 13:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GH9PWq7BwLFfuuMZa78aaB8pbIhV8onTtf7NpZHzVy8=;
 b=NtPbMt7QB/c6LegEcoxN3Aqi1GU23MFJ+ja4h41ZYe3/3OCyLbfyvPghTJsd44FPli
 ma76PuUDof9RdoMPGHf8gOWnaHkJhR5774K4+w1R94EKlYVqn+Ft0+Ssvjm9s25AqGZ2
 lGxja8nUc/7nwb4aqPLcr+Fw7FYDdMkYTDc09MZTDx1bq/JKXAWkjANhK543CANVAYuB
 VEK9WyvisFe34Mi0kOO+sUfSgpIegFR1SPTvmgdo5T5pnkdKsViDdHwV3m7m5pkJSnoX
 o91azTXC1U+m66hxHJ8DpiJ5eXNqrpxccGCAQPVd7EGYALvLfqQ0nukv81+sedTAPPLH
 IYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GH9PWq7BwLFfuuMZa78aaB8pbIhV8onTtf7NpZHzVy8=;
 b=bVOcOt7CqFDfVWFb5119+SruNfQpxxYtcWMtBLReZ7dWbd1pIrBWcC9vjGcRNbQWuo
 SdJyyuS37Ldl1YwcE+Ck3X+gHbb33EKtlz0Fs5TQTu2tlfB6nSxaS+/daU3oYr/NIoQr
 6EPzCqCdg58COfhSkXHk9JQDA8WpCBiaEJcmCl8GY4sq37d5gAG7flHd9/+Z0alAu2pA
 +q9ja1JMM0m4/vRsc1DGThXajlvJSRJ5z/dTRAamPMSfOU3rKUjXVi13vj5v7k8iMxUy
 wNehMoOs7VSD7Wu0SwdjoqZ1aSe5xu4p5mZ/AXa1Zr1j11Sa7KQwx8kwLtLDgF/pXnrP
 V5EQ==
X-Gm-Message-State: APjAAAUiY/NELb1AlzCnEBV8vMiydn4NzIc2c3Kjwm75Ixr2wDqwyq2F
 hPFZtTcD4L2DNpAu0XpBwDrLShZ/1A8v2lS0lSE=
X-Google-Smtp-Source: APXvYqwPiDXybaC+IkpseC0vNHek7azGoumctxYWbPQ1zioQjVZmEXZEPxGkhAUTPXZU+f9jKiXaqeMUNyx16FWqaVE=
X-Received: by 2002:a9d:a11:: with SMTP id 17mr2338491otg.148.1551819807613;
 Tue, 05 Mar 2019 13:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20190304131129.7762-1-narmstrong@baylibre.com>
 <20190304131129.7762-2-narmstrong@baylibre.com>
In-Reply-To: <20190304131129.7762-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 5 Mar 2019 22:03:16 +0100
Message-ID: <CAFBinCC30DR7dsk589Z2yQr=HkOQofNYX8y-ds1DM_gV=iBujg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: meson-g12a: add cpu clock bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_130328_713571_B20C0276 
X-CRM114-Status: UNSURE (   6.66  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 4, 2019 at 2:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add Amlogic G12A Family CPU clocks bindings, only export CPU_CLK since
> it should be the only ID used.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
