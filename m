Return-Path: <SRS0=l/Xo=TA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B167EC04AA8
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 20:28:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E7F02087B
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 20:28:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mAz0n11E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QvNJON2c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E7F02087B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMP04xPunfalQdOFdrGE/AP7z/dRbTc19Wd0vHHlOOc=; b=mAz0n11EAPrcCV
	W+hqE6ujmDFLH7Y3mIpEYyNjFmjXo/oI7JIHZCdxWKlWOHWh44H80SETqi5c+T6i6YgLeKQdU31V6
	hakgmq7yP5HtEylM6pC3+LQb3mFmkiMdOXwYrPBx0MTgMId75CK3UPBCf9nPcBorUU1sSqN+58qdM
	RYWl0GW73TPq9jYeBtA63Bh1gnfJX52vrgvyYOm39MxZpYMQO4jJz0AAHqMmKD2yJT/89l8GBUOoY
	a+EnqVjMndjoJnnkA1V27/eeiBnrYG6BmBTFes5rjsbuOCLHtH7yJ35HbgmNxuD0FI0dwGZr7CdII
	9HKSiVb9rruR/ss9k4xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLZMj-0002Oh-D7; Tue, 30 Apr 2019 20:28:37 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLZMg-0002Nl-H9
 for linux-amlogic@lists.infradead.org; Tue, 30 Apr 2019 20:28:36 +0000
Received: by mail-ot1-x342.google.com with SMTP id 77so7004599otu.13
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Apr 2019 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LhInCogW5fBN1UHGCn0VnHVOLp8cw5J2wKFD/2/FOA8=;
 b=QvNJON2chOzSTZmGccuzYeu5JQYAhI4s0kdnVPb9w0kZLtf7LxQRuuqtSuQFZ4hcXG
 tcREbMpgxGM/bKenRs/w2EhtORzpv6Fr2cevIzLFgMfxh052Sm6tI9lIWvRspZRzalaS
 cN+kCQHJZgBKwPZyJx+EbAlJA1cLAlZX1Y+cJ40WVoG6YstZvrZxg2AX06VItUvOs+Lo
 /RW4DvrxlBYCptbb96QlR8ogOcjmPf1Fe5/oT7pPYWMiWx/kKbQhO3CjGZcm3QjVrqTk
 simg79SdfhJEkwDDmFg1GVqt9Gm/bk7Dd1n65vBHjE9+KBBL9EpTGDhDlwHMDG3vEROp
 7Atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LhInCogW5fBN1UHGCn0VnHVOLp8cw5J2wKFD/2/FOA8=;
 b=YtBu82hkzADp/quAew85/n4BzT7Pjdc0jTCkfxg4ON+IjAECniRMmXWo7cCaA+yJC/
 Aq0l3AJ1WFT3LUnNoWIzNTha/L/EiPT6YfvMCE9h/RH9LjFrLRhcPyiuWkfvMUgdWJ2q
 YB4gib6wHMVHebyQwJSNYm+ew5uRaMOfWRPkZAP5nSW1ulEEWfhBRvufuWI66bhLGrGq
 gDt/kr8kNkg5/t2nmo24pZcfzIO+glw/nORAp3xMbkX/jCLXUdJArXAPTBkcOjXY5Tik
 lRN/jyZpsa/ZJK5YnEOM1a/LQ3Iae/UUx/dK6nZSXPLdnNIw0jE6ZhTZrgQa+v14GZ9i
 1j4w==
X-Gm-Message-State: APjAAAXmm4Rgb3YxugSYU/ar/Fn8K4Bi9Xemt5YITd3P4ih/GeW8HmDW
 i7QYfHszc6KHGYmYVTqGgUEjAf/7/mOqRUF8nfI=
X-Google-Smtp-Source: APXvYqwUYcK0/Yn0Z5c+2bMLGN2AUl5c7FkbHw2gEtNtiwmgRFTQ9ONp4xPpqu5I3e5KyyGgG9FCiyfosgRfiBcirfA=
X-Received: by 2002:a9d:5e90:: with SMTP id f16mr1989710otl.86.1556656112966; 
 Tue, 30 Apr 2019 13:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-5-glaroque@baylibre.com>
 <CAFBinCDNz1txJ7_aQU8MwjpeVFC6BgyG_gkg-jJRnnerSjbP9A@mail.gmail.com>
 <163fa4df-1017-d230-b264-51ea71236df9@baylibre.com>
In-Reply-To: <163fa4df-1017-d230-b264-51ea71236df9@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 30 Apr 2019 22:28:21 +0200
Message-ID: <CAFBinCBemJT5p7F0b3Qy+wwmaW4hTgs0jgKrLVd1ciugCGc48w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: meson: add support of drive-strength-uA
To: guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_132834_598981_656B852E 
X-CRM114-Status: GOOD (  35.66  )
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

On Tue, Apr 30, 2019 at 9:20 AM guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Hi Martin,
>
>
> thanks for your feedback.
>
>
> On 4/27/19 9:44 PM, Martin Blumenstingl wrote:
> > Hi Guillaume,
> >
> > On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
> > <glaroque@baylibre.com> wrote:
> >> drive-strength-uA is a new feature needed for G12A SoC.
> >> the default DS setting after boot is usually 500uA and it is not enough for
> >> many functions. We need to be able to set the drive strength to reliably
> >> enable things like MMC, I2C, etc ...
> >>
> >> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> > I gave this a go on Meson8m2 (meaning I applied all four patches from
> > this series and booted the result on my board):
> > [Meson8m2 doesn't support drive strength and still boots without any
> > crashes or obvious regressions]
> > Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >
> >> ---
> >>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  36 ++---
> >>  drivers/pinctrl/meson/pinctrl-meson.c      | 166 ++++++++++++++++-----
> >>  drivers/pinctrl/meson/pinctrl-meson.h      |  20 ++-
> > personally I would have split this into two separate patches:
> > - one for the generic pinctrl-meson part which adds drive-strength-uA support
> > - another patch for enabling this on G12A
> >
> > if nobody else wants you to split this then it's fine for me as well
>
>
> why not if i send new series i will do.
great, thank you

[...]
> > additionally the function arguments are not consistent with
> > meson_pinconf_get_drive_strength():
> > - here you pass the pinctrl subsystem specific parameters (enum
> > pin_config_param conf)
> > - in meson_pinconf_get_drive_strength the conversion for pinctrl
> > subsystem specific values (pinconf_to_config_argument) is part of
> > meson_pinconf_set
>
>
> for param i'm not sure i understand what you want, if you talk about difference between set_bias and set_drive arg , it's difficult to align it.
>
> if it's about diff between get_bias and get_drive i think i can return drive stength value instead of using an u16 arg input param.
let me use an example to better explain what I mean.

meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
unsigned long *configs, unsigned num_configs)
-> this uses parameters from the pinctrl subsystem only (struct
pinctrl_dev, configs/pinconf_to_config_argument)

meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
meson_pinconf_set_drive_strength(struct meson_pinctrl *pc, unsigned
int pin, u16 drive_strength_ua)
-> these use hardware-specific parameters only (struct meson_pinctrl,
[drive strength in uA])

meson_pinconf_set_bias(struct meson_pinctrl *pc, unsigned int pin,
enum pin_config_param conf)
-> this mixes hardware-specific parameters (struct meson_pinctrl) with
parameters from the pinctrl subsystem (enum pin_config_param conf)

> > I'm wondering whether two separate functions
> > (meson_pinconf_disable_bias and meson_pinconf_enable_bias) would make
> > things easier to read. I haven't tried whether this would really make
> > things better, so I'd like to hear your opinion on this Guillaume!
>
>
> no special opinion on this, if you think it's better for understanding i can separate  set_bias function.
this goes with the mixed parameters from my previous comment: if we
stick to the way these "private" functions are defined the "set bias"
function parameters should be hardware/driver specific (in other
words: don't use enum pin_config_param conf)
so my initial idea was to keep the switch/case for enum
pin_config_param in meson_pinconf_set and to have these function
declarations:
- meson_pinconf_disable_bias(struct meson_pinctrl *pc, unsigned int pin)
- meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int
pin, bool pull_up)

and to make it clear: I haven't tested whether this *really* looks
better when fully implemented.
let me know what you think - I'm happy with anything that others will
understand in the end (to make easy to catch potential breakage in a
code-review ;))

>
> >
> > [...]
> >> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
> >> +                                           unsigned int pin, u16 arg)
> >>  {
> >> -       struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
> >>         struct meson_bank *bank;
> >> -       enum pin_config_param param;
> >>         unsigned int reg, bit;
> >> -       int i, ret;
> >> +       unsigned int ds_val;
> >> +       int ret;
> >> +
> >> +       if (!pc->reg_ds) {
> >> +               dev_err(pc->dev, "drive-strength not supported\n");
> >> +               return -ENOTSUPP;
> > in meson_pinconf_set() we don't complain (with a dev_err) for this case.
> > I'm not sure what the best-practice is for the pinctrl subsystem,
> > maybe Linus can comment on this
> >
>
> this check is to be sure it's possible to set drive stength,
>
> if no register bank is setting in DT but drive-stength properties are setting on pins i need to generate an error
>
> because something is wrong.
OK, I see, there are two different use-cases:
- meson_pinconf_set returns -ENOTSUPP in the "default" case if the
pin_config_param is not supported but no error message
- we don't differentiate between SoCs PIN_CONFIG_DRIVE_STRENGTH_UA is
always delegated from meson_pinconf_set() to
meson_pinconf_set_drive_strength(). you also return -ENOTSUPP and
print an error message

what I meant with my original comment is that there are two different
"-ENOTSUPP" cases but only one prints an error.
I don't know if there are any rules in the pinctrl subsystem how these
cases should be implemented, maybe Linus W. can give his feedback on
this topic.

>
> >> +       }
> >>
> >>         ret = meson_get_bank(pc, pin, &bank);
> >>         if (ret)
> >>                 return ret;
> >>
> >> +       meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> >> +       bit = bit << 1;
> >> +
> >> +       if (arg <= 500) {
> >> +               ds_val = MESON_PINCONF_DRV_500UA;
> >> +       } else if (arg <= 2500) {
> >> +               ds_val = MESON_PINCONF_DRV_2500UA;
> >> +       } else if (arg <= 3000) {
> >> +               ds_val = MESON_PINCONF_DRV_3000UA;
> >> +       } else if (arg <= 4000) {
> >> +               ds_val = MESON_PINCONF_DRV_4000UA;
> >> +       } else {
> >> +               dev_warn_once(pc->dev,
> >> +                             "pin %u: invalid drive-strength : %d , default to 4mA\n",
> >> +                             pin, arg);
> >> +               ds_val = MESON_PINCONF_DRV_4000UA;
> > why not return -EINVAL here? (my assumption is that the pinctrl
> > subsystem would like to have -EINVAL instead of drivers doing
> > fallbacks if the values are out-of-range, but I'm not 100% sure about
> > this)
> >
> > [...]
>
>
> i choose to set a default value instead of generating an error,
>
> in this case it's only if you ask a value upper than 4000uA so it's not really a risk to set 4000uA by default.
in that case I'm fine with it if Linus W. is happy as well (I'm not
sure if there are any rules about "fallback values" in the pinctrl
subsystem)

>
> >> +static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
> >> +                                           unsigned int pin, u16 *arg)
> >> +{
> >> +       struct meson_bank *bank;
> >> +       unsigned int reg, bit;
> >> +       unsigned int val;
> >> +       int ret;
> >> +
> > do you need to return -ENOTSUPP here if pc->reg_ds is NULL, similar to
> > what you already have in meson_pinconf_set_drive_strength()?
>
> depending of linux comment on your feedback on meson_pinconf_set_drive_strength
great, thank you!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
