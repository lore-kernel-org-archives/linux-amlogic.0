Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28177C2D0EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 19:02:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0089420780
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 19:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YHtLv0Mr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="nhSCvAIn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0089420780
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bu2FmXHd0e+jXVkmjskNFzsRKXRLeubaE3iGbbLV+ng=; b=YHtLv0Mry3CVHr
	8N6cJnE2CAqshSl5Go1MdSc49vJi86vq1qHY5zfQV8nmu3VGOioq9WghZ3yWqwVsCywPak3NG3+46
	bPBYZyii+Esebzk5X2W8nHtmadbtDToVzFPfNVG683QA+k3Dq92NZX0L2AWaoOaKrwRwloRYgjzmE
	BCtVap+KMkOzflnr0Z1FqQjDdJaMnWtYiTZD2x2jah/0V0xoBiEH3f8a5Bg0UoBrC21NJlpfDnQJf
	06O0T6mFRe7VBuCKNk0IWHRy8gymlYdTAbwxMV6IVlCGHiD0jpH6imuvGC7fra0YhjanvzMgU51MX
	DhWOxFjvkWp8kwEL1LYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPWFT-0006fg-GJ; Fri, 17 Apr 2020 19:01:59 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPWFQ-0006eg-PF; Fri, 17 Apr 2020 19:01:57 +0000
Received: by mail-ed1-x544.google.com with SMTP id e5so2268011edq.5;
 Fri, 17 Apr 2020 12:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ws0lGObjtWkfbXmBqtfEqFJnV5cJRhTx4fqD0Q8cnBs=;
 b=nhSCvAIn9SOUp/QSQE0a0stljfg8bCGxS/WVOKNAq32tSji2T/MlLN6N5hKSkGs8Q1
 1Hj1P4OBFNbPEuexW2ofGFBJfn2JCZo/h/oBQtj3R+49YApA8xLc9FcENfylm4uZsihr
 PrN3wtI2fyzkxaICZKRlp0Q6qiVeoAMwvDPPmqTmKJpPBpHL9Wlb8FAhu4tTuWNXihox
 i6BZIRxCvdlNTKi6P6++kC1qTTbz2pJsm8GwDRMi3IFnC6psIAObSJOyRv8SOy/9LDea
 kVO0ulyl92+e3ra0I4rZpAXxTtOE5sSFn94sL9qAMs9BHRmLpMgIGprNpDuBiIo2aWcr
 GtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ws0lGObjtWkfbXmBqtfEqFJnV5cJRhTx4fqD0Q8cnBs=;
 b=RJNuqqgfx6PJho8l++VtfOB7mgc4B5Zi0wRSCEmBFeMsHxp6eDip0xiRJn5gp2H410
 zFLzj+OUVRR9mhy3yvvtQiRinFKhUdxyPa0RUtN8gxx5RnHs1UV+65kJGSRFZfxcLqb5
 /hwikGIjeyD8Jisir50/BUoVRlsRJ3PAERDtnHULFqPczbDLRvh88VHftsQ+fczoeMp7
 mqiLIhUddQGNLZofLfaqTn9lMFTK0u71iw0RkmUK1Vkx9YWVvqccmqOU+4UL1e0keK1N
 3VW5ixhq4ANnK5mzzQQI1WJzmPaWTdzhj5Rt8Lu6QscIgHFhmWWjNfVwenk/WXTMD8U3
 ZyTw==
X-Gm-Message-State: AGi0PuaEVRpW/lKS6Obx0NIR3sMyS8AXu3pHwG5SrWlaKAYtWUvFI0Vg
 atdff03EXtbZZm2Gg6uy4m+quQ1lL2xvN2CGgP4=
X-Google-Smtp-Source: APiQypKxFRcocN12xEBF5koGWzrxYBcKMvJXbVGzd+MQqeyCeALK+IsccNlNdyjEYO6sxS47F8FsDBlkB2FlBJzQWwM=
X-Received: by 2002:a05:6402:1496:: with SMTP id
 e22mr4449267edv.301.1587150114192; 
 Fri, 17 Apr 2020 12:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200416121910.12723-1-narmstrong@baylibre.com>
 <20200416121910.12723-4-narmstrong@baylibre.com>
In-Reply-To: <20200416121910.12723-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 17 Apr 2020 21:01:43 +0200
Message-ID: <CAFBinCCPZCNsj=dA3_fzrPqGCrpRzeJ7OPGErFvUeKW=iW-r9g@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] usb: dwc3: meson-g12a: add support for GXL and GXM
 SoCs
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_120156_824839_B94FA35D 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: balbi@kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 2:19 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> In order to add support for the Amlogic GXL/GXM USB Glue, this adds
> the corresponding :
super nit-pick: if you have to re-send this for whatever reason, then
please add "new compatible strings with" before "the corresponding"

> - PHY names
> - clock names
> - USB2 PHY init and mode set
> - regmap setup
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
