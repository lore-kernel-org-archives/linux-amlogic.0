Return-Path: <SRS0=6y+j=TL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C58C04AB1
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 17:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46EA12183F
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 17:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iwcupBVI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rEHaxjW1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46EA12183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3+QXbu52a6MFndJSOM4d3uejmdYUGsRw0Ds6jM5glM=; b=iwcupBVIggsZJA
	kZkDINSxN1efsp8rVIcYesSnjUpp+7Vd83RphF68Fd59jUiRVrfQn4egRm//ujv7L8fQGHoRfTa33
	zWyfvgdHPRDsoqTaDYPWVan2RGViVuKxuZmiGrzuiWBDfjLERbd6AB0R4ccEpiDxOzyjzENLmRmXD
	iaRAhgkQUDMWQ+HHc8mKih+C4a1EO2sRljN3Lo/LWjftgnogt9erXvtG1iFPyj2+2eOflAIoOObXf
	3BP6GNNcL1jNV1vtSlGr3O9DMXI/GP8VUB6/29RniXRPBxSIt89B/QbkDabaNJ7UcU4dvUEEzj7xD
	c+dAuDohMCsECw93jN2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPVSV-00056B-3f; Sat, 11 May 2019 17:06:51 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPVSS-00055P-0o
 for linux-amlogic@lists.infradead.org; Sat, 11 May 2019 17:06:49 +0000
Received: by mail-ot1-x341.google.com with SMTP id c3so8321216otr.3
 for <linux-amlogic@lists.infradead.org>; Sat, 11 May 2019 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3sN8SO1ZSQjsuFAqVVsec48xDvFtRvQ6c9q1xtJ3w4=;
 b=rEHaxjW1gsnurbIixV75NzP95YB4oTvSj6gpP1HDzvw5m9LZrZxTo1YcpCJXzcaRXl
 ePHkkMw/28s6RNqEC3Uxb42UoKpS5vySUCGOZZv69/wVjxIWOzu6e5kRx+EMs16OFK3s
 8TA7z6zHVI4fnfWGb3Y3YiAxI7wt6IToEeOXLeJWvJj6IaZuy88pBjbJbvczSm1xLQyW
 Ld8pREXzqeIGyLNQKpQHBZ+NOAyFvdEPCZrZ8lUzXVObn2HNKjCT5hu5viMk1TLrBWZR
 stZX1A+H0fr8HT3fwr0XSVFSMAc60i5/VWeb90w6M/C/1WvH88UqEkkESZKUapc1zaIh
 l4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3sN8SO1ZSQjsuFAqVVsec48xDvFtRvQ6c9q1xtJ3w4=;
 b=ABlgfbBJxq5FotAK0Ti7LGxRyaz0+CyRGMsNMOeXe/Y3zWvnhHPsbSXS90qbhKKcXh
 EERQ5d460pH9aAKF4Y95Gmrny2oKk6NEdKVGwnhyE2eb0S27lICCo+Igc/bktf0YpyyH
 Q6CNSZUIwb1DgYniObLrGfRJ3gzD3Zy0sVhJvm9dJjWpgrM/Vx4Pp3HGxO/h07NF9ui7
 rUeZZLQ2avNVxqg5n5b83eCkvRa14vimFJ4kqqoXswqHXhJGixcVWg4UdpqYtdit8Z3V
 vw2/mEaZhFxkDfkVb8USK1yHdQ5DoU39OtTiQeTnbNZ9gkhY5kIZLMi6J1fvHQHs21yt
 ma5g==
X-Gm-Message-State: APjAAAVuu/hK6zlz5Apa79babd/FfBXd3ldsedHB8Y66aY7IRpDS1m10
 We1BMUW6J0AdVMkDox9EgYaXRLfZcGDidMbsf1k=
X-Google-Smtp-Source: APXvYqy40tI6CvvJ9asRzi0J3aqGJnWcjTMCkhuG9+1jRIWgNreuoQSJwZ9k2J7IVuWIgjwmnWP5fdhI9nrccQxCYFo=
X-Received: by 2002:a9d:6759:: with SMTP id w25mr10864829otm.348.1557594403820; 
 Sat, 11 May 2019 10:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190510164940.13496-1-jbrunet@baylibre.com>
 <20190510164940.13496-3-jbrunet@baylibre.com>
In-Reply-To: <20190510164940.13496-3-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 May 2019 19:06:32 +0200
Message-ID: <CAFBinCAmGRHDU5QX2VEsV8vLBXD6fJtcRHbjdW8=p9Yti0V4qA@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: meson: g12a: add ethernet pinctrl
 definitions
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_100648_064864_355404FE 
X-CRM114-Status: GOOD (  13.14  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Fri, May 10, 2019 at 6:49 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the ethernet pinctrl settings for RMII, RGMII and internal phy leds
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index a32db09809f7..fe0f73730525 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -206,6 +206,43 @@
>                                                 };
>                                         };
>
> +                                       eth_leds_pins: eth-leds {
> +                                               mux {
> +                                                       groups = "eth_link_led",
> +                                                                "eth_act_led";
> +                                                       function = "eth";
> +                                                       bias-disable;
> +                                               };
> +                                       };
> +
> +                                       eth_rmii_pins: eth-rmii {
> +                                               mux {
> +                                                       groups = "eth_mdio",
> +                                                                "eth_mdc",
> +                                                                "eth_rgmii_rx_clk",
> +                                                                "eth_rx_dv",
> +                                                                "eth_rxd0",
> +                                                                "eth_rxd1",
> +                                                                "eth_txen",
> +                                                                "eth_txd0",
> +                                                                "eth_txd1";
> +                                                       function = "eth";
> +                                                       bias-disable;
> +                                               };
> +                                       };
> +
> +                                       eth_rgmii_pins: eth-rgmii {
> +                                               mux {
> +                                                       groups = "eth_rxd2_rgmii",
> +                                                                "eth_rxd3_rgmii",
> +                                                                "eth_rgmii_tx_clk",
> +                                                                "eth_txd2_rgmii",
> +                                                                "eth_txd3_rgmii";
> +                                                       function = "eth";
> +                                                       bias-disable;
> +                                               };
> +                                       };
it seems that the group definition is incomplete (missing things like
eth_mdc, eth_rx_dv, ...)

we could also mix the eth_rmii_pins and eth_rgmii_pins in a board.dts
(maybe that was your idea in the first place?):
  phy-mode = "rgmii";
  pinctrl-0 = <&eth_rmii_pins>, <&eth_rgmii_pins>;
  pinctrl-names = "default";
however, in this case I would prefer if "eth_rmii_pins" was named only
"eth_pins" (following mostly what Amlogic does with the pin group
naming: eth_* for pins that are valid in both, rmii and rgmii mode and
eth*rgmii* for pins that are only valid in rgmii mode)


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
