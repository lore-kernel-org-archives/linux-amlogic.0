Return-Path: <SRS0=hY+l=TH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA1EC004C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 17:54:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 532382054F
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 17:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lwfM94+3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="M5MayXek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 532382054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSFornvPyzxA0Qj8Wy3flOt9Kh6gZs2otLR8MNtdJh8=; b=lwfM94+3eYikfM
	lt/6Rxz4ScrtmcDmBxUPh1boOwU1ssCD6h3kV383Cay89zCQBW2dS0JTvMoPhnH8va0Q7ADKqLuPd
	Yn7UUHBoHfS63v9AIsHp9ZgTWkywxU0d2bYs7KhfSpjBI0du+jpxxmHTMxMgzjuKJYQgQNsL+PO1O
	CbRgat607QZkoOY0FFRbJt45PA01ozIC1f6iiPqrMNphIwrg9n1MjZEDlyUnQsrSHJhJIOc+L84nS
	2+/uqhneODbyFtj5cPd0SyE7Qrk7zuo0hzdZ1nywHhxJLV8kequWZGEe6iNJ2u0YDKm3kdhZWM08+
	FCFo9UWoyPV5rg2cz4zQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO4Hx-00074Q-0L; Tue, 07 May 2019 17:54:01 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO4Hu-000743-Aj
 for linux-amlogic@lists.infradead.org; Tue, 07 May 2019 17:53:59 +0000
Received: by mail-oi1-x241.google.com with SMTP id v10so13091828oib.1
 for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2019 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7flmOY2ATgGfQPKE9sBeHn57pA1FJ9fgxAgK5bf/VXc=;
 b=M5MayXekFPagZQ5mdyBhaKAXMoy8IaH7d9jFE8KzsTXxsbxQ+j+4u6H02CRXeL1p5J
 EzTE4z4LojpYp7Nlyn/gV+zMJm1tyEgP7BseAUmRN5bNXZbn+mB/rydOG9HvlIhkFyaO
 V7Ay9tjeHOlLKfjzLdrymd3PBPnHCI5M10i3TlkXg++ucuhiPqCFcRweLF36wgBHWu+y
 3krEQlgulpbzhOpy467IhUvTv78AUJes+Ykb5SVN0BXM58cB7ogm+1SN9Qmavd8uyhBD
 aOZQOORBm3cucV/GAcz/jWRugt2Z9BjR8sAWbT+0owqHjp9a/hqBudd3nV/HVJwhNulA
 wqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7flmOY2ATgGfQPKE9sBeHn57pA1FJ9fgxAgK5bf/VXc=;
 b=BMurQO4ns6EdRYj8ddvQmcV0znIkdLRhT42lJoLWNcS6AEcrtZxb1Bw/TgB4bObetb
 C25rtUitKtccY+8+gAZsOYUF8L3heq1i20Fle94dpJ7Cbh1wS8S82Mn558KYWjzcHHOl
 j9Vof5pcvnSF9a4w4M9aydwBLUQhI3XTxn2rk3h1zjInQJ+X+AKqfGJ3+yGwG8QS/iTh
 VOF5UWL3qM81ofm5C9cDXB9pYjYhd8V8XQQitY2eDse4aGGysxcflmVQ2kHlXK7WjDIG
 4tWGuRWyjBxhispxdcm60OnkEZJm4O01xzsqKpNTVLicd1Ol9AyHxZNMStS0JvMdtHgo
 6LuA==
X-Gm-Message-State: APjAAAWy/DXn9dYv+vVn+HyM8k32ETnAX+7ZnN0s7wh9CrimwheFntDJ
 DJQl1g6PKt/CpM+8mUMd3s43Q3skhaLrRS8Bg0M=
X-Google-Smtp-Source: APXvYqwnv2W92AwYPmHA+pZgR+UfUWyGF7yrgdcg/vKDBYgUmxUAUGXWBDjENWKrzjJVY2Wha6sDhMq72YjhPCXJxfg=
X-Received: by 2002:aca:5b06:: with SMTP id p6mr1023295oib.129.1557251635564; 
 Tue, 07 May 2019 10:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190507115726.23714-1-glaroque@baylibre.com>
 <20190507115726.23714-5-glaroque@baylibre.com>
In-Reply-To: <20190507115726.23714-5-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 May 2019 19:53:44 +0200
Message-ID: <CAFBinCBQSE7wh367Aa25zwtDphsx8Z_KGDTn8dcSCir6bLvq_A@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pinctrl: meson: Rework enable/disable bias part
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_105358_378574_3419ACDD 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Guillaume,

On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> rework bias enable/disable part to prepare drive-strength integration
if it was my patch I would add "no functional changes" at the end to
make it explicit that this only changes the structure of the code.

>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
with the minor comments from below addressed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  drivers/pinctrl/meson/pinctrl-meson.c | 79 ++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 96a4a72708e4..a216a7537564 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -174,13 +174,57 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>         return 0;
>  }
>
> +static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
> +                                     unsigned int pin)
> +{
> +       struct meson_bank *bank;
> +       unsigned int reg, bit = 0;
> +       int ret;
> +
> +       ret = meson_get_bank(pc, pin, &bank);
> +       if (ret)
> +               return ret;
add an empty line here to keep it consistent with the rest of the code

[...]
>  static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
>                              unsigned long *configs, unsigned num_configs)
>  {
>         struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
>         struct meson_bank *bank;
bank is not read anymore (it's passed to meson_get_bank to set it, but
then it's not read, which is probably why my compiler doesn't
complain)

>         enum pin_config_param param;
> -       unsigned int reg, bit;
>         int i, ret;
>
>         ret = meson_get_bank(pc, pin, &bank);
> @@ -192,44 +236,17 @@ static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
>
>                 switch (param) {
>                 case PIN_CONFIG_BIAS_DISABLE:
> -                       dev_dbg(pc->dev, "pin %u: disable bias\n", pin);
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg,
> -                                              &bit);
> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
> -                                                BIT(bit), 0);
> +                       ret = meson_pinconf_disable_bias(pc, pin);
>                         if (ret)
>                                 return ret;
>                         break;
>                 case PIN_CONFIG_BIAS_PULL_UP:
> -                       dev_dbg(pc->dev, "pin %u: enable pull-up\n", pin);
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
> -                                              &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
> -                                                BIT(bit), BIT(bit));
> -                       if (ret)
> -                               return ret;
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pull, reg,
> -                                                BIT(bit), BIT(bit));
> +                       ret = meson_pinconf_enable_bias(pc, pin, 1);
use "true" instead of "1"?

>                         if (ret)
>                                 return ret;
>                         break;
>                 case PIN_CONFIG_BIAS_PULL_DOWN:
> -                       dev_dbg(pc->dev, "pin %u: enable pull-down\n", pin);
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULLEN,
> -                                              &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pullen, reg,
> -                                                BIT(bit), BIT(bit));
> -                       if (ret)
> -                               return ret;
> -
> -                       meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> -                       ret = regmap_update_bits(pc->reg_pull, reg,
> -                                                BIT(bit), 0);
> +                       ret = meson_pinconf_enable_bias(pc, pin, 0);
use "false" instead of "0"?

one overall comment: thank you for working on this!
in my opinion it's a good preparation step to ensure that
meson_pinconf_set is easy to understand even if we add more
functionality here


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
