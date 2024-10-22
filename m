Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BFED1CDB8
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Oct 2024 08:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TBeaqxvLf9wRTeraa88Q6VTIiPlRCmVfAAD3Vh1Huc=; b=DJ4ktsvQphBfTI
	EZXYkWkMIEZUvg2eqGnXToysGqw58MPj/997PL3hDM9RQ5U+0udPjXlgLQbUIi1I3eo+8g4OuErdm
	7iH0thPpT9gUk+ls5xOwyjBt/qYfl7UwfDLnzrefHnJs7pzG8XhO3b+PCRdxGLndhmyQjkB9T7Ju7
	bmB0z8jE2m0rJaM4yKnsX2K4cu/gQ9furidgQ3GeeKnmi7oGDJMkvyiYXVJC52SkE+VO/8uHHF+kT
	2IRQSxPS4n1baBafbtc74EVZJWKqcSscwJmQPvhiOjKTooHZ+ugag2050x6/AkbxnV/c5GcmVG+Gd
	F1yBgvBRFP/pqTpzn46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ab8-0000000AEQv-1TZk;
	Tue, 22 Oct 2024 08:50:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ATf-0000000ACqa-1AxY
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Oct 2024 08:42:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d461162b8so3581209f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Oct 2024 01:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729586573; x=1730191373; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jpnHnQ3gPJsZV3rud6D7V0PkG3eWvAEvUguSu5qf1I=;
        b=tN3esg+pnY05s2MJ9M4S9xaCVKfIqErtWxbmxx+Hy+IOkRBqjt81EykNZxcPfH/yLk
         +2+4Ufi64GUtFpeEzavncyG1r7R4qZw0g5O6s508iHiL+qe5ViebHEp0PVGddTa6g7T/
         tazjU2PMcOB7ErSW8iEO7NZxbsE+yeBEAJJFfLtPBsU7hP6TWKAMezaqTeRcuNT6g7+s
         8FFLYUszqTLi3lX8S1njcBISB3n2NZidRWU359yvNCkmGMzQcw7VDp6hk16o9VhljJcj
         40RVCOg0q3JtiDlpPitGy4tiUNidUT8AW0jHj4g0hw53JdmGmYqbmEOhvp955efOt/lA
         okkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729586573; x=1730191373;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jpnHnQ3gPJsZV3rud6D7V0PkG3eWvAEvUguSu5qf1I=;
        b=dibAG7DNJuM9nPaJ6YIqhlrcVItmhjoCfyqlISYPQj1O52GaaAl9PODdKI3mPN5HqM
         HHutILZSNcp2nYo4kKXF9ps70Df69vL8pUbdl3KMaNw6LNJyHU3eFKyS8RwwjOxGLdeh
         Fsr6CLDKEi0X9ND1dujq3b/7QgAfMcZYwPAjVBwDnePCy6Sver6dVFD+eZysxdCJSHN6
         whPYDuYivroiQnXn5sBvWQvdvcAHAmPG/CuXpppFds+zbvh6DukC3fXFHreyjzZETo9X
         +ecLY3w5XCJyctpwIzi/BpF5ak57X0DHLais8wzkhouCmWYfC5jLOWZF5E5GmU2OZWwC
         AEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDdYaef/CaNqnnS8ZDGjngG7owc5PQIA1G++smShP9qpLtBnGuIhJBSEZL30n8m/DQnWMpZv6jbOMhBO3W@lists.infradead.org
X-Gm-Message-State: AOJu0YyPWhOkHtbJO2TDZ3qOo/1QgIrD/UXyfo9Mu1Bs907JCM88h46U
	4LZrKU9Kb+AOrISlruZtvW8HM9QAN0txUx8i2iAgQR+t5ElQAG8suXwTPdoHUWs=
X-Google-Smtp-Source: AGHT+IHRQTZKw+rsQ6rr0wLIuGP9VOmB5Go8obeenaZUn2sWIynPYNrej4PW0IGYCYtMiZC4z5Keng==
X-Received: by 2002:adf:f452:0:b0:37c:d569:97b with SMTP id ffacd0b85a97d-37ea2174eb6mr8577418f8f.19.1729586573251;
        Tue, 22 Oct 2024 01:42:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ef1c:ae40:1300:20c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bb15sm6114405f8f.99.2024.10.22.01.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 01:42:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>,
  Kevin Hilman <khilman@baylibre.com>,  "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Philipp Zabel <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>,
  Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH v4 1/5] reset: amlogic: add support for A1 SoC in
 auxiliary reset driver
In-Reply-To: <20240913121152.817575-2-jan.dakinevich@salutedevices.com> (Jan
	Dakinevich's message of "Fri, 13 Sep 2024 15:11:48 +0300")
References: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
	<20240913121152.817575-2-jan.dakinevich@salutedevices.com>
Date: Tue, 22 Oct 2024 10:42:52 +0200
Message-ID: <1jbjzcle9f.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_014255_381560_3CBC1B70 
X-CRM114-Status: GOOD (  15.19  )
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

On Fri 13 Sep 2024 at 15:11, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Add support for the reset controller present in the audio clock
> controller of A1 SoC families, using the auxiliary bus.
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

Independent of clock controller. Should be sent separately

> ---
>  drivers/reset/amlogic/reset-meson-aux.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/reset/amlogic/reset-meson-aux.c b/drivers/reset/amlogic/reset-meson-aux.c
> index dd8453001db9..a385c0125836 100644
> --- a/drivers/reset/amlogic/reset-meson-aux.c
> +++ b/drivers/reset/amlogic/reset-meson-aux.c
> @@ -26,6 +26,12 @@ struct meson_reset_adev {
>  #define to_meson_reset_adev(_adev) \
>  	container_of((_adev), struct meson_reset_adev, adev)
>  
> +static const struct meson_reset_param meson_a1_audio_param = {
> +	.reset_ops	= &meson_reset_toggle_ops,
> +	.reset_num	= 32,
> +	.level_offset	= 0x28,
> +};
> +
>  static const struct meson_reset_param meson_g12a_audio_param = {
>  	.reset_ops	= &meson_reset_toggle_ops,
>  	.reset_num	= 26,
> @@ -40,6 +46,9 @@ static const struct meson_reset_param meson_sm1_audio_param = {
>  
>  static const struct auxiliary_device_id meson_reset_aux_ids[] = {
>  	{
> +		.name = "a1-audio-clkc.rst-a1",
> +		.driver_data = (kernel_ulong_t)&meson_a1_audio_param,
> +	}, {
>  		.name = "axg-audio-clkc.rst-g12a",
>  		.driver_data = (kernel_ulong_t)&meson_g12a_audio_param,
>  	}, {

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
