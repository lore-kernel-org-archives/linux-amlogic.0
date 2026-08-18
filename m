Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8117EC5DF85
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2026 12:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TV2DlHDtsdXXt87RX/Kz3TfqtvHE3pisf9LHFcRX7aw=; b=sSzhKFXLidnyG/
	pgywdKgnVd4q34l/kVhP2OgBIqigU69OzfZa3y7c3Ad6qAyNVyaheaxt1KgBr+BT4A89WByqCpIEo
	KYs1oD7FjH/RFpPqXGdmUq2urmymAf0cf4DKAoT/IPmKbmG6yMmQoF5V9JyNg5310aCENa1Bp3mLf
	fy3BQRo1hi8e3C6tdqcRW5MKTWUvI6mOKO7Z7gGXVH6uvH3JDT9hjMXLVy/eskmfnCYSPOUhnNBGm
	/3jCWfq1GAsh10DV3kX+CVDQ2obHYayy3I+ERaClLvScVD7uCzZzAFobC+mqp6xDqR7twb392im1G
	R2p3NclQbOHetCOOwQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJKE-00000007z0P-3Kbb;
	Tue, 18 Aug 2026 12:53:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJKB-00000007yyi-2QLz
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Aug 2026 12:53:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso36725575e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 05:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787057629; x=1787662429; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xrJlFSriS8B2b9nn703o+fJtCUBgBFvDtgFvMr5LkkY=;
        b=RMXo1s0OTQPvxus/+JFlPYeot2MGf6MJ9TE9Nc1vbhdd7+euPEqsi9zjnH2ejgFAKB
         WvGAnqmf6Hzi8iAXnwsb3Us5GpFsUztCfzB5GXmYDs04Hp5NdyFmqoWPviXgKaGDptRE
         GIAUPKTJTfwZOZwDd2X/SLKbDWVGnBpJYTB9jycRtPuTJDOpgZGw/ynty5PpWm+ngtXd
         DAJydqXo5vQ8B5V99iSAM0GhNLG56anVcYg/vI912GUqbc2UveFpEcg23cErdVbfqTBB
         DEeW5aKahfcYjUdQiuYkTjJ6/rq8AHKzfn53FzAKqEUU1y0FBn7F3lZ1zc3ZU5KVp9ac
         p1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787057629; x=1787662429;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrJlFSriS8B2b9nn703o+fJtCUBgBFvDtgFvMr5LkkY=;
        b=GlefxW0XqCh9F331fzvtye6U/hJecxFrhXvIcdLA0fE1UXrTZC0Q52q/Rp20xwHW6d
         PhxT7XAVGJoTgRPkEL1oi01Dndx2/IH4pciQC8kmoCkv0/iJ+QvXgh1wkD4mENLoZY30
         Hh82klxq0Z2Lu2nNBmy1a03qqv2nXZ9KyeJdSkysSbjzozCGGP+eMRm6/ZRR1xYWtH3g
         tXLPs9P14/CTkmpqh3lFcmYj+Vgiq4ferUjxTrYQJR4yWyr1z/j9XbrG2bRXa7qM1/g5
         PCS8nBaWkKEgFJHmgLlrYsAjLmx7yTU4UqBD0VRkdwQfpgBTES7fVTPrI5VNAGSCs7CH
         aNiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpn3GZNKXm3DaDee/CTK7M1MQuquhZbGnCTfeCsBggNmTYAISb9efA3o+o3c386reJhzIJY9wP8+v/TJ9vi@lists.infradead.org
X-Gm-Message-State: AOJu0YzLxCSX99BMbTjoR1Qz8noTlsZ2ySGQOU1kbpNa7E1pMe/givxU
	vnUpeg4MNTlyRfvDiuWkjalrFv+JMvmKstT2Ei4KVlJ3FtE/IOjXx84p+FF8g3kHj8Y=
X-Gm-Gg: AR+sD114PYL77CCaEm3riNXNSShe4PbKybE3o92l35iBb14PIVgoclyK/d1e1guAYIG
	XsY9EbeN6OwsCuJvxks4Qb9f9dSE+Uea9WMDletYrTUCr7lnSDollrnK5cxXhlmPpOk8lRV1Yqe
	5O44W1vHRtiXnaeb8+AecT16o7mJWKYjCNaFeZzWXH30v3kYjmbeKa3Su27SnKzLJbQvTZD3Y+O
	E51JMU2u7+5yodKrUaTdsh+YkbO8zVcMDKDGbdbM5h/W25u8zMqqWJiK1Z7s7kB32Z0K4Z1sd1a
	HzfnImZDQoMaMCYFGN6DFpOK/CQHTwlR+W66k6Uf7LWzYjEqrzlboK3BVk0ofGz6Rl9maRF/IFW
	vuARtD1Q+mzeAp7fbzD1TawglWpOKMN9TPFVYvId5d24jieYAwZS5PGhl9YtSJcEPUtEHAcoRdv
	myCdgH+bT31+HxOzQnV45rgSrpQdjZQfufWupnZWR4jXAjodpTSrxRZQHWvb/9gFh1Q312537vr
	DX4m/BEASZXljy4ZzDHpZE=
X-Received: by 2002:a05:600c:4fcb:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-49987928d0cmr559638885e9.3.1787057628879;
        Tue, 18 Aug 2026 05:53:48 -0700 (PDT)
Received: from [192.168.5.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49996183b89sm299651425e9.12.2026.08.18.05.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 05:53:47 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] pwm: meson: Add support for Amlogic S7
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20260521-s6-s7-pwm-v3-2-57b073fbafef@amlogic.com>
References: <20260521-s6-s7-pwm-v3-0-57b073fbafef@amlogic.com>
 <20260521-s6-s7-pwm-v3-2-57b073fbafef@amlogic.com>
Date: Tue, 18 Aug 2026 14:53:50 +0200
Message-Id: <178705763029.1733024.16040030322013834677.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5071; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=EL3KK8jlLJGv/DFviAz1KFPEh1vXG+ZrypDU0NDk9Lg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqhFXiSMDykhwqFRJyduNIxl6nWCcthhpZK54QI
 uixLX9cm7CJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaoRV4gAKCRArRkmdfjHU
 RU6KD/929yysdZ0oy7pCYZQi5pEUo3qc1BezyULQNpqFYVX3DhBL2qRZwSH0duBSBHX6wcYgycX
 l99l9rgeS4epETHlQL/RupF7OQUg4EBRSwqK9OlmGCoeH1riPQn/a26u9eM1ASZv52rXAlnwuhE
 FVkGD1WwaHId+1+m981ZQt4CW1Lhpm7cuZBWa5MFz9CyJDPPFI8enNNgXAkKLMCg/wB1G+SE8fb
 HBNtU1bgs/4eYvrWZXR582cxanrPghjFrKwwW679F7SX5RcoOMyNNH9Joud9V/CGozSYZachWqo
 z7TiauCCUl3QKSWeRifkmXWzlzOub2rG3LWpFk5RrFsPaPOjBO+xzTla0cklgz+dBKl8grJIbzV
 lGhVYlrqrxWBdP4fVlpH7/oNOraWK1gSa9ZqEa5vtaV4n/XNb9m2wHbwsRCb7JKhW3jmHlAlZZq
 c5iNwGJrhfDM9X/oFTaff3iUBGK1Qp00l0BEPF/USBmP8xjLTQWAnXYeUpmifG5ZYyWmmyHdH0G
 01ulg6mfGWildgEWaIOIZ3qpwWFoGzR03uLn467Towkf8KgcIoWSCpMBf9TN96P4imyabxrbEWl
 5DfBXWJ2vu5Z0CPr3HF26gwp2tebeItZSU/x+CONYLwB5GO58NfzvYaL3eY3ZePY7IxNBpEeitM
 4o/65qEn7zxOG9Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_055351_652112_DCE2D26A 
X-CRM114-Status: GOOD (  26.97  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 21 May 2026 08:26:59 +0000, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 8c6bf3d49753..66c41bf036de 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -503,6 +504,18 @@ static void meson_pwm_s4_put_clk(void *data)
>  	clk_put(clk);
>  }
>  
> +static int meson_pwm_init_channels_s7(struct pwm_chip *chip)
> +{
> +	struct device *dev = pwmchip_parent(chip);
> +	struct meson_pwm *meson = to_meson_pwm(chip);
> +
> +	meson->channels[0].clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(meson->channels[0].clk))
> +		return dev_err_probe(dev, PTR_ERR(meson->channels[0].clk),
> +				     "Failed to get clk\n");
> +	return 0;
> +}

This adds a fourth channels_init callback, and after the series
pwm_s7_data ends up differing from pwm_s4_data only by .npwm and by this
function. Would it make sense to share a single init between the two
instead?

What blocks reusing meson_pwm_init_channels_s4() as it stands is that it
needs an indexed clock lookup, and there is no devm variant of clk_get()
taking an index, hence the of_clk_get() + devm_add_action_or_reset()
dance. devm_clk_bulk_get_all() (include/linux/clk.h) is however both
devm-managed and index-based, and of_clk_bulk_get_all() is implemented as
clks[i].clk = of_clk_get(np, i) (drivers/clk/clk-bulk.c), so it performs
exactly the lookup the S4 path already does, only with automatic cleanup.
Something along these lines:

 static int meson_pwm_init_channels_per_channel_clk(struct pwm_chip *chip)
 {
      struct device *dev = pwmchip_parent(chip);
      struct meson_pwm *meson = to_meson_pwm(chip);
      struct clk_bulk_data *clks;
      unsigned int i;
      int num;

      num = devm_clk_bulk_get_all(dev, &clks);
      if (num < 0)
              return dev_err_probe(dev, num, "Failed to get clocks\n");

      if (num != chip->npwm)
              return dev_err_probe(dev, -EINVAL,
                                   "expected %u clocks, got %d\n",
                                   chip->npwm, num);

      for (i = 0; i < chip->npwm; i++)
              meson->channels[i].clk = clks[i].clk;

      return 0;
 }

chip->npwm is usable here because devm_pwmchip_alloc() fills it in probe
before channels_init() runs, so one function covers npwm = 2 and npwm = 1
with no variant-specific code, and meson_pwm_s4_put_clk() goes away with
it. A future variant would then only need its .npwm value.

The count check is worth keeping: of_clk_get(np, i) currently fails probe
with a clear message when the DT node has fewer clocks than expected,
while devm_clk_bulk_get_all() would simply return fewer clocks and leave
channels[i].clk NULL. As clk_prepare_enable(NULL) succeeds and
clk_round_rate(NULL, ...) returns 0, the problem would only surface later
in .apply() as a confusing "invalid source clock frequency". The check
just preserves the diagnostic you have today.

There is a similar use of this API, count check included, in
drivers/pmdomain/amlogic/meson-ee-pwrc.c, in case it is useful as a
reference.

Since this touches the existing S4 path, it would probably be easier to
review split up, roughly:

   1. dt-bindings (unchanged, keeps its Reviewed-by tags)
   2. pwm: meson: make the PWM count driver data -- add .npwm, fill the
      existing entries, use it in probe, and switch the loop in
      meson_pwm_init_clocks_meson8b() to chip->npwm. No functional change.
   3. pwm: meson: get per-channel clocks with devm_clk_bulk_get_all() --
      convert and rename meson_pwm_init_channels_s4(), drop
      meson_pwm_s4_put_clk(). No functional change.
   4. pwm: meson: Add support for Amlogic S7 -- reduced to pwm_s7_data
      with .npwm = 1 and the of_device_id entry.

That is clearly more work than what you have, so please do push back if
you think it is not worth it for this series. And if you are keeping a
separate function on purpose because devm_clk_get() is where you would
like the driver to head, that is a perfectly good answer too -- I may
well be missing context here.

> @@ -530,6 +543,7 @@ static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
>  static const struct meson_pwm_data pwm_meson8b_data = {
>  	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
>  	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> +	.npwm = MESON_NUM_PWMS,

I suggest use "2" instead of "MESON_NUM_PWMS"

> @@ -642,7 +672,11 @@ static const struct of_device_id meson_pwm_matches[] = {
>  		.compatible = "amlogic,meson-s4-pwm",
>  		.data = &pwm_s4_data
>  	},
> -	{},
> +	{
> +		.compatible = "amlogic,s7-pwm",
> +		.data = &pwm_s7_data
> +	},
> +	{ }

Small nit: changing the sentinel from "{}," to "{ }" is unrelated to
adding S7 support. Patches tend to be easier to review when they carry only
the functional change, so would you mind dropping it, or splitting it into
its own trivial cleanup?

-- 
Alexandre Mergnat <amergnat@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
