Return-Path: <SRS0=xGFd=SM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7470AC10F11
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 17:59:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BC54206BA
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2019 17:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TsBi3JtD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Iq5j8cXf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BC54206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQBpmC+GQXc0NaXAGRl62YObURE2S0TkKIQqQeMHsYs=; b=TsBi3JtDXSGYVc
	xJ1Q/ZY2U1Us9huIHFAioT0RNdpZ0WSHLVtDV3ueXtpfOFmIM9bRZ1tGC0w4Q1EOJHABZsKiOgwqB
	EmCBepHvFY6od9ppf2SCogjmGrLq39qd6rYRUMNaWOcDdPWg4LqRVoscpAVqZHzvRHMX8NTaPxojt
	Hi9Ra+Y+D9bfFAGKFdoEwZU9kjcBU3huUn3k5H7sMh5R7t4xd7PaI7fxU5ppfEePWGz5JDoK5gvTS
	zqTQBSLSJ4IIjTJGSfl+p4G/iFrA6eJWUpkj16YSCZkWxqEvsyOI1gb+5/GOlb/pVAJoMKM9887Se
	2TYH0XvrinnbMzFnxEnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEHVO-0005CA-Tg; Wed, 10 Apr 2019 17:59:26 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEHVF-00053K-LO; Wed, 10 Apr 2019 17:59:19 +0000
Received: by mail-oi1-x243.google.com with SMTP id t81so2550334oig.10;
 Wed, 10 Apr 2019 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tzr3rEdrvu7VkWFExmY/yj5g2tkhcJNdoL9bLb2rWmc=;
 b=Iq5j8cXfjQYpFcTlrEyKBE0/Fd0H+FfPBdggiMagMblnQ0n55PGceiQM52IAfvJCtT
 7E/t27C1eiASs4KR0C27VubsWktMmfnYohL6KXuLZgWjjeYuAABQ576odJyyZ70DRrG5
 hX+jVpZo4AYBz852WcAZvsS60C2U1+1yDtKhuk9nAILjvzkUf1eP1jO0RN+sK98YXkKV
 qL7z5nHKdAMjXVHvoSUdrGJKrHbARSt8lvFUPK04ZCAWZYeq7/2trrCZ68j7aSAMqfiN
 r5cWcHhhY9/71wkFtDiaFBCYfKXBQmbwmeXmjHAX9n7cTHw+P20lGel36JoRD1NWokeM
 H4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tzr3rEdrvu7VkWFExmY/yj5g2tkhcJNdoL9bLb2rWmc=;
 b=X4ZsCadpt/i5kihMNtjwTGwljlXI9IpPIvLyERRH8JmR09/aQV7i8W0JxA80grsPwt
 MVe7LvLqzUdZv4gUbjUwuOXcKZQGUeudnvpQbuqzdQZjHOzK5ddc96IDRGVPs9N1zwbD
 /hk+dcShCyiumLOYxuRYfdyvA8LATWBlMYgMnNnSfpEHShCMkaJtqaUJRVkjCurSc29k
 1/eM2CfvXeCClqnW6hUnDv1VTCmnqK7V5KAzJ+q+6751y2USJ2daj0UKCOqjvrncNi6Y
 PsP2UvevTDxqJ1LlCbeGxpxmTl80NcQWwMVjaHthvHaTVxardqNqdWIS/ggONF9VCJLp
 jiOQ==
X-Gm-Message-State: APjAAAX7wx1BceZh/3QDpJXALNFDQdnpK+KjDdVwKz3/X8n9tdYABess
 R/C5ymOrORMCSWj9agYObn3Zsy8aED8sZsIWsEA=
X-Google-Smtp-Source: APXvYqzHil5sGmhkf3rF0VnxRnRsbiC7CjXpbHcut3ueXny08klgusL5vpDGa3bWeLIzK3D8FsDzSXIypOpPz8pw5ko=
X-Received: by 2002:aca:ecd1:: with SMTP id k200mr3544573oih.15.1554919156366; 
 Wed, 10 Apr 2019 10:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <a8539bcf66065380069676fbea99a51254309803.1554874961.git.chunfeng.yun@mediatek.com>
 <9f04a619e8a2cc44f5b1fe299a08f237f069d56d.1554874961.git.chunfeng.yun@mediatek.com>
In-Reply-To: <9f04a619e8a2cc44f5b1fe299a08f237f069d56d.1554874961.git.chunfeng.yun@mediatek.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 10 Apr 2019 19:59:05 +0200
Message-ID: <CAFBinCBoQ6C7MrtwSctDgFPpXnaRVKm490piGOFmN2i2PV3GOQ@mail.gmail.com>
Subject: Re: [v2 PATCH 4/4] phy: phy-meson-gxl-usb2: get optional clock by
 devm_clk_get_optional()
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_105917_705436_207FAFB1 
X-CRM114-Status: UNSURE (   6.90  )
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
Cc: David Brown <david.brown@linaro.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Motoya Tanigawa <tanigawa.motoya@socionext.com>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <andy.gross@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Apr 10, 2019 at 8:13 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Use devm_clk_get_optional() to get optional clock
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
now also:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
(on my Khadas VIM by manually adjusting meson-gxl.dtsi and dropping
the clocks in usb2_phy0 and usb2_phy1)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
