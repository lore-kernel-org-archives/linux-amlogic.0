Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFF9C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:59:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87A052080C
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:59:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="toahAx4C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eB8YoYOS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87A052080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aTylFh6hrqTd9KEutl+vQbA/PteUTwsbp9VctsnEdLM=; b=toahAx4Cc4wabBu2cmsCmyfEn
	ZcqzHSVyc+bMWuibs5JdgA9dfwA7wh+HuhVsWNCTcL/glFFxLY7EfvKhX4PlMnzxHpo7xBvddFLty
	sighcxoevZMFRR4AHelsQ8QjOcYFO+mgAbrjuOibUd4khpYHhzFDf2fbIYtwQ7P6mVh47wc3cVeZJ
	K+UpSJYtPxlC54unDgVL7RBMmQiFgazVh/3moEYde+kEnRja7xxeVCiriqK0tUHAwaQBIQlsnkcBB
	rEF1vbOosZOfsZoBakCNxQVwie9ABBcN593LxseLkufF664oxfnNBao9UM3igGcKLpKHNSP3xU44p
	T7CiFn4Rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIH78-0006uA-KZ; Tue, 15 Sep 2020 19:59:42 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIH76-0006t2-0E; Tue, 15 Sep 2020 19:59:40 +0000
Received: by mail-ed1-x544.google.com with SMTP id l17so4240212edq.12;
 Tue, 15 Sep 2020 12:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7RLNR+VirUb/uAODVT/yUShu7jNp0ygawaN/ILApZ0=;
 b=eB8YoYOSeUIcRxhZrwQXxQ7Ig+nfGWQ8X1kdmSJ6LXacs3Z+6fAoDmzyEuNu/UXFxz
 hFxMFIT4OwzrCM3u7RJQbbk9fOt2E/0QoAALEYHDE1RXD77ffAYyULXacOTWy6lvlGKL
 l/8T+XO2R7Cm4rcLfPr7Am+NMLDG2NwAMgq1gwISC9waz/kKvysx3B/0XB5+ZRHWfboK
 nW/sSOsc1fiX/10VLy5UWOyBOjWyOuKybtn3OiPKEUIORoYcpTFuvcUA7SI1vAunN+3I
 zMJA3pxY9vR3rv8Lhjpyk74PBEcu03w5oW/ZwbMMMxWbGGyRkvbDxY7s2W8meXR2Ee1b
 tDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7RLNR+VirUb/uAODVT/yUShu7jNp0ygawaN/ILApZ0=;
 b=k94/GWBm31GNYoZHwwWNQsqOH9a8kl0sw8U2m6lsl/l4Tbb3MI7aU9B7w2MheG78JN
 dShY6vjRTV23l2FVs0Zc3xY4qvsT7bKCCREcBFZBGzfgCWyv33GOj2b/7UyJkOPY+9zs
 YkgYAIDCYyJ0wwrpgypbCKGbWZF26HQKaRfqBABu3iV+hmxvdyyLSX2z/hmsAQYaNVJa
 Alsu+GHOlrj+Y14jBnruVsXLKy/gMbuOzTV8LcA6AoK9FkS04MHDuDj3nq+wqtDEhA/r
 8Yx4rjBwjiBkR6+HnJiLZHB8EnC1WU7BoC9Kj8cG4gg1fYL1jkhk/0ROuT5tSTeAxys/
 JLIA==
X-Gm-Message-State: AOAM533JT8hJDpPfoVGOsCFyBkY42JTQUs25hYTh1B6/BoQXakfMv5iW
 e/2s4WhBfjC7kqBasf+Zyrf2H2Ha2U9dMX1nE4c=
X-Google-Smtp-Source: ABdhPJwVckPjSdsQxJxnp2l2KOi29DouQvL+6SIfp1k9vTQ6+NG83TwB0YzKYH20/8Q9jWJxUFa8oVUilVv1QfP7MXA=
X-Received: by 2002:aa7:c0d3:: with SMTP id j19mr24940978edp.40.1600199977756; 
 Tue, 15 Sep 2020 12:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200909160409.8678-1-narmstrong@baylibre.com>
 <20200909160409.8678-4-narmstrong@baylibre.com>
In-Reply-To: <20200909160409.8678-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Sep 2020 21:59:26 +0200
Message-ID: <CAFBinCCFmb7S9iR7_z7w5=_sOQZ6sMjo7YWdsETObyNa7MP6XA@mail.gmail.com>
Subject: Re: [PATCH 3/5] usb: dwc-meson-g12a: Add support for USB on AXG SoCs
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_155940_050555_31DC1C20 
X-CRM114-Status: GOOD (  10.26  )
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
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Wed, Sep 9, 2020 at 6:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic AXG is close from the GXL Glue but with a single OTG PHY.
s/close from/close to/

[...]
> +static struct dwc3_meson_g12a_drvdata axg_drvdata = {
> +       .otg_switch_supported = true,
> +       .clks = meson_gxl_clocks,
> +       .num_clks = ARRAY_SIZE(meson_gxl_clocks),
> +       .phy_names = meson_a1_phy_names,
> +       .num_phys = ARRAY_SIZE(meson_a1_phy_names),
I wonder if we should also update the comment for meson_a1_phy_names
to understand that part I had to go back to the dt-bindings patch


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
