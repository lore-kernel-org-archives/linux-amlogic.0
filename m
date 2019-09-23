Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB90C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 09:31:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70AB220673
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 09:31:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sBGiKHFO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wrdIO1Po"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70AB220673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSeyElGmVsFRZGqWJtiAyAJ4b43b05Gli3GPRu/n7Y0=; b=sBGiKHFOb34ggT
	MWLw2ezlP6MzCsu3MkpsDZGSX0soIA4UWiqbRx/JiYAWf2qUEcxcvpdmux1o3QYqrD6jii/8lTYhr
	KlSu+WHxGkm2yRtDsxvyRK703fv4vdmAIyhw3dvDU8+8T1PBTyPX7WZtw3eC68VcPwpQO+EYnQix0
	HKwGpvO157e3/iI+wk4jdtzMkiSAV3WmpFBRPpLASA44bEfjyceCFBVyR7DVnKl0ydnszDV2+zt0E
	mJIENNewVpPejmBqSCYruhMH5cPB9PlGRNWSrz83FUCGtVwHW2xnB7kbey+xg3/SckpPATdziVgZm
	Mi78azzJar+a8XD5MSbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCKh7-0000mV-GP; Mon, 23 Sep 2019 09:31:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCKh5-0000lJ-Kl
 for linux-amlogic@lists.infradead.org; Mon, 23 Sep 2019 09:31:44 +0000
Received: by mail-wm1-x341.google.com with SMTP id 3so8452300wmi.3
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Sep 2019 02:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=x3JttSp0N6ofBW5LzQ0aulDXvYerTBb+rX2QpQHK3GA=;
 b=wrdIO1PoBF2ps/wgVPQ7uZgIs5Zg0O6ec2Mr5yDnG+hTFoHtn0Gydw0y2TxLNoO7RS
 uzvON/ffkt8vQQwgbhQdf3Dm1NkL2eTxSaLF3pVN9rRInxT2rs8wVgjagDecCPN3VvRv
 IUuyLvPkD1/PlRKdlyhxvW335/fBDsuKetZwZszZNU8n3cBX4CkiA/4RzSb/AsJnPJAZ
 rxQ8xZt3QRrn63KbNcrr2D9xv5NvUpA878d8d37TxTIwnW9UOhO5a92vPuLtccS/mDxw
 3sgvVDUOXZTePA1JrDwk3o6qSml1QB5fvshCdgkifFi0U2UzrXbkKAI6UDibIxNwIiQX
 sq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=x3JttSp0N6ofBW5LzQ0aulDXvYerTBb+rX2QpQHK3GA=;
 b=S+Ycep21yODoOcPsnO7clHSbSuyH2JSeUjypKBVXI4iBYaDuCWfVQkyeQzZxfsvx2l
 0sk+AJi9+MokkyCYG8ntFgWunC9DrZ5uHZdBUZRjYSqZCDDbwv8bS67XJyxXIAgo7poy
 KXBMf0vSXrjwg/srQ0BNJSJI0C9QPAVbQvuSkPZA5Jfvr1TMnxCCZW+NMSUmJRi0a5PR
 J0BpAxlYI6+NpdKxaDpo8pWcTrnvylfTE81+F4dPcg5QHnzrpTZcccLkfSWSX2XhJK8M
 7+N7mEW1Uj/+GUNsuofM26E0DyB7sncJ545YxSPBPx3q+e2d5G9UN6NYzS5D8537Zblu
 VqFw==
X-Gm-Message-State: APjAAAX8D7455RLuueWMc10z111PAfab1fEQZSWUrPVSQtRPSqeN4k9c
 LQP+Yv1dDnEqGhuzz5Hclw1qbQ==
X-Google-Smtp-Source: APXvYqyjmPFntItpiTfyGO7Ke1GU6GekG2Zcx3JJvC7jGTA2yTviIKEUlhQB4iQRI8K745mhVLBAxw==
X-Received: by 2002:a7b:c758:: with SMTP id w24mr11891113wmk.148.1569231102351; 
 Mon, 23 Sep 2019 02:31:42 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v4sm15675554wrg.56.2019.09.23.02.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 02:31:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 khilman@baylibre.com
Subject: Re: [PATCH 4/5] clk: meson: meson8b: don't register the XTAL clock
 when provided via OF
In-Reply-To: <20190921151223.768842-5-martin.blumenstingl@googlemail.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
 <20190921151223.768842-5-martin.blumenstingl@googlemail.com>
Date: Mon, 23 Sep 2019 11:31:40 +0200
Message-ID: <1jwodzs6ir.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_023143_688452_B57B33F9 
X-CRM114-Status: GOOD (  17.78  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat 21 Sep 2019 at 17:12, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The XTAL clock is an actual crystal on the PCB. Thus the meson8b clock
> driver should not register the XTAL clock - instead it should be
> provided via .dts and then passed to the clock controller.
>
> Skip the registration of the XTAL clock if a parent clock is provided
> via OF. Fall back to registering the XTAL clock if this is not the case
> to keep support for old .dtbs.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index b785b67baf2b..15ec14fde2a0 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -3682,10 +3682,16 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>  		meson8b_clk_regmaps[i]->map = map;
>  
>  	/*
> -	 * register all clks
> -	 * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
> +	 * always skip CLKID_UNUSED and also skip XTAL if the .dtb provides the
> +	 * XTAL clock as input.
>  	 */
> -	for (i = CLKID_XTAL; i < CLK_NR_CLKS; i++) {
> +	if (of_clk_get_parent_count(np))

If we are going for this, I'd prefer if could explicity check for the
clock named "xtal" instead of just checking if DT has clocks.

> +		i = CLKID_PLL_FIXED;
> +	else
> +		i = CLKID_XTAL;
> +
> +	/* register all clks */
> +	for (; i < CLK_NR_CLKS; i++) {
>  		/* array might be sparse */
>  		if (!clk_hw_onecell_data->hws[i])
>  			continue;
> -- 
> 2.23.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
