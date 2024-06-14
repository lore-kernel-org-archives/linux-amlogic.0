Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AAFC27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/s4ciwJ0eqfTD99GJU/Iuw+PEQ51N5zWsiPWP3xJao=; b=JlVN2S92CBVKwg
	pDvBlR1CdeXg7EQ/tg/ZZHdawxPwhc/b47vRWi5Rbh7VHmzia4qAuyYtex6c3Bv8k5O5eVnQ1g8ok
	HHhLf0TMByXEoV6sfJ5cdEPrwTlDycL+QHHERJvkH57Wy4FnoFaxe1Dtqz1ZhOhVVDTAVwtj7FkE2
	rKhvRMkwWOL029f+WjIeIUkdU16vzeN7K8+idLVk6zz28Q9EN4sZ5nkWqX+yeTmnjts+Q44+sZ8Ua
	Fsbf1CtZ3/nKFVXNeF66v0BI8IDURpYIp0Y3szMxjwEl8qMEQ+pvO72GYGYDqi4c0/cR9aXMtgDzN
	KujRGG/xibHL9vgqBwow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIAN7-00000003ZXz-0HGY;
	Fri, 14 Jun 2024 17:05:53 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIAN3-00000003ZWp-30kN
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 17:05:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-35f1c490c13so2678558f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 10:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718384746; x=1718989546; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU9Tq2gv3Xr+OOG2Lgc2duprsrRaO/sCpRyvLtLfjWU=;
        b=NLMTG8DLRmR28Qxnr4x9BvoP2qhyjFapovDibM11i8lmRi1+Oln9L/cP3HlMHQXkHN
         rmji7VzDuEGsZvbxRpTHbT1wu4pY/byjbae0kjbFivIi0OdOG49so5FiKlPWfR+ofM/p
         vgDVt5uvClqYiRPGPrsQHFhcxWe6knPs2/fjIKL1ARWbdq6qFzGf5DB5OsG7RGtbOgjt
         Vb2L+s6V536UyW1JJJRcGxh30Ye6i2lS8eMKWqUqsSmnc8A58UZG8vwTDV+HFMm5DWfW
         hdPEaYiNgqS/ZUHrtg9mOg2VbsjGRP6osHGwyzDahfO/uaF2Qv3au+qiajCK9T2wC+It
         m1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718384746; x=1718989546;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU9Tq2gv3Xr+OOG2Lgc2duprsrRaO/sCpRyvLtLfjWU=;
        b=FbwnlFNnOeWGerg923shLT+goJXRKflbI/uAOjBasuln9wO5BtHDagpxjU62/WbyS1
         cwr1HLLyFz2zo0wrRiNPKqQvJoiQ6W2xkuf5XkxejFk6e2vXXXE39I35PR8snFt0lPhc
         yWXS3HikYUJlUP2mc5HncTlFcqnuOdwLQcfaigctyWtuyjIg8hv8INNSDNEWlWwQd5k8
         p7K4vIKk5qsmRgvjUykGPHHdU4UnOnQF1vCwWcZEihGn4PrGtwYkf1eOeuA01Ey2JBTN
         Hy9fHCNBa//RxZsycEemO7xCw57QcUeNcMiv1lfV8gzwfgtvIvbTcVNi09XGE/Mw6I/r
         tbGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9Z4t+p4aTXrdrZMLgPQKLX6mHMoVnfKC9RkDVNnbrhIkioUjDWociPG7uSU22g7krPu58W0iT/RT6g+TydLqnnvXPIasNOe/Vx9v2Badpsw=
X-Gm-Message-State: AOJu0Yxm1R+IvU6+ZPQyPpf2YcuPr7bvs1AAwSOMjo+ZSMMegqm7Nc8l
	jkUwI6NWKvAzIHZiMFeja87SjqboomUkH3QCdoK+2HHscaPU49g6L6K/JJe4ue8=
X-Google-Smtp-Source: AGHT+IEiODVYEmrk+Rx+CKhFGkqkyheheemcrZvIKgkrbQLv/Jnn/OxMF175J3qFIGVvLOazoNSL1w==
X-Received: by 2002:adf:e2d1:0:b0:360:7c17:5936 with SMTP id ffacd0b85a97d-3607c175a00mr2323310f8f.58.1718384745808;
        Fri, 14 Jun 2024 10:05:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5374:7bd2:13de:845])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f0d71sm4896045f8f.86.2024.06.14.10.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 10:05:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RFC 1/3] ASoC: dt-bindings: amlogic,axg-sound-card:
 document clocks and clock-names
In-Reply-To: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-1-9f57d9e01834@linaro.org>
	(Neil Armstrong's message of "Fri, 14 Jun 2024 18:24:01 +0200")
References: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
	<20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-1-9f57d9e01834@linaro.org>
Date: Fri, 14 Jun 2024 19:05:44 +0200
Message-ID: <1j7cerihef.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_100549_804041_AC4AE2D7 
X-CRM114-Status: GOOD (  26.53  )
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

On Fri 14 Jun 2024 at 18:24, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> The sound card design is based on 3 reference PLL frequencies that
> are the root of all clock rates calculations.
>
> Today, those 3 frequencies are specified in DT via assigned-clocks,
> because they correspond to the basic audio use-case.
>
> It makes no sense to setup clock rates for a sound card without
> referencing the clocks for the sound card, mainly because at
> some point more complex audio use cases will be supported
> and those root rates would need to change.
>
> To solve this situation, let's legitimize the presence of assigned-clocks
> in the sound card by documenting those clocks, as it describes a true
> dependency of the sound card and paths the way of more complex
> audio uses-cases involving those root frequencies.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> index 5db718e4d0e7..676ff2731b86 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -26,6 +26,18 @@ properties:
>        A list off component DAPM widget. Each entry is a pair of strings,
>        the first being the widget type, the second being the widget name
>  
> +  clocks:
> +    maxItems: 3
> +    description:
> +      Base PLL clocks of audio susbsytem, used to configure base clock
> +      frequencies for different audio use-cases.
> +
> +  clock-names:
> +    items:
> +      - const: mpll0
> +      - const: mpll1
> +      - const: mpll2
> +

Thanks a lot for this series. This is going in the right direction
but requiring 3 clocks or naming them (whatever the name) is not
appropriate.

The purpose is for the sound card to get the necessary base rates it
needs for its operation.

So far it has always been 3 clocks because of the 3 usual family rates
and enough PLLs are available. But this is not required. There could be
none (very unlikely but possible if fixed clocks are or with slave setups),
one (probable on a1 from what I can tell), or even more than 3, if one
needs supports for unusual rates.

Also the PLLs are not necessarily the mplls, HiFi PLL is used on some
device. It could even be the GP0 or external slave clocks which is why
putting a limit the number of clocks would be arbitrary.

I think the following would better describe the HW:

clocks: true
assigned-clocks: true
assigned-clock-parents: true
assigned-clock-rates: true

Maybe just 'clocks: true' is enough since the presence of would allow
'assigned-clocks'

For sure, clock-names is not useful, for axg of gx compatible card at least.
All inputs are equal to the card, so index are enough if the card needed
to change rates are runtime (but it is very unlikely to happen, the
whole axg or gx system are meant to operate with fixed PLLs so it would
not be compatible)

>  patternProperties:
>    "^dai-link-[0-9]+$":
>      type: object

PS: I just noticed that my reply to your previous series was private.
    It was not meant to be. Sorry about that.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
