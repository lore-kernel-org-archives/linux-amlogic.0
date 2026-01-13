Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF975D29DF0
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 08:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFSE+GFhm4RgQ/k/1N8a+p0Ej9MjsuZiw8ZG2GuRIxM=; b=BaQCnIAZ1GKSUz
	NN79oxYOdAuIFdwvLwRECtnHYtU3m8FUzkIuIhgjm7zIbBKFmRURCm9CIkPkku6ntyoehj6UA+DsY
	tztqWwWG40l0hIqgOHRzMX3+W6d+m2/xWB2ESoCAKVHZubDl8rvTnHYbFm3dzFTbQ+4QtFRl0ZN6G
	P3cEmPzDTzyrXyp13D4FtKeXATo6ZnyW05bVrKgY4GImhQFAbhhOGF8bcA40nej3p4cYyp0nCzggU
	7EUmCSLSyS9TLdjhvAQb3Jtq9767zuJ/a2RsSB0JbLfgNiKB56wWaSozQj1NOKxBArNx2SBRuKyGe
	qyUx1xQAr9G2nsagEBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaDe-00000006mmo-0x3P;
	Tue, 13 Jan 2026 08:57:44 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaDa-00000006ml8-1s0V
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 08:57:41 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-432d256c2a9so3681706f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 00:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768294656; x=1768899456; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMKyGWxNAwt+GdnajQbomOj6BjeEvvPWy5yBEpV57ns=;
        b=DdN2vAMn8WMGY39mo7LTSNAbrb5bdZ3UsAtRKvdzHD5AekVdtjQkIQMvQupTxUoJsR
         9Siw15jSI++31LDUcq5cOqQwsHeqXG7ceJvd80/1fopk8q27riLeU7/qSUBeSs/TSDZb
         TKFJJkZIiBOa8WHx9tG+5RmB45ocdlbmg/QlMMaWXYz3fBANbo5nsprGX+0aDpHlSu+n
         b+8FJh5TWVX38snjeBy0+Xbm7A+VsAKg7na54ZZhU6qeMOBDL2HhLeAn08iW+9PPO86X
         +1G0nwE5X2fg+CeKK+zsfhfyRThKZth9q0yiGjoF0heYtdzkG7fO+L+PigqFFXRmHmLn
         ud7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768294656; x=1768899456;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZMKyGWxNAwt+GdnajQbomOj6BjeEvvPWy5yBEpV57ns=;
        b=Cf+yWZiOowqevhPbN6u6sOLzqlI6Nl3cgCoeg7r/DlHdByWq8wi15vVBNaPQtDCOpo
         9GokoGah0DLanoRRFC4ujtSZlBOqSeq8WBwQ68Q/BACEdIcTYl6ye7Xncc5MKIcqsHub
         H/PfRIO/GSdIbV7LIHZT6+JSMIyBUSne+q42z0+wbcMaZNtu0IMnRLYODd0+73foPM4d
         eqcLb679Tft3GrvtG3WcYaO9OdPnoC1IJqFHIGNck5hnPSMlxlAyJ90TqSukrliqcUmM
         rLY52IN/BRdtPJRG/fjtDuTzwQurJXXH/VMkTT0TyefN8BegYL3kIsOZBofRLz6CII3U
         rlwA==
X-Forwarded-Encrypted: i=1; AJvYcCXi0k+sHObfbTetNVPpDs5CWtu4d8hLOpPAt8sN2SzGyNBGcQuOLxvfSKgxK0jvg3G24JHYKaxuAa8dzvGY@lists.infradead.org
X-Gm-Message-State: AOJu0YyL1AZ0lf2NTVZt+Ae6UW+BectnhbHrRIc27j3Nu6mfrE6k4TD5
	0hiufPcCZqTzJPmkMiurcLfKF0ni3HCFHVmDHRxzpyZYHxi6Xjf6wwL2NyqeT3VzBfw=
X-Gm-Gg: AY/fxX6U7hcaZJwJG0eKS/rxen8rCvQJwQI3Zc8v9a5yxF5doR03aHNLhKZ92ZoPY8f
	LK7cTBUMkc4lUpXmt58vg0z3La1uZPqL5kVzVmpy4GHjUmC5my38ETIyP8ceTW4bQ1I6jB2dwo6
	sI5s6/wYzuTzDiA6IXVGRmJQ9P14nZjr/YBwQqRpdGk2U7wYa03Qty+krrYxhItb89URgc7n+eY
	kwNwwIa39F+7uImMH1NmEuZElAHDP3dAIPefElRfesGf9aeTQOcxlgNUOjVoZp5Dzki9ngA/vLt
	HVtcnNegdgct5IY9GhzWpId+2ZUQgloGCfynzCLflbEebbxGfHhBSHK9vmHThFCQWj2+9UuCtrH
	RLNy0JB0i9a33BhwCQcyZ4OxcIwS/tHrMO4NKSlbrMzgwMpp+jzZLpKnnr9DP/iui85Rr7yORX1
	VhSRowVW+PA+yHeWm7o/U=
X-Google-Smtp-Source: AGHT+IGwcIbZu7Reu6gEUybQVWJyifVkO6dMnAxR2TOj6PLpVKDznQPy9IHHIvvCvTuBaNu+Iuy9RA==
X-Received: by 2002:a05:6000:2f82:b0:431:8f8:7f2f with SMTP id ffacd0b85a97d-432c3795323mr23143317f8f.34.1768294656128;
        Tue, 13 Jan 2026 00:57:36 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:982f:38af:1a7a:b10])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd5fe67csm42950056f8f.40.2026.01.13.00.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:57:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Nick Xie <xieqinick@gmail.com>
Cc: neil.armstrong@linaro.org,  khilman@baylibre.com,
  martin.blumenstingl@googlemail.com,  xianwei.zhao@amlogic.com,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  robh@kernel.org,
  nick@khadas.com
Subject: Re: [PATCH] arm64: dts: amlogic: S4: fix SD card initialization
 failure
In-Reply-To: <20260113011931.40424-1-nick@khadas.com> (Nick Xie's message of
	"Tue, 13 Jan 2026 09:19:31 +0800")
References: <20260113011931.40424-1-nick@khadas.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 13 Jan 2026 09:57:34 +0100
Message-ID: <1jsec9ritd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_005738_747381_54136A6B 
X-CRM114-Status: GOOD (  21.15  )
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

On mar. 13 janv. 2026 at 09:19, Nick Xie <xieqinick@gmail.com> wrote:

> The SD controller (sd@fe08a000) requires a clock source capable of
> generating a 400kHz frequency for the identification phase.
>
> Currently, the sd node uses CLKID_SD_EMMC_B as clkin0 and CLKID_FCLK_DIV2
> as clkin1. Both of these are high-frequency clocks (e.g., ~1GHz).

The reason you are having this problem is because CLKID_SD_EMMC_B does
not provide 400kHz by default on this platform. We have been operating
with this (weak) assumption so far ... and it was OK until now.

> The internal divider of the SD controller is limited to a maximum value
> of 64 (2^6). With input frequencies significantly higher than 25.6MHz
> (400kHz * 64), the driver is unable to generate the required 400kHz
> clock, causing the probe to fail with -EINVAL.
>
> Fix this by reparenting clkin0 to the 24MHz XTAL clock, consistent with
> the configuration of the sdio and emmc nodes. This allows the divider
> to successfully generate 400kHz (24MHz / 60).
>

DT generally describe what the HW is, not how you wish to configure it.

What you are doing here does not reparent anything. You are actually
mis-representing the clock tree, making the MMC device believe it has
24MHz on its clkin0, even-though what it is really has still is
CLKID_SD_EMMC_B (presumably running a 1GHz)

So if my understanding is correct, you are indeed setting the divider to
60 instead of 64, but you are still dividing 1GHz so what you actually
get it 16,6MHz

If you want to get 24MHz the clkin0, we need to assign the rate,
something we probably should have done before.

I'll send something for this

> Verified on Khadas VIM1S with SoC S4 S905Y4.
>
> Fixes: 3ab9d54b5d847 ("arm64: dts: amlogic: enable some device nodes for S4")
>
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 9d99ed2994dfa..b87bc83b5a9bb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -833,7 +833,7 @@ sd: mmc@fe08a000 {
>  			reg = <0x0 0xfe08a000 0x0 0x800>;
>  			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
>  			clocks = <&clkc_periphs CLKID_SDEMMC_B>,
> -				 <&clkc_periphs CLKID_SD_EMMC_B>,
> +				 <&xtal>,
>  				 <&clkc_pll CLKID_FCLK_DIV2>;
>  			clock-names = "core", "clkin0", "clkin1";
>  			resets = <&reset RESET_SD_EMMC_B>;

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
