Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A532E80AA7
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 07:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KByYeS7Qc52t3RPD5WTYGwUom2YYANcF/9BDQr+FMeI=; b=m/srk7TM3IDNIj
	p4joYIgl4oSVRYrYeIu9vVIIUbMa64tEimDmPcO1vQ3A1cCiGed0GRKori/LyPWYfO9R3aEQyIlCl
	peMjE42AJb5zdtpENv22q4QQ1CAwmosmLP5BkKru91A4gOgYciSQU7/jdG49lJHLNTYlhUwe23eC4
	uILYTy/WpCIaU6MWFYW5/gPp5//yulu+HBsYrFfIoEqvgt7RUt9HXv1DOPXgmhTC882lpXA+R9a1A
	dyVZynQ/5OaVB01Oc2elLzEIFnsxqHRSfXWscmlH5xAUgjSBdOMXAbSki5kaIYRlGnvD5+xt1kaBV
	0LqK+O++ogzFuJ7qKeBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPGF-000DUx-1W;
	Wed, 27 Sep 2023 07:47:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPGB-000DU7-2K
	for linux-amlogic@lists.infradead.org;
	Wed, 27 Sep 2023 07:47:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so1184743f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Sep 2023 00:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695800821; x=1696405621; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=aKQmixWBkQbfwrPWW4Kcl6BhuNloeHKy7RaNCIpQr2w=;
        b=quQbpl4acBsgtESdzPxFJOdbbMB3T6MmIE0VTX3VGHEZ0QYS/GotO2/WtjtBLZxPvn
         4DG27Z47fLQiXvmDCxdzBier42UT4yBEcsKlhFFLyDFvUKLIW/n6BveG/TNYB89dkURc
         aw2GNcjLuM0HYQH6NCZQuXsXBocdFmOom3FO0A49+cjuC2xZZLukzJFjOZd5tleuy85b
         objjgrZGuKQnWSH+M1eYQI4iMYuH4gijrc8VMY56K3GTm7sbtZGaWWCQumckNJq95mP9
         VIBrP7ikOvRONTe/gaYORKB5i1qouqplZxR2lnwOqotc6CHrwZdXzFGQfCWh9n+44n2E
         y3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695800821; x=1696405621;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKQmixWBkQbfwrPWW4Kcl6BhuNloeHKy7RaNCIpQr2w=;
        b=kZwJHm0GGqcXHxNmEsoM3t+cJ4zdFUOhjCLnquap8l9T6dFrUl83HREHL3XT61dbQk
         JRThn3G/R43kXZNkz37oqUnq0bK9v1kZG/DKFNQfJWRt9h3zZo5Nq/itA4feRpHpkdF3
         2ZyFcwh3QhOrdsng8nKqQioBRhLSyaSY0HFC24huiCd2X3/+uuy6gJa3ao7sUk/sLjZd
         AFeeEyDfDwtYObcIbl1AXkTrq9ZvTjregEnBBZCu8i+V2pKwphuijxhAF68JgsfgWxfQ
         sp2sd0A8iOBkHg8CtKWV5/xyUxV06CIy0Fh5oSFCPkEwDLRxI0w4su/w+IdT6QBcsCn+
         VuqQ==
X-Gm-Message-State: AOJu0YyOBMOnWwTxm32mxkIdYQwkO5MGi0TCk9B5/hUolstdO/H3Qv6K
	Yhnmlro//3vjaihgHU2ohe3MYQ==
X-Google-Smtp-Source: AGHT+IGGmLNmRtPyNVhH3suncTUw2D0Z9IxkXxlJ+RvD02DQWvi3FRSkVOacLNW/OVVCbN0M32WHeA==
X-Received: by 2002:adf:f285:0:b0:323:1d06:38e5 with SMTP id k5-20020adff285000000b003231d0638e5mr936747wro.55.1695800820675;
        Wed, 27 Sep 2023 00:47:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:99be:56aa:a730:ad2d])
        by smtp.gmail.com with ESMTPSA id f4-20020a5d50c4000000b0031fa870d4b3sm16429083wrt.60.2023.09.27.00.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 00:47:00 -0700 (PDT)
References: <20230927072544.764285-1-Rong.Chen@amlogic.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Rong.Chen" <Rong.Chen@amlogic.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: meson-gx: Remove setting of CMD_CFG_ERROR
Date: Wed, 27 Sep 2023 09:43:57 +0200
In-reply-to: <20230927072544.764285-1-Rong.Chen@amlogic.com>
Message-ID: <1jr0mkkqh8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_004703_757728_C1C4F467 
X-CRM114-Status: GOOD (  18.49  )
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

s
On Wed 27 Sep 2023 at 15:25, "Rong.Chen" <Rong.Chen@amlogic.com> wrote:

> From: Rong Chen <rong.chen@amlogic.com>
>
> Setting bit CMD_CFG_ERROR has non effects on previous controllers.

Which previous controllers ? v2, v3 ? Can you list the SoCs please ?

> However, it will cause an IRQ and stop working on latest controllers,

Isn't it desirable to stop on error ? seems like a sane thing to do.

> This bit is used for selecting SG LINK of data address.
> Don't set the bit CMD_CFG_ERROR anymore to resolve this issuse.

I'm not sure I understand the actual issue being resolved.
Could you provide more details please ?

>
> Therefore, remove this setting.
>
> Signed-off-by: Rong Chen <rong.chen@amlogic.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 9837dab096e6..c7c067b9415a 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -801,7 +801,6 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  
>  	cmd_cfg |= FIELD_PREP(CMD_CFG_CMD_INDEX_MASK, cmd->opcode);
>  	cmd_cfg |= CMD_CFG_OWNER;  /* owned by CPU */
> -	cmd_cfg |= CMD_CFG_ERROR; /* stop in case of error */
>  
>  	meson_mmc_set_response_bits(cmd, &cmd_cfg);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
