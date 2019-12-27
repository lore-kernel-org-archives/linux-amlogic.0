Return-Path: <SRS0=RZf2=2R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4C8C2D0C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 16:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E98B21582
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 16:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kJSSMMST";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DwiKlg3a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E98B21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jT2JmzDObAO2sykFhRp4q8COd44ueEScSnHjCZgNgHY=; b=kJSSMMSTqJE3Q7
	m95bcS+lsYMbw/dJkSoGgDIgWyFB8Sr5De+4PKLdaJrr/orymZ7/j7nGMHGZ0hA3dfx1eeDwoxF70
	5e4uhGvUyxL8AqTtms0Jwmxy781Xz9E3uSMAcQGF62eOA6WkkjRAoBcLy2RShNKmmnbvVGMAFUcet
	qAzXiPKSJz1hO0bo7s6WmJWlhMYgs7uc9KslU95oJx8fulX4Fy0vzcIUAGresSYN9rJpo/t/o6i9S
	T07Hi4gk5iUZpRyWoqnewNX3LEqz7Yq8hD2vniDVj4zp2C7PVd8WhcOP8Vlc8PnNHXN0ud42XyqcN
	EcIkPIdkuqZaIE+m3Yxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikss7-0007mG-UG; Fri, 27 Dec 2019 16:53:55 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikss5-0007lr-Nt; Fri, 27 Dec 2019 16:53:55 +0000
Received: by mail-ed1-x543.google.com with SMTP id m8so25740840edi.13;
 Fri, 27 Dec 2019 08:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PutLJWPd2cEOhbmgZKTEhd5XEP7OpzpWifMhut4DmqA=;
 b=DwiKlg3avHIENCyNavhob2AMpVyTS9QSLl42Sq+4wmPxA2eGoEaW0dNQJSDgR9qVI/
 gVpTH5X0CHsaaBqUQSIqqYyJvt9ANz4oUcUiF1HgEuaNFJ4f5fSTRM+ZdOaxipbQ+37l
 e52TCpfVMWTs/4gfu4RQu63sv+6g+UJdbWRp+TidXrL8tOQ5ctn3zFDhXQl7NGKZtaEy
 ejJ3rs1FslamWH8noA5P8dlPPpBQmf7bK+8qfHBl8yjGCGtAJYq7knGY0d37A9JguVRB
 6wK1qjeq7+pJfp7csnP5t+//L8L+/RTNsK49f9NZAKBd2xrob+rD8KIBexvwXOkcSiRD
 3zRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PutLJWPd2cEOhbmgZKTEhd5XEP7OpzpWifMhut4DmqA=;
 b=A5yBJ+3PqSAhtN4vYGLoZlDcVwsJFMk54sg+66MAVpgGz93AbdnNfskWGAkQ8y4l5y
 heboZEMz79KKe5QJ+tqssmb42ZryldOlbicHwT9chSmo6frkQJYHvP5EKUxwCtwI0H+v
 q1YTD1INPpNrC9OQJ5dzfITlRYJsd8XJgD/RllM+l6x6JE8VcOIinunU+p6byegMxGNW
 JGZfdfs6oDt6itf/9BzGyRWFaDex7fTqTIRtmmGEM7QEZV5aNEEB+KWL4LeAgb7T7TCs
 iaU1CZNKZtLKnu52GU5DDDhDRbqfuzcVZPgvhjQb/WAYz38p7EGKwighH8YAUYhYEglM
 61Rg==
X-Gm-Message-State: APjAAAV2wKfkSj/zQgMCRedADmtaSsKF/nztqzZRqUHBAeuJspNMx/cm
 TAnfpeFvqOI7RGU9k1910xj9iSbo6W76l6SoVPQR4sCm
X-Google-Smtp-Source: APXvYqygkSSfnw8HoIDr9icAV5YXJN/IAat2JIa4d06E0rVnVK5uFaStiuAG+Sxv/pJ2HevsAWvvqJm4znilTktaA3I=
X-Received: by 2002:aa7:c80b:: with SMTP id a11mr57661239edt.240.1577465632157; 
 Fri, 27 Dec 2019 08:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20191227094606.143637-1-jian.hu@amlogic.com>
 <20191227094606.143637-3-jian.hu@amlogic.com>
In-Reply-To: <20191227094606.143637-3-jian.hu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Dec 2019 17:53:41 +0100
Message-ID: <CAFBinCC4Fgn3QQ6H-TWO_Xx+USonzMDZDyvJBfYp-_6=pmKdLQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] clk: meson: add support for A1 PLL clock ops
To: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_085353_802985_AF637246 
X-CRM114-Status: GOOD (  18.59  )
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

On Fri, Dec 27, 2019 at 10:46 AM Jian Hu <jian.hu@amlogic.com> wrote:
[...]
> @@ -294,9 +298,12 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>  {
>         struct clk_regmap *clk = to_clk_regmap(hw);
>         struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> +       int ret = 0;
>
> -       if (meson_parm_read(clk->map, &pll->rst) ||
> -           !meson_parm_read(clk->map, &pll->en) ||
> +       if (MESON_PARM_APPLICABLE(&pll->rst))
> +               ret = meson_parm_read(clk->map, &pll->rst);
> +
> +       if (ret || !meson_parm_read(clk->map, &pll->en) ||
>             !meson_parm_read(clk->map, &pll->l))
>                 return 0;
I had to read this part twice to understand what it's doing because I
misunderstood what "ret" is used for (I thought that some "return ret"
is missing)
my proposal to make it easier to read:
...
if (MESON_PARM_APPLICABLE(&pll->rst) &&
    meson_parm_read(clk->map, &pll->rst))
  return 0;

if (!meson_parm_read(clk->map, &pll->en) ||
    !meson_parm_read(clk->map, &pll->l))
                 return 0;
...

please let me know what you think about this

> @@ -321,6 +328,23 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>         /* do nothing if the PLL is already enabled */
>         if (clk_hw_is_enabled(hw))
>                 return 0;
> +       /*
> +        * Compared with the previous SoCs, self-adaption module current
> +        * is newly added for A1, keep the new power-on sequence to enable the
> +        * PLL.
> +        */
> +       if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> +               /* Enable the pll */
> +               meson_parm_write(clk->map, &pll->en, 1);
> +               udelay(10);
> +               /* Enable the pll self-adaption module current */
> +               meson_parm_write(clk->map, &pll->current_en, 1);
> +               udelay(40);
> +               /* Enable lock detect module */
> +               meson_parm_write(clk->map, &pll->l_detect, 1);
> +               meson_parm_write(clk->map, &pll->l_detect, 0);
> +               goto out;
> +       }
in all other functions you are skipping the pll->rst register by
checking for MESON_PARM_APPLICABLE(&pll->rst)
I like that because it's a pattern which is easy to follow

do you think we can make this part consistent with that?
I'm thinking of something like this (not compile-tested and I dropped
all comments, just so you get the idea):
...
if (MESON_PARM_APPLICABLE(&pll->rst)
  meson_parm_write(clk->map, &pll->rst, 1);

meson_parm_write(clk->map, &pll->en, 1);

if (MESON_PARM_APPLICABLE(&pll->rst))
  meson_parm_write(clk->map, &pll->rst, 0);

if (MESON_PARM_APPLICABLE(&pll->current_en))
  meson_parm_write(clk->map, &pll->current_en, 1);

if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
  meson_parm_write(clk->map, &pll->l_detect, 1);
  meson_parm_write(clk->map, &pll->l_detect, 0);
}

if (meson_clk_pll_wait_lock(hw))
...

I see two (and a half) benefits here:
- if there's a PLL with neither the pll->current_en nor the pll->rst
registers then you get support for this implementation for free
- the if (MESON_PARM_APPLICABLE(...)) pattern is already used in the
driver, but only for one register (in your example when
MESON_PARM_APPLICABLE(&pll->current_en) exists you also modify the
pll->l_detect register, which I did not expect)
- only counts half: no use of "goto", which in my opinion makes it
very easy to read (just read from top to bottom, checking each "if")


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
