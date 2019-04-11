Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7B3C10F14
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 21:39:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBA9F21850
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 21:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BqrU89/c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TvaDwhxf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBA9F21850
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbbcJOtoEbmDfDL7T0toBJy0pnhbbvELRrRMwlmPq1I=; b=BqrU89/crDdQwE
	uEh0fwkKnIK/xdd8TT2Oq3V+0nboTHnQXBpqW5i7Ma6TiAp7UlevqI8PLmi0/skLf2In5ZStQEMOe
	tPZ8F2mcXRhizf9i2o7+9z4Q10G9ubFqZF6xYGgHpxP9XO3iB7zegdB66fcbgCMlCpJUhjFHCQe3y
	uQVdshvCAn6U3YcoNq8Hxpbu9bemJNWvtOC6hE1ElsppeG0+/R2aMHIUZuNsGkiISac56m0iZn8gZ
	yCW3Ps2w74S58G4wAntIUNSeIT6A6eItgt4+74Kv7LJMPBmNe7cg4qcl5R6Ou/tjHJ1JFbgVUhJ2R
	Swl6+ajlt+SAubkL+3/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEhPO-0002Qk-Mu; Thu, 11 Apr 2019 21:38:58 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEhPM-0002QF-5Q; Thu, 11 Apr 2019 21:38:57 +0000
Received: by mail-oi1-x242.google.com with SMTP id i21so6213613oib.11;
 Thu, 11 Apr 2019 14:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c/Eaat6mJaApPXTKW9fxNSQtMRxRCGIGBY0z0WTwZsY=;
 b=TvaDwhxfg26dt8H/AyPFMVm1oubn9ub7EVmMtB+QXJr+GfKype/hsuV1znFc5ueAUg
 XNSe5y9xoMLQ21nUKsuVikIHiMtsr+ZA1aoNrhWiAILFzu0LT6UGrb/jIVQfFa65SpYU
 R1OI79488ZvcxCSU0wYM4tA8tLETlnz6zhLMWghea0PWRlBx/SzlO/8TjNFXqKAaMhDK
 by7GY5b9rNGKSqal9xQk98TnVcSMUWdCTyQ2nMSOw+Y6szke6WlY/ZWWD3TFDvgg+TEf
 zA1aXbnfvOBaMHltAHsjvzs68MNyQLyYTztaRv4G7gesBJ71JXtet+ex5ahay4550GQ4
 2UTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c/Eaat6mJaApPXTKW9fxNSQtMRxRCGIGBY0z0WTwZsY=;
 b=CZeLe/5CNNSqF5ZqeNP0TEfU7pKGqGbhowkYA6kLqG1ByfEbWvWbkhjiCS4wLw20Dr
 9UvJClh5jBJ+RdjSAse0AOX8cf5Dt89fV0/ehBqQzvethElkO0J1IxbMJj5GkQSUPXmR
 P1Ug60zvcHBR7byTW0jR/mi48K8X1OiC6rWzqdpLsIt/9JqkV6UCqlHsi6zZM0Wl7LZ5
 rYCIugnntZsRJo5IfvqdwEroFm31bc6LgPDv3WmO6bsrJKUzPTCdanOI4vrAJfkuSJjj
 463j7eMwaXQothCv0/MofKpLWQd7Y2AnzP1QOw70PV93TIpixwp14qly63eWSsqnRu6x
 JjFA==
X-Gm-Message-State: APjAAAX/JpJqGpC60aCKaqyR4aRismBM2g3KzfYbPQ1VZaRW2yCGf1RL
 uGKBqRJvWSZsWTb7mWLooadMtajjoBMoReEWobM=
X-Google-Smtp-Source: APXvYqxpFjlc5TAR58LDBDGCS9RlzmCK78XSQeYEC3Z/MRTErq4S19jysbPYG23FDxcOpZ+8xZAKbsLGBGqwTHnXxxU=
X-Received: by 2002:aca:4482:: with SMTP id r124mr8219082oia.39.1555018734440; 
 Thu, 11 Apr 2019 14:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190411084537.30299-1-glaroque@baylibre.com>
 <20190411084537.30299-3-glaroque@baylibre.com>
In-Reply-To: <20190411084537.30299-3-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 11 Apr 2019 23:38:43 +0200
Message-ID: <CAFBinCBVmPa5hi83B1ZTe-guassHxKQFrN5QOyMJc9s95LJ1cg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson-g12a: Add Temperature Sensor clock
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_143856_232391_F5B98B7E 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Guillaume,

On Thu, Apr 11, 2019 at 10:46 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Add TS clock used by two temperature sensor
thank you for working on this!

> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 31 +++++++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h |  3 ++-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 3a3134976534..e6d2af6ee8ea 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -2335,6 +2335,33 @@ static struct clk_regmap g12a_mali = {
>         },
>  };
>
> +static struct clk_regmap g12a_ts_div = {
> +       .data = &(struct clk_regmap_div_data){
> +               .offset = HHI_TS_CLK_CNTL,
> +               .shift = 0,
> +               .width = 7,
buildroot_openlinux_kernel_4.9_fbdev_20180706 uses ".width = 8".
That matches with the public S922X datasheet from hardkernel which
states that HHI_TS_CLK_CNTL[7:0] is "ts_clk clk_div"


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
