Return-Path: <SRS0=J37j=3H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9975CC32771
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jan 2020 21:58:02 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 644792469D
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jan 2020 21:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTwheDNi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sWCNj0ZQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 644792469D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZuK5+pisX4qyxhed2Wjmanr3ZmxNT50mwNstH1h4iE=; b=iTwheDNirvAY6J
	dZSFz5z7xHHIZ6ziW6H15VMchKt0pm9qXLnjemZEputlLLq4b7svvSlYoM8n/izrf0Ji+uRXZ2unk
	lBhtcb0TlprEw2o7H2l3sT4HVsTZNyMmKbWkmSfQpVyuzfF2WvvrghFYukBddTzzuufQ/hoH3/Tpm
	d/0tqO+0oa7160OkV/hZdrmQv+rYpy3UF2eLZ8qcSiOF/zho7p6lx27xu+x3Pvu4vEs9pJBOJCTzN
	J4Xj2l1/9kzCHSHHFpGuGORdJaK/ZL/rMgk7Sw0Gd6060RLGRo7DkBTF40ieLWgsWWWGGQvKbEuB4
	KcvrnNalHpS1x0jOUQgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isw5o-0002UL-9y; Sat, 18 Jan 2020 21:57:20 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isw5l-0002Tz-HB; Sat, 18 Jan 2020 21:57:19 +0000
Received: by mail-ed1-x542.google.com with SMTP id j17so25875936edp.3;
 Sat, 18 Jan 2020 13:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xhEeNJG6Xe03fAdCWoX8L2PNC8Ts9rcXxVowinyH7Jk=;
 b=sWCNj0ZQnbgArqLuw0XgK3tLKDpG6In0kiTRu4lFsb3+62AuuZEdDNrhrHEkXU2ZjV
 +NrFKwt20CkDMRpye3isHNQcsRe4mFxsOjdn7Gp4QbGCaPHjbubuf4xMV4m850btYfaU
 TH81GKDtQnnthH05MnOsT+EYtj9H+Mq8IYH5JvMpfk5DC5lpx1gJUk04CLiNe0kou6CR
 CxjhEulvlHdjr/a8LTvPVSqxb22EoK7D09WKmiSuVPsSpOEI306HLTEK9GmVQdhZeXrk
 nqo7nRAKokRDqaXotijdhTP9Q8nwucOa4JcN2DR+I55VtM5D4dpSNez7Cw7SNzYTZsas
 v3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xhEeNJG6Xe03fAdCWoX8L2PNC8Ts9rcXxVowinyH7Jk=;
 b=Pg6p0S9F3FXje2+au3eGYgr05CU+jJRMdWbPn9zNLKkbwOp+7q043dr4OoD6aGfzYp
 AhZ3G4Ef3+9y5kbmRoPdgr0k6LnTO37pBwjGVMRQOTgjsHBLCBMyUaupgZ2ri27GXbVe
 +UWSMiYktENBTHrdacZiYoQNmoW4zqqMjmQXc0CvkTPGlOcoep/kR7YJBG+JbeOg84qu
 LNEDufhWsdtJfuBRjbafEjMtCRUMiKG01I0fJd8BrF1qG4B4/1LERFrynub0ivji0Hwh
 eT3us1y4Mm2vxaFK9+z2/9n8peiS2UhYyazpUmNq4j0pdrkdWnhgE2bQrp9SEB78EMjO
 mF+w==
X-Gm-Message-State: APjAAAWEFpBpfFDfuBxrS1epmLk9Yb4YdTG0gz0Sj+X6mktQ9uydWDMH
 7MbEaJf3ePW+qp064YgwLaNTsWWVH2BRMkeNmj0=
X-Google-Smtp-Source: APXvYqyjnAk8oubKYhxKxWzUPog0rE1nkqWdTWkbrvxjIY8nWbYmSn4gzUFbwFiw03cl5ZtTyqcd01lYsxkaQM35M+Q=
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr10507644edb.146.1579384632180; 
 Sat, 18 Jan 2020 13:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20200116080440.118679-1-jian.hu@amlogic.com>
 <20200116080440.118679-3-jian.hu@amlogic.com>
In-Reply-To: <20200116080440.118679-3-jian.hu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 18 Jan 2020 22:57:01 +0100
Message-ID: <CAFBinCCkmUzNBeUz0k7na2FgR1SPKda81j+RnhEp9Jj84HEzmg@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] clk: meson: add support for A1 PLL clock ops
To: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200118_135717_594022_B36E91ED 
X-CRM114-Status: GOOD (  12.81  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Qiufang Dai <qiufang.dai@amlogic.com>,
 Chandle Zou <chandle.zou@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jian,

thank you for the update!

On Thu, Jan 16, 2020 at 9:04 AM Jian Hu <jian.hu@amlogic.com> wrote:
>
> Compared with the previous SoCs, self-adaption current module
> is newly added for A1, and there is no reset parm except the
> fixed pll. In A1 PLL, the PLL enable sequence is different, using
> the new power-on sequence to enable the PLL.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> @@ -323,13 +330,34 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>                 return 0;
>
>         /* Make sure the pll is in reset */
> -       meson_parm_write(clk->map, &pll->rst, 1);
> +       if (MESON_PARM_APPLICABLE(&pll->rst))
> +               meson_parm_write(clk->map, &pll->rst, 1);
>
>         /* Enable the pll */
>         meson_parm_write(clk->map, &pll->en, 1);
>
>         /* Take the pll out reset */
> -       meson_parm_write(clk->map, &pll->rst, 0);
> +       if (MESON_PARM_APPLICABLE(&pll->rst))
> +               meson_parm_write(clk->map, &pll->rst, 0);
> +
> +       /*
> +        * Compared with the previous SoCs, self-adaption current module
> +        * is newly added for A1, keep the new power-on sequence to enable the
> +        * PLL. The sequence is:
> +        * 1. enable the pll, delay for 10us
> +        * 2. enable the pll self-adaption current module, delay for 40us
> +        * 3. enable the lock detect module
> +        */
> +       if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> +               udelay(10);
> +               meson_parm_write(clk->map, &pll->current_en, 1);
> +               udelay(40);
note to myself: first I thought that these have to be converted to ulseep_range
BUT: clk_enable can be called from atomic context, so the atomic
versions (udelay instead of usleep/usleep_range) are perfectly fine in
Jian's patch


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
